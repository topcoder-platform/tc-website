<%@ page contentType="text/html;charset=utf-8" %> 
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

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="studio"/>
                    <jsp:param name="tabLev2" value="advancers"/>
                    <jsp:param name="tabLev3" value="leaderboard"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><div>Studio Leaderboard</div></h1>

<table cellspacing="0" cellpadding="0" class="stat" style="width: 100%">
<thead>
    <tr>
        <td class="title" colspan="7">
        Studio Leaderboard
        </td>
    </tr>
    <tr>
        <td class="headerC" rowspan="2">
            <A href="">Rank</A>
        </td>
        <td class="header" rowspan="2">
            <A href="">Handle</A>
        </td>
        <td class="headerC" colspan="2" nowrap="nowrap" style="border-right: 1px solid #999999;">
            Completed
        </td>
        <td class="headerC" colspan="2" nowrap="nowrap">
            In Progress
        </td>
        <td class="headerC" rowspan="2" nowrap="nowrap">
            <A href="">Potential Total<br>Points</A>
        </td>
    </tr>
    <tr>
        <td class="headerC">
            <A href="">Contests</A>
        </td>
        <td class="headerC" style="border-right: 1px solid #999999;">
            <A href="">Points</A>
        </td>
        <td class="headerC">
            <A href="">Contests</A>
        </td>
        <td class="headerC">
            <A href="">Points</A>
        </td>
    </tr>
</thead>
<tbody>
<%-- advancers 1-8, highlight important cols with bigGreen --%>
    <%boolean even = false;%>
    <tr class="<%=(even ? "dark" : "light")%>">
        <td class="valueC">
        <span class="bigGreen">1</span>
        </td>
        <td class="value">
        <strong>mirosuaf</strong>
        </td>
        <td class="valueC">
        5
        </td>
        <td class="valueC" style="border-right: 1px solid #999999;">
        <span class="bigGreen">123</span>
        </td>
        <td class="valueC">
        5
        </td>
        <td class="valueC">
        123
        </td>
        <td class="valueC">
        246
        </td>
    </tr>
    <%even = !even;%>
<%-- cutoff, uses bigRed instead of bigGreen --%>
    <tr class="<%=(even ? "dark" : "light")%>">
        <td class="valueC">
        <span class="bigRed">9</span>
        </td>
        <td class="value">
        <strong>mirosuaf</strong>
        </td>
        <td class="valueC">
        5
        </td>
        <td class="valueC" style="border-right: 1px solid #999999;">
        <span class="bigRed">123</span>
        </td>
        <td class="valueC">
        5
        </td>
        <td class="valueC">
        123
        </td>
        <td class="valueC">
        246
        </td>
    </tr>
    <%even = !even;%>
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
