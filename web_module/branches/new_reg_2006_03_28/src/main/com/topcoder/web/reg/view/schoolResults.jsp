<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registration</title>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>
<div align="center">
    <div style="width:250px;padding:15px;text-align:left;">

        <jsp:include page="/page_title.jsp">
            <jsp:param name="image" value="registration_w"/>
            <jsp:param name="title" value="School Selection"/>
        </jsp:include>

        <span class="subtitle">Results</span>
        <br><br>
        Please select your school from list below and click Submit:

            <select name="schoolSelection" size="4" multiple="multiple">
        <c:forEach items="${results}" var="result">
            <option value="${result[0].id}">${result[0].name} ${result[1]}</option>
        </c:forEach>
            </select>

        <div align="center">
            <A href="">Submit</A>
        </div>
        <br><br>
        <strong>OR</strong>
        <br><br>
        If your school is not in the list above, click <A href="">here</A>.
    </div>
</div>
</body>
</html>
