<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>TopCoder Corporate Services</title>

<jsp:include page="includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />
</head>

<body>

<!-- Header begins -->
<jsp:include page="includes/top.jsp" >
  <jsp:param name="isHomePage" value="true"/>
</jsp:include>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins -->
        <td width="170">
        <jsp:include page="includes/left.jsp" >
            <jsp:param name="level1" value="index"/>
        </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Body Area -->
        <td width="100%"><img src="/i/corp/clear.gif" height="11"  alt="" border="0"><br>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="33%" class="bodyText">
                        <h1 class="bodyTitle"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index">Candidate Testing</a></h1>
                        <p>TopCoder's Candidate Testing Application allows you to <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=testing&d3=index"><strong>test the technical abilities</strong></a>
                        of candidates during the interview process, thereby reducing the time incurred by in-house engineers.  You can choose problem sets to test candidates' problem
                        solving skills with scenarios that mirror on-the-job issues.  Instead of only assessing an employee's skills months after the hire date, detailed statistics and all
                        submitted code are available to you during the interview process as a way to measure and compare candidates.  This information drastically reduces the time and
                        effort it takes to identify proven developers.</p>

                        <p><a href="<jsp:getProperty name='sessionInfo' property='ServletPath'/>testing/">Go to Testing Application Management Tool now</a></p>
                    </td>

                    <td><img src="/i/corp/clear.gif" width="8" height="1" alt="" border="0"></td>
                    <td bgcolor="#CCCCCC"><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td><img src="/i/corp/clear.gif" width="8" height="1" alt="" border="0"></td>

                    <td width="33%" class="bodyText">
                      <h1 class="bodyTitle"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=index">Recruiting</a></h1>
                        <p>TopCoder Recruiting provides you with innovative programs designed to <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=recruiting&d3=index"><strong>attract, identify, and evaluate</strong></a>
                        collegiate candidates and experienced professionals for full time employment consideration.  With a member base in excess of 30,000&#151;including more than
                        17,000 students from over 750 schools&#151;employers obtain objective measurement detail about candidates, including code samples and statistics, that is not
                        found elsewhere.</p>

                        <p><a href="/corp/tces/?task=MainTask">Go to Recruiting Reporting Tool now</a></p>
                    </td>

                    <td><img src="/i/corp/clear.gif" width="8" height="1" alt="" border="0"></td>
                    <td bgcolor="#CCCCCC"><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
                    <td><img src="/i/corp/clear.gif" width="8" height="1" alt="" border="0"></td>

                    <td width="33%" class="bodyText">
                       <h1 class="bodyTitle"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index">Sponsorship</a></h1>
                       <p>As a TopCoder sponsor <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index"><strong>you can market</strong></a>
                       to a powerful community of technologists. This highly sought after demographic influences technology buying decisions for thousands of companies. They dictate the
                       future direction of technology and manage thousands of people. Through competition, TopCoder provides a unique  approach to attracting and differentiating this
                       demographic. Sponsors benefit from a branded, exciting, credible experience for programmers.</p>
                   </td>

                       <!-- <h1 class="bodyTitle"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index">Private Label Events</a></h1>
                       <p>Many members of your IT staff may feel left out of traditional training and incentive programs. Just like our weekly Single Round Matches and
                       Tournaments, <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=spon_prog&d3=index"><strong>TopCoder Private Label Events</strong></a>
                       are a unique way for your developers to learn new skills and foster teamwork. You receive reports that help you identify your best talent, as well as
                       discover hidden talent.</p></td> -->
                </tr>
            </table>

            <p><br></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
   </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</body>
</html>
