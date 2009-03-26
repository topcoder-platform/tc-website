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
    String phaseId = (String) request.getAttribute(Constants.PHASE_ID);
    String coderId = (String) request.getAttribute(Constants.CODER_ID);%>
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


<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="<%= String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId) ? "m_des_competitions" : "m_dev_competitions"%>"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId) ? "comp_design" : "comp_development"%>"/>
    <jsp:param name="title" value="Reliability Detail"/>
</jsp:include>

<span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>' context='<%=type%>'/></span>
<br>
<% if (phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) { %>
<span class="bodySubtitle">Development Statistics&#160;>&#160;</span><br>
<% } else { %>
<span class="bodySubtitle">Design Statistics&#160;>&#160;</span><br>
<% } %>
                <span class="bc">
                <A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
             | <A HREF="/tc?module=CompetitionHistory&ph=<%=phaseId%>&cr=<%=coderId%>" class="bcLink">Competition
                    History</A>
             | <A HREF="/tc?module=OutstandingProjects&cr=<%=coderId%>&ph=<%=phaseId%>" class="bcLink">Current
                    Contests</A>
                    | Reliability Detail
            </span>

<div class="pagingBox" style="clear:both;">&nbsp;</div>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="6">Reliability Detail</td>
    </tr>
    <tr>
        <td class="headerC">
            Catalog
        </td>
        <td class="header" width="40%">
            Component
        </td>
        <td class="headerR" width="20%">
            Reliability Before
        </td>
        <td class="headerR" width="20%">
            Reliability After
        </td>
        <td class="headerC" width="20%">
            Reliable
        </td>
        <td class="headerC" nowrap="nowrap">
            Registration Date
        </td>

    </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=contests%>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="valueC">
                <tc_tags:languageIcon catalogName = "<%=resultRow.getStringItem("catalog_name")%>" aolBrand="<%=(resultRow.getItem("aol_brand").getResultData() != null)%>"/> 
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
            <td class="valueR">
                <rsc:item name="old_reliability" row="<%=resultRow%>" format="0.00%" ifNull="&#160;"/>
            </td>
            <td class="valueR">
                <rsc:item name="new_reliability" row="<%=resultRow%>" format="0.00%" ifNull="&#160;"/>
            </td>
            <td class="valueC">
                <rsc:item name="reliable" row="<%=resultRow%>"/>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="create_time" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
            </td>
        </tr>
        <% even = !even;%>
    </rsc:iterator>
</table>
<br>
<% if (phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE))) { %>
<div class="bodySubtitle" align="center">Have a question about
    <A href="/wiki/display/tc/Component+Development+Reliability+Ratings">reliability ratings</A>?</div>
<% } else { %>
<div class="bodySubtitle" align="center">Have a question about
    <A href="/wiki/display/tc/Component+Design+Reliability+Ratings">reliability ratings</A>?</div>
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

