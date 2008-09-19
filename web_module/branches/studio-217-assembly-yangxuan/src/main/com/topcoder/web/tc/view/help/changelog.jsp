<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


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
    5.14.16 - 2008.04.29
    <ul>
        <li>[PACTS-2] - Remove "Global AD" nomenclature from the front end -pulky</li>
        <li>[PACTS-5] - Make it possible to pay for AMD marathon matches -pulky</li>
    </ul>

</p>

<p>
    5.14.15 - 2008.04.24
    <ul>
        <li>Application Testing registration pages released -pulky</li>
    </ul>

</p>

<p>
    5.14.14 - 2008.04.22
    <ul>
        <li>Assignment Document v2 released -pulky</li>
    </ul>

</p>

<p>
    5.14.13 - 2008.04.16
<ul>
    <li>[TCWEB-191] - add component catalog data feed -dok</li>
    <li>[TCWEB-218] - make AMD marathon match practice rooms work -dok</li>
</ul>
</p>

<p>
    5.14.12 - 2008.04.14
<ul>
    <li>[TCWEB-111] - registration session problem -dok</li>
    <li>2008 Assembly DR -pulky</li>
</ul>
</p>


<p>
    5.14.11 - 2008.04.02
<ul>
    <li>Going back to the old assembly registration pages -pulky</li>
    <li>Added contest status pages for assembly and architecture -pulky</li>
</ul>
</p>

<p>
    5.14.10 - 2008.03.24
<ul>
    <li>Upgrade query system to servlet spec 2.4 -dok</li>
    <li>Add link to query tool command results in reporting tool -dok</li>
    <li>Fix bug in a number of data feeds where their data sources weren't set -dok</li>
    <li>Change cache time for data feeds to 3 hours rather than 3 days -dok</li>
</ul>
</p>

<p>
    5.14.9 - 2008.03.17
<ul>
    <li>Fixed [TCWEB-118] Studio Tournament results doesn't rank correctly -pulky</li>
    <li>Make it possible to direct data feeds at different datasources -dok</li>
    <li>Fix bug in registration where someone with a cookie would get an error rather than being asked to login -dok
    </li>
    <%-- update security_perms set permission = permission || ' dsid: 27' where permission like 'DataDump%';--%>
</ul>
</p>

<p>
    5.14.8 - 2008.03.13
<ul>
    <li>Add page that describes how to build a member photo - dok</li>
    <li>Fix bug in registration where if someone selects a school where we don't know if it's a college
        or high school, the user can not register - dok
    </li>
</ul>
</p>

<p>
    5.14.8 - 2008.03.12
<ul>
    <li>Adjust logic to make sure that high schools are set as viewable in reg -dok</li>
    <li>Adjust logic so that AMD Marathon matches work - dok</li>
</ul>
</p>

<p>
    5.14.7 - 2008.03.04
<ul>
    <li>Tweaks to registration for OpenAIM site -dok</li>
</ul>
</p>

<p>
    5.14.6 - 2008.03.03
<ul>
    <li>Fix bug in registration process where downloading the resume would make it impossible to save your changes -dok
    </li>
    <li>Fix bug in TCO08 studio leaderboard where it was counting the top 5 submissions rather than 6 -pulky</li>
</ul>
</p>

<p>
    5.14.5 - 2008.02.21
<ul>
    <li>Add TCO08 travel info site -dok</li>
    <li>Changed DR to be able to adjust how many points a project is worth -pulky</li>
    <li>Added DR points to design and development active pages -pulky</li>
    <li>Adjust cookie behavior so that SSO is not shared to privatelabel -dok</li>
    <li>Add new method to get the sponsor images in the arena -dok</li>
</ul>
</p>


<p>
    5.14.4 - 2008.02.14
<ul>
    <li>Fix bug in registration where someone couldn't update their school to a school that they're creating -dok</li>
</ul>
</p>

<p>
    5.14.3 - 2008.02.11
<ul>
    <li>Add JSON output option for data feeds -dok</li>
    <li>Remove the requirement for reliability from registering for components -TonyJ</li>
</ul>
</p>

<p>
    5.14.2 - 2008.01.30
<ul>
    <li>Fixed [TCWEB-73] False disabled member contact on member contact page -pulky</li>
    <li>TCO08 RSVP page -pulky</li>
    <li>Add report for TCO '08 reg -dok</li>
    <li>Cache report results for 15 minutes -dok</li>
    <li>Don't link from a contest name on mm active contests to the details page if it's a tournament round -dok</li>
</ul>
</p>

<p>
    5.14.1 - 2008.01.21
<ul>
    <li>TCO08 minisite results pages -pulky</li>
    <li>Infrastructure to do RSS feeds -dok</li>
</ul>
</p>

<p>
    5.14.0 - 2008.01.11
<ul>
    <li>TCO08 minisite -pulky</li>
    <li>Added note to registration that user names can't be changed -dok</li>
