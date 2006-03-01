<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer devContests = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("dev_contests");%>
<% ResultSetContainer designContests = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("design_contests");%>
<% boolean design = ((Boolean)request.getAttribute("phase_id_is_design")).booleanValue(); %>

<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
<title>Active Contests</title>
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
      <jsp:param name="node" value="<%= design ? "des_compete" : "dev_compete"%>"/>
   </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyText">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="comp_design"/>
    <jsp:param name="title" value="Contest Status"/>
</jsp:include>

<% if (design) { %>
<div align="right"><A href="/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted"><img src="/i/development/get_started.gif" alt="Getting Started" border="0" /></A></div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="9">Component Design Contests</td>
    </tr>
    <tr>
        <td class="headerC">Catalog</td>
        <td class="header" width="100%">Component</td>
        <td class="headerC">Registrants<br/>Rated/Unrated</td>
        <td class="headerC">Registration Ends</td>
        <td class="headerC">Submissions</td>
        <td class="headerC">Payment *</td>
        <td class="headerC">Complexity</td>
        <td class="headerC">Submit by</td>
        <td class="headerC">Details</td>
    </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=designContests%>" id="resultRow">
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
                    <rsc:item name="component_name" row="<%=resultRow%>"/> Version
                    <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
                <%=resultRow.getItem("max_unrated_registrants").getResultData()==null || resultRow.getIntItem("max_unrated_registrants") == 0 ? "**" : ""%>
            </td>
            <td class="valueC">
                <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>/
                <rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
            </td>
            <td class="valueC">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
            <td class="valueC">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/></td>
            <td class="valueC"><rsc:item name="description" row="<%=resultRow%>"/></td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/></td>
            <td class="valueC">
                <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">details</a>
                <% } %>
            </td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
<br/>
<%  } else {   // Development %>
<div align="right"><A href="/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted"><img src="/i/development/get_started.gif" alt="Getting Started" border="0" /></A></div>
<table class="stat" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="title" colspan="9">Component Development Contests</td>
    </tr>
    <tr>
        <td class="headerC">Catalog</td>
        <td class="header" width="100%">Component</td>
        <td class="headerC">Registrants<br/>Rated/Unrated</td>
        <td class="headerC">Registration Ends</td>
        <td class="headerC">Submissions</td>
        <td class="headerC">Payment *</td>
        <td class="headerC">Complexity</td>
        <td class="headerC">Submit by</td>
        <td class="headerC">Details</td>
    </tr>

    <% boolean even = false; %>
    <rsc:iterator list="<%=devContests%>" id="resultRow">
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
                    <rsc:item name="component_name" row="<%=resultRow%>"/> Version
                    <rsc:item name="version_text" row="<%=resultRow%>"/>
                </a>
                <%=resultRow.getItem("max_unrated_registrants").getResultData()==null || resultRow.getIntItem("max_unrated_registrants") == 0 ? "**" : ""%>
            </td>
            <td class="valueC">
                <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>/
                <rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
            </td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/>
            </td>
            <td class="valueC">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
            <td class="valueC">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/></td>
            <td class="valueC"><rsc:item name="description" row="<%=resultRow%>"/></td>
            <td class="valueC" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"/></td>
            <td class="valueC">
                <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">details</a>
                <% } %>
            </td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
<br/>
<% } %>

<p align="left">* And that's before royalty payments. The more Component
    <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/components/subscriptions.jsp">Subscriptions</A> we sell, the more royalties we
    pay out to our winners! Please note
    that custom components do not get added to the catalog and therefore do not have royalties.</p>

<p align="left">** Only rated members may register for this component</p>

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

