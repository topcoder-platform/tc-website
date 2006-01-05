<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer devContests = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("dev_contests");%>
<% ResultSetContainer designContests = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("design_contests");%>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
    <title>Active Contests</title>

    <jsp:include page="../script.jsp"/>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="../includes/global_left.jsp">
        <jsp:param name="level1" value="development"/>
        <jsp:param name="level2" value="components"/>
        <jsp:param name="level3" value="active_contests"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyText">
<img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>
<div style="float:right;"><A href="/?t=development&amp;c=getting_started"><img src="/i/development/get_started.gif" alt="Getting Started" border="0" /></A></div>
<jsp:include page="../body_top.jsp">
    <jsp:param name="image" value="development"/>
    <jsp:param name="image1" value="white"/>
    <jsp:param name="title" value="Components"/>
</jsp:include>


<img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>

<table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
    <tr>
        <td class="projectTitles" colspan="9">Component Design Contests</td>
    </tr>
    <tr valign="middle">
        <td class="projectHeaders" align="center">Catalog</td>
        <td width="15%" class="projectHeaders">Component</td>
        <td class="projectHeaders" align="center">Registrants<br/>Rated/Unrated</td>
        <td class="projectHeaders" align="center">Registration Ends</td>
        <td class="projectHeaders" align="center">Submissions</td>
        <td class="projectHeaders" align="center">Payment *</td>
        <td class="projectHeaders" align="center">Complexity</td>
        <td class="projectHeaders" align="center">Submit by</td>
<%--        <td class="projectHeaders" align="center">Details</td> --%>
    </tr>

    <rsc:iterator list="<%=designContests%>" id="resultRow">
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
                <%=resultRow.getItem("max_unrated_registrants").getResultData()!=null && resultRow.getIntItem("max_unrated_registrants") == 0 ? "**" : ""%>
            </td>
            <td class="projectCells" align="center">
                <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                   <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                <% } %>
                <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>/
                <rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
                <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                   </a>
                <% } %>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="America/New_York"/>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/></td>
            <td class="projectCells" align="center"><rsc:item name="description" row="<%=resultRow%>"/></td>
            <td class="projectCells" align="center" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="America/New_York"/></td>
<%--
            <td class="projectCells" align="center">
                <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">details</a>
                <% } %>
            </td>
--%>
        </tr>

    </rsc:iterator>
</table>
<br/>


<table border="0" cellspacing="0" cellpadding="3" width="100%" class="formFrame">
    <tr>
        <td class="projectTitles" colspan="9">Component Development Contests</td>
    </tr>
    <tr valign="middle">
        <td class="projectHeaders" align="center">Catalog</td>
        <td width="15%" class="projectHeaders">Component</td>
        <td class="projectHeaders" align="center">Registrants<br/>Rated/Unrated</td>
        <td class="projectHeaders" align="center">Registration Ends</td>
        <td class="projectHeaders" align="center">Submissions</td>
        <td class="projectHeaders" align="center">Payment *</td>
        <td class="projectHeaders" align="center">Complexity</td>
        <td class="projectHeaders" align="center">Submit by</td>
<%--        <td class="projectHeaders" align="center">Details</td> --%>
    </tr>

    <rsc:iterator list="<%=devContests%>" id="resultRow">
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
                <%=resultRow.getItem("max_unrated_registrants").getResultData()!=null && resultRow.getIntItem("max_unrated_registrants") == 0 ? "**" : ""%>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="total_rated_inquiries" row="<%=resultRow%>"/>/
                <rsc:item name="total_unrated_inquiries" row="<%=resultRow%>"/>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="reg_end_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z"  timeZone="America/New_York"/>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="total_submissions" row="<%=resultRow%>"/>
            </td>
            <td class="projectCells" align="center">
                <rsc:item name="price" row="<%=resultRow%>" format="$###,###.00"/></td>
            <td class="projectCells" align="center"><rsc:item name="description" row="<%=resultRow%>"/></td>
            <td class="projectCells" align="center" nowrap="nowrap">
                <rsc:item name="initial_submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="America/New_York"/></td>
<%--
            <td class="projectCells" align="center">
                <% if (resultRow.getIntItem("total_inquiries") > 0) { %>
                <a href="/tc?module=ViewRegistrants&amp;<%=Constants.PROJECT_ID%>=<rsc:item name="project_id" row="<%=resultRow%>"/>">details</a>
                <% } %>
            </td>
--%>
        </tr>

    </rsc:iterator>
</table>

<br/>

<p align="left">* And that's before royalty payments. The more Component
    <A href="http://software.topcoder.com/components/subscriptions.jsp">Subscriptions</A> we sell, the more royalties we
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

