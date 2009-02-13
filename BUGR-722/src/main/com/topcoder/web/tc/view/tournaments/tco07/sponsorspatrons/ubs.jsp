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
                    <jsp:param name="tabLev3" value="ubs"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <div style="margin-bottom: 20px;"><a target="_blank" href="<tc-webtag:linkTracking link='http://www.ubs.com' refer='TCO07_UBS_PAGES' />"><img src="/i/tournament/tco07/ubs_logo.png" alt="UBS" border="0" /></a></div>
                        <p>
                        UBS is pleased to once again sponsor the TopCoder Open. UBS, one of the largest financial services firms in the world, is a leader in equities, corporate finance, M&A advisory and financing, financial structuring, fixed income issuance and trading, foreign exchange, derivatives and risk management.
                        </p>
                        <p>
                        The global financial markets are increasingly electronic and trading in these markets presents a unique combination of technical and trading challenges. We are looking for developers to join our team that can work on advanced automated trading algorithms, build the underlying infrastructure to trade with milliseconds of latency and integrate access to a wide range of global products.
                        </p>
                        <p>
                        At UBS, you'll have access to the resources and expertise of a global firm while enjoying the flexibility and autonomy of a start-up. The technology we build is responsible for trading over 400 million shares daily in the US alone, managing trillions of dollars in assets, and trading across nearly every product and region around the globe.
                        </p>
                        <p>
                        Become part of our exciting future at UBS. There are positions for extraordinary coders in our offices all over the world. 
                        </p>
                        <p>
                       You and Us. UBS.
                        </p>
                        <p><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=ubsConfirm" class="button" style="width: 70px;">Apply Now</a></p>                       
                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
