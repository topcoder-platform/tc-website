<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder - Help</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>


<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_support"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyText">
<img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
<jsp:include page="../body_top.jsp">
    <jsp:param name="image" value="support"/>
    <jsp:param name="image1" value="white"/>
    <jsp:param name="title" value="TopCoder Web Site Change Log"/>
</jsp:include>

<p>
    5.4.14 - 2006.09.xx
    <ul>
        <li>
            Address address3 and province information to PACTS
        </li>
        <li>
            Add highest appeal percentage to the record book
        </li>
        <li>Add appeal data to member profile</li>
        <li>Show handle colors on the problem details as whichever is greater between High School and regular algorithm
            competitions.</li>
        <li>Add the point value of the problem to the problem detail page</li>

    </ul>
</p>

<p>
    5.4.13 - 2006.09.26
    <ul>
        <li>
            Fix bug in the technical assessment admin tool so that anyone can view the first page even if their account
            isn't configured for access.
        </li>
    </ul>
</p>

<p>
    5.4.12 - 2006.09.20
    <ul>
        <li>
            Fix bug in registration process where the registration selections can bet lost.
        </li>
        <li>When handles link to profiles, only use the absolute path (including server name) when necessary</li>
        <li>Add AOL Alerts pages</li>
    </ul>
</p>

<p>
    5.4.11 - 2006.09.14
    <ul>
        <li>
            Fix an error in viewing affidavits, and remove duplicate demographic fields within affidavits.
        </li>
        <li>
            Added banning users from member contact, so they can't send messages anymore. Also inactive users can't send
            messages.
        </li>
        <li>
            Fix score format to have 2 decimal digits in team results and individual result for high school.
        </li>
        <li>Fix bug in reg process that provide a "please login" error message when it should say "session expired"</li>
        <li>Don't allow someone to submit emtpy code in a marathon match</li>
        <li>Added in component contest page a link to download any submission for closed projects</li>
        <li>Allow admin search to return a maximum of 1000 records</li>
        <%--
                <li>
                    Reduce some of the logging when permission exceptions are thrown.
                </li>
        --%>
    </ul>
</p>

<p>
    5.4.10 - 2006.09.06
    <ul>
        <li>
            Fix some DB resource issues in the mass email system.
        </li>
    </ul>
</p>

<p>
    5.4.9 - 2006.08.31
    <ul>
        <li>Fix in password reset page: if the key has expired, it doesn't let the user even enter the new
            password.</li>
        <li>Add TCCC06 Component results site</li>
        <li>In all tournament sites, the components should not link to the catalog if they are not public
            components.</li>
        <li>Include referral information in studio registration</li>
    </ul>
</p>

<p>
    5.4.8 - 2006.08.28
    <ul>
        <li>Add resume download to registration process</li>
        <li>Refresh the cached value for registrants after someone registers for the tccc06 algo tournaments</li>
        <li>Change the text of the GCJ06 activation email to more correctly identify the appropriate JRE to have
            installed</li>
        <li>Fix emails when travel information is submitted for the TCCC</li>
        <li>Add new password recovery system using secret question and password resetting.</li>
    </ul>
</p>

<p>
    5.4.7 - 2006.08.21
    <ul>
        <li>Add previous/next links to the survey list page</li>
    </ul>
</p>

<p>
    5.4.6 - 2006.08.17
    <ul>
        <li>Fix bug in member contact that enabled non rated members to send messages.</li>
        <li>Fix bug in privatelabel registration process where one could not update the phone number on an account that
            did not already contain a phone number</li>
        <li>Fix the password reminder email for private label events so that doesn't munge non ascii characters</li>
        <li>fix XSS hole in all login pages</li>
        <li>Allow private label event users the ability to use any character in their password</li>
        <li>Add TCCC06 sponsor track registration</li>
        <li>Add AOL survey to tccc06 component registration</li>
        <li>Add AOL survey to tccc06 algorithm registration</li>
    </ul>
