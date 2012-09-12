<%--
  - Author: isv, winsty, Blues
  - Version: 1.1
  - Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders the Landing page for TC Direct application.
  -
  - Version 1.0.1 (Direct Release 6 assembly) changes: pressing Enter on Login form input fields submits the form.
  - Version 1.0.2 (Direct Improvements Assembly Release 1 ) Change notes: Add a hidden field forwarUrl to support redirecting
  - Version 1.0.3 (TC Direct UI Improvement Assembly 1 ) Change notes: Solve "404 not found when click "Projects Available for Conpilots" link in Copilots section in home page."
  - to the latest URL after user login in.
  - Version 1.1 (Release Assembly - TC Cockpit Sidebar Header and Footer Update) changes:
  - 1) Updated the video area of the home page right sidebar.
  - 2) Added a help center widget to the home page right sibebar.
  - 3) Updated the footer of the home page.
  - 4) Added a link to topcoder community in the home page.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>Survey</title>

  
    
</head>

<body class="homePage" id="page">



		<% String qdl = request.getParameter("Q_DL") ;  %>
		
							<iframe src="https://qtrial.qualtrics.com/SE?Q_DL=<%=qdl%>" height="900px" width="1200px"></iframe>

		
	</div><!-- End #landingPage -->


</body><!-- End #page -->

</html>
