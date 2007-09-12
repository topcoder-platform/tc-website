<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Select Classroom</title>
</head>


<body>
<c:choose>
    <c:when test="${not empty professors}">
        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SelfRegisterConfirm"/>
            select a professor: <br/>
            <table> 
                <tr><td>School</td><td>Professor</td><td>Classroom</td><td>Academic period</td><td>Description</td><td>Select</td></tr>
                <c:forEach items="${professors}" var="professor">
                    <c:forEach items="${professor.classrooms}" var="classroom">                
                        <tr>
                            <td>${professor.school.name}</td>
                            <td>${professor.user.lastName}, ${professor.user.firstName}</td>
                            <td>${classroom.name}</td>
                            <td>${classroom.academicPeriod}</td>
                            <td>${classroom.description}</td>
                            <td><tc-webtag:chkBox name="sel_${classroom.id}"/></td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </table> 
        </form>            
    </c:when>
    <c:otherwise>
        There are no professors available for the selected school.
    </c:otherwise>
</c:choose>
</body>
</html>