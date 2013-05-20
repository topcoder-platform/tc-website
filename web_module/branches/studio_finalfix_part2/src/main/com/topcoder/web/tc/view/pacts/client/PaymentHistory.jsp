<%--
  - Author: isv
  - Version: 1.1
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the payments for current user.
  -
  - Version 1.1 (Member Payments Automation assembly) changes: 
  -   added logic for displaying payment's release date.
  -   added controls for data pagination parameters setting.
  -   fixed a bug with passing sr, er parameters when sorting the paginated data.
  -   added client-side validation for form inputs.
  -   added controls for payments processing
--%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.PaymentHistory" %>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.ejb.pacts.payments.PaidPaymentStatus" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.ejb.pacts.payments.EnteredIntoPaymentSystemPaymentStatus" %>
<%@ page import="com.topcoder.web.ejb.pacts.payments.AccruingPaymentStatus" %>
<%@ page import="com.topcoder.web.ejb.pacts.payments.OwedPaymentStatus" %>
<%@ page import="java.util.Arrays" %>

<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set var="fullList" value="<%= request.getAttribute(PaymentHistory.FULL_LIST) %>"/>
<c:set var="payments" value="<%= request.getAttribute(PaymentHistory.PAYMENTS) %>"/>
<c:set var="cr" value="<%= request.getAttribute(PaymentHistory.CODER) %>"/>
<c:set var="paymentConfirmationTemplate" value="<%= request.getAttribute(PaymentHistory.PAYMENT_CONFIRMATION_TEMPLATE) %>"/>
<c:set var="userPaymentMethod" value="<%= request.getAttribute(PaymentHistory.USER_PAYMENT_METHOD) %>"/>

<c:set value="<%=PaymentHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=PaymentHistory.PAYMENT_ID%>" var="PAYMENT_ID"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>
<c:set value="<%=PaidPaymentStatus.ID%>" var="PAID"/>
<c:set value="<%=EnteredIntoPaymentSystemPaymentStatus.ID%>" var="ENTERED_INTO_PAYMENT_SYSTEM"/>
<c:set value="<%=OwedPaymentStatus.ID%>" var="OWED"/>
<c:set value="<%=AccruingPaymentStatus.ID%>" var="ACCRUING"/>
<c:set value="<%=com.topcoder.web.ejb.pacts.Constants.NEGATIVE_PAYMENT%>" var="NEGATIVE_PAYMENT"/>
<c:set value="<%=Constants.MINIMUM_PAYMENT_ACCRUAL_AMOUNT%>" var="MINIMUM_PAYMENT_ACCRUAL_AMOUNT"/>

<c:set value="<%=new Date()%>" var="now"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - PACTS</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

    <script type="text/javascript">
        USER_PAYMENT_METHOD = ${userPaymentMethod eq null ? 'null' : userPaymentMethod};
        MINIMUM_PAYMENT_ACCRUAL_AMOUNT = ${MINIMUM_PAYMENT_ACCRUAL_AMOUNT};
        PAY_ME_CONFIRMATION_TEMPLATE = '${paymentConfirmationTemplate}';
        
        function next() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.START_RANK%>.value = ${requestScope[defaults][startRank]} + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value ='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

            myForm.submit();
        }
        function previous() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.START_RANK%>.value =
            ${requestScope[defaults][startRank]} - parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

            myForm.submit();
        }
    </script>

</head>
<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="Payments"/>
</jsp:include>

<div align="left">
    <div style="float:right;">
       <A href="/wiki/display/tc/How+to+Get+Paid+for+Competing"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
    </div>
    <span class="bodySubtitle">Payments > </span><br>
    <c:if test="${fullList}" >
        View all | <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink">View pending</a> | <a href="/PactsMemberServlet?module=PaymentHistory&xls=true" class="bcLink">Export to Excel</a> | <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink">Payments Summary</a>
    </c:if>
    <c:if test="${not fullList}" >
        <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink">View all</a> | View pending | <a href="/PactsMemberServlet?module=PaymentHistory&xls=true" class="bcLink">Export to Excel</a> | <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink">Payments Summary</a>
    </c:if>
</div>

<br clear="all">

<div>
    <tc-webtag:errorIterator id="err" name="PayMe">
        <br/><span class="bigRed">${err}</span>
    </tc-webtag:errorIterator>
