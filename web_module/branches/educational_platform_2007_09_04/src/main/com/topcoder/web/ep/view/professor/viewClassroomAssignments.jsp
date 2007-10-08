<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.ep.Constants"%>
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
        <title>View Classroom assignments</title>
        <script type="text/javascript">
            function submitActive() {
                var myForm = document.fActive;
                myForm.submit();
            }
        </script>
    </head>
    
    
    <body>
        Classroom details:
        <table border="1">
                <tr>
                    <td>School</td>
                    <td>Classroom</td>
                    <td>Academic period</td>
                    <td>Description</td>
                </tr>
                <tr>
                    <td>${classroom.school.name}</td>
                    <td>${classroom.name}</td>
                    <td>${classroom.academicPeriod}</td>
                    <td>${classroom.description}</td>
                </tr>
        </table>
        <br/><br/>
            <c:choose>
                <c:when test="${not empty assignments}">
                    Classroom's assignments:
                    <table border="1">
                        <tr><td>Name</td><td>Start</td><td>End</td><td>Assigned</td><td>Finished (succeeded/failed)</td><td>&nbsp;</td></tr>
                        <c:forEach items="${assignments}" var="assignment">                
                            <tr>
                                <td>${assignment.name}</td>
                                <td><fmt:formatDate value="${assignment.contest.startDate}" pattern="yyyy.MM.dd HH:mm"/></td>
                                <td><fmt:formatDate value="${assignment.contest.endDate}" pattern="yyyy.MM.dd HH:mm"/></td>
                                <td>${assignment.registered}</td>
                                <td>${assignment.succeeded}/${assignment.failed}</td>
                                <td><a href="/ep?module=EditAssignment&amp;asid=${assignment.id}">Edit</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    There are no assignments for this classroom.
                </c:otherwise>
            </c:choose>
            <br/><br/>
            <a href="/ep?module=EditAssignment&amp;clsid=${classroom.id}">Add new assignment</a>
        <br/><br/>
        <a href="/ep/">Back</a>
    </body>
</html>
