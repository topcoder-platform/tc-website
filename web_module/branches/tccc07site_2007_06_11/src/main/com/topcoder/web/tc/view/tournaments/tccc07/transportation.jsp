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
        <jsp:param name="tabLev2" value="joinus"/>
        <jsp:param name="tabLev3" value="transportation"/>
        </jsp:include>

            <div id="pageBodyOutside">
            <div id="pageBody">
                <div id="h1Border">&nbsp;</div>
                <h1><span>How to get to the TCCC</span></h1>
                <div id="h1Border">&nbsp;</div>
                <p><a target="_blank" alt="Disney's Contemporary Resort" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/resorts/resortLanding?id=contemporaryResortLandingPage' refer='TCCC07_transportation' />">Disney's Contemporary Resort</a><br/ >
                Telephone: (407) 824-1000<br />
                Fax: (407) 824-3539<br />
                Reservations: (407) WDW-MAGIC (939-6244)</p>
                
                <h2>Transportation FAQs:</h2>
                <p><a target="_blank" alt="Transportation FAQs" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/common/helpFAQ?id=HelpFAQTransportationPage#q3' refer='TCCC07_transportation' />">http://disneyworld.disney.go.com/wdw/common/helpFAQ?id=HelpFAQTransportationPage#q3</a>.</p>
                <p>For driving directions from other areas:  <a target="_blank" alt="MapQuest website" href="<tc-webtag:linkTracking link='http://www.mapquest.com/' refer='TCCC07_transportation' />">www.mapquest.com</a></p>
                
                <h2>To fly into Orlando:</h2>
                <p>The Orlando International Airport is the best place to fly into.   See here for more details:  <a target="_blank" alt="Orlando International Airport" href="<tc-webtag:linkTracking link='http://www.orlandoairports.net/main.htm' refer='TCCC07_transportation' />">http://www.orlandoairports.net/main.htm</a></p>
                
                <h2>If you'd like to take a bus to Orlando:</h2>
                <p>Go to the <a target="_blank" alt="Greyhound Bus website" href="<tc-webtag:linkTracking link='http://www.greyhound.com/' refer='TCCC07_transportation' />">Greyhound</a> web site to get to Orlando, FL.</p>
            </div>
            </div>
            </div>
        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