</div>

<c:choose>
    <c:when test="${not empty payments}">
    <form name="f" action="${sessionInfo.servletPath}" method="get" onsubmit="return checkPaymentHistoryForm();" 
          id="PaymentHistoryForm">
    
        <c:if test="${croppedDataBefore or croppedDataAfter}" >
            <div class="pagingBox">
                <c:choose>
                    <c:when test="${croppedDataBefore}">
                        <a href="Javascript:previous()" class="bcLink getable">&lt;&lt; prev</a>
                    </c:when>
                    <c:otherwise>
                        &lt;&lt; prev
                    </c:otherwise>
                </c:choose>
                
                <c:choose>
                    <c:when test="${croppedDataAfter}">
                        <a href="Javascript:next()" class="bcLink getable">next &gt;&gt;</a>
                    </c:when>
                    <c:otherwise>
                        next &gt;&gt;
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
        <div align="right">
            [<a href="javascript:;" class="checkAll">Check All</a> | <a href="javascript:;" class="uncheckAll">Uncheck
            All</a>]
        </div>


        <br>
    <% boolean even = true;%>
    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <tbody>
        <tr>
            <td class="title" colspan="8">
            Payments
            </td>
        </tr>
        <tr>
            <td class="header"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>" >Description</a></td>
            <td class="header"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true" />" >Type</a></td>
            <td class="headerC"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true" />" >Create Date</a></td>
            <td class="headerR"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"  />" >Net Payment</a></td>
            <td class="header"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true" />" >Status</a></td>
            <td class="headerC"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true" />" >Release Date</a></td>
            <td class="headerC">
                <c:if test="${fullList}" >
                    <b><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true" />" >Date Paid</a>       
                </c:if>&nbsp;
            </td>
            <td class="header">&nbsp;</td>
        </tr>
        
        <c:forEach items="${payments}" var="payment">
        
        <c:set var="typeId" value="${payment.paymentType}" />
        <tr class="<%=even?"light":"dark"%>">
            <td class="value">
                <c:choose>
                    <c:when test="${(typeId == 1 || typeId == 22) && payment.roundId > 0}">
                        <A href="/stat?c=coder_room_stats&cr=${payment.coderId}&rd=${payment.roundId}">${payment.description}</A>
                    </c:when>
                    <c:when test="${(typeId == 6 || typeId == 7) && payment.projectId > 0}">
                        <A href="/tc?module=ProjectDetail&pj=${payment.projectId}&tab=results" class="bcLink">${payment.description}
                        <c:if test="${payment.grossAmount != payment.totalAmount}">
                            <c:choose>
                                <c:when test="${payment.installmentNumber == 1}">(${payment.installmentNumber}st</c:when>
                                <c:when test="${payment.installmentNumber == 2}">(${payment.installmentNumber}nd</c:when>
                                <c:when test="${payment.installmentNumber == 3}">(${payment.installmentNumber}rd</c:when>
                                <c:otherwise>(${payment.installmentNumber}th</c:otherwise>
                            </c:choose>
                            installment, total amount=${payment.totalAmount})                    
                        </c:if>
                        </A>                    
                    </c:when>
                    <c:when test="${(typeId == 17 || typeId == 25) && payment.stageId > 0}">
                        <A href="/tc?module=LeaderBoard&ph=112&staid=${payment.stageId}" class="bcLink">${payment.description}</A>                    
                    </c:when>
                    <c:when test="${typeId == 18 && payment.seasonId > 0}">
                        <A href="/tc?module=RookieBoard&ph=112&seid=${payment.seasonId}" class="bcLink">${payment.description}</A>                    
                    </c:when>
                    <c:when test="${(typeId == 40 || typeId == 41) && payment.trackId > 0}">
                        <A href="/dr?module=ViewLeaderBoard&tid=${payment.trackId}" class="bcLink">${payment.description}</A>                    
                    </c:when>
                    <c:when test="${typeId == 21 && payment.roundId > 0}">
                        <A href="/longcontest/?module=ViewOverview&rd=${payment.roundId}>" class="bcLink">${payment.description}</A>                    
                    </c:when>                
                    <c:otherwise>
                        ${payment.description}
                    </c:otherwise>
                </c:choose>
            
            
            </td>
            <td class="value">${payment.paymentTypeDesc}</td>
            <td class="valueC"><fmt:formatDate value="${payment.createDate}" pattern="MM/dd/yyyy"/></td>
            <td class="valueR"><fmt:formatNumber value="${payment.netAmount}" type="currency" currencySymbol="$"/></td>
            <td class="value"><strong>${payment.currentStatus.desc}</strong> 
                <c:forEach items="${payment.currentStatus.reasons}" var="reason">    
                <br>- ${reason.desc}
                </c:forEach>
            </td>
            <td class="valueC">
                <fmt:formatDate value="${payment.dueDate}" pattern="MM/dd/yyyy"/>
            </td>
            <td class="valueC">
                <c:if test="${fullList}" >
                     <b><fmt:formatDate value="${payment.paidDate}" pattern="MM/dd/yyyy"/></b>
                </c:if>&nbsp;
            </td>
            <td class="value">
                <c:set var="paymentIdString" value="${payment.id + ''}"/>
                <c:choose>
                    <c:when test="${payment.currentStatus.id eq PAID or payment.currentStatus.id eq ENTERED_INTO_PAYMENT_SYSTEM}">
                        <%-- Paid, Entered into Payment System: checked, disabled--%>
                        <input type="checkbox" disabled="disabled" checked="checked" name="${PAYMENT_ID}" value="${payment.id}"/>
                    </c:when>
                    <c:when test="${payment.currentStatus.id eq OWED or payment.currentStatus.id eq ACCRUING}">
                        <%-- Owed, Accruing --%>
                        <c:choose>
                            <c:when test="${payment.dueDate eq null or (payment.dueDate > now)}">
                                <%-- Payment release date is not reached yet: un-checked, disabled --%>
                                <input type="checkbox" disabled="disabled" name="${PAYMENT_ID}" value="${payment.id}"/>
                            </c:when>
                            <c:when test="${payment.paymentType eq NEGATIVE_PAYMENT}">
                                <%-- Negative Payment: checked, readonly --%>
                                <input type="checkbox" name="${PAYMENT_ID}" value="${payment.id}" checked="checked"
                                       class="payable negative" onclick="javascript:return false;"/>
                            </c:when>
                            <c:otherwise>
                                <%-- All other cases: un-checked, normal --%>
                                <input type="checkbox" name="${PAYMENT_ID}" value="${payment.id}"
                                       <c:forEach items="${paramValues[PAYMENT_ID]}" var="pid">
                                           <c:if test="${pid eq paymentIdString}">checked="checked"</c:if>
                                       </c:forEach>
                                       class="checkable uncheckable payable"/>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <%-- All other cases: un-checked, disabled--%>
                        <input type="checkbox" disabled="disabled" name="${PAYMENT_ID}" value="${payment.id}"/>
                    </c:otherwise>
                </c:choose>
                <input type="hidden" value="${payment.netAmount}" class="paymentNetAmount"/>
            </td>
         </tr>
         <% even = !even;%>
        </c:forEach>
    </tbody>
    </table>
    
        <br/>
       <div align="right">
           <input type="button" value="Pay Me: $0.00" id="payMe" disabled="disabled"/>
       </div> 
    
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="PaymentHistory"/>
            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
            <input type="hidden" name="<%= PaymentHistory.FULL_LIST %>" value="<c:out value="${fullList}"/>" />
    
            <div class="pagingBox">
                <c:if test="${croppedDataBefore or croppedDataAfter}">
                    <c:choose>
                        <c:when test="${croppedDataBefore}">
                            <a href="Javascript:previous()" class="bcLink getable">&lt;&lt; prev</a>
                        </c:when>
                        <c:otherwise>
                            &lt;&lt; prev
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${croppedDataAfter}">
                            <a href="Javascript:next()" class="bcLink getable">next &gt;&gt;</a>
                        </c:when>
                        <c:otherwise>
                            next &gt;&gt;
                        </c:otherwise>
                    </c:choose>
                    <br/>
                </c:if>
                View &#160;
                <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
                &#160;at a time starting with &#160;
                <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                <button name="nameSubmit" value="submit" type="submit">Go</button>
            </div>
    </form>            
    </c:when>
    <c:otherwise>
        <div align="center">
        <strong>No Payments Found</strong>
        </div>
    </c:otherwise>
</c:choose>
<br>



<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
