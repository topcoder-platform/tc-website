<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.member.AffidavitHistory" %>
<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.web.tc.Constants" %>

<%@ page language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<c:set var="fullList" value="<%= request.getAttribute(AffidavitHistory.FULL_LIST) %>"/>
<c:set var="affidavits" value="<%= request.getAttribute(AffidavitHistory.AFFIDAVITS) %>"/>
<c:set value="<%=AffidavitHistory.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>

<%
    ResultSetContainer rsc = (ResultSetContainer) request.getAttribute(AffidavitHistory.AFFIDAVITS);
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
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="Affidavits"/>
</jsp:include>


<div align="left">
    <div style="float:right;">
       <A href="/wiki/display/tc/How+to+Get+Paid+for+Competing"><img src="/i/pacts/howToGetPaid.png" alt="How to get paid" /></A>
    </div>
    <span class="bodySubtitle">Affidavits > </span><br>
    <c:if test="${fullList}" >
        View all | <a href="/PactsMemberServlet?module=AffidavitHistory&full_list=false" class="bcLink">View pending</a>
    </c:if>
    <c:if test="${not fullList}" >
        <a href="/PactsMemberServlet?module=AffidavitHistory&full_list=true" class="bcLink">View all</a> | View pending
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

<table cellpadding="0" cellspacing="0" class="stat" width="100%">
<tbody>
    <tr>
        <td class="title" colspan="7">
        Affidavits
        </td>
    </tr>
    <tr>
        <td class="header"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">
        Description</a>
        </td>
        <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">
        Affirmation</a>
        </td>
        <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">
        Time Left</a>
        </td>
        <td class="headerR"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">
        Net Payment</a>
        </td>
        <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">
        Notarized</a>
        </td>
        <td class="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">
        Status</a>
        </td>
        <td class="headerC">
        <c:if test="${fullList}" ><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="7" includeParams="true"/>">
            <b>Date Paid</b>            </a>
        </c:if>&nbsp;
        </td>
    </tr>
<% boolean even = true;%>
<rsc:iterator list="${affidavits}" id="resultRow">
    <c:set var="statusId" value="<%= resultRow.getStringItem("status_id") %>" />
    <c:set var="affidavitId" value="<%= resultRow.getStringItem("affidavit_id") %>" />
    <c:set var="notarized" value="<%= Boolean.valueOf(resultRow.getIntItem("notarized") == 1) %>" />

    <tr class="<%=even?"light":"dark"%>">
        <td class="value">
            <rsc:item name="affidavit_desc" row="<%=resultRow%>"/>
        </td>
    <c:choose>
        <c:when test="${statusId == 58}">
            <td class="valueC">
                <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavitId}">
                    Affirmed on<br><rsc:item name="date_affirmed" row="<%=resultRow%>"  format="MM/dd/yy"/>
                </a>                
            </td>
            <td class="valueC">&nbsp;</td>
        </c:when>
        <c:when test="${statusId == 57}">
        <td class="valueC">
            <strong><a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavitId}">
                Affirm now
            </a></strong>
        </td>
        <td class="valueC">
        <% if (resultRow.getIntItem("affidavit_type_id") == 1) { %>
            <strong><a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavitId}">
                 <rsc:item name="time_left" row="<%=resultRow%>"/> days
            </a></strong>            
         <% } else { %>
           -         
         <% }  %>
            
            
        </td>
        </c:when>
        <c:otherwise>
        <td class="valueC">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavitId}" class="bigRed">
                Expired
            </a>
        </td>
        <td class="valueC">
            <a href="/PactsMemberServlet?t=affidavit&c=affidavit_details&affidavit_id=${affidavitId}" class="bigRed">
                Expired
            </a>                
        </td>
        </c:otherwise>
    </c:choose>
        <td class="valueR">
            <rsc:item name="net_amount" row="<%=resultRow%>"  format="$###,###,##0.00"/>
        </td>
        <td class="valueC">
            <c:choose>
                <c:when test="${notarized}">yes</c:when>
                <c:otherwise>no</c:otherwise>                 
            </c:choose>
        </td>
        <td class="valueC">
            <rsc:item name="status_desc" row="<%=resultRow%>" />
        </td>
        <td class="valueC">
            <c:if test="${fullList}" >
                <b><rsc:item name="date_paid" row="<%=resultRow%>"  format="MM/dd/yy"/>                  
            </c:if>
        </td>
    </tr>
<% even = !even;%>
</rsc:iterator>
</tbody>
</table>




        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AffidavitHistory"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
        <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
        <input type="hidden" name="<%= AffidavitHistory.FULL_LIST %>" value="<c:out value="${fullList}"/>" />

            <% if (rsc.croppedDataBefore() || rsc.croppedDataAfter()) { %>
            <div class="pagingBox">
        <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
        | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
                
            </div>
            <% } %>
</form>            
<% } else { %>
<div align="center">
<strong>No Affidavits Found</strong>
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
