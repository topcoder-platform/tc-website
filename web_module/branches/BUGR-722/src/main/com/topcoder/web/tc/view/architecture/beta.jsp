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

                <p align="center" class="bigRed">View our newest <a href="/tc?module=ViewArchitectureActiveContests" class="bigRed">competitions</a>!</p>

                <p align="justify">
                    As part of these Architecture Competitions members have been tasked to create an architecture based on a complete prototype and an application requirement specification. The prototype and application requirement specification are part of a much larger enterprise suite of applications, which when assembled together comprise "Project Phoenix". For each milestone that is completed, you will receive $200.00 in addition to the compensation you would receive if you were to win the 1st or 2nd place. Even if you do not make any placements, you will still receive the full $200.00 for EACH milestone that is submitted.
                </p>
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