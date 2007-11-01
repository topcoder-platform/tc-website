<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
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

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="onsiteevents"/>
        <jsp:param name="tabLev3" value="movies"/>
        </jsp:include>

            <div id="pageBody" style="padding-bottom: 400px;">

                <div align="center" style="margin-bottom: 20px;">
                    <a href="/tcchannel"><img src="/i/tournament/tccc07/tcchannel_wide.png" alt="TC Channel" /></a>
                </div>

                <p>
                    <strong>Movies</strong>
                </p>
                <p>
                    <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=movieStream&clip=ep06_trailer&title=TC%20Channel%20is%20Going%20to%20Disney%20World">TC Channel is Going to Disney World: Preview</A>
                </p>

                <div align="center">
                <table cellpadding="5" cellspacing="0">
                <tbody>
                    <tr>
                        <td align="center" valign="top">
                            <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tccc07&d3=movieStream&clip=ep06_part1&title=TC%20Channel%20at%20the%20TCCC07%20Part%201' refer='tccc07 site' />"><img src="/i/tournament/tccc07/tcchannelThumb1.png" alt="TC Channel Part 1" /></a>
                            <br /><A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tccc07&d3=movieStream&clip=ep06_part1&title=TC%20Channel%20at%20the%20TCCC07%20Part%201' refer='tccc07 site' />">TC Channel at the TCCC07 Part 1</A>
                            <%--<br /><a href="/movies/tcchannel/ep06_part1.mov">Low-bandwidth version</A> (19.1 MB)--%>
                            <br />(07:03)
                        </td>
                        <td align="center" valign="top">
                            <img src="/i/tournament/tccc07/tcchannelThumb2Soon.png" alt="TC Channel Part 2" />
                            <br />COMING SOON
                        </td>
                        <td align="center" valign="top">
                            <img src="/i/tournament/tccc07/tcchannelThumb3Soon.png" alt="TC Channel Part 3" />
                            <br />COMING SOON
                        </td>
                    </tr>
                </tbody>
                </table>
                </div>    

            </div>
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>
</body>
</html>
