<%--
  - Author: VolodymyrK
  - Version: 1.0
  - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists reviewer rating history.
--%>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.DataAccessConstants,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.model.SoftwareComponent,
                com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>
<c:set value="<%=DataAccessConstants.END_RANK%>" var="endRank"/>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="../script.jsp"/>
    <script type="text/javascript" src="/js/popup.js"></script>
    <script type="text/javascript">
        var sr = <c:out value="${requestScope[defaults][startRank]}"/>;
        var er = <c:out value="${requestScope[defaults][endRank]}"/>;

        function next() {
            var myForm = document.reviewerRatingForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = er + 1;
            myForm.<%=DataAccessConstants.END_RANK%>.value = 2 * er - sr + 1;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":StringUtils.htmlEncode(request.getParameter(DataAccessConstants.SORT_COLUMN))%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":StringUtils.htmlEncode(request.getParameter(DataAccessConstants.SORT_DIRECTION))%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.reviewerRatingForm;
            myForm.<%=DataAccessConstants.END_RANK%>.value = sr - 1;
            myForm.<%=DataAccessConstants.START_RANK%>.value = 2 * sr - er - 1;
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":StringUtils.htmlEncode(request.getParameter(DataAccessConstants.SORT_COLUMN))%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":StringUtils.htmlEncode(request.getParameter(DataAccessConstants.SORT_DIRECTION))%>';
            myForm.submit();
        }
    </script>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>

<%
    ResultSetContainer rsc2 = (ResultSetContainer) request.getAttribute(Constants.HISTORY_LIST_KEY);
%>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">

<c:set value="<%=Constants.DESIGN_PROJECT_TYPE%>" var="DESIGN_PROJECT_TYPE"/>
<c:set value="<%=Constants.DEVELOPMENT_PROJECT_TYPE%>" var="DEVELOPMENT_PROJECT_TYPE"/>
<c:set value="<%=Constants.ASSEMBLY_PROJECT_TYPE%>" var="ASSEMBLY_PROJECT_TYPE"/>
<c:set value="<%=Constants.CONCEPTUALIZATION_PROJECT_TYPE%>" var="CONCEPTUALIZATION_PROJECT_TYPE"/>
<c:set value="<%=Constants.SPECIFICATION_PROJECT_TYPE%>" var="SPECIFICATION_PROJECT_TYPE"/>
<c:set value="<%=Constants.ARCHITECTURE_PROJECT_TYPE%>" var="ARCHITECTURE_PROJECT_TYPE"/>
<c:set value="<%=Constants.TEST_SUITES_PROJECT_TYPE%>" var="TEST_SUITES_PROJECT_TYPE"/>
<c:set value="<%=Constants.TEST_SCENARIOS_PROJECT_TYPE%>" var="TEST_SCENARIOS_PROJECT_TYPE"/>
<c:set value="<%=Constants.UI_PROTOTYPE_PROJECT_TYPE%>" var="UI_PROTOTYPE_PROJECT_TYPE"/>
<c:set value="<%=Constants.RIA_BUILD_PROJECT_TYPE%>" var="RIA_BUILD_PROJECT_TYPE"/>
<c:set value="<%=Constants.CONTENT_CREATION_PROJECT_TYPE%>" var="CONTENT_CREATION_PROJECT_TYPE"/>
<c:set value="<%=Constants.REPORTING_PROJECT_TYPE%>" var="REPORTING_PROJECT_TYPE"/>

<TD WIDTH="180">
    <!-- Left nav begins -->
    <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_des_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_dev_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_assembly_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_conceptualization_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_specification_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_architecture_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_test_suites_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_test_scenarios_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_ui_prototype_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_ria_build_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_content_creation_competitions"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == REPORTING_PROJECT_TYPE}">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_reporting_competitions"/>
            </jsp:include>
        </c:when>
    </c:choose>
    <!-- Left nav ends -->
