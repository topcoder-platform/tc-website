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

<c:set value="<%=true%>" var="isReskin"/>
<c:set value="<%=request.getAttribute("NUM_TOTAL")%>" var="numTotal" />
<c:set value="<%=request.getAttribute("NUM_PER_PAGE")%>" var="numPerPage" />
<c:set value="<%=request.getAttribute("NUM_PENDING")%>" var="numPending" />
<c:set value="<%=DataAccessConstants.SORT_COLUMN%>" var="sortColumn"/>
<c:set value="<%=DataAccessConstants.SORT_DIRECTION%>" var="sortDirection"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TopCoder - PACTS</title>

    <%
        Boolean isNewStyle = request.getAttribute("isNewStyle") == null ? false : (Boolean) request.getAttribute("isNewStyle");
    %>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
  <jsp:param name="reskin" value="${isReskin ? 'paymentHistory' : ''}"/>
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
        function onPageChange(pageIndex) {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.START_RANK%>.value = (pageIndex - 1) * parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value) + 1;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value ='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

            myForm.submit();
        }
        function onPerPageChange(perPage) {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.START_RANK%>.value = 0;
            myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value = perPage;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value ='<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

            myForm.submit();
        }

        var init = ${isReskin};
        if (init) {
            window.addEventListener('load', function onInit() {
                var inputEl = document.querySelector('input#<%=DataAccessConstants.NUMBER_RECORDS%>');
                inputEl.setAttribute('readonly', '${isReskin ? "true" : "false"}');
                inputEl.setAttribute('autocomplete', '${isReskin ? "off" : "on"}')

                $('.payable').click(function() {
                    var paymentId = this.value;
                    var checked = this.checked;
                    if (checked) {
                        $('[data-name="${PAYMENT_ID}"][data-value="'+paymentId+'"]').removeClass('checked');
                        $('[data-name="${PAYMENT_ID}"][data-value="'+paymentId+'"]').addClass('checked');
                    } else {
                        $('[data-name="${PAYMENT_ID}"][data-value="'+paymentId+'"]').removeClass('checked');
                    }
                });

                $('[data-name="${PAYMENT_ID}"]').click(function () {
                    var paymentId = this.getAttribute('data-value');
                    $('.payable[value="' + paymentId + '"]').click();
                });

                $('.payable').click(function() {
                    var hasSelected = false;
                    $('.payable:checked').each(function () {
                        hasSelected = true;
                    });

                    if (hasSelected) {
                        $('.table-pagination').addClass('hiddenOnSelected');
                    } else {
                        $('.table-pagination').removeClass('hiddenOnSelected');
                    }
                });
            });
        }
    </script>

</head>
<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
    <jsp:param name="isReskin" value="${isReskin}"/>
</jsp:include>

<c:if test="${isReskin}">
<div class="page">
</c:if>

<table width="100%" border="0" cellpadding="0" cellspacing="0" class="myHome">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn" id="payments">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="Payments"/>
</jsp:include>

