<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

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
    <script language="JavaScript" type="text/javascript" src="/js/ep/arena.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
<%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
    <script type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.frmLogin.submit();
                return false;
            } else return true;
        }
    </script>
</head>

<body>

<c:set value="<%=Constants.CLASSROOM_ID%>" var="CLASSROOM_ID"/>

<div align="center">
    <div id="widther">
        <img src="/i/ep/widtherN.png" alt="" style="display:block;" />
        <div id="pageFrame">

            <jsp:include page="../header.jsp" />

            <div id="pageContent" align="left">
                <div class="N">
                    <img src="/i/ep/contentNW.png" alt="" class="NW" />
                    <img src="/i/ep/contentNE.png" alt="" class="NE" />
                </div>
                <div class="spacer">

                <jsp:include page="../nav.jsp" >
                    <jsp:param name="user" value="professor"/>
                    <jsp:param name="node" value="home"/>
                </jsp:include>

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>Welcome to the TopCoder Educational Platform</h2>

<p>
The Education Platform extends the TopCoder Algorithm Arena to aid you in teaching computer science and programming at your university.  You can assign problems for your students to complete that will help reinforce the concepts that you are teaching in the classroom.  Additionally, you will be able to see your students' results, including the actual code written.  We at TopCoder hope you find this tool useful and informative.
</p>

    </div>
</div>

<div class="window" align="left">
    <div class="spacer">
<c:choose>
    <c:when test="${not empty classrooms}">
        <h2>Your classes</h2>
        <c:forEach items="${classrooms}" var="classroom">
            <c:if test="${classroom.school != oldSchool}">
            <br clear="all" />
            <h1><span class="bg"><span class="spacer">${classroom.school.name}</span></span></h1>
            </c:if>
            <div class="classroomListing" align="center">
                <div class="name">
                    <a href="${sessionInfo.servletPath}?module=ViewClassroomDetails&amp;${CLASSROOM_ID}=${classroom.id}">${classroom.name}</a>
                </div>
                <div class="button">
                    <a href="${sessionInfo.servletPath}?module=ViewClassroomDetails&amp;${CLASSROOM_ID}=${classroom.id}"><img src="/i/ep/buttons/students.png" alt="Students" /></a>
                </div>
                <div class="button">
                    <a href="${sessionInfo.servletPath}?module=ViewClassroomAssignments&amp;${CLASSROOM_ID}=${classroom.id}"><img src="/i/ep/buttons/assignments.png" alt="Assignments" /></a>
                </div>
                <div class="button">
                    <a href="${sessionInfo.servletPath}professor/?module=EditClassroom&amp;${CLASSROOM_ID}=${classroom.id}"><img src="/i/ep/buttons/edit.png" alt="Edit class" /></a>
                </div>
            </div>
            <c:set var="oldSchool" value="${classroom.school}"/>
        </c:forEach>
        <br clear="all" />
        <div align="center" style="border-top: 1px solid #969696; padding-top: 10px;">
            <a href="${sessionInfo.servletPath}professor/?module=EditClassroom"><img src="/i/ep/buttons/addClass.png" alt="Add class" /></a>
        </div>
    </c:when>
    <c:otherwise>
        <p align="center">
            <strong>Ready to get started?</strong>
        </p>
        <div align="center"><a href="${sessionInfo.servletPath}professor/?module=EditClassroom"><img src="/i/ep/buttons/addClass.png" alt="Add class" /></a></div>
    </c:otherwise>
</c:choose>
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