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

        <h1><span class="bg"><span class="spacer">Classroom details</span></span></h1>
        <table cellpadding="0" cellspacing="0" class="stat">
            <tr>
                <td class="header">School</td>
                <td class="header">Classroom</td>
                <td class="header">Academic period</td>
                <td class="header">Description</td>
            </tr>
            <tr class="light">
                <td class="value">${classroom.school.name}</td>
                <td class="value">${classroom.name}</td>
                <td class="value">${classroom.academicPeriod}</td>
                <td class="value">${classroom.description}</td>
            </tr>
        </table>
        <div>
            <a href="/ep?module=EditClassroom&amp;clsid=${classroom.id}"><img src="/i/ep/buttons/edit.png" alt="Edit classroom" /></a>
        </div>

        <c:choose>
            <c:when test="${not empty activeStudents}">
                <form name="fActive" action="${sessionInfo.servletPath}" method="post">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="DeactivateStudent"/><br />
                    <tc-webtag:hiddenInput name="<%=Constants.CLASSROOM_ID%>" value="${classroom.id}"/><br />
                    Active Students:
                    <table cellpadding="0" cellspacing="0" class="stat">
                        <tr><td class="header">Student name</td><td class="header">&nbsp;</td></tr>
                        <%int i = 0;%>
                        <c:forEach items="${activeStudents}" var="student">
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value">${student.user.lastName}, ${student.user.firstName}</td>
                                <td class="value"><input type="checkbox" name="stid" value="${student.id}"></td>
                            </tr>
                        <%i++;%>
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
        <br />
        <c:choose>
            <c:when test="${not empty pendingStudents}">
                <form name="f" action="${sessionInfo.servletPath}" method="post">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value=""/><br />
                    <tc-webtag:hiddenInput name="<%=Constants.CLASSROOM_ID%>" value="${classroom.id}"/><br />
                    Pending Students:
                    <table cellpadding="0" cellspacing="0" class="stat">
                        <tr><td class="header">Student name</td><td class="header">&nbsp;</td></tr>
                        <%int i = 0;%>
                        <c:forEach items="${pendingStudents}" var="student">                
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value">${student.user.lastName}, ${student.user.firstName}</td>
                                <td class="value"><input type="checkbox" name="stid" value="${student.id}"></td>
                            </tr>
                        <%i++;%>
                        </c:forEach>
                    </table>
                    <div>
                        <div style="float:left; margin-right: 10px;"><a href="javascript:submit('activate')"><img src="/i/ep/buttons/activate.png" alt="Activate" /></a></div>
                        <div style="float:left;"><a href="javascript:submit('deactivate')"><img src="/i/ep/buttons/reject.png" alt="Reject" /></a></div>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
                There are no pending students in this classroom.
            </c:otherwise>
        </c:choose>
    <br /><br />
        <c:choose>
            <c:when test="${not empty assignments}">
                Classroom's assignments:
                <table border="1">
                    <tr><td>Name</td><td>Start</td><td>End</td><td>Assigned</td><td>Finished (succeeded/failed)</td><td>&nbsp;</td></tr>
                    <c:forEach items="${assignments}" var="assignment">                
                        <tr>
                            <td>${assignment.name}</td>
                            <td>${assignment.contest.startDate}</td>
                            <td>${assignment.contest.endDate}</td>
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
        <br /><br />
        <a href="/ep?module=EditAssignment&amp;clsid=${classroom.id}">Add new assignment</a>
    <br /><br />
    <a href="/ep/">Back</a>

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