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
<c:set var="PAYPAL_ACCOUNT" value="<%=EditPaymentPreferences.PAYPAL_ACCOUNT_PARAM%>"/>
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
	     var email = document.getElementsByName('paypalAccount')[0];
	     var paypal_radio = document.getElementsByName('paymentMethod')[1];
	     var filter = /([_A-Za-z0-9-\+]+)(\.[_A-Za-z0-9-\+]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[A-Za-z]{2,})/;
	     if (paypal_radio.checked && !filter.test(email.value)) {
		alert('Please provide a valid paypal email address');
		email.focus;
	     } else {
            var myForm = document.f;
            myForm.submit();
		}
        }
    </script>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

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

        <%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody" align="left">

                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="my_tc"/>
                    <jsp:param name="title" value="Payment Preferences"/>
                </jsp:include>

                <p align="center" class="note">
                    Set your accrual limit to any amount above $${MINIMUM_PAYMENT_ACCRUAL_AMOUNT}
                    if you want your payments to accrue to some limit before becoming Owed.
                    You can also set the preferred payment method and register with the payment providers here.
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

                        <tr class="light">
                            <td class="value" width="100%" style="border: none;">
                                The email address of your PayPal account:
                                <tc-webtag:errorIterator id="err" name="${PAYPAL_ACCOUNT}">
                                    <br/><span class="bigRed"><c:out value="${err}"/></span>
                                </tc-webtag:errorIterator>
                            </td>
                            <td class="value" nowrap="nowrap" style="border: none; vertical-align: middle;">
                                <tc-webtag:textInput name="${PAYPAL_ACCOUNT}" size="30"/><br/>(leave blank if not applicable)
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </form>

                    <br/>
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tbody>
                        <tr>
                            <td class="title">Payment Providers</td>
                        </tr>

                        <tr><td class="header">Payoneer</td></tr>
                        <tr class="light">
                            <td class="value" width="100%" style="border: none; vertical-align: middle;" >
                                <c:choose>
                                    <c:when test="${payoneerActivated}">
                                        You are already registered with Payoneer
                                    </c:when>
                                    <c:when test="${(payoneerActivated==false) && (not empty payoneerRegLink)}">
                                        Register with <a href="${payoneerRegLink}">Payoneer</a> for a prepaid MasterCard or bank transfer service
                                    </c:when>
                                    <c:otherwise>
                                        Couldn't get the status of your Payoneer account. Please contact <a href="mailto:support@topcoder.com">support@topcoder.com</a> for assistance.
                                    </c:otherwise>
                                </c:choose>
                                <ul>
                                <li><a href="https://payouts.payoneer.com/partners/Default/fees.aspx?pid=100018950&bhjs=1&bhqs=1">Click for more information</a> about the prepaid MasterCard and bank transfer service
                                </ul>
                            </td>
                        </tr>

                        <tr><td class="header">PayPal</td></tr>
                        <tr class="light">
                            <td class="value" width="100%" style="border: none; vertical-align: middle;" >
                                Register with <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_registration-run">PayPal</a>
                            </td>
                        </tr>

                        <tr><td class="header">Western Union</td></tr>
                        <tr class="light">
                            <td class="value" width="100%" style="border: none; vertical-align: middle;" >
                                Register with <a href="https://payee.globalpay.westernunion.com/PayeeManager/BeneficiaryEnrollment/SpecifyPayeeID.aspx?id=9E63C90B520F830246DA2FD728CDAEBF">Western Union</a>
                                <br /><span class="grayedOut">(Use your TopCoder handle as the Payee ID during registration)</span>
                            </td>
                        </tr>

                        </tbody>
                    </table>


                <%
                    Boolean isNewStyle = request.getAttribute("isNewStyle") == null ? false : (Boolean) request.getAttribute("isNewStyle");
                %>

                <% if(isNewStyle) { %>
                <div>
                    <table class="controls">
                        <tbody>
                        <tr>
                            <td>
                                <a class="btn" href="javascript:submit()">Save</a>
                            </td>
                            <td>
                                <a class="btn btnBlue" href="/tc?module=MyHome">Cancel</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <% } else { %>


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

                <% } %>

                <div align="center">Have a question about
                    <A href="/wiki/display/tc/Payment+Methods">Payment Methods</A>?
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