</p>

<p>
    5.4.5 - 2006.08.15
    <ul>
        <li>Attempt to fix up some strange behavior in the registration process</li>
    </ul>
</p>

<p>
    5.4.4 - 2006.08.14
    <ul>
        <li>Add TCCC06 forms</li>
        <li>Add automatic monitoring of review board eligibility</li>
        <li>Modify the Google Registration process to allow for non-competition TC users to convert their account.</li>
    </ul>
</p>

<p>
    5.4.3 - 2006.08.09
    <ul>
        <li>Google Code Jam Registration</li>
        <li>Fix bug in registration process where data wasn't cleaned up when there is an error</li>
        <li>Add reliability detail page</li>
    </ul>
</p>

<p>
    5.4.2 - 2006.08.07
    <ul>
        <li>DR Boards bug fix - didn't showed the current stage correctly.</li>
        <li>Add Python to Marathon Matches</li>
        <%--
                <li>Super mega profile search, phone search, last dev/design rating, most recent site visit</li>
        --%>
    </ul>
</p>

<p>
    5.4.1 - 2006.08.02
    <ul>
        <li>DR Boards updated to exclude non-rated projects.</li>
        <li>DR Boards tie break minor bug fix.</li>
    </ul>
</p>

<p>
    5.4.0 - 2006.07.31
    <ul>
        <li>Added Member Contact pages to send mails to other members and a black list.</li>
        <li>Adjust component registration process so that it prompts the user regarding registering for the tccc</li>
        <li>Add code to list the registrants for the algorithm and component portions of the tccc06</li>
    </ul>
</p>

<p>
    5.3.10 - 2006.07.26
    <ul>
        <li>Fix default sorting of Digital Run scoreboard's columns</li>
        <li>Fix bug in Marathon Match submission where a user could test examples, click browser back and then submit
            but it would test examples again</li>
        <li>Another attempt to improve the ACIDity of the reviewer reg process</li>
        <li>Fix the password reminder for people with ' in their name</li>
        <li>Make GPA, GPA Scale and resume fields in registration process not appear as required.</li>
        <li>Add tccc06 component competition registration</li>
        <li>Add tccc06 component results code</li>
        <li>Add tccc06 student rep results</li>
    </ul>
</p>

<p>
    5.3.9 - 2006.07.13
    <ul>
        <li>Fix problem details so that it doesn't crash the database</li>
        <li>Added outstanding points to the Digital Run scoreboards pages</li>
        <li>Added current contests page</li>
    </ul>
</p>

<p>
    5.3.8 - 2006.07.11
    <ul>
        <li>Fix bug in the password reminder system</li>
        <li>New site terms of use. The new terms don't include the clause about users notifying TopCoder if they are
            contacted by a 3rd party.</li>
        <li>Fix bug that caused error if one left fields blank while filling out employment preferences</li>
        <li>Added hs members to member search and corresponding fields to advanced search</li>
    </ul>
</p>

<p>
    5.3.7 - 2006.06.26
    <ul>
        <li>Don't show the message about being close the end of the round for practice Marathon Matches</li>
        <li>Add survey system</li>
        <li>Add potential winnings to the Digital Run leaderboard</li>
        <li>Additional PACTS changes for component paymnents</li>
    </ul>
</p>

<p>
    5.3.6 - 2006.06.21
    <ul>
        <li>Add warning message for the case that there is less than the submission rate time left in a marathon
            match</li>
        <li>Add unified registration process to the corporate and TopCoder Software sites.</li>
        <li>Show all matches in the Marathon Match active contests page, not just past 5</li>
    </ul>
</p>

<p>
    5.3.5 - 2006.06.13
    <ul>
        <li>Fix so that registration process actually updates password.</li>
        <li>Attempts to fix IE6 bug that does not allow it to upload a file across https</li>
    </ul>
