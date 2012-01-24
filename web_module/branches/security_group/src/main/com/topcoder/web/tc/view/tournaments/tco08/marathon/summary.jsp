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
    <jsp:param name="tabLev1" value="<%=EventType.MARATHON_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="advancers"/>
    <jsp:param name="tabLev3" value="summary"/>
    </jsp:include>


        <h2>Marathon Competition Summary</h2>
        
        <div class="sub_content">
            <p><img src="/i/m/nophoto.jpg" alt="lars2520" style="width:55px; height:61px; border:0px; padding-right:2px;" hspace="6" vspace="1" align="left" class="myStatsPhoto" /><span>Thursday, May 15, 2008<br />Introduction by <tc-webtag:handle coderId="287131" darkBG="true" /></span></p>
            <p align="right"><tc-webtag:forumLink forumID="521173" message="Discuss this competition" /></p>
            <br /><br />
            
            <h3>Psyho is the new Marathon Champion!</h3>
            <br />
            <p style="float:right; width:200px; height:350px; margin-left:10px;"><img src="/i/tournament/tco08/marathon.jpg" alt="Psyho is the new Marathon Champion!" /></p>
            <p>This year, competitors had to race cars along a windy track.  The physics of the race were controlled by a few parameters which dictated the car's maximum speed, and ability to turn (some of the tests were like driving on ice).</p>
            <p>Competitors spent the first couple hours getting started and gaining a good understanding of the problem.  By the lunch break though, their solutions were well beyond simplistic.  At the lunch break <tc-webtag:handle coderId="22663763" context="long" darkBG="true" /> was in the lead, though not by much.</p>
            <p>After an intense lunch (heads down, all deep in thought) the competitors were amped to try out their new ideas.  Within an hour, <tc-webtag:handle coderId="10597114" context="long" darkBG="true" /> jumped from ninth place all the way to first, a lead he never relinquished.  While the other competitors struggled to catch up, his technique proved superior and at the end of the day it was clear who had won.</p>
            <p>His solution was the only one to make full use of the thirty seconds of CPU time, but optimizing his route in small steps, slowly converging towards ever faster times.  In the final tests, he got first place in well over half of them -- an impressive victory.</p>
    
        </div><%-- .sub_content --%>
        
</div><%-- #content --%>
<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
