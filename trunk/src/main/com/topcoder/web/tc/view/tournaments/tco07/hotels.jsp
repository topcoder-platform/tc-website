<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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

        <jsp:include page="header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="joinus"/>
                    <jsp:param name="tabLev3" value="hotels"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

<h1><span>Hotels near the TCO07</span></h1>
<p>
<a target="_blank" href="<tc-webtag:linkTracking link='http://www.mirage.com/' refer='tco_hotels' />">The Mirage</a><br>
3400 S. Las Vegas Blvd.<br>
Las Vegas, NV 89109<br>
800-374-9000
</p>
<p>
Several other hotels are located only a short walk from The Mirage.  We have included a representative sample for your convenience: 
</p>
<p>
<a target="_blank" href="<tc-webtag:linkTracking link='http://www.imperialpalace.com/stay.php' refer='tco_hotels' />">Imperial Palace</a><br>
3535 S. Las Vegas Blvd.<br>
Las Vegas, NV 89109<br>
800-634-6441
</p>
<p>
<a target="_blank" href="<tc-webtag:linkTracking link='http://www.harrahs.com/casinos/harrahs-las-vegas/casino-misc/hotel-overview.html' refer='tco_hotels' />">Harrah's Las Vegas</a><br>
3475 S. Las Vegas Blvd.<br>
Las Vegas, NV 89109<br>
800-392-9002
</p>
<p>
<a target="_blank" href="<tc-webtag:linkTracking link='http://www.harrahs.com/casinos/caesars-palace/hotel-casino/property-home.shtml' refer='tco_hotels' />">Caesars Palace</a><br>
3570 S. Las Vegas Blvd.<br>
Las Vegas, NV 89109<br>
877-427-7243
</p>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
