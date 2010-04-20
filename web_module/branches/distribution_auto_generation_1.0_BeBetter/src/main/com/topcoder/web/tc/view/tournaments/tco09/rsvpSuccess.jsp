<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>2009 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/tournament/tco09/rsvp/favicon.ico"/>
    <jsp:include page="../../script.jsp" />

<style type="text/css">
html{ 
margin:0px;
padding:0px;
font-family: Arial, Verdana, Helvetica, sans-serif;
}

body{ 
font-family: Arial, Verdana, Helvetica, sans-serif;
line-height: normal;
font-size: 12px;
color: #004A69;
background: #004361 url(i/tournament/tco09/rsvp/bg.png) repeat-x top;
margin:0px;
padding:0px;
}

img{
border: none;
display: block;
}

h1{
font-style: italic;
font-size: 125%;
}

p{
padding: 0px;
margin: 0px 0px 10px 0px;
}

td, th{ 
line-height: normal;
font-size: 12px;
}

#contentOut{
width: 700px;
margin: 0;
}

#contentIn{
background: transparent url(i/tournament/tco09/rsvp/rsvpBG.jpg) top center no-repeat;
padding: 40px 10px;
}

#contentBottom{
 font-size: 1px;
 height: 10px;
 margin-bottom: 20px;
 background: transparent url(i/tournament/tco09/rsvp/rsvpBGBottom.png) bottom center no-repeat;
}

a:link, a:visited {
    text-decoration: none;
    color: #ac1414;
}

a:hover, a:active {
    text-decoration: underline;
    color: #FFF;
}
</style>

</head>
<body>


<div align="center" style="background: transparent;">
    <div id="contentOut">
        <div id="contentIn">

            <div align="center" style="margin: 20px;">
                <a target="_blank" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco09&amp;d3=overview&amp;d4=overview"><img src="i/tournament/tco09/rsvp/rsvpBanner.png" alt="2009 TopCoder Open" /></a>
            </div>
 
            <p style="margin: 40px 0px 60px 0px;">
            <c:choose>
                <c:when test="${attending}">
                    <strong>Thank you for your response. We look forward to seeing you in Las Vegas.</strong>
                </c:when>
                <c:otherwise>
                    <strong>Thank you for your response.  We're sorry we won't see you in Las Vegas in June.  We look forward to seeing you at a future TopCoder event.</strong>
                </c:otherwise>
            </c:choose>
            </p>
    
        </div>

        <div id="contentBottom">&nbsp;</div>

    </div>
</div>


</body>

</html>
