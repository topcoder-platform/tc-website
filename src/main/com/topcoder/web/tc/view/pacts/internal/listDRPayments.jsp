<%--
  - Author: isv, VolodymyrK
  - Version: 1.2 (Member Payment Improvements Release assembly v1.0)
  - Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the web form listing the payments available for generation for
  - selected Digital Run track. The form allows to select the payments for generation and start the
  - payment generation process.
  -
  - Member Payment Improvements Release assembly v1.0 changes:
  - Updated the form parameters to follow current Digital Run schema.
  -
  - Version 1.2 changes: added support for taxable and non-taxable DR payments
--%>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants" %>
<%@ page import="com.topcoder.web.tc.Constants" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="MODULE" value="<%=PactsConstants.MODULE_KEY%>"/>
<c:set var="INTERNAL_SERVLET_URL" value="<%=PactsConstants.INTERNAL_SERVLET_URL%>"/>
<c:set var="TRACK_ID" value="<%=Constants.TRACK_ID%>"/>

<html>
<head>
    <title>PACTS</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript">
        <!--
          function checkAll(check) {
            var elements = document.f.elements;
            for (i=0; i<document.f.elements.length; i++) {
              if (document.f.elements[i].type=="checkbox") {
                document.f.elements[i].checked = (check==true);
              }
            }
          }
        -->
    </script>
</head>
<body>
<h1>PACTS</h1>

<h2 align="center">Generate Digital Run Payments</h2>

<center>
    <br/>
    <br/>

    <form name="f" action="${INTERNAL_SERVLET_URL}" method="post">
        <input type="hidden" name="${MODULE}" value="GenerateDRPayments"/>
        <tc-webtag:hiddenInput name="${TRACK_ID}"/>

        <c:forEach items="${requestScope.contests}" var="c">
            <h3>${c.name }</h3>
            <table cellpadding="3">
                <tr>
                    <td><b>Place</b></td>
                    <td><b>Coder</b></td>
                    <td><b>Non-taxable Amount</b></td>
                    <td><b>Taxable Amount</b></td>
                    <td><b>Total Amount</b></td>
                    <td><b>Status</b></td>
                </tr>
                <c:forEach items="${c.results }" var="r">
                    <tr>
                        <td align="right">${r.place }</td>
                        <td><tc-webtag:handle coderId="${r.coderId}" context='component'/></td>
                        <td align="center">
                            <c:choose>
                                <c:when test="${not empty r.nonTaxablePaymentId}"><a href="${pacts:viewPayment(r.nonTaxablePaymentId)}">
                                    <fmt:formatNumber value="${r.nonTaxablePrize}" type="currency" currencySymbol="$"/></a></c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${r.nonTaxablePrize}" type="currency" currencySymbol="$"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td align="center">
                            <c:choose>
                                <c:when test="${not empty r.taxablePaymentId}"><a href="${pacts:viewPayment(r.taxablePaymentId)}">
                                    <fmt:formatNumber value="${r.taxablePrize}" type="currency" currencySymbol="$"/></a></c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${r.taxablePrize}" type="currency" currencySymbol="$"/>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td align="center">
                            <fmt:formatNumber value="${r.nonTaxablePrize + r.taxablePrize}" type="currency" currencySymbol="$"/>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${(not empty r.nonTaxablePaymentId) or (not empty r.taxablePaymentId)}"><font color="#00A000">Paid</font></c:when>
                                <c:otherwise>
                                    <input type="checkbox" name="pay"
                                           value="${c.typeId}:${r.place}:${r.coderId}:${r.nonTaxablePrize}:${r.taxablePrize}"> Pay
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="2" align="right">Total:</td>
                    <td align="center">
                        <b><fmt:formatNumber value="${c.totalNonTaxablePrizes}" type="currency" currencySymbol="$"/></b>
                    </td>
                    <td align="center">
                        <b><fmt:formatNumber value="${c.totalTaxablePrizes}" type="currency" currencySymbol="$"/></b>
                    </td>
                    <td align="center">
                        <b><fmt:formatNumber value="${c.totalNonTaxablePrizes+c.totalTaxablePrizes}" type="currency" currencySymbol="$"/></b>
                    </td>
                    <td></td>
                </tr>
            </table>
        </c:forEach>
        <br/><br/>
        <a href="javascript:checkAll(true)">check all</a> - <a href="javascript:checkAll(false)">uncheck all</a> <br/>
        <br/>
        <input type="submit" value="Generate Payments">
        <br/>
    </form>
</center>
<jsp:include page="InternalFooter.jsp" flush="true"/>
</body>
</html>
