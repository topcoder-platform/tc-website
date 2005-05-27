<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ include file="includes/session.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="-1">
	<title><template:get name="title"/></title>
<html:base/>
<link rel="stylesheet" type="text/css" href="<html:rewrite page='/stylesheets/tcs_style.css'/>" />

</head>

<body class="body" marginheight="0" marginwidth="0">

<!-- Content begins -->

		<template:get name="content"/>
		
<!-- Content ends-->

</body>
</html>


