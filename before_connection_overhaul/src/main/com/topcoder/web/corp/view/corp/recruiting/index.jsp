<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Recruiting provides employers with innovative programs designed to attract, identify, and evaluate candidates</title>

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
                <jsp:param name="level1" value="recruiting"/>
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
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_topcoder_recruiting.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h3><strong>Candidate Identification</strong></h3>

                        <p>We provide employers with innovative programs designed to attract, identify, and evaluate collegiate candidates and 
                        experienced professionals for full time employment consideration.  With a member base in excess of 30,000&#151;including 
                        more than 17,000 students from over 750 schools&#151;employers obtain objective measurement detail about candidates, including 
                        code samples and statistics, that is not found elsewhere.</p>

                        <h3><strong>Employment Advertisement and Job Postings</strong></h3>

                        <p>We launch a page on the TopCoder website allowing employers to introduce their company, the benefits of working in 
                        their organization and display a list of job openings.  We include a link for a member to indicate interest in the position 
                        advertised.</p>
	
                        <h3><strong>Targeted Email Campaign</strong></h3>

                        <p>We broadcast an email to those members opting to receive employment announcements, notifying them of the employer's 
                        page.  Additionally, the employer has the opportunity to send one targeted email per month during the contract. The employer 
                        can focus on one or multiple criteria, such as rating, state, professional/student status, school, and competition language.

                        <h3><strong>SRM Featured Employer</strong></h3>

                        <p>During the membership term, the employer receives time in the competition Arena as the Featured Employer.  As part 
                        of the employment package, the employer will be promoted as the Featured Employer on the TC homepage, member homepage, 
                        SRM summary page, and competition schedule page, as well as in the applet and practice rooms.</p>
                        
                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="recruiting"/>
                        <jsp:param name="level2" value="overview"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
