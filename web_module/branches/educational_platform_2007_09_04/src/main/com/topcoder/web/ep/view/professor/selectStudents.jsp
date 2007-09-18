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
        <title>Edit Classroom Students</title>
    
        <script type="text/javascript">
            function submit() {
                var myForm = document.f;
                myForm.submit();
            }
        </script>
    </head>
    
    
    <body>
        Professor: ${classroom.professor.user.lastName}, ${classroom.professor.user.firstName}
        <br/>
        Classroom: ${classroom.name}
        <br/>
        Academic period: ${classroom.academicPeriod}
        <br/>
        Description : ${classroom.description}
        <br/>

        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditClassroomConfirm"/><br/>
        <c:choose>
            <c:when test="${not empty activeStudents}">
                <tr><td>School</td><td>Professor</td><td>Classroom</td><td>Academic period</td><td>Description</td><td>Select</td></tr>
                <table> 
                    <tr><td>Student name</td><td>&nbsp;</td></tr>
                    <c:forEach items="${classroom.students}" var="student">                
                        <tr>
                            <td>${student.user.lastName}, ${student.user.firstName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty checked_students && cf:contains(checked_students, student.id)}">
                                       <input type="checkbox" name="stid" value="${student.id}" checked="checked"></c:when>
                                    <c:otherwise>
                                       <input type="checkbox" name="stid" value="${student.id}"></c:otherwise>
                                </c:choose>
                           </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                You don't have students to select.
            </c:otherwise>
        </c:choose>
            <p>
                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Continue</a>
            </p>
        </form>            
        
    </body>
</html>