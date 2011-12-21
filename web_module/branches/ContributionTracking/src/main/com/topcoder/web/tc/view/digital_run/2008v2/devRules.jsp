<%--
  - Author: TCSDEVELOPER, pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays development rules for the digital run
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
--%>
<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="digitalrun"/>
</jsp:include>
<jsp:include page="../../script.jsp" />
</head>
<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<!-- centerer -->
<div align="center">

    <!-- spacer -->
    <div id="pageSpacer">

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="development"/>
    <jsp:param name="tabLev2" value="rules"/>
</jsp:include>

<span class="title">Rules</span>
<br /><br />
Each contest posted in <a href="/tc?module=ViewActiveContests&amp;ph=113">Software Development</a>, <a href="/tc?module=ViewAssemblyActiveContests">Software Assembly</a>, <a href="/tc?module=ActiveContests&amp;pt=13">Test Suites</a>, <a href="/tc?module=ActiveContests&amp;pt=19">UI Prototypes</a>, and <a href="/tc?module=ActiveContests&amp;pt=24">RIA Builds</a> will carry a point value. <a href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=devOverview">Placement Points</a> will be awarded based on the number of submissions that pass review. By registering for any <a href="/tc?module=ViewActiveContests&amp;ph=113">Software Development</a>, <a href="/tc?module=ViewAssemblyActiveContests">Software Assembly</a>, <a href="/tc?module=ActiveContests&amp;pt=13">Test Suites</a>, <a href="/tc?module=ActiveContests&amp;pt=19">UI Prototypes</a>, or <a href="/tc?module=ActiveContests&amp;pt=24">RIA Builds</a> competition, a competitor agrees to the items outlined on each project's Project Overview page, including the Eligibility requirements and the Terms of Work, and the completion of all paperwork required by TopCoder.
<br /><br />
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in Software Development, Software Assembly and Application Testing competitions, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site or the contest process, or other violation of any rule. TopCoder reserves the right to cancel, terminate or modify this program if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. TopCoder reserves the right, in its sole discretion, to change any aspects of the competitions and the Development Cup, including but not limited to, these rules, the software methodology, the scorecard, the prize purse and the point distribution schedule, at any point during this program. TopCoder makes no guarantee as to the number of competitions that are open for competition in any particular development language for each weekly competition. Teams are NOT allowed for any competition. Collusion between members to submit work that is not their own is expressly forbidden by these rules and the Terms of Work.
<br /><br />

    </div>
</div>

<jsp:include page="../../foot.jsp" />

</body>

</html>