</ul>
</p>

<p>
    5.13.9 - 2008.01.09
<ul>
    <li>New 2008 DR design and development boards -pulky</li>
</ul>
</p>

<p>
    5.13.8 - 2008.01.02
<ul>
    <li>Changed pacts add payment functionality so that the client is asked for more payment types. (new flag in the DB)
        -pulky
    </li>
    <li>Changes reliability generation so that the reliability payment uses the parent's client information -pulky</li>
    <li>New component download restrictions -pulky</li>
</ul>
</p>


<p>
    5.13.7 - 2007.12.18
<ul>
    <li>Updated company address -dok</li>
</ul>

</p>

<p>
    5.13.6 - 2007.12.11
<ul>
    <li>Architecture competition pages -pulky</li>
    <li>College tour pages enhancements -pulky</li>
</ul>

</p>

<p>
    5.13.5 - 2007.12.03
<ul>
    <li>Remove poseidon from the component registration succes email text -dok</li>
    <li>Allow accounting group to associate studio reviewer payments with projects -dok</li>
</ul>

</p>

<p>
    5.13.4 - 2007.11.26
<ul>
    <li>PACTS
        <ul>
            <li>Added new component enhancements payment -pulky</li>
            <li>Bug fixes payment changed to reference a component project -pulky</li>
            <li>Admit updating all payments (no matter their status)
                in the supervisor update page -pulky
            </li>
        </ul>
    </li>
</ul>

</p>

<p>
    5.13.3 - 2007.11.12
<ul>
    <%--
            <li>Component contest details page and Submission download processor updated
                to use catalog ids instead of descriptions -pulky</li>
    --%>
</ul>

</p>

<p>
    5.13.2 - 2007.11.08
<ul>
    <li>Updated cache clearing to be done locally in the cache server -pulky</li>
</ul>

</p>


<p>
    5.13.1 - 2007.11.07
<ul>
    <li>Don't clear the cache when someone registers, there's nothing to clear, and it's slow to try -dok</li>
</ul>

</p>


<p>
    5.13.0 - 2007.10.25
<ul>
    <li>Add Educational Platform -pulky</li>
    <li>Adjust registration process to allow professor registration -dok</li>
    <li>Bug fix for the case when the db insert of a new user fails, it would damage the session data - dok</li>
</ul>

</p>

<p>
    5.12.6 - 2007.10.23
<ul>
    <li>Fix bug in simple search results where if you sorted and scrolled, it would lose your sort -dok</li>
    <li>Adjust the press room look and feel and add an info request form - dok</li>
</ul>

</p>

<p>
    5.12.5 - 2007.10.16
<ul>
    <li>Fix bug in search results where if you sorted, and scrolled, it would lose your sort -dok</li>
    <li>Adjust development registration email content to include TC UML tool -dok</li>
    <li>Include link to unregister from TopCoder HS on My TopCoder Page -dok</li>
    <li>Fix link to submission history on marathon match results page -dok</li>
    <li>Adjust terms of work for component projects -dok</li>
    <li>Adjust PACTS to be less possessive of connections (shorter wait) -dok</li>
</ul>

</p>

<p>
    5.12.4 - 2007.09.26
<ul>
    <%--
            <li>update so that no code uses the stored procedure for id's anymore -dok</li>
    --%>
    <li>Add some more properties to the intro event admin tool -dok</li>
    <li>Add payment type to PACTS for college tour reps -dok</li>
</ul>

</p>

<p>
    5.12.3 - 2007.09.24
<ul>
    <li>Adjust intro event admin tool to better support results -dok</li>
    <li>Backend changes for marathon matches (applet based competition) -dok</li>
</ul>

</p>

<p>
    5.12.2 - 2007.09.18
<ul>
    <li>Add results for algorithm intro events -dok</li>
</ul>

</p>

<p>
    5.12.1 - 2007.09.13
<ul>
    <li>Fix Unicode escaping in assignment docs and affidavits -pulky</li>
    <li>Allow remember me for login to marathon match site -dok</li>
    <li>Add cookie to remember the selected Top 10 in the home page -cucu</li>
    <li>Add page that lists the marathon coders for a school -cucu</li>
    <li>Add school rank in marathon tab for member profile -cucu</li>
</ul>
</p>

<p>
    5.12.0 - 2007.09.06
