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
                    <jsp:param name="tabLev2" value="onsiteevents"/>
                    <jsp:param name="tabLev3" value="movies"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Movies</span></h1>

                        <h2>Webcast</h2>


                        <div align="center">
                            <div style="width: 600px;">
                                <div style="float: left;">
                                    <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast1&title=Webcast%20Part%201"><img src="/i/tournament/tco07/webcastThumb1.png" alt="Webcast Part 1" /></a>
                                    <br /><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast1&title=Webcast%20Part%201">Part 1</A>
                                    <br /><a href="<tc-webtag:linkTracking link='/movies/tournament/tco07/webcast1_lo.wmv' refer='webcast page' />">Low-bandwidth version</A> (19.1 MB)
                                    <br />(01:03:55)
                                </div>
                                <div style="float: right;">
                                    <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast3&title=Webcast%20Part%203"><img src="/i/tournament/tco07/webcastThumb3.png" alt="Webcast Part 3" /></a>
                                    <br /><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast3&title=Webcast%20Part%203">Part 3</A>
                                    <br /><a href="<tc-webtag:linkTracking link='/movies/tournament/tco07/webcast3_lo.wmv' refer='webcast page' />">Low-bandwidth version</A> (8.59 MB)
                                    <br />(00:28:46)
                                </div>
                                <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast2&title=Webcast Part 2"><img src="/i/tournament/tco07/webcastThumb2.png" alt="Webcast Part 2" /></a>
                                <br /><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=webcast2&title=Webcast%20Part%202">Part 2</A>
                                <br /><a href="<tc-webtag:linkTracking link='/movies/tournament/tco07/webcast2_lo.wmv' refer='webcast page' />">Low-bandwidth version</A> (20.3 MB)
                                <br />(01:07:50)
                            </div>
                        </div>


                        <br /><br />

                        <h2>Miscellaneous</h2>
                        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=trailer&title=Trailer">Tournament trailer</A>
                        <br /><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=aolCTO&title=Interview%20with%20AOL%20CTO,%20Balan%20Nair">Interview with AOL CTO, Balan Nair</A>
                        <br /><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movieStream&clip=montage&title=Handheld%20camera%20montage">Handheld camera montage</A>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
