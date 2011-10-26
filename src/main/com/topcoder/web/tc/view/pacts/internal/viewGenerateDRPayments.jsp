<%--
  - Author: isv
  - Version: 1.1 (Member Payment Improvements Release assembly v1.0)
  - Copyright (C) 2002-2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the web form listing the drop-down with DR tracks available for payment
  - generation.
  -
  - Member Payment Improvements Release assembly v1.0 changes:
  - Totally re-written to switch to latest Digital Run schema.
--%>

<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>

<c:set var="TRACK_ID" value="<%=Constants.TRACK_ID%>"/>
<c:set var="MODULE" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="INTERNAL_SERVLET_URL" value="<%=PactsConstants.INTERNAL_SERVLET_URL%>"/>

<html>
<head>
    <title>PACTS</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<h1>PACTS</h1>

<h2 align="center">Generate Digital Run Payments</h2>

<div style="align: center;text-align:center;">
    <br/>
    <br/>
    <form name="f" action="${INTERNAL_SERVLET_URL}" method="get">
        <tc-webtag:hiddenInput name="${MODULE}" value="ListDRPayments"/>
        <br/>
        <tc-webtag:rscSelect name="${TRACK_ID}" list="${requestScope.tracks}"
                             fieldText="track_desc" fieldValue="track_id" useTopValue="false"/>
        <br/>
        <br/>
        <input type="submit" value="View Payments List"/>
        <br/>
    </form>
</div>
<jsp:include page="InternalFooter.jsp" flush="true"/>
</body>
</html>
