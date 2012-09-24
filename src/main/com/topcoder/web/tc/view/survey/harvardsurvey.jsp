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

    <link rel="stylesheet" href="/css/direct/screen.css?v=214495" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/direct/homepage.css?v=203310" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/direct/jquery.jcarousel.css?v=176771" media="all" type="text/css"/>
    <link rel="stylesheet" href="/css/direct/thickbox.css?v=192822" media="all" type="text/css"/>
	
	    <script type="text/javascript" src="/scripts/jquery-1.4.1.min.js?v=176771"></script>
    <script type="text/javascript" src="/scripts/jquery.jcarousel.pack.js?v=176771"></script>
    <script type="text/javascript" src="/scripts/thickbox-compressed.js?v=186145"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js?v=179836"></script>
    <script type="text/javascript" src="/scripts/scripts.js?v=203345"></script>
    <script type="text/javascript" src="/scripts/AJAXProcessor.js?v=176771"></script>
    <script type="text/javascript" src="/scripts/RSSProcessor.js?v=176771"></script>
    <script type="text/javascript" src="/scripts/FeedLoader.js?v=213163"></script>
    <script type="text/javascript" src="/scripts/loadHelps.js?v=215005"></script>

    
</head>

<body class="homePage" id="page">



		<% String qdl = request.getParameter("SID") ;  %>
		<% String tcid = request.getParameter("tcid") ;  %>
			<div id="landingPage">
		<div id="header">
			
			<div class="headerInner">
				<a href="http://www.topcoder.com" class="logo"><img src="/images/logo.png" alt="TopCoder"/></a>
			</div><!-- End .headerInner -->
				
		</div><!-- End #header -->
		
		<div id="wrapper">
			<div class="wrapperTop">
				
					<div class="content">
		
							<iframe src="https://harvard.qualtrics.com/SE/?SID=<%=qdl%>&tcid=<%=tcid%>" height="700px" width="1000px"></iframe>
				
						</div><!-- end .content --> 
				</div></div>
			
	</div><!-- End #landingPage -->


</body><!-- End #page -->

</html>
