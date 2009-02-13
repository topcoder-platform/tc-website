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

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="sponsors"/>
                    <jsp:param name="tabLev3" value="drw"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <div style="float: right;">
                        <h2 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h2>
                        <strong>
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drwChat20070328">SRM 344</A><br />
                        <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drwChat20070523">SRM 350</A>
                        </strong>
                        </div>
                        <div style="margin-bottom: 20px;"><a target="_blank" href="<tc-webtag:linkTracking link='http://www.drwtrading.com' refer='TCO07_DRW_PAGES' />"><img src="/i/tournament/tco07/drwlogo.png" alt="DRW" border="0" /></a></div>
                        
                        <p>
                        The DRW Trading Group is an aggressive, top-tier proprietary trading firm striving to optimize discovery and capture edge in the capital markets.
                        </p>
                        <p>
                        DRW employs over two hundred people worldwide with offices in Chicago, New York and London.
                        </p>
<p>
We have a culture of meritocracy. Employees are rewarded financially and intellectually -- measured not by tenure, but by contribution.  The structure of the organization is flat and open, with no red tape or bureaucracy.
</p>
<p>
The trading world is in the midst of a technology arms race.  Grid computing, low-latency/high throughput networks, computational intelligence: these are the weapons in our arsenal.
</p>
<p>
We are seeking Top Coder's best to engineer algorithmic trading systems. We'll give you state-of-the-art technology and funding. You'll give us innovative, high-performance code to beat Wall Street in the world's highest stakes game.
</p>
<p>
Technology drives our trading. You drive our technology.
</p>
                        <p><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drwConfirm" class="button" style="width: 70px;">Apply Now</a></p>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