<ul>
    <li>Signle Sign On -dok</li>
    <li>Fix Unicode escaping in assignment docs and affidavits -pulky</li>
    <li>Fix payment's paid date -pulky</li>
    <li>Fix users can see their own payments details no matter their privacy settings -pulky</li>
    <%--<li>PACTS refactor to remove tcwebcommon.jar dependency in services -pulky</li>--%>
    <li>Marathon Match Stats -cucu
        <ul>
            <li>Enhanced member profile tab for marathon matches, adding data and graphics</li>
            <li>Add Data Feeds for Marathon Matches</li>
            <li>Updated the Left navigator to be more congruent with algo</li>
            <li>Add match list page</li>
            <li>Add match winners page</li>
            <li>Update Active Contest page to just display the active contests instead of all</li>
            <li>Add search by Marathon Matches criteria in advanced search, as well as columns in the result</li>
            <li>Add Record Book pages for Marathon Matches</li>
            <li>Add Top Ranks for Marathon Matches</li>
            <li>Add Country Rank for Marathon Matches</li>
            <li>Add Top 10 for Marathon Matches in home pagea</li>
            <li>Improved speed for View System Test Results page</li>
        </ul>
    </li>
</ul>
</p>

<p>
    5.11.1 - 2007.09.05
<ul>
    <li>Add tccc07 sponsor track advancers -dok</li>
</ul>
</p>

<p>
    5.11.0 - 2007.08.30
<ul>
    <li>New My Topcoder pages and user preferences -pulky</li>
    <li>Added the possibility for a user to hide his payment information -pulky</li>
</ul>
</p>

<p>
    5.10.19 - 2007.08.21
<ul>
    <li>Allow people rated in anything to apply for a job, not just algo -dok</li>
</ul>
</p>


<p>
    5.10.18 - 2007.08.20
<ul>
    <%--<li>Made some refactoring to avoid com.topcoder.web.common -> com.topcooder.web.tc dependencies -cucu, pulky</li>
        <li>fixes in the PactsClientServices to avoid distributing PactsServices -pulky</li> --%>
    <li>Added tccc07 algo and marathon results pages -pulky</li>
    <li>Added tccc07 algo qualification and section pages -pulky</li>
</ul>
</p>

<p>
    5.10.17 - 2007.08.08
<ul>
    <li>Added payment type for High School Tournament Prizes -cucu</li>
    <li>Limit address1,2,3 fields to 100 characters in registration -dok</li>
    <li>Allow people that aren't registered for the match to view marathon match problems -dok</li>
    <li>Allow reports to be downloaded as CSV -dok</li>

</ul>
</p>

<p>
    5.10.16 - 2007.08.06
<ul>
    <li>Added TCCC07 component and studio results pages -pulky</li>
    <li>Fixed TCCC07 sections preferences page to show an error to the user when he's not registered for the
        tournament-pulky
    </li>
    <li>Fixed but where someone with no default language could not see marathon match problems -dok</li>
</ul>
</p>

<p>
    5.10.15 - 2007.08.02
<ul>
    <li>Fix bug where affidavit update and affirmation at the same time wasn't atomic -pulky</li>
    <li>Added page to be able to change TCCC07 sections -pulky</li>
    <li>Fix bug where someone that is not registered for competitions couldn't see a marathon match problem
        statement (default their langauge to java) -dok
    </li>
    <li>Adjust EJB exception handling to be more in line with the ejb spec with regards to application exceptions
        -dok
    </li>
</ul>
</p>

<p>
    5.10.14 - 2007.07.30
<ul>
    <li>PACTS fixes -pulky
        <ul>
            <li>Add canceled and deleted status for affidavits.</li>
            <li>Check for existance of an affidavit for a specific round before adding a new one. (no dup affidavits
                for the same round)
            </li>
            <li>Add automatic affidavit/AD cancellation when the corresponding payment is
                deleted/cancelled/expired.
            </li>
            <li>fix payment cancelation due to cheaters</li>
        </ul>
    </li>
    <li>Add professor nomination program -dok</li>
    <li>Add TCCC07 sponsor track -dok</li>
    <%--<li>Set compile and target jvm to 1.5 for jsp's -dok</li>--%>
</ul>
</p>

<p>
    5.10.13 - 2007.07.25
<ul>
    <li>Professionals registering for TCCC07 components won't get the not-registered warning -pulky</li>
</ul>
</p>

<p>
    5.10.12 - 2007.07.23
<ul>
    <li>Marathon Matches available language by round -mural</li>
    <li>Add payment types for Studio and Marathon tournamnets -cucu</li>
    <li>Fix bug where group rows were deleted/inserted rather than updated -dok</li>
    <li>Fixed TCCC07 algorithm registration to ask for sections -pulky</li>
</ul>
</p>

<p>
    5.10.11 - 2007.07.19
<ul>
    <li>TCCC07 registration. - pulky</li>
    <li>Fixed hs registration to use survey questions. - cucu</li>
</ul>
</p>

<p>
    5.10.10 - 2007.07.12
<ul>
    <li>Add HS registration and unregistration for seasons. - cucu</li>
</ul>
</p>

<p>
    5.10.9 - 2007.07.09
<ul>
    <li>Add "and climbing" icon in some stats. -cucu, nick</li>
    <li>Fixed bug that didn't allow to affirm an Assignment Document without a corresponding payment. -pulky</li>
</ul>
</p>

