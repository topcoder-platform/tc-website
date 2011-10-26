<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <script language="JavaScript" type="text/javascript" src="/js/ep/arena.js"></script>
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

    <div class="submissionContainer">
        <div style="float:right;">
            <a href="${sessionInfo.servletPath}?module=SelectReport&amp;${CLASSROOM_ID}=${classroom.id}"><img src="/i/ep/buttons/back.png" alt="Back"/></a>
        </div>

        <h2>Submission</h2>

        <table cellpadding="4" cellspacing="0">
        <tbody>
            <tr>
                <td align="left">
                    <strong>Name</strong>
                </td>
                <td align="left">
                    <a href="${sessionInfo.servletPath}?module=StudentReport&amp;${CLASSROOM_ID}=${classroom.id}&amp;${STUDENT_ID}=${student.id}">${student.user.lastName}, ${student.user.firstName}</a> (<tc-webtag:handle coderId='${student.id}'/>)
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Assignment</strong>
                </td>
                <td align="left">
                    <a href="${sessionInfo.servletPath}?module=AssignmentReport&amp;${ASSIGNMENT_ID}=${assignment.id}">${assignment.name}</a>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Problem</strong>
                </td>
                <td align="left">
                    ${component.problem.name}
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>TC Score</strong>
                </td>
                <td align="left">
                    ${score}
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Tests Passed</strong>
                </td>
                <td align="left">
                    ${numTestPassed}
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>% Tests Passed</strong>
                </td>
                <td align="left">
                    <fmt:formatNumber value="${percentTestPassed}"  minFractionDigits="0" maxFractionDigits="0"/>%
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Time</strong>
                </td>
                <td align="left">
                    ${time}
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Status</strong>
                </td>
                <td align="left">
                    <%-- only include the <span> below if the status is "Finished" --%>
                    <c:choose>
                        <c:when test="${status == 'Succeeded'}">
                            <span class="bigGreen">${status}</span>
                        </c:when>
                        <c:otherwise>
                            ${status}
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </tbody>
        </table>
        
<pre>
${submission}
</pre>

        <c:choose>
            <c:when test="${not empty system_tests}">
                <table cellpadding="0" cellspacing="0" class="stat" width="100%">
                <tbody>
                    <tr>
                        <td class="header">Test arguments</td>
                        <td class="header R">Expected results</td>
                        <td class="header C">Success</td>
                    </tr>
                    <%int i = 0;%>
                    <c:forEach items="${system_tests}" var="test">
                        <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                            <td class="value">${test.args}</td>
                            <td class="value R">${test.expected}</td>
                            <td class="value C">
                            <c:choose>
                                <c:when test="${test.succeeded}">
                                    <span class="bigGreen">Passed</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="bigRed">Failed</span>
                                </c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                </table>                
            </c:when>
            <c:otherwise>
                There are no system tests results to show.
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>