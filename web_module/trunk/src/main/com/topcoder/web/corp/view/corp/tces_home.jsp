<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Recruiting, Testing and User Management at TopCoder Employment Services</title>

<jsp:include page="includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="includes/top.jsp" >
    <jsp:param name="level1" value="employment_services"/>
</jsp:include>

</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="includes/left.jsp">
                <jsp:param name="level1" value="tces"/>
                <jsp:param name="level2" value="overview"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/corp/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_corp_tces.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="20" alt="" border="0">
                        <div align="center"> <img src="/i/corp/quote_employer2.gif" width="510" height="90" alt="" border="0"> </div>
                        
                      <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=recruiting&d3=index">Recruiting</a></span><br>
                        We provide employers with innovative programs designed to attract, identify, and evaluate collegiate candidates and 
                        experienced professionals for full time employment consideration.  With a member base in excess of 20,000&#151;including 
                        more than 12,000 students from over 750 schools&#151;employers obtain objective measurement detail about candidates, including 
                        code samples and statistics, that is not found elsewhere.</p>

                        <p><span class="bodySubtitle"><a href="?module=Static&d1=corp&d2=testing&d3=index">Testing</a></span><br>
                        The TopCoder Testing Program allows companies to test the technical abilities of candidates during the interview process, 
                        thereby reducing the time incurred by in-house engineers.  Employers can choose problem sets to test candidates' problem 
                        solving skills with scenarios that mirror on-the-job issues. </p>
	
                        <p><span class="bodySubtitle"><a href="?module=UserList">Manage Users</a></span><br>
                        Use our online application to manage the access your company users get to the TCES Recruiting and Testing Tools. Add new 
                        users, assign different levels of administrative access to existing users, or delete users. Options vary depending on which 
                        TCES packages you purchase.</p>

                        <p><br></p>
                    </td>

<!-- Right Column begins -->
                    <jsp:include page="../right.jsp">
                        <jsp:param name="level1" value="tces_home"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
