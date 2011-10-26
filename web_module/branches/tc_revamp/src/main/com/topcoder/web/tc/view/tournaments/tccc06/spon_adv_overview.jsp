<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.StringUtils,
                 java.util.Map" %>
<%@ page language="java" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Open - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>

<body>


<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tccc06_spon_adv_overview"); %>

<!-- Tab barlinks-->
<jsp:include page="spon_links.jsp">
    <jsp:param name="tabLev2" value="advancers"/>
    <jsp:param name="tabLev3" value="overview"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <div class="bodySpacer">

                <span class="bigTitle">Advancers - Overview</span>
                <br><br>
                Click a column title to sort the list of advancers by that column. Click
                <a href="/tc?module=SimpleStats&c=tccc06_spon_adv_overview&trans=true&d1=tournaments&d2=tccc06&d3=spon_adv_overview">here</a>
                to reset the list to its originally sorted format.
                <br><br>
                <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                    <tr class="advHeader">
                        <td width="10%" align="center" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tccc06_spon_adv_overview&trans=true&sd=asc&sc=seed&d1=tournaments&d2=tccc06&d3=spon_adv_overview">Seed</a>
                        </td>
                        <td width="15%" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tccc06_spon_adv_overview&trans=true&sd=asc&sc=handle_sort&d1=tournaments&d2=tccc06&d3=spon_adv_overview">Handle</a>
                        </td>
                        <td width="5%" align="right" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tccc06_spon_adv_overview&trans=true&sd=desc&sc=rating&d1=tournaments&d2=tccc06&d3=spon_adv_overview">Rating</a>
                        </td>
                        <td width="10%" align="center" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tccc06_spon_adv_overview&trans=true&sd=asc&sc=round1_sort&d1=tournaments&d2=tccc06&d3=spon_adv_overview">Round
                                1</a></td>
                        <td width="10%" align="center" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tccc06_spon_adv_overview&trans=true&sd=asc&sc=round2_sort&d1=tournaments&d2=tccc06&d3=spon_adv_overview">Round
                                2</a></td>
                        <td width="10%" align="center" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tccc06_spon_adv_overview&trans=true&sd=asc&sc=round4_sort&d1=tournaments&d2=tccc06&d3=spon_adv_overview">Final</a>
                        </td>
                    </tr>
                    <%-- formatting this crappy to save space in the download to the client --%>
                    <%boolean even = false;%>
                    <rsc:iterator list="<%=rsc%>" id="resultRow">
                        <tr>
                            <td class="<%=even?"advanceDk":"advanceLt"%>" align="center">
                                <rsc:item name="seed" row="<%=resultRow%>"/></td>
                            <td class="<%=even?"advanceDk":"advanceLt"%>">
                                <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' context="algorithm"/></td>
                            <td class="<%=even?"advanceDk":"advanceLt"%>" align="right">
                                <rsc:item name="rating" row="<%=resultRow%>"/>&#160;&#160;</td>
                            <% if (StringUtils.checkNull(resultRow.getStringItem("round1")).equals("Eliminated")) { %>
                            <td class="<%=even?"eliminateDk":"eliminateLt"%>" align="center">
                                <rsc:item name="round1" row="<%=resultRow%>"/></td>
                            <% } else { %>
                            <td class="<%=even?"advanceDk":"advanceLt"%>" align="center">
                                <rsc:item name="round1" row="<%=resultRow%>"/></td>
                            <% } %>
                            <% if (StringUtils.checkNull(resultRow.getStringItem("round2")).equals("Eliminated")) { %>
                            <td class="<%=even?"eliminateDk":"eliminateLt"%>" align="center">
                                <rsc:item name="round2" row="<%=resultRow%>"/></td>
                            <% } else { %>
                            <td class="<%=even?"advanceDk":"advanceLt"%>" align="center">
                                <rsc:item name="round2" row="<%=resultRow%>"/></td>
                            <% } %>
                            <% if (StringUtils.checkNull(resultRow.getStringItem("final")).equals("Eliminated")) { %>
                            <td class="<%=even?"eliminateDkC":"eliminateLtC"%>">
                                <rsc:item name="final" row="<%=resultRow%>"/></td>
                            <% } else { %>
                            <td class="<%=even?"advanceDkC":"advanceLtC"%>">
                                <rsc:item name="final" row="<%=resultRow%>"/></td>
                            <% } %>
                        </tr>
                        <%even = !even;%>
                    </rsc:iterator>
                </table>
            </div>
        </td>


<!-- Right Column-->
<td width="170" align="right">
<img src="/i/clear.gif" alt="" width="170" height="15" border="0" /><br />
<%--
<div align="center" class="bodyText"><strong><A href="/tc?module=Static&d1=calendar&d2=thisMonth">More TopCoder Events</A></strong></div>
--%>
</td>

    </tr>

</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
