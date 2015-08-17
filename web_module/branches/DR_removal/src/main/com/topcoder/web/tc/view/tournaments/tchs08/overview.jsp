<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>2008 TopCoder High School Tournament</h2>
        </div><%-- #title --%>
        
        <div id="content">
            <p>The 2<sup>nd</sup> annual installment of the TopCoder High School Tournament is here! In keeping with TopCoder's competitive model, the tournament will bring together some of the most talented high school students in quest of bragging rights, scholarships and prizes worth at least $50,000. We are excited to be returning to <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=purdue">Purdue University</a> to watch the best of the best battle it out once again.</p>
    
            <h3>Important Dates:</h3>
            <p>Registration opens: December 17, 2007<br />
            Registration closes: January 10, 2008<br />
            Online Elimination Rounds: January 12, 19 and 26, 2008</p>
            
            <h3>Who can compete?</h3>
            <p>Any registered TopCoder High School member between the ages of 13 and 20 (inclusive) can compete, as long as they are pursuing a secondary education during the season. Individuals must also participate in at least three (3) rated TCHS SRMs between July 12, 2007 and January 12, 2008.</p>
            
            <h3>TCHS Onsite Championship Round</h3>
            <p>March 15, 2008 at the <a target="_blank" href="<tc-webtag:linkTracking link='http://www.cs.purdue.edu/about_us/lawson/' refer='tchs08_overview' />">Lawson Building</a> on the campus of Purdue University in West Lafayette, IN, USA</p>
            
            <h3>TCHS Prize Purse:</h3>
            <p>A prize purse of at least $50,000 in scholarships and prizes will be awarded.</p>
            <p>See the <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=rules">official rules and regulations</a> for full details.</p>
            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>