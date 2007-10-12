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
    
    <script type="text/javascript">
        function submit() {
            var myForm = document.f;
            myForm.submit();
        }
    </script>
</head>


<body>
    <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SelfRegisterConfirm"/>
        You will be registering to the following classrooms: <br/>
        <table border="1"> 
            <tr><td>School</td><td>Professor</td><td>Classroom</td><td>Term</td><td>Description</td></tr>
            <c:forEach items="${classrooms}" var="classroom">                
                <tr>
                    <td>${school.name}</td>
                    <td>${classroom.professor.user.lastName}, ${classroom.professor.user.firstName}</td>
                    <td>${classroom.name}</td>
                    <td>${classroom.academicPeriod}</td>
                    <td>${classroom.description}</td>
                </tr>
            </c:forEach>
        </table> 
            <p>
                <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Submit</a>or
                <a href="/ep" class="button" style="width: 60px; margin-right: 10px;">Cancel</a>
            </p>
        </form>            
</body>
</html>