<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
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
        <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="advancers"/>
        <jsp:param name="tabLev3" value="summary"/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>abedavera is the new Studio Champion!</span></h1>
                <p><img src="/i/m/jwlms_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                <A HREF="http://studio.topcoder.com/forums?module=Thread&threadID=1042&start=0&mc=4#4139">Discuss this competition</A><br />Friday, November 2, 2007<br />Introduction by <tc-webtag:handle coderId="22656806" darkBG="true" /></p>
                <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/studio.jpg"></p>
                <br /><br />
                
                <p>The Studio finalists were given the task on Tuesday night during the welcome reception of designing a promotional poster and postcard for college campuses. There was a mix of relief and anxiety among the group as they discussed their comfort level with print design with each other. This was brought to further evidence as some finalists spent part of Wednesday shopping and touring around Disney World while others focused on how they would approach the challenge the next morning.</p>
                <p>Thursday began with an influx of clarification questions in the forums and then it was time to start fleshing out the concepts. As expected, the designs began taking shape within the first hour. Spectators gathered around the kiosk and made predictions about who would win based on previous performances in Studio. However, as the hours slipped by there were quite a few surprises. It appeared that each designer was willing to take some new risks and really push their limits.</p>
                <p>There were a lot of requirements to meet for this challenge and many finalists were checking their work line-by-line against the Spec Doc. By 3:00 pm, many of the concepts were near finalization and the opinions from the spectators were reaching new heights. Everyone had their favorite, but the overwhelming comment was how incredibly different each design was from the others.</p>
                <p>Review of the designs took place on Friday and the scores were compiled and used to determine the winner. One thing was certain - the final designs have set the bar for future onsite championships!</p>
                <p>Congratulations to <tc-webtag:handle coderId="22689218" darkBG="true" />, who takes home the grand prize of $15,000.</p>
                <p>For the overall standings, check out the <a href="http://studio.topcoder.com/?module=ViewContestResults&ct=2143">winner page</a> on Studio.</p>
            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>