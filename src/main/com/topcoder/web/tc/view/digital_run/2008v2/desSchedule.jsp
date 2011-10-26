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
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="schedule"/>
</jsp:include>

<span class="title">Schedule</span>
<br /><br />
Points and prize pool money are available for each month of 2009. The monthly schedule shown below includes competitions posted within the following date range:
<br /><br />

January 1 - January 31
<br />February 1 - February 28
<br />March 1 - March 31
<br />April 1 - April 30
<br />May 1 - May 31
<br />June 1 - June 30
<br />July 1 - July 31
<br />August 1 - August 31
<br />September 1 - September 30
<br />October 1 - October 31
<br />November 1 - November 30
<br />December 1 - December 31
<br /><br />


The TCO trip prize is available to the monthly winner during the following months of 2009:
<br /><br />

January 
<br />February 
<br />March 
<br />April 
<br />May 
<br />June 
<br />July 
<br />August 
<br /><br />

    </div>
</div>

<jsp:include page="../../foot.jsp" />

</body>

</html>