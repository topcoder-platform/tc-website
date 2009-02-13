<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:include page="../script.jsp" />
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
    <%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
</head>

<body>
<c:set value="<%=Constants.CLASSROOM_ID%>" var="CLASSROOM_ID"/>
<c:set value="<%=Constants.ASSIGNMENT_ID%>" var="ASSIGNMENT_ID"/>
<c:set value="<%=Constants.STUDENT_ID%>" var="STUDENT_ID"/>

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
        <p align="center">
        Select a report:
        </p>

        <div style="float: right; width: 350px;">
            <c:choose>
                <c:when test="${not empty assignments}">
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title" colspan="4">Assignments</td></tr>
                        <tr>
                            <td class="header">Assignment</td>
                            <td class="header C">Assigned</td>
                            <td class="header C">Opened</td>
                            <td class="header C">Finished</td>
                        </tr>
                        <%int i = 0;%>
                        <c:forEach items="${assignments}" var="assignment">                
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value"><a href="${sessionInfo.servletPath}?module=AssignmentReport&amp;${ASSIGNMENT_ID}=${assignment.id}">${assignment.name}</a></td>
                                <td class="value C">${assignment.assigned}</td>
                                <td class="value C">${assignment.opened}</td>
                                <td class="value C">${assignment.finished}</td>
                            </tr>
                        <%i++;%>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title" colspan="4">Assignments</td></tr>
                        <tr>
                            <td class="header">Assignment</td>
                            <td class="header C">Assigned</td>
                            <td class="header C">Opened</td>
                            <td class="header C">Finished<br />(Pass/Fail)</td>
                        </tr>
                        <tr class="light"><td class="value C" colspan="4"><div style="margin: 10px;">There are no assignment reports available.</div></td></tr>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>

        <div style="width: 350px;">
            <c:choose>
                <c:when test="${not empty students}">
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title">Students</td></tr>
                        <tr><td class="header">Student (Handle)</td></tr>
                        <%int i = 0;%>
                        <c:forEach items="${students}" var="student">                
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value"><a href="${sessionInfo.servletPath}?module=StudentReport&amp;${CLASSROOM_ID}=${clsid}&amp;${STUDENT_ID}=${student.id}">${student.user.lastName}, ${student.user.firstName}</a> (<tc-webtag:handle coderId='${student.id}'/>)</td>
                            </tr>
                        <%i++;%>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title">Students</td></tr>
                        <tr><td class="header">Student (Handle)</td></tr>
                        <tr class="light"><td class="value C"><div style="margin: 10px;">There are no student reports available.</div></td></tr>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>

    <br clear="all" />
    <div style="margin-top: 10px;">
        <a href="${sessionInfo.servletPath}"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
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