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
        <jsp:param name="tabLev2" value="description"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">
                <h1><span>Studio Design Description</span></h1>
                
                <p>TopCoder Studio is thrilled to announce its first collegiate tournament for graphic and web designers! Competitors will put their design talent to the test during the 7-week Studio Design Competition (SDC) Online Round leading up to the Finals, being held at the Contemporary Resort in Walt Disney World in Orlando, Florida, USA. Eight of the most creative collegiate competitors will win a trip to Orlando where they will compete in the Championship Round for the chance to win cash prizes totaling $30,000.</p>

                
                <h2>What is TopCoder Studio?</h2>
                <p>TopCoder Studio challenges top creative minds from around the world to present their best graphic and web design concepts to clients searching for a unique user-based perspective. By tapping into the talent of creative people with multiple specialties, new approaches and innovative concepts rise to the top. During engaging competitions, Studio members have just the right mix of client guidance, TopCoder Studio support, and creative freedom to break down barriers common in traditional client-designer relationships.</p>
                
                <h2>The Competition Process</h2>
                <p>The competition process ignites creativity in both the client and the Studio members. TopCoder determines the needs of the client, presents those needs to Studio members, and administers all aspects of the competition.</p>
                <p>Contest specifications are posted on Studio and members submit their designs according to those specs. Submissions are then screened against the contest specifications by the Contest Administrator and either passed or failed. Passing submissions move into Online Review, where their submission is scored. Winners are selected based on the highest scores. Passing submissions and their scores are then presented to the client and additional prizes are given for client selection.</p>
                <p>Learn more about <a href="http://studio.topcoder.com/" alt="TopCoder Studio" target="_blank">TopCoder Studio</a></p>

                <p>When is the competition? See the <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=schedule" alt="TCCC07 Studio Schedule">schedule</a>.</p>
                <p>Read the official <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=rules" alt="TCCC07 Studio Design Rules &amp; Regulations">rules and regulations</a> for important details.</p>
                <p>The competition is free and you must be an 18 years or older collegiate member, as well as meet all eligibility criteria, in order to participate.</p>
                
                <h2>How to Register for the Studio Design Competition</h2>

                <p>Click <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=registerNow" alt="TCCC07 Studio Design Competition">here</a> to register for the TCCC07 Studio Design Competition.</p>

            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>