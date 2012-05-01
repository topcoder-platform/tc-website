<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.PaymentHistory" %>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants" %>

<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set var="fullList" value="<%= request.getAttribute(PaymentHistory.FULL_LIST) %>"/>
<c:set var="payments" value="<%= request.getAttribute(PaymentHistory.PAYMENTS) %>"/>
<c:set var="cr" value="<%= request.getAttribute(PaymentHistory.CODER) %>"/>
<c:set var="xlsLink" value="<%= request.getAttribute(PaymentHistory.XLS_LINK) %>" />

<c:set value="<%=PaymentHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - PACTS</title>


<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

    <script type="text/javascript">
        var sr = <c:out value="${requestScope[defaults][startRank]}"/>;
        var er = <c:out value="${requestScope[defaults][endRank]}"/>;

        function next() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.START_RANK%>.value = er + 1;
            myForm.<%=DataAccessConstants.END_RANK%>.value = 2 * er - sr + 1;
            myForm.submit();
        }
        function previous() {
            var myForm = document.f;
            myForm.<%=DataAccessConstants.END_RANK%>.value = sr - 1;
            myForm.<%=DataAccessConstants.START_RANK%>.value = 2 * sr - er - 1;
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
        View all | <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink">View pending</a> | <a href="${xlsLink}" class="bcLink">Export to Excel</a>
    </c:if>
    <c:if test="${not fullList}" >
        <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink">View all</a> | View pending | <a href="${xlsLink}" class="bcLink">Export to Excel</a>
    </c:if>
</div>

<br clear="all">

<c:choose>
    <c:when test="${not empty payments}">
    <form name="f" action="${sessionInfo.servletPath}" method="get">
    
        <c:if test="${croppedDataBefore or croppedDataAfter}" >
            <div class="pagingBox">
                <c:choose>
                    <c:when test="${croppedDataBefore}">
                        <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
                    </c:when>
                    <c:otherwise>
                        &lt;&lt; prev
                    </c:otherwise>
                </c:choose>
                
                <c:choose>
                    <c:when test="${croppedDataAfter}">
                        <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
                    </c:when>
                    <c:otherwise>
                        next &gt;&gt;
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
    
    <br>
    <% boolean even = true;%>
    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <tbody>
        <tr>
            <td class="title" colspan="6">
            Payments
            </td>
        </tr>
        <tr>
            <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true" excludeParams="sr"/>" >Description</a></td>
            <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true" excludeParams="sr"/>" >Type</a></td>
            <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true" excludeParams="sr"/>" >Due Date</a></td>
            <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true" excludeParams="sr" />" >Net Payment</a></td>
            <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true" excludeParams="sr"/>" >Status</a></td>
            <td class="headerC">
                <c:if test="${fullList}" >
                    <b><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true" excludeParams="sr"/>" >Date Paid</a>       
                </c:if>&nbsp;
            </td>
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
                        <A href="/tc?module=CompContestDetails&pj=${payment.projectId}" class="bcLink">${payment.description}
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
            <td class="valueC"><fmt:formatDate value="${payment.dueDate}" pattern="MM/dd/yyyy"/></td>
            <td class="valueR"><fmt:formatNumber value="${payment.netAmount}" type="currency" currencySymbol="$"/></td>
            <td class="value"><strong>${payment.currentStatus.desc}</strong> 
                <c:forEach items="${payment.currentStatus.reasons}" var="reason">    
                <br>- ${reason.desc}
                </c:forEach>
            </td>
            <td class="valueC">
                <c:if test="${fullList}" >
                     <b><fmt:formatDate value="${payment.paidDate}" pattern="MM/dd/yyyy"/></b>
                </c:if>&nbsp;
            </td>
         </tr>
         <% even = !even;%>
        </c:forEach>
    </tbody>
    </table>
    
    
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="PaymentHistory"/>
            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
            <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
            <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
            <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
            <input type="hidden" name="<%= PaymentHistory.FULL_LIST %>" value="<c:out value="${fullList}"/>" />
    
        <c:if test="${croppedDataBefore or croppedDataAfter}" >
            <div class="pagingBox">
                <c:choose>
                    <c:when test="${croppedDataBefore}">
                        <a href="Javascript:previous()" class="bcLink">&lt;&lt; prev</a>
                    </c:when>
                    <c:otherwise>
                        &lt;&lt; prev
                    </c:otherwise>
                </c:choose>
                
                <c:choose>
                    <c:when test="${croppedDataAfter}">
                        <a href="Javascript:next()" class="bcLink">next &gt;&gt;</a>
                    </c:when>
                    <c:otherwise>
                        next &gt;&gt;
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
    
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
