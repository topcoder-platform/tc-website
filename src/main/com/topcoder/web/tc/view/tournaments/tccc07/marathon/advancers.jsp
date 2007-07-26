<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.StringUtils,
                 java.util.Map"%>
<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
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
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco07_mm_adv_overview"); %>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="overview"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Advancers</span></h1>

                <div align="center">
                <a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Reset sorting</a>
                <%-- show this as default, in page view --%>
                | Page view
                | <a href="">Full view</a>
                <%-- show this in Full view
                | <a href="">Pages</a>
                | Full view
                --%>
                </div>

            <br><br>

            <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
            <thead>
                <tr><td class="title" colspan="8">Marathon Match Advancers</td></tr>
                <tr>
                    <td class="headerC"><a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&sd=asc&sc=seed&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Seed</a></td>
                    <td class="header" nowrap="nowrap"><a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&sd=asc&sc=handle_sort&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Handle</a></td>
                    <td class="headerR"><a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&sd=desc&sc=rating&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Rating</a></td>
                    <td class="headerC" width="20%">
                        <a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&sd=asc&sc=round1_sort&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Round 1</a>
                        <br /><a href="">details</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&sd=asc&sc=round2_sort&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Round 2</a>
                        <br /><a href="">details</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&sd=asc&sc=round3_sort&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Round 3</a>
                        <br /><a href="">details</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&sd=asc&sc=round4_sort&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Round 4</a>
                        <br /><a href="">details</a>
                    </td>
                    <td class="headerC" width="20%">
                        <a href="?module=SimpleStats&c=tco07_mm_adv_overview&trans=true&sd=asc&sc=finals_sort&d1=tournaments&d2=tco07&d3=marathon&d4=advOverview">Final</a>
                        <br /><a href="">details</a>
                    </td>
                </tr>
            </thead>
            <tbody>
<%-- formatting this crappy to save space in the download to the client --%>
                <%boolean even = false;%>
                <rsc:iterator list="<%=rsc%>" id="resultRow">
<tr class="<%=even?"dark":"light"%>">
<td class="valueC"><rsc:item name="seed" row="<%=resultRow%>"/></td>
<td class="value"><tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' context="<%=HandleTag.MARATHON_MATCH%>"/></td>
<td class="valueR"><rsc:item name="rating" row="<%=resultRow%>"/></td>
<% if (StringUtils.checkNull(resultRow.getStringItem("round1")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="round1" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="round1" row="<%=resultRow%>"/></span></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round2")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="round2" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="round2" row="<%=resultRow%>"/></span></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round3")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="round3" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="round3" row="<%=resultRow%>"/></span></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("round4")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="round4" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="round4" row="<%=resultRow%>"/></span></td>
<% } %>
<% if (StringUtils.checkNull(resultRow.getStringItem("final")).equals("Eliminated")) { %>
<td class="valueC"><span class="bigRed"><rsc:item name="final" row="<%=resultRow%>"/></span></td>
<% } else { %>
<td class="valueC"><span class="bigGreen"><rsc:item name="final" row="<%=resultRow%>"/></span></td>
<% } %>
</tr>
<%even=!even;%>
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