</p>

<p>
    5.3.4 - 2006.06.12
    <ul>
        <li>Fix component registration process so that newbies can't register for more than 2 projects</li>
        <li>Fix component registration email.</li>
    </ul>
</p>

<p>
    5.3.3 - 2006.06.08
    <ul>
        <li>Fix a bug in HS room stats: it wasn't looking up correctly the room for a coder</li>
        <li>Fix HS team result page: it was displaying division placed instead of team points</li>
        <li>If there is an error on the name of the school entered, show it.</li>
        <li>Fix admin search to work with the new way of finding last rated event</li>
        <li>PACTS changes for component payments</li>
    </ul>
</p>

<p>
    5.3.2 - 2006.06.05
    <ul>
        <li>Fix professional registration report so that it displays title correctly</li>
        <li>Fix first page of registration so that if an existing user updates and gets an error, defaults for
            notifications and handle are populated correctly.</li>
        <li>Make UI adjustments for home schoolers in registration process</li>
        <%--  a bit too technical, don't show on site
                    <li>Fix country ranking tables in database to use floating point ratings rather than integer</li>
                    <li>Removed the region information from the round loading</li>
        --%>
        <li>Make the country to represent be the school's country for high school competitors</li>
        <li>Make it so that one can not register for a component before the registration period starts</li>
    </ul>
</p>

<p>
    5.3.1 - 2006.06.04
    <ul>
        <li>Add TCCC06 Logo Site</li>
        <li>In reg, on school search results, show country name not code</li>
        <li>Make schools added via the registration process be available to others for selection</li>
    </ul>
</p>

<p>
    5.3.0 - 2006.06.01
    <ul>
        <li>Allow for the ability to hide some schools in the registration process school search</li>
        <li>Only count active members in school registered member counts.</li>
        <li>Add final score to the marathon match site</li>
        <li>TopCoder High School Statistics</li>
        <li>Add SRM Details and SRM Rules pages for High School</li>
        <li>Only show active registrations as checked on registration selection page</li>
        <li>Don't allow professionals or those that have been unregistered from TCHS to register for TCHS</li>
    </ul>
</p>

<p>
    5.2.0 - 2006.05.30
    <ul>
        <li>Digital Run Stats Site</li>
        <li>Correct spelling error in the component registration process.</li>
        <li>Added referrals to registration process</li>
    </ul>
</p>

<p>
    5.1.1 - 2006.05.25
    <ul>
        <li>Bugfix for PACTS due to schema change</li>
        <li>If user doesn't have a default language set, use Java for viewing problem statements</li>
        <li>Bugfix store country/state for schools</li>
        <li>Add note to indicate that only US states are necessary</li>
    </ul>
</p>

<p>
    5.1.0 - 2006.05.24
    <ul>
        <li>New Registration Path</li>
        <li>Boatloads of DB schema changes and associated software changes</li>
        <li>GZIP output for tc and forums applications</li>
    </ul>
</p>

<p>
    5.0.11 - 2006.04.26
    <ul>
        <li>Add ability to have the same page highlight different left nav items</li>
    </ul>
</p>

<p>
    5.0.10 - 2006.04.24
    <ul>
        <li>Fix the next/previous links on the example history page for Marathon Matches</li>
        <li>Fix component reg. The end time was calculated incorrectly as well had whether or not they had won the
            design phase.</li>
        <li>Add Google Europe site.</li>
        <li>Fix bug in Marathon Match results where one couldn't scroll.</li>
    </ul>
</p>

<p>
    5.0.9 - 2006.04.04
    <ul>
        <li>Break out COM</li>
    </ul>
</p>

<p>
    5.0.8 - 2006.04.03
    <ul>
        <li>Some tweaks to the VeriSign reg process</li>
        <li>Seperate Coder of the Month archives</li>
    </ul>
</p>

