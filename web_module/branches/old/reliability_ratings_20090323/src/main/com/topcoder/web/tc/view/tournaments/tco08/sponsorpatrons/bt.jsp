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
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="sponsors"/>
    <jsp:param name="tabLev3" value="bt"/>
    </jsp:include>


        
        
        <h2>BT</h2>
        
        <div style="padding-bottom:10px;">
            <a target="_blank" href="<tc-webtag:linkTracking link='http://www.bt.com/' refer='tco08_bt' />"><img alt="TCO08 Sponsored by BT" src="/i/tournament/tco08/bt_logo.png" /></a>
        </div>
        <h3>Next-gen developers for next-gen applications</h3>
        <p>BT is excited to sponsor the world's top programming talent at the 2008 TopCoder Open.  Al-Noor Ramji, CIO, BT Group says: "At BT, we are harnessing the power of our software-driven innovation ecosystem.  Partnering with the world's leading programming minds is core to that strategy."</p>
        <p>BT is one of the world's leading providers of communications solutions and services operating in 170 countries. Our vision is to help our customers thrive in a changing world and our mission is to be the leader in delivering converged network software services.  Executing on this mission, we are building one of the world's most advanced next generation communications networks, BT's 21<sup>st</sup> Century Network (21CN), shifting our focus from narrowband to IP enabled broadband.  Our network is our platform and software applications on our network will become our key value creators.</p>
        <p>We are exposing our network as a platform for developers in simple and innovative ways.  We have built a set of core communications services and have made them fit naturally into development environments that developers are familiar with, such as Java, .Net, PHP and Python.  These services empower developers to easily create new and innovative communications-enabled applications and mashups.  For more information, please visit <a target="_blank" href="<tc-webtag:linkTracking link='http://web21c.bt.com' refer='tco08_bt' />">http://web21c.bt.com</a>.</p>
        <p>If you can see the potential in tomorrow's voice and data networks, then join an exciting future at BT and play a key role in the development of compelling and useful software. There are global positions for extraordinary developers within BT, offering competitive pay and benefits.  If you are interested, please contact us at <a href="mailto:bt.design.applications@bt.com">bt.design.applications@bt.com</a>.</p>
        <p><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=btConfirm" class="button" style="width:70px;">Apply Now</a></p>

    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
