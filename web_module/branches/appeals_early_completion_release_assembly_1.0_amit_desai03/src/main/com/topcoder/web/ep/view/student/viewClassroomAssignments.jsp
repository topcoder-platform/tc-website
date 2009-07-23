<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="common-functions" prefix="cf" %>
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
                    <jsp:param name="user" value="student"/>
                    <jsp:param name="node" value="home"/>
                </jsp:include>

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>Assignments</h2>

        <div align="center" style="margin: 20px;">
            <table cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding-right: 10px; font-weight: bold;" align="left">
                        <p>Classroom:</p>
                    </td>
                    <td align="left">
                        <p>${classroom.name}</p>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>


            <c:choose>
                <c:when test="${not empty assignments}">
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                    <tbody>
                        <tr><td class="title" colspan="3">Assignments for this classroom</td></tr>
                        <tr>
                            <td class="header">Assignment</td>
                            <td class="header C">Start</td>
                            <td class="header C">End</td>
                        </tr>
                        <%int i = 0;%>
                        <c:forEach items="${assignments}" var="assignment">                
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value">${assignment.name}</td>
                                <td class="value C"><fmt:formatDate value="${assignment.contest.startDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/></td>
                                <td class="value C"><fmt:formatDate value="${assignment.contest.endDate}" pattern="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/></td>
                            </tr>
                        <%i++;%>
                        </c:forEach>
                    </tbody>
                    </table>
                </c:when>
                <c:otherwise>

                <p align="center">
                    You don't have any assignments for this classroom.
                </p>

                </c:otherwise>
            </c:choose>

    <br clear="all" />
    <div style="margin-top: 10px;">
        <a href="/education/"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
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