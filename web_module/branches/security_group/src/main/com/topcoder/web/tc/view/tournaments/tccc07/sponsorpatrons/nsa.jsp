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
        <jsp:param name="tabLev2" value="eventpatrons"/>
        <jsp:param name="tabLev3" value="nsa"/>
        </jsp:include>
        
            <div id="pageBody">
                <div style="padding-bottom:10px;">
                    <a target="_blank" alt="TCCC07 Event Patron - NSA" href="<tc-webtag:linkTracking link='http://www.nsa.gov/' refer='TCCC07_nsa' />"><img alt="TCCC07 Event Patron - NSA" src="/i/tournament/tccc07/nsa_logo.png" /></a>
                </div>
                <h2>Where Intelligence Goes to Work</h2>
                <p>Everyday, the National Security Agency is faced with new threats to our nation's security. Our adversaries do their best to keep their plans a secret. We work to uncover those secrets, and keep our own secrets safe. That is why it is vital for NSA to employ the most intelligent people in the country.</p>
                <p>At the nation's top cryptologic organization, you can work with the best and the brightest, using your intelligence to solve some of the nation's most difficult challenges. Your solutions can play a major role in shaping the course of world history.</p>
                <p>NSA has exciting career opportunities available in Computer/Electrical Engineering, Computer Science, Mathematics, Foreign Language, Intelligence Analysis, Cryptanalysis, and Signals Analysis. You'll enjoy an incredible benefits package, competitive pay, and the satisfaction of making the world a safer place.</p>
                <p>U.S. citizenship is required. NSA is an Equal Opportunity Employer.<br />For more information about the career opportunities available at NSA:</p>
                <p><a href="/tc?module=JobHit&jid=409&jt=1" class="button" style="width:70px;">Apply Now</a></p>
                <br /><br />
            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>