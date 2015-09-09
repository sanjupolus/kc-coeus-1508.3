

##CURRENT
* No Changes


##coeus-1508.2
* No Changes


##coeus-1508.1
* Fix to resolving repackaging scripts.
  * blackcathacker on Fri, 31 Jul 2015 15:53:15 -0700 [View Commit](../../commit/5ebb5aca6fde30fe05092dd1e2c0e9abcad5a923)
* Update V1507_021__Resolve_repackaging.sql  * Douglas Pace on Fri, 31 Jul 2015 16:01:04 -0700 [View Commit](../../commit/5be60706d38f70c6cf3f2f96d41101d6fd377d35)
* Update V1507_021__Resolve_repackaging.sql  * Douglas Pace on Fri, 31 Jul 2015 16:01:21 -0700 [View Commit](../../commit/afcc8e9b2df0822a352c4052b1e96fbd3f53b4a2)

##coeus-1507.77
* Fix minor oracle issues

  * Including a problem with KcPerson lookup related to repackaging causing an error in demo data when navigating to custom attributes
  * blackcathacker on Fri, 31 Jul 2015 12:40:35 -0700 [View Commit](../../commit/3cfe96a38c15a98ed8bbc102830ab3a08ee79664)

##coeus-1507.76
* No Changes


##coeus-1507.75
* make the award sequence number values finder more efficient to make the print section load faster
  * Travis Schneeberger on Thu, 25 Jun 2015 14:34:30 -0400 [View Commit](../../commit/2f6b1b4bc8ba46ccf84bd9026b4bb87e0c9d601c)
* Fix award hierarchy/award actions for very large hierarchies
  * blackcathacker on Fri, 26 Jun 2015 23:23:40 -0400 [View Commit](../../commit/13fbdc2018597ffcaa2e8b8d0b5b953db64c9cb0)
* prevent error when optional parameter doesn't exist

  * When this optional parameter hasn't been added the following error occurs
  * ```
  * when-present<#else>when-missing. (These only cover the last step of the expression; to cover the whole expression, use parenthessis: (myOptionVar.foo)!myDefault, (myOptionVar.foo)?? The failing instruction (FTL stack trace): ---------- ==> ${request.contextPath} [in template "krad/WEB-INF/ftl/lib/html.ftl" in macro "html" at line 51, column 25] #else [in template "krad/WEB-INF/ftl/lib/html.ftl" in macro "html" at line 50, column 9] @krad.html view=view [in template "krad/WEB-INF/ftl/fullView.ftl" at line 18, column 1] #include "fullView.ftl" [in template "krad/WEB-INF/ftl/uifRender.ftl" at line 69, column 9] #else [in template "krad/WEB-INF/ftl/uifRender.ftl" at line 68, column 5] ---------- Java stack trace (for programmers): ---------- freemarker.core.InvalidReferenceException: [... Exception message was already printed; see it above ...] at freemarker.core.InvalidReferenceException.getInstance(InvalidReferenceExcept
  * ```
  * blackcathacker on Fri, 31 Jul 2015 10:40:53 -0700 [View Commit](../../commit/750e2766552f759917b67af13da9a4b62184fc75)

##coeus-1507.74
* fix calculated fringe and calculated direct cost display on proposal budget

  * As a proposal user, I am trying to verify that salaries and  employee benefits are being calculated correctly.
  * When I add a person to a proposal in a unit with Lab Allocation rates, the value displayed in the "Calculated Fringe" field is not correct.
  * The field should only contain any calculated employee benefit rates for the identified person (which may include EB, Vacation, or any other defined personnel EB type rate).

  * Currently, the Calculated Fringe includes field is displaying
  * EB + EB ON LA (Incorrect)
  * (missing vacation)

  * Additionally:
  * Calculated direct costs includes:
  * Vacation (Incorrect)
  * Vacation on LA
  * (Missing EB on LA)

  * The correct display should include/display the following:

  * Calculated Fringe for a personnel entry SHOULD include individuals';
  * EB
  * Vacation

  * Calculated direct costs SHOULD include:
  * EB ON LA
  * Vacation on LA
  * Joe Williams on Wed, 29 Jul 2015 15:34:31 -0500 [View Commit](../../commit/caeb8c6c307a6a6cf22a89ec8e71d5224daa85c5)

##coeus-1507.73
* apply inflation rates from child budget when calculating line items on parent budget

  * In a Proposal Hierarchy, when you have one child proposal budget that applies inflation to a particular Cost Category and then in another Child Proposal, you set the Inflation Rate for that Cost Category to '0'. When synced to the Parent Proposal, the Parent budget will apply inflation to the Cost, even if the Cost in the child proposal did not have inflation applied. This is causing the Parent budget numbers to be different from the child budget numbers.
  * Desired Behavior: The Parent Budget should not make any changes/recalculations to the numbers that are brought from the Child Proposal Budgets.
  * Steps to Reproduce:
  * 1. Create a Proposal (with minimum info to save) - one year project period is enough. Also, add a PI
  * 2. Create a Detailed Budget
  * a) In the Project Personnel, add any person, for example TBA-PostDoc and update the Details with the Base Salary (e.g. 12,000)
  * b) Go to Assign Personnel To Periods, and click the Assign Personnel Button.
  * c) In the Add Personnel to Period window, select:
  * TBA-Post-Doc from the Person drop-down
  * Form Object Code, select Post-Doctoral Staff-On
  * Enter 100 in Effort % and Charged %
  * Click the Assign to Period 1 button
  * d) Save your budget and click the Return to proposal button
  * 3. In the Proposal, click the Hierarchy link in the toolbar. In the Hierarchy window select:
  * a) Hierarchy Budget Type: Sub Budget
  * b) Click the Create Hierarchy button
  * c) Note the Parent Proposal number generated
  * 4. Close out of your proposal
  * 5. Create another proposal (make sure it has the same project period as the first proposal you created). Also add a PI
  * 6. Create a Detailed Budget in the second proposal
  * a) In the Project Personnel, add any person, for example TBA-PostDoc and update the Details with the Base Salary (e.g. 12,000) and also change the Job Code (e.g. enter 1 in the Job Code field just so this TBA has a different Job Code then the TBA we have in the first budget we created)
  * b) Go to the Rates --> Inflation, and change the Inflation Rate for Post-Doctoral Staff to '0'
  * c) Go to Assign Personnel To Periods, and click the Assign Personnel Button.
  * d) In the Add Personnel to Period window, select:
  * TBA-Post-Doc from the Person drop-down
  * Form Object Code, select Post-Doctoral Staff-On
  * Enter 100 in Effort % and Charged %
  * Click the Assign to Period 1 button (you should notice that the salary requested is not inflated)
  * e) Save your budget and click the Return to proposal button
  * 7. In the Proposal, click the Hierarchy link in the toolbar. In the Hierarchy window:
  * a) Enter your Parent Proposal Number in the Link Proposal field
  * b) Form the Hierarchy Budget Type select Sub Budget
  * c) Click the Link this Child to a Parent button
  * 8. Close out of your proposal
  * 9. Go to the Parent Proposal and navigate to the Budget
  * 10. In the Budget go to Project Personnel - Assign Personnel to Periods section
  * 11. You will see that the Requested Salary for the Post Docs is inflated for both Post-Docs, even though one of them had the salary not inflated in the child proposal
  * Joe Williams on Thu, 30 Jul 2015 12:49:27 -0500 [View Commit](../../commit/7ce30372b4a05e2bf6974d2d9b0c0e54a3eecb98)

##coeus-1507.72
* Award Time and Money Improvements
  * blackcathacker on Wed, 24 Jun 2015 17:56:08 -0400 [View Commit](../../commit/ee71818851e2f92960a9b95c92599e4ff5f4274b)
* Fixes to the summary and history tab
  * blackcathacker on Thu, 25 Jun 2015 15:51:30 -0400 [View Commit](../../commit/a9f3efb2ba6c26a23f027076b256d2f08cb4ebdf)
* Fix T&M summary for single node hierarchies
  * blackcathacker on Fri, 26 Jun 2015 14:40:23 -0400 [View Commit](../../commit/90abff1f46e7e1fa39245a0349f23176278c8522)

##coeus-1507.71
* No Changes


##coeus-1507.70
* No Changes


##coeus-1507.69
*  fix irb committee submission when there is a protocol submission using the committee.  Rice will attempt to validate a large object graph and cause the committee to go into exception routing.  Fix irb and iacuc committee submission when there is a protocol submission where routing to final will attempt to save protocol submission lite bo which are mapped to views.
  * Travis Schneeberger on Wed, 29 Jul 2015 17:20:13 -0400 [View Commit](../../commit/b426e1a655a5cfa2fe65c23855b42a937af66c8a)

##coeus-1507.68
*  fix doc handler url for iacuc committee document
  * Travis Schneeberger on Wed, 29 Jul 2015 16:31:40 -0400 [View Commit](../../commit/fc7f4ddfd623283524194f8a8811b3eb43571d61)

##coeus-1507.67
*  adding missing primary key attribute to iacuc submission lite bo ojb mapping
  * Travis Schneeberger on Wed, 29 Jul 2015 15:06:00 -0400 [View Commit](../../commit/9b07e4546212857e247de4bced114871e45071d4)

##coeus-1507.66
* allow modular budget actions from parent budgets in prop dev

  * As a proposal user, I need to build hierarchies to satisfy my multiple campus locations.
  * Currently, when I need to prepare a modular budget with a hierarchy, I cannot populate the Modular Budget screen in the Parent proposal.
  * The initiating child is designated as Modular, and populated the modular screen.
  * Additional linked child proposal budgets were also modular, and successfully populate the modular screen.
  * When I open the Parent proposal Budget > Modular Budget screen, I should be able to sync the detailed budget information to populate this screen, but the options are all grey - appearing in view only mode.
  * Nor can I manually add any details to the modular screen.
  * If the modular budget screen is not populated, then I cannot populate the NIH Modular Budget form. If my total budget is below $250,000 in direct costs, NIH requires that I submit a modular budget, else my submission will be rejected by eCommons. Some opportunities absolutely mandate use of modular budget types and I do not have the option to increase the dollar value of the budget to escape the restriction.
  * Joe Williams on Wed, 29 Jul 2015 08:14:14 -0500 [View Commit](../../commit/6b5e9ce0ca35a7975038e47d390c3e5753da28f4)

##coeus-1507.65
*  Trying to fix award budget intermittent issues.
  * Open an award budget document, navigate into any screen, aka Personnel.
  * I had been able to create an AB, and Edit it, but eventually, I get the 'not finished loading' message and have to exit out by means of selecting a portal, leaving a lock on the document.
  * Gayathri Athreya on Tue, 28 Jul 2015 16:05:32 -0700 [View Commit](../../commit/cc29147decd3a9ef49c13ccc7c8bdda32540a66a)

##coeus-1507.64
*  Budget print doesnt work after assigning a person to period fix

  * This removes an update line that was causing some fields to become null.  The line appears to be unneeded and fixes the bug by removing it.
  * bsmith83 on Tue, 28 Jul 2015 15:52:29 -0700 [View Commit](../../commit/45affb6fe7d235b65f83f8112edab9681d242e70)

##coeus-1507.63
* fixes issue where propdev documents are not editable
  * Joe Williams on Tue, 28 Jul 2015 16:54:05 -0500 [View Commit](../../commit/e1c7cc698212a8294887a518be3c09a1b6db358c)

##coeus-1507.62
* No Changes


##coeus-1507.61
*  Fixing error
  * Steps to reproduce:
  * 1.    Create a proposal with project dates 9/1/15 - 12/31/16 for example. Make sure the project end date is within one Calendar year but spans next fiscal year. In this example the project ends Calendar year 2016 but December 2016 falls into MIT’s F/Y 2017 which runs from 7/1/16 – 6/30/17.
  * 2.    Create detailed budget with default periods.
  * 3.    Add non-Personnel and Personnel expenses in each period.
  * 4.    Go to rates screen and adjust applicable rate to less than rate maintained. Save.
  * 5.    Go to Institutional Commitments U/R screen. Two Fiscal Years present. Add accounts and amounts. Save.
  * 6.    At top of same U/R screen do Data Validations > turn on. Error message shows warning for “Unrecovered F&A - The Fiscal Year is outside of the project period.”
  * This warning acts as error and prevents "Complete" budget which prevents routing.
  * Gayathri Athreya on Tue, 28 Jul 2015 12:31:44 -0700 [View Commit](../../commit/dc57197592f7a238c782ab29ca27827a1b36c2fd)

##coeus-1507.60
* add validation on add proposal person to check for key person role
  * Joe Williams on Mon, 27 Jul 2015 13:59:13 -0500 [View Commit](../../commit/e8672434c80a4c99f1e23fa35fca2bceb810f88b)
* fix STE when editing budget settings on hierarchy parent
  * Joe Williams on Tue, 28 Jul 2015 12:55:42 -0500 [View Commit](../../commit/b023e869dfe3576e86095cc84491fd9e78bd86b9)
* revert unwanted changed
  * Joe Williams on Tue, 28 Jul 2015 13:29:47 -0500 [View Commit](../../commit/c93189ee4cf6b3b35e961a54800f124180eaaf63)

##coeus-1507.59
* fixed error with expanding award note text
  * Joe Williams on Tue, 28 Jul 2015 09:48:18 -0500 [View Commit](../../commit/910160fa8e6b60bd5ce6447d63da60eec1cdfef4)

##coeus-1507.58
* Unable to submit to sponsor after blanket approve

  * When blanket approving a PD you are sent back to the portal and then if you try to reopen the proposal to submit to s2s or submit to sponsor you are unable to because the only link available is edit. This allows users to still take document actions regardless of the document being in view only mode.
  * blackcathacker on Mon, 27 Jul 2015 16:46:44 -0700 [View Commit](../../commit/8c3c8e7247f6d8553f78f1d813335cfa1de06121)
* Fixing proposal summary view in action list

  * When a budget exists the following error occurs
  * java.lang.RuntimeException: Exception evaluating expression: #view.editModes.containsKey(#budgetAuthConsts.ADD_BUDGET_EDIT_MODE) and !viewOnly and canEditView
  * blackcathacker on Mon, 27 Jul 2015 16:30:16 -0700 [View Commit](../../commit/0d44769e7675bb5e3bc6f2fb2433b73c0bc8face)

##coeus-1507.57
* Fix error in IP when trying to use Print Notice

  * When trying to print the IP notice when a noticeOfOpportunity has been selected you get an exception
  * blackcathacker on Mon, 27 Jul 2015 14:50:41 -0700 [View Commit](../../commit/a5591c00923645ebd6320ef8aaf3556ec4878433)

##coeus-1507.56
* Fix issue with award special review and missing next values
  * blackcathacker on Mon, 27 Jul 2015 10:55:32 -0700 [View Commit](../../commit/ff099349a33fede777902a0f9e64ce8fa454922c)
* Time and Money improvements
  * blackcathacker on Tue, 23 Jun 2015 15:38:27 -0400 [View Commit](../../commit/22d9d79e8a106eab0ab54a5c26c8c30d0e77b2f0)

##coeus-1507.55
*  more UR fixes
  * Gayathri Athreya on Fri, 24 Jul 2015 16:37:56 -0700 [View Commit](../../commit/6e5bbb939abdadd2dcd807d16d69c51b2344170b)
* Use funding proposals instead of award versions
  * blackcathacker on Tue, 23 Jun 2015 14:59:37 -0400 [View Commit](../../commit/ba66e750155171e37c718d80351dcb34f659d4f5)
* Using Comparator.comparing and helper method
  * blackcathacker on Fri, 24 Jul 2015 19:54:15 -0700 [View Commit](../../commit/143325aaa6c528d4a5bf63fcb80facf8be4d9cd7)

##coeus-1507.54
* add short url link
  * Joe Williams on Thu, 23 Jul 2015 10:13:19 -0500 [View Commit](../../commit/2e3e6d4a2d601a9439f7bd008eed0adbf30130e8)

##coeus-1507.53
* No Changes


##coeus-1507.52
* Adding a profile to cleanup node since these are generated artifacts of the build process.
  * Travis Schneeberger on Fri, 24 Jul 2015 10:48:02 -0400 [View Commit](../../commit/15a13cd315fd821d33a433163b03939fd4359918)

##coeus-1507.51
*  Time and money document status performance
  * Brandon Nicholls on Mon, 22 Jun 2015 16:16:25 -0400 [View Commit](../../commit/7160ff88e64918afdebc52cb5cbb3b2668e3d8f7)
* Data conversion to support new status column
  * blackcathacker on Thu, 23 Jul 2015 12:34:07 -0700 [View Commit](../../commit/f69bdc3dd1f888ca7aa5b4a310016522c4231604)
* Award and T&M Improvements
  * blackcathacker on Tue, 23 Jun 2015 11:38:33 -0400 [View Commit](../../commit/21087b492d8d05f38482a08bc66601a2179ab683)

##coeus-1507.50
* No Changes


##coeus-1507.49
* No Changes


##coeus-1507.48
* make the protocol history tab load fater
  * Travis Schneeberger on Thu, 25 Jun 2015 17:18:36 -0400 [View Commit](../../commit/e8e055d141ebed93732fdacce9991d0510499cd5)

##coeus-1507.47
* No Changes


##coeus-1507.46
* Fixed several issues with Data Conversion RoleMember -> document_access conversion.

  * 1. after converting only the KRIM_ROLE_MBR_ATTR_DATA_T entries were removed leaving KRIM_ROLE_MBR_T entries with no attribute data. I altered to remove the role member from both tables.
  * 2. the compare method used to filter duplicate document access role members was incorrect causing data loss. The compare was only comparing document number so for a given role if more than one principal was a member only one would get converted and the others would be lost. I corrected the compare to fix this issue while still removing true duplicates.
  * 3. We found role member records in our database with null document id attribute. So I added a check to ignore these.
  * Travis Schneeberger on Wed, 22 Jul 2015 14:22:04 -0400 [View Commit](../../commit/106ffc5c0ed22e9d637e9028a4fbdb4ac2f0d1cb)

##coeus-1507.45
* Update Grants.gov for SHA-2, port 443, TLS-1.1/1.2

  * Grants.gov needs to be updated. Details on certificate and port requirements:
  * Additionally, you must utilize Port 443 with the SHA-2 based digital signature. Please note that all intermediate certificates in the certificate chain must also be SHA-2 in order to work with port 443.
  * Port 443 will only support:
  * SHA-2 Certificates
  * TLS v1.1 and TLS v1.2

  * Port 446 will be discontinued soon. MIT has already moved to the new port/transport mechanisms. We can grab their code from Geo's repo.
  * Joe Williams on Tue, 21 Jul 2015 13:25:33 -0500 [View Commit](../../commit/b0bc615492063caaac0f612c789663a9d312b705)
* Add 'edit' buttons to read-only instances of Kuali Research Docs

  * As a user I need to be able to begin editing a document that is entered via read-only mode. This already works for Inst Prop and Award. Needs to be added to Prop Dev and any compliance docs where applicable. Should only show up when user otherwise would have edit permissions.
  * Joe Williams on Mon, 20 Jul 2015 17:02:52 -0500 [View Commit](../../commit/18cc0437c270003c345bb79bf4629bf4c18a4d0e)

##coeus-1507.44
*  removal of the target tag
  * Abraham Heward on Wed, 22 Jul 2015 13:30:47 -0700 [View Commit](../../commit/5e04fe7a37c7c393a7ab664c5b3d764cc783ce62)
*  fix issue with budget line item group names displaying wrong

  * When a budget line item group name is blank and not null extra parentheses are added to the groupname. These extra parentheses cause issues when opening the detail and rates modal.
  * Joe Williams on Wed, 22 Jul 2015 16:41:03 -0500 [View Commit](../../commit/9bab1bf73efdeed2025b07001b270a7fe861715d)

##coeus-1507.43
* Summary service rest API documentation
  * blackcathacker on Fri, 17 Jul 2015 19:51:18 -0700 [View Commit](../../commit/4ec81dc72fe61e3cd01f4757d4815f69baad3358)
*  Fixing underrecovery
  * Create a proposal type Research.
  * Create a budget;
  * in Settings: select Rate Type of TDC and select Unrecovered Rate Type of MTDC
  * in Rates screen: set TDC rate to 10%
  * Add budget non-personnel expenses and generate periods
  * Review calculated Rate in budget item Details modal: TDC rate calculates correctly.
  * But UR is negative value
  * Review the P&T screen: note negative UR amount in column.
  * Open Commitments> Unrecovered F&A screen. System says no UR generated.
  * There SHOULD be UR because the TDC rate = 10% and the MTDC is 56%.
  * Gayathri Athreya on Wed, 22 Jul 2015 10:04:44 -0700 [View Commit](../../commit/9a5773aa89f083a4d916b7c0988e892bbd134b34)
*  Improvement to All My Proposals Search person fields

  * This commit adds/fixes aggregator, participant, and initiator fields on proposal search.  Changes what All My Proposal retrieves to include aggregator and pi,coi,and mpi for proposals for the current user.Improves some of the logic around how these searches work - unfortunately it is still sub-optimal due to a bug in Rice, see jira https://jira.kuali.org/browse/KULRICE-14269.  Includes small performance improvements due to these changes and using server side paging.
  * bsmith83 on Wed, 15 Jul 2015 10:09:43 -0700 [View Commit](../../commit/a2427487acb43ead29e54f3ef99ed033390b1f78)
* Fix jenkins build by moving node install directory to working directory
  * blackcathacker on Wed, 22 Jul 2015 12:48:33 -0700 [View Commit](../../commit/00c9a2866284141c5dc7fd32dffa4ac09ca8d9a5)

##coeus-1507.42
* fix ip attachment validation

  * When IP Attachment type is turned on (INSTITUTIONAL_PROPOSAL_ATTACHMENTS_FLAG) and user adds an attachment type to pending IP, If user accesses the IP via document search then an error message appears on screen without the ability to clear it.

  * Steps to reproduce

    create a proposal log
    create an institute proposal from the proposal log
    blanket approve
    turn on IP attachments (INSTITUTIONAL_PROPOSAL_ATTACHMENTS_FLAG to Y)
    for maintenance, add a type for IP Attachment type
    find IP and edit
    select the attachment type
    add an attachment
    remember IP document number
    save and close IP
    search Doc search for IP and open

  * Error message appears on screen and does not allow user to navigate to other screens
  * Joe Williams on Tue, 21 Jul 2015 08:23:05 -0500 [View Commit](../../commit/106de79aad859ce32b83a865f1fd23537ea6a2d3)
* add create amendment permission to iacuc admin role
  * Joe Williams on Wed, 22 Jul 2015 08:48:05 -0500 [View Commit](../../commit/6ab5d0f1c2b163f7d72853bdbde7e278718da6d4)

##coeus-1507.41
* switching to bitronix, removing xapool and jotm support
  * Travis Schneeberger on Tue, 21 Jul 2015 13:29:19 -0400 [View Commit](../../commit/4a237f351230842779994495a372bb328120d5e2)

##coeus-1507.40
* No Changes


##coeus-1507.39
* No Changes


##coeus-1507.38
* No Changes


##coeus-1507.37
* No Changes


##coeus-1507.36
*  Fix for copy dialog STE on ownedByUnit readonly replacement

  * Read-only replacement was causing an issue with the copy dialog because those fields dont exist on the object for the dialog copy object, copy is never read-only so this removes the replacement
  * bsmith83 on Mon, 20 Jul 2015 11:48:55 -0700 [View Commit](../../commit/b0e85c6f63a7803023f1d391b37ebdaf19fa0ced)

##coeus-1507.35
*  creating lite bo for protocol submission to help committee maintenance performance
  * Travis Schneeberger on Wed, 24 Jun 2015 14:51:54 -0400 [View Commit](../../commit/5440f35e53dcfeecebc01eb690dc619db46fe1e6)

##coeus-1507.34
*  Online review not getting created for non-employee reviewer and then protocol cannot be approved
  * Steps to reproduce:
  * As IACUC Admin:
  * Create new IACUC committee.
  * Add a non-employee person as a voting member. Set dates and role so the person is active.
  * Make sure there are enough members for the quorum not counting the non-employee member.
  * Complete the rest of the Committee info and blanket approve.
  * Create a new IACUC protocol and submit.
  * Modify submission request and assign to committee just created. Set as Designated member review (don’t think the review type matters) .
  * Make the non-employee reviewer an assigned reviewer (committee, secondary, or primary).
  * Submit.
  * Go to Online review tab.
  * Results:
  * The online review for the non-employee reviewer is not set up. There is an empty review without a reviewer instead of a review for that reviewer. See screenshot-1.
  * If you attempt to create a new online review for that reviewer and submit, then you get:
  * java.lang.IllegalArgumentException: the personId is null or empty
  * Gayathri Athreya on Wed, 15 Jul 2015 17:19:59 -0700 [View Commit](../../commit/869410ee2afddc052d710409bb749ae93fd5f953)
* added dialog to edit notification message and subject when sending certification notification for single users

  * As a system Admin I set the 'Prompt User" option to "on" for the Maintenance Documents> Notification >Proposal Person Certification Request Notification)
  * Currently: the Notification is not generating in proposals for the user to customize the message since the addition of RESKC-504 contribution.

  * Steps:
  * Create a proposal.
  * Add several Persons to Key Personnel (PI, several Co-I's).
  * Click the "Notify" option on a person row.
*Result*: Notification is immediately sent.
*Desired Result*: If Prompt User flag is set to On for this notification, a notification window should present to the user allowing the standard notification options.
  * Joe Williams on Thu, 16 Jul 2015 13:05:46 -0500 [View Commit](../../commit/2d333bc46f2f84fb3018a2fcc7b430e7af1ecc71)
*  restore valid krms actions to PD and budget contexts
  * Joe Williams on Thu, 16 Jul 2015 14:06:29 -0500 [View Commit](../../commit/8b0ed453a48fe0f03bb09f4cb665eb171562ed55)
* fix broken iacuc validation preventing submission
  * Joe Williams on Thu, 16 Jul 2015 14:31:36 -0500 [View Commit](../../commit/b22d404797541ea63f320f00b4c291201fed146b)

##coeus-1507.33
* Fix bug with unit hierarchy maint expand all

  * Code to ensure page has finished loading was broken on the unit hierarchy page. This fixes that by adding approriate span to allow script to determine if entire form has loaded.
  * blackcathacker on Wed, 15 Jul 2015 14:12:06 -0700 [View Commit](../../commit/205ea78ad4e420a8513f69ef5027d23d95ecb031)
*  Inactive indication on inactive units on in progress/old proposals
  * bsmith83 on Wed, 15 Jul 2015 14:39:25 -0700 [View Commit](../../commit/fb7d691698459ed04963ded59f43acd7c514ae80)

##coeus-1507.32
*  reviewers available for designated review
  * Travis Schneeberger on Wed, 15 Jul 2015 11:49:19 -0400 [View Commit](../../commit/f52c42538e961fbf118c426dcf55aaf5862b5da4)

##coeus-1507.31
* short url service for quick access to specific records

  * As a user, I want a short URL that I can save that will always resolve/redirect to the correct record in the system.  If a document can be versioned, then the URL should resolve/redirect to the most current active version.
  * Joe Williams on Mon, 13 Jul 2015 10:12:48 -0500 [View Commit](../../commit/b6131bfbf2f21357aeb169cd9dec6da4405b8b9a)

##coeus-1507.30
*  Inactive Units Still Show up in Proposal Development Lead Unit Dropdown List

  * Previously, the inactive units would be selectable as an option for new proposals, this fixes that issue.  Read-only unit values in existing proposals still display inactive units correctly.
  * bsmith83 on Tue, 14 Jul 2015 15:01:17 -0700 [View Commit](../../commit/211e41a24589ee22a07ba71ef8272bc719ee8592)

##coeus-1507.29
*  Cannot save existing committees
  * Steps to reproduce:
  * 1. Create new IRB cmt doc.
  * 2. Fill out required fields, save, close.
  * 3. Reopen doc from doc search and save.
  * 4. Business rules failure on all required fields even though these fields are populated.
  * Gayathri Athreya on Tue, 14 Jul 2015 14:35:04 -0700 [View Commit](../../commit/e4e83eae94a18ce8b6603d46b2521da80d73b165)

##coeus-1507.28
*  Fix for invalid start and end date issues with proposal number

  * Previously, the first screen of Proposal Development would let a user through if there was a failing save business rule, and not give the new doc a proposal number which had the potential to cause strange behaviors because some functionality that was now clickable relied on it.  This fix insures that the document can pass the business rules it needs to before creation of the proposal document to avoid creating/assigning un-needed document numbers and creating proposals with incorrect information.  Now the user will be stopped on the first screen if they enter invalid data.
  * bsmith83 on Mon, 13 Jul 2015 17:34:06 -0700 [View Commit](../../commit/a903cfc7565c01b6841cd71fdaf1ef3b463aef70)

##coeus-1507.27
* budget personnel perf improvements
  * Travis Schneeberger on Tue, 23 Jun 2015 13:33:07 -0400 [View Commit](../../commit/ed5a84ae31f5835b0af50d53b148af31a1abfc92)
*  Fixing validation constraint for principal investigtor id
  * Gayathri Athreya on Tue, 14 Jul 2015 11:14:42 -0700 [View Commit](../../commit/da650712e7f302e5a582dab99cb20ff9744bc67b)

##coeus-1507.26
*  Fix for STE in PD if proposal person certification answered by a proposal person during aggregator's sesson

  * If a user tried to update a certification at the same time as another user, this used to error in a optimisticLockException.  This fix checks the versions of the AnswerHeaders being saved and if their exists a newer version of the answer header, shows an error message which explains what happened - and updates the view with the most current answers and certification status/time.
  * bsmith83 on Thu, 9 Jul 2015 13:18:43 -0700 [View Commit](../../commit/ede7284d462eae80d1fd58640428bcaf0384fd82)

##coeus-1507.25
*  Fixing copy
  * On trying to copy a protocol from the lookup results, I get the following STE.
  * 2015-07-13 15:18:11,185 [http-bio-8080-exec-10] u:quickstart/d: ERROR org.apache.struts.actions.DispatchAction - Action[/protocolProtocol] does not contain method named 'actions'
  * java.lang.NoSuchMethodException: org.kuali.kra.irb.protocol.ProtocolProtocolAction.actions(org.apache.struts.action.ActionMapping, org.apache.struts.action.ActionForm, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
				 at java.lang.Class.getMethod(Class.java:1786)
				 at org.apache.struts.actions.DispatchAction.getMethod(DispatchAction.java:348)
				 at org.apache.struts.actions.DispatchAction.dispatchMethod(DispatchAction.java:252)
				 at org.kuali.rice.kns.web.struts.action.KualiAction.dispatchMethod(KualiAction.java:173)
				 at
  * Gayathri Athreya on Mon, 13 Jul 2015 15:23:27 -0700 [View Commit](../../commit/ce269c9c35d23d063acf0d80d773ef636f4ae563)

##coeus-1507.24
*  Fixing update user and additional update timestamp issues.
  * Gayathri Athreya on Wed, 8 Jul 2015 14:01:55 -0700 [View Commit](../../commit/46e70231a001d40fc66e4868e69d4675fa0c5b8d)
* adding indexes to help performance
  * Travis Schneeberger on Mon, 13 Jul 2015 09:54:34 -0400 [View Commit](../../commit/6aca467b73f81ecb32ab17aa2d96254561798643)
* rename
  * Gayathri Athreya on Mon, 13 Jul 2015 07:26:44 -0700 [View Commit](../../commit/cd147542980ea6b6e5a22bcd1d4412fb946c2cc9)
*  Display contact address as opposed to prg address in other organizations panel.
  * Gayathri Athreya on Mon, 13 Jul 2015 08:51:05 -0700 [View Commit](../../commit/6b3d97476bb9a1deea8becb7fdb78cdffc48482e)

##coeus-1507.23
* code cleanup
  * Travis Schneeberger on Mon, 13 Jul 2015 09:23:56 -0400 [View Commit](../../commit/83bec91b4d909191207bf3a0e999077d971f6b54)

##coeus-1507.22
* No Changes


##coeus-1507.21
* Caching getIndexOfAwardAmountInfoForDisplay
  * blackcathacker on Mon, 22 Jun 2015 11:01:59 -0400 [View Commit](../../commit/6ec4620d6260aeb2a3d35427b7a92db485041c5f)
* remove html commented out code to avoid possible server-side execution that is not rendered and therefore not needed.
  * Travis Schneeberger on Mon, 22 Jun 2015 11:46:25 -0400 [View Commit](../../commit/7e418eaedd28367265274f84cde7b2f776bc2c3d)
* Only check for the most recent valid aai
  * blackcathacker on Mon, 22 Jun 2015 12:08:19 -0400 [View Commit](../../commit/6b30e9d0534a5b100cdc6373e4811c5ea4cc5717)
* Fix error in streams modification
  * blackcathacker on Mon, 22 Jun 2015 13:03:12 -0400 [View Commit](../../commit/fd89f9e1ed3ca414ca943b73ea805c73c05714df)
* budget personnel perf improvements
  * Travis Schneeberger on Mon, 22 Jun 2015 21:54:08 -0400 [View Commit](../../commit/f2db411a4e3673f14ec96a98969bccfa6e73001f)
* irb go fast button to not execute values finder to retrieve ALL protocol persons
  * Travis Schneeberger on Tue, 23 Jun 2015 15:31:27 -0400 [View Commit](../../commit/b95cf9409a8c97667cb15123153b2b0199e28e01)
* avoid concurrent modification exception in meeting minutes tag
  * Travis Schneeberger on Wed, 24 Jun 2015 14:35:45 -0400 [View Commit](../../commit/0411f2e9daab7466454e4db47852ed7bfa049d0c)
* preventing rice from materializing minutes on validation by making them not updatable, fixing minute maintenance when a cancelled committee document exists.
  * Travis Schneeberger on Wed, 24 Jun 2015 17:46:55 -0400 [View Commit](../../commit/2255bf3ce2781106d0c971916bee0bfda4d53dff)
* using a criteria rather than findAll
  * Travis Schneeberger on Thu, 25 Jun 2015 09:25:38 -0400 [View Commit](../../commit/4e003c318bbc837286a98d1746616b3aded05a52)
* fix concurrent modification exception on print proposal budget
  * Travis Schneeberger on Thu, 25 Jun 2015 11:02:43 -0400 [View Commit](../../commit/2d8e3dd0641abe1855d6720fdcf62901b874048d)
* make transactionIds load faster on award actions tab
  * Travis Schneeberger on Thu, 25 Jun 2015 11:03:32 -0400 [View Commit](../../commit/98abe6da08f754e768521b5659909a444ac50d2e)
* make the protocol history tab load faster by removing extra doc service call
  * Travis Schneeberger on Thu, 25 Jun 2015 17:31:56 -0400 [View Commit](../../commit/f58cb0c784b323a65aedbf561e738c2b56c8e555)
* Fix cost_element being updated when adding personnel to PD budget

  * When using some db analytics tools it was noticed that PD Budget would sometimes persist changes to a maint doc maintained code table. This was incorrect and can potentially contribute to database deadlocks.
  * blackcathacker on Fri, 10 Jul 2015 11:36:57 -0700 [View Commit](../../commit/b6ce96f7bc0ae3e4d4b3ed14f546073e05f9ddfc)
* make edit link show for committee for cancelled document
  * Travis Schneeberger on Tue, 23 Jun 2015 20:41:42 -0400 [View Commit](../../commit/33e1b3ad9404b5aa7de55ef4698db8e1a43b23c1)

##coeus-1507.20
*  Fix reviewer selections on IACUC document.

  * To reproduce:
  * Create IACUC protocol
  * Submit for Review
  * Modify Submission Request:
  * -Assign to committee and schedule
  * -Make a reviewer "Primary" and some "Secondary"
  * Submit

  * Result:  Reviewer selections revert back to "Committee"
  * Travis Schneeberger on Wed, 8 Jul 2015 18:27:40 -0400 [View Commit](../../commit/22b673b29a4c70985671afc41e3f4842df49704e)
* create unit hierarchy proposal creator and modify proposal roles
  * Joe Williams on Thu, 9 Jul 2015 14:34:54 -0500 [View Commit](../../commit/9aa336a445b4ac86ba6c1515c04173b7b7c91df7)
* Replaces Jetty with Tomcat for Integration Tests
  * Travis Schneeberger on Thu, 9 Jul 2015 14:08:30 -0400 [View Commit](../../commit/f09bacdc513c2502313c9f546d04b86ea2b0a25e)
* When integration tests fail to startup correctly avoid attempting a startup for each test.
  * Travis Schneeberger on Thu, 9 Jul 2015 16:23:53 -0400 [View Commit](../../commit/078d8290ab83a4a35691813e649546e4920e6a0f)
* Restore inprocess and page loading alerts
  * blackcathacker on Thu, 9 Jul 2015 19:15:00 -0700 [View Commit](../../commit/dfdc8858f5a12a7e344931ec0c7e94cbde6b9494)
*  Fix reviewer selections on IACUC document.

  * Code Review Comments
  * Travis Schneeberger on Fri, 10 Jul 2015 12:03:02 -0400 [View Commit](../../commit/7cb276d7eedf8397dae878a61cbb3d61a55c1f5b)

##coeus-1507.19
* No Changes


##coeus-1507.18
* Institutional Proposal Attachments
  * Joe Williams on Tue, 16 Jun 2015 16:36:26 -0500 [View Commit](../../commit/bf8dba85cdddb19620515382dd560eaf5fc8ba9f)
* Award Attachment Disable Removal Option
  * Joe Williams on Wed, 17 Jun 2015 14:22:36 -0500 [View Commit](../../commit/9a40cea4bb867ae23d47380e9ff90f9355e396a5)
* Sub Award Attachment Disable Removal Option
  * Joe Williams on Wed, 17 Jun 2015 15:21:57 -0500 [View Commit](../../commit/8c32c5c677ebd953bc818b6284c1d0173ac378c4)
* Move Permission Logic To Authorizers
  * Joe Williams on Fri, 19 Jun 2015 12:53:16 -0500 [View Commit](../../commit/a25316d5381e6d63eff544970f3fc848697f86a7)
* Institutional Proposal Clean Up
  * Joe Williams on Wed, 8 Jul 2015 11:55:20 -0500 [View Commit](../../commit/0a48e026de25772ff928ef06ecf58d0c4f3b12e6)

##coeus-1507.17
* No Changes


##coeus-1507.16
* Support p6spy through the dev maven profile
  * blackcathacker on Wed, 8 Jul 2015 12:20:07 -0700 [View Commit](../../commit/e81a671cbb1d8729c866afd99ccb01a805923ac3)
* allow sub award budget non-personnel lineitem rates to be edited

  * User Story
  * As a budget creator or aggregator preparing a Subaward Budget for my proposal, I need to be remove the application of F&A rates In the Rates tab of the Details modal for these line items so that I do not have to request F&A on the first $25k of a subaward in a proposal when it is not appropriate to do so (for example, if the request is for supplemental funding for an existing subaward or for continuation funding.) I would expect that to add unrecovered F&A, but that may well be appropriate depending on how the school tracks that.

  * Steps to Reproduce

    Create a proposal with the dates 07-01-2016 to 06-30-2020 or dates that correspond to your subaward file
    Navigate to Budget and create a new budget version
    Go to Subaward tab
    Add a new subaward
    Search for and select any subaward organization
    Attach a subaward R&R file like the one attached here
    Click Add Subaward
    System will read dates and amounts and translate into non-personnel correctly
    Navigate to Non-personnel and view amounts
    The system should allow user to modify the F&A Rates inclusion, but currently subawards are not editable

  * Background:
  * FE issue: provided to MIT Coeus users in 4.5.1.P.2 as missed requirement for the subaward upload tool. (COEUSQA-4060)
  * Allow the users to turn off OH calculation on these line items that are added by subaward extraction tool. Currently line items added by extraction tool does not allow users to override OH calc flag. The line item details for the lines inserted by the Subaward Budget Upload process needs to let the user to uncheck the F&A ("MTDC") the first $25K cost element line of the subaward costs even though they are normally subject to institutional F&A. As noted by users, there are times when it is not appropriate to request F&A on the first $25k of a subaward in a proposal, if the request is for supplemental funding for an existing subaward or for continuation funding.

  * Acceptance Criteria
  * Given a user is logged in with 'Modify Budget' Permission to add a new subaward budget R&R file to the budget subaward
  * When the user Adds the subaward
  * Then:

    The system shows the direct and indirect costs of subaward as line item expenses in the non-personnel section of the budget (as it does now)

  * When the system adds direct and indirect line items for the subaward
  * Then:

    The system allows the user to view details of each subaward line item, including the rates
    The user may modify the apply rate option of the details modal to include or not include the application of a specific rate

  * Given a user is logged in with 'Modify Budget' Permission to add a new subaward by entering direct and indirect costs to the budget subaward details modal
  * When the user Saves the subaward details
  * Then:

    The system shows the direct and indirect costs of subaward as line item expenses in the non-personnel section of the budget (as it does now)

  * When the system adds direct and indirect line items for the subaward
  * Then:

    The system allows the user to view details of each subaward line item, including the rates
    The user may modify the apply rate option of the details modal to include or not include the application of a specific rate
  * Joe Williams on Thu, 9 Jul 2015 08:50:58 -0500 [View Commit](../../commit/8c36c7ab04c48ceccdc073d494710131c2b3c2ef)
* remove unused javascript.
  * Travis Schneeberger on Thu, 9 Jul 2015 11:06:02 -0400 [View Commit](../../commit/f1fb451ffe48c976f412492c68069006140499e2)

##coeus-1507.15
* Using absolute urls in global kns javascript file to avoid 404s due to bad paths.  This fixes the broken loading image on the loading screen.
  * Travis Schneeberger on Thu, 9 Jul 2015 08:51:30 -0400 [View Commit](../../commit/1edc6b767164af876cd820f3d6bc9c79fbdfa350)

##coeus-1507.14
*  Removing unused KRMS Validation Actions
  * Travis Schneeberger on Wed, 8 Jul 2015 09:48:11 -0400 [View Commit](../../commit/8ffbc9f18f479f4e4daf1b97ca8a5d9066179a7f)
*  Remove Negotiation follow up date validation
  * Travis Schneeberger on Wed, 8 Jul 2015 09:59:31 -0400 [View Commit](../../commit/a604812980b3775ce6dab8517c24d3a7bb2a32a1)
*  rule cleanup
  * Travis Schneeberger on Wed, 8 Jul 2015 10:06:27 -0400 [View Commit](../../commit/7fa3a6fcc79a1c8a2d93cbb719ed61849bb933d0)
*  Prevent the deletion of the last budget period

  * This adds an error message with suggestions on what to do when the user attempts to delete the last budget period on a budget.  This prevents the budget/proposal from breaking from a 0 period budget.
  * bsmith83 on Tue, 7 Jul 2015 18:14:35 -0700 [View Commit](../../commit/88a39689fd457acf7dd6390ed418da93e50583d2)
* avoid concurrent modification exception in budget rates, create a new utility function to use in jsps & tags

  * Due to budget rate types getter doing an inline sorting, Java 8 now reports a concurrent modification exception during JSP iteration and access.
  * Travis Schneeberger on Wed, 24 Jun 2015 13:06:41 -0400 [View Commit](../../commit/ae9dd041143e5a65bd9f238910ad3a85a4e3f82f)
* disable severity sorting since we are grouping by severity
  * Joe Williams on Wed, 8 Jul 2015 15:40:44 -0500 [View Commit](../../commit/8604eac562232fb2929c0c5fef9fa2b8231f1fbe)
* Avoid Java8 concurrency issue with sorting on Award Reporting

  * Due to Java 8 handling of sorting and iterator concurrency modification you will recieve this error when payment terms have been added to the award
  * ```
  * java.util.ConcurrentModificationException
        at java.util.ArrayList$Itr.checkForComodification(ArrayList.java:901)
        at java.util.ArrayList$Itr.next(ArrayList.java:851)
        at org.apache.taglibs.standard.tag.common.core.ForEachSupport$SimpleForEachIterator.next(ForEachSupport.java:153)
        at org.apache.taglibs.standard.tag.common.core.ForEachSupport.next(ForEachSupport.java:175)
        at javax.servlet.jsp.jstl.core.LoopTagSupport.doAfterBody(LoopTagSupport.java:330)
        at org.apache.jsp.tag.webaward.awardReportClasses_tag._jspx_meth_c_005fforEach_005f4(awardReportClasses_tag.java:2138)```
  * blackcathacker on Wed, 8 Jul 2015 15:22:17 -0700 [View Commit](../../commit/9613562ad80b7494919234e707eabb8b0d2f83e0)
* Remove dwr script that no longer exists.
  * Travis Schneeberger on Wed, 8 Jul 2015 18:58:37 -0400 [View Commit](../../commit/40ed4ed219d88635ad9afc798654764c56522f47)
* Remove integration test for removed logic
  * blackcathacker on Wed, 8 Jul 2015 16:11:01 -0700 [View Commit](../../commit/065827b774f952078968db71670688fc6b6765e6)

##coeus-1507.13
*  Adding missing primary key columns and constraints
  * Travis Schneeberger on Tue, 7 Jul 2015 16:40:56 -0400 [View Commit](../../commit/eaf72e3e589d6bb08685f95c80d1f9f2a4666a76)
* revert changes to ProtocolFormBase that were causing issues

  * Create a protocol
  * Submit and approve protocol
  * On approved protocol, take create an amendment action (A001)
  * Select section (like "General Info"), add comment, submit
  * Close amendment A001
  * Go to original, approved protocol
  * Create another amendment (A002)

  * Actual Result: User can select the same section as selected on A001. After submitting A002, the section is now editable in both A001 and A002 at the same.

  * Expected Result: User cannot select the same section as selected on A001. The system should prevent the user from being able to amend the same section in more than one amendment in progress.
  * Joe Williams on Wed, 8 Jul 2015 08:00:01 -0500 [View Commit](../../commit/f04f7e6bc1ee7862b6b507d38eadbb3901433c22)

##coeus-1507.12
* add prompt to warn users before they apply line items to later periods

  * If changes are made to a future year's existing expense via the Save and Apply to Other Periods, the user should confirm that change will impact future years, otherwise they may be surprised when data was unintentionally overwritten.
  * (see screenshot)

steps to reproduce
  * Create a budget
  * Add non-personnel expense
  * Select Details to Save and Apply to Other Periods
  * Open Details again, change the amount and choose Save and Apply to Other Periods,

  * Current Result: following year expense is automatically updated to reflect change and any inflation.

  * Expected Result: user should see message to confirm before change is made
  * "There is already a line item on period 2 based on this line item. Do you want to apply changes to existing items on later periods? Yes or No"
  * After user confirms, then the following year expense should update to reflect amount change including any inflation, if inflation was selected
  * Joe Williams on Tue, 7 Jul 2015 10:06:20 -0500 [View Commit](../../commit/59fa4fe900c44a6c4e3efe7ed93fd54bde993a15)

##coeus-1507.11
* only run cost share and unrecovered audit rules if flag is turned on

  * Changed parameter BudgetUnrecoveredFandAEnforcementFlag to N.
  * (This should allow the user to mark a budget complete without distributing the unrecovered f&A.)
  * Created a new proposal type = Research
  * Created a budget version.
  * Added a Non-Personnel Line Item (Other > Conference Expenses) for $10,000
  * Edited the line item details and unchecked apply MTDC.
  * Saved.
  * Generated all periods
  * Opened Commitments screen > Unrecovered F&A. Confirmed amounts exist.
  * Clicked Complete: got validation errors that the UR must be distributed.

  * Expected result: The budget should have been able to be completed because the enforcement flag was set to N prior to creating this proposal and budget.
  * Joe Williams on Tue, 7 Jul 2015 12:25:26 -0500 [View Commit](../../commit/4fcb55b2b7ecd85d7f9466287356389d47993986)
*  upgrading ojb to fix a concurrency issue under heavy load.
  * Travis Schneeberger on Tue, 7 Jul 2015 14:11:26 -0400 [View Commit](../../commit/c6410385351fe187f79d5c1e88a4716f576bb56c)

##coeus-1507.10
*  Fix to search on OSP Administrator for awards

  * Previously the search was looking at the wrong table to pull out osp adminstrator ids for the search, this corrects this and searches within the object returned for the OSP administrator.  This also adds a quickfinder and changes the search to use username for OSP administrator.  Caveat: If there are multiple OSP administrators for a single award, the one you you search on may not be the one shown in the results as it only shows the first OSP Admin in the result rows.
  * bsmith83 on Mon, 6 Jul 2015 18:39:28 -0700 [View Commit](../../commit/47323a7744291659a4940ec0d54f8e676e489ef3)

##coeus-1507.9
* sort data validation screen

  * Steps to Recreate
  * 1 Create a New Proposal Development Document
  * 2 Connect to S2S opportunity PA-C-F32
  * 3 Turn on Validation
  * When you do this there is a long series of validation errors, and apparent sort logic. There are also no sort options for this table.
  * In KNS the Validation screen sorted out your errors from your warnings, from your Grants.gov errors and warnings.
  * Can sort functions be built into this table? I don't think we need anything more involved then default behavior sort icons for the headings, but that would go a long way towards avoiding any regression from the KNS validation organization.
  * Joe Williams on Mon, 6 Jul 2015 13:54:38 -0500 [View Commit](../../commit/19b54cfd919444f1714c65aa1e00eb991cd750a8)
* fix view attachment from IACUC Summary and History

  * In a new IACUC protocol add two attachments and navigate to IACUC Protocol Actions/Summary and History/Summary . Click "view" action for the two attachments displayed in Summary.
  * Result: Clicking "view" does not perform any action. The files do not open.
  * Joe Williams on Mon, 6 Jul 2015 14:31:54 -0500 [View Commit](../../commit/0f508705a49d5adfb981b8241563b8da68edd32f)
*  Fixing update timestamp for award amount info
  * Disrupts reporting.
  * Subsequent routing of T&M docs in award, changes the update timestamp of previous award amount info entries in the table. While routing a T&M doc, only the update timestamp field of the award amount info entries for that doc should be updated.
  * Gayathri Athreya on Mon, 6 Jul 2015 15:27:02 -0700 [View Commit](../../commit/6186a4a6fd21fe12b1abdb2ccfe0c6d46ec4b60e)

##coeus-1507.8
* No Changes


##coeus-1507.7
* Changing unit back to a dropdown but using the advanced select box which includes a filter

  * This change will return the lead unit select to a drop down but using the advanced drop down currently in use by keywords and other places that also includes a filter such that a user can free-form type a partial number or name for the unit and have the displayed lists restricted by that value.
  * blackcathacker on Mon, 6 Jul 2015 10:47:26 -0700 [View Commit](../../commit/908fbbc3cb3f89e622870414aa647f4126227072)

##coeus-1507.6
* Updating project docs to reflect supported Maven version
  * Travis Schneeberger on Mon, 6 Jul 2015 10:29:34 -0400 [View Commit](../../commit/016fb17106b439a5bde10c0b62ecdfe33def8db8)
* display correct messaging on lookup resutls if the search is bounded

  * when some searches hit the upper limit for returned results, the system does not provide a message to user that not all results are displayed. 3 lookups found so far with no upper limit message:
  * The SysAdmin->Person lookup in Training
  * Unit lookup
  * KCPersonExtendedAttributes lookup
  * Joe Williams on Mon, 6 Jul 2015 09:40:31 -0500 [View Commit](../../commit/939a5fa9fbf635c6be6e70350f53e97f40c6bae2)

##coeus-1507.5
*  Adding confirmation dialog.
  * PD Budget – Need a confirmation/warning prompt when user hits the Delete icon on Periods and Totals
  * We have had multiple users report that they have mistakenly deleted Period 1 of their budget by clicking on the "trash can" icon under the Actions header in PD Budget > Periods and totals.
  * There is no warning or confirmation message given to the user, and the deletion is immediate.
  * Gayathri Athreya on Thu, 2 Jul 2015 11:41:03 -0700 [View Commit](../../commit/91dff255d9fa02474e77ab00d173611b6468cd84)
*  Fixing proposal copy
  * Tried to copy proposal (status Approved and Submitted) from search results Action link "Copy"
  * (proposal had no subawards)

  * In Copy modal:
  * Selected same lead unit 264000
  * Selected:
  * Copy budget, final version
  * Copy Attachments
  * Copy Questionnaire.
  * Clicked Copy. Got error message (see screenshot) and STE below.

  * Tried again
  * All same selections but did not select to include Attachments.
  * Same errors & STE

  * STE:

  * Stacktrace (only in dev mode)

  * java.lang.RuntimeException: An error occured while trying to copy the proposal development document.
  * at org.kuali.coeus.propdev.impl.copy.ProposalCopyServiceImpl.copyProposal(ProposalCopyServiceImpl.java:239)
  * at org.kuali.coeus.propdev.impl.copy.ProposalDevelopmentCopyController.copy(ProposalDevelopmentCopyController.java:62)
  * Caused by: org.kuali.rice.krad.exception.ValidationException: business rule evaluation failed
  * at org.kuali.rice.krad.document.DocumentBase.validateBusinessRules(DocumentBase.java:521)
  * at org.kuali.coeus.sys.framework.model.KcTransactionalDocumentBase.validateBusinessRules(KcTransactionalDocumentBase.java:146)
  * at org.kuali.rice.krad.service.impl.DocumentServiceImpl.validateAndPersistDocument(DocumentServiceImpl.java:876)
  * at org.kuali.rice.krad.service.impl.DocumentServiceImpl.validateAndPersistDocumentAndSaveAdHocRoutingRecipients(DocumentServiceImpl.java:502)
  * at org.kuali.rice.krad.service.impl.DocumentServiceImpl.saveDocument(DocumentServiceImpl.java:156)
  * Gayathri Athreya on Thu, 2 Jul 2015 12:32:44 -0700 [View Commit](../../commit/50a08c95453104169de26d94960edfd8337fd22d)
* RESKC-403 Fix to use id wildcards in combination with other properties for Proposal Lookup

  * This was a bug in the lookupable code that would assume if id was entered it was the actual full id and would ignore some other properties entered, this corrects this and expands on the searches in a couple fields which use people by allowing username, person id, full name, and last name as valid search values for those fields.  It also corrects an error with bad values being inserted into the database that caused the fullName stored to have 2 spaces inbetween first and last names which previously caused Full Name searches to fail on the fields above.
  * bsmith83 on Thu, 2 Jul 2015 18:19:02 -0700 [View Commit](../../commit/6597e9e0db5cdd8dcb737b4f7872f4dbe0c8b641)

##coeus-1507.4
* fixes issues when adding coi role to an instituional proposal

  * Steps:

  * Create Proposal Log

    Click on Central Admin
    Click on + sign by Proposal Log
    Enter Document description
    Select Proposal Type (New)
    Enter Title
    Lookup PI and return value
    Lookup Sponsor and return value (NIH)
    Save and copy or write down Proposal Number
    Submit

  * Create IP

    Click on Central Admin tab
    Search for Institutional Proposal
    Enter or paste Proposal Number from steps
    Search for Proposal Log
    Click on Proposal Number to open document
    Enter Document description
    Leave status as Pending
    Verify Sponsor and Program info
    Select NSF Science code (Medical - Life Sciences)
    Goto Financial panel
    Enter Requested Start and End dates
    Enter Total Direct Costs and F&A
    Click recalculate
    Goto Contacts Tab
    Search to Add Employee
    Return value
    Choose Project Role (CO-I , or Key Person)
    Click to Add person

  * Expected Behavior:

  * You would see panels for Combined Credit Split and Unit Contacts
  * You would see Action buttons on bottom of page to Save/Close etc

  * Actual Behavior

  * There is nothing below Project Personnel panel

    Click on any tab to exit page
    Get HTTP Status 500 error (see attached)
  * Joe Williams on Tue, 30 Jun 2015 14:01:16 -0500 [View Commit](../../commit/dd5645ca605a59dbe79e6e3fae8bf3785941b2ac)

##coeus-1507.3
* return user to landing page when canceling/closing proposal log

  * Steps to Reproduce
  * 1. In the KRAD portal, Central Admin tab > Pre-Award > Proposal Log, create a proposal log,
  * 2. Then cancel rather than submit/blanket approve.
  * Result: User is returned to the System Admin Portal, and must select KRAD portal.

  * Expected Result: User should be returned to the KRAD portal.
  * Joe Williams on Thu, 2 Jul 2015 08:54:29 -0500 [View Commit](../../commit/04147d723be04e2c7de31618a73e1ce7b698c689)

##coeus-1507.2
* Display print actions on award budgets

  * Customer updated from 5.2.1 to 6.0 asked for instructions on how to print Award Budget.
  * 6.0 is missing the Actions > Print Forms panel!

  * Award > Budget Versions(tab) > Open (budget) > Budget Actions (tab) > Print Forms (panel)
  * Joe Williams on Wed, 1 Jul 2015 10:36:21 -0500 [View Commit](../../commit/e2e11ad64849dcf0b155be4b5d8e7db47bc9e07f)
* RESKC-397 Rice update - people flow route log annotation fix
  * bsmith83 on Wed, 1 Jul 2015 09:01:00 -0700 [View Commit](../../commit/f12e907ac0a8a4e0f63eebe661d2ec705a120baa)

##coeus-1507.1
* RESKC-344 Changed lead unit selection from dropdown to suggest field

  * Changes the lead unit field in proposal details and proposal copy to a suggestion based field that limits results based on what the user types
  * bsmith83 on Tue, 30 Jun 2015 09:25:30 -0700 [View Commit](../../commit/e38a69e8b2cc22cf57e217c19d3700305c79ff72)
* RESKC-571 Fix to notes on protocols 'appearing' to overwrite eachother - tag file exception

  * Fix to the getter method sorting the content of the notes  list  (in reverse order)  each time it was called causing concurrent modification exceptions when it was iterated over by the tag file.  Instead new notes are now inserted to the top of the list
  * bsmith83 on Tue, 30 Jun 2015 18:11:30 -0700 [View Commit](../../commit/1e214160a9736b59a91f4ebef719648922d02d40)

##coeus-1506.73
* fix issue with adding award personnel details for rolodex and to be named

  * Steps To Recreate:

  * 1.) Create and Submit Award
  * 2.) Create and Submit T&M Doc for Award
  * 3.) Create Award Budget for Award
  * 4.) Add To Be Named Person.
  * 5.) Add Salary to To Be Named Person.
  * 6.) Add Personnel Detail for To Be Named Person.
  * 7.) Try To Save.
  * 8.) get STE

* SQLException during execution of sql-statement:
* sql statement was 'INSERT INTO BUDGET_PERSONNEL_DETAILS (BUDGET_PERSONNEL_DETAILS_ID,BUDGET_DETAILS_ID,LINE_ITEM_NUMBER,PERSON_NUMBER,BUDGET_ID,BUDGET_PERIOD,ON_OFF_CAMPUS_FLAG,PERSON_SEQUENCE_NUMBER,PERSON_ID,JOB_CODE,END_DATE,START_DATE,UPDATE_TIMESTAMP,UPDATE_USER,VER_NBR,OBJ_ID,APPLY_IN_RATE_FLAG,BUDGET_JUSTIFICATION,COST_SHARING_AMOUNT,COST_SHARING_PERCENT,LINE_ITEM_DESCRIPTION,PERCENT_CHARGED,PERCENT_EFFORT,PERIOD_TYPE,SALARY_REQUESTED,SEQUENCE_NUMBER,UNDERRECOVERY_AMOUNT,SUBMIT_COST_SHARING) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) '
* Exception message is [Column 'PERSON_ID' cannot be null]
* Vendor error code [1048]
* SQL state code [23000=INTEGRITY CONSTRAINT VIOLATION]
* Target class is 'org.kuali.coeus.common.budget.framework.personnel.BudgetPersonnelDetails'
* PK of the target object is [budgetPersonnelLineItemId=10]
* Source object: org.kuali.kra.award.budget.AwardBudgetPersonnelDetailsExt@28d9a5f8[serialVersionUID=4480947148039922420,budgetPersonnelLineItemId=10,budgetLineItemId=10,lineItemNumber=1,budgetId=1,budgetPeriod=1,onOffCampusFlag=true,budgetJustification=<null>,lineItemDescription=<null>,applyInRateFlag=true,personNumber=1,jobCode=AA000,periodTypeCode=3,personId=<null>,sequenceNumber=1,budgetPeriodId=1,personSequenceNumber=4,submitCostSharingFlag=true,costElement=400250,budgetCategoryCode=26,basedOnLineItem=0,quantity=0,lineItemSequence=1,groupName=,formulatedCostElementFlag=false,serialVersionUID=-6717116777934188909,serialVersionUID=8356817148151906918,updateUser=quickstart,updateUserSet=false,serialVersionUID=-3519927021539948875,serialVersionUID=1451642350593233282,versionNumber=0,objectId=1db3f017-cbbe-4d0b-a88a-29be036dcebb,newCollectionRecord=false,serialVersionUID=5563310175227245001,_persistence_shouldRefreshFetchGroup=false]
* The root stack trace is -->
* com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column 'PERSON_ID' cannot be null
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:422)
  * Joe Williams on Tue, 30 Jun 2015 17:04:18 -0500 [View Commit](../../commit/480b0e4c24b7f1750e766843da3cb98ba88ec038)

##coeus-1506.72
* RESKC-573

  * Checking for both 'Y' and 'Yes' when matching on the descends units flag.  * tdurkin on Tue, 30 Jun 2015 11:16:41 -0400 [View Commit](../../commit/e335202b4ada74d12ac27c56887b3510f2508db5)

##coeus-1506.71
* fix proposal credit allocation totals issue

  * Proposal Key Personnel Credit allocation calculations not accurate if one or more key personnel have three or four units assigned

steps to reproduce

    Create proposal
    add key personnel
    add two or three additional units for the person
    navigate to credit allocation
    add amounts to allocation and see that the figures to not sum correctly
  * Joe Williams on Tue, 30 Jun 2015 09:45:00 -0500 [View Commit](../../commit/f5a647c6bbd022514b6b8611552a4f007f047bc8)

##coeus-1506.70
* prevent users from being assigned derived roles on protocol copy

  * Steps to add derived role to a principle.

  * 1.) create protocol
  * 2.) add PI that is not current user
  * 3.) go protocol actions and copy protocol. (again be sure PI is not logged in user)

  * After you copy the protocol the PI is assigned the PI derived role, and will show up on every protocol as a PI.
  * Joe Williams on Fri, 26 Jun 2015 12:31:38 -0500 [View Commit](../../commit/1be730aacc797e9eb80a8bc3cb5b65ef403ba1e6)
* display correcct obligated amount and end date immediately upon adding award to subward

  * 1. Create and finalize an award.
  * 2. Create and finalize a T&M document for $50,000 using the Transactions panel for entering the amount.
  * 3. Edit T&M (which creates a new T&M document) and finalize it for $25,000 more using the Transactions panel for entering the amount.
  * 4. Create and finalize a subaward document, linking the subaward to the award created in step 1.

  * RESULT: The amount appearing in the Funding Source panel will show $50,000 in KC 5.0.1 and $0 in KC 5.1.

  * EXPECTED RESULT: The amount appearing in the Funding Source panel should be $75,000.
  * Joe Williams on Mon, 29 Jun 2015 08:34:33 -0500 [View Commit](../../commit/55a2efc019e2cf6c47e6f78122fa81d9d117814c)
* display credit splits for award unit and persons home unit on award

  * 1. Create an Award, completing all required fields to save the document, enter the following for Lead Unit ID: IN-IN
  * 2. Click the Contacts tab
  * 3. Enter the following for Employee User Name: oblood
  * 4. Click Add to add OLBOOD as a Principal Investigator
  * 5. Click Save
  * 6. Observe the Unit Details and Combined Credit Split subpanels
  * Actual Behavior: The system displays a Unit Details subpanel row for the Lead Unit defined on the Award tab (IN-IN). The system does not display any rows for the Primary Department Code defined for the Person in the Person record (BL-RCEN). The system displays a Combined Credit Split subpanel row for the one Unit defined on the Unit Details subpanel (which is the Lead Unit entered on the Award tab).
  * Expected Behavior: The system should display a Unit Details subpanel row for the Lead Unit defined on the Award tab and a row for the Primary Department Code defined for the Person in the Person record. The system should display a Combined Credit Split subpanel row for each Unit defined on the Unit Details subpanel, one for the Lead Unit entered on the Award tab and one for the Primary Department Code defined for the person in the Person record.
  * Joe Williams on Mon, 29 Jun 2015 09:34:46 -0500 [View Commit](../../commit/78155087a4f526f691625685f801d4597f84a0cb)
* fix issue when copying proposal with manually entered sub award budgets

  * Copying Proposals that has Subaward budgets uploaded in the budget throws STE. You can copy proposal if you choose not to copy the budget.

  * At this point users cannot copy any proposals that has a subaward budget.

  * Comments: User is having an issue copying a budget version. Has a Subaward manually entered, not file upload. Get incident report when trying to copy budget.
  * Joe Williams on Mon, 29 Jun 2015 09:49:48 -0500 [View Commit](../../commit/237a8977a0de5b938038cd95a4c911417c6be333)

##coeus-1506.69
* add certification questions update mechanism

  * User needs to be able to answer newly added certification questions rather than being forced to create a new proposal to answer new question

steps to reproduce

    start a new proposal document
    add key personnel
    close proposal
    maintain questionnaire to edit the proposal person certification questionnaire
    open the content section and use search lookup to add another question
    return the new question
    blanket approve document
    open proposal again
    navigate to proposal person certification

  * Results: the new question does not appear
  * Expected Results: the system should treat certification questions the same as all other questions and prompt user for update.

  * Acceptance Criteria:
  * As a user with the ModifyProposalDevelopmentDocument permission (ex Aggregator)

  * 1 When there is a new version of a proposal person certification questionnaire
  * Then:

    The system should tell the user that a new version of the questionnaire has been published and an update is required.
    Then:
    The user should then be prompted to instruct the system how to update the questionnaire

  * 2 When the user chooses to "copy the answers from the old version of questionnaire to the new one. Only questions that have been changed in the new version will have to be answered."
  * Then:

    The system will update questionnaire to show the newest questionnaire version and will retain answers to any questions that had previously been answered
    The system will not delete any answers

  * 3 When the user chooses the option "Do not copy answers from previous version of the questionnaire. Every question in the new version of the questionnaire will have to be answered."
  * Then:

    The system will update questionnaire to show the newest questionnaire version and all prior answers shall be cleared
    The system shall not retain any previously answered questions.

  * 4 When the user does not make a selection to the update prompt
  * Then:

    The system shall not allow any edits to the current questionnaire, the user must select an update option to be able to edit questionnaire
  * Joe Williams on Fri, 26 Jun 2015 15:29:17 -0500 [View Commit](../../commit/484d43a9cd8d7d96524b9c7391540a6f4c0b2075)

##coeus-1506.68
* RESKC-252 Numeric text sort detection fix for datatables which contain numeric values

  * Fix to allow for automated sorting of columns within rich datatables which contain values that are considered numeric, this allows this type of sorting to be automated rather than specified per column, per table as was necessary previously since non-numeric sort is useless on values that are clearly should be considered numeric with these new checks.  This also automatically fixes sorting for currency, comma separated, and percentage numeric columns.
  * bsmith83 on Wed, 17 Jun 2015 17:08:02 -0700 [View Commit](../../commit/579b66bfe39983729593a78fc15c9d6107766bfd)

##coeus-1506.67
* No Changes


##coeus-1506.66
*  Fixing attachment removal
  * Application throws STE when attempting to copy proposal with personnel attachment.
  * User is copying the proposal with budget, does not want to copy attachments.
  * Got an STE and the exceptiojn in STE said constraint error on EPS_PROP_PERSON_BIO_ATTACH_FK1 - Child row exists. Looks like application is deleting rows from FILE_DATA for source proposal, this should not be happening.
  * Disabled the constraint and copied the proposal, did not get the STE and copy was created.
  * During this process, KC had actually deleted rows from file_data for source proposal and now the referential kep cannot be enabled.
  * Gayathri Athreya on Thu, 25 Jun 2015 15:09:01 -0700 [View Commit](../../commit/31c360b35527116983a172ca8c9b3859cbe07a02)
* Adding and clarifying project documentation.  Removing unused build logic such as the dev profile and maven jetty support.
  * Travis Schneeberger on Thu, 25 Jun 2015 20:10:25 -0400 [View Commit](../../commit/7cd22b8fc19e1f6f6d1815a3e94de072eec5bc07)

##coeus-1506.65
* No Changes


##coeus-1506.64
* reevaluate canEditView on all workflow actions on proposal development
  * Joe Williams on Thu, 25 Jun 2015 12:13:21 -0500 [View Commit](../../commit/d3e788d13841ec6e8bbebd0e02b12368560709d2)
* RESKC-570 Roll back for RESKC-560 and RESKC-499, implementing a fix described in 499

  * This will make meeting schedules session based again and will alert the user with an error if they have 2 schedules open at the same time because of a multitude of issues cropping up based on the assumption that some data that is missing in a variety of areas would be there
  * bsmith83 on Thu, 25 Jun 2015 17:00:21 -0700 [View Commit](../../commit/99a26aae55836083a6a2413344ff6bd2036efcbb)

##coeus-1506.63
*  Add create user and timestamp
  * Create Timestamp and Create User are missing; proposal admin details is missing several of the "date submitted by" fields.
  * Create time stamps are for auditing purposes and to show who updated records.
  * Additionally, these data values are used in several reports to senior leadership.
  * Gayathri Athreya on Wed, 24 Jun 2015 15:00:37 -0700 [View Commit](../../commit/2e3091f637e979b4e491bf50789782ed82e603aa)

##coeus-1506.62
* No Changes


##coeus-1506.61
* Fix issues with adding/removing committee members from present/absentee list

  * Edit an IRB or IACUC schedule
  * In attendance:
  * -set a member as Present Voting
  * -then set the other member as Present Voting
  * Save
  * Members revert to Absent.

  * Sometimes a member will not even move to Present after clicking Present Voting

  * Mark a selected attendee as absent get:
  * java.lang.IndexOutOfBoundsException: Index: 0, Size: 0 at java.util.ArrayList.rangeCheck(ArrayList.java:653) at java.util.ArrayList.get(ArrayList.java:429) at org.kuali.coeus.common.committee.impl.meeting.MeetingServiceImplBase.markAbsent(MeetingServiceImplBase.java:240)....

  * Captured a video to show the various things going on.

  * Full stack trace:
  * java.lang.IndexOutOfBoundsException: Index: 0, Size: 0
  * Joe Williams on Tue, 23 Jun 2015 12:42:06 -0500 [View Commit](../../commit/6034c20fe68a627e01d1bde2deaaebaaf472d8e8)
* maintain reviewer section when send notificaiton button is clicked
  * Joe Williams on Wed, 24 Jun 2015 16:25:22 -0500 [View Commit](../../commit/8cfbbd780fc80abcee8d60412635c5517288bec1)
*  Fixing null pointer.
  * Gayathri Athreya on Wed, 24 Jun 2015 16:25:23 -0700 [View Commit](../../commit/a7ab6c301e24f1b181af188852346148241e63af)
* allow editing of proposal immediately after recall action

  * confirming returned for revisions is not allowing all editable functionality of an In Progress proposal. Which in essence makes return for revisions useless.
  * Joe Williams on Thu, 25 Jun 2015 08:23:44 -0500 [View Commit](../../commit/006ddc3a93c8efd675e975beba5fefb2b110cbdd)
* display correct amount and final expiration date on subaward funding source

  * PART ONE
  * 1. Create and finalize an Award document with the following:
  * a. Project Start Date = 10/29/2012
  * b. Project End Date = 10/28/2015
  * 2. Create and finalize a Time & Money document with the following:
  * a. Anticipated Amounts = $300,000
  * b. Obligated Amounts = $200,000
  * c. Obligation Start Date = 10/29/2012
  * d. Obligation End Date = 10/28/2013

  * PART TWO
  * 3. Create a Subaward document, completing all required fields to save and submit the document, including a contact
  * 4. On the Funding Source panel of the Subaward, link it to the Award created in steps 1 and 2 above
  * 5. On the Financial tab enter Effective Date 11/01/2013; Obligated Change $10,000; Anticipated Change $20,000
  * 6. Click Add
  * 7. Submit and finalize the Subaward document

  * PART THREE
  * 8. Open the Funding Source panel of the Subaward and view the Award Amount and Final End Date of the linked award.

  * Actual Behavior: The system does not display the Award's Obligated Amount of $200,000 and final end date of 10/28/2015 from the linked Award in the Subaward edoc.

  * Expected Behavior: The system should display the Award's Obligated Amount of $200,000 and final end date of 10/28/2015 from the linked Award in the Subward edoc.
  * Joe Williams on Thu, 25 Jun 2015 09:15:25 -0500 [View Commit](../../commit/5c2fac5d8e98f4c2acde7271aef829f2c990a62e)

##coeus-1506.60
*  syncing DD with DB column sizes, allows symbols and whitespace for CommitteeScheduleMeetingDoc.minuteName and ScheduleAgenda.agendaName
  * Travis Schneeberger on Fri, 19 Jun 2015 16:11:59 -0400 [View Commit](../../commit/9c04eeecee60aea69ac20c465de42bf7db526efd)

##coeus-1506.59
* do not validate newly added custom attributes when document is enroute

  * Discovered this in UA's local 5.2.1 implementation and confirmed still an issue in 6.0.1
  * If a new Custom Data field is added for the Proposal module (and it is required) all enroute proposals will validate requiring the new field and be stuck in routing. However, if you return the document to the initiator (via 'return for edit' or superuser return to initiated) the newly added custom data field is not inserted into the document so the initiator can't fill it out even though it validates as required. The only way to update the proposal with the newly created Custom Data is for the initiator to 'recall' the document. However, typically on newly added Custom Data fields we want them to affect only new proposals not enroute proposals.
  * STEPS TO REPRODUCE FOR PROPOSAL:
  * 1. create proposal and submit into routing (notate document number).
  * 2. on maintenance tab select custom attribute and create new custom data field.
  * 3. add newly created custom data to proposal development module via the Custom Attribute Document table (make it required).
  * 4. login as current workflow stop user
  * 5. open the newly created enroute proposal.
  * 6. on Proposal Actions tab run validations, see new requirement for Custom Data.
  * 7. click 'return for edit' on proposal and fill out text box, click 'yes'
  * 8. login as initiator of document
  * 9. open doc and go to Custom Data, new custom data field not present
  * 10. go to Proposal Actions tab and run validations, error still present
  * 11. click 'recall' button
  * 12. get back into document and go to Custom Data, now it's present and can be added/edited.
  * Joe Williams on Wed, 24 Jun 2015 08:28:29 -0500 [View Commit](../../commit/064b6728ec9871cfef789d68e776bebbd39a3ba1)

##coeus-1506.58
* bring over award dates when award is copied

  * 1. Create an Award, completing all required fields to submit the document
  * 2. Enter valid Project Start and End Dates and valid Obligated Start and End Dates
  * 3. On the Award Actions tab, click Submit
  * 4. Use the Award Lookup to search for the Award
  * 5. In the Award Lookup's search results, click the Copy action next to that Award
  * 6. When the system displays the Hierarchy Actions panel, select New on the Award Copy subpanel and click the Copy action button on that panel
  * 7. When the system displays the newly initiated Award, scroll down to view the Time & Money subpanel on the Details & Dates panel and observe the Project Start and End Dates and the Obligated Start and End Dates
  * Actual Behavior: The Project Start Date, Project End Date, Obligated Start Date, and Obligated End Date are blank/null/empty. The system did not copy over the dates from the original Award.
  * Expected Behavior: The system should display the same dates (Project Start, Project End, Obligated Start, and Obligated End) in the copied Award as entered in the submitted, finalized Award used to make the copy. The system should not display the date fields as blank/null/empty.
  * Joe Williams on Wed, 24 Jun 2015 08:57:59 -0500 [View Commit](../../commit/5f21d76a4e4ef56b244aa4bb25a41ac1dc983863)

##coeus-1506.57
*  Fixing online review issue.
  * Not easily reproducible but getting this in both IRB and IACUC protocols at times on performing Protocol Actions or trying to access an online review: org.kuali.rice.core.api.exception.RiceRuntimeException: The workflow document is null. This indicates that the DocumentHeader has not been initialized properly. This can be caused by not retrieving a document using the DocumentService. at org.kuali.rice.krad.bo.DocumentHeader.getWorkflowDocument(DocumentHeader.java:75)
  * In res1-demo1, login as oblood, got to All My Reviews, and open IACUC Protocol #: 1506000154, go to Online Review tab and see that it doesn't render correctly, then go to Protocol Actions, and see the error.
  * Gayathri Athreya on Tue, 23 Jun 2015 10:28:41 -0700 [View Commit](../../commit/a5dbfbe452b3bb36eccbad79edc0b2ea18462763)

##coeus-1506.56
* code clean up
  * Joe Williams on Tue, 23 Jun 2015 15:20:19 -0500 [View Commit](../../commit/9f4d091488f99e2264b533db72217e2a5111fd70)
* prevent award submission when krms errors are present

  * Looks to be same issue as KRACOEUS-6343 and KRACOEUS-6502 but fixes not extended to all modules.
  * built a Term Specification, Term, and Agenda to create a validation that would not allow sponsorCode = 000400. I then created an award and selected the sponsor of 000400 and then 'turned on validations' and the error displayed appropriately in the Unit Business Rules Errors' section. However, even though there was an error present upon validation I was able to submit the Award into routing. I tested the very same field and validation in Propdev and the system prevented the user from submitting into routing because of the error. See attached screenshot for further reference.
  * Joe Williams on Tue, 23 Jun 2015 15:21:00 -0500 [View Commit](../../commit/1c6fb22fdcee3b99c34e53e6fa2978809cacf6d0)
*  Do not create pessimistic locks in view mode.
  * Steps:
  * Open proposal from loolup in view mode. Without closing proposal, go to pessimistic locks lookup and search. See the proposal in the lookup.
  * Gayathri Athreya on Tue, 23 Jun 2015 13:36:49 -0700 [View Commit](../../commit/0562a80508f7fd8783306267106fb7e93a3e9591)

##coeus-1506.55
* Always populate negotiation documents with most recent custom data attributes

  * Steps to Recreate:
  * 1 Create a Negotiation Document
  * 2 Enter the necessary fields to save and save the negotiation
  * 3 Create a New Custom Data field for Negotiation
  * 4 Re-open your negotiation document
  * When you take these steps only the custom data fields that were entered into the system at the time the Negotiation was created are populated. A similar problem happened with other document types. However, the correction is dependent on the document going through a versioning step. As Negotiation is never versioned this Jira did not correct this problem for the Negotiation module. Some negotiations will stay open for quite a while, and a change in needed data that happens in the middle of a given negotiation may still apply to them. So the issue that was solved for the other modules with KRACOEUS-6009 needs a Negotiation fix.
  * Joe Williams on Tue, 23 Jun 2015 13:25:23 -0500 [View Commit](../../commit/d11c136c3a48188e4eb7eba519bd2470658b02b6)

##coeus-1506.54
* Fix Calculate Button On Summary Personnel Item Details

  * Testing and documenting the use of Summary instead of project person in the budget.
  * If I edit the entered Requested Salary field and click calculate, the screen does not refresh to display the revised Fringe amount. The user has to close the window and then the period screen refreshes to show the amount. The calculate works/refreshes fringe when a project person is used.
  * The intent of using Summary is to enter an uncalculated salary value to meet a specific sponsor request - usually. So it is helpful to the user to be able to see the calc' fringe amount so they can revise the base salary, if needed. They have to close and re-open the window to see the change now.

  * Steps to Reproduce

    create a proposal and create a new budget
    navigate to assign personnel to periods
    assign personnel
    select summary as the "person" to add
    choose object code (like admin -on)
    assign to period 1
    open details modal
    enter requested salary
    click calculate button

  * Result: Nothing happens
  * Expected Result: The Calculated Fringe and Underrecovery F&A calculations should update if there are rates associated with those types for this proposal
  * Joe Williams on Tue, 23 Jun 2015 09:46:35 -0500 [View Commit](../../commit/c6427fe8f7350b06f4522dd6e2b463dc5506a188)
* Update README.md  * Gayathri Athreya on Tue, 23 Jun 2015 09:04:37 -0700 [View Commit](../../commit/89a2c48f9c9c1e85609db70e86a2afd45094e687)

##coeus-1506.53
* No Changes


##coeus-1506.52
* No Changes


##coeus-1506.51
*  Making "view active" committee open a committee with the highest sequence number that is also on a final document.
  * Travis Schneeberger on Thu, 18 Jun 2015 14:45:47 -0400 [View Commit](../../commit/09acbe59aff89744e0411d52b932c1ee77305e97)
*  Code cleanup, removing unnecessary document service call
  * Travis Schneeberger on Thu, 18 Jun 2015 15:18:12 -0400 [View Commit](../../commit/e74843ed9c2af797585ac54305211e65a235581c)
* Removing global state that is mutated in places other than bean initialization
  * Travis Schneeberger on Fri, 19 Jun 2015 09:50:12 -0400 [View Commit](../../commit/5142a997dc91134321990cfbc03ccfe1c7388221)
*  Removing unnecessary logic from committee lookup, cleanup other lookup logic
  * Travis Schneeberger on Fri, 19 Jun 2015 15:17:18 -0400 [View Commit](../../commit/5de793e2c61c313ade118771caa85b9f4850619f)

##coeus-1506.50
* No Changes


##coeus-1506.49
* Display Graduation Year on Generic and NSF Cover Page Forms

  * In Proposal Dev, the printing of the Cover Page for Generic Printing Forms and the NSF sponsor forms from Print > Sponsor From Packages > Cover Sheet does not populate the date of the PD/PI(S) graduation date(s)

  * Tested this out in Trunk build-1c8ac214 (Dec-23-02:17) Oracle9i
  * user=quickstart
  * proposal #54
  * PI = Opal blood.

  * The NSF (non g.gov) coversheet print and the Generic print form coversheet both have:
  * Degree populated from the Proposal Person > Degree > "Degree Description" field.
  * Both leave "Graduation year" blank even when populated in Proposal Person > Degree > "Graduation Year".

  * See screenshots.

  * (Note: the mapping for G.gov forms is different.
  * The Grants.gov RR Key Person Form print has:
  * Degree populated from the

  * The year is populated from the Proposal Person > Extended Details > Education > "Year Graduated" field.)
  * Joe Williams on Thu, 18 Jun 2015 15:27:48 -0500 [View Commit](../../commit/84d71a8300eab3e098e47abcb54ef94a58ddb83a)

##coeus-1506.48
*  Removing unused parameters
  * Travis Schneeberger on Thu, 18 Jun 2015 11:26:16 -0400 [View Commit](../../commit/b87d0dc978fc352bb8b4f6314082acf9c8e7accd)
* Assign Iacuc PI correct roles

  * Create an IACUC Protocol
  * Use person without any IACUC roles as PI
  * Save
  * On Permission tab, person is added as PI and IACUC Protocol aggregator
  * Go to the PIs person record, they have IACUC Protocol Aggregator (role 1582)
  * They should just be given the PI derived role on the protocol not IACUC Protocol aggregator.
  * This works as expected in IRB but not IACUC.
  * Joe Williams on Thu, 18 Jun 2015 10:41:09 -0500 [View Commit](../../commit/f951fd9c3ab8967cc36db73c93a8cf029cb609b0)

##coeus-1506.47
* return to award document from time and money document if accessed from award

  * 1. Create an Award, completing all required fields to save the document and create a Time & Money
  * 2. Click Time & Money
  * 3. Click Cancel (or Close)
  * 4. Click Yes to the question asking the user to confirm whether or not to follow-through on canceling the Time & Money document (or click either Yes or No to saving upon clicking Close)
  * Expected Behavior: If the Time & Money document was accessed through the Award document's Time & Money button, the system should return the user to the Award. The system should not return the user to the KC portal page.
  * Actual Behavior: The system does not return the user to the Award. The system returns the user to the KC portal page (KC 5.2.1 / KC-DLY) or the KRAD portal page (KC 6.0 / KC-TRUNK).
  * Joe Williams on Wed, 17 Jun 2015 15:53:18 -0500 [View Commit](../../commit/e7600be15e9adca39b28f5749fc73a56bb2a7aa6)
* add close button to proposal budget

  * User needs to be able to exit the entire proposal from the budget screens. Budget missing a close option from ALL budget screens.

  * Acceptance criteria
  * As a user logged in with the permission 'modify budget'

    When user chooses to close the budget
    Then user should see warning message such as "Would you like to save this document before you close it?"

    When user does not intend to choose close budget,
    Then they may return to the document

    When a user does want to save the budget before closing
    Then the most recent screen edits will be saved and the budget screen will close, sending user to the main KRAD portal screen

    When a user does not want to save the budget before closing
    Then the most recent screen edits will NOT be saved and the budget screen will close, sending user to the main KRAD portal screen

  * Also fixes issue with dirty checking on closing
  * Joe Williams on Thu, 18 Jun 2015 09:30:14 -0500 [View Commit](../../commit/b17f8606fb0ecd38c2714c2b83caa5f152f44e53)

##coeus-1506.46
*  person bio deletion issues.
  * Tried to delete the Co-Investigator from the proposal and each time got Incident report. Then navigation within proposal was not possible and more incident reports resulted when selecting any tab from left menu.
  * removing bio uploaded for person from db resolved issue.
  * Associated Personnel attachments should be deleted when person is deleted as Coeus did.
  * Step to reproduce:
  * Add a rolodex add personnel attachments which insert records in eps_prop_person and eps_prop_person_bio tables.
  * Delete the person, which delete the person record from eps_prop_person table, but not from eps_prop_person_bio table. So the error.
  * Gayathri Athreya on Wed, 17 Jun 2015 12:55:22 -0700 [View Commit](../../commit/6942ff4c4b8e76d6e799a210d7bb35ed00aa360d)

##coeus-1506.45
* [RESKC-394] Double scrollbar fix for iframe views
  * bsmith83 on Tue, 16 Jun 2015 19:11:50 -0700 [View Commit](../../commit/11aaaa3c7f1b0b09d099ca545eb413a4b9ef4d46)

##coeus-1506.44
*  Improve the performance of the ip lookup
  * Travis Schneeberger on Mon, 15 Jun 2015 13:20:53 -0400 [View Commit](../../commit/7b597811463584c542079ccaf0e035d56f80b313)
*  code cleanup
  * Travis Schneeberger on Mon, 15 Jun 2015 13:52:54 -0400 [View Commit](../../commit/8695f890bcbde1ad2145ea83a3afcec6f92ed71b)
* retain posted timestamp for award and IP notes and attachments

  * As an Award Maintainer, or
  * As an IP Maintainer, I need to update aspects of existing (Awards or ) Institutional Proposals.
  * When editing these records, my ID and Time stamp should only be added to the document, and to any new items I maintain that add them.
  * Currently, when I Edit an IP record or Award with existing Attachments, ALL those existing attachments update with MY user ID and the current time stamp.
  * Those attachments should maintain the User ID and time stamp from when they were originally added or actually last maintained. NOT with the info from the current edit.
  * Joe Williams on Thu, 11 Jun 2015 13:20:00 -0500 [View Commit](../../commit/49a65b7a5617cad0c55dea67ce5905c899134808)
*  When canceling a saved committee document, rice refreshes all references on the BO.  This populates BOs which contains cycles.  When rice tries to serialize the document for the cancel action xstream gets stuck in the cycle between Organization & OrganizationYnq and causes a StackOverflow.  By adding workflow properties we specify which attributes to serialize avoiding the cycles.
  * Travis Schneeberger on Tue, 16 Jun 2015 16:53:44 -0400 [View Commit](../../commit/4089f0f213f27956eca0ce953f4dde0185a83242)

##coeus-1506.43
* No Changes


##coeus-1506.42
*  Do not fail rules on warning
  * Gayathri Athreya on Mon, 15 Jun 2015 13:47:02 -0700 [View Commit](../../commit/799e0aa4465d00bc667a92aff5b34fc3fe3bef05)
*  Fixing funds requested calculations and allocations and LA calculation
  * Gayathri Athreya on Wed, 10 Jun 2015 15:16:46 -0700 [View Commit](../../commit/0a961a18201c18c3cbf5a60a04fc634dbeaf4ec7)

##coeus-1506.41
* No Changes


##coeus-1506.40
* fix protocol submissions search when title and schedule date criterion are used

  * Currently, the Protocol Submission search returns ALL submitted protocols, even with criteria entered in the search screen.
  * User Story:
  * As an IRB Protocol administrator, I want to search Protocol Submissions and use the filtering tools to adjust my search criteria to limit my results. For example, I would like to use a date range to only locate protocols submitted in a certain month.

  * Steps to reproduce:
  * As a user with IRB roles (or quickstart in Kualico)
  * Navigate to Central Admin > Post-Submission Compliance > Protocol Submissions
  * In the generated Look up screen, enter Submission Date From (1/1/2015) and Submission Date To (5/31/2015)
  * Click Search
  * Result: 28 records return.

  * Clear search
  * Try entering a partial title "JF" > click Search
  * Result: 28 records return.

  * Clear search
  * Do not enter any variables in the lookup screen > click Search
  * Result: 28 records return.

  * Desired Results: Filters should work to limit the search results.
  * Joe Williams on Fri, 12 Jun 2015 13:47:01 -0500 [View Commit](../../commit/9c89ae2f9ac6cb02ce8c0be086478787528a5361)
* changes
  * Joe Williams on Mon, 15 Jun 2015 11:19:32 -0500 [View Commit](../../commit/b7f8f13789177812981b7f10c5c440c316c057cc)

##coeus-1506.39
* Reverts back an MIT commit
  * Joe Williams on Mon, 15 Jun 2015 08:56:09 -0500 [View Commit](../../commit/5e0c6629d8ea1d336bdd6a1fd4f68f244802d708)

##coeus-1506.38
* [RESKC-522] Protocol performance tweaks
  * bsmith83 on Fri, 12 Jun 2015 19:12:49 -0700 [View Commit](../../commit/5cab2a8bbf2825b16d5f98808a8e1df43290d17c)

##coeus-1506.37
* No Changes


##coeus-1506.36
* update check specified narrative type krms function to check internal attachments

  * KRMS rule built using any internal attachment type with the function "check specified narrative type" either always shows or never shows. If user configures validation to show message when attachment is missing, it is not possible for the proposal user to make a selection (by adding the missing attachment) to clear the data validation.

  * Steps to reproduce

    Create an Agenda
    Add a rule to run when true
    In the proposition add description
    select function
    find term "check specified narrative type"
    use "=" comparison
    value of "true"
    add name
    narrative type: use any internal attachment, such as 55 (for MIT Cost Sharing Distribution")
    KC Validation
    Action Warning
    Message- any message
    Area: Attachments
    Section Name: Internal Attachments
    Page ID: PropDev-AttachmentsPage
    Section ID: PropDev-AttachmentsPage-InternalSection
    Name: any name
    Add rule
    Blanket Approve Agenda
  * Joe Williams on Fri, 12 Jun 2015 16:23:30 -0500 [View Commit](../../commit/72b53881f118b2c4954e6908090b1e612803325d)

##coeus-1506.35
*  Improve the performance of the protocol authorizers by removing edit mode logic that is not used.
  * Travis Schneeberger on Fri, 12 Jun 2015 14:27:37 -0400 [View Commit](../../commit/38e23b44be4f947f66dc0819a922b95e350b99ed)

##coeus-1506.34
* No Changes


##coeus-1506.33
* Improve unit service

  * Remove hard-coded usage of 000001. Add index and foreign key check on unit table to improve performance and safety. Refactor getTopUnit to simply query for record with null parent unit.
  * blackcathacker on Thu, 11 Jun 2015 18:26:02 -0700 [View Commit](../../commit/9cf34d9a006a88e5a1eaba3a0bb2cab328cddd46)
* Add certify user and timestamp to notification renderer
  * Joe Williams on Fri, 12 Jun 2015 07:59:04 -0500 [View Commit](../../commit/34625af33a0a864e4d195b8de2645091e77a2072)

##coeus-1506.32
*  making log messages use one log statement (avoids interleave), make perf filter & monitoring filter use the same exclude configuration, make monitoring verbose logging configurable.
  * Travis Schneeberger on Thu, 11 Jun 2015 11:21:04 -0400 [View Commit](../../commit/a21ce042d412b09fb9c8f88cc6090dc87449f5dc)

##coeus-1506.31
* No Changes


##coeus-1506.30
* iacuc copy link redirects user to the copy action on the protocol

  * Login as user who can edit/copy IACUC protocols.
  * From the Researcher portal, select Search IACUC Protocols
  * Perform a search that you know will return results. (Or create a new IACUC protocol if needed to get results.)
  * From the Results list, select Copy from one of the protocols.
  * Result: User is taken to KC Landing Page.
  * Expected Result: Protocol is opened and user is taken to the Copy option in Protocol Actions where they can copy the protocol.

  * Workaround: From the Results list, select View or Edit instead of Copy. The protocol opens. Go to IACUC Protocol Actions, Copy to New Document.
  * Joe Williams on Thu, 11 Jun 2015 14:16:59 -0500 [View Commit](../../commit/23d45eb4d3b0464d56561348183ac8848da5716f)

##coeus-1506.29
* No Changes


##coeus-1506.28
* No Changes


##coeus-1506.27
* No Changes


##coeus-1506.26
*  Fixing a hidden NPE when accessing a Protocol Amendment and the Protocol Person does not have an affiliation.
  * Travis Schneeberger on Wed, 10 Jun 2015 14:58:44 -0400 [View Commit](../../commit/c6b573e15480da1fb8f95d33fe3f1cf22570d7d6)
*  Fixing an index out of bounds exception which is swallowed and then becomes visible to the end user as a exception creating java.util.List
  * Travis Schneeberger on Wed, 10 Jun 2015 15:00:45 -0400 [View Commit](../../commit/22091cc7fbc5360ef58a4139a346ee7d6b67e76f)
* Budget Single Point Entry Enhancement
  * Joe Williams on Tue, 9 Jun 2015 16:34:58 -0500 [View Commit](../../commit/ff64bd468921aab9d39bebf9bbc76a13ac3283fa)
*  Code Cleanup
  * Travis Schneeberger on Wed, 10 Jun 2015 15:06:03 -0400 [View Commit](../../commit/8759f8779c7c36714234a2ac6fb4f08aa0121ada)

##coeus-1506.25
*  Adding indexes to prevent deadlock and increase performance
  * Travis Schneeberger on Wed, 10 Jun 2015 12:11:11 -0400 [View Commit](../../commit/f6264ba08d874cb7f713c740bb51a43e13fab2fa)

##coeus-1506.24
* [RESKC-499] Multiple browser windows/tabs open when editing Schedules will cause data to overwrite
  * Travis Schneeberger on Wed, 10 Jun 2015 10:03:35 -0400 [View Commit](../../commit/09a463c4f471be4c9dc8776c1dabaabf21a97e4e)

##coeus-1506.23
* No Changes


##coeus-1506.22
* added coi hierarchy parameter
  * Joe Williams on Tue, 9 Jun 2015 09:20:08 -0500 [View Commit](../../commit/ef589a6c01b4f7623880e53e6089620e9d23de93)
*  Fixing non personnel underrecovery rate calculation.
  * As a user I need to create a budget with a reduced MTDC rate of 10% 'de minimus' rate for an NSF submission. My institution needs to capture the under recovered F&A, so I must set the Budget F&A Rate Type to MTDC (and manually set the rate to 10% as the applied rate) and set the UR Rate Type to FUNSN (which will apply the 56% F&A rate on Salaries and 10% F&A rate on Materials and Services). This follows my institute policy of capturing the UR on the salary&applied eb/fringe/vacation.
  * Steps to reproduce:
  * Create a proposal in Unit 000001 (rates modified)
  * activity type = research
  * Create a budget
  * Budget Settings:
select F&A Rate type of MTDC
  * Select UR Rate Type of FUNSN
  * Rates Screen:
  * Edit the Applied rate for MTDC to %10
  * Review FUNSN rates 56% for Salaries; 10% for M&S
  * Add a person to the Budget; enter a salary amount for the person; apply the person to the first budget period.
  * Add a non-personnel line item, example Travel. for $10,000.
  * Save.
  * Expected Results:
  * The Personnel salary will generate Under Recovered F&A
  * (Difference of the full 56% FUNSN Salary rate less the 10% reduced MTDC rate).
  * The Non-personnel line item will NOT generate UR, because the applied MTDC rate and the standard FUNSN M&S rate are equal.
  * Current Result:
  * Personnel calculate UR correctly.
  * Non-Personnel do NOT calculate correctly and are generating UR.
  * It appears that the first FUNSN rate for Salaries is being applied.
  * Gayathri Athreya on Mon, 8 Jun 2015 14:08:42 -0700 [View Commit](../../commit/bea3df997cabcd6625e24e150c86e428885ec9c9)

##coeus-1506.21
* IRB protocol search limit fix
  * Travis Schneberger on Tue, 2 Jun 2015 16:04:38 -0400 [View Commit](../../commit/32ad34ce3f9a8545a8f9a4200c2374091707c194)
* code cleanup
  * Travis Schneberger on Tue, 2 Jun 2015 16:20:54 -0400 [View Commit](../../commit/7e159c1eb5d59d0a8c500b33e9c8cae54dd9816e)

##coeus-1506.20
* avoiding a NPE when submitting an IACUC amendment.
  * Travis Schneeberger on Mon, 8 Jun 2015 15:01:14 -0400 [View Commit](../../commit/df09356f3e3f64481c8ca2f3d335d55344557141)

##coeus-1506.19
* Organization Summary Service

  * Includes additional tests for other summary services to validate Moo conversion
  * blackcathacker on Fri, 5 Jun 2015 20:16:24 -0700 [View Commit](../../commit/5922725d9eacb8d3f0de482facdf337621736236)
*  correctly display other degree type question

  * Discovered in testing S2S questionnaire supporting the PHS Fellowship form:
  * Users answering the s2s form supporting Fellowship questionnaires presented with 2 follow up (requirement based) questions when one of five (5) specific "Other" Degree types are selected from the argument value list. The 5 questions include the full text word "other" in the question text, so question ID 100 requirement = "OTH" presents when it should not.

  * In the s2s form supporting Fellowship Questionnaire, there is a question branch with a series of questions that only present if the prior answer selected from an argument value list contains a certain text value. (for an “other” type of degree).
  * The requirement in each question in the branch is if it contains the text value ( DDOT, DOTH, MDOT, MOTH, VDOT, and OTH).

  * In KC, the Upper Case requirement is not being honored, so 5 of these questions are presenting both their specific match and the “OTH” question, because there is lower case text in each with the full word ‘other’ in lower case.
  * Requirement in KC is picking up lowercase appearance of “other” in the question text:
  * ID16 = MOTH
  * ID 17 =DOTH
  * ID18 = DDOT
  * ID19 = VDOT
  * ID 100 = OTH
  * ID 21 = MDOT

  * Only ID 100= OTH is working as anticipated: (OTH should only present when OTH is selected from the prior question.)
  * Joe Williams on Mon, 8 Jun 2015 09:57:25 -0500 [View Commit](../../commit/aa251ab2796cc604024b024e4775cf834cd9baf2)
*  Hide delete attachment button when institutional proposals are view only

  * A user should be required to edit the IP document before the Notes and Attachments allow 'delete' therefore delete button should be hid in view mode.

  * Steps to reproduce:
  * 1. create or search for an Institutional Proposal
  * 2. in edit mode, on the Institutional Proposal tab under Notes and Attachments, attach a file
  * 3. fill out other required fields
  * 4. save and blanket approve
  * 5. re-open the IP
  * 6. open Notes and Attachments

  * Results- delete button appears next to the file.
  * Expected Results- delete button should not appear when the IP is in view mode, user should be required to edit document first
  * Joe Williams on Mon, 8 Jun 2015 10:13:45 -0500 [View Commit](../../commit/3b75f94e0d8d74301058cefb7a845004b2820ba0)

##coeus-1506.18
* only return active version of subawards on subaward lookup

  * 1. Create & blanket approve a subaward document with Subrecipient #000040 "University of Maine". Note that this is Version 1.
  * 2. Now edit & blanket approve the subaward from step 1, changing the Subrecipient to #000041 "University of Maryland". Note that this is Version 2.
  * 3. Central Admin > Post-Award > Subawards > click on search icon (magnifying glass)
  * 4. While in the Subaward Lookup, enter 000040 (University of Maine) in the Subrecipient field.
  * 5. Click search.

  * RESULT: The search returns the subaward where current value for Subrecipient is 000041: "University of Maryland" (version 2).

  * EXPECTED RESULT: Search should only look for values from the maximum finalized subaward documents in the Subaward Lookup (most recent final value). In this example, the search in step 4 should have returned no values when searching for 000040 "University of Maine" since it was only present on Version 1 and had been replaced by version 2 with 000041 "University of Maryland".

  * This is true for the following Subaward Lookup criteria: Subrecipient, Start Date From, Start Date To, End Date From, End Date To, Subaward Type, Purchase Order ID, Title, Account ID, Vendor ID, Requisitioner Unit, Archive Location, Closeout Date From.
  * Joe Williams on Fri, 5 Jun 2015 09:37:57 -0500 [View Commit](../../commit/836420eced7243977843f5c546a187210d6bf261)

##coeus-1506.17
* Fix NPE that occurred with certain activity date combo

  * When a Negotation has activities that are in the past in the same location such that the later activity starts before the previous activity ends and does not have an end date, building the history for the activities will cause an NPE to be thrown during JSP page rendering(not displayed to the user). Any further activity will produce an error similar to java.lang.RuntimeException: Error occured while trying to create a new instance for class interface java.util.List.

  * The underlying NPE was occurring here. java.lang.NullPointerException
        at org.kuali.kra.negotiations.service.NegotiationServiceImpl.getNegotiationActivityHistoryLineBeans(NegotiationServiceImpl.java:294)
        at org.kuali.kra.negotiations.web.struts.form.NegotiationForm.getNegotiationActivityHistoryLineBeans(NegotiationForm.java:292)
  * blackcathacker on Fri, 5 Jun 2015 17:16:08 -0700 [View Commit](../../commit/dc576524f2d67bfa87e0be0f8caef2c8c2c8bb80)

##coeus-1506.16
*  Make reject action permission based.
  * Gayathri Athreya on Fri, 5 Jun 2015 08:36:11 -0700 [View Commit](../../commit/263dea90d8bc15669d9606e97a04d8fc8f4b0548)

##coeus-1506.15
*  ignoring url patterns for static content and healthcheck
  * Travis Schneeberger on Fri, 5 Jun 2015 15:46:27 -0400 [View Commit](../../commit/1e9f9bd56ec096e1ef01a5e011d1fc9a6aad045a)

##coeus-1506.14
* Warning should not count as rules errors.
  * In Kualico instance: Negative under recovered F&A generated in budget; values do not populate to Commitments> UR Distribution. Cannot resolve validation.

  * Create a proposal type Research.
  * Create a budget;
  * in Settings: select Rate Type of TDC and select Unrecovered Rate Type of FUNSN
  * in Rates screen: set TDC rate to 10%
  * Add budget expenses and generate periods
  * Review calculated Rate in budget item Details modal: TDC rate calculates correctly.
  * Review the P&T screen: note negative UR amount in column
  * Complete Budget action prompts Validation Error to clear audit.
  * Open Commitments> Unrecovered F&A screen. System says no UR generated.
  * Gayathri Athreya on Fri, 5 Jun 2015 12:12:43 -0700 [View Commit](../../commit/97c0fc0aeaf7fc96b3df8ba773d1be3c13c9c24c)

##coeus-1506.13
*  adding java melody jpa monitoring
  * Travis Schneeberger on Thu, 4 Jun 2015 16:39:44 -0400 [View Commit](../../commit/2641c16aef2cea6b1ce8fda6d0863ec1a267d662)

##coeus-1506.12
* Proposal Person Certification Enhancements
  * Joe Williams on Wed, 3 Jun 2015 14:06:23 -0500 [View Commit](../../commit/0f3bce441c0d94a98c081ea7f16a1737c915f2ad)

##coeus-1506.11
*  allow iacuc online review without a schedule

  * Steps to reproduce:
  * Create IACUC protocol
  * Submit for Designated Member Review (DMR).
  * Modify Submission details.
  * Assign to a Committee
  * Do not assign a schedule.
  * Select a primary reviewer.
  * Submit

  * Result: Online Review tab does not appear in protocol. Usable Online Review documents are not created. Reviewer get notification in Action List and a review appears in their All My Reviews list but they cannot do anything with it.

  * Expected Result: Online Review tab appears in protocol. Online Review documents are created and accessible/usable by reviewers. A schedule should not be needed for DMR.
  * Joe Williams on Wed, 3 Jun 2015 16:54:56 -0500 [View Commit](../../commit/b55208952f2d315dddf5af1a34adb19e26a2e10b)

##coeus-1506.10
* fix STE on award navigation after submission

  * Logged in as Admin to Res-Demo1
  * Searched for existing award using account number 2533529
  * Opened record > clicked edit button
  * Maintained Description and Transaction Type on Award Tab.
  * Clicked on another tab to make the award change; got an STE very much like the one listed below by Victor. (input string referenced my award -For input string: "000073-00001"

  * This is a blocker issue in Award .

  * I am getting STEs when I try to navigate to the Award tab after finalizing an Award, or when I try to finalize a Time and Money document.  This is happening in Demo1 and Demo2
  * Joe Williams on Thu, 4 Jun 2015 08:14:15 -0500 [View Commit](../../commit/65e8bb75b88ed9d266daa1daa112ed994d9fe1c3)

##coeus-1506.9
*  fixing concurrent modification exception in Java 8 when sorting a collection in a getter without returning a copy.
  * Travis Schneeberger on Wed, 3 Jun 2015 17:59:45 -0400 [View Commit](../../commit/2f08417736f01e63714b9b578d7aa6fd0edee92e)

##coeus-1506.8
* No Changes


##coeus-1506.7
* fix delete proposal, code cleanup, remove unused code
  * Travis Schneberger on Tue, 2 Jun 2015 14:27:54 -0400 [View Commit](../../commit/6232384dccb99a8a2d7a193eaed3ec46acff4930)
* add warning when no budget exists, code cleanup
  * Travis Schneberger on Tue, 2 Jun 2015 14:42:01 -0400 [View Commit](../../commit/8535ecf3b817ddbca291d7719c0305772ecd1731)
* increment sequence number of new Institutional Proposal
  * Travis Schneberger on Tue, 2 Jun 2015 15:24:32 -0400 [View Commit](../../commit/9f64a0f1118e858e2fc2b302afadcfa7b9f44190)
* code cleanup
  * Travis Schneberger on Tue, 2 Jun 2015 15:24:53 -0400 [View Commit](../../commit/c349e5dfa9fc30be11f11ea6126bdec64d0ae3a1)
* Update unit formulated Cost
  * Travis Schneberger on Wed, 3 Jun 2015 09:35:54 -0400 [View Commit](../../commit/f1657abefdfd2a52509f4f1d35054994e00950b7)
* code cleanup
  * Travis Schneberger on Wed, 3 Jun 2015 10:36:22 -0400 [View Commit](../../commit/1f82d85d0fd7b5d0b6c3857e4e4aa35833c4404a)

##coeus-1506.6
* Making the absentee list populate correctly
  * Travis Schneberger on Mon, 1 Jun 2015 11:32:44 -0400 [View Commit](../../commit/56f94cff610b7157e9d4cda08f30ee9e20557698)
* Award Title and Status Modification Highlights Fixed in Delta, code cleanup
  * Travis Schneberger on Mon, 1 Jun 2015 13:53:02 -0400 [View Commit](../../commit/95622c82f932340c43b98c976f315840baaf920d)

##coeus-1506.5
* No Changes


##coeus-1506.4
* Fixing Delta Report Formatting Issues, code cleanup
  * Travis Schneberger on Mon, 1 Jun 2015 17:14:54 -0400 [View Commit](../../commit/59d2221de555d3629683c85a70d2fcd5eac687bb)

##coeus-1506.3
* No Changes


##coeus-1506.2
* Avoiding a NullPointerException with report tracking.
  * Travis Schneberger on Mon, 1 Jun 2015 11:44:26 -0400 [View Commit](../../commit/5a8152afd64213bd8031ba45324a885d1e8ee640)
* negotiation xml stream calendar fix, xml stream code cleanup
  * Travis Schneberger on Mon, 1 Jun 2015 17:54:58 -0400 [View Commit](../../commit/13d66c82d7d08f2cbe18c16a3774679f805e6a96)
* negotiation xml stream calendar formating fix and parameter name fix
  * Travis Schneberger on Mon, 1 Jun 2015 17:59:49 -0400 [View Commit](../../commit/46194609e4b3a70939fc56e37dc25f382a2d7b52)

##coeus-1506.1
* Fix to Display Only Active Committee Members On Schedule Absentee List
  * Joe Williams on Thu, 28 May 2015 11:51:04 -0500 [View Commit](../../commit/edbc42b86401affc92212a0e36583972b4ab894d)
* added award audit rule to check for invalid sponsor codes

  * 1. Create an award document filling in only the required fields.
  * 2. For the Sponsor enter an invalid code such as '010002' which after it is entered will indicate in red "not found"
  * 3. Submit to the award e-doc to final.
  * RESULT: Document saves and finalizes even though the sponsor field (which is a required field) has an invalid code entered.
  * EXPECTED RESULT: Document should not save or finalize with a sponsor code that is not found. An error should be displayed indicating the sponsor is invalid.

  * The way this is described could cause some problems. If you create an award with a sponsor that later becomes inactive you wouldn't be able to maintain your document as the hard on save errors also prevent editing. This should probably be done via a validation error which would prevent submission. It should also apply to the prime sponsor field.
  * Joe Williams on Fri, 29 May 2015 12:07:14 -0500 [View Commit](../../commit/4534d9a3a61c3efcc9b9de93bdc71d28e72f90df)
* Fixed Cost Sharing and U/R screens display 'NAN' instead of total unallocated

steps to reproduce
  * Open an existing Proposal #564 in res-demo1
  * Open the Budget version
  * (see assigned person Rosemary Hanlon, or do the following:
  * Add a Person; maintain their cost object and salary
  * Assign the person to a budget period with their Effort% greater than Charge% (to generate cost sharing) save

  * Edit the Details & Rates
  * Click on the Rates tab
  * Uncheck the "apply' box in the MTDC row (to generate under recovered f&a)
  * Save
  * Save proposal

  * Click to Institutional Commitments
  * >Click to Unrecovered F&A
  * The "total Unallocated" field shows "NAN"

  * >Click Cost Sharing
  * The "total unallocated" field shows "NAN"

  * Expected Result: should display a numeric value = to 0 until user starts allocating, and then the numeric value should update based on the maintained amounts in the table rows.
  * Joe Williams on Fri, 29 May 2015 12:26:19 -0500 [View Commit](../../commit/93d1e02a83b7b2e4da1becc9272018adcd5d42ab)
*  Hierarchy copy fixes
  * "Award Copy + Copy as child of" and "New Child + based on copy from parent" and "selected award" are also copying the budget.
  * Create an Award Hierarchy Structure
  * Test 1: New Child section > click button to ‘copy from parent’, then click [create]
  * 1.	Start with an existing Award with T&M doc. (Example: 000073-00001:2533529)
  * (this root node award had an award budget)
  * 2.	Award Actions > Show Hierarchy Actions panel
  * 3.	Expand the node detail by clicking on the  beside the award-node number
  * 4.	In the New Child section > click button to ‘copy from parent’, then click [create] at the end of the row; A new award in ‘initiated’ status will open in the screen. (my test = 000073-00002)
  * 5.	Complete the required fields to submit:
  * a.	Award tab –
  * i.	Description
  * ii.	Details & Dates section: Change title to make this easier to locate; otherwise all fields from parent are pre-filled.-save Award tab
  * b.	Payments/Reports/Terms (BUG?) I had to add a report to get past the error validation. But often, we don’t want to have reporting requirements at the child nodes – so no types should be required. (separate JIRA after more testing.)
  * c.	Award Actions Tab > submit
  * Even prior to submit, I opened the Budget Versions tab and found that the budget version from the root node were copied into this -00002 child node.
  * Test 2: Create new child node: Hierarchy Actions > New Child > Based on Selected Award = child node 2 (same as open award node w/award budget)
  * 1.	Search and open award *73-00002 (this node has an award budget copied from the root node)
  * 2.	Award Actions > Show Hierarchy Actions panel
  * 3.	Click the green  beside the root node -0000001 to expand the award view
  * 4.	Click the green  beside the child -00002 node to expand the copy options
  * 5.	Click the button beside “selected award” and then click the drop-down to select the *73-00002 node (same as open) then [create]
  * 6.	The new -00003 award node will present in the screen to be maintained.
  * a.	At this point, you can click on Budget Versions and confirm that versions were copied from the selected node.
  * 7.	Award Actions > Submit.
  * 8.	Wait for processing to complete
  * 9.	Click on Budget Versions screen.
  * 10.	Click [open] on the rebudget version that is still in progress
  * Gayathri on Fri, 29 May 2015 16:20:15 -0700 [View Commit](../../commit/5140c119bb88e8c1d154dc2f78b891d4abf1509e)
*  fixing test related to java melody datasource monitoring, code cleanup
  * Travis Schneberger on Sat, 30 May 2015 11:25:04 -0400 [View Commit](../../commit/13b95b7ba487bb43590988cf594bc7e6ece3743d)

##coeus-1505.70
* Disable Reset To Default Capabilities When Budget Is View Only
  * Joe Williams on Fri, 29 May 2015 12:48:47 -0500 [View Commit](../../commit/18df6cb41cc4a4c6b5269a7913bf6d6df8f64cee)
*  Rice upgrade for rice quartz job monitoring, ehcache statistics monitoring, kc quartz job monitoring, SQL monitoring.
  * Travis Schneberger on Fri, 29 May 2015 17:19:03 -0400 [View Commit](../../commit/34fdc9dfad0dc9903e836f32e8075c0aca899b0f)
* Fix Issue Where Multi Pis Are Removed From Award Upon Editing
  * Joe Williams on Fri, 29 May 2015 14:44:06 -0500 [View Commit](../../commit/9169df3b0c6f0e1411083e74c10949fb1280cee8)

##coeus-1505.69
*  Suppress notification if business rule failure on data override
  * In the Kualico instance, the system still presents the Data Override Notification even if entered item was invalid.The Notice should NOT be sent.
  * Steps:
  * In an enroute proposal; OSP admin uses Data Override. Example: Award ID:
  * If user enters a value in the 'change' field that does not match the valid criteria (too few #/, too long, not a true Award ID) the system outlines the field in red and presents an error warning in the window; but the user can still click 'create override'; the window closes, and the Notification window still presents to alert Aggregator of override. But the override did NOT occur.
  * The Notification window should NOT be generated if the override did not occur.
  * In the MIT QA instance, the data override notification "prompt user' is NOT CHECKED. So these incorrect notices are being sent.
  * The RESKC-485 case fixes the issue of the override validation error message not appearing on the proposal screen when the override modal window closes.
  * This case is to fix the notice from being generated when the override action is not performed due to invalid/incomplete entry.
  * Gayathri on Wed, 27 May 2015 14:45:39 -0700 [View Commit](../../commit/4e0173e80c4174eaaad4a369c519fd3647e13b3c)
* fixes issue when adding fringe amounts the award budget sumary tab

  * When adding fringe amounts in the award budget summary tab every time you navigate to the paramters tab, the fringe amount will increase
  * Joe Williams on Tue, 26 May 2015 13:02:49 -0500 [View Commit](../../commit/038a9cfa54d76af45ac8e1c68844bfc242d154fc)
*  Allow same person to be added under different roles.
  * As an Award Maintainer, I need to set up new, and maintain existing Awards.
  * When adding Unit and Sponsor Contacts, I sometimes need to add the person to multiple project roles. This usually occurs with small/independent industrial and foundation sponsors in the Sponsor Contacts; and with small internal departments in the Unit Contacts panel.
  * Currently, the system will not let me add the same person to multiple roles. I get an error message on the top of the page, and a specific error above the panel identifying the person saying they are already added to contacts.

  * Steps to reproduce:
  * 1 Either create a new award, or open an existing award in Edit mode.
  * 2 Select a Transaction type on the Award panel.
  * 3 Click the Contacts tab to open
  * 4 Expand the Sponsor Contacts panel.
  * 5 Search for an address book person to add; select a project role; Add.
  * 6 Search the address book again for the same id added in step 5; select a different project role. Add.
  * Result: Error on page and above panel stating that the person already exists.
  * Desired Result: Allow duplicates for all Award contacts; Sponsor, Unit, Central Admin.
  * Gayathri on Thu, 28 May 2015 10:23:20 -0700 [View Commit](../../commit/887b8a0c110d14ca9f5cee73b8a2c4ccd51cf1e2)
*  enable java melody
  * Travis Schneberger on Fri, 29 May 2015 10:12:43 -0400 [View Commit](../../commit/b60cf41839c3e97992cee3027fd7d5cb461cb705)
* Removing unused integration test initalization logic
  * Travis Schneberger on Fri, 29 May 2015 10:13:08 -0400 [View Commit](../../commit/e06acb545eb6d1afe53730c9f60385699381e3eb)
* Adding null check to avoid a NPE for an anticipated award type.
 Code cleanup.
  * Travis Schneberger on Fri, 29 May 2015 10:25:31 -0400 [View Commit](../../commit/ea974ef658ffebca00714d4a4771e6b5c2b79472)
* Updating docs with supported infastructure
  * Travis Schneberger on Fri, 29 May 2015 10:30:59 -0400 [View Commit](../../commit/ead3ae673109f6c72749a6dc473a0d42b9482977)

##coeus-1505.68
* Add Include Custom Action Urls On All My Protocols Search
  * Joe Williams on Tue, 26 May 2015 10:59:04 -0500 [View Commit](../../commit/a1dade2b0085e1002a3386dd1daf5d9f38590dd6)

##coeus-1505.67
* New parameter for Default Email Recipient
  * Joe Williams on Wed, 27 May 2015 15:55:29 -0500 [View Commit](../../commit/6ec322368d14c0ebe58b3876d94e8dc8353a430f)

##coeus-1505.66
* copy over modular budgets when proposal is copied

  * As a proposal aggregator, I need to copy proposals & budgets. When I copy a proposal & budget with a modular budget filled with details that were either manually added or sync'd from the detailed budget, that screen is not being copied to the new proposal. If I am trying to quickly prepare a change/corrected s2s submission, this missing information will cause another error at the sponsor.

  * Confirmed problem in res-demo1 1505.47 05-20-2015 10:49

  * Steps to duplicate:
  * Locate or create a proposal & budget with the Budget > Modular screen completed.
  * Example: #553 in res-demo1.
  * Copy the proposal> select to copy for submission budget (or version with modular complete)
  * In the new proposal (example #554); notice the following:
  * S2S opportunity >Forms > Optional Modular Budget form still checked to 'include'
  * Budget > Budget Settings > Modular checkbox still checked
  * Budget > Modular Budget screen > blank. No details copied.
  * Joe Williams on Wed, 27 May 2015 13:37:12 -0500 [View Commit](../../commit/4e3eb00e3b8799efae7189d928a43c2c352e0fcd)
*  Fixing report amounts for awards.
steps to reproduce:
  * 1: Central Admin >click link for Current & Pending to open window
  * 2 click show. Print reports
  * 3. click icon for Person Search in Current Report or Pending Report (result will populate both fields)
  * 4. Enter search criteria, to locate a person with current awards (jtester in kualico)
  * 5 click search
  * 6. select the person from the list and click return value
  * 7. click [initiate report] for Current - view results on screen
  * Expected results:
  * A single row for each award maintained as "current" displaying the obligated amount from the award.
  * Actual result:
  * Some awards are showing double the amount obligated. In Kualico, some other multiple of the current obligated is appearing.
  * Gayathri on Wed, 27 May 2015 12:15:32 -0700 [View Commit](../../commit/e631f92ffd8a16f693eed90f1496cebf404f790f)

##coeus-1505.65
*  STE in dataoverride when using award id
  * As an OSP Contract Administrator and proposal approver, I need to use data override to correct information on routing proposals (defined in the maintenance doc 'proposal dev editable columns).

  * To duplicate;
  * As Quickstart in res-demo1, open a proposal in approval pending status
  * Open DataOverride from toolbar
  * Select Award ID
  * Enter the 12 digit award id
  * When I enter a valid award id, it takes it. If I enter an invalid one, the modal shows an error but if I go ahead and submit, I either get a STE or screen goes blank.

  * org.kuali.rice.core.api.exception.RiceRuntimeException: Exception trying to invoke action SAVE for document: 4690
	at org.kuali.rice.krad.document.DocumentControllerServiceImpl.performWorkflowAction(DocumentControllerServiceImpl.java:892)
	at org.kuali.rice.krad.document.DocumentControllerServiceImpl.save(DocumentControllerServiceImpl.java:285)
	at org.kuali.rice.krad.document.DocumentControllerServiceImpl.save(DocumentControllerServiceImpl.java:266)
	at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentControllerBase.save(ProposalDevelopmentControllerBase.java:257)
	at org.kuali.coeus.propdev.impl.dataovveride.ProposalDevelopmentDataOverrideController.createOverride(ProposalDevelopmentDataOverrideController.java:115)
	at org.kuali.coeus.propdev.impl.dataovveride.ProposalDevelopmentDataOverrideController$$FastClassBySpringCGLIB$$76e3085c.invoke(<generated>)

  * Caused by: java.lang.RuntimeException: No PersistenceProvider handles type: class org.kuali.kra.award.home.Award
	at org.kuali.rice.krad.data.provider.impl.ProviderBasedDataObjectService.persistenceProviderForType(ProviderBasedDataObjectService.java:266)
	at org.kuali.rice.krad.data.provider.impl.ProviderBasedDataObjectService.findMatching(ProviderBasedDataObjectService.java:96)
	at org.kuali.coeus.propdev.impl.core.SubmissionInfoServiceImpl.getProposalCurrentAwardVersion(SubmissionInfoServiceImpl.java:303)
	at org.kuali.coeus.propdev.impl.core.SubmissionInfoServiceImpl.getProposalCurrentAwardSponsorAwardNumber(SubmissionInfoServiceImpl.java:169)
	at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentDocumentRule.processProposalRequiredFieldsBusinessRule(ProposalDevelopmentDocumentRule.java:319)
	at
  * Gayathri on Tue, 26 May 2015 16:18:27 -0700 [View Commit](../../commit/b62b0145f680376a40523f1c68343f995d476e83)

##coeus-1505.64
* disable autocalculate, and syns/recalculate modular budgets when in view only mode

  * When proposal is opened in view mode, budget is also opened in view mode but user has access to generate all periods and sync, calculate buttons are enabled in modular budget.

  * Case 1: Proposal is opened by someone with view access only
  * Case 2: Proposal is opened with Search proposals: view link, regardless of user’s access
  * Case 3: User with budget creator access opens a budget currently being edited by another user (locked for editing view status)
  * In all cases, the sync to modular information is saved.
  * In some cases, the institutional commitments reset to default button result is saved. (If only this button is clicked, results don’t save. If the viewer also clicks the sync button in modular section, the reset to default action is saved.)
  * In all cases, the autocalculate function will run, but the results will not save on return to/close proposal action.

  * Steps to reproduce:
  * 1. As quickstart, create a proposal with NIH as sponsor. Add PI Nicolas Majors. Add users oblood and chew as Budget
  * Creators Add user psmock as Viewer.
  * 2. Save and close. Logout.

  * For Case 1: Proposal is opened by someone with view access only
  * 1. Login as oblood. Create budget version named < oblood version >. Add non‐personnel item, period 1 only. Save, return to proposal. Close (yes to save). Logout.
  * 2. Login as psmock. Click Budget in left navigation bar. Click on oblood version to open. Navigate to modular section. Click ‘sync’. Budget information for Period 1 is synced. Click autocalculate periods link. Budget for all periods is generated (confirm by viewing Budget Summary). Click return to proposal. Close (btw: user is prompted for save, but this prompt shouldn’t happen in view mode).

  * Case 2: Proposal is opened with Search proposals: view link, regardless of user’s access
  * 1. Login as chew. Create budget version named < chew version >. Complete salary detail for Majors. Add personnel item for Majors with 10% effort, 5% charged. Add non‐personnel item Materials & Services $50,000. In Institutional Commitments, Cost Sharing section, Period 1: enter 100 for Percentage, < dept1 > for Source account. Save. Return to proposal. Close (yes to save). Logout.
  * 2. Login as quickstart. Use Search Proposal link, enter proposal number, click ‘view’ from the results Actions options. Click Budget. Open chew version. Navigate to Institutional Commitments. Click reset to default button. Information for percentage and source is cleared. Navigate to Modular section. Click sync. Information for period 1 is synced.

  * Case 3: User with budget creator access opens a budget currently being edited by another user (locked for editing view status)
  * 1. Login as oblood. Open proposal. Create new budget version < oblood 2 >. Add non‐personnel item Materials & Services, $50,000. Save.
  * 2. Open a new incognito or private browsing window. Login as chew. Open the same proposal. Open oblood 2 budget version. Navigate to Modular section. Click ‘sync’. Information syncs and saves. (Since proposal is locked for editing, sync button should not be active.) Click autocalculate all periods link. Budget information for all periods is generated (confirm by viewing Budget Summary).

  * Results: Action buttons are available to user when budget is accessed in View Mode
  * Expected Results: These action buttons should not appear, since action should only be available to users when editing.
  * Joe Williams on Tue, 26 May 2015 16:59:48 -0500 [View Commit](../../commit/d2800edc293ad638e642955f08ecf5ed331e9a3d)

##coeus-1505.63
* Adds Parameters For Comment Type Codes
  * Joe Williams on Tue, 26 May 2015 10:07:24 -0500 [View Commit](../../commit/b448141bf75a59eafbec9841f78423dc6a5b2519)
* Fixes issues with awards with null fields on award funding proposal
  * Joe Williams on Tue, 26 May 2015 13:10:14 -0500 [View Commit](../../commit/294d2f5a9792d921774c874213e8df8457a5f29f)
* Adding Default Congressional District to Other
  * Organizations
  * rashikpolus on Mon, 1 Dec 2014 20:24:08 +0530 [View Commit](../../commit/00b50b0f3d1b5ba7cf86dc7bdcb45bc25eefaf9a)
*  Fixing award copy
  * 1. Created award with all required fields to submit.
  * 2. Open T&M and add money, route.
  * 3. Open award, create budget for the obligated amnt in award.
  * 4. Route, approve and post budget.
  * 5. Open award hierarchy actions, copy new.
  * 6. Open new award, navigate to budget versions, notice the budget has been copied over
  * Gayathri on Tue, 26 May 2015 13:03:37 -0700 [View Commit](../../commit/1dc3d17a33b45c5f7d96f58a5470a7c27f30b6f3)
* Award Budget Approval Saving wrong FnA cost
  * Joe Williams on Tue, 26 May 2015 15:42:11 -0500 [View Commit](../../commit/34bd531130ba5a546579cb3be63bd4b9807ca432)
* RESKC-371
  * This does not happen all the time but when it does, there's no way around it.

  * 1. Add an opportunity to a proposal, PA-C-R01
  * 2. Try to add narrative Budget Justification.

  * Get STE

  * org.springframework.web.bind.MissingServletRequestParameterException: Required String parameter 'previousValue' is not present at org.springframework.web.method.annotation.RequestParamMethodArgumentResolver.handleMissingValue(RequestParamMethodArgumentResolver.java:201) at org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:92) at org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:77) at org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:157) at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:124) at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:104) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandleMethod(RequestMappingHandlerAdapter.java:745) at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:685) at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:80) at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:919) at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:851) at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:953) at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:855) at javax.servlet.http.HttpServlet.service(HttpServlet.java:646) at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:829) at javax.servlet.http.HttpServlet.service(HttpServlet.java:727) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:303) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.kew.web.UserPreferencesFilter.doFilter(UserPreferencesFilter.java:78) at org.kuali.rice.kew.web.UserPreferencesFilter.doFilter(UserPreferencesFilter.java:62) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.UserLoginFilter.doFilter(UserLoginFilter.java:89) at org.kuali.rice.krad.web.filter.UserLoginFilter.doFilter(UserLoginFilter.java:77) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.BootstrapFilterChain.doFilter(BootstrapFilter.java:327) at org.kuali.rice.krad.web.filter.DummyLoginFilter.doFilter(DummyLoginFilter.java:82) at org.kuali.rice.krad.web.filter.DummyLoginFilter.doFilter(DummyLoginFilter.java:62) at org.kuali.rice.krad.web.filter.BootstrapFilterChain.doFilter(BootstrapFilter.java:320) at org.kuali.rice.krad.web.filter.BootstrapFilter.doFilter(BootstrapFilter.java:199) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.coeus.sys.framework.controller.interceptor.PerformanceLoggingFilter.doFilter(PerformanceLoggingFilter.java:80) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.coeus.sys.framework.controller.interceptor.SessionExpiredFilter.doFilter(SessionExpiredFilter.java:46) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.kuali.rice.krad.web.filter.HideWebInfFilter.doFilter(HideWebInfFilter.java:68) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.springframework.web.filter.AbstractRequestLoggingFilter.doFilterInternal(AbstractRequestLoggingFilter.java:214) at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:106) at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:241) at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:208) at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:220) at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:122) at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:170) at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:103) at org.apache.catalina.valves.RemoteIpValve.invoke(RemoteIpValve.java:683) at org.apache.catalina.valves.CrawlerSessionManagerValve.invoke(CrawlerSessionManagerValve.java:180) at org.apache.catalina.valves.AccessLogValve.invoke(AccessLogValve.java:950) at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:116) at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:421) at org.apache.coyote.ajp.AjpAprProcessor.process(AjpAprProcessor.java:188) at org.apache.coyote.AbstractProtocol$AbstractConnectionHandler.process(AbstractProtocol.java:611) at org.apache.tomcat.util.net.AprEndpoint$SocketWithOptionsProcessor.run(AprEndpoint.java:2403) at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1145) at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:615) at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61) at java.lang.Thread.run(Thread.java:745)
  * Gayathri on Tue, 26 May 2015 13:56:52 -0700 [View Commit](../../commit/e118ed16b6e4c9a0c99e82441af3e9fc28a2cf73)

##coeus-1505.62
* The reject button for the Award Document is missing when the document is on the initial node.
  * Travis Schneberger on Fri, 22 May 2015 08:37:33 -0400 [View Commit](../../commit/4561b722f639bedd5c7ce2c4c0087cdcd408bb7d)
* code cleanup in preparation for bugfix
  * Travis Schneberger on Fri, 22 May 2015 09:12:00 -0400 [View Commit](../../commit/19e51dda6dc904ba00be227649f1e58f55d56fc5)
* Award Budget causes an exception when adding personnel details.
  * Travis Schneberger on Fri, 22 May 2015 09:12:41 -0400 [View Commit](../../commit/4ecc447a74cdc9de91464d66e625402b6dda7a54)
* getting budget before reloading, fixing reload error.
  * Travis Schneberger on Fri, 22 May 2015 09:18:48 -0400 [View Commit](../../commit/c1c476618b1bdc3b6e3934a3ca341325808dbfc9)
* Institutional Proposal's award type not saving for an anticipated award type.
  * Travis Schneberger on Fri, 22 May 2015 11:18:59 -0400 [View Commit](../../commit/f4b4b177b8ea1ddc2267358e12e27252f3d809cb)
* display disaproved submitted protocols in meeting

  * Amendment or Renewal with or without Amendment docs that are assigned to a Full Committee Meeting Agenda appear in the Protocol Submitted panel of the meeting document but disappear from that list after the recording of Disapprove decision on the amendment doc. This is the opposite of what is required.

  * On further searching, it appears that the after taking the Disapprove action on an amendment or renewal, the entire amendment/renewal record disappears. If attached steps are followed for a renewal w/amendment, the record disappears after Disapprove. If a new renewal is created, KC will maintain sequence structure (so R002 will appear, if R001 was preceding), but R001 will not return from search results.

  * Steps:

    Login as quickstart
    On Central Admin tab click on Lookup next to Human Participants
    Select Protocol Status – Active – Open to Enrollment
    Click search
    Click edit in Actions column on result list and Protocol displays
    Click on Protocol Actions tab
    Click show on Request an Action panel
    Click show on Create Renewal with Amendment
    Enter something in Summary box and check all the Amend boxes
    Click create button
    Record the Protocol # for this amendment (1502000021R002)
    Click cancel for Notification
    Click on Protocol Actions tab
    Click show on Data Validation panel
    Click turn on validation – fix any errors and save
    Click show on Request an Action panel
    Click show on Submit for Review panel
    Submission Type Continuing Review/Continuation with Amendment, Submission Review Type Full
    Select Committee and Schedule Date (next available)
    Select one primary reviewer
    Record Schedule date
    Click submit button
    Click show on Request an Action
    Click show on Assign to Agenda
    Click submit
    Click close button for protocol
    On Central Admin tab click lookup on IRB Schedules
    Enter the Schedule Date From and Schedule Date To that matches the Full Committee Schedule Date from above.
    Committee Id – select from dropdown menu
    Click search
    Click edit on result list item
    Click show on Protocol Submitted
    Verify that the protocol Amendment for this scenario is listed as In Agenda
    Click show on Attendance
    Add 3 Voting Members as Present Voting (only if there are not at least 3 Voting Members Present)
    Click close for the Meeting document – yes for “Would you like to save meeting data before close it?”
    Lookup for Human Participants on Central Admin tab
    Enter the Renewal with Amendment doc nbr in Protocol # field and search
    Click edit on the result list item
    Click on Protocol Actions tab
    Click show on Request an Action
    Click show on Record Committee Decision
    For Motion Type select “Disapprove”
    Enter No = 0 and Yes = 3
    Show on Review Comments – type in a comment
    Click final check box for the Comment
    Click add
    Click submit
    On Disapprove panel click submit
    Verify that Submission Status and Status are Disapproved
    Click close
    Click on Central Admin tab
    Click on IRB Schedules on Central Admin tab
    Enter the Schedule Date From and Schedule Date for this amendment
    Click edit on result list item
    Click show on Protocol Submitted
    The Renewal with Amendment Protocol number for this scenario is no longer listed. Expectation is that it will still be listed as a Protocol Submitted.
  * Joe Williams on Fri, 22 May 2015 10:59:53 -0500 [View Commit](../../commit/a15a9120600dc6bd1d6300ecf97c2ecc2d56ea30)
* fix to display TBN table on add budget personnel

  * Tried to add a TBA person to a budget; but the list does not appear and the modal window does not fully generate.
  * I verified that there are 7 defined TBA persons in the maintenance document.

  * Steps to duplicate:
  * Locate an in-progress proposal or create a new one.
  * Open or create a budget version
  * On the Project Personnel screen, use the +Add Personnel button to open the modal
  * Select TBA from the 'search for' list option

  * Expected result: the list of maintained To Be Named persons should present with the ability to select how many to apply.

  * Current result: the field updates to To Be Named, but the rest of the modal window does not generate. There is only a letter-box window containing this type field. User cannot add a TBA person to the budget.
  * Joe Williams on Tue, 26 May 2015 09:50:22 -0500 [View Commit](../../commit/0d6467ccecdd72c6209a1ed2a4ce03910044d7aa)
*  Do not show cancelled award docs in T&M history
  * As an award administrator, I may need to cancel an award edit transaction instead of saving or submitting. The information may be incomplete, incorrect, or I may have selected the wrong award/node by mistake. I should be able to use the cancel button on the Actions panel to completely delete any updates or changes.

  * Steps:

  * Open existing award
  * Go to time and money and check history, note current version number and update timestamp/user
  * Return to award and click edit
  * Go to award actions and click cancel
  * Reopen award
  * Go to time and money and check history: cancelled award version will now be listed

  * Expected Result: all evidence of the cancelled document are removed from the Award, T&M, or Award Budget documents.
  * Currently, any cancelled documents are appearing as a Version in the T&M History panel.
  * Gayathri on Tue, 26 May 2015 10:41:02 -0700 [View Commit](../../commit/f84addc63df91c0afcbb4bcb4464345f469b9bb3)
* Fixes Issues With Sorting of Budget Persons
  * vineeth on Thu, 15 Jan 2015 16:49:20 -0500 [View Commit](../../commit/51fb5dc493e10c206496f3310234ac5eaae56058)
* fix compiler error related to generics, fix compiler warnings
  * Travis Schneberger on Tue, 26 May 2015 15:58:53 -0400 [View Commit](../../commit/ca0c90838bd55f4b683b9e17d6e1c7550b29e632)

##coeus-1505.61
* No Changes


##coeus-1505.60
* No Changes


##coeus-1505.59
* No Changes


##coeus-1505.58
* No Changes


##coeus-1505.57
* No Changes


##coeus-1505.56
* Clarifying documentation, fixing typos, changing recommended git version
  * Travis Schneberger on Fri, 22 May 2015 18:35:52 -0400 [View Commit](../../commit/0d9d29050adddddb3c1eeed9d08ab6c278e08eb4)

##coeus-1505.55
* Fix Java 7 compilation, code cleanup
  * Travis Schneberger on Fri, 22 May 2015 16:55:49 -0400 [View Commit](../../commit/c566ab7abe65b86773ac7725a17bf38c24b675ca)
* Fix award budget versioning issues

  * When versioning awards the budgets need to stay with the original award, but new awards need to display all budgets. Additionally the budget creation process wasn't looking at the correct list of budgets and only the current awards budgets which meant it could easily ignore previously posted budgets.
  * blackcathacker on Fri, 22 May 2015 14:36:31 -0700 [View Commit](../../commit/b6734a4345c6c7e08675860d3995a308c67bc54e)

##coeus-1505.54
* No Changes


##coeus-1505.53
* Removing validation constraints from award comments
  * Travis Schneberger on Fri, 22 May 2015 11:35:42 -0400 [View Commit](../../commit/199f9746681b9825ce1bf816d2aed7b2ef924a62)
*  fix award budget issues
  * Award budget documents seem to be attached to a particular sequence of the award and when new award sequences are created you can no longer view the budget created on an earlier sequence. Such as today account 2388937. When this happens users are also able to create new budget versions in the new award sequence regardless of the status of the earlier budget version. So now account 2388937 has two budget documents 1440820 and 1439251. Which again, shouldn't affect our work or SAP but I don't think this is how we want this to work.
  * Award budget totals when editing / versioning an award are not right either.
  * Gayathri on Fri, 22 May 2015 09:29:50 -0700 [View Commit](../../commit/0a7c381178303321d9753e3c9436ea94ae5b81c7)

##coeus-1505.52
* adds lookup fields related to s2s
  * Travis Schneberger on Thu, 21 May 2015 10:54:19 -0400 [View Commit](../../commit/6fffc2914affe29761f7298ed1d3385690dcc6a7)
* populate the anticipated award type description
  * Travis Schneberger on Thu, 21 May 2015 11:13:19 -0400 [View Commit](../../commit/aaca8247cfb21b0d965702150f74bcc7de64e504)
* filter subaward funding source with query criteria
  * Travis Schneberger on Thu, 21 May 2015 11:28:48 -0400 [View Commit](../../commit/49294778766e32bbd5bc541d654529bbd6cdf7df)
* Fixed F and A cost resetting when approve Award Budget
  * Travis Schneberger on Fri, 22 May 2015 08:30:43 -0400 [View Commit](../../commit/a2606ad24055755b7023b1e4bbfbc2265fbae335)
* Validation for eRA Commons User Name is based on sponsor group NIH

  * Currently any proposal that has a sponsor under the 'NIH Multiple PI' Sponsor Hierarchy will require the eRA Commons username for PD/PIs, and if missing it will throw the following validation: eRA Commons User Name is missing for <insert PI name>.

  * Originally we tied this validation to the 'NIH Multiple PI' sponsor hierarchy, but since schools may be using this hierarchy for all sponsors (not just NIH) we need to tie this validation to another hierarchy.
  * Joe Williams on Fri, 22 May 2015 09:02:53 -0500 [View Commit](../../commit/5fca18771194606d0554d80c096d7ba883d59ee2)
* code cleanup, minor schemaspy fixes.
  * Travis Schneberger on Fri, 22 May 2015 10:07:13 -0400 [View Commit](../../commit/e72cb2dedf7396823efc6e83f3030c1e11c930ed)

##coeus-1505.51
*  STE while printing budget summary with TBS budget person

  * While priting budget summary with a TBS person in the budget, the following STE was received
  * ERROR org.kuali.rice.krad.web.controller.UifHandlerExceptionResolver - For input string: "TBA4650"
  * java.lang.NumberFormatException: For input string: "TBA4650"
  * at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)
  * at java.lang.Integer.parseInt(Integer.java:492)
  * at java.lang.Integer.valueOf(Integer.java:582)
  * at org.kuali.coeus.propdev.impl.core.DevelopmentProposal.getParentInvestigatorFlag(DevelopmentProposal.java:2131)
  * at org.kuali.coeus.common.budget.impl.print.BudgetBaseStream.getInvestigatorFlag(BudgetBaseStream.java:1928)
  * at org.kuali.coeus.common.budget.impl.print.BudgetBaseStream.getReportTypeVO(BudgetBaseStream.java:2296)
  * at org.kuali.coeus.common.budget.impl.print.BudgetBaseStream.addReportTypeVO(BudgetBaseStream.java:2244)
  * at org.kuali.coeus.common.budget.impl.print.BudgetBaseStream.getReportTypeVOList(BudgetBaseStream.java:2227)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.setReportTypeForBudgetSalarySummary(BudgetSummaryXmlStream.java:199)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.getSalarySummary(BudgetSummaryXmlStream.java:185)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.getBudgetSummary(BudgetSummaryXmlStream.java:156)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.getBudgetSummaryReportPageType(BudgetSummaryXmlStream.java:138)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.getBudgetSummaryReport(BudgetSummaryXmlStream.java:112)
  * at org.kuali.coeus.common.budget.impl.print.BudgetSummaryXmlStream.generateXmlStream(BudgetSummaryXmlStream.java:86)
  * at org.kuali.coeus.common.framework.print.AbstractPrint.renderXML(AbstractPrint.java:120)
  * at org.kuali.c
  * Gayathri on Thu, 21 May 2015 11:28:00 -0700 [View Commit](../../commit/9eebe1e17a689dd496ae1f3d17834ada7db1b2ef)
* Add Numeric Validation to BudgetLineItem Quantity
  * Joe Williams on Thu, 21 May 2015 15:56:35 -0500 [View Commit](../../commit/02c38d3ff0ce5d27c625588d8b496434c308a79b)
* Rice upgrade for security fix KULRICE-14248 and jdk8 bug RESKC-452
  * bsmith83 on Thu, 21 May 2015 16:16:45 -0700 [View Commit](../../commit/49277aa09477fec4d73531142a689b0a70f8146f)

##coeus-1505.50
* Fix to AwardComment to display correct update timestamp string
  * Joe Williams on Wed, 20 May 2015 14:53:48 -0500 [View Commit](../../commit/203598d178e7b244f4bdab368b9c7c3eaefd2746)
* fix where the negotiation counter is off by one day
  * Travis Schneberger on Thu, 21 May 2015 11:01:11 -0400 [View Commit](../../commit/569c9c8c370ca6411e56db1fac856e4e37301b3c)
* excluding amount from ip rule
  * Travis Schneberger on Thu, 21 May 2015 11:49:06 -0400 [View Commit](../../commit/980462adb249dde972e0cd002d482f276862c863)

##coeus-1505.49
*  Fixing occasional STE in award
  * This error cropts up occassionally when you try to save an award.

  * SEVERE: Servlet.service() for servlet [action] in context with path [/kc-qa-wkly] threw exception
  * java.lang.RuntimeException
	at org.kuali.rice.kns.web.struts.form.pojo.PojoFormBase.populateForProperty(PojoFormBase.java:233)
  * Caused by: java.lang.NullPointerException
	at org.kuali.kra.award.home.Award.getAwardCgb(Award.java:3548)
	... 76 more
  * Gayathri on Wed, 20 May 2015 15:19:10 -0700 [View Commit](../../commit/75294447d9bfa8db54422d8b87682832f71ab466)
*  support the oracle thin driver in schemaspy
  * Travis Schneberger on Thu, 21 May 2015 09:39:15 -0400 [View Commit](../../commit/e458426eafb623f3d04e349bfc6bf2772bb8d353)

##coeus-1505.48
* Rice upgrade for RESKC-432
  * bsmith83 on Wed, 20 May 2015 15:25:33 -0700 [View Commit](../../commit/b9e7b201a08ef08e0af544563f5cc6279a5e33e8)

##coeus-1505.47
* UnitAgenda does not apply to subunits.

  * To reproduce: Create a UnitAgenda with a unit number of some parent unit (BL-BL in demo data).  Add a proposition to call a function such as All proposals when 'true'.  Add an action such as a KC Validation Action where it displays a warning such as (Area Name: Proposal Details, Page Id: PropDev-DetailsPage, Section Id: PropDev-DetailsPage-Section).  Create a proposal with a lead unit that is above the unit in the agenda (000001 in demo data).  Add a key person that belongs to a unit in the agenda or a subunit (BL-RUGS or BL-BL in demo data).  Turn validation on.  A warning from KRMS should appear.  It does not.
  * Travis Schneberger on Tue, 19 May 2015 14:36:58 -0400 [View Commit](../../commit/1713c9255a506294259b2384c68695491dca83cf)
*  budget personnel STE
  * Steps to reproduce
  * Create a new proposal
  * Add several persons to the Key Personnel screen for budget use
  * Create a new detailed budget version
  * Define the budget persons with appointment types & salaries
  * On Assign Personnel to Period> select a person, maintain the required fields, click Save.
  * STE appears.
  * java.util.ConcurrentModificationException at java.util.Vector$Itr.checkForComodification(Vector.java:1184) at java.util.Vector$Itr.next(Vector.java:1137) at org.eclipse.persistence.indirection.IndirectList$1.next(IndirectList.java:618) at org.kuali.coeus.common.budget.impl.calculator.SalaryCalculator.filterBudgetPersons(SalaryCalculator.java:159) at
  * Gayathri on Tue, 19 May 2015 11:50:53 -0700 [View Commit](../../commit/549c441d856b0bedc5e5d63de4b17b9394fa9d42)
*  making award title required in the data dictionary to avoid a constraint violation when award title is not entered.
  * Travis Schneberger on Tue, 19 May 2015 16:13:03 -0400 [View Commit](../../commit/2851c3ff2f392e08c626d024c41e2db801cd23c9)
* Rice update for KULRICE-12991
  * bsmith83 on Tue, 19 May 2015 13:42:57 -0700 [View Commit](../../commit/0646694b70c3c8de7df65ee3e23287498a07303c)
*  Fixing printed dates and amounts
  * 1. Create a new Award, completing all fields required to save and submit the document and to create a Time & Money document, but do not submit the Award document
  * 2. Click Time & Money
  * 3. On the Transactions panel, add a transaction, such as the following:
   Source Award: External
  Destination Award: 000021-00001
  Obligated Change: 100.00
  Anticipated Change: 100.00
  * 4. Submit the Time & Money document
  * 5. Return to the Award and Submit the Award document
  * 6. Once the Award is submitted, observe the Time & Money panel on the Award tab and verify the accurate Anticipated and Obligated dates and values are displayed
  * 7. Click the Award Actions tab
  * 8. Click Show on the Print panel
  * 9. On the Award Notice row, click the Select All action button
  * 10. Click Print on the Award Notice row
  * 11. Observe the Anticipated and Obligated values and Obligated Start and End Dates on the printed Award Notice
  * +Actual Behavior+: The system does not display the Obligated Start and End Dates on the printed Award Notice for Version #1. The system displays $0.00 for all Anticipated and Obligated amounts.
  * +Expected Behavior+: The system should display the Obligated Start and End Dates on the printed Award Notice. The system should display accurate values for all Anticipated and Obligated amounts. See attached screen images.

  * 12. On the Award, click Edit
  * 13. Without making any changes, other than selecting a Transaction Type, Submit the Award
  * 14. Print and observe the Award Notice for Version 2 of the Award
  * +Actual Behavior+: The system displays the correct Obligation Start and End Dates. The system displays the correct Anticipated and Obligated amounts.

  * +Expected Behavior+: The system should display the correct dates and amounts on the Award Notice that reflect the current version of the Award.

  * 15. Edit the Time & Money document
  * 16. On the Transactions panel, add a transaction, such as the following:
  Source Award: External
  Destination Award: 000021-00001
  Obligated Change: 250.00
  Anticipated Change: 250.00
  * 17. Submit the Time & Money document
  * 18. Return to the Award
  * 19. Once the Award is submitted, observe the Time & Money panel on the Award tab and verify the accurate Anticipated and Obligated dates and values are displayed
  * 20. Click the Award Actions tab
  * 21. Click Show on the Print panel
  * 22. Click Print on the Award Notice row
  * 23. Observe the Anticipated and Obligated values and Obligated Start and End Dates on the printed Award Notice
  * +Actual Behavior+: Again, the system does not display the current Obligated Start and End Dates on the printed Award Notice. The system displays $100.00 for all Anticipated and Obligated amounts, the amounts associated with Version 1 of the Award.
  * +Expected Behavior+: The system should display the accurate Obligated Start and End Dates on the printed Award Notice for the current version of the Award, even if a new Time & Money document has been edited and submitted for the existing Award version. The system should display accurate values for all Anticipated and Obligated amounts reflecting the current version of the Award, even if a new Time & Money document has been edited and submitted for the existing Award version.
  * Gayathri on Tue, 19 May 2015 15:20:02 -0700 [View Commit](../../commit/b71459b454b890485c5a72e238ef9035bf26afe4)
* fix compilation issue on java 7 related to generics
  * Travis Schneberger on Wed, 20 May 2015 11:56:16 -0400 [View Commit](../../commit/53047746238ee7844f65271b4134fee78a00687e)

##coeus-1505.46
*  Change column length of indicator fields in IP
  * 1. Create and submit/blanket approve a Proposal Log
  * 2. Create a new Institutional Proposal, using the just-created Proposal Log
  * 3. Complete all required fields to save and submit the document
  * 4. Submit the document so that the Status = FINAL
  * 5. On the Institutional Proposal tab, click Edit
  * 6. Click the Institutional Proposal Actions tab
  * 7. Click Submit (or Blanket Approve)
  * Actual Behavior: The system does not allow the user to submit the document. The system indicates that three error messages were found on the page. The system displays three instances of the following error message below all panels: Must be at most 1 characters
  * Expected Behavior: The system should allow the user to submit the Institutional Proposal document. The system should not display any error messages. If the system displays any valid error messages, the system should indicate to the user to how fix them.
  * Gayathri on Tue, 19 May 2015 09:47:04 -0700 [View Commit](../../commit/045bc87f662b10841c8339d5b98b098a01cf9c34)
*  Fix IP creation from proposal log
  * Create a proposal log and blanket approve.
  * Click on Create IP link, search for proposal log.
  * Results display with edit, copy buttons instead of select.
  * There's no way to select a proposal log.
  * Gayathri on Mon, 18 May 2015 20:41:50 -0700 [View Commit](../../commit/0a66d55d943809e4dd6df7615f1a4a28b8754649)

##coeus-1505.45
*  fix schemaspy authz when a user does not have a session established.
  * Travis Schneberger on Tue, 19 May 2015 09:57:40 -0400 [View Commit](../../commit/e17a1c3923aecf2f43ac6d8ac43b23f9878ef943)

##coeus-1505.44
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521

* fix ability to submit document with multi choice
* fix ability to delete multi choice when form first opens
* now allows whitespace in prompt and description
  * Travis Schneberger on Tue, 19 May 2015 08:55:16 -0400 [View Commit](../../commit/7d197581c5c77714aa37311f0a58085b73d81c01)
* updating documentation for changes in javadoc tool and for the move to Java 8
  * Travis Schneberger on Mon, 18 May 2015 10:28:59 -0400 [View Commit](../../commit/168bb268de43b7362d6fd9df11ae0d7a13bc6b09)

##coeus-1505.43
* No Changes


##coeus-1505.42
* release
  * Travis Schneberger on Mon, 16 Mar 2015 12:51:00 -0400 [View Commit](../../commit/bb72f3def08e57a5f0b5cb18f8b6dcb4950849ed)
* releasing
  * Travis Schneberger on Mon, 16 Mar 2015 14:13:11 -0400 [View Commit](../../commit/7f64da820e133d1d0fbd3d5bc216145d58d0dc44)
* kc-sql version update
  * blackcathacker on Fri, 17 Apr 2015 21:48:12 -0700 [View Commit](../../commit/000b000c1bcb3c8ae91236e60f120b1e7863a1c4)
* added update user to data over history
  * Joe Williams on Fri, 17 Apr 2015 13:58:48 -0500 [View Commit](../../commit/2f75317d94266a9cb1054511dec9cd090a2fb36f)
* added rolodex and ynq inquiry links to organization inquiry view
  * Joe Williams on Fri, 17 Apr 2015 14:59:43 -0500 [View Commit](../../commit/a1c752970037090bb002df5fb75632b13722a169)
* Oracle scripts

  * Bring full oracle scripts renamed and numbered back into the project
  * blackcathacker on Tue, 21 Apr 2015 09:15:55 -0400 [View Commit](../../commit/14507ad004e32834d9cc4767d4186a1fceda7dc4)
* Allow sponsor code to be smaller than 6 characters

  * A customer ended up with sponsor codes shorter than 6 characters and since it was allowed by the database and a minimal functional change the sponsor code can now be any alphanumeric up to 6 characters
  * blackcathacker on Tue, 21 Apr 2015 16:02:18 -0400 [View Commit](../../commit/ed1500ec3dd9bfa11425fcbf3519f7574ed64bea)
* fix rolodex persistence through sponsor maintenance document

  * Scenario:
  * 1 - Create a new Sponsor
  * 2 - Add Sponsor and Address details
  * 3 - Submit new Sponsor
  * 4 - Search for new Sponsor and open inquiry.

  * Result:
  * When the inquiry is opened you can see that a new rolodex record has been created but there is no address book information. If you try searching for the address book record, you can only copy the record, not edit it.

  * Expected Behavior:
  * 1 - The address book entry details should be saved when the sponsor record saves.
  * 2 - The address book record should be editable from the address book lookup.
  * Joe Williams on Tue, 21 Apr 2015 18:53:04 -0400 [View Commit](../../commit/6accf7789f227682d599c533e7d3bc6a3d4d2aaf)
*  Cleaning up commit. Since we are overriding refreshNonUpdateableReferences anyway, we do not need to override method in rule base. Serialization changes also not needed it appears.
  * Gayathri on Wed, 22 Apr 2015 05:59:13 -0700 [View Commit](../../commit/abbd850c9110b1bffe6e2c11166d7f5bd596e436)
* Award Placeholder Document fixes

  * When the placeholder doc was created by creating an award and not copying a hierarchy the resulting document doesn't have a valid award. Specifically no sponsor code which was causing an exception. This checks for the placeholder doc before checking for the sponsor groups.
  * blackcathacker on Wed, 22 Apr 2015 11:33:56 -0400 [View Commit](../../commit/29773eb718669a185ef526f2919b9358ea39d16d)
* Fix update user and date on attachments in PropDev
  * blackcathacker on Thu, 16 Apr 2015 22:28:17 -0700 [View Commit](../../commit/21dbe7a52a4ec67e9db54db8b74e9bf279793d7b)
* Code review comments
  * blackcathacker on Fri, 17 Apr 2015 09:25:18 -0700 [View Commit](../../commit/49aab06b0024335363541359a2150be529de8095)
* add warning message to autocalculate periods
  * Joe Williams on Fri, 17 Apr 2015 15:32:59 -0500 [View Commit](../../commit/0e0a7e0cde1e9cbcddfbd787a02d6fc570c959c4)
* Remove duplicately versioned sql files
  * blackcathacker on Wed, 22 Apr 2015 16:43:11 -0400 [View Commit](../../commit/6c90e27d2050456d8a7a88dc59c4fc084b1e866b)
* Fix failing integration tests

  * Integration tests are failing as the controllers were the only things setting the upload information in the attachment. By setting the upload info during pre-persist we make sure the info is never null in integration tests or in the case of additional code paths
  * blackcathacker on Thu, 23 Apr 2015 09:30:24 -0400 [View Commit](../../commit/57f3a7f16a133ce76a23dd738db592748771da9e)
* HealthCheck now reports configured version and specific database status
  * blackcathacker on Thu, 16 Apr 2015 17:52:24 -0700 [View Commit](../../commit/deee751524ba0e8dcad9a8b0a61b585458826f44)
*  added correct s2s error message and fix it link for congressional district errors

  * The Fix button for Validation error on Congressional District in the Grants.gov Errors section takes you to S2S window; it should take you to Organization Tab where error can be fixed.
  * Joe Williams on Fri, 24 Apr 2015 09:40:05 -0400 [View Commit](../../commit/b3428ae736ac22b7d2d826b6de8792f5e9950ec8)
* Make all xmlstream beans prototype scope

  * XMLStream beans contain state which means they all need to be prototype scope to avoid potential clashes when server is under load
  * blackcathacker on Fri, 24 Apr 2015 10:03:02 -0400 [View Commit](../../commit/9d03addaef34a426aaa43286af951c931d61028b)
*  cleanup
  * Travis Schneberger on Wed, 15 Apr 2015 09:02:54 -0400 [View Commit](../../commit/6a44b3b4a0e1c08183ca4895dae7217c5bab704f)
*  make award date change transactions show up with a transaction id in the various history views and transaction print dropdown menus
  * Travis Schneberger on Wed, 15 Apr 2015 15:42:18 -0400 [View Commit](../../commit/3832977239e89c6d877c0e68219edf1cf77abc6e)
*  code review comments
  * Travis Schneberger on Fri, 24 Apr 2015 10:18:51 -0400 [View Commit](../../commit/de832842dafaaeacbee2d0a34c3206f2a711e401)
*  resequencing sql scripts, adding oracle script
  * Travis Schneberger on Fri, 24 Apr 2015 10:57:40 -0400 [View Commit](../../commit/3be9e0c54554a8d11f7f9ce74eb3a0daeeded7ae)
*  depending on new kualico build of jasper token auth jar
  * Travis Schneberger on Mon, 27 Apr 2015 17:26:07 -0400 [View Commit](../../commit/7d09e80ead59320026a5f93474336f94ea695953)
*  added institutional proposal rest service
  * Joe Williams on Thu, 23 Apr 2015 12:30:06 -0400 [View Commit](../../commit/a77012e0380744c91b4b96dc3ae7ad251ebccba1)
* RESKC_352:clean up proposalHierarchyServiceImpl
  * Joe Williams on Mon, 27 Apr 2015 08:18:52 -0500 [View Commit](../../commit/530d493dd6db7a5eb6a6e4304e80c941a7ab0e30)
* Fix Wrong Proposal Status after Proposal Approved at Final Stop and Submitted to Sponsor

  * Create Proposal
  * Submit for Review
  * Do approvals
  * At final stop, approve and then automatic submission to sponsor
  * Actual Result: Status is set to 'Approved Post-Submission'
  * Expected Result: Status is set to 'Approved and Submitted'
  * Joe Williams on Mon, 27 Apr 2015 15:35:26 -0500 [View Commit](../../commit/47212200a0a570fdb927c032a01a0be28ebf9c42)
* release workflow pessimistic locks after approval

  * Approvers receive the following error message after approving proposal development document:

  * This document currently has a 160-PROPOSAL DEVELOPMENT lock owned by KR
  * Joe Williams on Tue, 28 Apr 2015 08:39:16 -0500 [View Commit](../../commit/26b45e35514791bfbf5d4ea361946066b56dd864)
* set correct update user after editing an institutional proposal

  * Edit an IP
  * The Last Update field appropriately indicates the user that is updating the record while it is open.
  * Approve
  * Close
  * Reopen the IP

  * Actual result: Last update shows as performed by "kr"
  * Expected result: Last update should display user not "kr".
  * Joe Williams on Tue, 28 Apr 2015 09:01:05 -0500 [View Commit](../../commit/a533f70ea2acf7963a8a1532b2fa1bcb7819dd2b)
*  IP versioning should not copy award funding proposals over.
  * When a version of IP is linked to a version of the award, only that version needs to be linked instead of all edits of ths IP beling linked to the award. While displaying the awards linked in IP, display all the IP versions linked to awards.
  * Gayathri on Mon, 27 Apr 2015 11:28:20 -0700 [View Commit](../../commit/c96268ccb1fdc8e62bf13e0014cd8e971021a89c)
*  Moving schemaspy feature to public release.

* Moving schemaspy initialization logic and dependency info out of the grm profile
* Making schemaspy a compile-time dependency, with current version
* Adding database script with conditional insert for schemaspy auth
* Adding schemaspy instructions to readme.md
* supporting oracle in schemaspy filter and cleanup
* cleanup of poms
* fix incorrect instructions for instrumentation in readme.md
  * Travis Schneberger on Tue, 28 Apr 2015 10:57:12 -0400 [View Commit](../../commit/090381e3152e2f78597122ff0bf1d8ef16c38310)
* RESKC-361 avoiding a NullPointerException on proposal copy.

  * When an attachment exists such as a narrative or biography but the attachment does not have attachment data and the proposal attachment is copied with the copy attachments option then a NullPointerException occurs.  This scenario should not happen under normal circumstances and may indicate bad data in the system.
  * Travis Schneberger on Wed, 29 Apr 2015 15:18:45 -0400 [View Commit](../../commit/81e13a9a03d04e0e7aa131551524721ac16d239b)
* RESKC-361 avoiding a resource leak that was indicated by a OJB warning message.
  * Travis Schneberger on Wed, 29 Apr 2015 15:19:27 -0400 [View Commit](../../commit/8e50c6bbd1a73be876acadf5d8f17b0d5463495c)
* Omit questionnaires when related forms are not marked as included
  * Joe Williams on Wed, 29 Apr 2015 15:54:10 -0500 [View Commit](../../commit/d4ddf1ced13386c23d87a53b8b9c348d616c8d6c)
* Set bounds on DevelopmentProposal lookups

  * When tested originally we were able to repo a outofmemory error and the search taking a LONG time. By setting bounds on the search always the search returns rather quickly. Further work needs to be done to resolve problems when a user has limited access to proposals as none may returned as the first 20 returned don't include any they have permission on.
  * blackcathacker on Wed, 29 Apr 2015 14:11:21 -0700 [View Commit](../../commit/479f8b3c87119a205dac441f16ba6dcaa8768215)
* Fix unit test related to: Omit questionnaires when related forms are not marked as included
  * Travis Schneberger on Wed, 29 Apr 2015 19:38:44 -0400 [View Commit](../../commit/32b9392ebb5052ab2c9a79ce76dbfc2c513f5f54)
* Award: Increase system performance on structure with many child accounts
  * Travis Schneberger on Thu, 30 Apr 2015 09:16:14 -0400 [View Commit](../../commit/42e27297087a985e47107aecc2729a60fdb8420e)
* Use awardDocument updated info instead of award

  * Award Time and Money - T&M updates should not alter Award Version update timestamp and user
  * The History view should not reflect the update of the T&M change, but maintain when the award was last updated.
  * Using the awardDocument update timestamp accomplishes this.
  * blackcathacker on Wed, 29 Apr 2015 17:58:30 -0700 [View Commit](../../commit/776c97730929f9f9085e2efc9a3b5f537954dd7a)
*  Refactoring and small unit test to exercise code
  * blackcathacker on Wed, 29 Apr 2015 20:11:52 -0700 [View Commit](../../commit/8bfb47b2ba80b14cbc294503e24062e17a0fe9cc)
* Add contributing file for public contributions
  * blackcathacker on Wed, 29 Apr 2015 10:19:55 -0700 [View Commit](../../commit/dabcec5c3c1d54eec3f3852f5e4f9db92364ebe9)
* Review comment updates for CONTRIB file
  * blackcathacker on Thu, 30 Apr 2015 09:13:52 -0700 [View Commit](../../commit/f20c423660567290a9a07223675d83d31fba7419)
* Editing budget category generates STE

  * User Story: As a system administrator, I want to periodically edit budget categories, so our budget calculations are accurate

  * Steps to Reproduce:

  * 1) System Admin Portal > Maintenance > Budget Category
  * 2) Click the 'search'
  * 3) Click 'edit' next to any result
  * 4) Enter a description on the Document Overview tab and then edit the Description in the Edit Budget Category tab
  * 5) Click either 'submit' or ' blanket approve'

  * Actual results:

  * User is redirected to an Incident Report screen with the following error: Error Details: OJB operation; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column 'budgetCategoryTypeCode' in 'where clause'

  * Expected results:

  * Document should go directly to final and record should be updated with the users changes.

  * User acceptance criteria:

  * Given a system administrator has to edit a budget category, when the appropriate edits are made and submitted, then the budget category is updated with my changes.
  * Joe Williams on Thu, 30 Apr 2015 14:20:24 -0500 [View Commit](../../commit/e95f90171f079a8add01d288fc427a37711b5237)
* Fixed issue of showing latest version of award instead of Active in Awrd
  * heirarchy view.
  * vineeth on Thu, 2 Oct 2014 10:51:48 -0400 [View Commit](../../commit/e30394d9e7f2e5a190b59f2ed88ff8eaf9d26007)
* Negotiation Unassociated Detail Inquiry Title Change fix
  * Joe Williams on Thu, 30 Apr 2015 16:32:05 -0500 [View Commit](../../commit/dc022f5e81122533bae7b702e0fd9164e4876f21)
* https://github.com/kuali/kc/pull/1584
  * KRAFDBCK-12440

  * This enhancement adds a new parameter "IP_INTELLECTUAL_PROPERTY_REVIEW_TAB_ENABLED" to determine whether or not the Intellectual Property Review tab should be shown in IP.
  * Travis Schneberger on Thu, 30 Apr 2015 15:46:24 -0400 [View Commit](../../commit/eb2d937679106ab4bb292c825eccf4d93bf1069b)
* SubAward Status is incorporated instead of Award Status in Subaward tab
  * in Award Document.
  * anumole on Mon, 27 Oct 2014 17:33:28 +0530 [View Commit](../../commit/86a8e980638252e10984a776f98a3d1682d9dda5)
*  Do not regenerate periods if periods already exist!
  * As an award budget user, when I create a rebudget (new version of posted budget with no change to authorized amount), I expect to have all the budget details from the last posted version appear in the rebudget. I should be reducing funds from the existing line items and redistributing that amount to current or new line items, confined to matching the preexisting authorized total.
  * Current (4/29/15) release is not copying the posted budget details to the rebudget; the rebudget is blank, only letting me search for an IP to link details or manually reenter all items. This is not the intended functionality, and not consistent with prior releases.
  * Steps to recreate:
  * Kuali.com demo1 site on 4/29/2015. Award *73-00001, acct id 2533529
  * As Quickstart:
  * Locate an existing award or create a new award with T&M values maintained.
  * Create an initial Award Budget, match to auth total: Actions> submit;
  * As JTester:
  * Action list: Award budget link:Actions> approve the award budget.
  * As Quickstart:
  * Open Award Budget: Actions > post.
  * Open Award > Open Budget Versions
  * To create the rebudget (new AB without change to T&M).
  * -click 'new' to create the rebudget documument
  * result:
  * The new 'rebudget' is not populated with the details entered in the prior approved/posted version.
  * Thus, all the manually entered the details (or modified pulled in PD budget details) are lost, requiring the AB admin to do all the work over again from scratch.
  * The system should be copying the budget line item details forward to the rebudget; users should only be required to shift funds (reduce some line items to rebudget to another) to meet the authorized amount.
  * Rebudget had been working in previous tests: I have done a rebudget where I put in negative value in an existing detail line item to the add that value to another or new line item.
  * Gayathri on Thu, 30 Apr 2015 17:32:16 -0700 [View Commit](../../commit/7c23cc83246c24d0b6f59c6ed96fdfaf4e3cc9d1)
* KRMS - Rule Function 'Incomplete Narrative Rule' has logic reversed

  * The KC KRMS Function "Incomplete Narrative Rule" has logic reversed and is actually checking that narratives are complete.
  * Analogous Coeus function is "Complete Proposal Narratives.
  * Rather than reprogramming the logic of the KC function, the name should be changed to represent what the function actually does.

  * Change name of function to "Complete Narrative Rule"
  * Joe Williams on Thu, 30 Apr 2015 15:43:40 -0500 [View Commit](../../commit/3ebea27d494d8f720ce82cb1e7d8044d67dd089e)
* format currency values with commas

  * Throughout the PD Budget, money values are formatted without any commas (or dollar signs). When populated, money value fields should be formatted with commas and decimal as for currency. And especially when you get into the millions not having the commas becomes a problem.
  * Joe Williams on Thu, 30 Apr 2015 11:24:24 -0500 [View Commit](../../commit/2b6865ce25af2cfc068be4d219f34fda113b3c08)
* Sponsor Award ID label.

  * https://github.com/kuali/kc/pull/1578
  * KRAFDBCK-9468

  * Changing "Sponsor Award" label to "Sponsor Award ID" in Negotiation.
  * Travis Schneberger on Fri, 1 May 2015 14:48:22 -0400 [View Commit](../../commit/9e8c0d664922d138e3a91b41791a86e10325710b)
* Custom data escape.

  * https://github.com/kuali/kc/pull/1579

  * [KRAFDBCK-10749] Escaping custom data values so single quotes don't terminate them early.

  * This fixes being able to break out of custom data values with single quotes in the KNS custom data tag (KRAD does this already).
  * Travis Schneberger on Fri, 1 May 2015 14:54:18 -0400 [View Commit](../../commit/5fa3491f23e46113ccc743465c6c8cd152b6e080)
* Copying award results in read-only award and broken hierarchies

  * This is due to the authorization fields no being populated and only populated during docHandler. Removing this check added fixes this.
  * blackcathacker on Fri, 1 May 2015 15:28:27 -0700 [View Commit](../../commit/a57e6d07e05c851b5dd8ca94a9732c85b504a3c5)
* return user to the subaward document from subaward invoice if subaward invoice was opened from the subaward document

  * Create/open subaward document.
  * Use Add Invoice Button on the Financial tab to open an invoice document.
  * At close, submit, or blanket approve, the user is taken back to the KNS maintenance screen instead of the KRAD portal
  * Joe Williams on Mon, 4 May 2015 11:03:48 -0500 [View Commit](../../commit/7812a240f2dc29d06459dcea768f22822b7bbb21)
* fixes issues with printing s2s forms after proposal has been submitted to s2s

  * As a user, I need to be able to open a previously submitted PD and generate the PDF form files. I use this tool to verify the attachments I uploaded are the same as those in the sponsor's grant image, and to reference when I am preparing a resubmitted version of this research project. In the current release, I cannot generate the PDF forms of a submitted proposal. I get an STE.

  * Steps to reproduce:
  * Locate a submitted proposal (example res-demo1: Proposal #65, doc 5146)
  * Navigate to Basics > S2S Opportunity Search > Forms
  * OR Toolbar > Print > Grants.gov forms
  * Select one or all of the available s2s forms
  * use the Generate the PDF file tool

  * Expected result: the PDF file is generated and can be opened, viewed, saved, etc.
  * Actual result: STE appears onscreen.

  * java.lang.NullPointerException at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController.printForms(ProposalDevelopmentS2SController.java:196) at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController$$FastClassBySpringCGLIB$$5f5dd18.invoke(<generated>) at
  * Joe Williams on Mon, 4 May 2015 16:26:12 -0500 [View Commit](../../commit/328288555a35833ae16ac9cecbd25e8774b25bab)
* Oracle fixes
  * Our oracle installation scripts had a few issues.
  * 1. The anonymous block was assuming there was only one record in the subawards table while there could be more than one.
  * 2. Constraint was being applied in the wrong order.
  * The errors were
  * ADD CONSTRAINT FK3_BUDGET_SUB_AWARDS
                   *
  * ERROR at line 2:
  * ORA-02298: cannot validate (MG1504.FK3_BUDGET_SUB_AWARDS) - parent keys not
  * found

  * DECLARE
*
  * ERROR at line 1:
  * ORA-01422: exact fetch returns more than requested number of rows
  * ORA-06512: at line 7
  * Gayathri on Mon, 4 May 2015 13:59:37 -0700 [View Commit](../../commit/ced5293396f1b9f30c9de75d5cd212f0448782de)
* fixes STE when editing or adding sponsor templates

  * Maintenance > Awards > Sponsor Template > Create New.
  * Selected and added all required fields in each section:
  * -edit sponsor template - filled in all

    edit sponsor contacts - added a contact
    edit sponsor comments - added a comment
    -edit sponsor template reports - added a report type
    added a report recipient
    Tried to save; got STE

  * java.lang.RuntimeException: Unable to resolve collection property: class org.kuali.kra.award.home.AwardTemplate:templateContacts
  * org.kuali.rice.kns.service.impl.BusinessObjectAuthorizationServiceImpl.addMaintainableItemRestrictions(BusinessObjectAuthorizationServiceImpl.java:519)
  * Joe Williams on Tue, 5 May 2015 09:53:12 -0500 [View Commit](../../commit/1d0c82975d545371f0d51acd847a39f1148e0160)
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * This re-implements some changes to the QuestionResolver code that we contributed before, and which made it into KC 5.2.1 but seem to have been left out of KC 6.0. It also includes a couple of our additional improvements/fixes to the QuestionResolver functionality, such as using the module sub item key when retrieving Answer Headers, filtering retrieved Answer Headers to only include those for the latest versions of Questionnaires, and making sure the Question Seq Id comparison is properly comparing String values.
  * Travis Schneberger on Thu, 30 Apr 2015 12:08:09 -0400 [View Commit](../../commit/04e5d1096c40f9392da2b372b44fb7448ce0e776)
* Avoid NullPointerException in KRMS when a narrative does not have a narrative status.
  * Travis Schneberger on Tue, 5 May 2015 14:10:01 -0400 [View Commit](../../commit/32dd6eeb4478e1fafdf1cdabd6022d491cc1257d)
* RESKC-291 - Budget summary table ui fix for fa columns
  * bsmith83 on Tue, 5 May 2015 10:10:28 -0700 [View Commit](../../commit/dba0ab3ae66db0a31df76a8ee933668bda14ba05)
*  Accept lower case characters
  * In the S2S opportunity lookup, if user enters any lower case letters as part of the opportunity id, the system returns an error message.
  * The search field should not be case sensitive.
  * Search field is not case sensitive in 5.2.x.
  * Gayathri on Tue, 5 May 2015 10:51:09 -0700 [View Commit](../../commit/26fc0a13fc394ca5a9344d71582d9c505186521d)
* Create and route award placeholder as admin

  * This will avoid the placeholder ever being created as the user who is only trying to create a new award and avoid creating an editable Placeholder as well. This prevents the situation of placeholder award showing up in the users action list as an item to complete. This change also depends on the 'admin' user still existing and still having superuser privileges.
  * blackcathacker on Thu, 30 Apr 2015 15:09:07 -0700 [View Commit](../../commit/992884c355e41320e9b76910cb1561c7accb9b0b)
* Fix character encoding in the app.
  * Create or edit award
  * In a Word document, type in: 'single quote' "double quote" long—dash
  * Cut that from Word and past in Award Title
  * Try to save it.
  * Result:
  * "Errors found in this Section: The Award Title (Title) may only consist of visible characters, spaces, or tabs."
  * And Award title is changed to: â€˜singleâ€™ â€œdoubleâ€ longâ€”dash
  * And if the user keeps saving, the system keeps transforming the characters until the maximum allowed characters are reached and an STE occurs: org.springframework.jdbc.UncategorizedSQLException: OJB operation; uncategorized SQLException for SQL []; SQL state [72000]; error code [12899]; ORA-12899: value too large for column "KCSO"."AWARD"."TITLE" (actual: 250, maximum: 200)
  * Expected Result is that KC accepts 'single quote' "double quote" long—dash.
  * Unless there is some technical reason that KC cannot accept (or transform and accept) these characters, based on how we are handling unicode.
  * Gayathri on Tue, 5 May 2015 09:53:42 -0700 [View Commit](../../commit/dc7f4acb037a248626beaaff8aefcefb8495c1fe)
*  Allow other roles to be assigned in addition to aggregator document level role
  * There should not be a constraint of adding of other roles when aggregator is selected. These roles may be modified by implementing school so it may be necessary for Aggregator to also have any other role, ex: delete proposal.
  * Gayathri on Tue, 5 May 2015 13:01:28 -0700 [View Commit](../../commit/64fb806bb2641bc0a2b06058187671f8e28a496b)
*  Budget null pointer
  * In trying to figure out RESOPS-114, I could not open budget because of a null pointer so I added a null check in the place where I think this is coming from. Not sure if this will fix it but attempting.
  * java.lang.RuntimeException: Exception evaluating expression: #ViewHelper.getDateFromTimeStamp(budget.createTimestamp) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpression(DefaultExpressionEvaluator.java:448) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluatePropertyExpression(DefaultExpressionEvaluator.java:514) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluatePropertyExpressions(DefaultExpressionEvaluator.java:735) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpressionsOnConfigurable(DefaultExpressionEvaluator.java:421)
  * Caused by: java.lang.NullPointerException at org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetViewHelperServiceImpl.getDateFromTimeStamp(ProposalBudgetViewHelperServiceImpl.java:209) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:606) at org.springframework.expression.spel.support.ReflectiveMethodExecutor.execute(ReflectiveMethodExecutor.java:69) at org.springframework.expression.spel.ast.MethodReference.getValueInternal(MethodReference.java:122) at org.springframework.expression.spel.ast.MethodReference.access$000(MethodReference.java:44) at org.springframework.expression.spel.ast.MethodReference$MethodValueRef.getValue(MethodReference.java:258) at org.springframework.expression.spel.ast.CompoundExpression.getValueInternal(CompoundExpression.java:82) at org.springframework.expression.spel.ast.SpelNodeImpl.getValue(SpelNodeImpl.java:93) at org.springframework.expression.spel.standard.SpelExpression.getValue(SpelExpression.java:89) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpression(DefaultExpressionEvaluator.java:445) ... 81 more
  * Gayathri on Tue, 5 May 2015 16:39:57 -0700 [View Commit](../../commit/a020e99dd03db54a2225fe4fd1278d94718043c1)
* Sort Special Review Approval Status Alphabetically
  * Joe Williams on Tue, 5 May 2015 16:41:02 -0500 [View Commit](../../commit/e4d1de92e60910d6df9672992eb93843509d2847)
* Added View Institutionally Maintained Salaries Document Level Role
  * Joe Williams on Thu, 30 Apr 2015 15:27:12 -0500 [View Commit](../../commit/b3e54a17d2bffb04c83cad0bc8f1b5cc15ba89ea)
* validate attachment status when submitting to sponsor

  * There is a parameter for Proposal Development named AUDIT_INCOMPLETE_PROPOSAL_ATTACHMENTS that has the following description:
  * "When set to Y, proposals will be audited for incomplete attachments up to and including sponsor submission. When set to N, incomplete attachments are valid on a proposal up to but excluding sponsor submission."
  * When this flag is set to N, a proposal can be successfully routed with an incomplete attachment, but there is no validation upon submission to sponsor that the status has been set to complete. On the KualiCo QA instance running build 1505.4, I was able to submit a proposal with an incomplete attachment without any warnings or errors; see attached screenshot.
  * In the KC 1504.3 release, there appeared to be some validation logic that was intended to prevent submission with incomplete attachments (in the class org.kuali.coeus.propdev.impl.core.SubmitToSponsorRule) but it was buggy; upon submitting a proposal with an incomplete attachment, the data validation window would pop up but would contain no errors, and the proposal would go into "approved" state but no IP would be generated. So it seems that the logic in SubmitToSponsorRule was partially working, but no indication of this error was given to the user and the proposal was not prevented from entering the "approved" state.
  * In 1505.4 it seems as though this partial validation has been removed.
  * Joe Williams on Tue, 5 May 2015 15:06:35 -0500 [View Commit](../../commit/014644597889f46b2cdbdcca010dfdb53d58dc63)
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * Fixing conversion program
  * Travis Schneberger on Wed, 6 May 2015 14:58:59 -0400 [View Commit](../../commit/6d099d70e752bbc2e43ab3b1526ddf571a734992)
*  Fix term spec to call the right method.
  * If you build an agenda with the costShareAmount term and create a PD with budget, you cannot navigate to the submit or questionnaire pages. Following STE
  * org.kuali.rice.krms.api.engine.TermResolutionException: Unable to plan the resolution of Term([costShareAmount]) [TermResolver=null, parameters={}] at org.kuali.rice.krms.framework.engine.TermResolutionEngineImpl.resolveTerm(TermResolutionEngineImpl.java:121) at org.kuali.rice.krms.framework.engine.BasicExecutionEnvironment.resolveTerm(BasicExecutionEnvironment.java:100) at org.kuali.rice.krms.framework.engine.expression.TermExpression.invoke(TermExpression.java:46) at  org.kuali.coeus.common.impl.krms.KrmsRulesExecutionServiceImpl.runApplicableRules(KrmsRulesExecutionServiceImpl.java:134) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.runApplicableRules(QuestionnaireAnswerServiceImpl.java:799) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.setupChildAnswerIndicator(QuestionnaireAnswerServiceImpl.java:549) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.getQuestionnaireAnswer(QuestionnaireAnswerServiceImpl.java:258) at org.kuali.coeus.common.questionnaire.framework.core.QuestionnaireHelperBase.populateAnswers(QuestionnaireHelperBase.java:163) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.populateQuestionnaires(ProposalDevelopmentViewHelperServiceImpl.java:620) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.prepareSummaryPage(ProposalDevelopmentViewHelperServiceImpl.java:772) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController.navigateToSubmit(ProposalDevelopmentSubmitController.java:244)
  * Gayathri on Wed, 6 May 2015 14:37:13 -0700 [View Commit](../../commit/9e1838e75ed3a9b250c778111506e5d0e173b124)
* When opening subaward for award use edit mode

  * Link to Subaward in the Award funding should open with edit button if user has appropriate role/permissions
  * Award modifiers should be able to edit an existing subaward via the awards module by selecting subawards -> Open subaward and then an edit button. The edit button is currently missing from this page.
  * Steps to Reproduce
  * Open an Award Document that has subaward funding (ex 6703 in https://res-demo1.kuali.co)
  * go to the Subawards panel on Award Tab
  * Click on the Open Subaward link in the Subawards where this awared is a Funding source subpanel.
  * Scroll to the bottom of the subaward document and look for the edit button.
  * RESULT: Only close button appears. Even though user has role/permission to create & edit subawards, the edit button is missing.
  * EXPECTED RESULT: User with appropriate role/permission should see an edit button in the subaward document when opening it via the link from awards. This is similar to how the link from subaward to award works when it opens the award and displays the edit button on the award document.
  * blackcathacker on Wed, 6 May 2015 17:58:23 -0700 [View Commit](../../commit/3de848fa6f829f2f09373bbe57467d7ee130b349)
*  Cleaning up all the other terms
  * While working on this jira, I noticed that the method mapped for the term was wrong. While checking other terms, I found that other terms were mapped wrong as well. So fixing those.
  * Gayathri on Wed, 6 May 2015 15:25:02 -0700 [View Commit](../../commit/06439fc9933399b11c2c33756027c555080a94b2)
* Institutional Proposal with inactive sponsor or prime sponsor.

  * https://github.com/kuali/kc/pull/1581

  * [KRAFDBCK-12386] Disabled hard error on save for inactive Sponsors in IP and replaced with an audit warning.

  * This code change provides a solution to the problem of trying to edit IPs with Sponsors that have been inactivated since the IP was first approved, by replacing the hard save error with an audit warning instead.
  * Travis Schneberger on Mon, 4 May 2015 16:14:41 -0400 [View Commit](../../commit/674046f87b5f66f8b4856a519499787536947ae9)
* When and invalid prime sponsor is entered on an Institutional Proposal Document the Prime Sponsor ID field is not highlighted with an error indicator.
  * Travis Schneberger on Thu, 7 May 2015 09:30:00 -0400 [View Commit](../../commit/4f551c99fbea31a6412efca5f25b455c6f7bae2c)
* Ensure GlobalVariables is updated in IncidentReport

  * The incident report in some cases(clicking cancel button for instance) doesn't update the GlobalVariables user session. This checks for and logs incidents of this nature but also overwrites the GlobalVariables with the request user session to ensure it is up to date.
  * blackcathacker on Thu, 7 May 2015 14:35:41 -0700 [View Commit](../../commit/5cac86e2863da970a4a1db64bce4d1be6ad10c3c)
* Upgrading libraries in preparation for the move to Java 8
  * Travis Schneberger on Fri, 8 May 2015 10:33:46 -0400 [View Commit](../../commit/77db2617239fe2b95f7d24561e6050d9b67d5f10)
* Fixes autocalculate dates error with dates not exactly the same as the period

  * If user adds a budget expense for tba personnel and the dates are not the same as the budget period start and end dates, then the autocalculate does not get dates for any budget items in additional years correct.

steps to reproduce

    create a proposal with basic requirements to start make sure period is for at least two years
    add a budget
    add personnel: one tba data entry assistant and one tba programmer
    give personnel salary
    navigate to assign personnel
    add programmer object code as post-doc
    effort and charge is 100
    period type is calendar
    add the tba data entry personnel
    add data entry personnel object code as post-doc
    change dates to be three months summer (6/1-8/31 of that year)
    effort and charge is 100
    period type is summer
    save and autocalculate periods
    compare period 1 to period 2 and you will see that dates are not for the same months in each of the years.

  * Current Result - Period 2 shows the data entry person and the programmer as starting and ending on the same day when period 1 was set up to show persons starting and ending on different days.

  * Expected result - whatever information (other than amount) entered in period 1 will be the same in out years when user autocalculates, with only the year applicable changing
  * Joe Williams on Thu, 7 May 2015 09:01:38 -0500 [View Commit](../../commit/42654d78a834682b77f2042faa40154d2c40de2b)
* Upgrading libraries in preparation for the move to Java 8: Spring upgrade
  * Travis Schneberger on Mon, 11 May 2015 10:08:06 -0400 [View Commit](../../commit/2be0fe4903074768439f75c43d91ddf95923b5b3)
* Unanswered question audit errors.

  * https://github.com/kuali/kc/pull/1583
  * [KRAFDBCK-12535] Adding error messages to individual incomplete Questionnaire questions when audit mode is active and the questionnaire is mandatory.
  * Travis Schneberger on Wed, 6 May 2015 13:13:57 -0400 [View Commit](../../commit/f12527fbe308d39afd3507fc1dd39e3352c42003)
* Added the ability to view budget summary and print budget forms when proposal is view only

  * As an Approver and an Aggregator, I need to have access to the Budget Printed Reports for all status of proposals.
  * Issue: in the 1504 kuali co release; the Budget > Actions menu (where the Print menu for budget reports is located) does not appear to the user when the proposal is submitted to routing, and stays hidden when the proposal is submitted.
  * For non-s2s proposals, this leaves no method to access budget reports.

  * Scenario:
  * Create a proposal with a detailed budget that is going to an industrial or foundation sponsor.
  * Complete the required information to route the proposal.
  * Submit the proposal to routing.
  * As an APPROVER: attempt to print the Budget Summary Report from the Budget > Actions menu. There is no Action menu.
  * Joe Williams on Mon, 11 May 2015 13:57:44 -0500 [View Commit](../../commit/dcc16aba588d3843832fc0730c6bd545ec05ba19)
* added warning message when abstract detail character limit has been reached

  * In a basic proposal, add an Abstract (Layman Abstract type used for test). Use text generator to get a 50,000-character (with spaces) block of text. Copy/paste into abstract details modal (actually called Add Line). Text is truncated at 49,000 characters (with spaces) with no warning message that not all of the text has been pasted.
  * User Story:
  * As a user, I would like to have a warning message that I have reached a system limit for entering text, especially so that I do not assume my entire selection has been pasted into the limited space.
  * Something like << Data entry for this field is limited to 49,000 characters (with spaces). >> would cover both the situation of a person typing directly into the field and hitting the limit, and a user pasting a block of text from another source.
  * Joe Williams on Mon, 11 May 2015 08:25:23 -0500 [View Commit](../../commit/7a9b5711af404d8c11a9bbbb46246a5c51d263c4)
*  Creating proposal from s2s opportunity
  * Module: Proposal Development/Researcher Portal link
  * Issue: STE when clicking on Create Proposal for S2S Opportunity link
  * User Story: As a proposal creator, I want to click on the link in the portal to Create a Proposal for S2S opportunity so that I can submit via to Grants.gov
  * Given a proposal creator want to create a Proposal for S2S, when I click on the Create Proposal for S2S Opportunity link in the portal, then I open a proposal development document and begin creating proposal.
  * Expected Result: Click on link and create a proposal
  * Actual result: click on link and get error:
  * org.springframework.web.bind.UnsatisfiedServletRequestParameterException: Parameter conditions "methodToCall=preparePrintDialog" not met for actual request parameters: document.developmentProposal.proposalTypeCode={}, document.developmentProposal.ownedByUnitNumber={}, document.developmentProposal.activityTypeCode={}, document.developmentProposal.requestedStartDateInitial={}, document.developmentProposal.requestedEndDateInitial={}, document.developmentProposal.title={}, document.developmentProposal.sponsorCode={}
  * Gayathri on Mon, 11 May 2015 21:04:14 -0700 [View Commit](../../commit/be4d40f7e4eb9bedaa9d74e4679895f4bc66a83e)
* Fixed proposal copy action to keep original performance sites and other organizations

  * Copied Proposals replace the user added organization record with the Applicant Organization data.
  * Steps to Duplicate:
  * 1. Locate a proposal with an added Organization in the Basics > Organizations & Locations > Other Organizations (Example #276 in the res-i1ap.kuali.co) I added University of MD.
  * 2. Copy the Proposal (Example #351)
  * 3. Navigate to Basics > Org &Loc > Other Organizations: the org record matches the Applicant - NOT the U. MD record added by the user in the source proposal.

  * Occurs for Performance Sites as well Other Organizations. To reproduce use steps above for Performance Site Locations instead of Other Organizations
  * Joe Williams on Wed, 13 May 2015 08:57:42 -0500 [View Commit](../../commit/cb61949d861d36007865c2607b96da04dff61ddf)
* Fixes inablility to open committee
  * sanju.b on Mon, 10 Nov 2014 21:32:40 +0530 [View Commit](../../commit/2cbe4e0b22efedd2e1750cc9a162034d70bd4865)
* add close button to IACUC protocols after Submit action

  * Steps:

    Complete an IACUC protocol
    Submit for Review
    Post-processing page appears
    Do not select option to return to portal on Post-processing page
    After processing, Protocol is displayed and message appears ‘Document was successfully submitted."

  * Actual Result:
  * There is then no way to close the protocol.

  * Expected Result:
  * There should be a Close button like there is in IRB protocols. Clicking the Close button should remove any locks on the protocol and return the user to the KRAD Portal.
  * Joe Williams on Tue, 12 May 2015 12:39:57 -0500 [View Commit](../../commit/a560732a9ca958365fc7a0d14f52ad371ace275a)
* Fix modular idc currency validation to allow commas

  * Attempting to verify an RESSUP case, I created a new budget in existing proposal 332, added details, and then synced to the modular budget screen.
  * At Save, I got Errors on all 5 budget periods.
  * The F&A Base field in outlined in Red.
  * The value displayed conforms to the format. Example P1 = 192,496.73

  * With this error, I cannot save, cannot navigate of the screen, cannot return to proposal.
  * The only way I have found to save and safely exit is to delete the F&A Base value entirely for each period.

  * This is the first time I've synced a modular budget since the addition of commas to the numbers.
  * Joe Williams on Tue, 12 May 2015 14:02:46 -0500 [View Commit](../../commit/cbdcfd024fba4f7d2bc1a37aecc458339e4ca354)
* fix to display sponsor name when proposal is view only

  * The proposal opens on the Basics screen where Sponsor field displays the sponsor code but not the sponsor name (see attached screen shot).

  * Expected Result: The sponsor name needs to appear along with the sponsor code.
  * Joe Williams on Wed, 13 May 2015 09:39:54 -0500 [View Commit](../../commit/0a4242d8d3e6a0164e38236cd9a6659b0ee11417)
* scale attachment collections better with page resize

  * The new kualico ui, many of the screens redraw when in edit/add mode, putting several columns/buttons out of the window view, requiring scrolling.

  * When I add attachments, I must now use the scroll bar to find/have access to the Details/Edit/Delete options, as well as other columns (userid/timestamp).
  * If I compress the browser window, there is no compacting or wrapping of any column to aid in using a smaller screen.
  * I have to have the browser window open to at least 14.5 inches to see all the columns. If I compact the left navigation bar to icon mode, I still have to have the window at 13 inches to see all columns. (Chrome on a PC)
  * IE, I was able to see all in a 10.5 inch screen if I used icons for left nav bar.

  * Once a user gets the 10-20 narratives uploaded for an NIH submission, they will need to scroll down to get to the horizontal scroll bar, and then scroll back up to get to the Actions column to edit the attachments.
  * The white space is nice, but the row number column could be smaller, as can the Description column. Any ability to wrap text would also help if a user wanted to/had to work in a smaller window.

  * Can something be done to address the expanding window content? Like allowing these columns to text-wrap? In Add Attachments - reducing the column width of the Description field?
  * Joe Williams on Wed, 13 May 2015 13:42:45 -0500 [View Commit](../../commit/e4c0c7b45f8b50236a02e5d7d62e9e45d7f4ec92)
* Sort Special Review Type Alphabetically
  * Joe Williams on Wed, 13 May 2015 16:11:13 -0500 [View Commit](../../commit/61b40cc2d03e36f9e5ea7cbe6ba57da375908e6c)
* Fixed double headers for cache admin and proposal development documents

  * 1) login as quickstart
  * 2) switch to System Admin Tab (or maintenance tab)
  * 3) Select Action list
  * 4) Open document
  * Result: Double Headers appear
  * Joe Williams on Thu, 14 May 2015 09:55:38 -0500 [View Commit](../../commit/2fe83a31e4911a57708e86cfb1f771f75deeabd6)
* Allow modification of S2S Opportunity anytime before submit

  * Revise selections in S2S Opportunity screen pre- and post-submission
  * As a Superuser or Proposal Approver and Submitter of S2S proposals to Grants.gov, I need to be able revise selections on the S2S Opportunity screen > Opportunity, Forms, and User Attached Forms tabs in proposals that are enroute/under review as well as Approved status, because the Submit to S2S step normally takes place after approval and submit to sponsor.
  * A new permission called 'Modify Proposal Development S2s While Enroute' has been added that controls the ability for a user to make modifications after the proposal is enroute.
  * blackcathacker on Tue, 12 May 2015 20:10:52 -0700 [View Commit](../../commit/5b4625f60f7b28a9f719bb6a47951b2354e83bd0)
* when proposal is view only don't prompt user to save on close

  * User is confused if they enter a proposal in view mode and then select close that the modal asks if they want to save.

  * Steps to Reproduce
  * 1. Login as quickstart. Create proposal.
  * 2. Add user psmock as Viewer Document level.
  * 3. Note proposal number and doc number. Close. Save.
  * 4. Open incognito or private browsing window.
  * 5. Login as psmock.
  * 6. Use Search Proposal link (Researcher menu) to find proposal number
  * 7. Click ‘view’ link.
  * 8. Navigate to one of the other sections.
  * 9. Click close on that screen. Should not get the ‘do you want to save message’.

  * Results: The modal asking the user if they would like to save document displays.
  * Expected Results: Whenever proposal is in view mode It should not generate the modal asking to save when when closing.
  * Joe Williams on Thu, 14 May 2015 11:21:33 -0500 [View Commit](../../commit/c2a77a56286bf1e1b3ee79196fddf4bba8ff6a38)
* fixes STE when cancelling from add instituional proposal lookup

  * 1. Central Admin > Pre-Award > Institutional Proposal
  * 2. Click on plus sign for creating an institutional proposal
  * 3. On the Proposal Log Lookup screen click on the cancel button
  * RESULT: Stack trace error (see below)
  * EXPECTED RESULT: User should be returned to the KRAD window.

  * org.kuali.rice.krad.datadictionary.DataDictionaryException: Unable to find View with id: Kc-LandingPage-RedirectView?forInstitutionalProposal
  * at org.kuali.rice.krad.datadictionary.uif.UifDictionaryIndex.getImmutableViewById(UifDictionaryIndex.java:142)
  * at org.kuali.rice.krad.datadictionary.uif.UifDictionaryIndex.getViewById(UifDictionaryIndex.java:128)
  * Joe Williams on Thu, 14 May 2015 12:38:14 -0500 [View Commit](../../commit/9c26bbd42ab635382b1f0eacb9aa70f6755b14f9)
*  Making field readOnly so the values do not get updated while enroute
  * As a viewer of routing proposals, I navigate to review the included S2S Opportunity Forms. Upon opening this screen, all selected forms to include display as unchecked. Confirmed that the items were checked prior to routing; and remain checked if no one views them. But if the screen is opened prior to submitting to s2s, none of these optional forms & their attachments are being submitted.
  * Tried an alternate method to preview S2S forms via the Toolbar menu. At first opening, the checks were there. But when I reopened the toolbar print option in the same session - the checkmarks were gone.
  * This is a serious problem.
  * OSP Admins always verify that the users have checked the correct s2s forms to include, and print/preview some attachments as part of their review from this screen.

  * Created and submitted by user rhanlon
  * PA-C-R01 with Detailed Budget and Subaward Budget selected as optional forms.
  * Confirmed checks prior to submitting.
  * As approver RRabbit - logged in, Action List> opened proposal
  * Navigated to S2S Opportunity screen > Forms - all optional forms unchecked.
  * Gayathri on Thu, 14 May 2015 14:46:01 -0700 [View Commit](../../commit/0ea3178b4ee77c0cd5074cbc3c78b1ff90404762)
* Upgrading to Java 8: updating libraries, documentation, fixing test.
  * Travis Schneberger on Thu, 14 May 2015 21:18:16 -0400 [View Commit](../../commit/96c7e65fb0f166ead4e30826416721560f3a9854)
* Upgrading to Java 8: fixing javadoc errors from Java 8's strict javadoc tool
  * Travis Schneberger on Fri, 15 May 2015 09:27:28 -0400 [View Commit](../../commit/d681620f0f5808b553395d8b62f29af8958faa22)
* Upgrading to Java 8: upgrading jmock
  * Travis Schneberger on Fri, 15 May 2015 11:20:12 -0400 [View Commit](../../commit/280ee3568f8742ad1befe9849da8cff6fb5b2e71)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521
  * Adds a Multiple Choice question type to the Questionnaire framework. Utilizes a new table to store the multiple choice prompts and descriptions, respectively. Uses the MAX_ANSWERS fields to determine whether the question renders as a set of checkboxes or radio buttons.

  * Additional bugfixes:
* Fixed question deletion causing a constraint violation where a question has an explanation.
* Fixed proper form initialization based on the Response type where the first time a question page was loaded the page would display incorrectly until the response type was changed.
* Fixed the read only display not showing the correct dynamic information based on response type.  This was common when viewing after routing.

  * Other:
  * Cleaned up questionnaire maintenance code that is no longer used as of KC 6.0
  * Added Missing license headers
  * Travis Schneberger on Wed, 13 May 2015 14:54:54 -0400 [View Commit](../../commit/9422724a92bda8496e787abc4ca93e3b95e7eb91)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521

  * code review comments
  * Travis Schneberger on Fri, 15 May 2015 10:43:38 -0400 [View Commit](../../commit/8ecc43ab6555c69c0e48d785b620ba1b48ed7ee4)
* Upgrading to Java 8: switching version of cglib to use an updated/non-repackaged version of asm
  * Travis Schneberger on Fri, 15 May 2015 12:32:24 -0400 [View Commit](../../commit/b8e88dfdd7cab8052fefe36223f54f71a1cf4449)
* Upgrading to Java 8: removing MaxPerm setting since java 8 does not have perm gen space
  * Travis Schneberger on Fri, 15 May 2015 12:46:55 -0400 [View Commit](../../commit/c747ca00a8e0dd01043bc42a9b50b3d5eb3cd84c)
* return user to krad portal when closing a transactional document
  * Joe Williams on Fri, 15 May 2015 10:37:34 -0500 [View Commit](../../commit/3fb76b8f8c1a505707271e2765ee0aa0480af2ff)
* Fix to display correct linked subawards when award is versioned

  * 1. Create and submit a new Award (just complete the required fields to save and submit, no need to do a T&M document)
  * 2. Create a new Subaward, adding the just-created Award as the Funding Source, and then submit the Subaward
  * 3. Observe Medusa from both the Award and Subaward view
  * Actual Behavior: The system displays the linkage between the Award and Subaward from both Medusa views.
  * 4. Create and submit a new Proposal Log document
  * 5. Create and submit a new Institutional Proposal document, using the just-created Proposal Log
  * 6. Search for the just-submitted Award document and click the Edit action button
  * 7. Add the just-created Institutional Proposal as a Funding Proposal
  * 8. Select a Transaction Type
  * 9. Submit the edited Award
  * 10. Observe Medusa from the Award, Institutional Proposal, and Subaward views
  * Actual Behavior: The system does not display the Subaward linkage from either the Award and Institutional Proposal Medusa views. The system does display all linkages from the Subaward Medusa view (see attached screen images).
  * Expected Behavior: The system should display the linkage to the Subaward from both the Award and Institutional Proposal Medusa views.
  * 11. Create a Negotiation, selecting Award, Institutional Proposal, or Subaward for Negotiation Association Type and selecting one of the just-created documents
  * 12. Click Save to finalize the Negotiation
  * 13. Observe Medusa from the Award, Institutional Proposal, Negotiation and Subaward views
  * Actual Behavior: The system does not display the Subaward linkage from the Award, Institutional Proposal, and Negotiation Medusa views. The system does display all linkages from the Subaward Medusa view (see attached screen images).
  * Expected Behavior: The system should display the linkage to the Subaward from the Award, Institutional Proposal, and Negotiation Medusa views.
  * Joe Williams on Fri, 15 May 2015 09:39:13 -0500 [View Commit](../../commit/53db7d44ee996b0ac3408b22bceab708c77babec)
* refactoring and added tests
  * Joe Williams on Fri, 15 May 2015 09:42:08 -0500 [View Commit](../../commit/695a397d36d1a398fc1fce040b5e3aa9041b0931)
* Java 8: Upgrading Drools and MVEL to support Java 8, removing incorrect references to drools string utils
  * Travis Schneberger on Fri, 15 May 2015 15:14:13 -0400 [View Commit](../../commit/f144fab784cfbe0d3998437e52406151b53b267e)
* Java 8: Fixing tests, changing StringUtils api usage to isBlank which is closer to drool's StringUtils isEmpty method.
  * Travis Schneberger on Fri, 15 May 2015 17:02:22 -0400 [View Commit](../../commit/dc938b3641a91ee4b488fe4b7c71fd5db7e3664e)
* Java 8: Fixing drools so that rules files can be loaded from within jars.
  * Travis Schneberger on Fri, 15 May 2015 17:49:07 -0400 [View Commit](../../commit/54be5e8613aa5842803024bc326054a19b51570b)
* Java 8: making is possible to turn off java 8 specific javadoc parm
  * Travis Schneberger on Sun, 17 May 2015 21:20:56 -0400 [View Commit](../../commit/7305c54e5731b274ccf72899117af2edeaeefe36)
* Fix for award error when saving on Payment, Reports & Terms

  * -Create new award
  * -Enter required data on Award tab, save
  * -Go to Payment, Reports & Terms tab
  * -Click save, error occurs

  * This is only happening on new awards.
  * HTTP Status 500 -

  * type Exception report

  * message

  * description The server encountered an internal error that prevented it from fulfilling this request.

  * org.springframework.dao.DataIntegrityViolationException: OJB operation; SQL []; ORA-01400: cannot insert NULL into ("KCSO"."AWARD_REPORT_TRACKING"."LAST_UPDATE_USER")
  * ; nested exception is java.sql.SQLIntegrityConstraintViolationException: ORA-01400: cannot insert NULL into ("KCSO"."AWARD_REPORT_TRACKING"."LAST_UPDATE_USER")
  * Joe Williams on Mon, 18 May 2015 08:49:18 -0500 [View Commit](../../commit/fc05d34448ed466425bc5e731c57673fa6919f2c)
* return to award from award budget if budget was opened from award

  * Open an Award
  * Go to Budget Versions
  * Create or open an Award Budget
  * Perform a budget action such as approve, reject, or even close

  * Actual Results:
  * -User is taken to the Sys Admin portal.

  * Expected Results:
  * -User remains in the Award.
  * Joe Williams on Fri, 15 May 2015 14:59:20 -0500 [View Commit](../../commit/3248d256434f9643a6de6dc94b9134cd27360818)

##coeus-1505.41
* return to award from award budget if budget was opened from award

  * Open an Award
  * Go to Budget Versions
  * Create or open an Award Budget
  * Perform a budget action such as approve, reject, or even close

  * Actual Results:
  * -User is taken to the Sys Admin portal.

  * Expected Results:
  * -User remains in the Award.
  * Joe Williams on Fri, 15 May 2015 14:59:20 -0500 [View Commit](../../commit/5fe248a09e4cc55bceeb24fd7845f951d79f1e0e)

##coeus-1505.40
* No Changes


##coeus-1505.39
* Fix for award error when saving on Payment, Reports & Terms

  * -Create new award
  * -Enter required data on Award tab, save
  * -Go to Payment, Reports & Terms tab
  * -Click save, error occurs

  * This is only happening on new awards.
  * HTTP Status 500 -

  * type Exception report

  * message

  * description The server encountered an internal error that prevented it from fulfilling this request.

  * org.springframework.dao.DataIntegrityViolationException: OJB operation; SQL []; ORA-01400: cannot insert NULL into ("KCSO"."AWARD_REPORT_TRACKING"."LAST_UPDATE_USER")
  * ; nested exception is java.sql.SQLIntegrityConstraintViolationException: ORA-01400: cannot insert NULL into ("KCSO"."AWARD_REPORT_TRACKING"."LAST_UPDATE_USER")
  * Joe Williams on Mon, 18 May 2015 08:49:18 -0500 [View Commit](../../commit/aca0ce6122a5e03405598b0a13d7640e7db17046)

##coeus-1505.38
* Java 8: making is possible to turn off java 8 specific javadoc parm
  * Travis Schneberger on Sun, 17 May 2015 21:20:56 -0400 [View Commit](../../commit/9fabcc7995c78c1f995747dccdfa7950fdc2cb95)

##coeus-1505.37
* No Changes


##coeus-1505.36
* Upgrading to Java 8: updating libraries, documentation, fixing test.
  * Travis Schneberger on Thu, 14 May 2015 21:18:16 -0400 [View Commit](../../commit/b7f1a198b77ea4134c7beedbf898f92ec6378101)
* Upgrading to Java 8: fixing javadoc errors from Java 8's strict javadoc tool
  * Travis Schneberger on Fri, 15 May 2015 09:27:28 -0400 [View Commit](../../commit/09301ace83c6fe888f32ec5f90231e00c5c8d09e)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521
  * Adds a Multiple Choice question type to the Questionnaire framework. Utilizes a new table to store the multiple choice prompts and descriptions, respectively. Uses the MAX_ANSWERS fields to determine whether the question renders as a set of checkboxes or radio buttons.

  * Additional bugfixes:
* Fixed question deletion causing a constraint violation where a question has an explanation.
* Fixed proper form initialization based on the Response type where the first time a question page was loaded the page would display incorrectly until the response type was changed.
* Fixed the read only display not showing the correct dynamic information based on response type.  This was common when viewing after routing.

  * Other:
  * Cleaned up questionnaire maintenance code that is no longer used as of KC 6.0
  * Added Missing license headers
  * Travis Schneberger on Wed, 13 May 2015 14:54:54 -0400 [View Commit](../../commit/39264466a27f087779f1d76b506c89c2bc3f6059)
* Fix to display correct linked subawards when award is versioned

  * 1. Create and submit a new Award (just complete the required fields to save and submit, no need to do a T&M document)
  * 2. Create a new Subaward, adding the just-created Award as the Funding Source, and then submit the Subaward
  * 3. Observe Medusa from both the Award and Subaward view
  * Actual Behavior: The system displays the linkage between the Award and Subaward from both Medusa views.
  * 4. Create and submit a new Proposal Log document
  * 5. Create and submit a new Institutional Proposal document, using the just-created Proposal Log
  * 6. Search for the just-submitted Award document and click the Edit action button
  * 7. Add the just-created Institutional Proposal as a Funding Proposal
  * 8. Select a Transaction Type
  * 9. Submit the edited Award
  * 10. Observe Medusa from the Award, Institutional Proposal, and Subaward views
  * Actual Behavior: The system does not display the Subaward linkage from either the Award and Institutional Proposal Medusa views. The system does display all linkages from the Subaward Medusa view (see attached screen images).
  * Expected Behavior: The system should display the linkage to the Subaward from both the Award and Institutional Proposal Medusa views.
  * 11. Create a Negotiation, selecting Award, Institutional Proposal, or Subaward for Negotiation Association Type and selecting one of the just-created documents
  * 12. Click Save to finalize the Negotiation
  * 13. Observe Medusa from the Award, Institutional Proposal, Negotiation and Subaward views
  * Actual Behavior: The system does not display the Subaward linkage from the Award, Institutional Proposal, and Negotiation Medusa views. The system does display all linkages from the Subaward Medusa view (see attached screen images).
  * Expected Behavior: The system should display the linkage to the Subaward from the Award, Institutional Proposal, and Negotiation Medusa views.
  * Joe Williams on Fri, 15 May 2015 09:39:13 -0500 [View Commit](../../commit/2a483666703e61eb93a8804faeb70d09499497e8)
* Multiple Choice enhancement for contribution.

  * https://github.com/kuali/kc/pull/1582

  * KRAFDBCK-12521

  * code review comments
  * Travis Schneberger on Fri, 15 May 2015 10:43:38 -0400 [View Commit](../../commit/d9690e74dfec73c6431f932aca5d9525a13820ec)
* refactoring and added tests
  * Joe Williams on Fri, 15 May 2015 09:42:08 -0500 [View Commit](../../commit/d489080c07844d78585d69e085c3b5fefe7c93cd)
* Upgrading to Java 8: upgrading jmock
  * Travis Schneberger on Fri, 15 May 2015 11:20:12 -0400 [View Commit](../../commit/2cd5e268c5ab56658c411f870d515ce7e7542925)
* Upgrading to Java 8: switching version of cglib to use an updated/non-repackaged version of asm
  * Travis Schneberger on Fri, 15 May 2015 12:32:24 -0400 [View Commit](../../commit/cb8adf607d85b67a7d71e5defd1b00e0379bc8ac)
* return user to krad portal when closing a transactional document
  * Joe Williams on Fri, 15 May 2015 10:37:34 -0500 [View Commit](../../commit/3e3c3d50c6df0e90ffb3942d3311cb3c0ec245d3)
* Upgrading to Java 8: removing MaxPerm setting since java 8 does not have perm gen space
  * Travis Schneberger on Fri, 15 May 2015 12:46:55 -0400 [View Commit](../../commit/7217b0a4096a69b468ccf40fa2597cc03add0604)
* Java 8: Upgrading Drools and MVEL to support Java 8, removing incorrect references to drools string utils
  * Travis Schneberger on Fri, 15 May 2015 15:14:13 -0400 [View Commit](../../commit/edc26dfe1b6c82769d11c051bae13c155a0dc5f7)
* Java 8: Fixing tests, changing StringUtils api usage to isBlank which is closer to drool's StringUtils isEmpty method.
  * Travis Schneberger on Fri, 15 May 2015 17:02:22 -0400 [View Commit](../../commit/f1645535c21b60a2ca05e6e65e76f050c3275c23)
* Java 8: Fixing drools so that rules files can be loaded from within jars.
  * Travis Schneberger on Fri, 15 May 2015 17:49:07 -0400 [View Commit](../../commit/82f1d2bcc43e389b31b6cab81263bb500dafdea4)

##coeus-1505.35
* No Changes


##coeus-1505.34
* Sort Special Review Type Alphabetically
  * Joe Williams on Wed, 13 May 2015 16:11:13 -0500 [View Commit](../../commit/28424fd6ca9a57554ed4cb0e90b675083e79b78c)
* Allow modification of S2S Opportunity anytime before submit

  * Revise selections in S2S Opportunity screen pre- and post-submission
  * As a Superuser or Proposal Approver and Submitter of S2S proposals to Grants.gov, I need to be able revise selections on the S2S Opportunity screen > Opportunity, Forms, and User Attached Forms tabs in proposals that are enroute/under review as well as Approved status, because the Submit to S2S step normally takes place after approval and submit to sponsor.
  * A new permission called 'Modify Proposal Development S2s While Enroute' has been added that controls the ability for a user to make modifications after the proposal is enroute.
  * blackcathacker on Tue, 12 May 2015 20:10:52 -0700 [View Commit](../../commit/b4e28cabef310cab212cc24275ba42c3da6b7e8d)
* Fixed double headers for cache admin and proposal development documents

  * 1) login as quickstart
  * 2) switch to System Admin Tab (or maintenance tab)
  * 3) Select Action list
  * 4) Open document
  * Result: Double Headers appear
  * Joe Williams on Thu, 14 May 2015 09:55:38 -0500 [View Commit](../../commit/5cfb32530579f088458d6b8bcc342aa69de4688b)
* when proposal is view only don't prompt user to save on close

  * User is confused if they enter a proposal in view mode and then select close that the modal asks if they want to save.

  * Steps to Reproduce
  * 1. Login as quickstart. Create proposal.
  * 2. Add user psmock as Viewer Document level.
  * 3. Note proposal number and doc number. Close. Save.
  * 4. Open incognito or private browsing window.
  * 5. Login as psmock.
  * 6. Use Search Proposal link (Researcher menu) to find proposal number
  * 7. Click ‘view’ link.
  * 8. Navigate to one of the other sections.
  * 9. Click close on that screen. Should not get the ‘do you want to save message’.

  * Results: The modal asking the user if they would like to save document displays.
  * Expected Results: Whenever proposal is in view mode It should not generate the modal asking to save when when closing.
  * Joe Williams on Thu, 14 May 2015 11:21:33 -0500 [View Commit](../../commit/cea4ee4ed5816eff95400775ccc41448f64330d8)
* fixes STE when cancelling from add instituional proposal lookup

  * 1. Central Admin > Pre-Award > Institutional Proposal
  * 2. Click on plus sign for creating an institutional proposal
  * 3. On the Proposal Log Lookup screen click on the cancel button
  * RESULT: Stack trace error (see below)
  * EXPECTED RESULT: User should be returned to the KRAD window.

  * org.kuali.rice.krad.datadictionary.DataDictionaryException: Unable to find View with id: Kc-LandingPage-RedirectView?forInstitutionalProposal
  * at org.kuali.rice.krad.datadictionary.uif.UifDictionaryIndex.getImmutableViewById(UifDictionaryIndex.java:142)
  * at org.kuali.rice.krad.datadictionary.uif.UifDictionaryIndex.getViewById(UifDictionaryIndex.java:128)
  * Joe Williams on Thu, 14 May 2015 12:38:14 -0500 [View Commit](../../commit/f53d8d72fe0eed583664c258863efe2cde34872b)
*  Making field readOnly so the values do not get updated while enroute
  * As a viewer of routing proposals, I navigate to review the included S2S Opportunity Forms. Upon opening this screen, all selected forms to include display as unchecked. Confirmed that the items were checked prior to routing; and remain checked if no one views them. But if the screen is opened prior to submitting to s2s, none of these optional forms & their attachments are being submitted.
  * Tried an alternate method to preview S2S forms via the Toolbar menu. At first opening, the checks were there. But when I reopened the toolbar print option in the same session - the checkmarks were gone.
  * This is a serious problem.
  * OSP Admins always verify that the users have checked the correct s2s forms to include, and print/preview some attachments as part of their review from this screen.

  * Created and submitted by user rhanlon
  * PA-C-R01 with Detailed Budget and Subaward Budget selected as optional forms.
  * Confirmed checks prior to submitting.
  * As approver RRabbit - logged in, Action List> opened proposal
  * Navigated to S2S Opportunity screen > Forms - all optional forms unchecked.
  * Gayathri on Thu, 14 May 2015 14:46:01 -0700 [View Commit](../../commit/2fb0b7106cc3a7670d181a0f8cd34469f53a721b)

##coeus-1505.33
* scale attachment collections better with page resize

  * The new kualico ui, many of the screens redraw when in edit/add mode, putting several columns/buttons out of the window view, requiring scrolling.

  * When I add attachments, I must now use the scroll bar to find/have access to the Details/Edit/Delete options, as well as other columns (userid/timestamp).
  * If I compress the browser window, there is no compacting or wrapping of any column to aid in using a smaller screen.
  * I have to have the browser window open to at least 14.5 inches to see all the columns. If I compact the left navigation bar to icon mode, I still have to have the window at 13 inches to see all columns. (Chrome on a PC)
  * IE, I was able to see all in a 10.5 inch screen if I used icons for left nav bar.

  * Once a user gets the 10-20 narratives uploaded for an NIH submission, they will need to scroll down to get to the horizontal scroll bar, and then scroll back up to get to the Actions column to edit the attachments.
  * The white space is nice, but the row number column could be smaller, as can the Description column. Any ability to wrap text would also help if a user wanted to/had to work in a smaller window.

  * Can something be done to address the expanding window content? Like allowing these columns to text-wrap? In Add Attachments - reducing the column width of the Description field?
  * Joe Williams on Wed, 13 May 2015 13:42:45 -0500 [View Commit](../../commit/4c2a6a84f58b000a37895bf9d5cf1982d09566a4)

##coeus-1505.32
* No Changes


##coeus-1505.31
* No Changes


##coeus-1505.30
* add close button to IACUC protocols after Submit action

  * Steps:

    Complete an IACUC protocol
    Submit for Review
    Post-processing page appears
    Do not select option to return to portal on Post-processing page
    After processing, Protocol is displayed and message appears ‘Document was successfully submitted."

  * Actual Result:
  * There is then no way to close the protocol.

  * Expected Result:
  * There should be a Close button like there is in IRB protocols. Clicking the Close button should remove any locks on the protocol and return the user to the KRAD Portal.
  * Joe Williams on Tue, 12 May 2015 12:39:57 -0500 [View Commit](../../commit/46d635687f3609d414fed881453d6afe30a0c2c3)
* Fix modular idc currency validation to allow commas

  * Attempting to verify an RESSUP case, I created a new budget in existing proposal 332, added details, and then synced to the modular budget screen.
  * At Save, I got Errors on all 5 budget periods.
  * The F&A Base field in outlined in Red.
  * The value displayed conforms to the format. Example P1 = 192,496.73

  * With this error, I cannot save, cannot navigate of the screen, cannot return to proposal.
  * The only way I have found to save and safely exit is to delete the F&A Base value entirely for each period.

  * This is the first time I've synced a modular budget since the addition of commas to the numbers.
  * Joe Williams on Tue, 12 May 2015 14:02:46 -0500 [View Commit](../../commit/42e085fefb89598f7fadf0ccef0adab133eb8445)
* Fixed proposal copy action to keep original performance sites and other organizations

  * Copied Proposals replace the user added organization record with the Applicant Organization data.
  * Steps to Duplicate:
  * 1. Locate a proposal with an added Organization in the Basics > Organizations & Locations > Other Organizations (Example #276 in the res-i1ap.kuali.co) I added University of MD.
  * 2. Copy the Proposal (Example #351)
  * 3. Navigate to Basics > Org &Loc > Other Organizations: the org record matches the Applicant - NOT the U. MD record added by the user in the source proposal.

  * Occurs for Performance Sites as well Other Organizations. To reproduce use steps above for Performance Site Locations instead of Other Organizations
  * Joe Williams on Wed, 13 May 2015 08:57:42 -0500 [View Commit](../../commit/3eb72b26048625fac9a3eb97f17975b16317792a)
* Fixes inablility to open committee
  * sanju.b on Mon, 10 Nov 2014 21:32:40 +0530 [View Commit](../../commit/2940fb7ce4a57e93426b4ebb1151b20f580246c3)
* fix to display sponsor name when proposal is view only

  * The proposal opens on the Basics screen where Sponsor field displays the sponsor code but not the sponsor name (see attached screen shot).

  * Expected Result: The sponsor name needs to appear along with the sponsor code.
  * Joe Williams on Wed, 13 May 2015 09:39:54 -0500 [View Commit](../../commit/c4c21ada04c0b92cc1d48bb309fc4f437bcc5669)

##coeus-1505.29
*  Creating proposal from s2s opportunity
  * Module: Proposal Development/Researcher Portal link
  * Issue: STE when clicking on Create Proposal for S2S Opportunity link
  * User Story: As a proposal creator, I want to click on the link in the portal to Create a Proposal for S2S opportunity so that I can submit via to Grants.gov
  * Given a proposal creator want to create a Proposal for S2S, when I click on the Create Proposal for S2S Opportunity link in the portal, then I open a proposal development document and begin creating proposal.
  * Expected Result: Click on link and create a proposal
  * Actual result: click on link and get error:
  * org.springframework.web.bind.UnsatisfiedServletRequestParameterException: Parameter conditions "methodToCall=preparePrintDialog" not met for actual request parameters: document.developmentProposal.proposalTypeCode={}, document.developmentProposal.ownedByUnitNumber={}, document.developmentProposal.activityTypeCode={}, document.developmentProposal.requestedStartDateInitial={}, document.developmentProposal.requestedEndDateInitial={}, document.developmentProposal.title={}, document.developmentProposal.sponsorCode={}
  * Gayathri on Mon, 11 May 2015 21:04:14 -0700 [View Commit](../../commit/9a9266531eac4e8ccdd16cff9250cc7a2d6326df)

##coeus-1505.28
* added warning message when abstract detail character limit has been reached

  * In a basic proposal, add an Abstract (Layman Abstract type used for test). Use text generator to get a 50,000-character (with spaces) block of text. Copy/paste into abstract details modal (actually called Add Line). Text is truncated at 49,000 characters (with spaces) with no warning message that not all of the text has been pasted.
  * User Story:
  * As a user, I would like to have a warning message that I have reached a system limit for entering text, especially so that I do not assume my entire selection has been pasted into the limited space.
  * Something like << Data entry for this field is limited to 49,000 characters (with spaces). >> would cover both the situation of a person typing directly into the field and hitting the limit, and a user pasting a block of text from another source.
  * Joe Williams on Mon, 11 May 2015 08:25:23 -0500 [View Commit](../../commit/1e81f10f668f432f5875d10ca6751b93360f2f49)

##coeus-1505.27
* No Changes


##coeus-1505.26
* Added the ability to view budget summary and print budget forms when proposal is view only

  * As an Approver and an Aggregator, I need to have access to the Budget Printed Reports for all status of proposals.
  * Issue: in the 1504 kuali co release; the Budget > Actions menu (where the Print menu for budget reports is located) does not appear to the user when the proposal is submitted to routing, and stays hidden when the proposal is submitted.
  * For non-s2s proposals, this leaves no method to access budget reports.

  * Scenario:
  * Create a proposal with a detailed budget that is going to an industrial or foundation sponsor.
  * Complete the required information to route the proposal.
  * Submit the proposal to routing.
  * As an APPROVER: attempt to print the Budget Summary Report from the Budget > Actions menu. There is no Action menu.
  * Joe Williams on Mon, 11 May 2015 13:57:44 -0500 [View Commit](../../commit/f0ee8d85e649106fdcc285b117b096e07d11fc00)

##coeus-1505.25
* Unanswered question audit errors.

  * https://github.com/kuali/kc/pull/1583
  * [KRAFDBCK-12535] Adding error messages to individual incomplete Questionnaire questions when audit mode is active and the questionnaire is mandatory.
  * Travis Schneberger on Wed, 6 May 2015 13:13:57 -0400 [View Commit](../../commit/fb144a4af7ebcbf8d83964ec3b345cb5d1776e07)

##coeus-1505.24
* Upgrading libraries in preparation for the move to Java 8: Spring upgrade
  * Travis Schneberger on Mon, 11 May 2015 10:08:06 -0400 [View Commit](../../commit/b98b9183f9bd0c5f4a754878bc2845b5acc41131)

##coeus-1505.23
* No Changes


##coeus-1505.22
* Fixes autocalculate dates error with dates not exactly the same as the period

  * If user adds a budget expense for tba personnel and the dates are not the same as the budget period start and end dates, then the autocalculate does not get dates for any budget items in additional years correct.

steps to reproduce

    create a proposal with basic requirements to start make sure period is for at least two years
    add a budget
    add personnel: one tba data entry assistant and one tba programmer
    give personnel salary
    navigate to assign personnel
    add programmer object code as post-doc
    effort and charge is 100
    period type is calendar
    add the tba data entry personnel
    add data entry personnel object code as post-doc
    change dates to be three months summer (6/1-8/31 of that year)
    effort and charge is 100
    period type is summer
    save and autocalculate periods
    compare period 1 to period 2 and you will see that dates are not for the same months in each of the years.

  * Current Result - Period 2 shows the data entry person and the programmer as starting and ending on the same day when period 1 was set up to show persons starting and ending on different days.

  * Expected result - whatever information (other than amount) entered in period 1 will be the same in out years when user autocalculates, with only the year applicable changing
  * Joe Williams on Thu, 7 May 2015 09:01:38 -0500 [View Commit](../../commit/f233b94bfc5a0515a308bc90ef0c17ed131938de)
* Upgrading libraries in preparation for the move to Java 8
  * Travis Schneberger on Fri, 8 May 2015 10:33:46 -0400 [View Commit](../../commit/e077f0d99b1538aa7f56cd2f26253a588c87183d)

##coeus-1505.21
* No Changes


##coeus-1505.20
* Ensure GlobalVariables is updated in IncidentReport

  * The incident report in some cases(clicking cancel button for instance) doesn't update the GlobalVariables user session. This checks for and logs incidents of this nature but also overwrites the GlobalVariables with the request user session to ensure it is up to date.
  * blackcathacker on Thu, 7 May 2015 14:35:41 -0700 [View Commit](../../commit/c07238ae057f362a1ee301db6abb0b03fe822586)

##coeus-1505.19
* Institutional Proposal with inactive sponsor or prime sponsor.

  * https://github.com/kuali/kc/pull/1581

  * [KRAFDBCK-12386] Disabled hard error on save for inactive Sponsors in IP and replaced with an audit warning.

  * This code change provides a solution to the problem of trying to edit IPs with Sponsors that have been inactivated since the IP was first approved, by replacing the hard save error with an audit warning instead.
  * Travis Schneberger on Mon, 4 May 2015 16:14:41 -0400 [View Commit](../../commit/f9204cfdc0c565c21f85ade541870f90873269c0)
* When and invalid prime sponsor is entered on an Institutional Proposal Document the Prime Sponsor ID field is not highlighted with an error indicator.
  * Travis Schneberger on Thu, 7 May 2015 09:30:00 -0400 [View Commit](../../commit/f048b27c305a1164ac751e5e308e3793b50bfb70)

##coeus-1505.18
*  Cleaning up all the other terms
  * While working on this jira, I noticed that the method mapped for the term was wrong. While checking other terms, I found that other terms were mapped wrong as well. So fixing those.
  * Gayathri on Wed, 6 May 2015 15:25:02 -0700 [View Commit](../../commit/a8fd87a4556c0b3d44399effcc160b7cf8811a00)

##coeus-1505.17
* When opening subaward for award use edit mode

  * Link to Subaward in the Award funding should open with edit button if user has appropriate role/permissions
  * Award modifiers should be able to edit an existing subaward via the awards module by selecting subawards -> Open subaward and then an edit button. The edit button is currently missing from this page.
  * Steps to Reproduce
  * Open an Award Document that has subaward funding (ex 6703 in https://res-demo1.kuali.co)
  * go to the Subawards panel on Award Tab
  * Click on the Open Subaward link in the Subawards where this awared is a Funding source subpanel.
  * Scroll to the bottom of the subaward document and look for the edit button.
  * RESULT: Only close button appears. Even though user has role/permission to create & edit subawards, the edit button is missing.
  * EXPECTED RESULT: User with appropriate role/permission should see an edit button in the subaward document when opening it via the link from awards. This is similar to how the link from subaward to award works when it opens the award and displays the edit button on the award document.
  * blackcathacker on Wed, 6 May 2015 17:58:23 -0700 [View Commit](../../commit/310ee38bc3b3b082e18658eb41553bfef8b49cba)

##coeus-1505.16
*  Fix term spec to call the right method.
  * If you build an agenda with the costShareAmount term and create a PD with budget, you cannot navigate to the submit or questionnaire pages. Following STE
  * org.kuali.rice.krms.api.engine.TermResolutionException: Unable to plan the resolution of Term([costShareAmount]) [TermResolver=null, parameters={}] at org.kuali.rice.krms.framework.engine.TermResolutionEngineImpl.resolveTerm(TermResolutionEngineImpl.java:121) at org.kuali.rice.krms.framework.engine.BasicExecutionEnvironment.resolveTerm(BasicExecutionEnvironment.java:100) at org.kuali.rice.krms.framework.engine.expression.TermExpression.invoke(TermExpression.java:46) at  org.kuali.coeus.common.impl.krms.KrmsRulesExecutionServiceImpl.runApplicableRules(KrmsRulesExecutionServiceImpl.java:134) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.runApplicableRules(QuestionnaireAnswerServiceImpl.java:799) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.setupChildAnswerIndicator(QuestionnaireAnswerServiceImpl.java:549) at org.kuali.coeus.common.questionnaire.impl.answer.QuestionnaireAnswerServiceImpl.getQuestionnaireAnswer(QuestionnaireAnswerServiceImpl.java:258) at org.kuali.coeus.common.questionnaire.framework.core.QuestionnaireHelperBase.populateAnswers(QuestionnaireHelperBase.java:163) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.populateQuestionnaires(ProposalDevelopmentViewHelperServiceImpl.java:620) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentViewHelperServiceImpl.prepareSummaryPage(ProposalDevelopmentViewHelperServiceImpl.java:772) at org.kuali.coeus.propdev.impl.core.ProposalDevelopmentSubmitController.navigateToSubmit(ProposalDevelopmentSubmitController.java:244)
  * Gayathri on Wed, 6 May 2015 14:37:13 -0700 [View Commit](../../commit/4990388e6b19fecbd00199b3fc777ff8a398b405)

##coeus-1505.15
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * Fixing conversion program
  * Travis Schneberger on Wed, 6 May 2015 14:58:59 -0400 [View Commit](../../commit/f84886cc19d3068f3903be077ab96847ef2ac1d5)

##coeus-1505.14
* Sort Special Review Approval Status Alphabetically
  * Joe Williams on Tue, 5 May 2015 16:41:02 -0500 [View Commit](../../commit/d514c3fa7b68e6b029917f521b2d512f169663b0)
* Added View Institutionally Maintained Salaries Document Level Role
  * Joe Williams on Thu, 30 Apr 2015 15:27:12 -0500 [View Commit](../../commit/70429e355b58b94d74a2fae52eb172df1560ba2f)
* validate attachment status when submitting to sponsor

  * There is a parameter for Proposal Development named AUDIT_INCOMPLETE_PROPOSAL_ATTACHMENTS that has the following description:
  * "When set to Y, proposals will be audited for incomplete attachments up to and including sponsor submission. When set to N, incomplete attachments are valid on a proposal up to but excluding sponsor submission."
  * When this flag is set to N, a proposal can be successfully routed with an incomplete attachment, but there is no validation upon submission to sponsor that the status has been set to complete. On the KualiCo QA instance running build 1505.4, I was able to submit a proposal with an incomplete attachment without any warnings or errors; see attached screenshot.
  * In the KC 1504.3 release, there appeared to be some validation logic that was intended to prevent submission with incomplete attachments (in the class org.kuali.coeus.propdev.impl.core.SubmitToSponsorRule) but it was buggy; upon submitting a proposal with an incomplete attachment, the data validation window would pop up but would contain no errors, and the proposal would go into "approved" state but no IP would be generated. So it seems that the logic in SubmitToSponsorRule was partially working, but no indication of this error was given to the user and the proposal was not prevented from entering the "approved" state.
  * In 1505.4 it seems as though this partial validation has been removed.
  * Joe Williams on Tue, 5 May 2015 15:06:35 -0500 [View Commit](../../commit/9a968d1c2ffad96304f50d3b4fa4d71ff7efb705)

##coeus-1505.13
*  Budget null pointer
  * In trying to figure out RESOPS-114, I could not open budget because of a null pointer so I added a null check in the place where I think this is coming from. Not sure if this will fix it but attempting.
  * java.lang.RuntimeException: Exception evaluating expression: #ViewHelper.getDateFromTimeStamp(budget.createTimestamp) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpression(DefaultExpressionEvaluator.java:448) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluatePropertyExpression(DefaultExpressionEvaluator.java:514) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluatePropertyExpressions(DefaultExpressionEvaluator.java:735) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpressionsOnConfigurable(DefaultExpressionEvaluator.java:421)
  * Caused by: java.lang.NullPointerException at org.kuali.coeus.propdev.impl.budget.core.ProposalBudgetViewHelperServiceImpl.getDateFromTimeStamp(ProposalBudgetViewHelperServiceImpl.java:209) at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:57) at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) at java.lang.reflect.Method.invoke(Method.java:606) at org.springframework.expression.spel.support.ReflectiveMethodExecutor.execute(ReflectiveMethodExecutor.java:69) at org.springframework.expression.spel.ast.MethodReference.getValueInternal(MethodReference.java:122) at org.springframework.expression.spel.ast.MethodReference.access$000(MethodReference.java:44) at org.springframework.expression.spel.ast.MethodReference$MethodValueRef.getValue(MethodReference.java:258) at org.springframework.expression.spel.ast.CompoundExpression.getValueInternal(CompoundExpression.java:82) at org.springframework.expression.spel.ast.SpelNodeImpl.getValue(SpelNodeImpl.java:93) at org.springframework.expression.spel.standard.SpelExpression.getValue(SpelExpression.java:89) at org.kuali.rice.krad.uif.view.DefaultExpressionEvaluator.evaluateExpression(DefaultExpressionEvaluator.java:445) ... 81 more
  * Gayathri on Tue, 5 May 2015 16:39:57 -0700 [View Commit](../../commit/c5e10d16d8f151b88c137a77fb54beff47fe6777)

##coeus-1505.12
* No Changes


##coeus-1505.11
*  Allow other roles to be assigned in addition to aggregator document level role
  * There should not be a constraint of adding of other roles when aggregator is selected. These roles may be modified by implementing school so it may be necessary for Aggregator to also have any other role, ex: delete proposal.
  * Gayathri on Tue, 5 May 2015 13:01:28 -0700 [View Commit](../../commit/fd979aa5554c8b42f2fde9412258c2217eb65ca6)

##coeus-1505.10
* Create and route award placeholder as admin

  * This will avoid the placeholder ever being created as the user who is only trying to create a new award and avoid creating an editable Placeholder as well. This prevents the situation of placeholder award showing up in the users action list as an item to complete. This change also depends on the 'admin' user still existing and still having superuser privileges.
  * blackcathacker on Thu, 30 Apr 2015 15:09:07 -0700 [View Commit](../../commit/71b4839cad80c6af75da7987ee5b809b1e474c67)
* RESKC-291 - Budget summary table ui fix for fa columns
  * bsmith83 on Tue, 5 May 2015 10:10:28 -0700 [View Commit](../../commit/16be4d6e78b2d02ba4225f913cf1e925420eb7c4)
*  Accept lower case characters
  * In the S2S opportunity lookup, if user enters any lower case letters as part of the opportunity id, the system returns an error message.
  * The search field should not be case sensitive.
  * Search field is not case sensitive in 5.2.x.
  * Gayathri on Tue, 5 May 2015 10:51:09 -0700 [View Commit](../../commit/23d7d0490af7dddb180a1dc18e9e70cf5595490a)
* Avoid NullPointerException in KRMS when a narrative does not have a narrative status.
  * Travis Schneberger on Tue, 5 May 2015 14:10:01 -0400 [View Commit](../../commit/85e1c3fb8d3d566c0f1ba92759cb9d5a17966572)
* Fix character encoding in the app.
  * Create or edit award
  * In a Word document, type in: 'single quote' "double quote" long—dash
  * Cut that from Word and past in Award Title
  * Try to save it.
  * Result:
  * "Errors found in this Section: The Award Title (Title) may only consist of visible characters, spaces, or tabs."
  * And Award title is changed to: â€˜singleâ€™ â€œdoubleâ€ longâ€”dash
  * And if the user keeps saving, the system keeps transforming the characters until the maximum allowed characters are reached and an STE occurs: org.springframework.jdbc.UncategorizedSQLException: OJB operation; uncategorized SQLException for SQL []; SQL state [72000]; error code [12899]; ORA-12899: value too large for column "KCSO"."AWARD"."TITLE" (actual: 250, maximum: 200)
  * Expected Result is that KC accepts 'single quote' "double quote" long—dash.
  * Unless there is some technical reason that KC cannot accept (or transform and accept) these characters, based on how we are handling unicode.
  * Gayathri on Tue, 5 May 2015 09:53:42 -0700 [View Commit](../../commit/feb6e0869f5dd368b6f2067b53f7e355757c47a4)

##coeus-1505.9
* fixes STE when editing or adding sponsor templates

  * Maintenance > Awards > Sponsor Template > Create New.
  * Selected and added all required fields in each section:
  * -edit sponsor template - filled in all

    edit sponsor contacts - added a contact
    edit sponsor comments - added a comment
    -edit sponsor template reports - added a report type
    added a report recipient
    Tried to save; got STE

  * java.lang.RuntimeException: Unable to resolve collection property: class org.kuali.kra.award.home.AwardTemplate:templateContacts
  * org.kuali.rice.kns.service.impl.BusinessObjectAuthorizationServiceImpl.addMaintainableItemRestrictions(BusinessObjectAuthorizationServiceImpl.java:519)
  * Joe Williams on Tue, 5 May 2015 09:53:12 -0500 [View Commit](../../commit/80823d2cd8b55530839cc34c2aad91b74c3677bd)
* QuestionResolver contribution

  * https://github.com/kuali/kc/pull/1577
  * KRACOEUS-7230

  * This re-implements some changes to the QuestionResolver code that we contributed before, and which made it into KC 5.2.1 but seem to have been left out of KC 6.0. It also includes a couple of our additional improvements/fixes to the QuestionResolver functionality, such as using the module sub item key when retrieving Answer Headers, filtering retrieved Answer Headers to only include those for the latest versions of Questionnaires, and making sure the Question Seq Id comparison is properly comparing String values.
  * Travis Schneberger on Thu, 30 Apr 2015 12:08:09 -0400 [View Commit](../../commit/e8a5e39b895bfb7a425d7f4a1c1597ca8301aa57)

##coeus-1505.8
* Oracle fixes
  * Our oracle installation scripts had a few issues.
  * 1. The anonymous block was assuming there was only one record in the subawards table while there could be more than one.
  * 2. Constraint was being applied in the wrong order.
  * The errors were
  * ADD CONSTRAINT FK3_BUDGET_SUB_AWARDS
                   *
  * ERROR at line 2:
  * ORA-02298: cannot validate (MG1504.FK3_BUDGET_SUB_AWARDS) - parent keys not
  * found

  * DECLARE
*
  * ERROR at line 1:
  * ORA-01422: exact fetch returns more than requested number of rows
  * ORA-06512: at line 7
  * Gayathri on Mon, 4 May 2015 13:59:37 -0700 [View Commit](../../commit/20babdc1852e11501469e4022a466eca3d8d3759)

##coeus-1505.7
* No Changes


##coeus-1505.6
* fixes issues with printing s2s forms after proposal has been submitted to s2s

  * As a user, I need to be able to open a previously submitted PD and generate the PDF form files. I use this tool to verify the attachments I uploaded are the same as those in the sponsor's grant image, and to reference when I am preparing a resubmitted version of this research project. In the current release, I cannot generate the PDF forms of a submitted proposal. I get an STE.

  * Steps to reproduce:
  * Locate a submitted proposal (example res-demo1: Proposal #65, doc 5146)
  * Navigate to Basics > S2S Opportunity Search > Forms
  * OR Toolbar > Print > Grants.gov forms
  * Select one or all of the available s2s forms
  * use the Generate the PDF file tool

  * Expected result: the PDF file is generated and can be opened, viewed, saved, etc.
  * Actual result: STE appears onscreen.

  * java.lang.NullPointerException at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController.printForms(ProposalDevelopmentS2SController.java:196) at org.kuali.coeus.propdev.impl.s2s.ProposalDevelopmentS2SController$$FastClassBySpringCGLIB$$5f5dd18.invoke(<generated>) at
  * Joe Williams on Mon, 4 May 2015 16:26:12 -0500 [View Commit](../../commit/0b9d8a26de48a35bd0d6ac15975f6c019df988bc)

##coeus-1505.5
* return user to the subaward document from subaward invoice if subaward invoice was opened from the subaward document

  * Create/open subaward document.
  * Use Add Invoice Button on the Financial tab to open an invoice document.
  * At close, submit, or blanket approve, the user is taken back to the KNS maintenance screen instead of the KRAD portal
  * Joe Williams on Mon, 4 May 2015 11:03:48 -0500 [View Commit](../../commit/a4d4f6cca622470bc84d6fc5e1cf955bce375cab)

##coeus-1505.4
* No Changes


##coeus-1505.3
* Custom data escape.

  * https://github.com/kuali/kc/pull/1579

  * [KRAFDBCK-10749] Escaping custom data values so single quotes don't terminate them early.

  * This fixes being able to break out of custom data values with single quotes in the KNS custom data tag (KRAD does this already).
  * Travis Schneberger on Fri, 1 May 2015 14:54:18 -0400 [View Commit](../../commit/5a966812b677c0591014020e365e15f1aa532ba4)
* Sponsor Award ID label.

  * https://github.com/kuali/kc/pull/1578
  * KRAFDBCK-9468

  * Changing "Sponsor Award" label to "Sponsor Award ID" in Negotiation.
  * Travis Schneberger on Fri, 1 May 2015 14:48:22 -0400 [View Commit](../../commit/35bfa7ebd1d70a91bc7932ab5ed5937ceb42ca85)
* Copying award results in read-only award and broken hierarchies

  * This is due to the authorization fields no being populated and only populated during docHandler. Removing this check added fixes this.
  * blackcathacker on Fri, 1 May 2015 15:28:27 -0700 [View Commit](../../commit/a250dbabb0184ea44f5a324e02e641d16278813e)

##coeus-1505.2
* No Changes


##coeus-1505.1
* format currency values with commas

  * Throughout the PD Budget, money values are formatted without any commas (or dollar signs). When populated, money value fields should be formatted with commas and decimal as for currency. And especially when you get into the millions not having the commas becomes a problem.
  * Joe Williams on Thu, 30 Apr 2015 11:24:24 -0500 [View Commit](../../commit/c5d86877ac264163546d13cb259231f96de22d37)
* KRMS - Rule Function 'Incomplete Narrative Rule' has logic reversed

  * The KC KRMS Function "Incomplete Narrative Rule" has logic reversed and is actually checking that narratives are complete.
  * Analogous Coeus function is "Complete Proposal Narratives.
  * Rather than reprogramming the logic of the KC function, the name should be changed to represent what the function actually does.

  * Change name of function to "Complete Narrative Rule"
  * Joe Williams on Thu, 30 Apr 2015 15:43:40 -0500 [View Commit](../../commit/e7cb52c9b5bd23ebf1b714c7eb4394a9033ac402)

##coeus-1504.17
* No Changes


##coeus-1504.16
* RESKC-361 avoiding a NullPointerException on proposal copy.

  * When an attachment exists such as a narrative or biography but the attachment does not have attachment data and the proposal attachment is copied with the copy attachments option then a NullPointerException occurs.  This scenario should not happen under normal circumstances and may indicate bad data in the system.
  * Travis Schneberger on Wed, 29 Apr 2015 15:18:45 -0400 [View Commit](../../commit/cf89f15c4f0ef48d29809933eb6d568a1985c462)
* RESKC-361 avoiding a resource leak that was indicated by a OJB warning message.
  * Travis Schneberger on Wed, 29 Apr 2015 15:19:27 -0400 [View Commit](../../commit/3214d06c87af20c54ff046821a1df6e3942db543)
* Omit questionnaires when related forms are not marked as included
  * Joe Williams on Wed, 29 Apr 2015 15:54:10 -0500 [View Commit](../../commit/040f6e167a863d1d8aa30e567f89d97024b69840)
* Set bounds on DevelopmentProposal lookups

  * When tested originally we were able to repo a outofmemory error and the search taking a LONG time. By setting bounds on the search always the search returns rather quickly. Further work needs to be done to resolve problems when a user has limited access to proposals as none may returned as the first 20 returned don't include any they have permission on.
  * blackcathacker on Wed, 29 Apr 2015 14:11:21 -0700 [View Commit](../../commit/5fa5fff9f459bff9db49cdc183685bef9fdca608)
* Fix unit test related to: Omit questionnaires when related forms are not marked as included
  * Travis Schneberger on Wed, 29 Apr 2015 19:38:44 -0400 [View Commit](../../commit/abac58680d59d3ca592e1740159e9b50ed651785)
* Use awardDocument updated info instead of award

  * Award Time and Money - T&M updates should not alter Award Version update timestamp and user
  * The History view should not reflect the update of the T&M change, but maintain when the award was last updated.
  * Using the awardDocument update timestamp accomplishes this.
  * blackcathacker on Wed, 29 Apr 2015 17:58:30 -0700 [View Commit](../../commit/f03dc89bc3732fbfc12ac87ead09987350ff8b84)
*  Refactoring and small unit test to exercise code
  * blackcathacker on Wed, 29 Apr 2015 20:11:52 -0700 [View Commit](../../commit/31c692bece2a7316e85c62af70b319d7f9d5ef3a)
* Award: Increase system performance on structure with many child accounts
  * Travis Schneberger on Thu, 30 Apr 2015 09:16:14 -0400 [View Commit](../../commit/790971bf9c1e21abbfb82d04b78132aafa35a9db)
* Add contributing file for public contributions
  * blackcathacker on Wed, 29 Apr 2015 10:19:55 -0700 [View Commit](../../commit/5a54613840fd271df6650d4ec9ff54180333f254)
* Review comment updates for CONTRIB file
  * blackcathacker on Thu, 30 Apr 2015 09:13:52 -0700 [View Commit](../../commit/b7605bb14d3a16800523ad86ad7da20a7f7939b9)
* Editing budget category generates STE

  * User Story: As a system administrator, I want to periodically edit budget categories, so our budget calculations are accurate

  * Steps to Reproduce:

  * 1) System Admin Portal > Maintenance > Budget Category
  * 2) Click the 'search'
  * 3) Click 'edit' next to any result
  * 4) Enter a description on the Document Overview tab and then edit the Description in the Edit Budget Category tab
  * 5) Click either 'submit' or ' blanket approve'

  * Actual results:

  * User is redirected to an Incident Report screen with the following error: Error Details: OJB operation; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column 'budgetCategoryTypeCode' in 'where clause'

  * Expected results:

  * Document should go directly to final and record should be updated with the users changes.

  * User acceptance criteria:

  * Given a system administrator has to edit a budget category, when the appropriate edits are made and submitted, then the budget category is updated with my changes.
  * Joe Williams on Thu, 30 Apr 2015 14:20:24 -0500 [View Commit](../../commit/261e859ae06470ad7a7d44c7890d80dabf98f23a)
* https://github.com/kuali/kc/pull/1584
  * KRAFDBCK-12440

  * This enhancement adds a new parameter "IP_INTELLECTUAL_PROPERTY_REVIEW_TAB_ENABLED" to determine whether or not the Intellectual Property Review tab should be shown in IP.
  * Travis Schneberger on Thu, 30 Apr 2015 15:46:24 -0400 [View Commit](../../commit/ebc0f36c251b60ca7465d727787126f601c20491)
* Fixed issue of showing latest version of award instead of Active in Awrd
  * heirarchy view.
  * vineeth on Thu, 2 Oct 2014 10:51:48 -0400 [View Commit](../../commit/4fbb3c6a02ac56af40f52424b5e1e56278943a76)
* Negotiation Unassociated Detail Inquiry Title Change fix
  * Joe Williams on Thu, 30 Apr 2015 16:32:05 -0500 [View Commit](../../commit/f42ff59a3949e71d4baf2e46105a574f47d0ff97)
* SubAward Status is incorporated instead of Award Status in Subaward tab
  * in Award Document.
  * anumole on Mon, 27 Oct 2014 17:33:28 +0530 [View Commit](../../commit/f797df76df53b03bef8fc3fd086f4792c7de8367)
*  Do not regenerate periods if periods already exist!
  * As an award budget user, when I create a rebudget (new version of posted budget with no change to authorized amount), I expect to have all the budget details from the last posted version appear in the rebudget. I should be reducing funds from the existing line items and redistributing that amount to current or new line items, confined to matching the preexisting authorized total.
  * Current (4/29/15) release is not copying the posted budget details to the rebudget; the rebudget is blank, only letting me search for an IP to link details or manually reenter all items. This is not the intended functionality, and not consistent with prior releases.
  * Steps to recreate:
  * Kuali.com demo1 site on 4/29/2015. Award *73-00001, acct id 2533529
  * As Quickstart:
  * Locate an existing award or create a new award with T&M values maintained.
  * Create an initial Award Budget, match to auth total: Actions> submit;
  * As JTester:
  * Action list: Award budget link:Actions> approve the award budget.
  * As Quickstart:
  * Open Award Budget: Actions > post.
  * Open Award > Open Budget Versions
  * To create the rebudget (new AB without change to T&M).
  * -click 'new' to create the rebudget documument
  * result:
  * The new 'rebudget' is not populated with the details entered in the prior approved/posted version.
  * Thus, all the manually entered the details (or modified pulled in PD budget details) are lost, requiring the AB admin to do all the work over again from scratch.
  * The system should be copying the budget line item details forward to the rebudget; users should only be required to shift funds (reduce some line items to rebudget to another) to meet the authorized amount.
  * Rebudget had been working in previous tests: I have done a rebudget where I put in negative value in an existing detail line item to the add that value to another or new line item.
  * Gayathri on Thu, 30 Apr 2015 17:32:16 -0700 [View Commit](../../commit/b4489c9e8c93664f560489a4c41e0df1be229683)

##coeus-1504.15
* No Changes


##coeus-1504.14
* release workflow pessimistic locks after approval

  * Approvers receive the following error message after approving proposal development document:

  * This document currently has a 160-PROPOSAL DEVELOPMENT lock owned by KR
  * Joe Williams on Tue, 28 Apr 2015 08:39:16 -0500 [View Commit](../../commit/c85a0f15a28626e69ec1bf61468d2d751afa2fb1)
* set correct update user after editing an institutional proposal

  * Edit an IP
  * The Last Update field appropriately indicates the user that is updating the record while it is open.
  * Approve
  * Close
  * Reopen the IP

  * Actual result: Last update shows as performed by "kr"
  * Expected result: Last update should display user not "kr".
  * Joe Williams on Tue, 28 Apr 2015 09:01:05 -0500 [View Commit](../../commit/05d252067cca63f76fa850383904024a17cb476c)
*  IP versioning should not copy award funding proposals over.
  * When a version of IP is linked to a version of the award, only that version needs to be linked instead of all edits of ths IP beling linked to the award. While displaying the awards linked in IP, display all the IP versions linked to awards.
  * Gayathri on Mon, 27 Apr 2015 11:28:20 -0700 [View Commit](../../commit/d7220558d85e3cdd9889898462c87baedcd797a7)
*  Moving schemaspy feature to public release.

* Moving schemaspy initialization logic and dependency info out of the grm profile
* Making schemaspy a compile-time dependency, with current version
* Adding database script with conditional insert for schemaspy auth
* Adding schemaspy instructions to readme.md
* supporting oracle in schemaspy filter and cleanup
* cleanup of poms
* fix incorrect instructions for instrumentation in readme.md
  * Travis Schneberger on Tue, 28 Apr 2015 10:57:12 -0400 [View Commit](../../commit/12995f562722e950f551547999a069b875014137)

##coeus-1504.13
*  added institutional proposal rest service
  * Joe Williams on Thu, 23 Apr 2015 12:30:06 -0400 [View Commit](../../commit/15f392cb5600d3c13017bc2840d0930f7535e6b0)
*  cleanup
  * Travis Schneberger on Wed, 15 Apr 2015 09:02:54 -0400 [View Commit](../../commit/90f296b210c720b318d9eea90379c57676f3f431)
*  make award date change transactions show up with a transaction id in the various history views and transaction print dropdown menus
  * Travis Schneberger on Wed, 15 Apr 2015 15:42:18 -0400 [View Commit](../../commit/89271da4bc2bdc7ced2643f05b5d46200dbebc66)
*  code review comments
  * Travis Schneberger on Fri, 24 Apr 2015 10:18:51 -0400 [View Commit](../../commit/090ce7405cf9ce13a1efe4704b84b456e0d88f23)
*  resequencing sql scripts, adding oracle script
  * Travis Schneberger on Fri, 24 Apr 2015 10:57:40 -0400 [View Commit](../../commit/497023f9082dd4fc2a659d04c17674cbe267e1a2)
* RESKC_352:clean up proposalHierarchyServiceImpl
  * Joe Williams on Mon, 27 Apr 2015 08:18:52 -0500 [View Commit](../../commit/18e3411729d385aaf45ef68227ee2f02c2fff205)
* Fix Wrong Proposal Status after Proposal Approved at Final Stop and Submitted to Sponsor

  * Create Proposal
  * Submit for Review
  * Do approvals
  * At final stop, approve and then automatic submission to sponsor
  * Actual Result: Status is set to 'Approved Post-Submission'
  * Expected Result: Status is set to 'Approved and Submitted'
  * Joe Williams on Mon, 27 Apr 2015 15:35:26 -0500 [View Commit](../../commit/e886230a92b6eff85f03c7c6281038af0d539cca)
*  depending on new kualico build of jasper token auth jar
  * Travis Schneberger on Mon, 27 Apr 2015 17:26:07 -0400 [View Commit](../../commit/c690912d6b92bd4e13dcfa48e2f9977a980cee9b)

##coeus-1504.12
*  added correct s2s error message and fix it link for congressional district errors

  * The Fix button for Validation error on Congressional District in the Grants.gov Errors section takes you to S2S window; it should take you to Organization Tab where error can be fixed.
  * Joe Williams on Fri, 24 Apr 2015 09:40:05 -0400 [View Commit](../../commit/e43cc0dfc627da384a9d38f44400cce0de94a106)
* Make all xmlstream beans prototype scope

  * XMLStream beans contain state which means they all need to be prototype scope to avoid potential clashes when server is under load
  * blackcathacker on Fri, 24 Apr 2015 10:03:02 -0400 [View Commit](../../commit/99f10d6cdf0244dd1d5fa52e80c334f1aea21cf7)

##coeus-1504.11
* HealthCheck now reports configured version and specific database status
  * blackcathacker on Thu, 16 Apr 2015 17:52:24 -0700 [View Commit](../../commit/0f5d4f83b24c46abeaed8f4ebcb755d47bac10a4)

##coeus-1504.10
* Fix update user and date on attachments in PropDev
  * blackcathacker on Thu, 16 Apr 2015 22:28:17 -0700 [View Commit](../../commit/4d820fb8ab3f8ec8a4b879922b8e77aaa9070ccd)
* Code review comments
  * blackcathacker on Fri, 17 Apr 2015 09:25:18 -0700 [View Commit](../../commit/998b02c569c33888517c6b390099c608af2a4a1f)
* add warning message to autocalculate periods
  * Joe Williams on Fri, 17 Apr 2015 15:32:59 -0500 [View Commit](../../commit/ba6d6074d5f63f4a3e54b722726a8f0e1cb12494)
* Remove duplicately versioned sql files
  * blackcathacker on Wed, 22 Apr 2015 16:43:11 -0400 [View Commit](../../commit/79a52c523bd8a4a0d3a0e420ead15ddc848c5313)
* Fix failing integration tests

  * Integration tests are failing as the controllers were the only things setting the upload information in the attachment. By setting the upload info during pre-persist we make sure the info is never null in integration tests or in the case of additional code paths
  * blackcathacker on Thu, 23 Apr 2015 09:30:24 -0400 [View Commit](../../commit/de24948ab4c31f1f667ec43b6c0c63fe9e23764e)

##coeus-1504.9
* Award Placeholder Document fixes

  * When the placeholder doc was created by creating an award and not copying a hierarchy the resulting document doesn't have a valid award. Specifically no sponsor code which was causing an exception. This checks for the placeholder doc before checking for the sponsor groups.
  * blackcathacker on Wed, 22 Apr 2015 11:33:56 -0400 [View Commit](../../commit/bc28f8e7a6016e15b6b550f1c9c906f1100c8422)

##coeus-1504.8
*  Cleaning up commit. Since we are overriding refreshNonUpdateableReferences anyway, we do not need to override method in rule base. Serialization changes also not needed it appears.
  * Gayathri on Wed, 22 Apr 2015 05:59:13 -0700 [View Commit](../../commit/f888b9beac9a478fa7740bb0af028fcbefa37cbd)

##coeus-1504.7
* fix rolodex persistence through sponsor maintenance document

  * Scenario:
  * 1 - Create a new Sponsor
  * 2 - Add Sponsor and Address details
  * 3 - Submit new Sponsor
  * 4 - Search for new Sponsor and open inquiry.

  * Result:
  * When the inquiry is opened you can see that a new rolodex record has been created but there is no address book information. If you try searching for the address book record, you can only copy the record, not edit it.

  * Expected Behavior:
  * 1 - The address book entry details should be saved when the sponsor record saves.
  * 2 - The address book record should be editable from the address book lookup.
  * Joe Williams on Tue, 21 Apr 2015 18:53:04 -0400 [View Commit](../../commit/03d6db21c678c2728cf9d5ca447cd648b735b891)

##coeus-1504.6
* No Changes


##coeus-1504.5
* added update user to data over history
  * Joe Williams on Fri, 17 Apr 2015 13:58:48 -0500 [View Commit](../../commit/c07944d2ec00d457defeb1ce99ccecec973c7e4a)
* added rolodex and ynq inquiry links to organization inquiry view
  * Joe Williams on Fri, 17 Apr 2015 14:59:43 -0500 [View Commit](../../commit/c7cf6e478b5d2a48414ed0ef7c91c94b3495317e)
* Oracle scripts

  * Bring full oracle scripts renamed and numbered back into the project
  * blackcathacker on Tue, 21 Apr 2015 09:15:55 -0400 [View Commit](../../commit/4df62ebd31a478844448a5e7d0a250953058cfc4)
* Allow sponsor code to be smaller than 6 characters

  * A customer ended up with sponsor codes shorter than 6 characters and since it was allowed by the database and a minimal functional change the sponsor code can now be any alphanumeric up to 6 characters
  * blackcathacker on Tue, 21 Apr 2015 16:02:18 -0400 [View Commit](../../commit/0cc7dfba835c8343524a797e540d6d65871ee780)

##coeus-1504.4
* kc-sql version update
  * blackcathacker on Fri, 17 Apr 2015 21:48:12 -0700 [View Commit](../../commit/e0669b0a138ac093a19a33dde380a4f534762e3c)

##coeus-1504.3
* KRAFDBCK-10988: Adding totals to Negotiation Activity sub-tabs
  * rojlarge on Tue, 7 Apr 2015 18:39:30 -0400 [View Commit](../../commit/c0c22a523dc0f8e0c7361343eb0e03af5a5d4b75)

##coeus-1504.2
*  Adding 1504 mysql and oracle release scripts
  * Gayathri on Fri, 17 Apr 2015 15:23:03 -0700 [View Commit](../../commit/cc29093c62e019bb200c83a02d8088137a407be5)
* renaming files and removing temp files
  * Gayathri on Fri, 17 Apr 2015 15:45:36 -0700 [View Commit](../../commit/bcb851a18f8bbde30d3df87fa1bc4e083debd1c3)
* Documentation for public release and build
  * blackcathacker on Fri, 17 Apr 2015 16:04:52 -0700 [View Commit](../../commit/80748ea9cb76f523f7d50f4a6b975aec7c96263f)
*  Renaming log files to right version
  * Gayathri on Fri, 17 Apr 2015 16:19:58 -0700 [View Commit](../../commit/aaa91348c850f74e22f028619b714954ccb15c6b)

##coeus-1504.1
* moving away from sem ver
  * Travis Schneberger on Fri, 17 Apr 2015 18:30:33 -0400 [View Commit](../../commit/d0596b11edec6e28577a48b08f26ad065304191f)

##coeus-6.0.2.27
* updating dependencies and plugins in pom file
  * Travis Schneberger on Thu, 16 Apr 2015 19:48:55 -0400 [View Commit](../../commit/56974b1f0ed5bd1440569d2ad0b6fbb307e0557b)

##coeus-6.0.2.26
* populated budget formulated costs from unit formulated cost tables
  * Joe Williams on Wed, 15 Apr 2015 09:46:54 -0500 [View Commit](../../commit/47bdb61e409299b37e172b931d8970b6846c435b)
* allow printing of sponsor form when view only
  * Joe Williams on Wed, 15 Apr 2015 13:03:16 -0500 [View Commit](../../commit/d4321526420059f0232fb283391ebb2461d34c03)
* fix report tracking to hide update user and timestamp when date entry hasn't been entered
  * Joe Williams on Thu, 16 Apr 2015 12:20:32 -0500 [View Commit](../../commit/fd64b8d58279084f53791420b1746ae10b73b205)

##coeus-6.0.2.25
* No Changes


##coeus-6.0.2.24
*  upgrade rice
  * Joe Williams on Thu, 16 Apr 2015 08:22:34 -0500 [View Commit](../../commit/8bae0b0bdc31c5833a25aa5f7f42a92c44e8a569)

##coeus-6.0.2.23
* Move rest service dependency out of grm profile

  * The moo and mvel dependencies are always required so move them into the main dependency section
  * blackcathacker on Wed, 15 Apr 2015 17:59:49 -0700 [View Commit](../../commit/985d7f88218dd871624148d4faa2ec84ca152d55)

##coeus-6.0.2.22
* Update rice version
  * Joe Williams on Wed, 15 Apr 2015 17:03:38 -0500 [View Commit](../../commit/bf02c41a3b57ecc550aaf04ee416e959c5debf00)

##coeus-6.0.2.21
*  rice upgrade
  * Gayathri on Wed, 15 Apr 2015 08:37:43 -0700 [View Commit](../../commit/95dc07436f1afb7fcd8d5414ca83801fd943e591)

##coeus-6.0.2.20
*  fixing date calculation
  * Travis Schneberger on Tue, 14 Apr 2015 09:13:19 -0400 [View Commit](../../commit/8d546ff3ffc857bc2507d8f6fe0390a4a26905ff)

##coeus-6.0.2.19
*  moving rejected docs to saved state
  * Gayathri on Mon, 13 Apr 2015 10:34:44 -0700 [View Commit](../../commit/8e741a6bcc9030cd8f0883138b01026eb181f91c)
* review comments
  * Gayathri on Mon, 13 Apr 2015 16:55:43 -0700 [View Commit](../../commit/a1a7ed197223235358f56d9aadbbd8947a77c04f)

##coeus-6.0.2.18
* Update Rice Version
  * blackcathacker on Mon, 13 Apr 2015 14:07:58 -0700 [View Commit](../../commit/aa01f02f4b30a4cef77f9bfe333829eabb27275c)

##coeus-6.0.2.17
*  PSU Award Summary Service
  * blackcathacker on Wed, 18 Feb 2015 15:40:02 -0800 [View Commit](../../commit/a35bf7b3a4d80385e0ccbcdc2cd712bfe35ad371)
* Code review comments and copyright notices
  * blackcathacker on Mon, 13 Apr 2015 13:04:01 -0700 [View Commit](../../commit/c829857a50660bd18ad5a996665f937fdd02bd13)

##coeus-6.0.2.16
* fix people flow member require validation on add line on submit
  * Joe Williams on Mon, 13 Apr 2015 11:11:00 -0500 [View Commit](../../commit/733b6f6a9cd23d536427815261db896f9b2756f5)

##coeus-6.0.2.15
*  fixing key person unit validation
  * Travis Schneberger on Mon, 13 Apr 2015 11:07:51 -0400 [View Commit](../../commit/74065cd3dc7c96c0216ec2235fd8ae2e72d3575a)

##coeus-6.0.2.14
* make personnel details viewable in view mode
  * Joe Williams on Fri, 10 Apr 2015 13:33:55 -0500 [View Commit](../../commit/4f6ab6dd0ef5b843815a615bd91573d9a834c62a)
* make non personnel budget line items detail viewable when budget is readOnly
  * Joe Williams on Fri, 10 Apr 2015 10:44:30 -0500 [View Commit](../../commit/858e55f9b573132f6673f5d4d4c7ddb5f7d32f6e)

##coeus-6.0.2.13
*  upgrading rice
  * Gayathri on Fri, 10 Apr 2015 09:14:14 -0700 [View Commit](../../commit/814d625c456c7c9c12a1dc8d29d0103120264169)
* remove narrative locking region
  * Joe Williams on Fri, 10 Apr 2015 12:38:06 -0500 [View Commit](../../commit/a15fc1881b9d22be5da065cd6e1bf430ab9c4179)
* Jasper Report Links
  * blackcathacker on Fri, 10 Apr 2015 12:41:03 -0700 [View Commit](../../commit/dec341bf9aed3ce0c2f175760636c453e1d0da46)

##coeus-6.0.2.12
* No Changes


##coeus-6.0.2.11
* add warning message when adding a narrative type to the child that is already on the parent
  * Joe Williams on Thu, 9 Apr 2015 09:19:57 -0500 [View Commit](../../commit/f7ddacadd29371782ffa032c7d992cb3edb1464a)
* removed duplicate headers on krms and people flow documents
  * Joe Williams on Fri, 10 Apr 2015 10:08:02 -0500 [View Commit](../../commit/926204a501f784b198b07b46fe70fa887bcef87d)

##coeus-6.0.2.10
* Make PD unit number search field uniform and not restricted
  * blackcathacker on Thu, 9 Apr 2015 22:06:18 -0700 [View Commit](../../commit/f9021255f95f95f159989f5a831eb6209f5c3ab4)

##coeus-6.0.2.9
*  Award authorization issue
  * Gayathri on Thu, 9 Apr 2015 12:11:36 -0700 [View Commit](../../commit/0df17791f67164c47d6b08e4130f8ec49b973c1f)

##coeus-6.0.2.8
* fixed lookups on people flow members section
  * Joe Williams on Thu, 9 Apr 2015 13:42:24 -0500 [View Commit](../../commit/d42d12a23f0eb631ca324174af5702bd26ac670d)

##coeus-6.0.2.7
* make personnel budget line items details viewable when budget is readOnly
  * Joe Williams on Thu, 9 Apr 2015 12:52:40 -0500 [View Commit](../../commit/436b252792a8d6bed66678b6c7b3a95dcabb5b0c)

##coeus-6.0.2.6
*  Budget STE fix
  * Gayathri on Wed, 8 Apr 2015 10:55:26 -0700 [View Commit](../../commit/ba7600fabcee66f9673d8c09fcbddbbc40a65b40)

##coeus-6.0.2.5
*  Add fyi and acknowledge to action list.
  * Gayathri on Wed, 8 Apr 2015 09:21:18 -0700 [View Commit](../../commit/3f8bfb1d44a959edd717a52544ddac1ac492f104)

##coeus-6.0.2.4
* Fix sql to avoid primary key conflicts
  * blackcathacker on Tue, 7 Apr 2015 20:33:23 -0700 [View Commit](../../commit/22a4b96beaed5dc64aba04825f751192094f0e56)

##coeus-6.0.2.3
* Fix attachment problem by never doing orphanRemoval
  * blackcathacker on Tue, 7 Apr 2015 16:50:30 -0700 [View Commit](../../commit/ea2f774303c1b476579ebf90155be07e334a4108)
* Fix integration test
  * blackcathacker on Tue, 7 Apr 2015 18:02:21 -0700 [View Commit](../../commit/d056987b4666d51b996e984854df5904e6381370)

##coeus-6.0.2.2
* rename asdf custrom attribute group name to additional data
  * Joe Williams on Mon, 6 Apr 2015 16:07:16 -0500 [View Commit](../../commit/0c6c27bb02bb3c7543f7338be56f653769fe6665)
* apply unit agenda to all units in hierarchy
  * Joe Williams on Mon, 6 Apr 2015 15:06:51 -0500 [View Commit](../../commit/06939b293f62441f7acf74f549439ec4be32d81b)
*  making PeopleFlow lookup not open in an iframe
  * Travis Schneberger on Tue, 7 Apr 2015 10:47:00 -0400 [View Commit](../../commit/883318884f03f90eab034b83b01f53967b9c2715)
* fix broken test
  * Joe Williams on Tue, 7 Apr 2015 09:57:15 -0500 [View Commit](../../commit/1f8f4ffe0e61702bc04d00f1e41741cb2fa7d259)
*  displaying sponsor award id not sponsor code
  * Travis Schneberger on Tue, 7 Apr 2015 16:23:56 -0400 [View Commit](../../commit/3a5288b201bc8f7540f332c5e6215e3b19a95fe2)
*  nsf cover page 1-6
  * Gayathri on Wed, 25 Mar 2015 12:22:35 -0700 [View Commit](../../commit/b00fdc8f2e00e08da81104485e8502f53b299f4e)
*  updating pom, fixing db scripts that were changed as a part of a code review
  * Travis Schneberger on Tue, 7 Apr 2015 16:58:28 -0400 [View Commit](../../commit/d468f72bc90cdc47f8266e19b7c355fbef075d5b)

##coeus-6.0.2.1
* release process
  * Travis Schneberger on Mon, 6 Apr 2015 21:36:12 -0400 [View Commit](../../commit/7313e436dac0e1dec0d339a982bd13678937e935)

##coeus-6.0.2.0
* KRACOUES-8764:fix additional equipment system generated attachments
  * Joe Williams on Mon, 2 Feb 2015 10:21:53 -0600 [View Commit](../../commit/36480a289ba551da181442a5dc052c9fecb809dd)
* KRACOEUS-8775: next iteration
  * Travis Schneberger on Mon, 2 Feb 2015 17:41:56 -0500 [View Commit](../../commit/154a686f9289c09ae865376763d561c11e068038)
* KRACOEUS-8775: setting the s2sgen lib to next iteration
  * Travis Schneberger on Mon, 2 Feb 2015 17:44:29 -0500 [View Commit](../../commit/defd2f9b95e391079eb3b1f681594d2aeffd0e3d)
* KRACOEUS-8784:make sub award line items non editable from periods page
  * Joe Williams on Tue, 3 Feb 2015 14:23:22 -0600 [View Commit](../../commit/7ea052db65075ce4d3958d30df2fa1005e53a7f4)
* KRACOEUS-8760:moved version and sql info to footer
  * Joe Williams on Fri, 30 Jan 2015 16:30:35 -0600 [View Commit](../../commit/d9b846d119222ba6ead2697277fd63d815b62a5e)
* KRACOEUS-8776: lic header issue
  * Travis Schneberger on Tue, 3 Feb 2015 17:01:14 -0500 [View Commit](../../commit/b29c8f46fd05b1a958ba23b4dbac3febf1025771)
* KRACOEUS-8786:fixed subaward close out date constraint issues
  * Joe Williams on Wed, 4 Feb 2015 08:31:23 -0600 [View Commit](../../commit/b0e5a9abcf8053371659df415c8082422671b645)
* KRACOEUS-8783:allow routing actions for proposals accessed through proposal search
  * Joe Williams on Wed, 4 Feb 2015 09:43:34 -0600 [View Commit](../../commit/bd780608c82c5dcda20fdc637e4cd9dc239c8cfb)
* KRACOEUS-7863
  * Implement Budget Non-Personnel Costs - Formulated Costs
  * rmancher on Wed, 4 Feb 2015 15:54:32 -0500 [View Commit](../../commit/ef3d3ba03a72a3b0596d4dbce870a41a9fa7ee45)
* KRACOEUS-8773: fixing a NPE
  * Travis Schneberger on Wed, 4 Feb 2015 16:07:40 -0500 [View Commit](../../commit/0f6e2b771e5e2d9bfb95401cbb60e75a64d7ccfc)
* KRACOEUS-8789:subaward sync from pdf refreshes details section
  * Joe Williams on Wed, 4 Feb 2015 16:39:15 -0600 [View Commit](../../commit/b20d724872eda17cc19650ce53ee3f5ceb74ecd4)
* CX Version Changes -- Primarily Bug Fixes

  * g diff -w kc-release-5_2_1-tag..rsmart-5.2.1 --stat=999 >! git_diff_kc-release-5_2_1-tag..rsmart-5.2.1_stat.txt

  * Removed all files we do not want to consider for merge

  * normalize changed files we want to merge

  * Create patches for kc-release-5_2_1-tag..rsmart-5.2.1 diffs

  * map relocated path for files that could not be automatically matched

  * Added missing patches from: Create patches for kc-release-5_2_1-tag..rsmart-5.2.1 diffs

  * removed trailing space from patch file

  * basic patch rewriting script ready

squashed some path rewriting logic bugs; smoke testing LGTM

  * ./rewrite_patches.rb

  * add CX_PORTING.md

  * Manually merged `cb38ce9` KualiCo pom.xml changes.

  * Conflicts:
	pom.xml

  * updated CX_PORTING for cx_patches/pom.xml.patch

  * applied cx_patches/src/main/config/kew/xml/2/AwardDocument.xml.patch

  * cx_patches/src/main/config/sql/current/5.2.1/dml/KR_DML_01_KRACOEUS-6640_B000.sql.patch

  * cx_patches/src/main/config/sql/current/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ID.sql.patch

  * cx_patches/src/main/config/sql/current/5.2.1/sequences/KC_SEQ_S2S_USER_ATTD_FORM_ATT_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/0.0.0/dml/KR_DML_01_KCINFR-1018_B000.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/dml/KR_DML_01_KRACOEUS-6640_B000.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ATT_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/sequences/KC_SEQ_S2S_USER_ATTACHED_FORM_ID.sql.patch

  * cx_patches/src/main/config/sql/current_mysql/5.2.1/tables/KC_TBL_CONTACT_USAGE.sql.patch
  * Fixes: Caused by: java.sql.SQLException: Can't create table `coeus`.`#sql-c8e0_78` (errno: 150 "Foreign key constraint is incorrectly formed")
  * Caused by: com.googlecode.flyway.core.command.FlywaySqlScriptException: Error executing statement at line 3: ALTER TABLE CONTACT_USAGE

  * cx_patches/src/main/config/sql/RELEASE-SCRIPTS/KC_Install.sh.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/contacts/AwardSponsorContactAuditRule.java.patch
  * Adding rule to check for Country Code. If a country code is not found, an error is reported and the user is taken to the Award Contacts tab to handle it.
  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/document/authorization/AwardDocumentAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/home/Award.java.patch

  * cx_patches/src/main/java/org/kuali/kra/award/home/AwardAmountInfo.java.patch
  * Default all award amount info amounts to zero when null.
  * Fixes rSmart/issues#503

  * cx_patches/src/main/java/org/kuali/kra/award/lookup/AwardLookupableHelperServiceImpl.java.patch
  * Ignore missing person/entity for https://github.com/rSmart/issues/issues/179

  * cx_patches/src/main/java/org/kuali/kra/award/printing/xmlstream/AwardBaseStream.java.patch
  * Make rolodex country code optional for Award printing.
  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch
  * Adding rule to check for Country Code. If a country code is not found, an error is reported and the user is taken to the Award Contacts tab to handle it.

  * fixes rSmart/issues#448

  * cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardHomeAction.java.patch
  * CCU STE on Document #9532
  * java.lang.NullPointerException
        at org.kuali.kra.award.web.struts.action.AwardHomeAction.save(AwardHomeAction.java:240)
  * https://github.com/rSmart/issues/issues/468

  * Adding null checks to fix NPE.

  * fixes rSmart/issues#270

  * cx_patches/src/main/java/org/kuali/kra/bo/KcPerson.java.patch
  * Return a new empty KcPerson from fromEntityAndPersonId when entity is null.

  * cx_patches/src/main/java/org/kuali/kra/bo/Rolodex.java.patch

  * Commit: edf06332fe7d3cb3940e9353434523fab5d25033
  * Date:   2014-06-30 11:43:17 -0700 (5 months ago)

  * Patching fix from changeset 19864. This patch adds back the isSponsorAddress property to Rolodex. When isSponsorAddress is
  * "N", the behavior changes so the Rolodex reflects the Organization address. For this, organizations had to be added to
  * Rolodex. The maintainable also needed to be modified to recognize isSponsorAddress functionality.

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/bo/RolodexMaintainableImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/bo/UnitAdministrator.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetBaseStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetCumilativeXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/BudgetSummaryXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/printing/xmlstream/IndustrialBudgetXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/budget/web/struts/action/BudgetAction.java.patch
  * java.lang.NullPointerException
        at org.kuali.kra.budget.web.struts.action.BudgetAction.execute(BudgetAction.java:189)
  * https://github.com/rSmart/issues/issues/417

  * cx_patches/src/main/java/org/kuali/kra/coi/disclosure/CoiDisclosureServiceImpl.java.patch
  * Ignore missing person/entity from org.kuali.kra.protocol.ProtocolActionBase.permissions(ProtocolActionBase.java:123)

  * cx_patches/src/main/java/org/kuali/kra/coi/notification/CoiNotificationRoleQualifierServiceImpl.java.patch
  * java.lang.NullPointerException
    at org.kuali.kra.coi.notification.CoiNotificationRoleQualifierServiceImpl.getRoleQualifierValue(CoiNotificationRoleQualifierServiceImpl.java:47)
    at org.kuali.kra.common.notification.NotificationContextBase.populateRoleQualifiers(NotificationContextBase.java:85)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getRoleRecipients(KcNotificationServiceImpl.java:434)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getNotificationRecipients(KcNotificationServiceImpl.java:352)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.fillinNotificationObject(KcNotificationServiceImpl.java:623)
    at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotificationAndPersist(KcNotificationServiceImpl.java:638)
    at org.kuali.kra.coi.personfinancialentity.FinancialEntityAction.sendNotificationAndPersist(FinancialEntityAction.java:444)
    at org.kuali.kra.coi.personfinancialentity.FinancialEntityEditNewAction.submit(FinancialEntityEditNewAction.java:60)

  * Fixes https://github.com/rSmart/issues/issues/377

  * cx_patches/src/main/java/org/kuali/kra/coi/notification/FinancialEntityNotificationRenderer.java.patch
  * java.lang.NullPointerException
    at org.kuali.kra.coi.notification.FinancialEntityNotificationRenderer.getDefaultReplacementParameters(FinancialEntityNotificationRenderer.java:56)
  * Fixes https://github.com/rSmart/issues/issues/377

  * cx_patches/src/main/java/org/kuali/kra/coi/service/impl/CoiMessagesServiceImpl.java.patch
  * When setting ANNUAL_DISCLOSURE_RENEWAL_DATE system parameter, the year is not parsed correctly.
  * https://github.com/rSmart/issues/issues/470

  * Fixes java.lang.NullPointerException in CoiMessagesServiceImpl

  * java.sql.Timestamp.compareTo(Timestamp.java:477)
  * java.sql.Timestamp.before(Timestamp.java:447)
  * org.kuali.kra.coi.service.impl.CoiMessagesServiceImpl.getMessages(CoiMessagesServiceImpl.java:75)

  * Fixes https://github.com/rSmart/issues/issues/240

  * cx_patches/src/main/java/org/kuali/kra/committee/lookup/CommitteeLookupableHelperServiceImpl.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/common/committee/bo/CommitteeBase.java.patch
  * java.lang.NullPointerException
  * at org.kuali.kra.common.committee.bo.CommitteeBase.compareTo(CommitteeBase.java:356)
  * at org.kuali.kra.common.committee.bo.CommitteeBase.compareTo(CommitteeBase.java:38)
  * Fixes https://github.com/rSmart/issues/issues/335

  * cx_patches/src/main/java/org/kuali/kra/common/committee/lookup/CommitteeLookupableHelperServiceImplBase.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/CommitteeScheduleAttachmentsBase.java.patch

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/MeetingActionBase.java.patch
  * NPE When Accessing Meeting Actions Tab on IRB Schedule
  * https://github.com/rSmart/issues/issues/449

  * cx_patches/src/main/java/org/kuali/kra/common/committee/meeting/MeetingActionsActionBase.java.patch
  * java.lang.ArrayIndexOutOfBoundsException: Array index out of range: 0 at java.util.Vector.get(Vector.java:744)
  * at org.kuali.kra.common.committee.meeting.MeetingActionsActionBase.viewAgenda(MeetingActionsActionBase.java:205)
  * Fixes https://github.com/rSmart/issues/issues/307

  * cx_patches/src/main/java/org/kuali/kra/common/committee/notification/AgendaCreatedNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/common/notification/service/impl/KcNotificationServiceImpl.java.patch
  * Fixes https://github.com/rSmart/issues/issues/377

  * org.kuali.rice.core.api.exception.RiceIllegalArgumentException: principalName was blank
        at org.kuali.rice.kim.impl.identity.IdentityServiceImpl.incomingParamCheck(IdentityServiceImpl.java:1566)
        at org.kuali.rice.kim.impl.identity.IdentityServiceImpl.getEntityByPrincipalName(IdentityServiceImpl.java:125)
  * ...
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.getRecipientEmailAddresses(KcNotificationServiceImpl.java:542)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendEmailNotification(KcNotificationServiceImpl.java:524)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotification(KcNotificationServiceImpl.java:184)
        at org.kuali.kra.common.notification.service.impl.KcNotificationServiceImpl.sendNotificationAndPersist(KcNotificationServiceImpl.java:630)
        at org.kuali.kra.coi.personfinancialentity.FinancialEntityAction.sendNotificationAndPersist(FinancialEntityAction.java:444)
        at org.kuali.kra.coi.personfinancialentity.FinancialEntityEditNewAction.submit(FinancialEntityEditNewAction.java:60)

  * Workaround https://github.com/rSmart/issues/issues/158 ; added try/catch to be more forgiving.

  * cx_patches/src/main/java/org/kuali/kra/iacuc/actions/IacucProtocolActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/iacuc/committee/lookup/IacucCommitteeLookupableHelperServiceImpl.java.patch
  * Adding fix so that iacuc committees now use proper url for resume edit

  * fixes rSmart/issues#201

  * cx_patches/src/main/java/org/kuali/kra/iacuc/protocol/IacucProtocolProtocolAction.java.patch
  * Adding fixes specific to IACUC

  * fixes rSmart/issues#299

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/contacts/InstitutionalProposalPerson.java.patch

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/contacts/InstitutionalProposalProjectPersonnelBean.java.patch
  * UMC - NPE when editing a new Institutional Proposal.
  * https://github.com/rSmart/issues/issues/492

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/proposallog/ProposalLogMergeAction.java.patch
  * [SO-27] The session is clearing out the value of the proposal log number before the action can handle it. I switched to by more synchronous
  * using request parameters instead of session data. This is more intuitive to how lookups work anyway. I also added a null check just in case.

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/proposallog/service/impl/ProposalLogServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/service/impl/InstitutionalProposalLookupableHelperServiceImpl.java.patch
  * [SO-27] The session is clearing out the value of the proposal log number before the action can handle it. I switched to by more synchronous
  * using request parameters instead of session data. This is more intuitive to how lookups work anyway. I also added a null check just in case.

  * STE when PD "Submit to Sponsor"
  * java.lang.NullPointerException
  * at org.kuali.kra.institutionalproposal.service.impl.InstitutionalProposalServiceImpl.doBudgetDataFeed(InstitutionalProposalServiceImpl.java:539)
  * Prop Dev submitted. (PD 104)
  * approvals bypassed.
  * try to submit to sponsor as admin.
  * get the following STE.
  * this has happened more than once, but not every time.
  * http://jira.s2.rsmart.com:8080/browse/SO-32

  * cx_patches/src/main/java/org/kuali/kra/institutionalproposal/service/impl/InstitutionalProposalServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/IrbProtocolActionRequestServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/notification/ProtocolWithdrawnNotificationRenderer.java.patch
  * Adding new notification renderer to handle reason and action date types. I tried adding unit tests for this, but they're not working. I'll have to commit those at a later date once I get them to work.

  * fixes rsmart/issues#414

  * cx_patches/src/main/java/org/kuali/kra/irb/actions/ProtocolProtocolActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/irb/protocol/ProtocolProtocolAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/negotiations/notifications/NegotiationNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/document/authorizer/NarrativeReplaceAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/document/authorizer/PersonnelAttachmentReplaceAuthorizer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/notification/ProposalDevelopmentNotificationRenderer.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/rules/ProposalDevelopmentDocumentRule.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/service/impl/ProposalCopyServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/proposaldevelopment/web/struts/form/ProposalDevelopmentForm.java.patch

  * cx_patches/src/main/java/org/kuali/kra/protocol/actions/ActionHelperBase.java.patch

  * cx_patches/src/main/java/org/kuali/kra/protocol/notification/ProtocolReplacementParameters.java.patch

  * cx_patches/src/main/java/org/kuali/kra/questionnaire/answer/QuestionnaireAnswerServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/s2s/service/impl/S2SUtilServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/service/impl/KraAuthorizationServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subaward/web/struts/action/SubAwardAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subaward/web/struts/action/SubAwardActionsAction.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subawardReporting/printing/service/impl/SubAwardPrintingServiceImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/subawardReporting/printing/xmlstream/SubAwardFDPPrintXmlStream.java.patch

  * cx_patches/src/main/java/org/kuali/kra/timeandmoney/transactions/TransactionRuleImpl.java.patch

  * cx_patches/src/main/java/org/kuali/kra/web/filter/PerformanceLoggingFilter.java.patch

  * cx_patches/src/main/java/org/kuali/kra/web/struts/action/KraTransactionalDocumentActionBase.java.patch

  * cx_patches/src/main/resources/ApplicationResources.properties.patch

  * cx_patches/src/main/resources/org/kuali/kra/CoreSpringBeans.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Award.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/AwardPerson.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Budget.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustReportDetails.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustReportType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustRptDefaultParms.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/CustRptTypeDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/DevelopmentProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/docs/RolodexMaintenanceDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/docs/SponsorMaintenanceDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/IacucProtocol.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/InstitutionalProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/InstitutionalProposalPerson.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/LookupableDevelopmentProposal.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Negotiation.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/NegotiationActivity.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/NegotiationUnassociatedDetail.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/ProposalDevelopmentDocument.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Protocol.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Rolodex.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/Sponsor.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SponsorSpecial.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAward.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardCopyRightsType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardCostType.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/datadictionary/SubAwardFundingSource.xml.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/AwardNotice.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/BudgetSummaryTotalPage.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/FDP_Modification_Template.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/printing/stylesheet/FDP_Template_Agreement.xsl.patch

  * cx_patches/src/main/resources/org/kuali/kra/RiceOverridesSpringBeans.xml.patch

  * cx_patches/src/main/resources/repository.xml.patch

  * begin phase 2 of CX merges

  * cx_patches/src/main/config/sql/RELEASE-SCRIPTS/KC_Install.sh.patch pass 2

  * cx_patches/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java.patch

  * updated CX_PORTING for files that cannot be found in pass 2

  * updated CX_PORTING after pass 2 TODO inspection

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/org/kuali/coeus/common/notification/impl/service/impl/KcNotificationServiceImpl.java:[451,16] error: 'catch' without 'try'

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/org/kuali/coeus/common/framework/person/KcPerson.java:[75,29] error: variable LOG is already defined in class KcPerson

  * Revert "cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch"

  * This reverts commit 6602461f15248817d029d055c62b9d694677941d.

  * Conflicts:
	CX_PORTING.md

  * revert changes to cx_patches/src/main/java/org/kuali/kra/award/web/struts/action/AwardActionsAction.java.patch and update CX_PORTING

  * Fixed: AuthTokenGenerator cannot be resolved to a type

  * Fixed: Duplicate field CoiMessagesServiceImpl.LOG

  * Fixed: ProposalPerson cannot be resolved to a type

  * Updated object references for com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java. A couple of errors remain that need attention

  * Fixed: The import org.kuali.kra.bo.Unit cannot be resolved

  * Fixed: Unit cannot be resolved to a type

  * Revert "cx_patches/src/main/java/org/kuali/kra/bo/RolodexMaintainableImpl.java.patch"

  * This reverts commit 3aa4c838aae72ce5f0173761a980fa146db83967.

  * Conflicts:
	CX_PORTING.md

  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java:[111,130] error: cannot find symbol
  * [ERROR] symbol:   method getUnitAdministratorTypeCode()
  * [ERROR] location: class UnitAdministratorType
  * [ERROR] /Develop/Kuali/svn_kuali_org_kc/coeus-impl/src/main/java/com/rsmart/kuali/kra/workflow/UnitAdministratorRoleAttribute.java:[128,135] error: cannot find symbol

  * CX 6 now compiles! w00t! Next bind to our fork of rice

  * bind to CX rice version 2.5.2.0-kualico-SNAPSHOT

  * Fixes: Caused by: java.lang.ClassNotFoundException: com.rsmart.kuali.coeus.data.migration.FlywayMigrator

  * very close to getting CX6 to start

  * Disable HR REST API until we can resolve: org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'hrImportService' defined in class path resource [com/rsmart/kuali/coeus/hr/JerseyBeans.xml]: Instantiation of bean failed; nested exception is org.springframework.beans.BeanInstantiationException: Could not instantiate bean class [com.rsmart.kuali.coeus.hr.service.impl.HRImportServiceImpl]: Constructor threw exception; nested exception is java.lang.NoClassDefFoundError: org/kuali/kra/bo/PersonAppointment

  * Fixes ERROR 1064 (42000) at line 17: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '--creates additional attribute for krms data validation rules

  * Added a quick hack to apply KC6 upgrade SQL/DML

  * updated CX_PORTING with new SQL error info

  * Fixes dml/KC_DML_02_KCINFR-979_B000.sql error

  * Erronous duplicate entry in mysql file

  * updated CX_PORTING.md for REST API progress

  * added todo for REST API spring context errors

  * Manually merged PD authorizer changes into PDDocAuthorizer

  * Merged in changes to KcAuthorizationBase and KcTransDocActionBase

  * resolved REST API startup issue

  * AwardActionsAction merged and other files confirmed

  * Relevant changes from patch applied to Rolodex.java

  * S2SUtil patch changes being applied upstream in KC
  * Lance Speelmon on Tue, 25 Nov 2014 10:53:18 -0700 [View Commit](../../commit/1ae2630486ac0ef911c1ffa8127b9e15ae60d1ce)
* CX Reporting Framework

  * cx_patches/src/main/webapp/WEB-INF/struts-config.xml.patch

  * cx_patches/src/main/webapp/WEB-INF/web.xml.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/reporting/web/struts/action/ReportForwardAction.java.patch

  * cx_patches/src/main/java/com/rsmart/kuali/kra/reporting/web/struts/form/ReportFormwardForm.java.patch
  * Lance Speelmon on Mon, 8 Dec 2014 16:46:02 -0700 [View Commit](../../commit/af713a3c60c7b2ab3c738854ddcd08d1ad16f000)
* CX Skinning Changes from 5.2.1

  * cx_patches/src/main/java/com/rsmart/kuali/kra/web/jstl/PortalFunctions.java.patch

  * cx_patches/src/main/resources/META-INF/kc-config-defaults.xml.patch

  * cx_patches/src/main/webapp/css/bootstrap/css/bootstrap-skinned.css.patch

  * cx_patches/src/main/webapp/css/bootstrap/css/bootstrap.css.patch

  * cx_patches/src/main/webapp/css/bootstrap/*

  * cx_patches/src/main/webapp/css/images/bl-bevel-focus.gif.patch

  * cx_patches/src/main/webapp/css/rsmart.css.patch

  * cx_patches/src/main/webapp/rice-portal/scripts/easyXDM/resize_intermediate.html.patch

  * cx_patches/src/main/webapp/scripts/bootstrap/bootstrap.js.patch

  * cx_patches/src/main/webapp/sponsorHierarchyMaint.jsp.patch

  * cx_patches/src/main/webapp/static/images/checkbox.gif.patch

  * cx_patches/src/main/webapp/static/images/checked.gif.patch

  * cx_patches/src/main/webapp/unitHierarchy.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/award/awardHierarchyAwardActionsAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityEditList.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityEditNew.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/FinancialEntityView.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/coi/ViewNotification.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/iacuc/IacucResearchAreaAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/irb/researchAreaAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingActions.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingCorrespondenceAction.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/IacucMeetingManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingActions.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingCorrespondenceAction.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/meeting/meetingManagement.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/multicampus_dummy_login.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/proposaldevelopment/ProposalDevelopmentKeyPersonnel.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/proposaldevelopment/ProposalDevelopmentProposal.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/jsp/timeandmoney/awardHierarchyTimeAndMoneyAjax.jsp.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/budget/budgetVersions.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/coi/approveAction.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/iacuc/onlinereview/onlineReview.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/infopage.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/irb/onlinereview/onlineReview.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/medusa/medusaNegotiationSummary.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/questionnaire/qnInfopage.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherAwards.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherCompliance.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherPersonnel.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherQuicklinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/researcherReportLinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/channel/unitQuicklinks.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalBody.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalResearcherBody.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tags/rice-portal/portalTabs.tag.patch

  * cx_patches/src/main/webapp/WEB-INF/tlds/portal-func.tld.patch

switch back to more genric version of CX skin

  * replace rsmart logos with kualico
  * Lance Speelmon on Mon, 1 Dec 2014 14:03:22 -0700 [View Commit](../../commit/2cb2af80492a7d8488be14f8bcc05b80e9fd73d8)
* Standardizing version
  * blackcathacker on Tue, 13 Jan 2015 19:57:12 -0800 [View Commit](../../commit/6105b56370890029df004a4ac62aa114f1322d19)
* Updates to sites styles to match cx-qa
  * Brandon Nicholls on Wed, 21 Jan 2015 11:50:32 -0700 [View Commit](../../commit/70c9a2749eed3c541f5659b271b6ce01bf5d3e6a)
* Updates to flyway db conversion
  * blackcathacker on Tue, 3 Feb 2015 12:41:43 -0800 [View Commit](../../commit/03b556e3509b8c5a2c906410fcc17e2492ea0bfd)
* Rewrite login page to assist styling
  * blackcathacker on Thu, 22 Jan 2015 17:18:05 -0800 [View Commit](../../commit/db15cc386c8fdf6fea3b6301357be22d4b5398fd)
* Fixes several styling issues:
* Logo is now the KualiCo logo
* Login page not table based anymore, styled correctly (although still hacked)
* Dropdown menus now look correct on large screens as well as small
* Colors on the proposal screens are now longer red.
  * Brandon Nicholls on Tue, 27 Jan 2015 21:40:08 -0700 [View Commit](../../commit/6f5d666b4dc4a472d17c2ad73754ab2138fc9e6a)
* Repackage com.rsmart
  * blackcathacker on Tue, 3 Feb 2015 17:54:57 -0800 [View Commit](../../commit/6500799ded24611653a7f43ca29d99af41b2fa38)
* CX Merge Code Review Comment Changes
  * blackcathacker on Wed, 4 Feb 2015 11:41:45 -0800 [View Commit](../../commit/0024f17123dd4eb3b7f98e79e20dd63adcfb3f15)
* KRACOEUS-8791: Adding copy info to header
  * Gayathri on Thu, 5 Feb 2015 12:12:39 -0700 [View Commit](../../commit/681017e8fd4adf29bef691f17c85b2d5f36a6321)
* KRACOEUS-7992: adding copy message
  * Gayathri on Thu, 5 Feb 2015 15:01:35 -0700 [View Commit](../../commit/866c1b1e16b1e7d79cbdc3c3ca7109b56e58081f)
* KRACOUES-8792:fixed first period budget copy
  * Joe Williams on Thu, 5 Feb 2015 16:51:34 -0600 [View Commit](../../commit/c84f24c626a0f3bcffddfcdc875a246b03d352eb)
* KRACOEUS-8777:added hierarchy summary to budget module
  * Joe Williams on Thu, 5 Feb 2015 16:59:13 -0600 [View Commit](../../commit/6a7c972a649924e6f2fe54ef094e20b6e890294d)
* KRACOEUS-8799 : Style footer for KualiCo
  * blackcathacker on Thu, 5 Feb 2015 17:34:49 -0800 [View Commit](../../commit/3e137f8236e46611612fda0465f6d9cdb01e9e46)
* KRACOEUS-8782:updated access collection to add with dialog, fixed check that roles have changed
  * Joe Williams on Fri, 6 Feb 2015 08:57:47 -0600 [View Commit](../../commit/77b7a237415ac133a3f3c978ea9ec4dabb173de2)
* KRACOEUS-8777:add missing hierarchybudgetsummary xml
  * Joe Williams on Fri, 6 Feb 2015 09:38:30 -0600 [View Commit](../../commit/ddeef4767f90d78823d609060d60cf0a702ec028)
* KRACOEUS-8796:fix attachment errors preventing canEdit from being evaluated
  * Joe Williams on Fri, 6 Feb 2015 10:12:40 -0600 [View Commit](../../commit/9a2919bd1ad560f40101b3fcb39e0e6fb53df466)
* KRACOEUS-8813: fixing wilcard search
  * Travis Schneberger on Fri, 6 Feb 2015 11:40:54 -0500 [View Commit](../../commit/b3079ac2b27ef71777bfdaf8acb217a7d594393b)
* KRACOEUS-8812:fixed sub award validation error
  * Joe Williams on Fri, 6 Feb 2015 11:17:58 -0600 [View Commit](../../commit/ab0d4124e54a7a3bbdbf177a00074f9ef0b0cc34)
* KRACOEUS-8176
  * Save new line items - budget personnel and non-personnel costs
  * rmancher on Fri, 6 Feb 2015 12:51:31 -0500 [View Commit](../../commit/365819f4f7436bf011a65499d28d4cd192e08275)
* KRACOEUS-8661-fixing personnel sync
  * Gayathri on Fri, 6 Feb 2015 11:45:28 -0700 [View Commit](../../commit/11edfe1104b5ae21b5fe981a6320b08cf61e16bd)
* KRACOEUS-8811: Copy parent changes
  * Gayathri on Fri, 6 Feb 2015 12:27:29 -0700 [View Commit](../../commit/0300c0dda1b7f3cc50c9df39026faaae46f3a96c)
* KRACOEUS-8810:fixed error with non compliance entries not having special review numbers
  * Joe Williams on Fri, 6 Feb 2015 14:38:55 -0600 [View Commit](../../commit/a8a949f31b7212ded0c7d33f1853c0a67305b77b)
* KRACOEUS-8730: Fix copy in view mode
  * Gayathri on Fri, 6 Feb 2015 13:42:07 -0700 [View Commit](../../commit/d49ea5bb0f1d2181dbf6519072ded55bf8b91422)
* KRACOEUS-8820 : Make flyway process configurable
  * blackcathacker on Sat, 7 Feb 2015 23:28:38 -0800 [View Commit](../../commit/b5b6ff7812634ea4d0b94db36c8702ab21c48489)
* KRACOEUS-8817:added create xml to s2s forms page
  * Joe Williams on Mon, 9 Feb 2015 10:41:51 -0600 [View Commit](../../commit/3f10a750c67b1c5f29e9169278db559a8556963f)
* KRACOEUS-8801:add remove from submission to deselect final budget
  * Joe Williams on Mon, 9 Feb 2015 11:36:16 -0600 [View Commit](../../commit/286f70da31a3598cebb4eb11274ad3ed5abe9daf)
* KRACOEUS-8814: adding billing frequency, fixing dd config
  * Travis Schneberger on Mon, 9 Feb 2015 10:32:20 -0500 [View Commit](../../commit/d350ec53a6d05d3474e74d7685beaeac65927003)
* KRACOEUS-8814: deleting sql scripts
  * Travis Schneberger on Mon, 9 Feb 2015 18:30:42 -0500 [View Commit](../../commit/7c762e65956086c235b1c73c7ef8a5146f1fcc2f)
* Revert "KRACOEUS-8814: adding billing frequency, fixing dd config"
  * Travis Schneeberger on Mon, 9 Feb 2015 18:32:53 -0500 [View Commit](../../commit/4093692a6ac9a92993d0c4a30501a15a813ad05d)
* KRACOEUS-8827: returning title
  * Travis Schneberger on Tue, 10 Feb 2015 12:56:00 -0500 [View Commit](../../commit/bb5277eb281bedefeef9c4905a7c6058863036ad)
* KRACOEUS-8829: making krad award lookup use custom lookupable
  * Travis Schneberger on Tue, 10 Feb 2015 18:55:39 -0500 [View Commit](../../commit/6e0b0a1888b1f3914a366d6a625ab5090ac4f716)
* KRACOEUS-6639:code changes for proposal person effort
  * Joe Williams on Thu, 5 Feb 2015 16:48:56 -0600 [View Commit](../../commit/6358143733c126062353a6a5264d27d110878a66)
* KRACOEUS-7942
  * Reset compliance modal.
  * rmancher on Tue, 10 Feb 2015 14:34:37 -0500 [View Commit](../../commit/d4b76c1d8d1998020e9f2e4d039bfbaff6c2576e)
* KRACOEUS-8286
  * Fix to add new period to person salary details when dates change in proposal
  * and default periods are triggered.
  * rmancher on Thu, 5 Feb 2015 11:44:27 -0500 [View Commit](../../commit/9ca70b8dde6e804372c3c4c022a3829ba35414c0)
* KRACOEUS-8833: keyword display fix
  * Gayathri on Wed, 11 Feb 2015 12:43:07 -0700 [View Commit](../../commit/aa6ece39878187077e5edbe5297e174e1796e2cb)
* KRACOEUS-8782:changed access screen add button dynamic to be similiar to key personnel
  * Joe Williams on Wed, 11 Feb 2015 15:21:38 -0600 [View Commit](../../commit/40de74403b250cfeea3961a3200ea63b4cafc17c)
* KRACOEUS-8798: Recall fix
  * Gayathri on Wed, 11 Feb 2015 15:19:56 -0700 [View Commit](../../commit/2bad6c9d84fd9ac02f5b5a6eabff5ab0532319df)
* KRACOEUS-8835: handling delete line from the wizard
  * Travis Schneberger on Wed, 11 Feb 2015 17:35:06 -0500 [View Commit](../../commit/74ec4ecf082dc5e5637b70380431765c2f3608e2)
* KRACOEUS-8832: Linking back
  * Gayathri on Wed, 11 Feb 2015 15:47:33 -0700 [View Commit](../../commit/4145aea9cf3d52b03e0955d40a3085a44a205dd3)
* KRACOEUS-8835: fix cancel button
  * Travis Schneberger on Thu, 12 Feb 2015 07:46:31 -0500 [View Commit](../../commit/7702d508133ab412950a13e6414d8be4edc558bb)
* KRACOEUS-8838: adding missing dd file
  * Travis Schneberger on Thu, 12 Feb 2015 08:54:53 -0500 [View Commit](../../commit/f689f4758b3c211c327a43482e2f123a08cc1ce0)
* KRACOEUS-8761
  * Custom data fields erased when editing Institutional Proposals or Awards
  * rmancher on Thu, 12 Feb 2015 09:48:29 -0500 [View Commit](../../commit/ae7a2246eced3a00815f2e38154ce1cd148e1547)
* KRACOEUS-8826: fixing DD file descriptions
  * Travis Schneberger on Thu, 12 Feb 2015 10:14:18 -0500 [View Commit](../../commit/c6a1c21b8183d08d5d8d3d12d9ddfafc26de1639)
* KRACOEUS-8819: Fixing STE
  * Gayathri on Tue, 10 Feb 2015 13:20:06 -0700 [View Commit](../../commit/fdadea0ffd7af550bbfd1221b6f5055d2d6ed204)
* KRACOEUS-8841: fixing jobCode force uppercase
  * Travis Schneberger on Thu, 12 Feb 2015 11:49:04 -0500 [View Commit](../../commit/7e9fa3528b1261756fa3a8c5bb48aa236642214b)
* KRACOEUS-8301
  * Required fields in custom data is preventing from navigating away from
supplemental information page.
  * rmancher on Thu, 5 Feb 2015 16:24:05 -0500 [View Commit](../../commit/aa036ad77118a40b1877a3447f2b885e1a55acd3)
* KRACOEUS-8842
  * Fix issue - Missing parts of screen on report COI in New projects to disclose
  * rmancher on Thu, 12 Feb 2015 14:47:30 -0500 [View Commit](../../commit/aa9ac53acc3a7d66d24ced90b729c8972b640251)
* KRACOEUS-8815: Fix authorizer
  * Gayathri on Thu, 12 Feb 2015 17:47:41 -0700 [View Commit](../../commit/2639d2171382f75d2060053d394fff39288377c4)
* KRACOEUS-8824 : Auto ingestion changes
  * blackcathacker on Thu, 12 Feb 2015 16:26:04 -0700 [View Commit](../../commit/9b8536d3c2e02b2880b3a0bc8224e98b833bf2b3)
* KRACOEUS-8844: Fixing reject action
  * Gayathri on Thu, 12 Feb 2015 17:53:33 -0700 [View Commit](../../commit/6a6c89efcdb38b7e57c518827e73a7d1657dacf4)
* KRACOEUS-8828:hide s2s opportunity if non-federal sponsor is selected
  * Joe Williams on Tue, 10 Feb 2015 16:15:19 -0600 [View Commit](../../commit/7e3ed1bb2c684f6b126715fa211ed0d828fdd865)
* KRACOEUS-8841:update criteria input field to retreive force upper case from dd attribute defintion
  * Joe Williams on Fri, 13 Feb 2015 11:55:17 -0600 [View Commit](../../commit/8522588893434bce41bf552480a072e7e93e05c0)
* KRACOEUS-8847:add validation to check for multiple units on the same key person
  * Joe Williams on Fri, 13 Feb 2015 15:00:14 -0600 [View Commit](../../commit/d89cdfe65f8f701351ce1c51c2fd4f9fe30fd90e)
* KRACOEUS-8849:perform client side validation on budget navigation
  * Joe Williams on Fri, 13 Feb 2015 15:24:18 -0600 [View Commit](../../commit/429cb74decfcc83a22df67fee3bec93d76990a1a)
* KRACOEUS-8830: removing old files
  * Travis Schneberger on Wed, 11 Feb 2015 10:07:10 -0500 [View Commit](../../commit/1f798e481a3f74e753cf83205617072d5d8308bc)
* KRACOEUS-8830: cleanup, move out grm specific files, setting migration path
  * Travis Schneberger on Fri, 13 Feb 2015 10:43:38 -0500 [View Commit](../../commit/2676d331048081acb13d25fcc6a6cc71a88b2ff1)
* KRACOEUS-8830: moving sql scripts
  * Travis Schneberger on Fri, 13 Feb 2015 10:48:50 -0500 [View Commit](../../commit/e98c9278716bbd83409af7be09486f27180f52f5)
* KRACOEUS-8830: code review comments
  * Travis Schneberger on Fri, 13 Feb 2015 17:16:23 -0500 [View Commit](../../commit/8826a37317b722de934484bef01b01d629447493)
* KRACOEUS-8850: Fix cong districts while copying
  * Gayathri on Fri, 13 Feb 2015 15:25:08 -0700 [View Commit](../../commit/f4998a888d44264cbc84f40d9fbe3e6df3a86b50)
* KRACOEUS-8853: moving data conversion program into kc as a submodule
  * Travis Schneberger on Sat, 14 Feb 2015 11:57:29 -0500 [View Commit](../../commit/3fa7244db48400216cd97424d0c22f55b93b854c)
* KRACOEUS-8837: fixing parameter text
  * Travis Schneberger on Mon, 16 Feb 2015 09:43:43 -0500 [View Commit](../../commit/73abe72776a9a8645c7c33098512d58eb2a44be9)
* KRACOEUS-8454: fix notifications
  * Gayathri on Mon, 16 Feb 2015 08:07:34 -0700 [View Commit](../../commit/614a66ac13d2ec6044bbd021c0f7c6090e7f735a)
* KRACOEUS-8454: Adding SQL
  * Gayathri on Mon, 16 Feb 2015 09:37:08 -0700 [View Commit](../../commit/219679a04a8c9737829af689b6fe8171cf5daae5)
* KRACOEUS-8824 : Fix duplicate current KualiDocument
  * blackcathacker on Mon, 16 Feb 2015 11:05:42 -0800 [View Commit](../../commit/89ab12b325629b7addfd253ca0a942468abdddea)
* KRACOEUS-8824 : Fix duplicate version
  * blackcathacker on Mon, 16 Feb 2015 11:27:01 -0800 [View Commit](../../commit/38f1bf82c7e17a2936d2ca48ea8130c99e9329c1)
* KRACOEUS-8855 : Use more realistic workflow for PD
  * blackcathacker on Mon, 16 Feb 2015 11:54:22 -0800 [View Commit](../../commit/e55925955e02a902144bf9df928035580566c092)
* KRACOEUS-8851:run budget save event when save method is called, fixed issue with non-employee code not being set on new budget person
  * Joe Williams on Mon, 16 Feb 2015 08:33:09 -0600 [View Commit](../../commit/25e170c6cbe957acbaf0dd7f52977c5793b88221)
* KRACOEUS-8840: convert budget periods page to inline editing
  * Joe Williams on Thu, 12 Feb 2015 12:24:35 -0600 [View Commit](../../commit/b84a140d68912968e662843003756473bc019155)
* KRACOEUS-8856: changing message
  * Travis Schneberger on Mon, 16 Feb 2015 16:15:18 -0500 [View Commit](../../commit/50c26e5a2ab6cc530ca6e579ab0bea6fdffdc1d2)
* KRACOEUS-8857:fix styling of add button on subaward page to not display in header of the table
  * Joe Williams on Mon, 16 Feb 2015 15:36:01 -0600 [View Commit](../../commit/4e3ef2d9fa4861773a7242fda85cdb2b879da73a)
* KRACOEUS-8806:disabled subaward view xml if attached file does not contain xml data
  * Joe Williams on Mon, 16 Feb 2015 16:03:35 -0600 [View Commit](../../commit/09e32237e30db33f08c3bd508ad62b5a6212dec5)
* KRACOEUS-8745:added client side file size validation
  * Joe Williams on Mon, 16 Feb 2015 09:26:01 -0600 [View Commit](../../commit/5c22bfd5faa016d1ea0483d0372726f47b71b1a9)
* KRACOEUS-8855 : Code review changes
  * blackcathacker on Mon, 16 Feb 2015 14:38:04 -0800 [View Commit](../../commit/123feac228fe2d12a2935c364f68d79cb150940a)
* KRACOEUS-8860: changing help link
  * Travis Schneberger on Tue, 17 Feb 2015 08:55:19 -0500 [View Commit](../../commit/b640c0324f4985d878baa13126380bb87662289b)
* KRACOEUS-8861:fix progressive navigation to supplement info
  * Joe Williams on Tue, 17 Feb 2015 09:14:48 -0600 [View Commit](../../commit/74caa9abc9edee5e8ab403ca8399cd1d43d79b48)
* KRACOEUS-8862:fix send personnel cert notification buttons to always display, and save personnel when they are sent
  * Joe Williams on Tue, 17 Feb 2015 09:45:48 -0600 [View Commit](../../commit/25f8a157f93808346418bddb07737e2dfc485f32)
* KRACOEUS-8863: changing button text
  * Travis Schneberger on Tue, 17 Feb 2015 10:58:06 -0500 [View Commit](../../commit/936a6420f2d83d23776453c94c8168dea91111f9)
* KRACOEUS-8865: adding budget version
  * Travis Schneberger on Tue, 17 Feb 2015 11:23:28 -0500 [View Commit](../../commit/6b438adb9fbb047f56d9cee26fd8f3e744563c5f)
* ISO-135
  * Gayathri on Tue, 17 Feb 2015 10:28:50 -0700 [View Commit](../../commit/ab01366fed35124d11f2855281cb4163c7abfe0f)
* KRACOEUS-8845: Adding ScaleTwo and ScaleThree decimal support.
  * Gayathri on Mon, 16 Feb 2015 16:32:28 -0700 [View Commit](../../commit/6b6a0ca6a1c5f3b3257c343b98d05b3aac4ac132)
* KRACOEUS-8860: making old portal and new portal use the same help link properties
  * Travis Schneberger on Tue, 17 Feb 2015 12:55:35 -0500 [View Commit](../../commit/68b57ec73e2bc0cdc0bda6d6bc2cbc4d28bd7c45)
* KRACOEUS-8805
  * Budget Settings labels disappear when marked complete
  * rmancher on Tue, 17 Feb 2015 13:43:58 -0500 [View Commit](../../commit/663e502ce022593513764921673b4e9b70c3b6f1)
* SO-138 : Make questionnaire certifcation generic
  * blackcathacker on Tue, 17 Feb 2015 10:46:55 -0800 [View Commit](../../commit/6fcfdb0c9c3e8cbda759d8df9c9f96f59a1fb240)
* KRACOEUS-8846: Question edit fix
  * Gayathri on Tue, 17 Feb 2015 12:58:00 -0700 [View Commit](../../commit/bba344a7045ca0a06422db7c0ec42aff0bf728f6)
* KRACOEUS-8866: increasing column length
  * Travis Schneberger on Tue, 17 Feb 2015 15:14:17 -0500 [View Commit](../../commit/79f2da88961cf53f8ca2bc752fd13268109471df)
* KRACOEUS-8869: prevent PD from opening in iframe
  * Travis Schneberger on Tue, 17 Feb 2015 15:39:37 -0500 [View Commit](../../commit/15c7cd7f1726c4437aa75995901341dd0b9df4aa)
* Set default.htm as an index file so help works when null
  * Even when the help url is null, in the case of a missing help parameter
  * the help index will still show up. Partial fix for rSmart/issues#512
  * blackcathacker on Tue, 17 Feb 2015 13:42:49 -0800 [View Commit](../../commit/132c215f0efdd2067276490813dfb253717e26b6)
* Notification renderer unused
  * Related to investigating rsmart/issues#307 it was noticed this renderer is never referenced or used
  * blackcathacker on Tue, 17 Feb 2015 13:48:24 -0800 [View Commit](../../commit/fcdc0adeae27563e075fdf55fdd78e2ac951959b)
* Workaround OJB bug that causes wrong class to be cached
  * Whenever the Budget.class is cached instead of AwardBudgetExt
  * OJB will only return Budget.class for that ID.

  * Fixes rSmart/issues#510
  * blackcathacker on Tue, 17 Feb 2015 13:54:03 -0800 [View Commit](../../commit/c31c842be236e5dbed45dacc6c5408a1e050b677)
* KRACOEUS-7443: Fix notification email address
  * Gayathri on Tue, 17 Feb 2015 15:58:48 -0700 [View Commit](../../commit/63cebfa4ef6ca0a67405ed3c18b6b2cb4fee12dd)
* KRACOEUS-8870: Set demo cost elements to be active
  * At some point during the 4.0 release cost elements where changed from using 'N' to indicate active to 'Y' being active. Due to the oddities with the old sql scripts the bootstrap script that did this now runs before the demo data that inserts these records. This enables all the demo cost elements.
  * blackcathacker on Tue, 17 Feb 2015 15:25:31 -0800 [View Commit](../../commit/11d1407549ed2fd3e7735abf79e2b5b388214e3d)
* KRACOEUS-8872: Adding warning while deleting attachments.
  * Gayathri on Tue, 17 Feb 2015 16:53:32 -0700 [View Commit](../../commit/a7f4624e65a97dd5b49d0a7a119a48b8eee02271)
* KRACOEUS-8855:Make PD KEW doc standalone and repackage KEW related class
  * The PD KEW File that was being used by CX was apparently dependent on the previous foundation KEW file being ingested. I have copied relevant elements from it such that this file can be ingested into an empty database.
  * blackcathacker on Tue, 17 Feb 2015 16:09:27 -0800 [View Commit](../../commit/a9aa1c154a1c26ddefd29c47a5656dde06922025)
* KRACOEUS-8854 : Fix issue with bad data so script can apply
  * blackcathacker on Sun, 15 Feb 2015 14:15:05 -0800 [View Commit](../../commit/0a1da018c96c302f26a5482783bef36c7582953c)
* KRACOEUS-8871:implement budget progressive navigation
  * Joe Williams on Tue, 17 Feb 2015 16:53:05 -0600 [View Commit](../../commit/6c16496c904410f221b4ea171df6e770ad99feb4)
* KRACOEUS-8875: resequence sql file
  * Travis Schneberger on Wed, 18 Feb 2015 09:05:12 -0500 [View Commit](../../commit/96d2509bd4b56038cd2f5a96564564aa6af91eb4)
* KRACOEUS-8856: fix grammar
  * Travis Schneberger on Wed, 18 Feb 2015 11:26:23 -0500 [View Commit](../../commit/e20cc1e98f1cb6c2b8fb96e43969b4d073fd28d3)
* KRACOEUS-8873: Delivery info changes
  * Gayathri on Wed, 18 Feb 2015 08:46:30 -0700 [View Commit](../../commit/10d0b073f7cc16f70861064ae77df9c3188a2908)
* KRACOEUS-8879: adding header text
  * Travis Schneberger on Wed, 18 Feb 2015 13:38:52 -0500 [View Commit](../../commit/f444865410b1b61e2b9d18f4eb85a2e9e2f2f11e)
* KRACOEUS-8802 Subaward refresh on delete and replace
  * Fix to refresh the modal and clear current period details.

  * update review comments
  * rmancher on Tue, 17 Feb 2015 11:25:39 -0500 [View Commit](../../commit/ac92585b9089a377eb91126d843122b629065e27)
* KRACOEUS-8873: Removing validation while deleting.
  * Gayathri on Wed, 18 Feb 2015 15:49:58 -0700 [View Commit](../../commit/81dd6283ec6ca5918425ad18b575c194f70be92d)
* KRACOEUS-8881:Support for MySQL5.6/MariaDB10
  * This primarily involved making sure to drop the foreign key before modifying a referenced column and limited indexes to 767 bytes.
  * In order to still support Mysql5.5 you also have to make sure that when dropping the foreign keys the names of the contrainsts match exactly.
  * blackcathacker on Wed, 18 Feb 2015 16:21:42 -0800 [View Commit](../../commit/7b9c9681eb223dd81c5697e614c8f6b3880f1ed9)
* KRACOEUS-8880: adding validation to s2s opportunity lookup fields
  * Travis Schneberger on Thu, 19 Feb 2015 09:18:44 -0500 [View Commit](../../commit/149877bcab443afce145477c8a223916e14b89a3)
* KRACOEUS-8809 Refresh budget summary during sync
  * Budget summary is not updated while performing sync operation in parent
  * proposal budget
  * rmancher on Wed, 18 Feb 2015 14:44:38 -0500 [View Commit](../../commit/d3d7d3008b26b67f992ccb5e1269387be80a99e1)
* KRACOEUS-8864:added special review validation
  * Joe Williams on Thu, 19 Feb 2015 10:07:37 -0600 [View Commit](../../commit/ea8a24d2591296408d1d9d5050ca4d649b8e5091)
* KRACOEUS-8831:moved div and program code validation to audit errors
  * Joe Williams on Thu, 19 Feb 2015 12:54:42 -0600 [View Commit](../../commit/6a468602f6ee4f8157edcbce35d6312fdcfa0092)
* KRACOEUS-8876:fix text area inline edit fieldwidth
  * Joe Williams on Thu, 19 Feb 2015 14:22:20 -0600 [View Commit](../../commit/63c925b8fa4657574ba457212bc164559b02a6f0)
* KRACOEUS-8883:implement widget input only for questions with lookups
  * Joe Williams on Thu, 19 Feb 2015 15:50:04 -0600 [View Commit](../../commit/79eeb151b269c8a4cb876ccc5135cd95677bd8e0)
* KRACOEUS-8884:fixed non personnel budget rates
  * Joe Williams on Thu, 19 Feb 2015 16:45:09 -0600 [View Commit](../../commit/fbf28001e2295e48c087c0511d8475def3dd41ab)
* KRACOEUS-8770: KNS, Proposal and Budget Online help
  * Gayathri on Thu, 19 Feb 2015 17:53:00 -0700 [View Commit](../../commit/60f52092152454f2158ba1055bc9662c5d6a33c1)
* KRACOEUS-8885: Removing notify from child proposals
  * Gayathri on Thu, 19 Feb 2015 18:38:57 -0700 [View Commit](../../commit/660cc615e0a7bf2f0baf41f4d15be0748467342c)
* KRACOEUS-7453 Enable unit inquiry
  * Display unit and administrator details
  * rmancher on Fri, 20 Feb 2015 10:36:00 -0500 [View Commit](../../commit/53bd1e178c81b53d714aaa6d7b4b66e1273dfbd8)
* KRACOEUS-8886:perform client side validation on navigation back to proposal
  * Joe Williams on Fri, 20 Feb 2015 09:49:55 -0600 [View Commit](../../commit/0d24748200d4bb6934d2f114f51636761724bff8)
* KRACOEUS-8889: fixing PD routing
  * Gayathri on Fri, 20 Feb 2015 11:07:45 -0700 [View Commit](../../commit/aef03439164dcfd8f23cf32b14cfae76fc8c900f)
* KRACOEUS-8888:create unique id and person name for tbn persons
  * Joe Williams on Fri, 20 Feb 2015 14:35:03 -0600 [View Commit](../../commit/f4be0deee195052ccf31b6e34756450d52cfd32a)
* KRACOEUS-8891:Health Check Page
  * Simple health check page that return 200 on success and 417 on failure.
  * Does simple query against the KC and Rice database to confirm they are accessible
  * blackcathacker on Sun, 22 Feb 2015 15:34:14 -0800 [View Commit](../../commit/cf65617ece8b605feba4a9fe92e7bf31d7ef3728)
* KRACOUES-8890:set budget creator role to only edit budgets
  * Joe Williams on Mon, 23 Feb 2015 09:16:46 -0600 [View Commit](../../commit/cb97f0619570b40f427a42960ce1b3bd1794f916)
* KRACOEUS-7451 Add status option for internal attachments
  * Include status option for add attachments and in the list.
  * Also add mark all status option.
  * rmancher on Mon, 23 Feb 2015 10:59:58 -0500 [View Commit](../../commit/7a5fd354b2fc149ea5d82c9eb769729f1f5ee5cf)
* KRACOEUS-8739: Fixing lookup sort
  * Gayathri on Mon, 23 Feb 2015 11:26:37 -0700 [View Commit](../../commit/54342126657e501a0d40074b068c510e5192616c)
* KRACOEUS-8897: removing references to old commons-lang
  * Travis Schneberger on Mon, 23 Feb 2015 13:26:16 -0500 [View Commit](../../commit/b77d55410c839d411ce40541a8bbd5b1b25e70e7)
* KRACOEUS-8894:allow add viewer permission when document is enroute
  * Joe Williams on Mon, 23 Feb 2015 13:04:28 -0600 [View Commit](../../commit/2df23475e2b3871adb8f16d9cca5f7d488d0845d)
* KRACOEUS-8895:Add CAS as dependency
  * blackcathacker on Mon, 23 Feb 2015 10:49:49 -0800 [View Commit](../../commit/384a628f51858d9b508cda8078da05483f6c4f47)
* KRACOEUS-8682: Hiding create proposal button
  * Gayathri on Mon, 23 Feb 2015 16:27:06 -0700 [View Commit](../../commit/6e3a6ae210449cc6b5d796efbb2d079578063a38)
* KRACOEUS-8892:Various db issues
  * V600_067__KC_DML_01_KRACOEUS-7014_B000.sql and others failed due to the coeus_module description being modified so the module_code as harded as was done during insert and in other locations in code, additionally they modified the special review type 'Animal Subjects' to 'Live Vertebrate Studies' and again this is a code hard-code in sql and in code so no reason to query for it.
  * V601_017__KRACOEUS-8864.sql failed because of conflicting primary keys so using new procedure to find first unused id
  * V600_046__KC_TBL_AWARD_BUDGET_EXT.sql needed to orphan the records in award_budget_limit as well
  * V600_063__KC_DML_01_KFSMI-11381_B000.sql failed because customer had inserted extra record at 999 which meant the next value was 1000. Instead using new procedure to find first available id
  * V300_002__schema.sql and V300_107__schema.sql were modified because of previously unseen errors with mysql 5.6
  * V600_054__KC_TBL_EPS_PROPOSAL_BUDGET_EXT.sql is another example of orphaned records where the proposal was deleted but the budgets weren't
  * blackcathacker on Mon, 23 Feb 2015 18:00:05 -0800 [View Commit](../../commit/2b15e79bb9bd3fce04684bfc914e4e4c05dfd2a8)
* KRACOEUS-8896:fix research strategy s2s error
  * Joe Williams on Tue, 24 Feb 2015 08:32:58 -0600 [View Commit](../../commit/a121f6d39f35b131d789ee8a2434aa5f7ecae777)
* KRACOEUS-8887:add confirmation dialog to complete budget
  * Joe Williams on Fri, 20 Feb 2015 14:17:53 -0600 [View Commit](../../commit/ce21ff2c850c80d7fe9ea33e66bad6225d0b1a3a)
* KRACOEUS-7438: Fixing PI certification while routing
  * Gayathri on Mon, 23 Feb 2015 14:02:03 -0700 [View Commit](../../commit/686f68da9f24934237b5ec8fa5fb800152aa9bc3)
* KRACOEUS-8899:fixed client side date validation
  * Joe Williams on Tue, 24 Feb 2015 11:48:22 -0600 [View Commit](../../commit/29e973127d24d62320b428e32e9f476945f7a401)
* KRACOEUS-8874 Incorrect distributable amount when editing amount in award
  * rmancher on Tue, 24 Feb 2015 09:10:27 -0500 [View Commit](../../commit/61a0bb8e31e55885c90265a1ae253e9ad662915b)
* KRACOEUS-8898:Update doc typ to use new PD URL
  * blackcathacker on Tue, 24 Feb 2015 14:27:33 -0800 [View Commit](../../commit/f036776180f5395a6fdfa63b16f1ead007bd41a2)
* KRACOEUS-8904: adding missing closing tag
  * Travis Schneberger on Wed, 25 Feb 2015 08:40:34 -0500 [View Commit](../../commit/2982988cd70a11dc486396ec50b6c8b0f7bbef28)
* KRACOEUS-8903:complete budget from budget versions page
  * Joe Williams on Wed, 25 Feb 2015 09:22:34 -0600 [View Commit](../../commit/2e7a378487226ad17b067829f68116c0426722e2)
* KRACOEUS-8878: moving external stuff back to the old package
  * Travis Schneberger on Fri, 20 Feb 2015 15:26:35 -0500 [View Commit](../../commit/9b74b87dd1511e6101e11a0e088629809ceebf02)
* KRACOEUS-8878: moving external stuff back to the old package
  * Travis Schneberger on Fri, 20 Feb 2015 16:13:46 -0500 [View Commit](../../commit/53147ca389922676a65bd5982b37f6add5c57de6)
* KRACOEUS-8878: rolling back cgb api changes, fixing external DD files
  * Travis Schneberger on Mon, 23 Feb 2015 13:21:19 -0500 [View Commit](../../commit/61197fd08ace4b6de7dfdffdfc724f6acda648b5)
* KRACOEUS-8878: resequencing sql file
  * Travis Schneberger on Tue, 24 Feb 2015 09:47:46 -0500 [View Commit](../../commit/3c844db62debb972ea9cd32b1aa944cfc81712d7)
* KRACOEUS-8878: fixing package
  * Travis Schneberger on Wed, 25 Feb 2015 11:13:03 -0500 [View Commit](../../commit/f0f7870f82ebb0359611af92533043663a38564f)
* KRACOEUS-8878: code review comments
  * Travis Schneberger on Wed, 25 Feb 2015 14:27:07 -0500 [View Commit](../../commit/17ea473279f11bc95fbd1dc285b4616b8f92c131)
* KRACOEUS-8878: resequencing sql file
  * Travis Schneberger on Wed, 25 Feb 2015 15:35:25 -0500 [View Commit](../../commit/72b396be6de6fb7ef9c881a31f554694d22f7fdb)
* KRACOEUS-8902: Add notification when changing narratives
  * Gayathri on Wed, 25 Feb 2015 13:56:14 -0700 [View Commit](../../commit/7baf3d22ae28b92e6ea61126944c9dae314616c6)
* KRACOEUS-8739: Adding missed change
  * Gayathri on Wed, 25 Feb 2015 14:51:58 -0700 [View Commit](../../commit/706f2b6579f3e94b68bf7cc70452833204bf5a6b)
* KRACOEUS-8909: make sponsor maintenance work without KFS integration
  * Travis Schneberger on Thu, 26 Feb 2015 08:26:31 -0500 [View Commit](../../commit/aa7e7969c3b76b78a0c1f91e18139028512b0320)
* KRACOEUS-8909: fixing role qualifiers for sponsor for quickstart
  * Travis Schneberger on Thu, 26 Feb 2015 09:54:07 -0500 [View Commit](../../commit/0da1feff9db96c9e9e2cccfafb8ca47c242f8a5b)
* KRACOEUS-8909: fixing constraint violation on save
  * Travis Schneberger on Thu, 26 Feb 2015 10:12:46 -0500 [View Commit](../../commit/1a0386df6b515ad6964a609e5fa58a2746c3d589)
* KRACOEUS-8913: swapping field locations
  * Travis Schneberger on Thu, 26 Feb 2015 11:01:29 -0500 [View Commit](../../commit/bee646b0273fa9d4305a8779c45bce1c2929104e)
* KRACOEUS-8914: changing fixed point number message
  * Travis Schneberger on Thu, 26 Feb 2015 11:14:27 -0500 [View Commit](../../commit/1556750bcc25b76d2921da9ab74b781e32fe4d9c)
* KRACOEUS-8390 Add close button to superuser action page
  * rmancher on Thu, 26 Feb 2015 11:28:51 -0500 [View Commit](../../commit/5d072dbc7b87fd9960f67c5c7c51e6c2a0eca394)
* KRACOEUS-8803 Fix unauthorized lead unit options
  * Currently KIM is not checking whether user is associated with the
  * new group. We need a rice fix.
  * This is an interim solution.
  * rmancher on Wed, 25 Feb 2015 14:51:18 -0500 [View Commit](../../commit/dc158b3403c8ccd6e8d366ca9ca4a320f8914b9c)
* KRACOEUS-8905:display s2s errors when print invalid xml
  * Joe Williams on Fri, 27 Feb 2015 08:08:31 -0600 [View Commit](../../commit/638e3c932d570f06c7b0dd3ad34b41520af829a2)
* KRACOEUS-8918: adding not found message
  * Travis Schneberger on Fri, 27 Feb 2015 10:18:19 -0500 [View Commit](../../commit/fcc1b86707b791c3ece17c13411b68dc4c89aa3b)
* KRACOEUS-8919: changing field length
  * Travis Schneberger on Fri, 27 Feb 2015 10:25:46 -0500 [View Commit](../../commit/a9abe0e82e3b014d7c93200a905d8039f1081c8d)
* KRACOEUS-8920:added inquiry link to arg value custom data
  * Joe Williams on Fri, 27 Feb 2015 12:15:03 -0600 [View Commit](../../commit/55f79fe4c5ba3b6addabca216d5117cd781b4e8d)
* KRACOEUS-8176 Save budget to reflect totals in periods and budget
  * Adding a line item and closing window should recalcuate budget and
  * persist line item. We need to persist budget in this scenario since
  * we need to update periods and totals and budget totals.
  * rmancher on Fri, 27 Feb 2015 16:23:15 -0500 [View Commit](../../commit/c5daab6f9d347b1a7da0371e4726794eca2de41b)
* KRACOEUS-8767: Fixing help links
  * Gayathri on Fri, 27 Feb 2015 15:51:20 -0700 [View Commit](../../commit/8ec7e5887978dbcfacf80d85e6d134283364f357)
* KRACOEUS-8868: increasing reqID length
  * Gayathri on Fri, 27 Feb 2015 16:38:09 -0700 [View Commit](../../commit/b67b44adbef02c03923ecf14168095b9f2a56f1e)
* Revert "KRACOEUS-8803 Fix unauthorized lead unit options"
  * Douglas Pace on Fri, 27 Feb 2015 18:00:16 -0800 [View Commit](../../commit/87d09dd52eccab5e742b742d2b4017b5c541b547)
* KRACOEUS-8905:generate module periods when chnage budget settings
  * Joe Williams on Mon, 2 Mar 2015 09:56:03 -0600 [View Commit](../../commit/5faa4fda4c723dae30f5614006bb709113e21bb7)
* KRACOEUS-8903:mark budget incomplete from budget versions
  * Joe Williams on Mon, 2 Mar 2015 11:35:11 -0600 [View Commit](../../commit/9cb329e277eed5700e37736df73f66ab3ceed3d8)
* KRACOEUS-8839:fix attachment data
  * Joe Williams on Mon, 2 Mar 2015 13:21:19 -0600 [View Commit](../../commit/617054110223f667970ccf22e90a5186b23127ed)
* KRACOEUS-8920:added arg value inquiries to questionnaire
  * Joe Williams on Mon, 2 Mar 2015 14:20:54 -0600 [View Commit](../../commit/94307eb585e2032318147bfbed3413437d38c11a)
* KRACOEUS-8839:Fix up commit related to attachments
  * Rename base class to match up with attachment dao given other different usages for AttachmentDataSource.java
  * Add javadoc and other clean up.
  * blackcathacker on Mon, 2 Mar 2015 18:04:13 -0700 [View Commit](../../commit/942939dcd5c4d986603923b41a09184a572339e6)
* KRACOEUS-8839:Code review changes
  * blackcathacker on Mon, 2 Mar 2015 21:10:30 -0700 [View Commit](../../commit/48644b1636a1f90e03a96ab708a49a164615497e)
* KRACOEUS-8891:Reduce logging on health checks
  * We are using the health check to make sure elb knows the server is up, but the performance logging log messages showing up every couple of seconds is annoying and expensive.
  * blackcathacker on Mon, 2 Mar 2015 22:39:43 -0700 [View Commit](../../commit/3241887a1167910856445eb7c8497ed253f1f2c9)
* KRACOEUS-8925:save budget on modular sync
  * Joe Williams on Tue, 3 Mar 2015 08:29:45 -0600 [View Commit](../../commit/6647d3a68e113c7c721d494697a8007104480843)
* KRACOEUS-8740:wrap long medusa text fields
  * Joe Williams on Tue, 3 Mar 2015 12:58:04 -0600 [View Commit](../../commit/2591263e27575bcf0eed36df2a242e0c550fcff4)
* KRACOEUS-8927:removed broken budget rule
  * Joe Williams on Tue, 3 Mar 2015 13:30:45 -0600 [View Commit](../../commit/f27cd8389153dc3ea47c07d8ba6446d5853887e6)
* KRACOEUS-8912: Add ability to certify enroute proposal
  * Gayathri on Tue, 3 Mar 2015 12:35:29 -0700 [View Commit](../../commit/ba4503daf9afdcc963dc0b414640135a109647b2)
* KRACOEUS-8924: hierarchy sync trace fix
  * Gayathri on Wed, 4 Mar 2015 09:23:35 -0700 [View Commit](../../commit/efddcd6130634812811f75975136ad74cad95125)
* KRACOEUS-8929:resize navigation menu drop downs when window size changes
  * Joe Williams on Wed, 4 Mar 2015 10:23:57 -0600 [View Commit](../../commit/7a4d6bac1635c7d4c009358a7bfee01c781b3414)
* KRACOEUS-8748, KRACOEUS-8930:
* Adding rule to check if a record can be deleted before submit (supports OJB, JPA, and DD relationships)
* Making all KC maintenance docs inherit from KcMaintenanceDocumentEntry (ensures that all maintenance docs use KcMaintenanceDocumentRuleBase if not specified
* Making all Kc Rules extend from KcMaintenanceDocumentRuleBase
* Fixing bootstrap skinning so that GLOBAL_ERRORS are visible
  * Travis Schneberger on Wed, 4 Mar 2015 14:03:04 -0500 [View Commit](../../commit/45168d24cc4a151c04e2e84c44918d48e815c7a8)
* KRACOEUS-8928: upgrading wss4j
  * Travis Schneberger on Wed, 4 Mar 2015 16:05:26 -0500 [View Commit](../../commit/f4ca95b06fa49cb90fd0ce9dabaeec6fa41309a2)
* KRACOEUS-8933: data cleanup, add constraints
  * Travis Schneberger on Thu, 5 Mar 2015 09:59:08 -0500 [View Commit](../../commit/3962401b85a683270189c2c784349ede962289cb)
* KRACOEUS-8748: code review comments
  * Travis Schneberger on Thu, 5 Mar 2015 10:14:50 -0500 [View Commit](../../commit/12fd321b813b96f3d59a29789c4fed23600e9841)
* KRACOEUS-8935: adding logging
  * Travis Schneberger on Thu, 5 Mar 2015 11:45:08 -0500 [View Commit](../../commit/cec39f1e9a42f6efe3947994b83a9529a58cddd0)
* KRACOEUS-8839:Ensure validations don't grab attachments
  * blackcathacker on Thu, 5 Mar 2015 12:10:37 -0700 [View Commit](../../commit/fb4e7689345b38158183c91ac5e6fc8927e1bba1)
* KRACOEUS_8938:fix some integration tests
  * Joe Williams on Fri, 6 Mar 2015 10:34:09 -0600 [View Commit](../../commit/2ba3289808dafaad309644ab7964e3fd1b9252d9)
* KRACOEUS-8940:fix reject action
  * Joe Williams on Fri, 6 Mar 2015 16:11:20 -0600 [View Commit](../../commit/9716421d803246f6a9ae4cbbadec758d604cae91)
* KRACOEUS-8937: avoiding an NPE on orphaned records
  * Travis Schneberger on Fri, 6 Mar 2015 20:20:25 -0500 [View Commit](../../commit/60e96b1d29bb46cabaeb9520c3aae72fe8aea0e4)
* KRACOEUS-8934: grm profiles
* moved grm specific items to a profile (maven and spring)
* fixed several pom issue from code merge
* fixed the ReportAction that is clearly broken
* made all grm internal dependencies runtime scope so we do not have compile time dependencies
* confirmed app builds and starts with the grm profile enabled and disabled with the correct functionality
  * Travis Schneberger on Fri, 6 Mar 2015 13:01:36 -0500 [View Commit](../../commit/af7ae9c108a974a814c1bc5a2741f40255984be9)
* KRACOEUS-8786:fix subaward validation
  * Joe Williams on Mon, 9 Mar 2015 09:44:03 -0500 [View Commit](../../commit/597228500c5053ea41146fb9c25c352669e421ea)
* KRACOEUS-8936:fix unit hierarchy view
  * Joe Williams on Mon, 9 Mar 2015 11:35:15 -0500 [View Commit](../../commit/5763260fdcbdca17f1b3c97dccfea92dafe7ea39)
*  fixing hr import
  * Travis Schneberger on Mon, 9 Mar 2015 15:33:38 -0400 [View Commit](../../commit/d11559e28810e38dcc86878e07311f74dda7b1a9)
* KRACOEUS-8931: fixing mysql file placement
  * Gayathri on Mon, 9 Mar 2015 15:15:44 -0700 [View Commit](../../commit/67d49af07d9490a5b477abf71732d666d983b51f)
*  supporting grm sql files
  * Travis Schneberger on Mon, 9 Mar 2015 23:41:30 -0400 [View Commit](../../commit/c15970262dc57fc22f473437ec2b1992ebf5e12f)
* KRACOEUS-8931: oracle scripts for release 6.0.1
  * Gayathri on Mon, 9 Mar 2015 14:40:01 -0700 [View Commit](../../commit/deb2667c659616e8e11e7481791a287e9f7e36b1)
*  Award locks fix
  * Gayathri on Tue, 10 Mar 2015 15:04:11 -0700 [View Commit](../../commit/42ef8b17a34420e6bff58d6d1c69f4a3822ffcd3)
* fix attachment errors when linking to child from parent
  * Joe Williams on Wed, 11 Mar 2015 10:33:15 -0500 [View Commit](../../commit/5beb381422c896a3623eaa0908d536e9e22731eb)
*  using a set to remove duplicate unit qualifications
  * Travis Schneberger on Wed, 11 Mar 2015 13:58:12 -0400 [View Commit](../../commit/f55da36e837ffdcc39b89760753940b5d8ca9603)
*  fixing int tests for the grm profile
  * Travis Schneberger on Wed, 11 Mar 2015 21:23:10 -0400 [View Commit](../../commit/db2eea4081080f78157a08669d4a1cccd3224e93)
* KRACOEUS-8902: fix notification text
  * Gayathri on Thu, 12 Mar 2015 10:54:23 -0700 [View Commit](../../commit/a4484743ea134628ed757d6fc1c64bdddd0fabba)
* KRACOEUS-8947: fixing data length problems, a serialization issue after submit, no need for oracle script change
  * Travis Schneberger on Thu, 12 Mar 2015 17:34:41 -0400 [View Commit](../../commit/8d4191bf20a98bbac28fb060c3b4903d0831b14d)
* Fix license in files
  * blackcathacker on Thu, 12 Mar 2015 11:24:03 -0700 [View Commit](../../commit/237357f04bff1866ab6a099c184f19786924a7cd)
* fix enroute attachment saving
  * Joe Williams on Fri, 13 Mar 2015 09:16:56 -0500 [View Commit](../../commit/d779cdb339a5adb7365e6a1a938d666c39a4e41c)
* return authorization exception messaeg instead of STE
  * Joe Williams on Fri, 13 Mar 2015 15:22:01 -0500 [View Commit](../../commit/bc1a27dc1dbeec2eb35aabc71946f4746698ed19)
* KCSUPPORT-661: adding documentation, fixing bug related to http://bugs.java.com/view_bug.do?bug_id=6476706
  * Travis Schneberger on Fri, 13 Mar 2015 21:09:05 -0400 [View Commit](../../commit/662d50db4abbe64022a44a7ffae43ff6f24fbf6c)
*  adding documentation
  * Travis Schneberger on Fri, 13 Mar 2015 21:48:55 -0400 [View Commit](../../commit/e63af1d39cecdfbc28e064d7ea6039efcdfcb59c)
* fix STE on unlink hierarchy
  * Joe Williams on Mon, 16 Mar 2015 09:06:49 -0500 [View Commit](../../commit/133f49a1f5053263661403c2b33ff8f8f2f930f1)
* KRACOEUS-8949: releasing s2s
  * Travis Schneberger on Mon, 16 Mar 2015 10:18:12 -0400 [View Commit](../../commit/4bf6fc11c1d7e71abb46a4260e01b00781dea35d)
* Make debug logging debug
  * blackcathacker on Mon, 16 Mar 2015 09:56:34 -0700 [View Commit](../../commit/dc19e393ad5def2beeb2ffb12240865082d238ab)
* Update pom.xml  * Travis Schneeberger on Mon, 16 Mar 2015 14:24:25 -0400 [View Commit](../../commit/4580ff0b6e7541519476735526612290a0fb3dbb)
* next iteration
  * Travis Schneberger on Mon, 16 Mar 2015 15:23:47 -0400 [View Commit](../../commit/0bf3f2b0b75a36de50a19ac259c5a537f8cfad0a)
* Support supplying test config via -Dvar=value
  * In order to support more easily configuring the CI server we want to move to -Dvar=value configuration for integration tests. By making these params not override previous values the -Dvar values are automatically pulled in and used.
  * blackcathacker on Mon, 16 Mar 2015 13:43:03 -0700 [View Commit](../../commit/bd7b6d440875a4bf445347aa6cdcda3ca702aa99)
* fix subaward attachment data
  * Joe Williams on Tue, 10 Mar 2015 16:55:33 -0500 [View Commit](../../commit/3b8220e13d57a0c148d55eecb1db52620e39d378)
* fix attachment deletion on copy and hierarchy
  * Joe Williams on Wed, 11 Mar 2015 13:24:19 -0500 [View Commit](../../commit/b3488496f6b224525b13f433eb95cdaae2a865b0)
* added budget category to non-budget add and edit modals
  * Joe Williams on Thu, 12 Mar 2015 14:34:01 -0500 [View Commit](../../commit/9b978e22af59cfa60c3b4b720495eaf70d7203cd)
* fixed extended attribute biosketch validation
  * Joe Williams on Tue, 17 Mar 2015 10:11:25 -0500 [View Commit](../../commit/6a4a190622ad563ad15fdc94d246acb5226038cc)
*  fixing budget rules
  * Gayathri on Mon, 16 Mar 2015 15:19:26 -0700 [View Commit](../../commit/f1be1a318f120bf0f3b9b9e62ed9b6688a2ae40b)
*  info text
  * Gayathri on Tue, 17 Mar 2015 12:28:12 -0700 [View Commit](../../commit/1dfae9b559380ca2c39e22b286c7d684b7cd317c)
*  IACUC and IRB help fixes
  * Gayathri on Wed, 11 Mar 2015 17:10:28 -0700 [View Commit](../../commit/f7e55fa9231bfd5d074ac54d8140489ad4b36113)
* fix sql scripts
  * Joe Williams on Wed, 18 Mar 2015 08:33:28 -0500 [View Commit](../../commit/98f7c4632c10426a1b688eb9d8613f442c001bb7)
* dismiss add person modal on add person request
  * Joe Williams on Wed, 18 Mar 2015 12:39:36 -0500 [View Commit](../../commit/47bc4c819ca6f8d87854d6a1a61760ee20ed9595)
*  approver cannot view budget
  * Gayathri on Wed, 18 Mar 2015 15:28:39 -0700 [View Commit](../../commit/ab3135b5d0e8e0e3d451bc860c071c4f640b03ed)
*  more help fixes
  * Gayathri on Thu, 12 Mar 2015 15:38:39 -0700 [View Commit](../../commit/e4be54df3781059509869faf9ce205be8388ec3b)
*  adding schemaspy to our project
  * Travis Schneberger on Wed, 18 Mar 2015 17:36:02 -0400 [View Commit](../../commit/f453ad29308a3220c8b5affe202f7f058fe62bd7)
* KCSUPPORT-661: properly reading logging files from the classpath
  * Travis Schneberger on Wed, 18 Mar 2015 20:18:57 -0400 [View Commit](../../commit/d9c57d4c0e914e71839cdd6e29ceebffc58edfd2)
*  turning on flyway grm by default
  * Travis Schneberger on Thu, 19 Mar 2015 08:08:02 -0400 [View Commit](../../commit/dba00aac7ff22230ddda6560ab5983056502e95a)
*  fixing coeus-it dependency and build order
  * Travis Schneberger on Thu, 19 Mar 2015 10:00:35 -0400 [View Commit](../../commit/e4cdd867c4ef8de28e23205626097cb5e26d62a3)
*  fixing staging data
  * Travis Schneberger on Thu, 19 Mar 2015 10:41:56 -0400 [View Commit](../../commit/4338fdb21b561862ba26e8ede085c28102aa91d6)
*  resequencing db script
  * Travis Schneberger on Thu, 19 Mar 2015 10:44:03 -0400 [View Commit](../../commit/8e5c516212ec97cb1250c717efa9eedb550cc48c)
* Disable OJB mappings for subaward attachments
  * Subawards are only used by prop dev and therefore only relevent under JPA
  * blackcathacker on Thu, 19 Mar 2015 11:01:33 -0700 [View Commit](../../commit/6ad78c73a8bc378d3bd1011014478ac582c6c330)
* OJB mapping test configurable by system prop
  * In order to support configuring Jenkins CI test runs through Jenkins itself we need to be able to configure the OJB mapping test through system props
  * blackcathacker on Thu, 19 Mar 2015 11:04:51 -0700 [View Commit](../../commit/4edf73fa983f9bed8da46e8f0de29a9298dedf3f)
* Fix remaining integration tests
  * This also makes it so system properties always override configuration params
  * blackcathacker on Thu, 19 Mar 2015 20:02:06 -0700 [View Commit](../../commit/97d189cb3f616109c3f363bf62ec9467b06f9966)
* get xml file from subaward
  * Joe Williams on Fri, 20 Mar 2015 08:34:58 -0500 [View Commit](../../commit/13c43dc9386e327e7eb1929d57af27554c631493)
*  updating error prone compiler, fixing several bugs found by compiler
  * Travis Schneberger on Fri, 20 Mar 2015 09:41:19 -0400 [View Commit](../../commit/1ef2966853ddc1328f74fc02ada486a926340dee)
* allow edit/copy of person training
  * Joe Williams on Fri, 20 Mar 2015 11:06:09 -0500 [View Commit](../../commit/9e29536a64c4d0cffe4eaf25cc6d456b359575ac)
* fix STE on award notice print
  * Joe Williams on Fri, 20 Mar 2015 15:40:06 -0500 [View Commit](../../commit/adc64c4239a0b93f2f4a9df97a944f4062c5bed0)
* set default period to calendar
  * Joe Williams on Fri, 20 Mar 2015 17:01:31 -0500 [View Commit](../../commit/5b4be2c7bf7c82dc432f76182d9d8bda7ce1f8cc)
*  Verify that the Instrumentation Configuration is correct
  * Travis Schneberger on Sat, 21 Mar 2015 21:21:40 -0400 [View Commit](../../commit/e208c6be03ab8e444a5254083b3e98714bd2890e)
* add inflation rate info to add budget line item modals
  * Joe Williams on Thu, 19 Mar 2015 16:09:11 -0500 [View Commit](../../commit/40561a4ba47d0cf06a7b9e53ceeb9643a6c58bec)
* create s2s error for missing citizenshiptype instead of throwing exception
  * Joe Williams on Mon, 23 Mar 2015 10:16:26 -0500 [View Commit](../../commit/80c865922b44fb588e89a14d69bf4665248ca649)
* fix award labels on medusa view
  * Joe Williams on Mon, 23 Mar 2015 14:22:30 -0500 [View Commit](../../commit/32163e1b7400461130fde7d17293242cb9f1a799)
* fix STE on navigation to award budget summary
  * Joe Williams on Tue, 24 Mar 2015 09:33:42 -0500 [View Commit](../../commit/7dded8ecc47fcb1575a887b4d6e8150fb2a0049d)
* added campus code and unit quickfinders to add personnel wizard
  * Joe Williams on Tue, 24 Mar 2015 10:21:29 -0500 [View Commit](../../commit/27e5fec98788f52c467d05666babee428da27e39)
* filter on inflation rateClassType and add ID to table
  * Joe Williams on Tue, 24 Mar 2015 11:43:16 -0500 [View Commit](../../commit/b5be2afb71ccbe6cc22dd148535812ded8e0aeec)
* fix STE on award budget navigation
  * Joe Williams on Tue, 24 Mar 2015 16:41:34 -0500 [View Commit](../../commit/4c1371b4689abd9ea38d842d37adbe0917e1c739)
* fix print s2s xml button
  * Joe Williams on Wed, 25 Mar 2015 13:15:33 -0500 [View Commit](../../commit/572e2d6cf531cba3c986cb7a86a81c38d95a09ca)
* RESKC_239:update attachment handling to be compatible with oracle and mysql
  * Joe Williams on Wed, 25 Mar 2015 12:34:23 -0500 [View Commit](../../commit/40bf50c3ab7ed4ee560a20ef6a908f43f6a89008)
* fix issue with escalating award budget total costs
  * Joe Williams on Wed, 25 Mar 2015 14:34:40 -0500 [View Commit](../../commit/f07ed082e40e3fecce2923c64f07a02fbf85c942)
* save budget when applying rates to later periods
  * Joe Williams on Wed, 25 Mar 2015 16:23:20 -0500 [View Commit](../../commit/2e7aa920e36fe2ffb550b73e1fc797a679e8117a)
* once a budget line item is added summary rows are no longer editable
  * Joe Williams on Wed, 25 Mar 2015 16:33:47 -0500 [View Commit](../../commit/e3ba5d7beb67c6f5600561ad2095d590296b3a5b)
* Fix GRM SQL Error
  * blackcathacker on Thu, 26 Mar 2015 16:44:04 -0700 [View Commit](../../commit/c7113ca039623421b63f44ac81f51e1ea0706ef9)
* View questionnaire using table instead of doc
  * This is to avoid serialization issues that occur due to questionnaire class repackaging
  * blackcathacker on Thu, 26 Mar 2015 17:52:57 -0700 [View Commit](../../commit/f0a41a0001fa963fe965483c29b3686aec0d92bb)
* Add citizenship type to clear error
  * blackcathacker on Thu, 26 Mar 2015 19:51:35 -0700 [View Commit](../../commit/a73050fea047564acbeefa8569ffa86990b3c2ce)
* Modify and refactor unit and jetty memory arguments
  * blackcathacker on Fri, 27 Mar 2015 15:36:55 -0700 [View Commit](../../commit/4e7152bf30f5a6f8a8863bba3b10cb993d366396)
* Refactoring UnitServiceImpl
  * Travis Schneberger on Tue, 31 Mar 2015 11:43:05 -0400 [View Commit](../../commit/f4b6e5137e7c601695ce9d58417484cb16af9721)
* Refactor/test time and money trans history
  * blackcathacker on Tue, 31 Mar 2015 16:52:08 -0600 [View Commit](../../commit/1f39073e2a318206b794ea2fe3eb737addeb5055)
* Fix up abstractBudgetService
  * Joe Williams on Thu, 2 Apr 2015 13:01:34 -0600 [View Commit](../../commit/3a9dc171391f24bbfb27a2b46fb998672504a7d6)
* Cleanup dead code in TimeAndMoneyHistoryServiceImpl
  * blackcathacker on Wed, 1 Apr 2015 15:59:19 -0600 [View Commit](../../commit/5a6f2e5102bd766a450cf6a3ec35723fc5a8d69e)
* cleanup dead pd code, fixing precompilation step, fixing jsp compilation failures
  * Travis Schneberger on Fri, 3 Apr 2015 10:39:19 -0400 [View Commit](../../commit/b8280d98a718769e4be368fa4580998ba6273e94)
* dead js cleanup
  * Travis Schneberger on Fri, 3 Apr 2015 11:40:05 -0400 [View Commit](../../commit/59baafe9d00379094d7d7073e974ed291bba7e23)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 14:10:28 -0400 [View Commit](../../commit/88de6f425229e94204c491ec313fb6f5627e5839)
* Revert "attempting to fix precompile"
  * Travis Schneeberger on Fri, 3 Apr 2015 14:19:23 -0400 [View Commit](../../commit/0bb8dd92b3f020ed3bf5b558f13d0fde5a1dc97f)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 16:24:44 -0400 [View Commit](../../commit/c121570946cd8c1a4672ba3ade7ec2630ec8b86d)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 17:17:51 -0400 [View Commit](../../commit/d18ad43b5ef50726b0e463c9f695a47f153fb4a1)
* attempting to fix precompile
  * Travis Schneberger on Fri, 3 Apr 2015 18:09:57 -0400 [View Commit](../../commit/778e3d1004c1786f7ae65da72a40d031af8ad4fb)
* Revert "attempting to fix precompile"
  * Travis Schneeberger on Fri, 3 Apr 2015 18:15:28 -0400 [View Commit](../../commit/aee775ffe111bdcbb7e417ae4a7750300e688042)
* Update pom.xml  * Travis Schneeberger on Fri, 3 Apr 2015 20:30:22 -0400 [View Commit](../../commit/8e0e708802ae702e1f64ea6e6cf4bcf4806d3a1f)
* Update pom.xml  * Travis Schneeberger on Sat, 4 Apr 2015 00:50:06 -0400 [View Commit](../../commit/35e0dd33e841e1c606fad02734d802332e9773ab)
* Update pom.xml  * Travis Schneeberger on Sat, 4 Apr 2015 09:28:24 -0400 [View Commit](../../commit/768e003ff526fc0a826f7d5916491db80ccf46ba)
* release process
  * Travis Schneberger on Mon, 6 Apr 2015 10:16:45 -0400 [View Commit](../../commit/69b167e22afd71c8ea6dbbab40fd38ec777e635b)
* fix issues with person biosketch on prop dev
  * Joe Williams on Mon, 6 Apr 2015 08:28:26 -0500 [View Commit](../../commit/4a9d5ee0c8fb954e22a6d17f63619ab1e22582b3)
* Fix questionnaire test
  * Test was broken when switching viewing questionnaires from using the last document verison to using the database version always
  * blackcathacker on Mon, 6 Apr 2015 10:15:07 -0700 [View Commit](../../commit/8529b0d786b69d04ed2a98bced752aac7f7360e3)
* Fix questionnaire test -- apparently didn't stage changes
  * blackcathacker on Mon, 6 Apr 2015 16:09:09 -0700 [View Commit](../../commit/7ebc716812c82ca06b83d46783beb77d26326b4a)