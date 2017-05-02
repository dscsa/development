AS OF 4/26/17 this program is most up to date in dscsa/development


File: E2E Tests of Our Aurelia Framework

To run, from within the Development directory run the following commands

npm install protractor
npm install selenium
npm install aurelia/protractor-plugin   //this repo sometimes changes location, and can be edited in 											conf.js so you access index.js, or whichever file has all 											the helpers, likeloadAndWaitForAureliaPage
npm install protractor-hotkeys
npm install protractor-numerator
//npm install robot-js IGNORE THIS FOR NOW, OUT OF SYNC WITH NODE



Make sure all the databases are empty, then restart the server and then run the client.

To run the testing, issue the following command after you've got the server up and running:

protractor conf.js

Currently set to visit http://localhost:9000. If that's not right, need to update it in the spec

TO KNOW:
Does not run nicely if you start it and then go to another window of a browser. Creates generally unpredictable behavior. 
When the tests get to the Inventory part, there is no clean way to close the print dialogue with this framework, so when it gets there if you're watching, then close the tab. Otherwise I recommend letting the test run with your mous somewhere in the screen. There's a rudimentary plug in to mimic pressing the Escape button, but it's not the most accurate way of focusing on the window.


Components:
	Join Page
		Ensure all required fields   ✔
		Create Accounts ✔
		Logout ✔
 	
 	Login Page ✔
		Login  ✔

	Account Page
		Ensure User Validation 
		Add Additional User   ✔
		Delete Additional User  ✔
		Login with other user credentials  ✔
		All Accounts Listed ✔
		Unauthorize all Accounts ✔
		Authorize Several Accounts  ✔
	
	Drugs Page
		Add a Drug  ✔
		Ensure Drug Validation / Snackbar works
			Import/Export CSV (delay)
		Search Drug by Name and NDC ✔
		Order Drug, Modify Order

	Shipment Page
		Test that From Account field has only authorized accounts ✔
		Create New Shipment ✔
		Filter Shipments by Donor Name and Tracking Number ✔
		Add Various Drugs to Shipment by NDC and Generic ✔
		Ensure you can delete a drug with qty 0 ✔
		Make sure Ordered Drugs are autochecked if meet criteria and not checked if don't ✔
		Make Sure you can manually accept (check) a drug ✔
			Make sure that inputs are marked as valid / invalid depending on input entered
		Test Keyboard Shortcuts (+/-, Enter) ✔
		Refresh Page and Make Sure Everything Saved to DB ✔
		Make sure snackbar messages are correct 

	Inventory Page
		Search by Location/Bin, Generic Name, NDC, Expiration ✔
		Ensure CheckAll Box works   ✔
		Ensure that accepted drugs appear  ✔
		Filter drugs by each filter  ✔
		Dispense drugs disappear (including refresh) ✔
		Dispensed drugs cannot be deleted from shipment page 
		Pend / Unpend drugs   ✔
		Repack Drugs:       - Added validation to prevent you from repacking more than the quantity 						of transactions you've selected, and from repacking zero vials
		Original disappear ✔
		     print label   ✔ - Has a solution, but requires that you be in the window for it to 						properly execute
		Doesn't allow you to repack more qty than the transactions you've selected
		new drugs appear with icon ✔
		Original repacked drugs cannot be deleted from shipment page ✔
		       Eventually figure out what to do to test database “next” property set, records complete
		Ensure you can delete inventory with 0 qty   - BUGGY prints: "Verified At "2017-														04-14T23:02:32.515Z" cannot be set unless qty.												from or qty.to is set; Qty To null must be 1 or 											more"


Current Situation:
4/24/17
Working on getting the code to run as one encapsulated chunk without me having to write anything in. Can basically do that with shipments and inventory right now. Will need expand this to include the users/accounts/drugs testing. Once it can run through like this and all the expectations are lined up and it doesn't fail on timing anywhere, then I want to expand robustness of certain transaction related tasks. Then can begin integrating into the development repo and considering chunking of any sort.

4/26/17
Ironing out the kinks in running the whole suite of tests. It's all incorporated in the development repo in my fork, and my fork of client has all the markups. At this point I need to get it to be able to run start-finish and then I can submit pull requests for all this. Then it will be a question of expanding this testing to the point that I feel comfortable calling the site tested based SOLELY on these suites.
Runtime: 15 minutes

Step Log:
- Keep the Drugs page commented out - CANT
- Delete all the other databases and try running all the other tests together 
- NEED to delete all the databases on a fresh run, can't keep the drugs in there.
- NEED to fix the drug code to at least be able to just add drugs so we can test everything else in a god
- Get it all running in one clean go
- Not quite there on all running together easily, but is up to date with the client repo and can be submitted as a pull request with markups
- CHANGE ALL THE ATTEMPTS to click new shipment just to get rid of drawer to tell the browser to just click on the different page buttons
- May be a new bug added to the checkbox functionality at this point, need to investigate further, otherwise the code should work for login/join except for last test of it all
- Should have all the essential markups in Drugs done, so can comit to Adam
- Sometimes login button is funky? --> Added lag between entering values and seeing results
- Before moving over to the dscsa/development repo, add commented out lines to each segment, with the necessary code to start from that bit alone, so we can easily in-code decide which chunks of code to run. Can be cleaner in the future
- Incorporated into the development repo, and all the changes to client are pushed. Once the test is all ironed out, I will submit pull requests

TODO for V2 Of E2E:
- Build in a way for each chunk testing (login/join/shipments/inventory) to start from scratch by closing the window and reopening one, that way if one hits a terminal failure it doesn't kill the entire thing. 
- Fine tune the timing and see where sleep is necessary, where it's not, and if there's less fragile ways to build this out.
     - Make it faster overall
- Edit the Join function to be more efficient
- Expand the amount and use of helper functions to simplify the code
- Clean up comments and code quality