<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.StringUtils,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tco07_alg_adv_overview"); %>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="overview"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Advancers</span></h1>

                <div align="center">
                <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Reset sorting</a>
                <%-- show this as default, in page view --%>
                | Page view
                | <a href="">Full view</a>
                <%-- show this in Full view
                | <a href="">Pages</a>
                | Full view
                --%>
                </div>
                <br /><br />
                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=seed&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Seed</a>
                        </td>
                        <td class="header">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=handle_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Handle</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=section&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Section</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=desc&amp;sc=rating&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Rating</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round1_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Round
                                1</a>
                            <br />details: 
                            <a href="">A</a>
                            <a href="">B</a>
                            <a href="">C</a>
                            </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round2_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Round
                                2</a>
                            <br /><a href="">details</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round3_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Round
                                3</a>
                            <br /><a href="">details</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round4_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Round
                                4</a>
                            <br /><a href="">details</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=semi_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Semi</a>
                            <br />details: 
                            <a href="">1</a>
                            <a href="">2</a>
                            <a href="">3</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=wildcard_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Wildcard</a>
                            <br /><a href="">details</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=finals_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Final</a>
                            <br /><a href="">details</a>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <%-- formatting this crappy to save space in the download to the client --%>
                    <%boolean even = false;%>
                    <rsc:iterator list="<%=rsc%>" id="resultRow"><tr class="<%=(even ? "dark" : "light")%>">
<td class="valueC"><rsc:item name="seed" row="<%=resultRow%>"/></td>
<td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' context="algorithm"/></td>
<td class="valueC"><rsc:item name="section" row="<%=resultRow%>"/></td>
<td class="valueC"><rsc:item name="rating" row="<%=resultRow%>"/></td>
<% if (StringUtils.checkNull(resultRow.getStringItem("round1")).equals("Eliminated")) { %>
<td class="valueCE"><rsc:item name="round1" row="<%=resultRow%>"/></td>
<% } else { %>
<td class="valueCA"><rsc:item name="round1" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round2")).equals("Eliminated")) { %>
<td class="valueCE"><rsc:item name="round2" row="<%=resultRow%>"/></td>
<% } else { %>
<td class="valueCA"><rsc:item name="round2" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round3")).equals("Eliminated")) { %>
<td class="valueCE"><rsc:item name="round3" row="<%=resultRow%>"/></td>
<% } else { %>
<td class="valueCA"><rsc:item name="round3" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round4")).equals("Eliminated")) { %>
<td class="valueCE"><rsc:item name="round4" row="<%=resultRow%>"/></td>
<% } else { %>
<td class="valueCA"><rsc:item name="round4" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("semi")).equals("Eliminated")) { %>
<td class="valueCE"><rsc:item name="semi" row="<%=resultRow%>"/></td>
<% } else { %>
<td class="valueCA"><rsc:item name="semi" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("wildcard")).equals("Eliminated")) { %>
<td class="valueCE"><rsc:item name="wildcard" row="<%=resultRow%>"/></td>
<% } else { %>
<td class="valueCA"><rsc:item name="wildcard" row="<%=resultRow%>"/></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("final")).equals("Eliminated")) { %>
<td class="valueCE"><rsc:item name="final" row="<%=resultRow%>"/></td>
<% } else { %>
<td class="valueCA"><rsc:item name="final" row="<%=resultRow%>"/></td>
<% } %>
</tr>
<%even = !even;%>
</rsc:iterator>
                </tbody>
                </table>


            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>