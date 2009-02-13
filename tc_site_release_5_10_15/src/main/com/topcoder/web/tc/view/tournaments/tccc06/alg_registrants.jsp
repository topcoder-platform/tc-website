<%@ page language="java" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <jsp:include page="/script.jsp"/>

    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <%@ taglib uri="tc.tld" prefix="tc" %>
    <%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

    <%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
</head>

<body>

<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list")); %>
<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="algorithm"/>
    <jsp:param name="tabLev2" value="registrants"/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <div class="bodySpacer">

                <span class="bigTitle">Algorithm Competition Registrants</span>
                <br><br>
                <table class="formFrame" border="0" cellpadding="6" cellspacing="0" width="300">
                    <tbody><tr>
                        <td class="advTitle" colspan="3" width="100%">Registrants (<%=rsc.size()%>)</td>
                    </tr>
                        <tr class="advHeader">
                            <td align="left">
                                <a href="/tc?module=TCCC06AlgRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("rank")%>"/>">Rank</a>
                            </td>
                            <td align="left" width="100%">
                                <a href="/tc?module=TCCC06AlgRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
                            </td>
                            <td align="right">
                                <a href="/tc?module=TCCC06AlgRegistrants<tc-webtag:sort column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
                            </td>
                        </tr>
                        <%boolean even = false;%>
<rsc:iterator list='<%=rsc%>' id="resultRow"><tr><td class="<%=(even ? "advanceDk" : "advanceLt")%>">
<rsc:item name="rank" row='<%=resultRow%>'/></td>
<td class="<%=(even ? "advanceDk" : "advanceLt")%>">
<tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="algorithm" darkBG="true"/></td>
<td class="<%=(even ? "advanceDk" : "advanceLt")%>" align="right">
<rsc:item format="###0" ifNull="Unrated" name="rating" row='<%=resultRow%>'/></td>
</tr><%even = !even;%></rsc:iterator>
                </table>
                <br><br>
            </div>
        </td>


        <!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
                <jsp:param name="level1" value="all"/>
            </jsp:include>
        </td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>

</body>

</html>