<p>
    5.10.8 - 2007.06.28
<ul>
    <li>Make the left nav a bit more efficient by removing the server name from link when not necessary. -dok</li>
    <li>Assignment Document database related bugfix. -pulky</li>
</ul>
</p>


<p>
    5.10.7 - 2007.06.18
<ul>
    <li>Online Assignment Document affirmation time changed from 5 days to 3. -pulky</li>
    <li>Assignment Document launch -dok</li>
</ul>
</p>

<p>
    5.10.6 - 2007.06.14
<ul>
    <li>Fix validation in component registration process to make sure a reviewer can not compete on a project that
        they reviewed -dok
    </li>
    <li>New license key for Poseidon -dok</li>
    <li>Fixed expiration date message in assignment document's internal page -pulky</li>
</ul>
</p>

<p>
    5.10.5 - 2007.06.13
<ul>
    <li>If the user goes to the old affidavit history link, redirect them to the new page -dok</li>
</ul>
</p>


<p>
    5.10.4 - 2007.06.11
<ul>
    <li>Fixed PACTS algorithm round payment generation-pulky</li>
</ul>
</p>

<p>
    5.10.3 - 2007.06.07
<ul>
    <li>Added 2007 picnic RSVP-pulky</li>
    <li>fix: Updates of the payment's charity flag is handled properly by the payment status manager-pulky</li>
    <%--<li>fix: payment status descriptions are retrieved from the database-pulky</li>--%>
</ul>
</p>

<p>
    5.10.2 - 2007.06.04
<ul>
    <li>Marathon Match details and rules pages -dok</li>
    <li>Referral payments detached from parents -pulky</li>
    <%--<li>Payment's modification date auditory fixed -pulky</li>--%>
</ul>
</p>

<p>
    5.10.1 - 2007.05.31
<ul>
    <li>Pacts payment statuses reengeneering -pulky
        <ul>
            <li>Payment's status process is now consistent and event driven.</li>
            <li>All status descriptions are now indicative of what they are.</li>
            <li>Added a new payment status "Entered into Payment System".</li>
            <li>Removed print payments and related statuses and concepts.</li>
            <li>Allowed payments to be updated to "Paid" either in batch or individually.</li>
            <li>Removed the concept of reviewing payments.</li>
            <li>Cheater's payments are nightly marked as "Cancelled due to account status".</li>
            <li>Added a new status for payments called "Accruing". This means that the user does not want to get
                paid right now. Once a certain amount builds up for the user, the payments will actually be sent.
            </li>
            <li>Existing payments migrated to the new status schema.</li>
            <li>If a payment is all set (tax form on file etc) create it with status owed rather than pending.</li>
            <li>Improved layout for payments lists, new features such as sorting.</li>
            <li>New page to set accrual limits.</li>
            <li>New supervisor page for manual status updates.</li>
            <li>The referred payment have the parent status until the
                parents make it to owed. Then, the referred payment should have it
                own detached status.
            </li>
            <li>Pacts queue removed.</li>
        </ul>
    </li>
    <li>Add best rank, # wins, # top 5 finishes and # top 10 finishes to marathon match member profile stats -dok
    </li>
    <li>Only accept POST requests during reviewer sign up -dok</li>
</ul>
</p>

<p>
    5.10 - 2007.05.23
<ul>
    <li>Changed Digital Run DB schema and pages to work for DR 2007.5 -cucu</li>
    <li>Add page in PACTS to create Digital Run payments automatically -cucu</li>
    <li>Fixed scorecard to display weights as float -cucu</li>
    <li>Changed Reliability Bonus amounts -cucu</li>
</ul>
</p>

<p>
    5.9.3 - 2007.05.21
<ul>
    <li>Don't cache marathon match data for too long, it's too big -dok</li>
    <li>Add component name filter on component past contests page -dok</li>
    <li>Remove queue from PACTS -dok</li>
    <li>New Poseidon license key in the component registration email -dok</li>
</ul>
</p>

<p>
    5.9.2 - 2007.05.09
<ul>
    <li>Enable C++ components -dok</li>
</ul>
</p>


<p>
    5.9.1 - 2007.05.07
<ul>
    <li>Avoid NPE in component registration if a event has no dates associated -dok</li>
    <li>Show friendly message on the component current contests page if the user has none -dok</li>
    <li>Make result sets sort nulls a bit more intelligently. Always sort them to the bottom -dok</li>
    <li>Enhancements to the Assignment Document functionality in order to accelerate the process -pulky</li>
    <%--    <li>New button in pact that verifies owed payments before printing -pulky</li>--%>
</ul>
</p>

<p>
    5.9.0 - 2007.05.02
<ul>
    <li>Replace custom distrubuted cache with jboss cache -dok</li>
    <li>Add Introductory Events Component pages, as well as admin and PACTS pages for those events - cucu</li>
</ul>
</p>

