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

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="details"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBody">

                <h1><span>2007 TopCoder Collegiate Challenge</span></h1>

                <p>We're going to Disney World &mdash; and taking some of you lucky competitors with us!</p>
                <p>The 2007 TopCoder Collegiate Challenge is back and it's sure to be better than ever!  Last year, <tc-webtag:handle coderId="10574855" context="algorithm"/>, <tc-webtag:handle coderId="9998760" context="development"/>, and <tc-webtag:handle coderId="293874" context="design"/> left San Diego with the grand prizes.  This year, we're giving five students the chance to be TopCoder Champions!</p>

                <p>There are four competitions that you can chose from:  Algorithm Competition, Component Design and Development Competition, Marathon Match Competition and Studio Design Competition.</p>
                <p>If you want a chance to visit Walt Disney World and  win part of the $260,000 prize purse, here's what to do:</p>
                    <ol>
                        <li>Become a TopCoder member.  It's free!  You need to be one to participate. <a href="/reg" alt="TopCoder Registration">Join now</a>.</li>
                        <li>Make sure you're eligible.  All registered TopCoder collegiate members over the age of 18 may compete.  See complete rules for full details.</li>
                        <li>Pick your competition and read the rules:</li>

                            <ul>
                                <li><a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=description" alt="2007 TCCC07 Algorithm Competition">Algorithm Competition</a></li>
                                <li><a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=description" alt="2007 TCCC07 Component Design &amp; Development Competition">Component Design &amp; Development Competition</a></li>
                                <li><a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=description" alt="2007 TCCC07 Marathon Match Competition">Marathon Match Competition</a></li>
                                <li><a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=description" alt="2007 TCCC07 Studio Design Competition">Studio Design Competition</a></li>
                            </ul>

                        <li>Have fun and best of luck!</li>
                <p>This tournament is brought to you by TopCoder, Inc. (<a href="/" alt="TopCoder">http://www.topcoder.com/</a>) 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT 06033.</p>
                <p style="height:250px;">&nbsp;</p>
                
            </div>
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>
</body>
</html>
