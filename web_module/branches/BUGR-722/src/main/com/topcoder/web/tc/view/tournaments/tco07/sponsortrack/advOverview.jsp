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

    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>

<body>


<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tco07_spon_adv_overview"); %>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="advancers"/>
                    <jsp:param name="tabLev2" value="overview"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <%--<img src="/i/tournament/tco07/competitorsbanner.jpg" alt="Competitors" />--%>
                    <div id="pageBody">
                        <h1><span>Advancers - Overview</span></h1>
                <p>Click a column title to sort the list of advancers by that column. Click
                <a href="/tc?module=SimpleStats&c=tco07_spon_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco07&amp;d3=spon_adv_overview">here</a>
                to reset the list to its originally sorted format.</p>
                <p></p>
                <table width="500" align="center" border="0" cellpadding="2" cellspacing="0" class="formFrame">
                    <tr class="advHeader">
                        <td width="10%" align="center" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tco07_spon_adv_overview&trans=true&sd=asc&sc=seed&amp;d1=tournaments&amp;d2=tco07&amp;d3=spon_adv_overview">Seed</a>
                        </td>
                        <td width="15%" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tco07_spon_adv_overview&trans=true&sd=asc&sc=handle_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=spon_adv_overview">Handle</a>
                        </td>
                        <td width="5%" align="right" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tco07_spon_adv_overview&trans=true&sd=desc&sc=rating&amp;d1=tournaments&amp;d2=tco07&amp;d3=spon_adv_overview">Rating</a>
                        </td>
                        <td width="10%" align="center" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tco07_spon_adv_overview&trans=true&sd=asc&sc=round1_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=spon_adv_overview">Round
                                1</a></td>
                        <td width="10%" align="center" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tco07_spon_adv_overview&trans=true&sd=asc&sc=round2_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=spon_adv_overview">Round
                                2</a></td>
                        <td width="10%" align="center" nowrap="nowrap">
                            <a href="?module=SimpleStats&c=tco07_spon_adv_overview&trans=true&sd=asc&sc=round4_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=spon_adv_overview">Final</a>
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
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
