<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>


<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        

        
    </head>
    <body>
        <h1>PACTS</h1>
        <h2 align="center">Generate Intro Event Component Payments</h2>
        <center>

<br>
<br>
<form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="get">
    <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="ListIntroEventCompPayments">

<br>
            <tc-webtag:objectSelect name="eid" list="${events}" valueField="id" textField="description"  useTopValue="false" />

<br>
<br>
<input type="submit" value="View Payments List">
<br>
</form>   



        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
