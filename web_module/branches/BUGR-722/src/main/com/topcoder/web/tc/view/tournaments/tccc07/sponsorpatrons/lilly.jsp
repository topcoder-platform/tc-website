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
        <jsp:param name="tabLev2" value="sponsors"/>
        <jsp:param name="tabLev3" value="lilly"/>
        </jsp:include>
        
            <div id="pageBody">
                <div style="float: right;">
                    <h2 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h2>
                    <strong>
                        <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lillyChat20070912">SRM 365</A><br />
                    </strong>
                </div>
                <div style="padding-bottom:10px;">
                    <a target="_blank" alt="TCCC07 Sponsored by Eli Lilly" href="<tc-webtag:linkTracking link='http://www.elililly.com/' refer='TCCC07_lilly' />"><img alt="TCCC07 Sponsored by Eli Lilly" src="/i/tournament/tccc07/lilly_logo.png" /></a>
                </div>
                <p>Eli Lilly is proud to sponsor the world's top programming talent at the 2007 TopCoder Collegiate Challenge. This presents a tremendous platform for you to pit your development skills against the strongest field the world has to offer. Very best of Luck to you all - and Enjoy!</p>
                <p>When you want to take up the challenge of a full-time position of employment, the competition does not have to stop. In our case the challenge is to design and build the applications and systems to develop a growing portfolio of best-in-class and first-in-class pharmaceutical products that help people live longer, healthier and more active lives.</p>
                <p>We are committed to providing answers that matter - through medicines and information - for some of the world's most urgent medical needs including, Cancer, Diabetes, Sepsis, Neuroscience, Growth Disorders, Osteoporosis and Erectile Dysfunction.</p>
                <p>If you have the technical ability, passion and drive to make a difference to people's lives, we'd love to hear from you.</p>
                <p>Eli Lilly is based in Indianapolis, IN, with offices in most countries worldwide, our research and development IT centres are located in Indianapolis (US), UK, Singapore, Spain and the Czech Republic.</p>
                <p>Lilly, Answers that Matter</p>
                <div align="center">
                    <p style="float:left; width:90px; padding:10px;"><a href="/tc?module=JobHit&jid=406&jt=1" class="button" style="width:90px;">Apply Now<br />for US Jobs</a></p>
                    <p style="float:left; width:90px; padding:10px;"><a href="/tc?module=JobHit&jid=407&jt=1" class="button" style="width:90px;">Apply Now<br />for EU Jobs</a></p>
                    <p style="float:left; width:90px; padding:10px;"><a href="/tc?module=JobHit&jid=408&jt=1" class="button" style="width:90px;">Apply Now<br />for Pacific Jobs</a></p>
                </div>
                <br /><br />
            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>