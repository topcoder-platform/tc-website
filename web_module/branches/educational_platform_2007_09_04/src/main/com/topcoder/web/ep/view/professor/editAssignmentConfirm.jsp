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
        <title>Edit Assignment Confirmation</title>
    
        <script type="text/javascript">
            function submit() {
                var myForm = document.f;
                myForm.submit();
            }
        </script>
    </head>
    
    <body>
        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignmentSubmit"/>
        Assignment Details:<br/>
        <table border="1">
            <tr>
                <td>Classroom</td>
                <td>Start</td>
                <td>End</td>
                <td>Assignment name</td>
                <td>Coder phase length</td>
                <td>Show all scores</td>
                <td>scoreType</td>
                <td>Languages</td>
            </tr>
            <tr>
                <td>${assignment.classroomName}</td>
                <td>${assignment.startDate}</td>
                <td>${assignment.endDate}</td>
                <td>${assignment.assignmentName}</td>
                <td>${assignment.coderPhaseLength}</td>
                <td>${assignment.showAllScores}</td>
                <td>${assignment.scoreType}</td>
                <td>
                    <c:forEach items="${assignment.languages}" var="language">                
                         ${language},
                    </c:forEach>
                </td>                
            </tr>
        </table>
        <br/>        
        Problems:
        <table border="1"> 
            <tr><td>Name</td><td>Points</td></tr>
            <c:forEach items="${assignment.components}" var="component">                
                <tr>
                    <td>${component.problemName}</td>
                    <td>${component.points}</td>
                </tr>
            </c:forEach>
        </table>
        <br/>
            <p>
                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Confirm and save</a>
            </p>
        </form>            
    </body>
</html>