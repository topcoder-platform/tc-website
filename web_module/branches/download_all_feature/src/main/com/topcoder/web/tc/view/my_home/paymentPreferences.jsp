<%--
  - Author: isv
  - Version: 1.0 (Member Payment Improvements Release assembly v1.0)
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page provides a web form for managing user payment preferences. Such a form includes input
  - field for setting the payment accrual amount for now.
--%>

<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.controller.request.myhome.EditPaymentPreferences" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="MODULE" value="<%=Constants.MODULE_KEY%>"/>
<c:set var="MINIMUM_PAYMENT_ACCRUAL_AMOUNT" value="<%=Constants.MINIMUM_PAYMENT_ACCRUAL_AMOUNT%>"/>
<c:set var="ACCRUAL_AMOUNT" value="<%=EditPaymentPreferences.ACCRUAL_AMOUNT_PARAM%>"/>
<c:set var="PAYMENT_METHOD" value="<%=EditPaymentPreferences.PAYMENT_METHOD_PARAM%>"/>
<html>

<head>
    <title>TopCoder - My TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript">
        function submit() {
            var myForm = document.f;
            myForm.submit();
        }
    </script>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tbody>
    <tr valign="top">
        <%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
        <%-- Left Column Ends --%>

        <%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody" align="left">

                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="Payment Preferences"/>
                </jsp:include>

                <p align="center">
                    Set your payment threshold amount to any amount above $${MINIMUM_PAYMENT_ACCRUAL_AMOUNT}
                    so that once your winnings reach this limit your money will be paid out to you in the next scheduled
                    payment. You can also set the preferred payment method here.
                </p>

                <form name="f" action="${sessionInfo.servletPath}" method="post">
                    <tc-webtag:hiddenInput name="${MODULE}" value="EditPaymentPreferences"/>
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tbody>
                        <tr>
                            <td class="title" colspan=2>Payment Preferences</td>
                        </tr>

                        <tr class="light">
                            <td class="value" width="100%" style="border: none;">
                                Payment accrual amount (minimum $${MINIMUM_PAYMENT_ACCRUAL_AMOUNT}):
                                <tc-webtag:errorIterator id="err" name="${ACCRUAL_AMOUNT}">
                                    <br/><span class="bigRed"><c:out value="${err}"/></span>
                                </tc-webtag:errorIterator>
                            </td>
                            <td class="value" nowrap="nowrap" style="border: none; vertical-align: middle;">
                                <tc-webtag:textInput name="${ACCRUAL_AMOUNT}" size="6"/>
                            </td>
                        </tr>

                        <tr class="light">
                            <td class="value" width="100%" style="border: none; vertical-align: middle;">
                                Payment method:
                                <tc-webtag:errorIterator id="err" name="${PAYMENT_METHOD}">
                                    <br/><span class="bigRed"><c:out value="${err}"/></span>
                                </tc-webtag:errorIterator>
                            </td>
                            <td class="value" nowrap="nowrap" style="border: none;">
                                <c:forEach var="paymentMethod" items="${paymentMethods}">
                                    <tc-webtag:radioButton name="${PAYMENT_METHOD}" value="${paymentMethod.id}"/>${paymentMethod.name}<br />
                                </c:forEach>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </form>

                <div align="center">
                    <table cellpadding="0" cellspacing="0" style="margin: 20px;">
                        <tbody>
                        <tr>
                            <td>
                                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Save</a>
                            </td>
                            <td>
                                <a href="/tc?module=MyHome" class="button" style="width: 60px;">Cancel</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
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

<jsp:include page="../foot.jsp"/>

</body>

</html>
