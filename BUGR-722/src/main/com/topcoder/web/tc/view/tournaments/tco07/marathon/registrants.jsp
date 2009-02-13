<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
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

<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list"));
String compType = (String) request.getAttribute("ct"); %>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="marathon"/>
                    <jsp:param name="tabLev2" value="registrants"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Registrants</span></h1>

<div align="center">
<table cellpadding="0" cellspacing="0" class="stat" style="width:400px; margin-bottom: 100px;">
<thead>
    <tr><td class="title" colspan="3">Registrants: <%=rsc.size()%></td></tr>
    <tr>
        <td class="headerC" nowrap="nowrap">
            <a href="/tc?module=TCO07ViewRegistrants&amp;ct=<%=compType%><tc-webtag:sort column="<%=rsc.getColumnIndex("seed")%>"/>">Seed</a>
        </td>
<%-- show after seeds are assigned
        <td class="headerC">
            <a href="">Seed</a>
        </td>
--%>
        <td class="header" width="100%">
            <a href="/tc?module=TCO07ViewRegistrants&amp;ct=<%=compType%><tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
        </td>
        <td class="headerR">
            <a href="/tc?module=TCO07ViewRegistrants&amp;ct=<%=compType%><tc-webtag:sort column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
        </td>
    </tr>
</thead>
<tbody>
<%boolean even = false;%>
<rsc:iterator list='<%=rsc%>' id="resultRow">
<tr class="<%=(even ? "dark" : "light")%>">
<td class="valueC">
<rsc:item name="seed" row='<%=resultRow%>'/>
</td>
<td class="value">
<tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="marathon_match"/>
</td>
<td class="valueR">
<rsc:item format="###0" ifNull="Unrated" name="rating" row='<%=resultRow%>'/>
</td>
</tr>
<%even = !even;%>
</rsc:iterator>
</tbody>
</table>
</div>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
