<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="recruiting"/>
                <jsp:param name="level2" value="reporting"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/header_topcoder_recruiting.gif" alt="TopCoder Recruiting" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/clear.gif" width="1" height="7" alt="" border="0"><br>

                        <h2 class="corpHead">Management Tool</h2>
                        
                        <h3><strong>Session Administration</strong></h3>
                        
                        <ul>
                            <li>Designed with ease-of-use in mind</li>
                            <li>Select problems</li>
                            <li>Add candidates</li>
                            <li>Keep notes on each candidate</li>
                            <li>Invite candidate via email that includes all necessary links to Testing Application and Help Manual</li>
                        </ul>
                        
                        <div align="center"><img src="/i/testing_screen_3.gif" alt="Testing Application Management Tool - Session Administration" width="529" height="383" border="0"></div>

                        <h3><strong>Reporting</strong></h3>

                        <ul>
                            <li>Access to detailed statistical information on each candidate's performance<br>
                            - Programming language chosen<br>
                            - Attempted problem status<br>
                            - System test results<br>
                            - Time to submit</li>
                            <li>Comparative statistics to TopCoder’s member base</li>
                            <li>Submitted code can be analyzed by engineers to determine problem solving skills</li>
                        </ul>
                        
                        <div align="center"><img src="/i/testing_screen_4.gif" alt="Testing Application Managment Tool - Candidate Results Report" width="528" height="388" border="0"></div>

                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../includes/right.jsp">
                        <jsp:param name="level1" value="recruiting"/>
                        <jsp:param name="level2" value="reporting"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
