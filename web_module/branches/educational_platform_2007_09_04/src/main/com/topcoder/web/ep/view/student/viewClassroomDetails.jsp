<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>View Classroom details</title>
</head>


<body>
    <table border="1">
            <tr>
                <td>School</td>
                <td>Professor</td>
                <td>Classroom</td>
                <td>Term</td>
                <td>Description</td>
            </tr>
            <tr>
                <td>${classroom.school.name}</td>
                <td>${classroom.professor.user.lastName}, ${classroom.professor.user.firstName}</td>
                <td>${classroom.name}</td>
                <td>${classroom.academicPeriod}</td>
                <td>${classroom.description}</td>
            </tr>
    </table>
    <br/>
    <a href="/ep/">Back</a>
</body>
</html>
