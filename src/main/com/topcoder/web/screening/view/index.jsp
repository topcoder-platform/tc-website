<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<html>
<head>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>
<jsp:include page="script.jsp" />
</head>

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<jsp:include page="includes/top.jsp" >
  <jsp:param name="isHomePage" value="true" />
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
    <!-- Left Column Begins -->
        <td width="22" bgcolor="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
            <jsp:include page="includes/left.jsp" />
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
        </td>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
        <td><img src="/i/p/clear.gif" width="10" height="1"></td>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <td class="bodyText" width="100%"><img src="/i/p/clear.gif" width="400" height="11" border="0"><br />
            <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr valign="top">
                    <td class="bodyText">
                        <h1 class="testHead">Welcome!</h1>
                        <p>TopCoder Testing allows companies to test the technical abilities of candidates during the interview process, thereby reducing 
                        the time incurred by in-house engineers.  This administration tool allows you to set up candidates to be tested, as well as review 
                        each candidate's results.  Follow the steps below to begin.</p>
                    </td>
                <tr>
            </table>
                            
            <table border="0" cellspacing="0" cellpadding="0" width="70%">
                <tr><td colspan="3" valign="top"><font size="3" color="#666666"><b>Create a New Session:</b></font></td></tr>
                <tr><td colspan="3"><img src="/i/p/clear.gif" width="1" height="10"></td></tr>            
                <tr>
                    <td valign="top" class="bodyText" nowrap="nowrap"><strong>Step 1:</strong></td>
                    <td><img src="/i/p/clear.gif" width="5" height="1"></td>
                    <td valign="top" class="bodyText"><strong>Create a Test Profile</strong><br />
                        Each candidate is assigned to a Test Profile.  Each Test Profile is assigned two sets of problems&#151;Test Set A, which 
                        is used to screen for accuracy and speed, and Test Set B, which is used to screen for accuracy and style.</td>   
                </tr>
                <tr><td colspan="3"><img src="/i/p/clear.gif" width="1" height="10"></td></tr>      
                <tr>
                    <td valign="top" class="bodyText" nowrap="nowrap"><strong>Step 2:</strong></td>
                    <td><img src="/i/p/clear.gif" width="5" height="1"></td>
                    <td valign="top" class="bodyText"><strong>Set up or Add a Candidate</strong><br />
                        Each candidate is set up in the system and assigned to a Test Profile.  Test results are tracked and reported by candidate.</td>               
                </tr>
                <tr><td colspan="3"><img src="/i/p/clear.gif" width="1" height="10"></td></tr>
                <tr><td colspan="3"><img src="/i/p/clear.gif" width="1" height="10"></td></tr>
                <tr><td colspan="3" class="bodyText" align="center"><screen:servletLink processor="PopulateSession" styleclass="bodyText">Create a New Session</screen:servletLink></td></tr>                                                       
            </table>
            <p><br/></p>    
        </td> 
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/p/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="includes/foot.jsp" />

</body>
</html>
