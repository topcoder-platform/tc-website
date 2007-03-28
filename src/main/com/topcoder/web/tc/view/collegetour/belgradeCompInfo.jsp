<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% ResultSetContainer list = (ResultSetContainer) request.getAttribute("list"); %>
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
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
        <jsp:param name="node" value="m_competitions"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>

<div align="center">
    <img src="/i/collegetour/logo_lcbelgrade.png" alt="College Logo" border="0">
</div>

<p align="center">
    <A href="/tc?module=CollegeTourOverview&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Overview</A> | 
    <A href="/tc?module=CollegeTourInfo&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Instructions</A> | 
    <a href="/tc?module=CollegeTourViewReg&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Registration</A> |
    <a href="/tc?module=CollegeTourRegistrants&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">Registrants</A> |
    <tc-webtag:forumLink forumID="514541" message="Discuss"/> | Component Information
</p>


<h2 align="center">University of Belgrade<br>Component Design &amp; Development<br>Competition Series</h2>

<h3>The Event</h3>

<p>
    TopCoder is sponsoring an online software development competition at University of Belgrade for
    components posted from March 22 through April 5, 2007.
</p>

<p>
    Registration for this event will be open from March 22, 2007 at 2:00 PM CET through April 5, 2007 at
    7:00 PM CEST.
</p>

<p>
    The event will take place over the course of 3 weeks and will include all components posted from
    March 22 through April 5, 2007. In addition to <a href="/reg/">registering with TopCoder</a>, all competitors must
    <a href="/tc?module=CollegeTourViewReg&amp;<%=Constants.COLLEGE_TOUR_EVENT_ID%>=42">register for this competition</A>.
</p>

<h3>Competition Overview</h3>
<p>
    Registered competitors have the opportunity to participate in component design and development
    competitions at TopCoder. To get a feel for the projects available in this competition, or if you're ready to start competing, take a look at the <A href="/tc?module=ViewActiveContests&ph=112">available design projects</A> and the <A href="/tc?module=ViewActiveContests&ph=113">available development projects</A>.
    Scoring in the Series is determined based on the placement for each submission, as it relates to
    other University of Belgrade submissions. Placement is determined based on the score awarded for a
    particular component. For example, if 3 submissions were received for a component and the scores
    were 93, 89, and 71, the competitor receiving the score of 93 would be in 1st place and would
    receive 10 points. Note that only those registered for the event from University of Belgrade are
    considered when determining place and placement points. In order to receive placement points, a
    submission must pass the minimum component score of 75. Placement scoring is as follows:
</p>

<p align="center">
    <strong>1st Place - 10 Points</strong><br />
    <strong>2nd Place - 7 Points</strong><br />
    <strong>3rd Place - 5 points</strong><br />
    <strong>4th Place - 4 Points</strong><br />
    <strong>Below 4th Place - 0 Points</strong><br />
</p>

<p>
    During each week of competition, eligible competitors can submit design and/or development solutions
    for at least one eligible component by the submission deadline. Submissions will be scored by the
    TopCoder Review Boards and will be subject to final review and appeal in the same manner as standard
    component design and development submissions. Scoring of each submission by the TopCoder Review
    Boards is based on the criteria outlined in the Development Review Scorecard for the Development
    Contest or the criteria outlined in the Design Review Scorecard for the Design Contest. Note that
    the scorecards to be used for the series are the ones that are in effect as of March 22, 2007. ALL
    SUBMISSIONS MUST BE RECEIVED ACCORDING TO THE SUBMISSION DEADLINE TO BE CONSIDERED A VIABLE ENTRY.
    THERE WILL BE NO EXCEPTIONS.
</p>

<p>
    In the event of a tie of cumulative placement score for the Weekly or Series Prizes, the tie will be
    resolved in the following manner:

    <ul>
        <li>Highest individual component score of the lesser number of components used to develop the cumulative
            placement score for the tied competitors.
        </li>
        <li>If a tie still remains, then all tied contestants will share equally in the prize money.</li>
    </ul>
</p>

    <h3>Prizes</h3>
<p>
    <strong>Participatory Prize:</strong> All competitors who pass review at least once during the 3 weeks will receive
    a
    TopCoder t-shirt. Each competitor is only allowed to win a maximum of one t-shirt.
</p>

<p>
    <strong>Weekly Prize:</strong> The three competitors with the highest weekly placement points will win the following
    cash prizes:
</p>

    <ul>
        <li>1st place weekly prize - $500</li>
        <li>2nd place weekly prize - $300</li>
        <li>3rd place weekly prize - $100</li>
    </ul>

<p>
    <strong>Series Prize</strong>: The three competitors with the highest cumulative placement points across all 3 weeks
    of competition will win the following cash prizes:
</p>

    <ul>
        <li>1st place prize - $5,000</li>
        <li>2nd place prize - $2,500</li>
        <li>3rd place prize - $1,000</li>
    </ul>

    <h3>Eligibility</h3>
    You must be a TopCoder member, at least 18 years of age, meeting all of the membership requirements.
    In addition, you must fit into one of the following categories.
    <br /><br />
    If you reside in the United States, you must be either:
    <ul>
        <li>A US Citizen</li>
        <li>A Lawful Permanent Resident of the US</li>
        <li>A temporary resident, asylee, refugee of the U.S., or have a lawfully issued work authorization card
            permitting unrestricted employment in the U.S.
        </li>
    </ul>
    <br />
    If you do not reside in the United States:
    <ul>
        <li>You must be authorized to perform services as an independent contractor. (Note: In most cases you
            will not need to do anything to become authorized)
        </li>
    </ul>


</div>

</td>
<!-- Center Column Ends -->

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