<p>
    5.8.11 - 2007.04.26
<ul>
    <li>Marathon Match enhancement to allow us to rerun / rescore any type of marathon submission -competition
        team
    </li>
    <li>Category column added to competition history page -pulky</li>
    <%--<li>TCSLoad bugfix: project with deleted status are processed and all related data in the dw is fisically deleted -pulky</li>--%>
    <li>Fix in pacts: installment was set to 1 when doing a batch status -cucu</li>
    <li>Cluster application servers -dok</li>
</ul>
</p>

<p>
    5.8.10 - 2007.04.19
<ul>
    <li>TCO07 RSVP -pulky</li>
    <li>Bug fix for demographic information in PACTS -cucu</li>
</ul>
</p>

<p>
    5.8.9 - 2007.04.03
<ul>
    <li>Take advantage of generics for general in-memory data container -dok</li>
    <li>Fix bug in algorithm consecutive rating increase -cucu</li>
    <li>Fix bug in affirm affidavits for HS coders -cucu</li>
    <li>Add "and climbing" in stat pages for consecutive ranks -cucu, nick</li>
    <!-- <li>Add is current flag in record books -cucu</li>  -->
</ul>
</p>


<p>
    5.8.8 - 2007.03.29
<ul>
    <%--<li>Bugfix: Rboard payments were generated by default with on-hold Pending AD status. There was also another addition to be able to switch on/off this default - pulky</li>--%>
    <%--<li>00/00/00 changed to Not Filled when showing a user tax form with empty filled date - pulky</li>--%>
    <li>Format date differently on the component tournament member results pages - dok</li>
    <li>Adjust pathes of tco07 component tournament results pages - dok</li>
    <li>Add Most Best Score stat for algorithms - cucu</li>
    <li>Fix bug in condorcet schulze results that basically inverted the results -dok</li>
    <li>Submission download: the custom components can't be downloaded anymore, except by admins - cucu</li>
    <li>Add Ball bug report form -dok</li>
    <%--<li>Add component contest result for Belgrade College Tour - cucu<li>--%>
</ul>
</p>


<p>
    5.8.7 - 2007.03.26
<ul>
    <li>Changed password length from 15 to 30 chars. - cucu</li>
    <li>TCO07 marathon registrants page updated to show seed -pulky</li>
    <li>TCO07 marathon match results - dok</li>
    <li>TCO07 Component results pages - dok</li>
    <li>Add Assignment Document functionality -pulky</li>
    <li>Add handle in the recovery password email. - cucu</li>
    <li>Allow members that are only registered for TCHS to be found in Pacts -dok</li>
    <li>Add division placed to algorithm competition history -dok</li>
    <%--<li>When creating payments, the corresponding referral payment gets his parent's status -pulky</li>--%>
</ul>
</p>


<p>
    5.8.6 - 2007.03.19
<ul>
    <li>Add studio results to the tco07 site -dok</li>
    <li>Add standarized way to sort component competitions in the order in which they were rated- cucu</li>
    <li>Add support for many simultaneous events in Visa Letters - cucu</li>
</ul>
</p>

<p>
    5.8.5 - 2007.03.15
<ul>
    <li>Fix bug in component registration process where everyone gets warned about not being registered (even if
        they are registered) -dok
    </li>
</ul>
</p>
<p>
    5.8.4 - 2007.03.14
<ul>
    <li>Add the suspended flag for component versions - cucu</li>
    <li>In submission download and scorecard views, added granular permissions for viewing incomplete projects -
        cucu
    </li>
    <li>Load for record books: fixed srm consecutive appeareances to skip non rated rounds - cucu</li>
    <li>Fix bug in admin system where placement profiles could not be generated without a client logo - dok</li>
    <li>Java 1.5 -dok</li>
</ul>
</p>
<p>
    5.8.3 - 2007.03.08
<ul>
    <li>Fix bug in link tracking system where it didn't track the referrer - dok</li>
    <li>Fix link to room in HS problem solution page - cucu</li>
    <li>Add links in the brad crumb for problem solution page - cucu</li>
</ul>
</p>
<p>
    5.8.2 - 2007.03.07
<ul>
    <li>Member Contact not rated member message changed to not specify the competition.</li>
    <li>Final changes to tco 07 sponsor track site</li>
    <li>Add code for marathon match tournament round.</li>
</ul>
</p>
<p>
    5.8.1 - 2007.03.01
<ul>
    <li>Added registration for CSDN 07</li>
    <li>Added an Advanced column to HS round result</li>
    <li>Added registration restrictions to Marathon Match registration for invitation only rounds</li>
    <li>Added registration logic to Marathon Match so that tournament competitors can not register for the non
        tournament version of their round
    </li>
    <li>added sponsor track registration for tco</li>
    <li>added tco component results site</li>

</ul>
</p>


<p>
    5.8.0 - 2007.02.27
