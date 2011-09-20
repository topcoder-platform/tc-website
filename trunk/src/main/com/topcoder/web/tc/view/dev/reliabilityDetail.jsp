<%--
  - Author: TCSDEVELOPER, pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page displays the reliability details page.
  -
  - Version 1.1 (Testing Competition Split Release Assembly 1.0) changes: Updated Application Testing to Test Suites.
--%>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.model.SoftwareComponent" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="tc_tags" tagdir="/WEB-INF/tags" %>
<% ResultSetContainer contests = (ResultSetContainer) request.getAttribute("contests");%>
<% String type = (String) request.getAttribute(Constants.TYPE_KEY);
    String coderId = (String) request.getAttribute(Constants.CODER_ID);
    int phaseId = Integer.parseInt((String) request.getAttribute(Constants.PHASE_ID));%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Statistics</title>
    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>


<jsp:include page="../top.jsp"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <!-- Left nav begins -->
    <% if(phaseId == SoftwareComponent.DESIGN_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_des_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.DEV_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_dev_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.ASSEMBLY_PHASE ) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_assembly_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.CONCEPTUALIZATION_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_conceptualization_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.SPECIFICATION_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_specification_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.ARCHITECTURE_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_architecture_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.TEST_SUITES_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_test_suites_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.TEST_SCENARIOS_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_test_scenarios_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.UI_PROTOTYPE_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_ui_prototype_competitions"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.RIA_BUILD_PHASE) { %>
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_ria_build_competitions"/>
            </jsp:include>
    <% } %>
    <!-- Left nav ends -->
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
    <% if(phaseId == SoftwareComponent.DESIGN_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="comp_design"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.DEV_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="comp_development"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.ASSEMBLY_PHASE ) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="assembly"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.CONCEPTUALIZATION_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="conceptualization"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.SPECIFICATION_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="specification"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.ARCHITECTURE_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="architecture"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.TEST_SUITES_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="test_suites"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.TEST_SCENARIOS_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="test_scenarios"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.UI_PROTOTYPE_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="ui_prototype"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } else if(phaseId == SoftwareComponent.RIA_BUILD_PHASE) { %>
            <jsp:include page="/page_title.jsp">
                <jsp:param name="image" value="ria_build"/>
                <jsp:param name="title" value="Reliability Detail"/>
            </jsp:include>
    <% } %>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>' context='<%=type%>'/></span>
<br>
    <% if(phaseId == SoftwareComponent.DESIGN_PHASE) { %>
            <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.DEV_PHASE) { %>
            <span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.ASSEMBLY_PHASE ) { %>
            <span class="bodySubtitle">Assembly Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.CONCEPTUALIZATION_PHASE) { %>
            <span class="bodySubtitle">Conceptualization Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.SPECIFICATION_PHASE) { %>
            <span class="bodySubtitle">Specification Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.ARCHITECTURE_PHASE) { %>
            <span class="bodySubtitle">Architecture Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.TEST_SUITES_PHASE) { %>
            <span class="bodySubtitle">Test Suites Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.TEST_SCENARIOS_PHASE) { %>
            <span class="bodySubtitle">Test Scenarios Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.UI_PROTOTYPE_PHASE) { %>
            <span class="bodySubtitle">UI Prototype Statistics&#160;>&#160;</span><br>
    <% } else if(phaseId == SoftwareComponent.RIA_BUILD_PHASE) { %>
            <span class="bodySubtitle">RIA Build Statistics&#160;>&#160;</span><br>
    <% } %>
                <span class="bc">
                <A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
             | <A HREF="/tc?module=CompetitionHistory&pt=${pt}&cr=<%=coderId%>" class="bcLink">Competition
                    History</A>
             | <A HREF="/tc?module=OutstandingProjects&cr=<%=coderId%>&pt=${pt}" class="bcLink">Current
                    Contests</A>
                    | Reliability Detail
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
            <% if(phaseId == SoftwareComponent.DESIGN_PHASE || phaseId == SoftwareComponent.DEV_PHASE ) { %>
                    Component
            <% } else { %>
                    Application
            <% } %>
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
            <% if(phaseId == SoftwareComponent.DESIGN_PHASE || phaseId == SoftwareComponent.DEV_PHASE ) { %>
                <tc_tags:languageIcon catalogName = "<%=resultRow.getStringItem("catalog_name")%>" aolBrand="<%=(resultRow.getItem("aol_brand").getResultData() != null)%>"
                                      paypalBrand="<%=(resultRow.getItem("paypal_brand") != null && resultRow.getItem("paypal_brand").getResultData() != null)%>"/>
            <% } else { %>
                Application
            <% } %>
            </td>
            <td class="value">
                <% if (resultRow.getIntItem("viewable") == 1) { %>
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item row="<%=resultRow%>" name="component_id"/>&ver=<rsc:item row="<%=resultRow%>" name="version"/>">
                    <rsc:item name="component_name" row="<%=resultRow%>"/>
                    <rsc:item name="version_text" row="<%=resultRow%>"/></A>
                <% } else { %>
                <rsc:item name="component_name" row="<%=resultRow%>"/>
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
            <% if(phaseId == SoftwareComponent.DESIGN_PHASE  ) { %>
                    <div class="bodySubtitle" align="center">Have a question about
    <A href="/wiki/display/tc/Reliability+Ratings+and+Bonuses">reliability ratings</A>?</div>
            <% } else if(phaseId == SoftwareComponent.DEV_PHASE ) { %>
                  <div class="bodySubtitle" align="center">Have a question about
    <A href="/wiki/display/tc/Reliability+Ratings+and+Bonuses">reliability ratings</A>?</div>
            <% } else { %>
            <div class="bodySubtitle" align="center">Have a question about
    <A href="/wiki/display/tc/Reliability+Ratings+and+Bonuses">reliability ratings</A>?</div>
            <% } %>
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

