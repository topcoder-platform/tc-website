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
A:link { color: #0000FF; text-decoration: none; }
A:visited { color: #0000FF; text-decoration: none; }
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
<img src="/i/about/quickmessageV2.png" alt="quickmessage" />
</div>

    <p>
    <strong>Welcome to TopCoder.</strong>
    </p>
    <p>
    Our model is built on three key beliefs:
    </p>
    <ul style="list-style-type: square">
    <li>Intelligence and talent are universal, not limited to one country or one company.</li>
    <li>The best and smartest ideas should prevail, regardless of where they come from.</li>
    <li>The only way to determine who has a better solution is through competition.</li>
    </ul>
    <p>
    The foundation of TopCoder is a global community of thousands. From coders and contractors to students and hobbyists, they're brought together by a love of programming, a passion for learning, and the<br>drive to compete.
    </p>
    <p>
    Together with our community, we established a rigorous and disciplined software development process that leverages our unique competition model. Based on a growing catalog of reusable software components - built and tested by our members - this process generates high-quality applications quickly and efficiently.
    </p>
    <p align="center">
    <strong>Through competition, the TopCoder community has revolutionized the way software is built.</strong>
    </p>
    <p align="center" style="margin-top: 20px;">
    <strong><A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=about&d2=contactus' refer='whatistopcoder' />">Call us today and let us build your next application.</A></strong>
    </p>
    <p align="center">
    <strong><A href="<tc-webtag:linkTracking link='http://software.topcoder.com/applications/index.jsp' refer='whatistopcoder' />">I'd like to know more about how TopCoder builds software.</A></strong>
    </p>
    <p align="center">
    <strong><A href="<tc-webtag:linkTracking link='/reg/' refer='whatistopcoder' />">I'd like to register now.</A></strong>
    </p>
    <p align="center">
    <strong><A href="<tc-webtag:linkTracking link='/' refer='whatistopcoder' />">Go back to the homepage.</A></strong>
    </p>
   </div>
</div>

<br><br>
</body>
</html>