<ul>
    <li>Add Visa Letter Request system</li>
    <li>Re-add column team points in HS teams statistics (it was commented out because the values were incorrect)
    </li>
    <li>Project registration code was updated so assembly projets won't interfere with component reliability.</li>
    <%--<li>Project load was fixed to get those project that weren't modified but have related rows
modified in at least one of these tables: resource, submission, upload, project_result.</li>--%>
    <li>Add a data feed for component project results</li>
    <li>Upgrade to Config manager 2.1.5 and File Upload 2.0</li>
</ul>
</p>

<p>
    5.7.2 - 2007.02.21
<ul>
    <li>Assembly registration pages updated to use the new forums</li>
    <li>New automated assembly registration pages go live</li>
</ul>
</p>

<p>
    5.7.1 - 2007.02.19
<ul>
    <li>Fixed bug on TCO07 registrants page</li>
</ul>
</p>

<p>
    5.7.0 - 2007.02.15
<ul>
    <%--<li>Add TCO07 registration backend</li>--%>
    <li>Include icon on active contests pages for tournament component projects</li>
    <li>Prompt user if they are not registered for tco07 and are registering for a component</li>
    <li>Add region column to TCHS07 registrants page</li>
</ul>
</p>

<p>
    5.6.5 - 2007.02.13
<ul>
    <li>Add TCHS07 registrants page</li>
</ul>
</p>

<p>
    5.6.4 - 2007.02.12
<ul>
    <li>Add TCHS07 registration page</li>
    <%--<li>New backend for tournament registration</li>--%>
    <%--<li>RatingTag was taken out since it is no longer in use</li>--%>
    <li>Fixed bug when showing a problem with Matrix2D data type</li>
    <%--<li>TCS Loader: Added filter by elegibility (just open projects)</li>--%>
    <li>When submiting a long contest, if the round id, contest id and component id are not consistent, throw an
        exception
    </li>
    <%--<li>When registering for a long round, the room_id is not looked up anymore, it wasn't needed.
after deploying, the query and command long_contest_find_room can be deleted </li> --%>
    <li>Studio payments shown in My Topcoder Payments</li>
    <li>PACTS bug fix: client didn't appear when updating a payment</li>
</ul>
</p>

<p>
    5.6.3 - 2007.02.01
<ul>
    <li>Fix bug in pacts that was missing to fill the due date when generating round payments, and the amount for
        referrals
    </li>
    <li>Include serbia on the HS regions page</li>
    <%--
            <li>Member contact was fixed to get rated users from transactional db rather than dw.</li>
    --%>
    <li>Added an admin tool for cleaning schools and utilities to fix team points</li>
    <li>In Payment History, added the installment number and total if the payment is not for the total</li>
    <li>PACTS: fixed a bug when updating the status in batch mode; the total amount was replaced by gross</li>
</ul>
</p>

<p>
    5.6.2 - 2007.01.23
<ul>
    <li>Fix for DR boards to go to the first page of the board when changing stages</li>
    <li>Fix for member profile to not show "Not Rated" in Marathon Match tab when users are not rated but have
        competed in a contest
    </li>
    <li>Fix the prev link in component competition history</li>
    <li>Allow studio competitors to upload a photo</li>
    <li>Fix bug in the load of componente streaks. Also, now the projects were the coder didn't reach the minimum
        score are taken into account.
    </li>
</ul>
</p>

<p>
    5.6.1 - 2007.01.17
<ul>
    <li>Added Marathon Match rating to the user profile and updated the handle links in Marathon Match pages</li>
    <li>PACTS: when adding or updating a payment, a 2 digit year is converted to 4 (07 will be 2007)</li>
    <li>Fix in the registration: the school was loaded more than once if confirmation page was reloaded</li>
    <li>Adjust how survey responses are stored in the database <%--from TEXT to lvarchar--%></li>
</ul>
</p>


<p>
    5.6.0 - 2007.01.15
<ul>
    <li>Add system driven Active Contests, registrants, project details and registration for assembly
        competitions.
    </li>
</ul>
</p>

<p>
    5.5.16 - 2007.01.1
<ul>
    <li>PACTS: when a tax form is added for a user, their payments are updated.</li>
    <li>PACTS: if an affidavit is affirmed, the status of its payment doesn't change from on hold if the user
        doesn't have a tax form.
    </li>
    <li>PACTS: fix in the code for expiring affidavits</li>
</ul>

</p>

<p>
    5.5.15 - 2007.01.09
<ul>
    <li>Fix bug in component registration process when detmining how many projects unreliable competitors have
        currently ongoing
    </li>
    <li>Fixed code for displaying flash objects in member profile to work without activation in IE</li>
    <li>Fixed Member Contact code and enhancements to allow admins not rated to send messages and to try to
        avoid that members that can't receive messages won't send contact information.
    </li>
</ul>
</p>

<p>
    5.5.14 - 2007.01.08
