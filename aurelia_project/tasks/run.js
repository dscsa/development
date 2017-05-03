import gulp from 'gulp';
import browserSync from 'browser-sync'
import historyApiFallback from 'connect-history-api-fallback/lib';;
import project from '../aurelia.json';
import build from './build';
import {CLIOptions} from 'aurelia-cli';

let node
let spawn = require('child_process').spawn //adam: https://gist.github.com/webdesserts/5632955
let keys  = require('../../../server/keys')

function server(done) {
  if (node) node.kill()
  node = spawn('node', ['../server'], {stdio: 'inherit'})
  done()
}

function onChange(path) {
  console.log(`File Changed: ${path}`);
}

function reload(done) {
  browserSync.reload();
  done();
}

let routes = {}

for (let i in project.paths)
  if (i != 'root')
    routes[i] = project.paths.root+project.paths[i]

let serve = gulp.series(
  keys,
  server,
  build,
  done => {
    browserSync({
      online: false,
      open: false,
      port: 9000,
      logLevel: 'silent',
      server: {
        routes,
        baseDir:project.paths.src,
        middleware: [historyApiFallback(), function(req, res, next) {
          res.setHeader('Access-Control-Allow-Origin', '*');
          next();
        }]
      }
    }, function (err, bs) {
      let urls = bs.options.get('urls').toJS();
      console.log(`Application Available At: ${urls.local}`);
      console.log(`BrowserSync Available At: ${urls.ui}`);
      done();
    });
  }
);

let refresh = gulp.series(
  build,
  reload
);

let watch = function() {
  gulp.watch(project.server.source, server).on('change', onChange);
  gulp.watch(project.transpiler.source, refresh).on('change', onChange);
  gulp.watch(project.markupProcessor.source, refresh).on('change', onChange);
  gulp.watch(project.cssProcessor.source, refresh).on('change', onChange)
}

let run;

if (CLIOptions.hasFlag('watch')) {
  run = gulp.series(
    serve,
    watch
  );
} else {
  run = serve;
}

export default run;