<p>
    5.0.7 - 2006.03.28
    <ul>
        <li>Fix bug where login with invalid username would generate error page rather than nice message.</li>
        <li>Fix bug where password wouldn't get updated on an update.</li>
    </ul>
</p>

<p>
    5.0.6 - 2006.03.27
    <ul>
        <li>Don't redirect to login on a post.</li>
        <li>VeriSign Internal Competition Site</li>
        <li>Allow sponsor images to link</li>
    </ul>
</p>

<p>
    5.0.5 - 2006.03.22
    <ul>
        <li>The result set item tag for the case where the value is null. Was being escaped to "".</li>
        <li>Allow for sponsor images to have links.</li>
    </ul>
</p>

<p>
    5.0.4 - 2006.03.20
    <ul>
        <li>Fix the timezone on the assessment reminder email.</li>
        <li>Add component information to the profile pdf generation</li>
        <li>Change submit rate to 4 hours in marathon matches</li>
        <li>Change to 2 timers, one for submit, one for test in marathon matches</li>
        <li>Don't show score on the marathon match standings page.</li>
    </ul>
</p>

<p>
    5.0.3 - 2006.03.15
    <ul>
        <li>Change text at the top of the registration page to be more specific about sponsors and competitor
            information</li>
        <li>Don't link to the component catalog for custom components on:
            <ul>
                <li>Component Contest Details</li>
                <li>Scorecard Details</li>
                <li>Component Design Details</li>
                <li>Component Development Details</li>
                <li>Contest Status</li>
                <li>Registrants</li>
                <li>Component Earnings History</li>
                <li>Component Ratings History</li>
                <li>Reliability History</li>
            </ul>
        </li>
        <li>Fix the passed review/win statistics in the member profile for dev and design to not used placed as an
            indicator</li>
        <li>Change the win percentage record book page to require that one must place first and have a passing
            score</li>
        <%--
                    <li>Populate passed_review_ind</li>
                    <li>Allow for the ability to set up a project that allows appeal responses during appeals phase</li>
                    <li>Change the admin interface for component roles, auto populate them</li>
        --%>

    </ul>
</p>

<p>
    5.0.2 - 2006.03.13
    <ul>
        <li>Escape string data by default on rsc:item tag</li>
        <li>Escape text input tag data by default</li>
        <li>Speed up the marathon match results page</li>
        <li>Change the links in the project terms</li>
        <li>Fix email address in Google Code Jam Activation Email</li>
    </ul>
</p>

<p>
    5.0.1 - 2006.03.08
    <ul>
        <li>Fix timezones and times college tour page</li>
        <li>Fix Google India Content</li>
        <li>Add registrants and component details fields to contest status page</li>
        <li>Fix registrants query on active contests page to be at the time of registration rather than change over
            time</li>
        <li>When viewing marathon match results for a particular coder, move the the correct row when the page
            loads.</li>
        <li>Format Marathon Match results to have 0000 digits to the right of the decimal</li>
    </ul>
</p>

<p>
    5.0.0 - 2006.03.06
    <ul>
        <li>New left navigation</li>
        <li>Component Recordbook
            <ul>
                <li>Best Component Contest Winning Percentage</li>
                <li>Best Average Component Contest Placement</li>
                <li>Most Component Contest Wins</li>
                <li>Highest Component Contest Scores</li>
                <li>Most Component Contest Submissions</li>
                <li>Most Component Reviews</li>
                <li>Highest Component Contest Overall Earners</li>
                <li>Highest Component Contest Prize Earners</li>
                <li>Highest Component Contest Royalty Earners</li>
                <li>Largest Single Component Contest Prizes</li>
                <li>Highest Component Tournament Winnings</li>
            </ul>
        </li>
        <li>SRM Division Wins Page</li>
        <li>Top SRM Winners</li>
        <li>Match Archive</li>
        <li>Removed existing, and added new Component Contest Status Page</li>
        <li>Populate placed for all valid submissions even if they don't reach min. score</li>
        <li>Create and populate rating date for projects</li>
        <li>Adjust system to only use ph for the phase parameter, never pi</li>
        <li>link to the challenged code/arguments from the challenge list on coder room stats</li>
        <li>when you submit and time out in long comps, return to the submission page with the submitted code, not the
            most recent successful submission</li>
        <%--
                    <li>put logic behind the contest details links on the component page in the catalog</li>
        --%>
    </ul>
