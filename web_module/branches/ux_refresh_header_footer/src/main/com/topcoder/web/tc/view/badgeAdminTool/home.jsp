<%@ page language="java" import="java.util.*, com.topcoder.shared.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.topcoder.web.tc.controller.request.badge.BadgeAdminToolConstants"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<link href='http://fonts.googleapis.com/css?family=Actor'
	 rel='stylesheet' type='text/css' />
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<title> Badge administration tool </title>
	<link rel="stylesheet" href="/css/ba.000.css?b" type="text/css" />
	<script type="text/javascript" src="/js/jquery-1.2.6.pack.js"></script>
	<script type="text/javascript" src="/js/badgeAdminToolScript.js"></script>
</head>
<body>
<div id="wrapper">

<h1> Badge administration tool </h1>

<div id="memberSearch">
	<span> Member handle: </span>
	<form id="SearchHandleForm" action="<%="http://" + ApplicationServer.SERVER_NAME + "/tc"%>">
		<input type="hidden" name="<%=BadgeAdminToolConstants.MODULE_KEY%>" value="BadgeAdminHome"/>
		<input type="text" id="handleInput" name="handle"/>
		<input type="button" id="searchHandleButton" value="Search"></input>
	</form>
	
	<c:if test="${not empty requestScope.matching_handles}">
		<div>
			<c:forEach items="${matching_handles}" var="handle">
				<a href="<%="http://" + ApplicationServer.SERVER_NAME + "/tc?" + BadgeAdminToolConstants.MODULE_KEY + "=BadgeAdminTool&handle="%>${handle}">${handle}</a>
				<br />
			</c:forEach>
		</div>
	</c:if>
</div>
<div id="footer"></div>
</div><!--end wrapper-->
<div id="tooltip">
</div>
</body>
</html>
