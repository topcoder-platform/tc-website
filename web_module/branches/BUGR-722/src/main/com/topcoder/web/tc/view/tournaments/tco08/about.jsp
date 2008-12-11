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
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        
        
        <h2>2008 TopCoder Open</h2>
        
        <p><strong><em>Who will emerge as champions in the world's most elite software developer face-off?</em></strong></p>
        <%-- Blog Banner --%>
        <div align="center"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog"><img src="/i/tournament/tco08/tco08BlogSlimDark.png" alt="TCO08 Blog" /></a></div>
        <br /><br />
        
        <div align="center"><img src="/i/tournament/tco08/tco08overview.png" alt="TCO07 Winners" /></div>
        <p>The TCO returns to the action of Las Vegas for the TopCoder Open in 2008.  Las Vegas has been kind to many TopCoder members: <tc-webtag:handle coderId="309453" context="algorithm"/>, <tc-webtag:handle coderId="7548200" context="development"/>, <tc-webtag:handle coderId="10600282" context="marathon_match"/>, <tc-webtag:handle coderId="10574855" context="algorithm"/> and <tc-webtag:handle coderId="119676" context="design"/>, just to name a few.  It's also where we crowned the first-ever Studio Design and Marathon Champions.  Five new Champions will be crowned this time in Sin City.  Will you be one of them?</p>
        <p>The 2008 TopCoder Open (TCO) is a world-wide programming tournament open to all TopCoder members who are 18 and older.  There are four different competitions as part of the TCO:  <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=description">Algorithm Competition</a>, <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=description">Component Design and Development</a>, <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=description">Marathon Competition</a> and <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=description">Studio Design Competition</a>.  Becoming a TopCoder member is easy and free. Register <a target="_blank" href="/reg">here</a>.  Taking part in the 2008 TCO gives you the opportunity to showcase your programming or design skills up against some of the best in the world.  We're also dishing out $260,000 in prizes.  Have a question about the event or about being a TopCoder member?  Just email <a href="mailto:service@topcoder.com?subject=2008 TopCoder Open Questions/TopCoder Membership">service@topcoder.com</a>.</p>

        <div class="sub_content">
        
            <h3>Mark your calendars!</h3>
            <p>The TCO08 Finals will take place May 11 - 15, 2008 at the Mirage in Las Vegas, Nevada and we're giving away $260,000 in prizes.</p>
            <p>The TCO is bigger and better in 2008, as we <strong><em>increase the finalist pool by 50 percent</em></strong>! TopCoder will fly in the top 120 finalists this year to compete for more than a quarter of a million dollars in prizes. As our member community continues to grow, so does the elite competition. Spread the word, the world's best developers will be heading to Vegas in May!</p>
            
            <h3>Details</h3>
            <p>There will be four competitions making up the TCO08:</p>
            <ul>
                <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=description">Algorithm Competition</a></li>
                <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=description">Component Design and Development Competitions</a></li>
                <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=description">Marathon Competition</a></li>
                <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=description">Studio Competition</a></li>
            </ul>
            <p>Only the top 120 competitors will make the TCO, so polish your skills now to prepare for the competition. We'll have room for everyone at the Developer Forums - start making plans now for your trip to Las Vegas in May.</p>
            <p>The competition is free and you must be a member 18 years old or older, as well as meet all eligibility criteria, in order to participate.</p>
            <p>It is important for you to read the official rules and regulations for the competition in which you are going to compete for more details.</p>
        
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