</p>

<p>
    4.1.13 - 2006.02.28
    <ul>
        <li>TCO06 Travel onsite Competitor/Review Board pages</li>
        <li>Fix bug in private label registration process where a user record could be deleted.</li>
    </ul>
</p>

<p>
    4.1.12 - 2006.02.24
    <ul>
        <li>Add google coder jam india 2006 registration</li>
        <li>Fix bug in TCO 06 component site where all position points include instead of top 4</li>
    </ul>
</p>

<p>
    4.1.11 - 2006.02.21
    <ul>
        <li>set headers throughout site so that proxies won't cache pages</li>
        <li>Add college images to the college tour description page</li>
        <li>Add example testing to the marathon matches site</li>
        <li>Add google coder jam india 2006 registration</li>
    </ul>
</p>

<p>
    4.1.10 - 2006.02.09
    <ul>
        <li>add search to recruiting reporting site</li>
        <li>add placement information to recruiting reporting site</li>
        <li>add contest details links to the tco06 component results pages</li>
        <li>fix bug that would not allow practice rooms to work for intel</li>
        <li>add marathon match admin site</li>
        <%--
                    <li>changed component download process to always require viewing of terms</li>
        --%>
    </ul>
</p>

<p>
    4.1.9 - 2006.01.30
    <ul>
        <li>tco06 component results site - placement points only for those that get over 75</li>
        <li>add the round name to the contest name in the marathon match site</li>
        <li>link from component catalog to the contest results</li>
        <li>store old rating as null in project_result if the competitor is not rated</li>
    </ul>

</p>

<p>
    4.1.8 - 2006.01.23
    <ul>
        <li>tco06 component results site</li>
        <li>some additional tweaks to make intel marathon matches work within the site</li>
        <li>added example information for marathon matches</li>
        <li>do a pseudo registration for practice rooms so that counts show correctly (room_result)</li>
    </ul>

</p>

<p>
    4.1.7 - 2006.01.16
    <ul>
        <li>Another attempt to improve the ACIDity of the reviewer reg process</li>
        <li>New reg code for component contests</li>
        <li>moved applet autodetect code to a file</li>
        <li>fixed bad applet links that didn't do autodetect</li>
    </ul>

</p>

<p>
    4.1.6 - 2006.01.09
    <ul>
        <li>some bug fixes/enhancements for the college tour pages</li>
        <li>changed how component registration questions are flaged in db</li>
    </ul>

</p>

<p>
    4.1.5 - 2006.01.04
    <ul>
        <li>allow people to see solutions (other than their own) for practice long contest rounds.</li>
        <li>passwords may only contains the characters we allow</li>
        <li>make the comp projects page a jsp, rename it active contests</li>
        <li>make the multiplier status page be a jsp and call it registrants</li>
        <li>some bug fixes/enhancements for the college tour pages</li>
        <li>changed how component registration questions are flaged in db</li>
        <li>be more particular about birth dates in pacts</li>
    </ul>

</p>

<p>
    4.1.4 - 2005.12.27
    <ul>
        <li>Added some additional transactional locking to the reviewer reg process.</li>
        <li>tco06 reg processing</li>
    </ul>

</p>

<p>
    4.1.3 - 2005 12.19
    <ul>
        <li>Marathon Match site Minor enhancements/bug fixes
            <ul>
                <li>Make paging on the standings page work</li>
                <li>Add total submission count to active contests page</li>
                <li>add language to standings page</li>
                <li>link to submission from submission history page if you're looking at your own stuff</li>
                <li>fixed bug in sorting tag where ignored parameters weren't actually ignored</li>
            </ul>
        </li>
    </ul>

