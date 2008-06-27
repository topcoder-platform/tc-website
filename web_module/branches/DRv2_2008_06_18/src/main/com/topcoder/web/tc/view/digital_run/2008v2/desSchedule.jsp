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

<div align="center">
    <div class="fixedWidthBody">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="digital_run_20061031"/>
<jsp:param name="title" value="2008 Design Cup Series"/>
</jsp:include>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="schedule"/>
</jsp:include>

<span class="title">Schedule</span>
<br /><br />
Includes components posted within the following date range, inclusive:
<br /><br />
<strong>Stage #1:</strong> January 1, 2008 - March 31, 2008<br />
<strong>Stage #2:</strong> April 1, 2008 - June 30, 2008<br />
<strong>Stage #3:</strong> July 1, 2008 - September 30, 2008<br />
<strong>Stage #4:</strong> October 1, 2008 - December 31, 2008<br />
<br /><br />

    </div>
</div>

<jsp:include page="../../foot.jsp" />

</body>

</html>