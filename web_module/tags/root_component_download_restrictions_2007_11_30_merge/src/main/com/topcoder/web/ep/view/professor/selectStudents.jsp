<%@ page import="com.topcoder.web.ep.Constants"%>
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

        <h2>Register past students</h2>

<%--
        <table border="1">
            <tr>
                <td>Class</td>
                <td>Term</td>
                <td>Description</td>
            </tr>
            <tr>
                <td>${ec_classroom.name}</td>
                <td>${ec_classroom.academicPeriod}</td>
                <td>${ec_classroom.description}</td>
            </tr>
        </table>
--%>
        
        <form name="f" action="${sessionInfo.servletPath}" method="post">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditClassroomConfirm"/><br/>
        <c:choose>
            <c:when test="${not empty possible_students}">
                <p align="center">
                    The students below were registered for a class with you in the past.<br />Would you like to register any of them for this class?
                </p>

                <div align="center">
                <table cellpadding="0" cellspacing="0" class="stat">
                <tbody>
                    <tr><td class="header">Student (Handle)</td><td class="header C">Select</td></tr>
                    <%int i = 0;%>
                    <c:forEach items="${possible_students}" var="student">                
                        <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                            <td class="value">${student.user.lastName}, ${student.user.firstName} (<tc-webtag:handle coderId='${student.id}'/>)</td>
                            <td class="value C">
                                <c:choose>
                                    <c:when test="${not empty checked_students && cf:contains(checked_students, student.id)}">
                                       <input type="checkbox" name="stid" value="${student.id}" checked="checked"></c:when>
                                    <c:otherwise>
                                       <input type="checkbox" name="stid" value="${student.id}"></c:otherwise>
                                </c:choose>
                           </td>
                        </tr>
                    <%i++;%>
                    </c:forEach>
                </table>
                </div>
            </c:when>
            <c:otherwise>
                You don't have students to select.
            </c:otherwise>
        </c:choose>
            <div align="center">
                <a href="javascript:submit()"><img src="/i/ep/buttons/continue.png" alt="Continue" /></a>
            </div>
        </form>            
        
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