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
    <jsp:param name="tabLev2" value="eventpatrons"/>
    <jsp:param name="tabLev3" value="nsa"/>
    </jsp:include>


        
        
        <h2>NSA</h2>
        
        <div style="padding-bottom:10px;">
            <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nsa.gov/' refer='tco08_nsa' />"><img alt="TCO08 Event Patron - NSA" src="/i/tournament/tco08/nsa_logo.png" /></a>
        </div>
        <h3>Where Intelligence Goes to Work</h3>
        <p>Everyday, the National Security Agency is faced with new threats to our nation's security. Our adversaries do their best to keep their plans a secret. We work to uncover those secrets, and keep our own secrets safe. That is why it is vital for NSA to employ the most intelligent people in the country.</p>
        <p>At the nation's top cryptologic organization, you can work with the best and the brightest, using your intelligence to solve some of the nation's most difficult challenges. Your solutions can play a major role in shaping the course of world history.</p>
        <p>NSA has exciting career opportunities available in Computer/Electrical Engineering, Computer Science, Mathematics, Foreign Language, Intelligence Analysis, Cryptanalysis, and Signals Analysis. You'll enjoy an incredible benefits package, competitive pay, and the satisfaction of making the world a safer place.</p>
        <p>U.S. citizenship is required. NSA is an Equal Opportunity Employer.<br />For more information about the career opportunities available at NSA:</p>
        <p><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=nsaConfirm" class="button" style="width:70px;">Apply Now</a></p>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
