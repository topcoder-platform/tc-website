<%--
  - Author: pulky, snow01, FireIce, lmmortal, TCSASSEMBLER
  - Version: 1.6
  - Since: TCS Release 2.2.2
  - Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists the members of the review board corresponding to the specified project type.
  - It displays the list of reviewers along with their handles and photos. The page also contains the links for
  - viewing Design and Development review boards members.
  - This is an exhaustive refactor and generalization from existing "Meet the Review Board" JSP files.
  - In this release, it will be used for Conceptualization, Specification and Application Testing project types.
  -
  - Version 1.1 (Studio Coding In Online Review) changes: added support for new UI Prototype, RIA Build and
  - RIA Component competitions.
  -
  - Version 1.2 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites
  - and added support for new Test Scenarios competitions.
  -
  - Version 1.3 (Specification Review Integration 1.0) Change Notes:
  - added support for handling new contest types.
  -
  - Version 1.4 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) Change Notes:
  - added support for handling new content creation competitions.
  -
  - Version 1.5 (Add Reporting Contest Type) Change Notes:
  - added support for handling new reporting competitions.
  -
  - Version 1.6 (Release Assembly - TopCoder BugHunt Competition Integration) Change Notes:
  - added support for handling new Bug Hunt competitions.
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- Variables to use JSTL --%>
<c:set var="PROJECT_TYPE_ID" value="<%=Constants.PROJECT_TYPE_ID%>"/>
<c:set var="CONCEPTUALIZATION_PROJECT_TYPE" value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>"/>
<c:set var="SPECIFICATION_PROJECT_TYPE" value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>"/>
<c:set var="TEST_SUITES_PROJECT_TYPE" value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>"/>
<c:set var="TEST_SCENARIOS_PROJECT_TYPE" value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>"/>
<c:set var="UI_PROTOTYPE_PROJECT_TYPE" value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" />
<c:set var="RIA_BUILD_PROJECT_TYPE" value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" />
<c:set var="RIA_COMPONENT_PROJECT_TYPE" value="<%=Constants.RIA_COMPONENT_PROJECT_TYPE%>" />
<c:set var="CONTENT_CREATION_PROJECT_TYPE" value="<%=Constants.CONTENT_CREATION_PROJECT_TYPE%>" />
<c:set var="REPORTING_PROJECT_TYPE" value="<%=Constants.REPORTING_PROJECT_TYPE%>" />
<c:set var="BUG_HUNT_PROJECT_TYPE" value="<%=Constants.BUG_HUNT_PROJECT_TYPE%>" />

<c:set var="projectType" value="${param[PROJECT_TYPE_ID]}"/>

<c:choose>
    <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Conceptualization"/>
    </c:when>
    <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Specification"/>
    </c:when>
    <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Suites"/>
    </c:when>
    <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Test Scenarios"/>
    </c:when>
    <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="UI Prototype"/>
    </c:when>
    <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="RIA Build"/>
    </c:when>
    <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="RIA Component"/>
    </c:when>
    <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Content Creation"/>
    </c:when>
    <c:when test="${projectType == REPORTING_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Reporting"/>
    </c:when>
    <c:when test="${projectType == BUG_HUNT_PROJECT_TYPE}">
        <c:set var="projectTypeDesc" value="Bug Hunt"/>
    </c:when>
