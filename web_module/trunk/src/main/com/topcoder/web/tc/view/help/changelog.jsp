<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
        5.0.3 - 2006.03.xx
        <ul>
            <li>Change text at the top of the registration page to be more specific about sponsors and competitor information</li>
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
            <li>Fix registrants query on active contests page to be at the time of registration rather than change over time</li>
            <li>When viewing marathon match results for a particular coder, move the the correct row when the page loads.</li>
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
            <li>when you submit and time out in long comps, return to the submission page with the submitted code, not the most recent successful submission</li>
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
                    <li>Fix bug where language wasn't reflected in types for problem statement page from active contests</li>
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
            <li>Added text to the reliability rating page indicating that new competitors don't get a rating til they pass review, and that unreliable people can't register for more than 2 projects</li>
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