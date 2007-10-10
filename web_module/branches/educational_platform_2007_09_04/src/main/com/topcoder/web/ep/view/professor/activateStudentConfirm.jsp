<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Education Platform</title>
    <meta http-equiv="content-type" 
        content="text/html;charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
    <%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
    <script type="text/javascript">
        function submit() {
            var myForm = document.f;
            myForm.submit();
        }
    </script>
</head>
    
<body>

<div align="center">
    <div id="widther">
        <img src="/i/ep/widtherN.png" alt="" style="display:block;" />
        <div id="pageFrame">

            <jsp:include page="../header.jsp">
                <jsp:param name="schoolname" value="University of TopCoder"/>
            </jsp:include>

            <div id="pageContent" align="left">
                <div class="N">
                    <img src="/i/ep/contentNW.png" alt="" class="NW" />
                    <img src="/i/ep/contentNE.png" alt="" class="NE" />
                </div>
                <div class="spacer">

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>Confirm this Student?</h2>

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

    <div style="margin-top: 10px;">
        <a href="/ep?module=ViewClassroomDetails&amp;clsid=${classroom.id}"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
    </div>

    </div>
</div>

<%-- CONTENT ENDS --%>

                </div>
                <div class="S">
                    <img src="/i/ep/contentSW.png" alt="" class="SW" />
                    <img src="/i/ep/contentSE.png" alt="" class="SE" />
                </div>
            </div>

            <jsp:include page="../footer.jsp"/>

        </div>
        <img src="/i/ep/widtherS.png" alt="" style="display:block;" />
    </div>
</div>

</body>
</html>