<ul>
    <li>Automatic monitoring of review board eligibility fix.</li>
    <li>Split payments into Design/dev support in payment detail</li>
    <li>PACTS: support for splitting payments into Design/dev support</li>
    <li>PACTS: payments can be due in the 15th or after a number of days</li>
    <li>PACTS: component and their reliability payments are grouped together</li>
    <li>Fixed project status codes in Data Warehouse</li>
</ul>
</p>

<p>
    5.x.x - 2007.02.xx
<ul>
    <li>Upgrade to file upload version 2.0</li>
</ul>
</p>
<p>
    5.5.13 - 2006.12.21
<ul>
    <%--
            <li>Rename some classes for the Google Latin America Reg. Process.</li>
    --%>
</ul>
</p>


<p>
    5.5.12 - 2006.12.20
<ul>
    <li>Fixed EJB configuration bug where transactions were bean managed but should have been container managed.
    </li>
    <%--
            <li>Google Latin America Reg. Process.</li>
    --%>
    <li>Include poseidon license in development registration emails.</li>
</ul>
</p>


<p>
    5.5.11 - 2006.12.18
<ul>
    <li>Fixed a bug in pagination when the user clicked on back in the browser.</li>
    <li>Fix round types that are shown when creating payments in pacts.</li>
    <li>In affidavit list for users, the days to expire is not shown anymore if the affidavit is not of contest
        winning type (the only type being currently expired)
    </li>
    <li>Fixes in Reporting page for searching: sorting some columns throw error, and fixed the queries to use the
        new OR schema
    </li>
    <li>When search for schools in the registration process, assume that the user wants to search for *&lt;input&gt;*
    </li>
    <li>Allow users to see their own responses to survey's they've answered</li>
</ul>
</p>
<p>
    5.5.10 - 2006.12.04
<ul>
    <li>Fix a bug to consider only active inquired projects for low reliability registration limits</li>
    <li>Fix a bug when expiring old payments</li>
    <li>Add in rating history the percentile column.</li>
    <li>Add a column "Challenge Time" for challenges and defenses for regular and hs competitions stats</li>
    <li>Add testers in problem detail</li>
    <li>New component stats added
        <ul>
            <li>Best Average Component Contest Score</li>
            <li>Most Submission Reviews</li>
            <li>Highest Rating Point Gain</li>
            <li>Impressive Debuts</li>
            <li>Consecutive Winnings</li>
            <li>Consecutive 1st or 2nd place</li>
            <li>Consecutive Rating Increase</li>
        </ul>
    </li>
    <li>Fix utility to pay reliability bonus to work with the new Online Review schema</li>
    <li>Add Consecutive SRM Appearances to Algorithm Record Book</li>
</ul>
</p>


<p>
    5.5.9 - 2006.11.20
<ul>
    <li>Design and Development Active Contests columns are now sorteable</li>
    <li>Fix bug in the member card preview. It would error out if a person that is only rated in TC HS attempted to
        view his/her card
    </li>
    <li>Add calendars in pacts internal search pages</li>
    <li>Fix bug when loading ratings to DW to take into account when the user was not actually rated in the round
    </li>
    <li>New payment types added to PACTS
        <%--
                    <ul>
                        <li>Architecture Review Payment</li>
                        <li>Specification Review Payment</li>
                        <li>Assembly Competition Review</li>
                    </ul>
        --%>
    </li>
    <li>Fix when generating payment component, the reviewers must get paid just what is marked as paid</li>
    <li>Add problem writer to the problem details and problem archive pages</li>
    <li>Fix a problem in IE when pasting a large text in member contact</li>
    <%--
    on hold for now
            <li>Add reviewer role in component stats page for development</li>
    --%>
</ul>
</p>

<p>
    5.5.8 - 2006.11.08
<ul>
    <li>Fix bug in generating algorithm payments; charity payments were missing</li>
    <li>Fix tax calculation for each type of payment, and choose the right tax form</li>
    <li>Enhanced PACTS member pages with pagination, sorting and speed</li>
    <li>Fix Problem Testing payment type to have optional round reference</li>
</ul>
</p>
<p>
    5.5.7 - 2006.11.06
<ul>
    <li>DR Top Third Prize enhanced to DR Top Performers Prize.</li>
    <li>Fix bugs in PACTS internal due to changes in table schemas</li>
    <li>Fix bug in members affidavit history: notarized was always showing "no"</li>
</ul>
</p>

<p>
    5.5.6 - 2006.11.02
<ul>
    <li>New Online review.</li>
</ul>
</p>

<p>
    5.5.5 - 2006.11.01
<ul>
    <li>Double prizes for design DR stage 3.</li>
    <%--
            <li>Schema was changed to store prizes in the DB so that different stages/seasons can have different prizes.</li>
    --%>
</ul>
</p>

<p>
    5.5.4 - 2006.10.30
