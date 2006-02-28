<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.web.tc.model.SoftwareComponent"%>
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
      <jsp:param name="node" value="<%= String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(request.getAttribute(Constants.PHASE_ID)) ? "des_compete" : "dev_compete"%>"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyText">
<img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
<jsp:include page="../body_top.jsp">
    <jsp:param name="image" value="development"/>
    <jsp:param name="image1" value="white"/>
    <jsp:param name="title" value="Components"/>
</jsp:include>
<img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
    <tr>
        <td class="projectTitles" colspan="6">Contest Status</td>
    </tr>
    <tr valign="middle">
        <td class="projectHeaders" align="center">Catalog</td>
        <td width="15%" class="projectHeaders">Contest</td>
        <td class="projectHeaders" align="center">Submission Due Date</td>
        <td class="projectHeaders" align="center">Winner</td>
        <td class="projectHeaders" align="center">Second Place</td>
        <td class="projectHeaders" align="center">Current Phase</td>
    </tr>

    <rsc:iterator list="<%=contests%>" id="resultRow">
        <tr valign="top">
            <td class="projectCells" align="center">
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
            <td class="projectCells">
                <a href="/tc?module=ProjectDetail&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                    <rsc:item name="component_name" row="<%=resultRow%>"/> <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
            </td>
            <td class="projectCells" align="center">
                <% if (resultRow.getItem("winner").getResultData()!=null) { %>
                    <tc-webtag:handle coderId='<%=resultRow.getLongItem("winner") %>' context='<%=resultRow.getStringItem("phase")%>'/>
                <% } %>

            </td>
            <td class="projectCells" align="center">
                <% if (resultRow.getItem("second").getResultData()!=null) { %>
                <tc-webtag:handle coderId='<%=resultRow.getLongItem("second") %>' context='<%=resultRow.getStringItem("phase")%>'/>
                <% } %>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="current_phae" row="<%=resultRow%>"/>
            </td>
        </tr>

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

