<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.STUDIO_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="advancers"/>
    <jsp:param name="tabLev3" value="summary"/>
    </jsp:include>


        <h2>Studio Design Competition Summary</h2>
        
        <div class="sub_content">
            <p><img src="/i/m/jwlms_big.jpg" alt="jwlms" style="width:55px; height:61px; border:0px; padding-right:2px;" hspace="6" vspace="1" align="left" class="myStatsPhoto" /><span>Thursday, May 15, 2008<br />Introduction by <tc-webtag:handle coderId="22656806" darkBG="true" /></span></p>
            <p align="right"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=ThreadList&amp;forumID=197&amp;mc=78">Discuss this competition</a></p>
            <br /><br />
            
            <h3>oninkxronda  is the new Studio Champion!</h3>
            <br />
            <p style="float:right; width:200px; height:350px; margin-left:10px;"><img src="/i/tournament/tco08/studio.jpg" alt="oninkxronda  is the new Studio Champion!" /></p>
            <p>The last two rounds of Studio were amazing. The competitors were given the challenge for <a target="_blank" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2236">Round Two</a> just before they started and everyone was quickly making notes, highlighting important areas of the Spec and just generally preparing for the rapid 2-hour round. The finalists were tasked with designing a splash screen for Lending Tree. Only 15 minutes into the round, concepts were flying onto the screens. We had some account problems with istockphoto, so we made a quick decision to allow the competitors to submit either comp images or downloaded artwork. This round was definitely more hectic for both the finalists and the admins. After the round ended, everyone took a quick break and then we had a brief overview before Round Three.</p>
            <p><a target="_blank" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2235">Round Three</a> was our sponsor raffle project for Lilly. The finalists had some time before competition day to speak with Lilly about their company and the goals for this design. About half-way through the round, you could see a swarm of yellow shirts (the Lilly folks) gathered around the kiosks chatting about the stock art choices and the branding treatments. It was very rewarding to see them so excited about the results.</p>
            <p>I had to smile when I saw some of the guys were chatting with each other in the finalist forums just before the round ended. They planned to go play poker, and I hope luck was with them. The submissions are up on the Studio site for all three rounds, <a target="_blank" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewPastContests">so be sure to check them out</a>!</p>
            <p>It's been a very exciting tournament for Studio and I can't wait for next year.</p>
            
    
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
