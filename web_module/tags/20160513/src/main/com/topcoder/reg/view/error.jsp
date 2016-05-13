<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This is the page showing generic error.
   - Version: 1.0
   - Author: leo_lol
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Generic error page</title>
</head>
<body>
	<h1>You got an error!</h1>
	<div>
	   <s:actionerror/>
	</div>
</body>
</html>