</TD>

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

    <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="comp_design"/>
                <jsp:param name="title" value="Component Design Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="comp_development"/>
                <jsp:param name="title" value="Component Development Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="assembly"/>
                <jsp:param name="title" value="Assembly Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="conceptualization"/>
                <jsp:param name="title" value="Conceptualization Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="specification"/>
                <jsp:param name="title" value="Specification Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="architecture"/>
                <jsp:param name="title" value="Architecture Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="test_suites"/>
                <jsp:param name="title" value="Test Suites Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="test_scenarios"/>
                <jsp:param name="title" value="Test Scenarios Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="ui_prototype"/>
                <jsp:param name="title" value="UI Prototype Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="ria_build"/>
                <jsp:param name="title" value="RIA Build Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="content_creation"/>
                <jsp:param name="title" value="Content Creation Reviewer Rating History"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == REPORTING_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="reporting"/>
                <jsp:param name="title" value="Reporting Reviewer Rating History"/>
            </jsp:include>
        </c:when>
    </c:choose>

    <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='${cr}' context='${type}'/></span>
    <br>
    <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
            <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
            <span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
            <span class="bodySubtitle">Assembly Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
            <span class="bodySubtitle">Conceptualization Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
            <span class="bodySubtitle">Specification Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
            <span class="bodySubtitle">Architecture Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
            <span class="bodySubtitle">Test Suites Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
            <span class="bodySubtitle">Test Scenarios Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
            <span class="bodySubtitle">UI Prototype Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
            <span class="bodySubtitle">RIA Build Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
            <span class="bodySubtitle">Content Creation Statistics&#160;>&#160;</span><br>
        </c:when>
        <c:when test="${pt == REPORTING_PROJECT_TYPE}">
            <span class="bodySubtitle">Reporting Statistics&#160;>&#160;</span><br>
        </c:when>
    </c:choose>

    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=${cr}" class="bcLink">Member Profile</A>
 | <A HREF="/tc?module=CompetitionHistory&pt=${pt}&cr=${cr}" class="bcLink">Competition History</A>
 | <A HREF="/tc?module=OutstandingProjects&pt=${pt}&cr=${cr}" class="bcLink">Current Contests</A>
 | <A HREF="/tc?module=ReliabilityDetail&pt=${pt}&cr=${cr}" class="bcLink">Reliability Detail</A>
 | Reviewer Rating History
</span>


<div class="pagingBox" style="clear:both;">
    <% if (rsc2.croppedDataBefore() || rsc2.croppedDataAfter()) { %>
    <%=(rsc2.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(rsc2.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
    <% } else { %>
    &#160;
    <% } %>
</div>

<form name="reviewerRatingForm" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="get">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="ReviewerRatingHistory"/>
    <tc-webtag:hiddenInput name="<%=Constants.PROJECT_TYPE_ID%>" value="${pt}"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>
    <tc-webtag:hiddenInput name="<%=DataAccessConstants.END_RANK%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.CODER_ID%>" value="${cr}"/>
    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <td class="title" colspan="5">Design
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <td class="title" colspan="5">Development
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <td class="title" colspan="5">Assembly
                </c:when>
                <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
                    <td class="title" colspan="5">Conceptualization
                </c:when>
                <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
                    <td class="title" colspan="5">Specification
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <td class="title" colspan="5">Architecture
                </c:when>
                <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
                    <td class="title" colspan="5">Test Suites
                </c:when>
                <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
                    <td class="title" colspan="5">Test Scenarios
                </c:when>
                <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
                    <td class="title" colspan="5">UI Prototype
                </c:when>
                <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
                    <td class="title" colspan="5">RIA Build
                </c:when>
                <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
                    <td class="title" colspan="5">Content Creation
                </c:when>
                <c:when test="${pt == REPORTING_PROJECT_TYPE}">
                    <td class="title" colspan="5">Reporting
                </c:when>
            </c:choose>
            Reviewer Rating History
        </td></tr>
        <tr>
            <TD CLASS="header" WIDTH="80">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="4" includeParams="true"/>">Review Date</a>
            </TD>
            <TD CLASS="header">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Contest</a>
            </TD>
            <TD CLASS="headerC" WIDTH="12%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="2" includeParams="true"/>">Feedback Score</a>
            </TD>
            <TD CLASS="headerR" WIDTH="12%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Rating</a>
            </TD>
            <TD CLASS="headerR" WIDTH="12%" align="right">&#160;</TD>
        </tr>
        <%boolean even = false;%>
        <rsc:iterator list="<%=rsc2%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
                <TD class="value"><rsc:item name="review_date" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
                <TD class="value">
                    <rsc:item name="project_name" row="<%=resultRow%>"/>
                </TD>
                <TD class="valueC"><rsc:item name="score" row="<%=resultRow%>" ifNull=""/></TD>
                <TD class="valueR"><rsc:item name="new_rating" row="<%=resultRow%>" format="0.00" ifNull=""/></TD>
                <TD class="valueR" nowrap="nowrap">
                <A HREF="/tc?module=ReviewFeedbackDetails&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>" CLASS="statLink">
                    Feedback Details
                </A>
                </TD>
            </tr>
            <%even = !even;%>
        </rsc:iterator>
    </TABLE>
</FORM>

<div class="pagingBox">
    <% if (rsc2.croppedDataBefore() || rsc2.croppedDataAfter()) { %>
    <%=(rsc2.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
    | <%=(rsc2.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
    <% } else { %>
    &#160;
    <% } %>
</div>

<p><br></p>
<!-- END BODY -->

</TD>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="profile"/>
    </jsp:include>
</TD>
<!-- Gutter -->
<td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
<!-- Gutter Ends -->
</tr>
</TABLE>
<jsp:include page="../foot.jsp"/>
</BODY>
</HTML>
