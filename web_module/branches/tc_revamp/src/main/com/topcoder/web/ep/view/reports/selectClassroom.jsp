<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
    <%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
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
                    <jsp:param name="user" value="${user_type}"/>
                    <jsp:param name="node" value="reports"/>
                </jsp:include>

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>Reports</h2>

<p>
Reporting is an integral part of the Educational Platform.  Below you can select a classroom and view various statistics about how the students performed on the assignments given to them.
</p>

    </div>
</div>

<div class="window" align="left">
    <div class="spacer">
        <c:choose>
            <c:when test="${not empty classrooms}">
                <h2>Select a class</h2>
                <c:forEach items="${classrooms}" var="classroom">
                    <c:if test="${classroom.school != oldSchool}">
                        <br clear="all" />
                        <h1><span class="bg"><span class="spacer">${classroom.school.name}</span></span></h1>
                    </c:if>
                    <div class="classroomListing" align="center">
                        <div class="name">
                            <a href="${sessionInfo.servletPath}?module=SelectReport&amp;${CLASSROOM_ID}=${classroom.id}">${classroom.name}</a>
                        </div>
                        <div class="button">
                            <a href="${sessionInfo.servletPath}?module=SelectReport&amp;${CLASSROOM_ID}=${classroom.id}"><img src="/i/ep/buttons/reports.png" alt="Reports" /></a>
                        </div>
                    </div>
                    <c:set var="oldSchool" value="${classroom.school}"/>
                </c:forEach>
                <br clear="all" />
            </c:when>
            <c:otherwise>
                    <p align="center">
                    You don't have active classrooms
                    </p>
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