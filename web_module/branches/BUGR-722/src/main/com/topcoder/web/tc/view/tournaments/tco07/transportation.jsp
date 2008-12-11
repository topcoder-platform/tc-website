<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
                    <jsp:param name="tabLev3" value="transportation"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>How to get to the TCO07</span></h1>
<p>
<a target="_blank" href="<tc-webtag:linkTracking link='http://www.mirage.com/' refer='tco_transportation' />">Mirage</a><br>
3400 S. Las Vegas Blvd.<br>
Las Vegas, NV 89109<br>
</p>
<p>
<strong>Driving to Vegas:</strong><br>
The Mirage is located on the fabulous Las Vegas Strip.
</p>
<p>
From Los Angeles:<br>
Los Angeles to Las Vegas is approximately 270 miles (430 km). Leaving Los Angeles, take I-15 North into Nevada. Once in Las Vegas, exit on East Flamingo Road if your destination is the Strip.  
</p>
<p>
From Phoenix:<br>
Phoenix to Las Vegas is about 290 miles (465 km). Take U.S. 93 North out of Phoenix, and follow it right into Las Vegas.
</p>
<p>
From San Francisco:<br>
San Francisco to Las Vegas is about 580 miles (930 km). Take I-80 East to Reno, Nevada, then follow U.S. 95 South to Las Vegas.
</p>
<p>
For driving directions from other areas:  <a target="_blank" href="<tc-webtag:linkTracking link='http://www.mapquest.com/' refer='tco_transportation' />">www.mapquest.com</a>
</p>
<p>
<strong>Flying to Vegas:</strong>
The McCarran International Airport is located 8 minutes from the Mirage.  It offers a variety of airlines and ground transportation to the Strip.  See here for more details:  <a target="_blank" href="<tc-webtag:linkTracking link='http://www.mccarran.com/' refer='tco_transportation' />">http://www.mccarran.com/</a>
</p>
<p>
<strong>Bussing to Vegas:</strong>
Go to the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.greyhound.com/' refer='tco_transportation' />">Greyhound web site</a> to get to Las Vegas, NV.
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
