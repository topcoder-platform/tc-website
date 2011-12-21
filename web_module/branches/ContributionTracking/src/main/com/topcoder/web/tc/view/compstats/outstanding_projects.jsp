<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists all outstanding projects.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
  - and added support for new Test Scenarios competitions.
--%>
<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.model.SoftwareComponent,
                com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="/script.jsp"/>
    <script type="text/javascript" src="/js/popup.js"></script>
</HEAD>


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

<BODY>
<jsp:include page="../top.jsp"/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">
<%
    ResultSetContainer rsc2 = (ResultSetContainer) request.getAttribute(Constants.HISTORY_LIST_KEY);
    //String type = (String) request.getAttribute(Constants.TYPE_KEY);
%>
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
    </c:choose>
    <!-- Left nav ends -->
</TD>

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">


    <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="comp_design"/>
                <jsp:param name="title" value="Component Design Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="comp_development"/>
                <jsp:param name="title" value="Component Development Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="assembly"/>
                <jsp:param name="title" value="Assembly Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="conceptualization"/>
                <jsp:param name="title" value="Conceptualization Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="specification"/>
                <jsp:param name="title" value="Specification Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="architecture"/>
                <jsp:param name="title" value="Architecture Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="test_suites"/>
                <jsp:param name="title" value="Test Suites Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="test_scenarios"/>
                <jsp:param name="title" value="Test Scenarios Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="ui_prototype"/>
                <jsp:param name="title" value="UI Prototype Current Contests"/>
            </jsp:include>
        </c:when>
        <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
            <jsp:include page="../page_title.jsp">
                <jsp:param name="image" value="ria_build"/>
                <jsp:param name="title" value="RIA Build Current Contests"/>
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
    </c:choose>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=${cr}" class="bcLink">Member Profile</A>
 | <A HREF="/tc?module=CompetitionHistory&pt=${pt}&cr=${cr}" class="bcLink">Competition History</A>
 | Current Contests
     <c:choose>
        <c:when test="${pt == DESIGN_PROJECT_TYPE}">
             | <A HREF="/tc?module=ReliabilityDetail&ph=112&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
             | <A HREF="/tc?module=ReliabilityDetail&ph=113&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
             | <A HREF="/tc?module=ReliabilityDetail&ph=125&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
            | <A HREF="/tc?module=ReliabilityDetail&ph=134&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
            | <A HREF="/tc?module=ReliabilityDetail&ph=117&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
            | <A HREF="/tc?module=ReliabilityDetail&ph=118&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
            | <A HREF="/tc?module=ReliabilityDetail&ph=124&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
            | <A HREF="/tc?module=ReliabilityDetail&ph=137&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
            | <A HREF="/tc?module=ReliabilityDetail&ph=130&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
        <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
            | <A HREF="/tc?module=ReliabilityDetail&ph=135&uid=${cr}" class="bcLink">Reliability Detail</A>
        </c:when>
    </c:choose>
   </span>

    <div class="pagingBox" style="clear:both;">&#160;</div>

    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <c:choose>
                <c:when test="${pt == DESIGN_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current Design
                </c:when>
                <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <td class="title" colspan="11">Current Development
                </c:when>
                <c:when test="${pt == ASSEMBLY_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current Assembly
                </c:when>
                <c:when test="${pt == CONCEPTUALIZATION_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current Conceptualization
                </c:when>
                <c:when test="${pt == SPECIFICATION_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current Specification
                </c:when>
                <c:when test="${pt == ARCHITECTURE_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current Architecture
                </c:when>
                <c:when test="${pt == TEST_SUITES_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current Test Suites
                </c:when>
                <c:when test="${pt == TEST_SCENARIOS_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current Test Scenarios
                </c:when>
                <c:when test="${pt == UI_PROTOTYPE_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current UI Prototype
                </c:when>
                <c:when test="${pt == RIA_BUILD_PROJECT_TYPE}">
                    <td class="title" colspan="10">Current RIA Build
                </c:when>
            </c:choose>
            Contests
        </td></tr>
        <tr>
            <c:if test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                <TD CLASS="headerC"><a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="<%=rsc2.getColumnIndex("type")%>" includeParams="true" excludeParams="sr" />" class="statLink">Type</a></td>
            </c:if>
            <TD CLASS="header">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="1" includeParams="true"/>">Date</a>
            </TD>
            <TD CLASS="header" width="40%">
                <c:choose>
                    <c:when test="${pt == DEVELOPMENT_PROJECT_TYPE || pt == DESIGN_PROJECT_TYPE}">
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Component</a>
                    </c:when>
                    <c:otherwise>
                        <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Application</a>
                    </c:otherwise>
                </c:choose>
            </TD>
            <TD CLASS="headerC" width="20%">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="5" includeParams="true"/>">Submissions</a>
            </TD>
            <TD CLASS="headerC" width="20%">
                <div id="popDR" class="popUp"><div>Digital Run</div></div>
                <div align="center"><a href='/dr'><img class="emblem" src="/i/interface/emblem/digitalrun.png" alt="" border="0" onmouseover="popUp(this,'popDR')" onmouseout="popHide()" /></a></div>
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="6" includeParams="true"/>">Potential
                    Points</a>*
            </TD>
            <TD CLASS="headerR" width="20%">&#160;</TD>
        </tr>
        <% if (rsc2.isEmpty()) {%>
        <tr class="light">
            <TD class="value" colspan="5">
                <tc-webtag:handle coderId='${cr}' context='${type}'/> has no current contests.
            </TD>
        </tr>
        <% } else { %>
        <%boolean even = false;%>
        <rsc:iterator list="<%=rsc2%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">
                <c:if test="${pt == DEVELOPMENT_PROJECT_TYPE}">
                    <TD CLASS="valueC"><strong><rsc:item name="type" row="<%=resultRow%>"/></strong></td>
                </c:if>
                <TD class="value"><rsc:item name="posting_date" row="<%=resultRow%>" format="MM.dd.yy"/></TD>
                <TD class="value">
                    <% if (resultRow.getItem("component_id").getResultData() != null && resultRow.getIntItem("viewable_category_ind") == 1) { %>
                    <A HREF="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>" CLASS="statLink">
                        <rsc:item name="component_name" row="<%=resultRow%>"/>
                    </A>
                    <% } else { %>
                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                    <% } %>
                </TD>
                <TD class="valueC"><rsc:item name="num_valid_submissions" row="<%=resultRow%>"/></TD>
                <TD class="valueC"><rsc:item name="outstanding_points" row="<%=resultRow%>" format="####0.00" /></TD>
                <TD class="valueR" nowrap="nowrap">
                    <% if (resultRow.getItem("project_id").getResultData() != null) { %>
                    <A HREF="/tc?module=ViewRegistrants&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>" CLASS="statLink">
                        Contest Details
                    </A>
                    <% } %>
                </TD>
            </tr>
            <%even = !even;%>
        </rsc:iterator>
        <% } %>
    </TABLE>
    * Assuming first place finish with all current contests with all competitors passing review

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
