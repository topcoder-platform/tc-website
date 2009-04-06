<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
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
    <jsp:param name="tabLev2" value="description"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Studio Design Competition</h2>
        
        <div class="sub_content">
            <p>TopCoder Studio is thrilled to announce the 2008 TopCoder Open! Competitors will put their design talent to the test during the 8-week Studio Design Competition (SDC) Online Round leading up to the Finals, being held at the Mirage Hotel in Las Vegas, Nevada, USA. Twelve of the most creative competitors will win a trip to Las Vegas where they will compete in the Championship Round for the chance to win cash prizes totaling $45,000.</p>
            
            <h3>What is TopCoder Studio?</h3>
            <p>TopCoder Studio challenges top creative minds from around the world to present their best design concepts to clients searching for a unique user-based perspective. By tapping into the talent of creative people with multiple specialties, new approaches and innovative concepts rise to the top. During engaging competitions, Studio members have just the right mix of client guidance, TopCoder Studio support, and creative freedom to break down barriers common in traditional client-designer relationships.</p>
            
            <h3>The Competition Process</h3>
            <p>The competition process ignites creativity in both the client and the Studio members. TopCoder determines the needs of the client, presents those needs to Studio members, and administers all aspects of the competition.</p>
            <p>Contest specifications are posted on Studio and members submit their designs according to those specs. Submissions are then screened against the contest specifications by the Contest Administrator and either passed or failed. Winners are selected by the clients.</p>
            <p>Learn more about <a target="_blank" href="http://studio.topcoder.com/">TopCoder Studio</a></p>
            <p>When is the competition? See the <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=schedule">schedule</a>.</p>
            <p>It is important for you to read the official <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=rules">rules and regulations</a> for important details.</p>
            <p>The competition is free and you must be a member who is 18 years or older, as well as meet all eligibility criteria, in order to participate.</p>
            
    
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
