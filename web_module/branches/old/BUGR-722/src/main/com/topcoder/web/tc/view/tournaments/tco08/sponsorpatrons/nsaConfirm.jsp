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
        <p>By clicking "Submit" below you will be releasing your TopCoder contact and statistical information to NSA and you will be giving NSA permission to contact you about their current job opportunities.</p>
        <p><a href="/tc?module=JobHit&amp;jid=430&amp;jt=1" class="button" style="width:70px;">Submit</a></p>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
