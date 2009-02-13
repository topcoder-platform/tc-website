<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Architecture Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="architecture_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
           
                <div align="center"><a href="/tc?module=ViewArchitectureActiveContests"><img src="/i/development/architecture/banner20071218.jpg" alt="TopCoder Architecture Competitions" /></a></div>

                <p align="center" class="bigRed">The beta competition <a href="/tc?module=ViewArchitectureActiveContests" class="bigRed">has started</a>!</p>

                <p align="justify">
                    We've been preparing the first competition for release and now we'd like to get your feedback.  This page is intended to show to you - ahead of time - the competition process, the scorecard, and all of the documents that we plan to release to initially support these competitions.  This includes the actual specification documentation for the first competition.  We encourage all of you to give your feedback, which we will review and integrate into the first competition when it launches next week.
                </p>
                <p align="justify">
                    This is your chance to guide the direction of these competitions.  Remember, architecture competitions will feed into component competitions, so it's important that we get your feedback as we broaden the scope of member participation in the overall application development process.
                </p>
                <h2 align="center">
                    FIRST PRIZE FOR THE BETA COMPETITION<br />WILL BE $2000
                </h2>
                <p align="justify">
                    The competition format will require you to create sequence diagrams illustrating the interaction between components, the component specifications and database schemas.  Furthermore, based on feedback we've already heard from architects, we have incorporated working prototypes into this competition process as a required deliverable. 
                </p>
                <div align="right" style="margin: 10px 0 20px 0;">
                    <a href="/wiki/display/tc/Architecture"><img src="/i/development/architecture/process.png" alt="Architecture Competition Process" style="display: block;" /></a>
                </div>
                <p align="justify">
                    Take a look at the scorecards we'll be using for architecture competitions, and tell us what you think.
                </p>
                <div align="right" style="margin: 10px 0 20px 0;">
                    <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review/actions/ViewReview.do?method=viewReview&amp;rid=53007"><img src="/i/development/architecture/scorecard.png" alt="Scorecard" style="display: block;" /></a>
                </div>
                <p align="justify">
                    We are providing the TC community the same training materials we use for our internal architects. You can view these in our wiki.
                </p>
                <div align="right" style="margin: 10px 0 20px 0;">
                    <a href="/wiki/display/training/Architecture+Training+Module"><img src="/i/development/architecture/training.png" alt="Training Materials" style="display: block;" /></a>
                </div>
                <p align="justify">
                    We've put together sample architecture deliverables to give an idea of the completed documents that will comprise the deliverables from a typical architecture competition.  These are zipped up and downloadable here.
                </p>
                <div align="right" style="margin: 10px 0 20px 0;">
                    <a href="/wiki/display/tc/Sample+Architecture+Deliverables"><img src="/i/development/architecture/sample.png" alt="Sample Submission" style="display: block;" /></a>
                </div>
                <h2 align="center">
                    BETA ARCHITECTURE COMPETITION LAUNCH<br />TUESDAY, DECEMBER 18TH
                </h2>
                <p align="justify">
                    This competition will be to architect the TopCoder Client Cockpit, an entry point for customers to interact with the TopCoder Community through a customizable home base, built on a widget framework from which a registered TopCoder client-member will be able to launch and track projects, send/receive messages and monitor a variety of information sources.
                </p>
                <p align="justify">
                    We are intending to provide as business specifications for this competition, a document describing the requirements and widget behavior, as well as storyboard images and graphic elements of the look and feel. Please take a look and let us know what you think of the specs.
                </p>
                <div align="right" style="margin: 10px 0 20px 0;">
                    <a href="/wiki/display/tc/TopCoder+Architecture+Beta+Competition+Specification"><img src="/i/development/architecture/businessSpecs.png" alt="Business specs" style="display: block;" /></a>
                </div>
                <p align="justify">
                    It's all coming next week, so let us know what you think!
                </p>
                <div align="right" style="margin: 10px 0 20px 0;">
                    <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&amp;forumID=518483"><img src="/i/development/architecture/discuss.png" alt="Discuss" style="display: block;" /></a>
                </div>

            </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>