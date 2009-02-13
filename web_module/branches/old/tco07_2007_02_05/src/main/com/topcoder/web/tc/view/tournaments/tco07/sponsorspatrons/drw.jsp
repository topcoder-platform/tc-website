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
                        <div style="margin-bottom: 20px;"><a href="<tc-webtag:linkTracking link="http://www.drwtrading.com/"/>" target="_blank" refer="drw"/><img src="/i/tournament/tco07/drwlogo.png" alt="DRW" border="0" /></a></div>
                        
                        <h2>Think you're the best?</h2> 
                        <p>
                        Prove your coding skills in the world's biggest, most lucrative competition: the global financial markets.
                        </p>
                        <p>
                        DRW is seeking top-tier coders to engineer algorithmic black-box trading systems. We'll give you state-of-the-art technology and funding. You'll give us high-performance, computationally intensive code to beat Wall Street in the world's highest stakes game.
                        </p>
                        <p>
                        <b>Show us you have what it takes.</b>
                        </p>
                        <p><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drwConfirm" class="button" style="width: 70px;">Apply Now</a></p>
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
