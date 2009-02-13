<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         errorPage="exc/InternalError.jsp"
         import="com.topcoder.web.corp.Constants" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>

<title>TopCoder Corporate Services</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Header begins -->
<jsp:include page="includes/top.jsp" />
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
   <tr>
<!-- Left Column Begins -->
        <td width="170" valign="top">
        <jsp:include page="includes/left.jsp" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Body Area -->
        <td width="100%" valign="top"><img src="/i/clear.gif" height="11"  alt="" border="0" /><br />
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="50%" class="bodyText">
                        <h1 class="bodyTitle"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=screening&d2=index">Candidate Testing</a></h1>
                        <p>TopCoder's Candidate Testing Application allows you to <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=screening&d2=index"><strong>test the technical abilities</strong></a> 
                        of candidates during the interview process, thereby reducing the time incurred by in-house engineers.  You can choose problem sets to test candidates' problem 
                        solving skills with scenarios that mirror on-the-job issues.  Instead of only assessing an employee's skills months after the hire date, detailed statistics and all 
                        submitted code are available to you during the interview process as a way to measure and compare candidates.  This information drastically reduces the time and 
                        effort it takes to identify proven developers.</p>

                       <h1 class="bodyTitle"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=tces&d2=index">Recruiting</a></h1>
                        <p>TopCoder Recruiting provides you with innovative programs designed to <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=tces&d2=index"><strong>attract, identify, and evaluate</strong></a> 
                        collegiate candidates and experienced professionals for full time employment consideration.  With a member base in excess of 24,000&#151;including more than 
                        12,000 students from over 750 schools&#151;employers obtain objective measurement detail about candidates, including code samples and statistics, that is not 
                        found elsewhere.</p></td>
                       
                    <td><img src="/i/clear.gif" width="8" height="1" alt="" border="0" /></td>
                    <td bgcolor="#CCCCCC"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" /></td>
                    <td><img src="/i/clear.gif" width="8" height="1" alt="" border="0" /></td>
                       
                    <td width="50%" class="bodyText">
                       <h1 class="bodyTitle"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=spon_prog&d2=index">Sponsorship</a></h1>
                       <p>As a TopCoder sponsor <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=spon_prog&d2=index"><strong>you can market</strong></a> 
                       to a powerful community of technologists. This highly sought after demographic influences technology buying decisions for thousands of companies. They dictate the 
                       future direction of technology and manage thousands of people. Through competition, TopCoder provides a unique  approach to attracting and differentiating this 
                       demographic. Sponsors benefit from a branded, exciting, credible experience for programmers.</p>
                      
                       <h1 class="bodyTitle"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=spon_prog&d2=index">Private Label Events</a></h1>
                       <p>Many members of your IT staff may feel left out of traditional training and incentive programs. Just like our weekly Single Round Matches and 
                       Tournaments, <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=spon_prog&d2=index"><strong>TopCoder Private Label Events</strong></a> 
                       are a unique way for your developers to learn new skills and build teamwork. You receive reports that help you identify your best talent, as well as 
                       discover hidden talent.</p></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->
   </tr>
</table>

<!-- Footer begins -->
<jsp:include page="includes/foot.jsp" />
<!-- Footer ends -->

</body>
</html>
