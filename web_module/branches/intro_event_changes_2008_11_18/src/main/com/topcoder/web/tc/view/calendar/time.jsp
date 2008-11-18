<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <META HTTP-EQUIV="REFRESH" CONTENT="15"/>
    <title>TopCoder Time</title>
</head>

<BODY style="background:#000000; padding:0px; margin:0px;">
<div style="color:#FFFFFF; background:#000000; padding:5px;" align="center">
Current time at the TopCoder corporate office:
<br /><br />
<b>
    <tc-webtag:format object="<%=new Date()%>" format="hh:mm a z"/>
</b>
</div>
</BODY>
</html>