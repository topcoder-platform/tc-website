<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
</head>

<body>

<div align="center">
    <div id="content">

        <jsp:include page="top.jsp"/>

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value="creativeLeaderboard"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Creative Competitions Series Leaderboard</span>
            </div>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr>
        <td class="title" colspan="3">
        <span class="title">Creative Competitions Series Leaderboard</span>
        </td>
    </tr>
    <tr>
        <td class="headerC">
        Rank
        </td>
        <td class="header" width="100%">
        User
        </td>
        <td class="headerC" nowrap="nowrap">
        Placement Points
        </td>
    </tr>
</thead>
<tbody>
   <% boolean even = false; %>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">
        1
        </td>
        <td class="value">
        dsdirect
        </td>
        <td class="valueC">
        470
        </td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">
        2
        </td>
        <td class="value">
        Eeyore
        </td>
        <td class="valueC">
        395
        </td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">
        3
        </td>
        <td class="value">
        sbTopCoder
        </td>
        <td class="valueC">
        235
        </td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">
        4
        </td>
        <td class="value">
        rsarangdhar
        </td>
        <td class="valueC">
        165
        </td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">5</td>
        <td class="value">dhbello</td>
        <td class="valueC">
        100</td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">6</td>
        <td class="value">foxyhu</td>
        <td class="valueC">
        80</td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">7</td>
        <td class="value">merlinlain</td>
        <td class="valueC">
        75
        </td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">8</td>
        <td class="value">ericwangqing</td>
        <td class="valueC">
        20</td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">9</td>
        <td class="value">arpith</td>
        <td class="valueC">
        15</td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">10</td>
        <td class="value">ionacoder</td>
        <td class="valueC">
        10</td>
    </tr>
   <% even = !even;%>
   <tr class="<%=even?"dark":"light"%>">
        <td class="valueC">10</td>
        <td class="value">ayushbharti</td>
        <td class="valueC">
        10</td>
    </tr>
</tbody>
</table>
            

        </div>

        <jsp:include page="foot.jsp"/>
    </div>
</div>

</body>
</html>