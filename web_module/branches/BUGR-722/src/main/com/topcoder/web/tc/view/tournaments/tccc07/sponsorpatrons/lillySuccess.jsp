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

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="sponsors"/>
        <jsp:param name="tabLev3" value="lilly"/>
        </jsp:include>
        
            <div id="pageBody">
                <div style="padding-bottom:10px;">
                    <a target="_blank" alt="TCCC07 Sponsored by Eli Lilly" href="<tc-webtag:linkTracking link='http://www.elililly.com/' refer='TCCC07_lillySuccess' />"<img alt="TCCC07 Sponsored by Eli Lilly" src="/i/tournament/tccc07/lilly_logo.png" /></a>
                </div>
                <p>Your application has been received.</p>
                <p>You will be contacted by a TopCoder Recruiter if you meet Eli Lilly's requirements. Thank you.</p>
                <p style="height:300px;">&nbsp;</p>
            
            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>