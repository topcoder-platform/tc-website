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

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="joinus"/>
    <jsp:param name="tabLev3" value="devforums"/>
    </jsp:include>


        
        
        <h2>Developer and Corporate Forums</h2>
        
        <p>Are you attending the TCO finals as a spectator or finalist? Either way, make sure to attend the Forums. This year's TCO features three TopCoder Developer Forums and three Corporate Forums with the following rewarding topics:</p>

        <div class="sub_content">
        
            <h3>Tuesday, May 13, 2008</h3>
            <h4>4:00 PM - 4:45 PM</h4>
            <p><strong>From Assembly to Architecture with Greg Eldridge, Project Manager, TopCoder, Inc.</strong><br />
            Architecture competitions are an exciting new aspect of TopCoder software development methodology.  This presentation will explore the process of creating effective architectural designs for successful assemblies.  Learn how to design specify and validate new components, iterate and develop a "walking" prototype, and plan for a project lifecycle.</p>
            
            <h3>Wednesday, May 14, 2008</h3>
            <h4>1:00 PM - 1:45 PM</h4>
            <p><strong>Crowd Sourcing, Collaboration and Innovation<br />
            Featuring:  Saul Kaplan, Executive Director, Business Innovation; Kevin Conroy, Executive VP of Products, AOL; Tim Roberts [<tc-webtag:handle coderId="119676" />], Gotham Capital; and Esther Schindler, Senior Editor, CIO Magazine, as the moderator</strong></p>
            
            <h4>2:00 PM - 2:45 PM</h4>
            <p><strong>TC Direct &amp; Cockpit and Widget Innerworkings with Denis Horgan, VP of Community Development, TopCoder, Inc. and Sean Campion, Project Manager, TopCoder, Inc.</strong><br />
            The Client Cockpit application will provide TopCoder customers the ability to directly engage the TopCoder membership to build software applications without the direct assistance of TopCoder staff. It is the first step in a new evolution of TopCoder which will bring vast new opportunities for communication, collaboration and compensation to the community.</p>
            <p>The interface consists of a framework into which various widgets with differing functionality are embedded, customized by the user according to his/her needs and interests. Through the cockpit, the customer will have to ability to create projects and manage them every step of the way, from launching competitions to making payment and taking delivery.</p>
            <p>The presentation will include an overview of the cockpit process.  Particular attention will be paid to opportunities for members to act as TopCoder "co-pilots" or even Project Managers assisting clients directly in their ability to execute projects and competitions.</p>
            <p>The Widget Innerworkings workshop will cover the widget framework innerworkings and describe all of the currently available and planned services.  Use this workshop to build your own widget, or write up the specifications for a new widget and/or service for TopCoder to build for you.  There will be opportunities for members to sign up as Project Managers or Architects for specific widgets and/or services.</p>
            
            <h4>3:00 PM - 3:45 PM</h4>
            <p><strong>Corporate Forum with Grady Bryant, Vice President of Research &amp; Development, VeriSign</strong></p>
            
            <h4>4:00 PM - 4:45 PM</h4>
            <p><strong>Quality Through Review with Sean Campion, Project Manager, TopCoder, Inc.</strong><br />
            Code reviews have long been recognized as an effective means to build quality software, but suffers from perennial staff and time shortages.  At TopCoder, our built-in review mechanism ensures reviews are conducted not only at the code development level, but throughout all stages of the SDLC.  This ubiquitous open-review process allows TopCoder to build the highest-quality components.  This discussion will walk you through the review mechanism and metrics.</p>
            
            <h3>Thursday, May 15, 2008</h3>
            <h4>9:00 AM - 9:45 AM</h4>
            <p><strong>Corporate Forum with Ron Burkhart, CFO, On Point Technology</strong></p>
            
            <h4>10:30 AM - 11:15 AM</h4>
            <p><strong>Corporate Forum with Nic Perez, Technical Director of Competitive Software Development, AOL</strong></p>
            
            <h4>1:30 PM - 2:00 PM</h4>
            <p><strong>Key Note Speaker, Jack Hughes, Founder, TopCoder, Inc.</strong></p>

        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
