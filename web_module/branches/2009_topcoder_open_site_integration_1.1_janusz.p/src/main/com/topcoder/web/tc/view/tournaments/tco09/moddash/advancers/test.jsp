<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.topcoder.json.object.JSONArray,
    com.topcoder.json.object.JSONObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
<% JSONArray feedData =  (JSONArray) request.getAttribute("feedData"); %>
feedData: <%= feedData %><br />
feedData.getSize(): <%= feedData.getSize() %><br />
feedData.object0: <%= feedData.getJSONObjec(0) %><br />
</body>
</html>