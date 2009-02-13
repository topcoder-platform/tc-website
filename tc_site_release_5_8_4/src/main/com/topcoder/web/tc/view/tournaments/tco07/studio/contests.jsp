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
<%-- if completed, colspan is 7.  if in progress, colspan is 5 --%>
        <td class="title" colspan="7">
        <span class="coderText">mirosuaf</span> > Completed <%-- or "In Progress" --%>
        </td>
    </tr>
    <tr>
        <td class="header">
            <A href="">Contest</A>
        </td>
        <td class="headerC">
            <A href="">Start Date</A>
        </td>
        <td class="headerC">
            <A href="">End Date</A>
        </td>
        <td class="headerC">
            <A href="">Registrants</A>
        </td>
        <td class="headerC">
            <A href="">Submissions</A>
        </td>
<%-- only show the placed and points if viewing completed --%>
        <td class="headerC">
            <A href="">Placed</A>
        </td>
        <td class="headerC">
            <A href="">Points</A>
        </td>
    </tr>
</thead>
<tbody>
    <%boolean even = false;%>
    <tr class="<%=(even ? "dark" : "light")%>">
        <td class="value">
<%-- if completed, link to results.  if in progress, link to contest details --%>
            <A href="">Contest Name</A>
        </td>
        <td class="valueC">
            <strong>02.20.2007</strong><br>16:55 EST
        </td>
        <td class="valueC">
            <strong>02.20.2007</strong><br>16:55 EST
        </td>
        <td class="valueC">
            10
        </td>
        <td class="valueC">
            10
        </td>
<%-- only show the placed and points if viewing completed --%>
        <td class="valueC">
            1
        </td>
        <td class="valueC">
            10
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
