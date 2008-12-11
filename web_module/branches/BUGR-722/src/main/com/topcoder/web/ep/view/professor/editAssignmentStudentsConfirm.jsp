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
<c:set value="<%=Constants.ASSIGNMENT_ID%>" var="ASSIGNMENT_ID"/>

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

        <h1><span class="bg"><span class="spacer">Students</span></span></h1>

        <div align="center" style="margin: 20px;">
            <table cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding-right: 10px; font-weight: bold;" align="left">
                        <p>Assignment:</p>
                    </td>
                    <td align="left">
                        <p>${assignment_name}</p>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>

        <div style="float: left width: 350px;">
            <form name="f" action="${sessionInfo.servletPath}" method="post">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignmentStudentsSubmit"/>
                <tc-webtag:hiddenInput name="${ASSIGNMENT_ID}" value="${asid}"/>
                
                <c:choose>
                <c:when test="${not empty students}">
                    <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                        <tr><td class="title" colspan="2">You have selected the following students for the assignment</td></tr>
                        <tr><td class="header">Student (Handle)</td></tr>
                        <%int i = 0;%>
                        <c:forEach items="${students}" var="student">
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value">${student.user.lastName}, ${student.user.firstName} (<tc-webtag:handle coderId='${student.id}'/>)</td>
                                <tc-webtag:hiddenInput name="<%=Constants.STUDENT_ID%>" value="${student.id}"/>
                            </tr>
                        <%i++;%>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                   This assignment won't have registered students.
                </c:otherwise>
                </c:choose>
                <div>
                    <div style="float:right;"><a href="javascript:submit()"><img src="/i/ep/buttons/continue.png" alt="Continue" /></a></div>
                </div>
            </form>
        </div>

    <br clear="all" />
    <div style="margin-top: 10px;">
        <a href="${sessionInfo.servletPath}?module=EditAssignmentStudents&${ASSIGNMENT_ID}=${asid}"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
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