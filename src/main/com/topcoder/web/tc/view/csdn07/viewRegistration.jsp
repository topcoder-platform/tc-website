<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<c:choose>
	<c:when test="${not empty registered}">
		You're registered for CSDN 07	
	</c:when>
	<c:otherwise>
		<a href="/tc?module=CSDN07SubmitRegistration">Click here to register in CSDN 07</a>
	</c:otherwise>
</c:choose>
</html>