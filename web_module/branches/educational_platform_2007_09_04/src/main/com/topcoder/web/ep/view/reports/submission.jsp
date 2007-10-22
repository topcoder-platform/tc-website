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
    <script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
<%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
</head>

<body>
    <div style="margin: 10px;">
        <table cellpadding="4" cellspacing="0">
        <tbody>
            <tr>
                <td align="left">
                    <strong>Name</strong>
                </td>
                <td align="left">
                    ${student.user.lastName}, ${student.user.firstName} (<tc-webtag:handle coderId='${student.id}'/>)
                </td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Assignment</strong>
                </td>
                <td align="left">
                    ${assignment.name}
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
                    <fmt:formatNumber value="${percentTestPassed}"  minFractionDigits="0" maxFractionDigits="0"/> %
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
        
        ${submission}

        <c:choose>
            <c:when test="${not empty system_tests}">
                <table border="1">
                    <tr>
                        <td>Test arguments</td>
                        <td>Expected results</td>
                        <td>Success</td>
                    </tr>
                    <c:forEach items="${system_tests}" var="test">
                        <tr>
                            <td>${test.args}</td>
                            <td>${test.expected}</td>
                            <td>
                            <c:choose>
                                <c:when test="${test.succeeded}">
                                    <span class="bigGreen">Passed</span>
                                </c:when>
                                <c:otherwise>
                                    Failed
                                </c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </table>                
            </c:when>
            <c:otherwise>
                There are no system tests results to show.
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>