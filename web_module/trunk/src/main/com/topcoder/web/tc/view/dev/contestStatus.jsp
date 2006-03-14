<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.model.SoftwareComponent"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<% ResultSetContainer contests = (ResultSetContainer)request.getAttribute("contests");%>

<head>
<title>Contest Status</title>
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
      <jsp:param name="node" value="<%= String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(request.getAttribute(Constants.PHASE_ID)) ? "des_contest_status" : "dev_contest_status"%>"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyText">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="<%= String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(request.getAttribute(Constants.PHASE_ID)) ? "comp_design" : "comp_development"%>"/>
    <jsp:param name="title" value="Contest Status"/>
</jsp:include>

<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="9">Contest Status</td>
    </tr>
    <tr>
        <td class="headerC">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("catalog_name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Catalog</a>
        </td>
        <td class="header" colspan="2">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("component_name")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Contest</a>
        </td>
        <td class="headerC" nowrap="nowrap">
            Registrants<br>Rated/Unrated
            </td>
        <td class="headerC" nowrap="nowrap">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("reg_end_date")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Submission<br>Due Date</a>
            </td>
        <td class="headerC" nowrap="nowrap">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("final_review_end_date")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Final Review<br>Due Date</a>
            </td>
        <td class="headerC">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("current_phase")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Current Phase</a>
        </td>
        <td class="header">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("winner_sort")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Winner</a>

            </td>
        <td class="header">
            <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?<%=Constants.MODULE_KEY%>=ContestStatus<tc-webtag:sort column="<%=contests.getColumnIndex("second_sort")%>" includeParams="true" excludeParams="<%=Constants.MODULE_KEY%>"/>">Second Place</a>
        </td>
    </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=contests%>" id="resultRow">
        <tr class="<%=even?"dark":"light"%>">
            <td class="valueC">
                <% if ("Java".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJava.gif"/>
                <% } else if ("Java Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smJavaCustom.gif"/>
                <% } else if (".NET".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/netSm.gif"/>
                <% } else if (".NET Custom".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/smNetCustom.gif"/>
                <% } else if ("Flash".equals(resultRow.getStringItem("catalog_name"))) { %>
                <img src="/i/development/flashSm.gif"/>
                <% } else { %>
                <rsc:item name="catalog_name" row="<%=resultRow%>"/>
                <% } %>
            </td>
            <td class="value">
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <rsc:item name="component_name" row="<%=resultRow%>"/> <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
            </td>
            <td class="value">
                <% if (resultRow.getIntItem("viewable")==1) { %>
               <span class="smallText"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item row="<%=resultRow%>" name="component_id"/>&ver=<rsc:item row="<%=resultRow%>" name="version"/>">component details</A></span>
                <% } else { %>
                &#160;
                 <% } %>
            </td>
            <td class="valueC">
               <A href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>"><rsc:item name="rated_count" row="<%=resultRow%>"/> / <rsc:item name="unrated_count" row="<%=resultRow%>"/></A>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="final_review_end_date" row="<%=resultRow%>" format="MM.dd.yyyy"/>
            </td>
            <td class="valueC">
                <rsc:item name="current_phase" row="<%=resultRow%>"/>
            </td>
            <td class="value">
                <% if (resultRow.getItem("winner").getResultData()!=null) { %>
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("winner") %>' context='<%=resultRow.getStringItem("phase")%>'/>
                <% } %>

            </td>
            <td class="value">
                <% if (resultRow.getItem("second").getResultData()!=null) { %>
                <tc-webtag:handle coderId='<%=resultRow.getLongItem("second") %>' context='<%=resultRow.getStringItem("phase")%>'/>
                <% } %>
            </td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>

    <p><br/></p>


</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="180">
    <jsp:include page="right.jsp"/>
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

