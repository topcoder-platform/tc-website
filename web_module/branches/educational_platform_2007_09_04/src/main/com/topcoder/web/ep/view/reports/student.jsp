<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.ep.controller.request.professor.reports.StudentReport"%>
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

            <jsp:include page="../header.jsp">
                <jsp:param name="schoolname" value="University of TopCoder"/>
            </jsp:include>

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

        <div style="margin: 20px;" align="center">
            <table cellpadding="4" cellspacing="0">
            <tbody>
                <tr>
                    <td align="left">
                        <strong>School:</strong>
                    </td>
                    <td align="left">
                        ${classroom.school.name}
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <strong>Class:</strong>
                    </td>
                    <td align="left">
                        ${classroom.name}
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <strong>Term:</strong>
                    </td>
                    <td align="left">
                        ${classroom.academicPeriod}
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <strong>Student:</strong>
                    </td>
                    <td align="left">
                        <div>${student.user.lastName}, ${student.user.firstName}</div>
                        <%-- for later
                        <div>(<a href="">View average for this class</a>)</div>
                        --%>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>

        <table cellpadding="0" cellspacing="0" class="stat" width="100%">
            <tr><td class="title" colspan="4">Student Report</td></tr>
            <tr><td class="headerC" colspan="4">${student.user.lastName}, ${student.user.firstName}</td></tr>
            <tr>
                <td class="header"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=StudentReport.ASSIGNMENT_COL.intValue()%>"/>">Assignment</a></td>
                <td class="headerC"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=StudentReport.SCORE_COL.intValue()%>"/>">Score</a></td>
                <td class="headerC"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=StudentReport.NUM_TESTS_COL.intValue()%>"/>">Tests Passed</a></td>
                <td class="headerC"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=StudentReport.PERCENT_TESTS_COL.intValue()%>"/>">% Tests Passed</a></td>
            </tr>
            <%int i = 0;%>
            <c:forEach items="${results}" var="result">                
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="value"><a href="${sessionInfo.servletPath}?module=AssignmentReport&amp;asid=${result.assignmentId}">${result.assignment}</a></td>
                    <td class="valueC">${result.score}</td>
                    <td class="valueC">ToDo</td>
                    <td class="valueC">ToDo</td>
                </tr>
                <%i++;%>
            </c:forEach>
<%-- for later
            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                <td class="value">Avg</td>
                <td class="valueC">210</td>
                <td class="valueC">10</td>
                <td class="valueC">80%</td>
            </tr>
--%>
        </table>
    <div style="margin-top: 10px;">
        <a href="${sessionInfo.servletPath}?module=SelectReport&amp;clsid=${classroom.id}"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
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
