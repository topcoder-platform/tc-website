<!-- 
	-This page is the main page of Badge Admin Tool.
	-Since 1.0 (Release Assembly - TopCoder Achievement System Update)
	-Author: TCSASSEMBLER
 -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false" %>
<%@page import="com.topcoder.shared.util.ApplicationServer"%>
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
	<script type="text/javascript" src="/js/ba.000.js?b"></script>
</head>
<body>
<div id="wrapper">
<h1> Badge administration tool </h1>
	<div class="hiddenData">
		<input type="hidden" value="<%="http://" + ApplicationServer.SERVER_NAME + "/tc" %>" id="basePath" />
		<form action="http://<%=ApplicationServer.SERVER_NAME %>/tc" method="post" id="BadgeForm">
			<input type="hidden" name="<%=BadgeAdminToolConstants.MODULE_KEY %>" value="BadgeAdminEdit"/> <br />
			<input type="hidden" name="handle" value="${handle}" />
			<c:if test="${not empty requestScope.earned_badges}">
				<c:forEach items="${requestScope.earned_badges}" var="badge">
					<input type="hidden" alt="${badge.achievementType}" value="${badge.achievementId}" id="${badge.achievementName}" name="<%=BadgeAdminToolConstants.RULE_ID_KEY %>" class="badge"/> <br />
				</c:forEach>
			</c:if>
		</form>
	</div>
<div id="badgeEditor">
	<p class="memberInfo">
		Member: <span id="handleDisplay">${handle}</span>
		<a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?<%=BadgeAdminToolConstants.MODULE_KEY %>=MemberProfile&cr=${userId}">&raquo; TopCoder profile</a>
		<a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=BadgeAdminToolConstants.MODULE_KEY %>=ViewMemberProfile&ha=${handle}">&raquo; Studio profile</a>
		<a href="http://<%=ApplicationServer.SERVER_NAME %>/tc?<%=BadgeAdminToolConstants.MODULE_KEY%>=ViewCopilotProfile&pid=${userId}">&raquo; Copilot profile</a>
	</p>
	<div id="editorControl">
		<button id="leaveButton" onclick="leaveEditor()">Done</button>
		<button id="commitButton" onclick="commitChanges()">Save changes</button>
	</div>
</div>

<div id="footer"></div>

</div><!--end wrapper-->
<div id="tooltip">
</div>
</body>
</html>

