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
    <jsp:include page="../script.jsp" />
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
                    <jsp:param name="node" value="home"/>
                </jsp:include>

<%-- CONTENT BEGINS --%>

<div class="window" align="left">
    <div class="spacer">

        <h2>Assignments</h2>

    <form name="f" action="${sessionInfo.servletPath}" method="post">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignmentSubmit"/>

        <p align="center">
            Are you sure you want to add/update this assignment?
        </p>

        <div align="center" style="margin: 20px;">
            <table cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td style="padding-right: 10px; font-weight: bold;" align="left">
                        <p>Classroom</p>
                        <p>Start</p>
                        <p>End</p>
                        <p>Assignment name</p>
                        <p>Coder phase length</p>
                        <p>Show all scores</p>
                        <p>scoreType</p>
                        <p>Languages</p>
                    </td>
                    <td align="left">
                        <p>${ea_assignment.classroomName}</p>
                        <p><fmt:formatDate value="${ea_assignment.startDate}" pattern="yyyy.MM.dd HH:mm"/></p>
                        <p><fmt:formatDate value="${ea_assignment.endDate}" pattern="yyyy.MM.dd HH:mm"/></p>
                        <p>${ea_assignment.assignmentName}</p>
                        <p>${ea_assignment.coderPhaseLength}</p>
                        <p>
                            <c:choose>
                                <c:when test="${ea_assignment.showAllScores == 1}">Yes</c:when>
                                <c:otherwise>No</c:otherwise>
                            </c:choose>
                        </p>
                        <p>${assignment_score_type}</p>
                        <p>${languages}</p>
                    </td>
                </tr>
            </tbody>
            </table>
        </div>

    <c:if test="${empty ea_assignment.roundId}">
        <div align="center">
            <div style="width:350px;">

                <table cellpadding="0" cellspacing="0" class="stat">
                    <tr><td class="title" colspan="2">Problem set: ${problem_set_name}</td></tr>
                    <tr><td class="header" width="100%">Problem</td><td class="headerR">Points</td></tr>
                    <%int i = 0;%>
                    <c:forEach items="${ea_assignment.components}" var="component">                
                        <tr class="<%=(i%2==0 ? "light" : "dark")%>">
                            <td class="value">${component.problemName}</td>
                            <td class="valueR">${component.points}</td>
                        </tr>
                    <%i++;%>
                    </c:forEach>
                </table>
            </div>
        </div>
    </c:if>

        <div align="center">
            <a href="javascript:submit()"><img src="/i/ep/buttons/confirm.png" alt="Confirm" /></a>
        </div>
    </form>            

    <div style="margin-top: 10px;">
        <c:choose>
            <c:when test="empty ea_assignment.roundId">
                <a href="/ep/?module=EditAssignment&clsid=${ea_assignment.classroomId}"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
            </c:when>
            <c:otherwise>
                <a href="/ep/?module=EditAssignment&asid=${ea_assignment.roundId}"><img src="/i/ep/buttons/back.png" alt="Back" /></a>
            </c:otherwise>
        </c:choose>
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