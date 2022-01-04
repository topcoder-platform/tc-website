<%--
  - Author: isv, TCSCODER
  - Version: 1.1 (Member Payment Improvements Release assembly v1.0)
  - Version: 1.2 (Topcoder - Add New Payment Provider)
  - Copyright (C) 2010-2017 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page provides a web form for managing user payment preferences. Such a form includes input
  - field for setting the payment accrual amount for now.
  - v1.1 changes: implemented Synchronizer Token Pattern for web form.
  - v1.2 changes:
  - - if the user is Wipro SSO User, only the Wipro Payroll option will be enabled, other options will be disabled.
  - - Add a description for Wipro Payroll in Payment Provider section.
--%>






<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.myhome.EditPaymentPreferences" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<%
        String redirectURL = "https://community.topcoder.com/PactsMemberServlet?module=PaymentHistory&full_list=false";
        response.sendRedirect(redirectURL);
%>


<table width="100%" border="0" cellpadding="0" cellspacing="0" class="myHome">
    <tbody>
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

    </tr>
    </tbody>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>

