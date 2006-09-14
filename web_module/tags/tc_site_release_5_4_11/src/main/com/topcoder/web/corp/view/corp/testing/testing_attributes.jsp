<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>A complete explanation of the TopCoder Employment Services Technical Assessment Program</title>

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
                <jsp:param name="level2" value="attributes"/>
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

                        <h1 class="testHead">TopCoder Technical Assessment Process</h1>

                        		<p><a href="/corp/?module=Static&d1=corp&d2=testing&d3=demo"><img src="/i/corp/testing_demo.gif" width="265" height="98" alt="" border="0" align="right"/></a>
                        		The TopCoder Technical Assessment Program allows companies to assess the technical abilities of candidates during the
                        		interview process, thereby reducing the time incurred by in-house engineers. Employers can choose problem sets
                        		to test candidates' problem solving skills with scenarios that mirror on-the-job issues. Instead of only
                        		assessing employees' skills months after they're hired, detailed statistics and all submitted code are
                        		released to employers during the interview process as a way to measure and compare candidates. This information
                        		drastically reduces the time and effort it takes to identify proven developers.</p>


                       <p><strong><a href="/corp/?module=Static&d1=corp&d2=testing&d3=management_tool">Click here to see the Technical Assessment Attributes</a></strong></p>

                        <div align="center"><img src="/i/corp/testing_diagram.gif" width="530" height="565" alt="TopCoder Testing" border="0"></div>

                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="testing"/>
                        <jsp:param name="level2" value="attributes"/>
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
