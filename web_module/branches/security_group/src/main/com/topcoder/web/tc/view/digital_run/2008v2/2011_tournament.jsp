<%--
  - Author: TCSDEVELOPER, pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays development overview for the digital run
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
    <jsp:param name="tabLev2" value="2011_tournament"/>
</jsp:include>

<span class="title">UI Prototype Digital Run Tournament!</span>
<br /><br />
UI Prototype Digital Run Tournament!
We are happy to announce a special opportunity for UI Prototype competitors! During the months of April, May and June in 2011, a single member will be designated the "UI Prototype DR Tournament Winner" from each month based on how many points they accumulated during UI Prototype contests. The winner from each month will win an all-expenses paid trip to TCO11!
<br /><br />
Winners are chosen based on the highest points earned from UI Prototype contests only. Points from other contest types will not count toward the tally. Each winner can only win a single trip and that trip is non-transferable.
<br /><br />
<br /><br />

    </div>
</div>

<jsp:include page="../../foot.jsp" />

</body>

</html>