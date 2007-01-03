<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.topcoder.web.admin.controller.request.VisaLetters"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>                 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    
<script language="javascript" type="text/javascript">
 </script>  
 
  
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td width="200">
            <jsp:include page="left.jsp"/>
        </td>
        <td>
<form name="f" action="/admin/">
<input type="hidden" name="module" value="EditEvent">
<c:if test="${not empty param.eid }">
<input type="hidden" name="eid" value="${param.eid }">
</c:if>

<table>
	<tr>
		<td>Event Name:</td>
		<td><tc-webtag:textInput name="name" size="30"/></td>
	</tr>
	<tr>
		<td>Start Date:</td>
		<td><tc-webtag:textInput name="startDate" size="8" format="MM/dd/yyyy"/></td>
	</tr>
	<tr>
		<td>End Date:</td>
		<td><tc-webtag:textInput name="endDate" size="8" format="MM/dd/yyyy"/></td>
	</tr>
</table>

<input type="submit" value="Save Event">
</form>
        </td>
    </tr>
</table>
</body>
</html>
