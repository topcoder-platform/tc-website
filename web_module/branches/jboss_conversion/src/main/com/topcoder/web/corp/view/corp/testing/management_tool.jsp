<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Use the TopCoder Employment Services Technical Assessment Program to administer and gather reports on participants</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="testing"/>
                <jsp:param name="level2" value="management"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">

                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="7" alt="" border="0"><br>

                        <h1 class="testHead">Technical Assessment Attributes</h1>


                        <p> <a href="/corp/?module=Static&d1=corp&d2=testing&d3=demo"><img src="/i/corp/testing_demo.gif" width="265" height="98" alt="" border="0" align="right"/></a>At the highest level, the TopCoder Technical Assessment Tool tests candidates in the following areas:</p>
						<blockquote><ul>
							<li>Problem Statement Comprehension Understanding of elements and the relationship between elements, variables and goals</li>
							<li>Logical Design Conceive and design a logical structure for problem solving</li>
							<li>Physical Implementation - Write and test detailed instructions to solve a problem - Compile and debug code by utilizing the functionality of a programming language compiler</li>
						</ul></blockquote>

                        <div align="center"><img src="/i/corp/testing_screen_2.gif" alt="Coding Environment and Problem Statement" width="418" height="289" border="0"></div>

                        <h3><strong>Technical Assessment Tool</strong></h3>
						<blockquote><ul>
							<li>Web-based application used during application process</li>
							<li>Candidates solve algorithmic problems</li>
							<li>Measures programming ability</li>
							<li>Allows candidates to code in Java, C++ or C#</li>
							<li>Systematically tests for accuracy and basic efficiency</li>
							<li>Results available immediately via Management Tool website</li>
						</ul></blockquote>

						<h3><strong>Reporting</strong></h3>
						<p>Access to detailed statistical information on each candidate's performance</p>
						<blockquote><ul>
							<li>Programming language chosen</li>
							<li>Attempted problem status</li>
							<li>System test results</li>
							<li>Time to submit</li>
						</ul></blockquote>
						<p>Submitted code can be analyzed by engineers to determine problem solving skills</p>


                        <div align="center"><img src="/i/corp/testing_screen_4.gif" alt="Technical Assessment Application Managment Tool - Candidate Results Report" width="528" height="388" border="0"></div>

                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="testing"/>
                        <jsp:param name="level2" value="management"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
