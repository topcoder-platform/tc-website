<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.tc.Constants,
                 java.util.HashMap" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<%
    String type = "design";
%>
    
<body>

<table>

        <% boolean even = false;%>
        <% int i = 0;%>
    <c:forEach items="${results}" var="boardRow">
    <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">${boardRow.rank}</td>
        <td class="value" style="border-right: 1px solid #999999;">
            <tc-webtag:handle coderId='${boardRow.userId}' context='<%=type%>'/></td>
        <td class="valueC">
            <c:if test="${boardRow.winTrip}">
                <div id="pop<%=i%>a" class="popUp"><div>Trip to the next TCO Finals for placing in the <strong>Top Five</strong></div></div>
                <div align="center"><img src="/i/interface/emblem/trip.gif" alt="" border="0" onmouseover="popUp(this,'pop<%=i%>a')" onmouseout="popHide()" /></div>
            </c:if>
        </td>
        <td class="valueC">
            <c:if test="${boardRow.winTrip}">
                <div id="pop<%=i%>b" class="popUp"><div>Cash prize for placing in the <strong>Top Five</strong></div></div>
                <div align="center"><img src="/i/interface/emblem/prize.gif" alt="" border="0" onmouseover="popUp(this,'pop<%=i%>b')" onmouseout="popHide()" /></div>
            </c:if>
        </td>
        <td class="valueC">
            <c:if test="${boardRow.topPerformer}">
                <div id="pop<%=i%>c" class="popUp"><div>Cash prize for placing in the <strong>Top Performers</strong></div></div>
                <div align="center"><img src="/i/interface/emblem/prize.gif" alt="" border="0" onmouseover="popUp(this,'pop<%=i%>c')" onmouseout="popHide()" /></div>
            </c:if>
        </td>
        <td class="valueR">
            <c:if test="${boardRow.points>0}">
            <A href="/tc?module=CompetitionHistory&ph=${boardRow.phase}&cr=${boardRow.userId}" class="bcLink">${boardRow.points}</a>
            </c:if>
        </td>
</c:if></td>
<td class="valueR"><c:if test="${boardRow.placementPrize>0}">
    <fmt:formatNumber value="${boardRow.placementPrize}" type="currency" currencySymbol="$"/>
</c:if></td>
<td class="valueR"><c:if test="${boardRow.pointsPrize>0}">
    <fmt:formatNumber value="${boardRow.pointsPrize}" type="currency" currencySymbol="$"/>
</c:if></td>
<td class="valueR" style="border-right: 1px solid #999999;">
    <c:if test="${boardRow.totalPrize>0}">
        <fmt:formatNumber value="${boardRow.totalPrize}" type="currency" currencySymbol="$"/>
    </c:if>
    <c:if test="${boardRow.totalPrize==0}">
        &#160;
    </c:if>
</td>
<td class="valueR"><c:if test="${boardRow.outstandingPoints>0}">
    <A href="/tc?module=OutstandingProjects&ph=${boardRow.phase}&staid=${boardRow.period}&cr=${boardRow.userId}" class="bcLink">${boardRow.outstandingPoints}</a>
</c:if></td>
<td class="valueR">${boardRow.totalPoints}</td>
</tr>
<%i++;%>
<%even = !even;%>
</c:forEach>
</table>


</table>

</BODY>
</HTML>