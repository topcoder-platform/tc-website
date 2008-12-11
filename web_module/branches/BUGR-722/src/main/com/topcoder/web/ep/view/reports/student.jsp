<%@ page import="com.topcoder.web.ep.Constants"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.ep.controller.request.reports.StudentReport"%>
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
    <style type="text/css">
    .showText{ display: table-row-group }
    .hideText{ display: none }
    </style>

    <script type="text/javascript">
        function toggleDisplay(objectID,imageID){
           var object = document.getElementById(objectID) 
           if(object.className == 'hideText') {
                object.className = 'showText'; 
                document.images[imageID].src = '/i/ep/buttons/exp_ed_w.png'; 
           }else{
                object.className = 'hideText'; 
                document.images[imageID].src = '/i/ep/buttons/exp_w.png'; 
           }

//           if(object.className == 'dark hideText') {
//                object.className = 'dark showText'; 
//                document.images[imageID].src = '/i/ep/buttons/exp_ed_w.png'; 
//           }else if(object.className == 'dark showText') {
//                object.className = 'dark hideText'; 
//                document.images[imageID].src = '/i/ep/buttons/exp_w.png';
//           }else if(object.className == 'light showText') {
//                object.className = 'light hideText'; 
//                document.images[imageID].src = '/i/ep/buttons/exp_w.png';
//           }else {
//                object.className = 'light showText';
//                document.images[imageID].src = '/i/ep/buttons/exp_ed_w.png';
//           }
          return;
        }

//        function toggleDisplay(objectID){
//           var object = document.getElementById(objectID);
//           if(object.className == 'showText') object.className = 'hideText';
//           else object.className = 'showText';
//           return;
//        }
    </script>
    
<%-- each school requires its own stylesheet, linked in here --%>
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
</head>

