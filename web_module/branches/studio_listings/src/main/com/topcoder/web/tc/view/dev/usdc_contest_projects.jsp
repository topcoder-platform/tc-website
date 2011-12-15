<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<% ResultSetContainer rscContest = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("contest_details"); %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("contest_projects"); %>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />
<%
    boolean isComplete = true;
%>

<!-- Tab bar links-->
<%
if( rscContest.getIntItem(0, "phase_id") == 112)
{
%>
<jsp:include page="usdc_links.jsp" >
   <jsp:param name="selectedTab" value="results"/>
   <jsp:param name="selectedTab2" value="design"/>
</jsp:include>
<%
}
else
{
%>
<jsp:include page="usdc_links.jsp" >
   <jsp:param name="selectedTab" value="results"/>
   <jsp:param name="selectedTab2" value="development"/>
</jsp:include>
<%
}
%>

                        <br/>
                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                                <td class="usdcTitle" nowrap=nowrap><a href="/tc?module=USDCContestDetails&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>" /></a> - Components</td>
                            </tr>
                         </table>
                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" nowrap=nowrap>Component Name</td>
                                <td class="sidebarTitle" align=center nowrap=nowrap>Results</td>
                                <td class="sidebarTitle" align=center>Start Date</td>
                                <td class="sidebarTitle" align=center>End Date</td>
                                <td class="sidebarTitle" align=right>1st Place Prize</td>
                                <td class="sidebarTitle" align=right>2nd Place Prize</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>"><rsc:item name="component_name" row="<%=resultRow%>"/></A>
                                <% if(resultRow.getIntItem("is_complete") == 0)  { 
                                    isComplete = false;%>
                                    *
                                <% } %>
                                </td>
                                <td class="sidebarText" align=center><A href="/tc?module=USDCProjectDetails&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">results</A></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item name="start_date" format="MM.dd.yyyy" row="<%=resultRow%>"/> 9:00AM</td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item name="end_date" format="MM.dd.yyyy" row="<%=resultRow%>"/> 9:00AM</td>
                                <td class="sidebarText" align=right>$<rsc:item name="first_prize" format="#,##0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=right>$<rsc:item name="second_prize" format="#,##0" row="<%=resultRow%>"/></td>
                            </tr>
                            </rsc:iterator>
                        </table>
                        <%if(!isComplete) {%>
                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                              <td class="bodyText">* This project is still in progress, results subject to change</td>
                            </tr>
                        </table>
                        <% } %>
                        <br/>
                        
        <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

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

<jsp:include page="../foot.jsp" />

</body>

</html>