<ul>
    <li>Fix member search so that it can search for HS only members</li>
    <li>Fix member profile so that it can show HS only members</li>
    <li>Fix bug in registration process where one can not select a school whose name contains a "</li>
    <li>Fix bug in registration where a HS user might end up without a country to represent</li>
</ul>
</p>

<p>
    5.5.3 - 2006.10.23
<ul>
    <li>Change max request rate for site</li>
    <li>Add independent login to administrative PACTs interface</li>
    <li>Add additional search criteria to administrative PACTs interface</li>
    <li>Add more payment types to member PACTs payment view</li>
    <li>Break the affidavits/payments page into two distinct pages</li>
    <%--
            <li>don't kill the queue connection when ejbremove is called on the pacts ejb</li>
    --%>
</ul>
</p>

<p>
    5.5.2 - 2006.10.18
<ul>
    <li>Fixed a bug in PACTS internal that was throwing an error when trying to update status to ready to print.
    </li>
    <li>Fixed sorting of rows in payment list for members</li>
</ul>
</p>


<p>
    5.5.1 - 2006.10.11
<ul>
    <li>Fixed addPayment page in PACTS internal pages.</li>
    <li>Changed the way that charity payments are handled.</li>
</ul>
</p>

<p>
    5.5.0 - 2006.10.10
<ul>
    <li>Add payment summary and details from the member profile page.</li>
    <li>Added more types of payments to PACTS.</li>
    <li>Updated pages for payments and affidavits in PACTS internal.</li>
</ul>

</p>

<p>
    5.4.15 - 2006.10.09
<ul>
    <li>
        Add throttle so that the speed as which users can use the site is limited. (It's unlikely to be relevant in
        any normal usage scenario)
    </li>
    <li>Add Most successful challenges in a match recordbook page.</li>
    <li>Fixed internal PACTS bug that did not allow the update of a payment</li>
    <li>Track all the queries that get executed.</li>
    <li>Fixed internal search tool form submission code to be a bit more standards compliant</li>
    <li>Add recent color change page</li>
</ul>
</p>

<p>
    5.4.14 - 2006.10.02
<ul>
    <li>
        Address address3 and province information to PACTS
    </li>
    <li>
        Add highest appeal percentage to the record book
    </li>
    <li>Add appeal data to member profile</li>
    <li>Show handle colors on the problem details as whichever is greater between High School and regular algorithm
        competitions.
    </li>
    <li>Add the point value of the problem to the problem detail page</li>
    <li>Add link to problem details page from the problem solution page</li>
    <li>Make the problem archive page's link to round overview go to the appropriate page based on whehter it's a
        High School match or not.
    </li>
    <li>Make the problem detail page's links to round overview, problem statment and problem solution go to the
        appropriate page based on whehter it's a High School match or not.
    </li>
    <li>Add link on Marathon Match overview page to example history</li>
    <li>Make the earnings totals link to the user's history on the member home page</li>
    <li>Add instructions to internal recruiting member profile</li>
    <li>Fix content on srm rules page, some content was replicated</li>
    <li>On the Marathon Match overview page, make the rank column be the left most column</li>
    <li>Add division to competition history</li>
    <li>Add most rated events record book page</li>

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
        password.
    </li>
    <li>Add TCCC06 Component results site</li>
    <li>In all tournament sites, the components should not link to the catalog if they are not public
        components.
    </li>
    <li>Include referral information in studio registration</li>
</ul>
</p>

<p>
    5.4.8 - 2006.08.28
<ul>
    <li>Add resume download to registration process</li>
    <li>Refresh the cached value for registrants after someone registers for the tccc06 algo tournaments</li>
    <li>Change the text of the GCJ06 activation email to more correctly identify the appropriate JRE to have
        installed
    </li>
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
        did not already contain a phone number
    </li>
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
        but it would test examples again
    </li>
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
        contacted by a 3rd party.
    </li>
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
        match
    </li>
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
        notifications and handle are populated correctly.
    </li>
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
        design phase.
    </li>
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
        information
    </li>
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
        indicator
    </li>
    <li>Change the win percentage record book page to require that one must place first and have a passing
        score
    </li>
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
        time
    </li>
    <li>When viewing marathon match results for a particular coder, move the the correct row when the page
        loads.
    </li>
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
        most recent successful submission
    </li>
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
                contests
            </li>
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
        review, and that unreliable people can't register for more than 2 projects
    </li>
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
        design position that is taken. 2. so that one can't apply with an invalid review resp
    </li>
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
        and room stats.
    </li>
    <li>Added TCO06 Logo Contest site</li>
</ul>
</p>

<p> 4.0.3 - 2005.10.04
<ul>
    <li>Changes relating to the new component reliability formula.
        <ul>
            <li>Split reliability rating in member profile</li>
            <li>If your reliability is
                <
                70% you can't register for more than 2 projects
            </li>
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
        handle change
    </li>
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
