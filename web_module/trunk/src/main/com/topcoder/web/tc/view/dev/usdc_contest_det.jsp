<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.util.ApplicationServer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="../script.jsp" />

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
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="contests"/>
                <jsp:param name="level3" value="ultimate"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />


<!-- Tab bar links-->
<jsp:include page="usdc_links.jsp" >
   <jsp:param name="selectedTab" value="results"/>
</jsp:include>

<p>
<a href="/tc?module=USDCResults">Contest Results</a>&nbsp;&nbsp;|&nbsp;&nbsp;
Contest Details - <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/>
</p>

<h2>Results</h2>

                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class=header colspan=6><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>" /> Projects</td>
                            </tr>
                            <tr>
                                <td class="sidebarTitle" nowrap=nowrap>Component Name</td>
                                <td class="sidebarTitle" align=center nowrap=nowrap>Details</td>
                                <td class="sidebarTitle" align=center>Start Date</td>
                                <td class="sidebarTitle" align=center>End Date</td>
                                <td class="sidebarTitle" align=right>1st Place Prize</td>
                                <td class="sidebarTitle" align=right>2nd Place Prize</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>"><rsc:item name="component_name" row="<%=resultRow%>"/></A></td>
                                <td class="sidebarText" align=center><A href="/tc?module=USDCProjectDetails&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">details</A></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item name="start_date" format="MM.dd.yyyy" row="<%=resultRow%>"/> 9:00AM</td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item name="end_date" format="MM.dd.yyyy" row="<%=resultRow%>"/> 9:00AM</td>
                                <td class="sidebarText" align=right>$<rsc:item name="first_prize" format="#,##0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=right>$<rsc:item name="second_prize" format="#,##0" row="<%=resultRow%>"/></td>
                            </tr>
                            </rsc:iterator>
                        </table>
                        
                        <br/>
                        
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

<jsp:include page="../foot.jsp" />

</body>

</html>
