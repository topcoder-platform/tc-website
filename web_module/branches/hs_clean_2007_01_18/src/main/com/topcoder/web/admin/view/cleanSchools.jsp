<%@ page import="com.topcoder.web.admin.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="sessionInfo"
	class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<jsp:include page="top.jsp" />
<table>
	<tr valign="top">
		<td><jsp:include page="left.jsp" /></td>
		<td>
		<form
			action="<jsp:getProperty name="sessionInfo" property="servletPath"/>"
			method="post" name="surveyForm">
		<h1>School Data Cleaner</h1>
		
                        <c:forEach items="${results}" var="result">
                            ${result[1].name}<br/>
                            Registrants: ${result[0]}<br/>
                        </c:forEach>


		
		<table>
			<tr>
				<td><input type="checkbox"> Country: <select name="cc">
					<option value="032" selected="selected">Argentina</option>
					<option value="051">Armenia</option>
					<option value="533">Aruba</option>
				</select> <br>
				<br>
				<input type="checkbox"> School created after: <input
					type="text" value="01/01/2007"> <br>
				<br>
				<input type="button" value="search"></td>
				<td></td>
			</tr>
			<tr>
				<td><br>

				<select multiple size="10" style="width: 180px;">
					<option>[Argentina] U.B.A. (1)</option>
					<option>[Argentina] UBA (12)</option>
				</select></td>
				<td><a href="#">choose as source school</a> </br>
				<a href="#">choose as destination school</a><br>

				<br>
				<br>
				U.B.A -> UBA <input type="button" value="Replace"></td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
</body>
</html>