</c:choose>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>${projectTypeDesc} Review Board at TopCoder</title>
        <jsp:include page="/script.jsp"/>
        <jsp:include page="/style.jsp">
            <jsp:param name="key" value="tc_stats"/>
        </jsp:include>
    </head>
    <body>
        <c:choose>
            <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                <jsp:include page="/top.jsp">
                    <jsp:param name="level1" value="conceptualization"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                <jsp:include page="/top.jsp">
                    <jsp:param name="level1" value="specification"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
                <jsp:include page="/top.jsp">
                    <jsp:param name="level1" value="test_suites"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
                <jsp:include page="/top.jsp">
                    <jsp:param name="level1" value="test_scenarios"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="ui_prototype"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="ria_build"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="ria_component"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="content_creation"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == REPORTING_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="reporting"/>
                </jsp:include>
            </c:when>
            <c:when test="${projectType == BUG_HUNT_PROJECT_TYPE}">
                <jsp:include page="/top.jsp" >
                    <jsp:param name="level1" value="bug_hunt"/>
                </jsp:include>
            </c:when>
        </c:choose>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <!-- Left Column Begins -->
                <td width="180">
                    <c:choose>
                        <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="conceptualization_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="specification_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="test_suites_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="test_scenarios_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="ui_prototype_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="ria_build_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="ria_component_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="content_creation_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == REPORTING_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="reporting_review_board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == BUG_HUNT_PROJECT_TYPE}">
                            <jsp:include page="/includes/global_left.jsp">
                                <jsp:param name="node" value="bug_hunt_review_board"/>
                            </jsp:include>
                        </c:when>
                    </c:choose>
                </td>
                <!-- Left Column Ends -->

                <!-- Gutter Begins -->
                <td width="10"><img src="/i/clear.gif" width="10" height="1" alt=""></td>
                <!-- Gutter Ends -->

                <!-- Center Column Begins -->
                <td class="bodyText" width="100%">
                    <c:choose>
                        <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="conceptualization"/>
                                <jsp:param name="title" value="Meet the Conceptualization Review Board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="specification"/>
                                <jsp:param name="title" value="Meet the Specification Review Board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="test_suites"/>
                                <jsp:param name="title" value="Meet the Test Suites Review Board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="test_scenarios"/>
                                <jsp:param name="title" value="Meet the Test Scenarios Review Board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="ui_prototype"/>
                                <jsp:param name="title" value="Meet the UI Prototype Review Board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="ria_build"/>
                                <jsp:param name="title" value="Meet the RIA Build Review Board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="ria_component"/>
                                <jsp:param name="title" value="Meet the RIA Component Review Board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="content_creation"/>
                                <jsp:param name="title" value="Meet the Content Creation Review Board"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == BUG_HUNT_PROJECT_TYPE}">
                            <jsp:include page="/page_title.jsp">
                                <jsp:param name="image" value="bug_hunt"/>
                                <jsp:param name="title" value="Meet the Bug Hunt Review Board"/>
                            </jsp:include>
                        </c:when>
                    </c:choose>

                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td class="bodyText"><img src="/i/clear.gif" width="240" height="1" border="0" alt=""><br>
                                <p align="right">
                                    <a href="/tc?module=ReviewBoard&amp;pt=1" class="bodyText">
                                        <strong>Go to Design Review Board</strong>
                                    </a>
                                </p>

                                <p align="right">
                                    <a href="/tc?module=ReviewBoard&amp;pt=2" class="bodyText">
                                        <strong>Go to Development Review Board</strong>
                                    </a>
                                </p>

                                <p>TopCoder Software utilizes past software ${fn:toLowerCase(projectTypeDesc)} winners
                                    and accomplished TopCoder competitors to staff the ${projectTypeDesc} Review Board.
                                    These reviewers verify that each ${fn:toLowerCase(projectTypeDesc)} submission
                                    meets the required functionality, coding style, adheres to the
                                    ${fn:toLowerCase(projectTypeDesc)} requirements and contains a suitable test
                                    suite.</p>

                                <p>The following members have agreed to participate on the TopCoder ${projectTypeDesc}
                                    Review Board:</p>
                            </td>
                        </tr>
                    </table>

                    <hr width="100%" size="1" noshade="noshade"/>

                    <table width="100%" border="0" cellpadding="5" cellspacing="0">
                        <c:set var="i" value="0"/>
                        <c:forEach items="${memberList}" var="resultRow">
                            <c:if test="${i % 3 eq 0}">
                                <tr valign="top">
                            </c:if>
                            <td>
                                <div align="center">
                                    <a href="/tc?module=MemberProfile&amp;cr=${resultRow.map['user_id']}">
                                        <img src="${(empty resultRow.map['image_path']) ?
                                            '/i/m/nophoto.jpg' : resultRow.map['image_path']}"
                                             alt="${resultRow.map['handle']}" width="126" height="140"
                                             border="0" class="myStatsPhoto"/></a><br/>
                                    <span class="bodyText">
                                        <c:choose>
                                            <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                                                <tc-webtag:handle coderId="${resultRow.map['user_id']}"
                                                    context='conceptualization'/>
                                            </c:when>
                                            <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                                                <tc-webtag:handle coderId="${resultRow.map['user_id']}"
                                                    context='specification'/>
                                            </c:when>
                                            <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
                                                <tc-webtag:handle coderId="${resultRow.map['user_id']}"
                                                    context='test_suites'/>
                                            </c:when>
                                            <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
                                                <tc-webtag:handle coderId="${resultRow.map['user_id']}"
                                                    context='test_scenarios'/>
                                            </c:when>
                                            <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
                                                <tc-webtag:handle coderId="${resultRow.map['user_id']}"
                                                    context='ui_prototype'/>
                                            </c:when>
                                            <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
                                                <tc-webtag:handle coderId="${resultRow.map['user_id']}"
                                                    context='ria_build'/>
                                            </c:when>
                                            <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
                                                <tc-webtag:handle coderId="${resultRow.map['user_id']}"
                                                    context='ria_component'/>
                                            </c:when>
                                            <c:otherwise>
                                                <tc-webtag:handle coderId="${resultRow.map['user_id']}" />
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                            </td>
                            <c:if test="${(i % 3 eq 2) || (i eq (fn:length(memberList) - 1))}">
                                </tr>
                            </c:if>
                            <c:set var="i" value="${i + 1}"/>
                        </c:forEach>
                    </table>
                    <p align="middle"><a href="mailto:support@topcoder.com" class="bodyText">Have a question
                        about the TopCoder ${projectTypeDesc} Review Board?</a></p>
                    <p><br/></p>
                </td>
                <!-- Center Column Ends -->

                <!-- Gutter -->
                <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt=""></td>
                <!-- Gutter Ends -->

                <!-- Right Column Begins -->
                <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0" alt=""><br/>
                    <c:choose>
                        <c:when test="${projectType == CONCEPTUALIZATION_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="conceptualization"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == SPECIFICATION_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="specification"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SUITES_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="test_suites"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == TEST_SCENARIOS_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="test_scenarios"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == UI_PROTOTYPE_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="ui_prototype"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_BUILD_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="ria_build"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == RIA_COMPONENT_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="ria_component"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == CONTENT_CREATION_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="content_creation"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == REPORTING_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="reporting"/>
                            </jsp:include>
                        </c:when>
                        <c:when test="${projectType == BUG_HUNT_PROJECT_TYPE}">
                            <jsp:include page="/public_right.jsp">
                                <jsp:param name="level1" value="review_board"/>
                                <jsp:param name="level2" value="bug_hunt"/>
                            </jsp:include>
                        </c:when>
                    </c:choose>
                </td>
                <!-- Right Column Ends -->

                <!-- Gutter -->
                <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" alt=""></td>
                <!-- Gutter Ends -->
            </tr>
        </table>
        <jsp:include page="/foot.jsp"/>
    </body>
</html>
