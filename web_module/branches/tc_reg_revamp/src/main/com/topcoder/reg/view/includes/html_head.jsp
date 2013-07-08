<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This page contains all external resources(Java-script external file, CSS external file). 
   - It should be included in all JSP pages if they need these resources.
   - Version 1.0
   - Author: leo_lol
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = "https://"+request.getServerName()+path+"/";
%>
	<head>
		<title>${param.pageTitle}</title>
		<base href="<%=basePath%>">
		<!-- Meta Tags -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!-- External CSS -->
		<link rel="stylesheet" href="css/reset.css" media="all" type="text/css" />
		<link rel="stylesheet" href="css/style.css" media="all" type="text/css" />
		<!--[if IE 7]>
		<link rel="stylesheet" href="css/ie7.css" media="all" type="text/css" />
		<![endif]-->
		<!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
	    <![endif]-->

		<!-- external javascript -->
	    <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.bxSlider.min.js"></script>	    
		<script type="text/javascript" src="js/script.js"></script>
	</head>