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
        
        function checkAll(check) {
            var elements = document.f.elements;
            for (i=0; i<document.f.elements.length; i++) {
                if (document.f.elements[i].type=="checkbox") {
                    document.f.elements[i].checked = (check==true);
                }
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

        <h1><span class="bg"><span class="spacer">Assign to...</span></span></h1>

        <div align="center" style="margin: 40px;">
            <table cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding-right: 10px; font-weight: bold;" align="left">
                        <p>School:</p>
                        <p>Classroom:</p>
                        <p>Academic period:</p>
                        <p>Description:</p>
                        <p>Assignment:</p>
                    </td>
                    <td align="left">
                        <p>classroom.school.name</p>
                        <p>classroom.name</p>
                        <p>classroom.academicPeriod</p>
                        <p>classroom.description</p>
                        <p>${assignment_name}</p>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>

        <div style="float: left width: 350px;">
        <c:choose>
            <c:when test="${not empty activeStudents}">
                <form name="f" action="${sessionInfo.servletPath}" method="post">
                    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignmentStudents"/>
                    <tc-webtag:hiddenInput name="<%=Constants.ASSIGNMENT_ID%>" value="${asid}"/>
                    
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title" colspan="2">Students in this classroom</td></tr>
                        <tr><td class="header">Student</td><td class="headerC">Select</td></tr>
                        <%int i = 0;%>
                        <c:forEach items="${activeStudents}" var="student">
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value">${student.user.lastName}, ${student.user.firstName}</td>
                                <td class="valueC">
                                <c:choose>
                                    <c:when test="${not empty checked_students && cf:contains(checked_students, student.id)}">
                                       <input type="checkbox" name="stid" value="${student.id}" checked="checked"/></c:when>
                                    <c:otherwise>
                                       <input type="checkbox" name="stid" value="${student.id}"/></c:otherwise>
                                </c:choose>
                                </td>
                            </tr>
                        <%i++;%>
                        </c:forEach>
                        <tr>
                            <td width="100%">&nbsp;</td>
                            <td colspan="2" align="center" nowrap="nowrap"><a href="Javascript:checkAll(true)">Select all</a></td>
                        </tr>
                    </table>
                    <div>
                        <div style="float:right;"><a href="javascript:submit()"><img src="/i/ep/buttons/continue.png" alt="Continue" /></a></div>
                    </div>
                </form>
            </c:when>
            <c:otherwise>
               There are no active students in this classroom.
            </c:otherwise>
        </c:choose>
        </div>

    <br clear="all" />
    <div style="margin-top: 10px;">
        <a href="/ep/?module=ViewClassroomAssignments&clsid=${clsid}"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
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