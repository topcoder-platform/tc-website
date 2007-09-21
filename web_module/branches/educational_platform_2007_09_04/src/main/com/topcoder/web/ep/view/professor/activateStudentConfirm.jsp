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
        <title>Activate student</title>
    
        <script type="text/javascript">
            function submit() {
                var myForm = document.f;
                myForm.submit();
            }
        </script>
    </head>
    
    
    <body>
        <table border="1">
                <tr>
                    <td>Classroom</td>
                    <td>Academic period</td>
                    <td>Description</td>
                </tr>
                
                <tr>
                    <td>${classroom.name}</td>
                    <td>${classroom.academicPeriod}</td>
                    <td>${classroom.description}</td>
                </tr>
        </table>
        <br/>        
        Are you sure you want to confirm the following registrations?<br/>
        <ul>
        <c:forEach items="${student_classrooms}" var="student_classroom">
            <li>${student_classroom.id.student.user.lastName}, ${student_classroom.id.student.user.firstName}</li>
        </c:forEach>
        </ul>
        <form name="f" action="${sessionInfo.servletPath}" method="post">
            <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ActivateStudentSubmit"/>
            <tc-webtag:hiddenInput name="<%=Constants.CLASSROOM_ID%>" value="${classroom.id}"/>
            <c:forEach items="${student_classrooms}" var="student_classroom">
                <tc-webtag:hiddenInput name="<%=Constants.STUDENT_ID%>" value="${student_classroom.id.student.id}"/>
            </c:forEach>
            <p>
                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Confirm and save</a>
            </p>
        </form>            
    <a href="/ep?module=ViewClassroomDetails&amp;clsid=${classroom.id}">Back</a>
    </body>
</html>