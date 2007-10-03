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
        <title>View Classroom details</title>
        <script type="text/javascript">
            function submitActive() {
                var myForm = document.fActive;
                myForm.submit();
            }
            function submit(action) {
                var myForm = document.f;
                if (action == 'deactivate') {
                    myForm.<%=Constants.MODULE_KEY%>.value = 'DeactivateStudent';
                    myForm.submit();
                } else if (action = 'activate') {
                    myForm.<%=Constants.MODULE_KEY%>.value = 'ActivateStudent';
                    myForm.submit();
                }
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
        <br/>        
        <c:choose>
            <c:when test="${not empty activeStudents}">
                <form name="fActive" action="${sessionInfo.servletPath}" method="post">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="DeactivateStudent"/><br/>
                    <tc-webtag:hiddenInput name="<%=Constants.CLASSROOM_ID%>" value="${classroom.id}"/><br/>
                    Active Students:
                    <table border="1">
                        <tr><td>Student name</td><td>&nbsp;</td></tr>
                        <c:forEach items="${activeStudents}" var="student">                
                            <tr>
                                <td>${student.user.lastName}, ${student.user.firstName}</td>
                                <td><input type="checkbox" name="stid" value="${student.id}"></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <p>
                        <a href="javascript:submitActive()" class="button" style="width: 60px; margin-right: 10px;">Deactivate</a>
                    </p>
                </form>
            </c:when>
            <c:otherwise>
                There are no active students in this classroom.
            </c:otherwise>
        </c:choose>
        <br/>
        <c:choose>
            <c:when test="${not empty pendingStudents}">
                <form name="f" action="${sessionInfo.servletPath}" method="post">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value=""/><br/>
                    <tc-webtag:hiddenInput name="<%=Constants.CLASSROOM_ID%>" value="${classroom.id}"/><br/>
                    Pending Students:
                    <table border="1">
                        <tr><td>Student name</td><td>&nbsp;</td></tr>
                        <c:forEach items="${pendingStudents}" var="student">                
                            <tr>
                                <td>${student.user.lastName}, ${student.user.firstName}</td>
                                <td><input type="checkbox" name="stid" value="${student.id}"></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <p>
                        <a href="javascript:submit('activate')" class="button" style="width: 60px; margin-right: 10px;">Activate</a>
                        <a href="javascript:submit('deactivate')" class="button" style="width: 60px; margin-right: 10px;">Reject</a>
                    </p>
                </form>
            </c:when>
            <c:otherwise>
                There are no pending students in this classroom.
            </c:otherwise>
        </c:choose>
    <br/><br/>
    <a href="/ep?module=EditClassroom&amp;clsid=${classroom.id}">Edit Classroom</a>
    <br/><br/>
        <c:choose>
            <c:when test="${not empty assignments}">
                Classroom's assignments:
                <table border="1">
                    <tr><td>Name</td><td>Start</td><td>End</td><td>Finished</td><td>&nbsp;</td></tr>
                    <c:forEach items="${assignments}" var="assignment">                
                        <tr>
                            <td>${assignment.name}</td>
                            <td>${assignment.contest.startDate}</td>
                            <td>${assignment.contest.endDate}</td>
                            <td>9/99</td>
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