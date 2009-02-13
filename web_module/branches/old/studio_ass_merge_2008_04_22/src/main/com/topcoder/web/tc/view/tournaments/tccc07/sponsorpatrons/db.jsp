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
        <jsp:param name="tabLev3" value="db"/>
        </jsp:include>
        
            <div id="pageBody">
                <div style="float: right;">
                    <h2 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h2>
                    <strong>
                        <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=dbChat20070926">SRM 367</A><br />
                        <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=dbChat20071106">SRM 374</A><br />
                    </strong>
                </div>
                <div style="padding-bottom:10px;">
                    <a target="_blank" alt="TCCC07 Sponsored by Deutsche Bank" href="<tc-webtag:linkTracking link='http://www.db.com/' refer='TCCC07_db' />"><img alt="TCCC07 Sponsored by Deutsche Bank" src="/i/tournament/tccc07/db_logo.png" /></a>
                </div>
                <p>Deutsche Bank, a leading global investment bank with a strong and profitable private client franchise, is pleased to sponsor the 2007 TopCoder Collegiate Challenge.</p>
                <p>Deutsche Bank is one of the world's biggest providers of financial solutions for demanding clients, creating exceptional value for our shareholders and people. Are you ready to help deliver superior solutions and to build a service oriented enterprise that is capable of shaping the future? Are you skilled in any of the following technologies: JAVA, J2EE, .NET, C++, Oracle, Sybase, and SQL Server? If so, come and join us.</p>
                <p>The technology and operations units of Deutsche Bank provide the vital infrastructure, applications and operations that meet and respond to the environment of the revenue generating businesses of Deutsche Bank. We are a dynamic network of some 14,000 individuals located in over 70 countries.</p>
                <p>Deutsche Bank is looking for talented and enthusiastic people with different backgrounds and a strong will to play in a successful team of passionate developers. We employ technical staff globally and demand is especially strong in Russia, Europe and the US.</p>
                
                <p>Become part of the Deutsche Bank success story.</p>
                
                <p><a href="/tc?module=JobHit&jid=412&jt=1" class="button" style="width:70px;">Apply Now</a></p>
                <br /><br />
            </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>