<div align="left" class="page-header">
    <% if(isNewStyle) { %>
    <div style="float:right; padding-top:12px;" class="how-to-get-paid">
        <A class="informationLink" href="https://www.topcoder.com/thrive/articles/Payment%20Policies%20and%20Instructions">How to get paid?</A>
    </div>
    <% } else { %>
    <div style="float:right;" class="how-to-get-paid">
        <A href="https://www.topcoder.com/thrive/articles/Payment%20Policies%20and%20Instructions"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
    </div>
    <% } %>

    <c:if test="${isReskin}">
        <a href="javascript:history.back()" class="back-btn">
            <i class="arrow-prev-icon"></i>
        </a>
    </c:if>

    <c:choose>
        <c:when test="${not empty isNewStyle && isNewStyle}">
            <h2 class="title">Payments</h2>
        </c:when>
        <c:otherwise>
            <span class="bodySubtitle title">Payments > </span><br>
        </c:otherwise>
    </c:choose>

    <div class="divider"></div>

    <c:if test="${!isReskin}">
        <c:if test="${fullList}" >
            View all | <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink">View pending</a> | <a href="/PactsMemberServlet?module=PaymentHistory&xls=true" class="bcLink">Export to Excel</a> | <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink">Payments Summary</a>
        </c:if>
        <c:if test="${not fullList}" >
            <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink">View all</a> | View pending | <a href="/PactsMemberServlet?module=PaymentHistory&xls=true" class="bcLink">Export to Excel</a> | <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink">Payments Summary</a>
        </c:if>
    </c:if>

    <c:if test="${isReskin}">
        <%-- desktop tabs --%>
        <nav class="tabs paymentHistoryTabs">
            <c:if test="${fullList}" >
                <span class="item active">View all</span>
                <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink item">View pending
                    <c:if test="${numPending ne 0}">
                        <span class="view-pending-badge">${numPending}</span>
                    </c:if>
                </a>
                <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink item">Payments Summary</a>
            </c:if>
            <c:if test="${not fullList}" >
                <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink item">View all</a>
                <span class="item active">View pending
                    <c:if test="${numPending ne 0}">
                        <span class="view-pending-badge">${numPending}</span>
                    </c:if>
                </span>
                <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink item">Payments Summary</a>
            </c:if>
        </nav>

        <%-- mobile dropdown --%>
        <div class="paymentHistoryDropdown-container">
        <div class="dropdown paymentHistoryDropdown">
            <button class="dropdown-toggle" type="button" onclick="onDropdownToggleClick()" id="paymentHistory-dropdown-toggle">
                <span class="toggle-value">
                    ${fullList ? 'View all' : 'View pending'}
                    <c:if test="${not fullList}">
                        <c:if test="${numPending ne 0}">
                            <span class="view-pending-badge">${numPending}</span>
                        </c:if>
                    </c:if>
                </span>
                <i class="icon icon-arrow-down"></i>
            </button>
            <div class="dropdown-menu">
                <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink item ${fullList ? 'active' : ''}">
                    View all
                </a>
                <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink item ${fullList ? '' : 'active'}">
                    View pending
                    <c:if test="${numPending ne 0}">
                        <span class="view-pending-badge">${numPending}</span>
                    </c:if>
                </a>
                <a href="/PactsMemberServlet?module=PaymentStatusSummary" class="bcLink item">
                    Payments Summary
                </a>
            </div>
            <script>
                function onDropdownToggleClick () {
                    var button = document.querySelector('#paymentHistory-dropdown-toggle')
                    if (button.getAttribute('data-open') === 'true') {
                        button.removeAttribute('data-open')
                    } else {
                       button.setAttribute('data-open', 'true')
                    }
                }
            </script>
        </div>
        <%-- Mobile sort-button --%>
        <c:if test="${not empty payments}">
            <a
                class="getable mobile-payments-sort-button ${requestScope[defaults][sortColumn] == 3 ? 'active' : ''} ${requestScope[defaults][sortDirection]}"
                href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true" />"
            >
                <span hidden>Sort by Create Date</span>
            </a>
        </c:if>
        </div>
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
    <form name="f" action="${sessionInfo.servletPath}" method="get" onsubmit="return checkPaymentHistoryForm();" class="form-container"
          id="PaymentHistoryForm">
    
        <c:if test="${!isReskin}">
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
        </c:if>


        <br>
    <% boolean even = true;%>

    <%-- TABLE --%>
    <c:if test="${isReskin}">
    <div class="payment-table">
    </c:if>

    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <colgroup>
        <col class="col-description">
        <col class="col-type">
        <col class="col-create-date">
        <col class="col-net-payment">
        <col class="col-status">
        <col class="col-release-date">
        <col class="col-paid-date">
        <col class="col-checkbox">
    </colgroup>
    <tbody>
        <tr class="caption">
            <td class="title" colspan="8">
            Payments
            </td>
        </tr>
        <tr class="headerRow ${requestScope[defaults][sortDirection]}">
            <td class="header ${requestScope[defaults][sortColumn] == 1 ? 'active' : ''}"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>" >Description</a></td>
            <td class="header ${requestScope[defaults][sortColumn] == 2 ? 'active' : ''}"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true" />" >Type</a></td>
            <td class="headerC ${requestScope[defaults][sortColumn] == 3 ? 'active' : ''}"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true" />" >Create Date</a></td>
            <td class="headerR ${requestScope[defaults][sortColumn] == 4 ? 'active' : ''}"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"  />" >Net Payment</a></td>
            <td class="header ${requestScope[defaults][sortColumn] == 5 ? 'active' : ''}"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true" />" >Status</a></td>
            <td class="headerC ${requestScope[defaults][sortColumn] == 6 ? 'active' : ''}"><a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true" />" >Release Date</a></td>
            <td class="headerC ${requestScope[defaults][sortColumn] == 7 ? 'active' : ''}" style="font-weight: bold">
                <%--<c:if test="${fullList}" >--%>
                    <a class="getable" href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true" />" >Date Paid</a>
                <%--</c:if>--%>
            </td>
            <td class="header">&nbsp;</td>
        </tr>
        
        <c:forEach items="${payments}" var="payment">
        
        <c:set var="typeId" value="${payment.paymentType}" />
        <tr class="<%=even?"light":"dark"%> ${(payment.currentStatus.id eq OWED or payment.currentStatus.id eq ACCRUING) ? 'highlight' : '' }">
            <td class="value description">
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
            <td class="value type">${payment.paymentTypeDesc}</td>
            <td class="valueC create-date"><fmt:formatDate value="${payment.createDate}" pattern="dd/MM/yyyy"/></td>
            <td class="valueR net-payment"><fmt:formatNumber value="${payment.netAmount}" type="currency" currencySymbol="$"/></td>
            <td class="value status"><span class="status ${payment.currentStatus.desc}"><span class="status-label">${payment.currentStatus.desc}</span></span>
                <c:forEach items="${payment.currentStatus.reasons}" var="reason">    
                <br>- ${reason.desc}
                </c:forEach>
            </td>
            <td class="valueC release-date ${empty payment.dueDate ? 'null-value' : ''}">
                <fmt:formatDate value="${payment.dueDate}" pattern="dd/MM/yyyy"/>
            </td>
            <td class="valueC paid-date ${empty payment.paidDate ? 'null-value' : ''}">
                <c:if test="${fullList}" >
                     <fmt:formatDate value="${payment.paidDate}" pattern="dd/MM/yyyy"/>
                </c:if>&nbsp;
            </td>
            <td class="value">
            <span class="checkbox">
                <c:set var="paymentIdString" value="${payment.id + ''}"/>
                <c:choose>
                    <c:when test="${payment.currentStatus.id eq PAID or payment.currentStatus.id eq ENTERED_INTO_PAYMENT_SYSTEM}">
                        <%-- Paid, Entered into Payment System: checked, disabled--%>
                        <input type="checkbox" disabled="disabled" checked="checked" name="${PAYMENT_ID}" value="${payment.id}" class="PAID-OR-ENTERED_INTO_PAYMENT_SYSTEM" />
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
                                <span class="checkbox-label"</span>
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
                        <input type="checkbox" disabled="disabled" name="${PAYMENT_ID}" value="${payment.id}" class="OTHER" />
                    </c:otherwise>
                </c:choose>
                <span class="checkbox-label"</span>
                <input type="hidden" value="${payment.netAmount}" class="paymentNetAmount"/>
            </span>
            </td>
         </tr>
         <% even = !even;%>
        </c:forEach>
    </tbody>
    </table>

    <c:if test="${isReskin}">
    </div><!-- // end .payment-table -->
    </c:if>

    <%-- LIST --%>
    <c:if test="${isReskin}">
    <div class="payment-list">
        <c:forEach items="${payments}" var="paymentItem">
            <div class="payment-list-item">
                <div class="row description">
                    <div class="col col-label">Description</div>
                    <div class="col col-value">
                        <c:choose>
                            <c:when test="${(typeId == 1 || typeId == 22) && paymentItem.roundId > 0}">
                                <A href="/stat?c=coder_room_stats&cr=${paymentItem.coderId}&rd=${paymentItem.roundId}">${paymentItem.description}</A>
                            </c:when>
                            <c:when test="${(typeId == 6 || typeId == 7) && paymentItem.projectId > 0}">
                                <A href="/tc?module=ProjectDetail&pj=${paymentItem.projectId}&tab=results">${paymentItem.description}
                                <c:if test="${paymentItem.grossAmount != paymentItem.totalAmount}">
                                    <c:choose>
                                        <c:when test="${paymentItem.installmentNumber == 1}">(${paymentItem.installmentNumber}st</c:when>
                                        <c:when test="${paymentItem.installmentNumber == 2}">(${paymentItem.installmentNumber}nd</c:when>
                                        <c:when test="${paymentItem.installmentNumber == 3}">(${paymentItem.installmentNumber}rd</c:when>
                                        <c:otherwise>(${paymentItem.installmentNumber}th</c:otherwise>
                                    </c:choose>
                                    installment, total amount=${paymentItem.totalAmount})
                                </c:if>
                                </A>
                            </c:when>
                            <c:when test="${(typeId == 17 || typeId == 25) && paymentItem.stageId > 0}">
                                <A href="/tc?module=LeaderBoard&ph=112&staid=${paymentItem.stageId}">${paymentItem.description}</A>
                            </c:when>
                            <c:when test="${typeId == 18 && paymentItem.seasonId > 0}">
                                <A href="/tc?module=RookieBoard&ph=112&seid=${paymentItem.seasonId}">${paymentItem.description}</A>
                            </c:when>
                            <c:when test="${(typeId == 40 || typeId == 41) && paymentItem.trackId > 0}">
                                <A href="/dr?module=ViewLeaderBoard&tid=${paymentItem.trackId}">${paymentItem.description}</A>
                            </c:when>
                            <c:when test="${typeId == 21 && paymentItem.roundId > 0}">
                                <A href="/longcontest/?module=ViewOverview&rd=${paymentItem.roundId}>">${paymentItem.description}</A>
                            </c:when>
                            <c:otherwise>
                                ${paymentItem.description}
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="row type">
                    <div class="col col-label">Type</div>
                    <div class="col col-value">${paymentItem.paymentTypeDesc}</div>
                </div>

                <div class="row create-date">
                    <div class="col col-label">Create Date</div>
                    <div class="col col-value"><fmt:formatDate value="${paymentItem.createDate}" pattern="dd/MM/yyyy"/></div>
                </div>

                <div class="row net-payment">
                    <div class="col col-label">Net Payment</div>
                    <div class="col col-value"><fmt:formatNumber value="${paymentItem.netAmount}" type="currency" currencySymbol="$"/></div>
                </div>

                <div class="row status">
                    <div class="col col-label">Status</div>
                    <div class="col col-value">
                        <span class="status ${paymentItem.currentStatus.desc}"><span class="status-label">${paymentItem.currentStatus.desc}</span></span>
                        <c:forEach items="${paymentItem.currentStatus.reasons}" var="reason">
                            <br>- ${reason.desc}
                        </c:forEach>
                    </div>
                </div>

                <div class="row release-date ${empty paymentItem.dueDate ? 'null-value' : ''}">
                    <div class="col col-label">Release Date</div>
                    <div class="col col-value"><fmt:formatDate value="${paymentItem.dueDate}" pattern="dd/MM/yyyy"/></div>
                </div>

                <div class="row paid-date ${empty paymentItem.paidDate ? 'null-value' : ''}">
                    <div class="col col-label">Date paid</div>
                    <div class="col col-value">
                        <c:if test="${fullList}" >
                            <fmt:formatDate value="${paymentItem.paidDate}" pattern="dd/MM/yyyy"/>
                        </c:if>
                    </div>
                </div>

                <div class="row checkbox">
                    <div class="col col-label"></div>
                    <div class="col col-value">
                        <c:set var="paymentIdString" value="${paymentItem.id + ''}"/>
                        <c:choose>
                            <c:when test="${paymentItem.currentStatus.id eq PAID or paymentItem.currentStatus.id eq ENTERED_INTO_PAYMENT_SYSTEM}">
                                <%-- Paid, Entered into Payment System: checked, disabled--%>
                                <span role="checkbox" class="checkbox disabled checked PAID-OR-ENTERED_INTO_PAYMENT_SYSTEM"></span>
                            </c:when>
                            <c:when test="${paymentItem.currentStatus.id eq OWED or paymentItem.currentStatus.id eq ACCRUING}">
                                <%-- Owed, Accruing --%>
                                <c:choose>
                                    <c:when test="${paymentItem.dueDate eq null or (paymentItem.dueDate > now)}">
                                        <%-- Payment release date is not reached yet: un-checked, disabled --%>
                                        <span role="checkbox" class="checkbox disabled" data-name="${PAYMENT_ID}" data-value="${paymentItem.id}"></span>
                                    </c:when>
                                    <c:when test="${paymentItem.paymentType eq NEGATIVE_PAYMENT}">
                                        <%-- Negative Payment: checked, readonly --%>
                                        <span role="checkbox" class="checkbox checked" data-name="${PAYMENT_ID}" data-value="${paymentItem.id}"></span>
                                    </c:when>
                                    <c:otherwise>
                                        <%-- All other cases: un-checked, normal --%>
                                        <span
                                            role="checkbox"
                                            class='checkbox <c:forEach items="${paramValues[PAYMENT_ID]}" var="pid"><c:if test="${pid eq paymentIdString}">checked="checked"</c:if></c:forEach>'
                                            data-name="${PAYMENT_ID}"
                                            data-value="${paymentItem.id}"
                                        ></span>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <%-- All other cases: un-checked, disabled--%>
                                <span role="checkbox" class="checkbox disabled OTHER" data-name="${PAYMENT_ID}" data-value="${paymentItem.id}"></span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div><!-- // end .payment-list -->
    </c:if>

    <%-- FOOTER ACTIONS --%>
    <c:if test="${isReskin}">
    <div class="table-footer">
    </c:if>

        <br/>

        <c:if test="${isNewStyle}">
            <div class="export-to-excel">
                <a id="xls" class="bcLink" href="/PactsMemberServlet?module=PaymentHistory&amp;xls=true">Export to Excel</a>
            </div>
        </c:if>

       <div align="right" class="pay-me-btn">
           <input type="button" value="Pay Me" id="payMe" disabled="disabled"/>
           <span class="payMeValue">Total: <span id="payMeValue"></span></span>
       </div> 
    
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="PaymentHistory"/>
            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
            <input type="hidden" name="<%= PaymentHistory.FULL_LIST %>" value="<c:out value="${fullList}"/>" />
    
            <div class="pagingBox table-pagination ${croppedDataBefore ? 'croppedDataBefore' : ''} ${croppedDataAfter ? 'croppedDataAfter' : ''} ${numTotal > 10 ? 'more-than-10-items' : ''}">
                <c:if test="${croppedDataBefore or croppedDataAfter}">
                    <c:choose>
                        <c:when test="${croppedDataBefore}">
                            <a href="Javascript:previous()" class="bcLink getable prev-btn">&lt;&lt; prev</a>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${isReskin}">
                                <span class="prev-btn disabled"></span>
                            </c:if>
                            <c:if test="${!isReskin}">
                                &lt;&lt; prev
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${isReskin}">
                        <div class="pageIndexes-container">
                            <c:set value="${numTotal / numPerPage + 0.99}" var="maxDisplayPages"/>
                            <c:set value="${numTotal / numPerPage + 0.99}" var="totalPages"/>
                            <c:forEach begin="1" end="${totalPages}" step="1" varStatus="i">
                                <c:set
                                    value="${requestScope[defaults][startRank] / numPerPage + 0.99}"
                                    var="activePageIndex"
                                />
                                <a href="javascript:onPageChange(${i.index})" class="page-btn ${
                                    activePageIndex - (activePageIndex % 1) == i.index
                                        ? 'active'
                                        : ''
                                } ${
                                    totalPages > 10 && (i.index + 4 < activePageIndex) ? 'hidden' : ''
                                } ${
                                    totalPages > 10 && (i.index - 4 > activePageIndex) ? 'hidden' : ''
                                }">${i.index}</a>
                            </c:forEach>
                        </div>
                    </c:if>

                    <c:choose>
                        <c:when test="${croppedDataAfter}">
                            <a href="Javascript:next()" class="bcLink getable next-btn">next &gt;&gt;</a>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${isReskin}">
                                <span class="next-btn disabled"></span>
                            </c:if>
                            <c:if test="${!isReskin}">
                                next &gt;&gt;
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                    <br/>
                </c:if>
                View &#160;

                <c:if test="${isReskin}">
                <div class="items-per-page">
                <label for="<%=DataAccessConstants.NUMBER_RECORDS%>">Items per page</label>
                </c:if>

                <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4" id="<%=DataAccessConstants.NUMBER_RECORDS%>"/>

                <c:if test="${isReskin}">
                <ul class="per-page-dropdown" style="visibility: hidden;">
                    <li class="${numPerPage == 10 ? 'selected' : ''}"><a href="javascript:onPerPageChange(10)">10</a></li>
                    <li class="${numPerPage == 20 ? 'selected' : ''}"><a href="javascript:onPerPageChange(20)">20</a></li>
                    <li class="${numPerPage == 100 ? 'selected' : ''}"><a href="javascript:onPerPageChange(100)">100</a></li>
                </ul>
                </c:if>

                <c:if test="${isReskin}">
                </div><!-- // end .items-per-page -->
                </c:if>

                &#160;at a time starting with &#160;

                <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                <button name="nameSubmit" value="submit" type="submit">Go</button>
            </div>

    <c:if test="${isReskin}">
    </div><!-- // end .table-footer -->
    </c:if>

    </form>            
    </c:when>
    <c:otherwise>
        <div align="center" class="no-payments-found">
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

<c:if test="${isReskin}">
</div><!-- // end .page -->
</c:if>

<jsp:include page="/foot.jsp" >
    <jsp:param name="isReskin" value="${isReskin}"/>
</jsp:include>

<c:if test="${isReskin}">
<div class="modal payment-confirm-modal" id="payment-confirm-modal-id">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">PAYMENT CONFIRMATION</h5>
        <button type="button" class="close-btn"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="button-secondary">Cancel</button>
        <button type="button" class="button-primary">Ok</button>
      </div>
    </div>
  </div>
</div>
</c:if>

</body>

</html>