<body>
<c:set value="<%=Constants.CLASSROOM_ID%>" var="CLASSROOM_ID"/>
<c:set value="<%=Constants.ASSIGNMENT_ID%>" var="ASSIGNMENT_ID"/>
<c:set value="<%=Constants.COMPONENT_ID%>" var="COMPONENT_ID"/>
<c:set value="<%=Constants.STUDENT_ID%>" var="STUDENT_ID"/>
<c:set value="<%=AssignmentScoreType.TC_SCORE_TYPE%>" var="tc_score_type"/>
<c:set value="<%=AssignmentScoreType.PASSED_SCORE_TYPE%>" var="passed_score_type"/>
<c:set value="<%=AssignmentScoreType.SUCCESS_FAIL_SCORE_TYPE%>" var="success_fail_score_type"/>

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
                    <td align="left" valign="top">
                        <strong>Student:</strong>
                    </td>
                    <td align="left">
                        <div>${student.user.lastName}, ${student.user.firstName} (<tc-webtag:handle coderId='${student.id}'/>)</div>
                        <%-- for later
                        <div>(<a href="">View average for this class</a>)</div>
                        --%>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>

        <table cellpadding="0" cellspacing="0" class="stat" width="100%">
        <thead>
            <tr><td class="title" colspan="5">Student Report</td></tr>
            <tr><td class="header C" colspan="5">${student.user.lastName}, ${student.user.firstName}</td></tr>
            <tr>
                <td class="header" colspan="2"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=StudentReport.ASSIGNMENT_COL.intValue()%>"/>">Assignment</a></td>
                <td class="header C"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=StudentReport.SCORE_COL.intValue()%>"/>">TC Score</a></td>
                <td class="header C"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=StudentReport.NUM_TESTS_COL.intValue()%>"/>">Tests Passed</a></td>
                <td class="header C"><a href="${sessionInfo.servletPath}?<tc-webtag:sort includeParams='true' column="<%=StudentReport.PERCENT_TESTS_COL.intValue()%>"/>">
                <c:choose><c:when test="${is_student}">
                Pass / Fail
                </c:when><c:otherwise>
                % Tests Passed
                </c:otherwise></c:choose>
                </a></td>
            </tr>
        </thead>
            <%int i = 0;%>
            <c:forEach items="${results}" var="result">
            <c:set value="value C" var="score_column_class"/>
            <c:set value="value C" var="num_tests_column_class"/>
            <c:set value="value C" var="percent_test_column_class"/>
            
            <c:choose>
                <c:when test="${not is_student && result.scoreType == tc_score_type}">
                    <c:set value="highlight C" var="score_column_class"/>
                </c:when>
                <c:when test="${not is_student && result.scoreType == passed_score_type}">
                    <c:set value="highlight C" var="num_tests_column_class"/>
                </c:when>
                <c:when test="${not is_student && result.scoreType == success_fail_score_type}">
                    <c:set value="highlight C" var="percent_test_column_class"/>
                </c:when>
            </c:choose>
            <tbody>
                <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                    <td class="value" colspan="2">
                    <a href="javascript:toggleDisplay('ref_<%=i%>','switch_<%=i%>');" onfocus="this.blur();"><img src="/i/ep/buttons/exp_w.png" alt="Expand" name="switch_<%=i%>"/></a>
                    <a href="${sessionInfo.servletPath}?module=AssignmentReport&amp;${ASSIGNMENT_ID}=${result.assignmentId}">${result.assignment}</a>
                    </td>

                    <td class="${score_column_class}">
                        <c:choose><c:when test="${is_student && result.scoreType != tc_score_type}">
                            &nbsp;
                        </c:when><c:otherwise>
                            <fmt:formatNumber value="${result.assignmentScore}"  minFractionDigits="2" maxFractionDigits="2"/>
                        </c:otherwise></c:choose>
                    </td>
                    
                    <td class="${num_tests_column_class}">
                        <c:choose><c:when test="${is_student && result.scoreType != passed_score_type}">
                            &nbsp;
                        </c:when><c:otherwise>
                            <c:choose>
                                <c:when test="${result.assignmentNumTestsPassed == -1}">
                                    N/A
                                </c:when>
                                <c:otherwise>
                                    ${result.assignmentNumTestsPassed}
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise></c:choose>
                    </td>
                    
                    <td class="${percent_test_column_class}">
                        <c:choose><c:when test="${is_student && result.scoreType != success_fail_score_type}">
                            &nbsp;
                        </c:when><c:otherwise>
                            <c:choose>
                                <c:when test="${result.assignmentNumTestsPassed == -1}">
                                    N/A
                                </c:when>
                                <c:otherwise>
                                    <c:choose><c:when test="${is_student}">
                                        <c:choose><c:when test="${result.assignmentPercentTestsPassed == 100}">
                                            Pass
                                        </c:when><c:otherwise>
                                            Fail
                                        </c:otherwise></c:choose>
                                    </c:when><c:otherwise>
                                        <fmt:formatNumber value="${result.assignmentPercentTestsPassed}"  minFractionDigits="0" maxFractionDigits="0"/>%
                                    </c:otherwise></c:choose>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise></c:choose>
                    </td>
                </tr>
            </tbody>
            <tbody id="ref_<%=i%>" class="hideText">
                        <c:forEach items="${result.details}" var="detail">
                            
                            <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                                <td class="value">
                                    <div style="margin-left: 20px;">
                                    <a href="${sessionInfo.servletPath}?module=ProblemAssignmentReport&amp;${ASSIGNMENT_ID}=${result.assignmentId}&amp;${COMPONENT_ID}=${detail.componentId}">${detail.component}</a>
                                    <c:if test="${not is_student || result.scoreType == tc_score_type}">
                                        - ${detail.possiblePoints}
                                    </c:if>
                                    </div>
                                </td>
                                <c:choose><c:when test="${detail.numTestsPassed == -1 || is_student && student.id != sessionInfo.userId}">
                                    <td class="value C" width="1%">
                                        <img src="/i/ep/buttons/viewSubmissionNA.png" alt="View Submission" />
                                    </td>
                                </c:when><c:otherwise>
                                    <td class="value C" width="1%">
                                        <a href="${sessionInfo.servletPath}?module=ViewSubmission&amp;${ASSIGNMENT_ID}=${result.assignmentId}&amp;${COMPONENT_ID}=${detail.componentId}&amp;${STUDENT_ID}=${student.id}"><img src="/i/ep/buttons/viewSubmission.png" alt="View Submission" /></a>
                                    </td>
                                </c:otherwise></c:choose>
                                <td class="${score_column_class}">
                                    <c:choose><c:when test="${is_student && result.scoreType != tc_score_type}">
                                        &nbsp;
                                    </c:when><c:otherwise>
                                        <fmt:formatNumber value="${detail.score}"  minFractionDigits="2" maxFractionDigits="2"/>
                                    </c:otherwise></c:choose>
                                </td>
                                <td class="${num_tests_column_class}">
                                    <c:choose><c:when test="${is_student && result.scoreType != passed_score_type}">
                                        &nbsp;
                                    </c:when><c:otherwise>
                                        <c:choose>
                                            <c:when test="${detail.numTestsPassed == -1}">
                                                N/A
                                            </c:when>
                                            <c:otherwise>
                                                ${detail.numTestsPassed}
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise></c:choose>
                                </td>
                                <td class="${percent_test_column_class}">
                                    <c:choose><c:when test="${is_student && result.scoreType != success_fail_score_type}">
                                        &nbsp;
                                    </c:when><c:otherwise>
                                        <c:choose>
                                            <c:when test="${detail.numTestsPassed == -1}">
                                                N/A
                                            </c:when>
                                            <c:otherwise>
                                                    <c:choose><c:when test="${is_student}">
                                                        <c:choose><c:when test="${result.assignmentPercentTestsPassed == 100}">
                                                            Pass
                                                        </c:when><c:otherwise>
                                                            Fail
                                                        </c:otherwise></c:choose>
                                                    </c:when><c:otherwise>
                                                        <fmt:formatNumber value="${detail.percentTestsPassed}"  minFractionDigits="0" maxFractionDigits="0"/>%
                                                    </c:otherwise></c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise></c:choose>
                                </td>
                            </tr>
                        </c:forEach>
            </tbody>

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
