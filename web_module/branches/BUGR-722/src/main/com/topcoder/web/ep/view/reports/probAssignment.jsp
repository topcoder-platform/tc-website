<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ page import="com.topcoder.web.ep.controller.request.reports.AssignmentReport"%>
<%@ page import="com.topcoder.web.ep.model.AssignmentScoreType"%>
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
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_ep"/>
    </jsp:include>
<%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
</head>

<body>

<c:set value="<%=AssignmentScoreType.TC_SCORE_TYPE%>" var="tc_score_type"/>
<c:set value="<%=AssignmentScoreType.PASSED_SCORE_TYPE%>" var="passed_score_type"/>
<c:set value="<%=AssignmentScoreType.SUCCESS_FAIL_SCORE_TYPE%>" var="success_fail_score_type"/>
<c:set value="<%=Constants.CLASSROOM_ID%>" var="CLASSROOM_ID"/>
<c:set value="<%=Constants.ASSIGNMENT_ID%>" var="ASSIGNMENT_ID"/>
<c:set value="<%=Constants.COMPONENT_ID%>" var="COMPONENT_ID"/>
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

        <div style="margin: 20px;" align="center">
            <table cellpadding="4" cellspacing="0">
            <tbody>
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
                        <strong>Assignment:</strong>
                    </td>
                    <td align="left" valign="top">
                        <div>${assignment.name}</div>
                        <%-- for later
                        <div>(<a href="">View average for this class</a>)</div>
                        --%>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <strong>Problem:</strong>
                    </td>
                    <td align="left">
                        <div>
                            <a href="Javascript:openWin('/education/?module=ViewProblem&amp;${COMPONENT_ID}=${component.id}','problemStatement',600,600);">
                                ${component.problem.name}
                            </a>
                            <c:if test="${empty score_type || score_type == tc_score_type}">
                                - ${component.problem.proposedDifficulty.pointValue} 
                            </c:if>
                        </div>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>

        <table cellpadding="0" cellspacing="0" class="stat" width="100%">
            <tr><td class="title" colspan="5">Assignment Report</td></tr>
            <tr><td class="header C" colspan="5">${assignment.name}</td></tr>
            <tr><td class="header C" colspan="5">${component.problem.name}</td></tr>
            <tr>
                <td class="header"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=AssignmentReport.STUDENT_COL.intValue()%>"/>">Student</a></td>
                <td class="header C"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=AssignmentReport.SCORE_COL.intValue()%>"/>">TC Score</a></td>
                <td class="header C"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=AssignmentReport.NUM_TESTS_COL.intValue()%>"/>">Tests Passed</a></td>
                <td class="header C"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=AssignmentReport.PERCENT_TESTS_COL.intValue()%>"/>">
                <c:choose><c:when test="${not empty score_type}">
                Pass / Fail
                </c:when><c:otherwise>
                % Tests Passed
                </c:otherwise></c:choose>
                </a></td>
                <td class="header" width="1%">&nbsp;</td>
            </tr>
            
            <c:set value="value C" var="score_column_class"/>
            <c:set value="value C" var="num_tests_column_class"/>
            <c:set value="value C" var="percent_test_column_class"/>
            
            <c:choose>
                <c:when test="${not empty selected_score_type && selected_score_type == tc_score_type}">
                    <c:set value="highlight C" var="score_column_class"/>
                </c:when>
                <c:when test="${not empty selected_score_type && selected_score_type == passed_score_type}">
                    <c:set value="highlight C" var="num_tests_column_class"/>
                </c:when>
                <c:when test="${not empty selected_score_type && selected_score_type == success_fail_score_type}">
                    <c:set value="highlight C" var="percent_test_column_class"/>
                </c:when>
            </c:choose>
            
            <%int i = 0;%>
            <c:forEach items="${results}" var="result">                
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="value"><a href="${sessionInfo.servletPath}?module=StudentReport&amp;${CLASSROOM_ID}=${classroom.id}&amp;${STUDENT_ID}=${result.studentId}">${result.student}</a> (<tc-webtag:handle coderId='${result.studentId}'/>)</td>
                    <td class="${score_column_class}">
                    <c:choose><c:when test="${not empty score_type && score_type != tc_score_type}">
                        &nbsp;
                    </c:when><c:otherwise>
                        <fmt:formatNumber value="${result.score}"  minFractionDigits="2" maxFractionDigits="2"/>
                    </c:otherwise></c:choose>
                    </td>
                    <td class="${num_tests_column_class}">
                    <c:choose><c:when test="${not empty score_type && score_type != passed_score_type}">
                        &nbsp;
                    </c:when><c:otherwise>
                        <c:choose>
                            <c:when test="${result.numTestsPassed == -1}">
                                N/A
                            </c:when>
                            <c:otherwise>
                                ${result.numTestsPassed}
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise></c:choose>
                    </td>
                    <td class="${percent_test_column_class}">
                    <c:choose><c:when test="${not empty score_type && score_type != success_fail_score_type}">
                        &nbsp;
                    </c:when><c:otherwise>
                        <c:choose>
                            <c:when test="${result.numTestsPassed == -1}">
                                N/A
                            </c:when>
                            <c:otherwise>
                                <c:choose><c:when test="${not empty score_type}">
                                    <c:choose><c:when test="${result.percentTestsPassed == 100}">
                                        Pass
                                    </c:when><c:otherwise>
                                        Fail
                                    </c:otherwise></c:choose>
                                </c:when><c:otherwise>
                                    <fmt:formatNumber value="${result.percentTestsPassed}"  minFractionDigits="0" maxFractionDigits="0"/> %
                                </c:otherwise></c:choose>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise></c:choose>
                    </td>
                    <td class="value C">
                        <c:choose><c:when test="${result.numTestsPassed == -1 || not empty score_type && sessionInfo.userId != result.studentId}">
                            <img src="/i/ep/buttons/viewSubmissionNA.png" alt="View Submission" />
                        </c:when><c:otherwise>
                            <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;${ASSIGNMENT_ID}=${assignment.id}&amp;${COMPONENT_ID}=${component.id}&amp;${STUDENT_ID}=${result.studentId}"><img src="/i/ep/buttons/viewSubmission.png" alt="View submission" /></a>
                        </c:otherwise></c:choose>
                    </td>
                </tr>
                <%i++;%>
            </c:forEach>
<%-- for later
            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                <td class="value">Avg</td>
                <td class="value C">210</td>
                <td class="value C">10</td>
                <td class="value C">80%</td>
            </tr>
--%>
        </table>
    <div style="margin-top: 10px;">
        <a href="${sessionInfo.servletPath}?module=SelectReport&amp;${CLASSROOM_ID}=${classroom.id}"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
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