</p>

<p>
    4.1.2 - 2005 12.15
    <ul>
        <li>Marathon Match site
            <ul>
                <li>Fix bug where language wasn't reflected in types for problem statement page from active
                    contests</li>
                <li>Fix bug where language wasn't reflected on reload of submit page in the args/return type</li>
                <li>Fix tc time link</li>
                <li>allow admins to see the probelm statement even though they are not reg'd</li>
                <li>only show contest link on submission history if results are available</li>
                <li>Forum links</li>
                <li>pending indicator on submission history and standings</li>
            </ul>
        </li>
    </ul>

</p>

<p>
    4.1.1 - 2005 12.14
    <ul>
        <li>Bug fixes for Marathon Match site</li>
    </ul>
</p>

<p>
    4.1.0 - 2005 12.12
    <ul>
        <li>Marathon Match Site</li>
        <li>College Tour Site</li>
    </ul>
</p>

<p>
    4.0.9 - 2005.12.08
    <ul>
        <li>Added text to the reliability rating page indicating that new competitors don't get a rating til they pass
            review, and that unreliable people can't register for more than 2 projects</li>
        <li>Added survey admin tool</li>
        <li>Changed default sort on component listing page to be date descending</li>
        <li>Make extra sure a tc member can't create a dup account for a private label events</li>
        <li>Color handles on the review project details page</li>
        <li>Fix bug in demo reg where security user not created</li>
    </ul>
</p>

<p>
    4.0.8 - 2005.11.21
    <ul>
        <li>bug fix for uploading resumes</li>
    </ul>
</p>

<p>
    4.0.7 - 2005.11.18
    <ul>
        <li>finished up the results page for condorcet schulze elections</li>
        <li>minor changes in google china site</li>
    </ul>
</p>

<p>
    4.0.6 - 2005.11.15
    <ul>
        <li>increased size limit on user_placement.value and changed the code to enforce it</li>
        <li>improved the validation on review board applications. 1. so that one can't apply for a
            design position that is taken. 2. so that one can't apply with an invalid review resp</li>
        <li>Added coder achievements page</li>
        <li>added ability to make the results of a survey not viewable</li>
        <li>enforced the dates on a survey. only during that time can one respond to it</li>
        <li>Google China 2005 site</li>
    </ul>
</p>

<p>
    4.0.5 - 2005.11.01
    <ul>
        <li>Added additional questions to placement registration</li>
    </ul>
</p>

<p> 4.0.4 - 2005.10.24
    <ul>
        <li>Added forum links to round stats, round overview, problem details, match editorial
            and room stats.</li>
        <li>Added TCO06 Logo Contest site</li>
    </ul>
</p>

<p> 4.0.3 - 2005.10.04
    <ul>
        <li>Changes relating to the new component reliability formula.
            <ul>
                <li>Split reliability rating in member profile</li>
                <li>If your reliability is <70% you can't register for more than 2 projects</li>
            </ul>
        </li>
    </ul>
</p>

<p> 4.0.2 - 2005.09.27
    <ul>
        <li>Changed links in the registration activation email to the schedule</li>
        <li>Added link to forums from the srm details page</li>
        <li>Fixed bug in Internal PACTS where affirming an affidavit with no payment set payment id to 0</li>

    </ul>
</p>

<p> 4.0.1 - 2005.09.13
    <ul>
        <li>Made the top color handle based on highest rating</li>
        <li>Allowed existing members that don't meet current handle criteria to update their profile without a
            handle change</li>
    </ul>
</p>

<p> 4.0.0 - 2005.08.31
    <ul>
        <li>Migrated to new application server and Java 1.4.2</li>
    </ul>
</p>

</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>