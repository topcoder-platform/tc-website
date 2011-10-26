<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.common.StringUtils,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
<% ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("tco07_alg_adv_overview"); %>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="advancers"/>
                    <jsp:param name="tabLev3" value="overview"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Algorithm Competition</span></h1>

                <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Reset sorting</a>
                <br><br>
                <table cellpadding="0" cellspacing="0" class="stat" style="width: 100%;">
                <thead>
                    <tr>
                        <td class="title" colspan="10">Algorithm Advancers</td>
                    </tr>
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
                                1</a></td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round2_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Round
                                2</a></td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round3_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Round
                                3</a></td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=round4_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Round
                                4</a></td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=semi_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Semi</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=wildcard_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Wildcard</a>
                        </td>
                        <td class="headerC">
                            <a href="?module=SimpleStats&amp;c=tco07_alg_adv_overview&amp;trans=true&amp;sd=asc&amp;sc=finals_sort&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers">Final</a>
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
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
