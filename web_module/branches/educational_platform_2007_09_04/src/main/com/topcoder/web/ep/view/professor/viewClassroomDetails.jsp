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
        School: ${classroom.professor.school.name}
        <br/>
        Professor: ${classroom.professor.user.lastName}, ${classroom.professor.user.firstName}
        <br/>
        Classroom: ${classroom.name}
        <br/>
        Academic period: ${classroom.academicPeriod}
        <br/>
        Description : ${classroom.description}
        <br/>
        
        <c:choose>
            <c:when test="${not empty activeStudents}">
                <table> 
                    <tr><td>Student</td><td>&nbsp;</td></tr>
                    <c:forEach items="${activeStudents}" var="student">                
                        <tr>
                            <td>${student.user.lastName}, ${student.user.firstName}</td>
                            <td><a href="">delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                There are no active students in this classroom.
            </c:otherwise>
        </c:choose>
        <br/>
        <c:choose>
            <c:when test="${not empty pendingStudents}">
                <table> 
                    <tr><td>Student</td><td>&nbsp;</td><td>&nbsp;</td></tr>
                    <c:forEach items="${pendingStudents}" var="student">                
                        <tr>
                            <td>${student.user.lastName}, ${student.user.firstName}</td>
                            <td><a href="">activate</a></td>
                            <td><a href="">delete</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                There are no pending students in this classroom.
            </c:otherwise>
        </c:choose>
    </body>
</html>