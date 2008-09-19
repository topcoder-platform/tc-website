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
        <jsp:param name="tabLev2" value="joinus"/>
        <jsp:param name="tabLev3" value="hotels"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Hotels near the TCCC</span></h1>
                <p><a target="_blank" alt="Disney's Contemporary Resort" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/resorts/resortLanding?id=contemporaryResortLandingPage' refer='TCCC07_hotels' />">Disney's Contemporary Resort</a><br/ >

                Telephone: (407) 824-1000<br />
                Fax: (407) 824-3539<br />
                Reservations: (407) WDW-MAGIC (939-6244)</p>
                
                <p>Several other hotels are located in Walt Disney World.  Most are connected by the Walt Disney World buses, boats, or monorails.  We have included a representative sample for your convenience:<br /><br />
                    <a target="_blank" alt="Disney's All- Star Music Resort" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/resorts/resortLanding?id=AllStarMusicResortLandingPage' refer='TCCC07_hotels' />">Disney's All- Star Music Resort</a><br />
                    Telephone: (407) 939-6000<br />

                    Fax: (407) 939-7222<br />
                    Reservations: (407) WDW-MAGIC (939-6244)<br /><br />
                    
                    <a target="_blank" alt="Disney's All-Star Sports Resort" href="<tc-webtag:linkTracking link='http://disneyworld.disney.go.com/wdw/resorts/resortLanding?id=AllStarSportsResortLandingPage' refer='TCCC07_hotels' />">Disney's All-Star Sports Resort</a><br />
                    Telephone: (407) 939-5000<br />
                    Fax: (407) 939-7333<br />
                    Reservations: (407) WDW-MAGIC (939-6244)<br /><br />
                </p>
                <p style="height:300px;">&nbsp;</p>
            </div>
            </div>
        <jsp:include page="footer.jsp" />
    </div>
</div>

</body>

</html>
