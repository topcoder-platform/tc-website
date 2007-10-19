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
                    <jsp:param name="node" value="reports"/>
                </jsp:include>

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>Reports</h2>

<p>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec sapien. Fusce suscipit velit eu ipsum. Nulla euismod eros at quam. Nullam ut nisl eget ante consequat tincidunt. Donec ultricies, neque pretium malesuada consectetuer, diam nibh congue nibh, imperdiet vulputate augue lectus ac dui. Vestibulum lorem ligula, rhoncus in, interdum quis, rhoncus vel, ligula. Duis in metus non metus ultricies tempus. Integer sit amet risus sit amet velit aliquam consectetuer. Aenean magna. Proin luctus, dolor ac luctus eleifend, neque ante adipiscing nunc, sed tincidunt nisi orci nec magna. Nullam ultrices accumsan dolor. Integer ante orci, lacinia sit amet, imperdiet vitae, aliquam at, orci. Integer in eros.
</p>

    </div>
</div>

<div class="window" align="left">
    <div class="spacer">
        <c:choose>
            <c:when test="${not empty classrooms}">
                <p align="center">
                Select a classroom:
                </p>
                <c:forEach items="${classrooms}" var="classroom">
                    <c:if test="${classroom.school != oldSchool}">
                        <br clear="all" />
                        <h1><span class="bg"><span class="spacer">${classroom.school.name}</span></span></h1>
                    </c:if>
                    <div class="classroomListing" align="center">
                        <div class="name">
                            <a href="${sessionInfo.servletPath}?module=SelectReport&amp;clsid=${classroom.id}">${classroom.name}</a>
                        </div>
                        <div class="button">
                            <a href="${sessionInfo.servletPath}?module=SelectReport&amp;clsid=${classroom.id}"><img src="/i/ep/buttons/reports.png" alt="Reports" /></a>
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