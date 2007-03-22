<%@ page import="com.topcoder.web.reg.Constants"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Registration</title>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>
</head>
<script language="JavaScript" type="text/javascript"><!--
function getAndClose(link) { 
    opener.location.href = link;
    window.close();
}
//-->
</script>

<body>
<div align="center">
   <div style="position: relative; padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

    <div align="center" style="border-bottom: 1px solid #999999; margin: 20px 0px 6px 0px; padding-bottom: 6px;">
        <img src="/i/home/topcoder.png" alt="TopCoder" />
    </div>

    <h2 align="center">What is TopCoder?</h2>
    <p>
    TopCoder's unique competition-based model taps the best developer minds in the world, delivering custom software applications faster, better, and cheaper than the others. Every time.
    </p>
    <p>
    What TopCoder believes is what makes us different:
    </p>
    <ul style="list-style-type: square">
    <li>Intelligence and talent are universal attributes, not limited to one country - or one company.</li>
    <li>The best and smartest ideas should win, regardless of where they come from.</li>
    <li>The only way to determine who's got the better idea is through competition.</li>
    </ul>
    <p>
    <strong>So here's what we do:</strong>
    </p>
    <p>
    We've built a development community with more than 100,000 members from across the globe. They are developers and contractors, students and hobbyists, brought together by a love for coding, a passion for learning, and a desire to test and improve their skills.
    </p>
    <p>
    We offer a wide range of competitions that allow our members to test their skills - against each other and against an objective scoring system. These competitions take place online and onsite through several annual tournaments that are sponsored by some of the world's leading companies. 
    </p>
    <p>
    We developed a rigorous and disciplined software engineering process that leverages our unique competition model. Based on a growing catalog of reusable software components - built by our members and tested in competition - this process generates high-quality applications that we can build more quickly, more efficiently, and for less money than other companies. 
    </p>
    <p>
    By harnessing the power of competition, TopCoder is revolutionizing the way software is built.
    </p>
    <p align="center">
    <strong><A href="javascript:getAndClose('http://software.topcoder.com/applications/index.jsp');">How does TopCoder build Software?</A></strong>
    </p>
    <p align="center">
    <strong><A href="javascript:getAndClose('/tc?module=Static&d1=about&d2=contactus');">Who can I contact about working with TopCoder?</A></strong>
    </p>
    <p align="center">
    <strong><A href="javascript:getAndClose('/reg/');">Great, sign me up</A></strong>
    </p>
   </div>
</div>

<br><br>
</body>
</html>
