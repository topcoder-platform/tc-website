<%--
  - Author: pulky, VolodymyrK
  - Version: 1.1
  - Copyright (C) 2004 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the reliability details page.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
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
<%@ taglib prefix="tc_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="../script.jsp"/>

</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>

<%
    ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");
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
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="comp_development"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="assembly"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="conceptualization"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="specification"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="architecture"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="test_suites"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="test_scenarios"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="ui_prototype"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="ria_build"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == CONTENT_CREATION_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="content_creation"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == REPORTING_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="reporting"/>
                <jsp:param name="title" value="Reliability Detail"/>
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
 | <A HREF="/tc?module=OutstandingProjects&pt=${pt}&cr=${cr}" class="bcLink">Current Challenges</A>
 | Reliability Detail
 | <A HREF="/tc?module=ReviewerRatingHistory&pt=${pt}&cr=${cr}" class="bcLink">Reviewer Rating History</A>
            </span>

<div class="pagingBox" style="clear:both;">&nbsp;</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="7">Reliability Detail</td>
    </tr>
    <tr>
        <td class="headerC" width="5%">
            Catalog
        </td>
        <td class="header" width="30%">
            Challenge
        </td>
        <td class="headerC" width="5%">
            Reliable
        </td>
        <td class="headerC" nowrap="nowrap" width="20%">
            Resolution Date
        </td>   
        <td class="headerC" width="10%">
            Reliability After Resolution
        </td>
        <td class="headerC" nowrap="nowrap" width="20%">
            Registration Date
        </td>
        <td class="headerC" width="10%">
            Reliability on Registration
        </td>

    </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=contests%>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="valueC">
                <c:choose>
                    <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE || pt == DESIGN_PROJECT_TYPE}">
                        <tc_tags:languageIcon catalogName = "<%=resultRow.getStringItem("catalog_name")%>" aolBrand="<%=(resultRow.getItem("aol_brand").getResultData() != null)%>"
                            paypalBrand="<%=(resultRow.getItem("paypal_brand") != null && resultRow.getItem("paypal_brand").getResultData() != null)%>"/>
                    </c:when>
                    <c:otherwise>
                        Application
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="value">
                <% if (resultRow.getIntItem("viewable") == 1) { %>
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item row="<%=resultRow%>" name="component_id"/>&ver=<rsc:item row="<%=resultRow%>" name="version"/>">
                    <rsc:item name="contest_name" row="<%=resultRow%>"/>
                    <rsc:item name="version_text" row="<%=resultRow%>"/></A>
                <% } else { %>
                <rsc:item name="contest_name" row="<%=resultRow%>"/>
                <rsc:item name="version_text" row="<%=resultRow%>"/>
                <% } %>
            </td>
            <td class="valueC">
                <rsc:item name="reliable" row="<%=resultRow%>"/>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="resolution_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
            </td>       
            <td class="valueC">
                <rsc:item name="new_reliability" row="<%=resultRow%>" format="0.00%" ifNull="&#160;"/>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="create_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
            </td>
            <td class="valueC">
                <rsc:item name="reliability_on_registration" row="<%=resultRow%>" format="0.00%" ifNull="N/A"/>
            </td>       

    </tr>
        <% even = !even;%>
    </rsc:iterator>
</table>
<br>
<div class="bodySubtitle" align="center">Have a question about
    <A href="/wiki/display/tc/Reliability+Ratings+and+Bonuses">reliability ratings</A>?
</div>
<p><br/></p>


</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="180">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>

