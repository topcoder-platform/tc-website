<%@ page import="com.topcoder.web.reg.Constants"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>

<style type="text/css">
html, body {
font-family: Arial, Helvetica, Verdana, sans-serif;
line-height: normal;
font-size: 12px;
color: #333333;
background-color: #FFFFFF;
padding: 0px;
margin: 0px;
}
img { border: none }
A:link { color: #0000FF; text-decoration: underline; }
A:visited { color: #0000FF; text-decoration: underline; }
A:hover, A:active { color: #F00; }
ul{ margin-left: 10px; padding-left: 10px;}
li{ padding-top: 2px; padding-bottom: 2px; }
.noSpace{ margin: 0px; padding: 0px; }
p{ margin: 0px 0px 8px 0px; }
H1, H2, H3{ font-family: Arial, Helvetica, Verdana, sans-serif; font-size: 200%; text-decoration: none; padding:0px; margin: 0px 0px 10px 0px; }
H2 { font-size: 150%; }
H3 { font-size: 125%; }
</style>

    <script language="JavaScript" type="text/javascript"><!--
    function get(link) { 
        opener.location.href = link;
    }
    function getAndClose(link) { 
        opener.location.href = link;
        window.close();
    }
    //-->
    </script>
</head>

<body>
<div align="center">
   <div style="position: relative; padding: 0px 10px 0px 10px; width: 600px; text-align: left;">

    <div align="left" style="border-bottom: 1px solid #999999; margin: 15px 0px 6px 0px; padding-bottom: 6px;">
        <div style="float: right; margin-top: 6px;"><img src="/i/about/adifferentkind.png" alt="A different kind of software company." /></div>
        <A href="<tc-webtag:linkTracking link='/' refer='whatistopcoder' />"><img src="/i/home/topcoder.png" alt="TopCoder" /></A>
    </div>

<div align="center" style="margin: 15px 0px 20px 0px;">
<img src="/i/about/quickmessage.png" alt="quickmessage" />
</div>

    <p>
    <strong>Welcome to TopCoder - a different kind of software company:</strong>
    </p>
    <ul style="list-style-type: square">
    <li>We believe intelligence and talent are universal, not limited to one country or one company.</li>
    <li>We believe the best and smartest ideas should prevail, regardless of where they come from.</li>
    <li>We believe the only way to determine who's got the better idea is through competition.</li>
    </ul>
    <p>
    <strong>Here's what we've done:</strong>
    </p>
    <p>
    We've built a development community with more than 100,000 members from across the globe. They are developers and contractors, students and hobbyists, brought together by a love for coding, a passion for learning, and a desire to test and improve their skills.
    </p>
    <p>
    We developed a rigorous and disciplined software development process that leverages our unique competition model. Based on a growing catalog of reusable software components - built by our members and tested in competition - this process generates high-quality applications quickly, efficiently, and for less money than other companies.
    </p>
    <p>
    <strong>By harnessing the power of competition, TopCoder has revolutionized the way software is built.</strong>
    </p>
    <p align="center" style="margin-top: 20px;">
    <strong><A href="<tc-webtag:linkTracking link='http://software.topcoder.com/applications/index.jsp' refer='whatistopcoder' />">How does TopCoder build software?</A></strong>
    </p>
    <p align="center">
    <strong><A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=about&d2=contactus' refer='whatistopcoder' />">Who can I contact about working with TopCoder?</A></strong>
    </p>
    <p align="center">
    <strong><A href="<tc-webtag:linkTracking link='/reg/' refer='whatistopcoder' />">Great, sign me up</A></strong>
    </p>
    <p align="center">
    <strong><A href="<tc-webtag:linkTracking link='/' refer='whatistopcoder' />">Back to the homepage</A></strong>
    </p>
<%--
    <p align="center" style="margin-top: 20px;">
    <strong><A href="javascript:getAndClose('<tc-webtag:linkTracking link="http://software.topcoder.com/applications/index.jsp" refer="whatistopcoder" />');">How does TopCoder build software?</A></strong>
    </p>
    <p align="center">
    <strong><A href="javascript:getAndClose('/tc?module=Static&amp;d1=about&amp;d2=contactus');">Who can I contact about working with TopCoder?</A></strong>
    </p>
    <p align="center">
    <strong><A href="javascript:getAndClose('<tc-webtag:linkTracking link="/reg/" refer="whatistopcoder" />');">Great, sign me up</A></strong>
    </p>
--%>

   </div>
</div>

<br><br>
</body>
</html>
