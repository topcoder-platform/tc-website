<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.PaymentHistory" %>
<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
		         com.topcoder.shared.dataAccess.DataAccessConstants,
		         com.topcoder.web.tc.Constants" %>

<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set var="fullList" value="<%= request.getAttribute(PaymentHistory.FULL_LIST) %>"/>
<c:set var="payments" value="<%= request.getAttribute(PaymentHistory.PAYMENTS) %>"/>
<c:set var="cr" value="<%= request.getAttribute(PaymentHistory.CODER) %>"/>

<c:set value="<%=PaymentHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>

<%
	ResultSetContainer rsc = (ResultSetContainer) request.getAttribute(PaymentHistory.PAYMENTS);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - PACTs</title>


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
            <jsp:param name="node" value="payments"/>
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
       <A href="/tc?module=Static&d1=help&d2=getPaid&node=algo_get_paid"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
    </div>
    <span class="bodySubtitle">Payments > </span><br>
    <c:if test="${fullList}" >
        View all | <a href="/PactsMemberServlet?module=PaymentHistory&full_list=false" class="bcLink">View pending</a>
    </c:if>
    <c:if test="${not fullList}" >
        <a href="/PactsMemberServlet?module=PaymentHistory&full_list=true" class="bcLink">View all</a> | View pending
    </c:if>
</div>

<br clear="all">

<% if (rsc.size() > 0) { %>
<form name="f" action="${sessionInfo.servletPath}" method="get">

            <% if (rsc.croppedDataBefore() || rsc.croppedDataAfter()) { %>
            <div class="pagingBox">
        <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
        | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
                
            </div>
            <% } %>


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
        <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true" excludeParams="sr"/>" >Status</a></td>
        <td class="headerC">
            <c:if test="${fullList}" >
                <b><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true" excludeParams="sr"/>" >Date Paid</a>       
            </c:if>&nbsp;
        </td>
    </tr>
<rsc:iterator list="${payments}" id="resultRow">
	<c:set var="typeId" value="<%= resultRow.getStringItem("payment_type_id") %>" />
	<c:set var="algorithmRoundId" value="<%= resultRow.getStringItem("algorithm_round_id") %>" />
	<c:set var="componentProjectId" value="<%= resultRow.getStringItem("component_project_id") %>" />
	<c:set var="digitalRunStageId" value="<%= resultRow.getStringItem("digital_run_stage_id") %>" />
	<c:set var="digitalRunSeasonId" value="<%= resultRow.getStringItem("digital_run_season_id") %>" />			
	<c:choose>
<c:when test="${typeId == 4}"><!-- coder referral --></c:when>
<c:when test="${typeId == 13}"><!-- studio --></c:when>
<c:otherwise>
	
    <tr class="<%=even?"light":"dark"%>">
        <td class="value">
            <c:choose>
                <c:when test="${(typeId == 1 || typeId == 22) && algorithmRoundId > 0}">
                    <A href="/stat?c=coder_room_stats&cr=${cr}&rd=${algorithmRoundId}"><rsc:item name="payment_desc" row="<%=resultRow%>"/></A>
                </c:when>
                <c:when test="${(typeId == 6 || typeId == 7) && componentProjectId > 0}">
                    <A href="/tc?module=CompContestDetails&pj=${componentProjectId}" class="bcLink"><rsc:item name="payment_desc" row="<%=resultRow%>"/>
                    <% if(resultRow.getDoubleItem("gross_amount") != resultRow.getDoubleItem("total_amount")) {
                        int inst = resultRow.getIntItem("installment_number");
                    	String cardinal = inst == 1? "1st" : inst==2? "2nd" : inst==3? "3rd" : inst+"th";
                    %>
                      (<%= cardinal %> installment, total amount=<%= resultRow.getDoubleItem("total_amount") %>)                    
                    <% } %>
                    </A>                    
                </c:when>
                <c:when test="${(typeId == 17 || typeId == 25) && digitalRunStageId > 0}">
                    <A href="/tc?module=LeaderBoard&ph=112&staid=${digitalRunStageId}" class="bcLink"><rsc:item name="payment_desc" row="<%=resultRow%>"/></A>                    
                </c:when>
                <c:when test="${typeId == 18 && digitalRunSeasonId > 0}">
                    <A href="/tc?module=RookieBoard&ph=112&seid=${digitalRunSeasonId}" class="bcLink"><rsc:item name="payment_desc" row="<%=resultRow%>"/></A>                    
                </c:when>
                <c:when test="${typeId == 21 && algorithmRoundId > 0}">
                    <A href="/longcontest/?module=ViewOverview&rd=${algorithmRoundId}>" class="bcLink"><rsc:item name="payment_desc" row="<%=resultRow%>"/></A>                    
                </c:when>                
                <c:otherwise>
                   <rsc:item name="payment_desc" row="<%=resultRow%>"/>
                </c:otherwise>
            </c:choose>
        
        
        </td>
        <td class="value"><rsc:item name="payment_type_desc" row="<%=resultRow%>"/></td>
        <td class="valueC"><rsc:item name="date_due" row="<%=resultRow%>"  format="MM/dd/yy"/></td>
        <td class="valueR"><rsc:item name="net_amount" row="<%=resultRow%>"  format="$###,###,##0.00"/></td>
        <td class="valueC"><rsc:item name="status_desc" row="<%=resultRow%>" /></td>
        <td class="valueC">
            <c:if test="${fullList}" >
                <b><rsc:item name="date_paid" row="<%=resultRow%>"  format="MM/dd/yy"/>          
            </c:if>&nbsp;
        </td>
     </tr>
     <% even = !even;%>
     </c:otherwise>
     </c:choose>
</rsc:iterator>
</tbody>
</table>


        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="PaymentHistory"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
        <input type="hidden" name="<%= PaymentHistory.FULL_LIST %>" value="<c:out value="${fullList}"/>" />

            <% if (rsc.croppedDataBefore() || rsc.croppedDataAfter()) { %>
            <div class="pagingBox">
        <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
        | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
                
            </div>
            <% } %>
</form>            
<% } else { %>
<div align="center">
<strong>No Payments Found</strong>
</div>
<% } %>
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
