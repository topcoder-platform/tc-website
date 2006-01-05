<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer registrants = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("registrants");%>
<jsp:useBean id="sessionInfo" scope="request" class="com.topcoder.web.common.SessionInfo"/>
<head>
    <title>TopCoder - Component Active Contests</title>

    <jsp:include page="../script.jsp"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
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
            <jsp:include page="../body_top.jsp">
                <jsp:param name="image" value="development"/>
                <jsp:param name="image1" value="white"/>
                <jsp:param name="title" value="Components"/>
            </jsp:include>
            <img src="/i/clear.gif" alt="" width="1" height="10" border="0"/><br/>


<table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTableHolder">
<tr>
<td class="divider">
    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
        <tr><td class="tableTitle" colspan="2">
              <%=registrants.getStringItem(0, "phase")%> Contest Details</td></tr>
        </td></tr>
        <tr>
            <td class="cat" nowrap="nowrap">Contest:</td>
            <td class="stat" align="right" nowrap="nowrap"></td>
        </tr>
        <tr>
            <td class="cat" nowrap="nowrap">Component:</td>
            <td class="stat" align="right" nowrap="nowrap">
<%--
            <a target="_blank" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>">
                <rsc:item name="component_name" row="<%=resultRow%>"/>
                <rsc:item name="version_text" row="<%=resultRow%>"/>
            </a>
--%>
            </td>
        </tr>
        <tr>
            <td class="cat" nowrap="nowrap">Catalog:</td>
            <td class="stat" align="right" nowrap="nowrap">
<%--
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
--%>
            </td>
        </tr>
    </table>
</td>
<td width="75%" valign="top">
    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="statTable">
        <tr><td class="tableTitle" colspan="10">Registrants</td></tr>
        <tr>
            <td CLASS="tableHeader">Handle</td>
            <td CLASS="tableHeader" align="center">Registration Date</td>
            <td CLASS="tableHeader" align="center">Submission Date</td>
         </tr>
          <rsc:iterator list="<%=registrants%>" id="resultRow">
          <tr>
              <td class="statDk">
                  <tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id") %>' context='<%=resultRow.getStringItem("phase")%>'/>
              </td>
              <td class="statDk" align="center" nowrap="0">
                  <rsc:item name="inquiry_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="America/New_York"/>
              </td>
              <td class="statDk" align="center" nowrap="0">
                  <rsc:item name="submission_date" row="<%=resultRow%>" format="MM.dd.yyyy hh:mm a z" timeZone="America/New_York" ifNull="-"/>
              </td>
          </tr>
          </rsc:iterator>
      </table>
      </td>
   </tr>
</table>

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


