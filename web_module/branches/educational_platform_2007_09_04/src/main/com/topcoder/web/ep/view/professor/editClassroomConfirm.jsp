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
        <title>Edit Classroom Students Confirmation</title>
    
        <script type="text/javascript">
            function submit() {
                var myForm = document.f;
                myForm.submit();
            }
        </script>
    </head>
    
    
    <body>
        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditClassroomSubmit"/><br/>
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
                Selected Students:
                <table> 
                    <tr><td>Student name</td></tr>
                    <c:forEach items="${students}" var="student">                
                        <tr>
                            <td>${student.user.lastName}, ${student.user.firstName}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                No students were selected for this classroom.
            </c:otherwise>
        </c:choose>
        <br/>
            <p>
                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Continue</a>
            </p>
        </form>            
    </body>
</html>