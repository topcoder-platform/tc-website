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

</head>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<% ResultSetContainer rscProject = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("project_details"); %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("project_results"); %>

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
<a href="/">Contest Results</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="/">Contest Details</a>&nbsp;&nbsp;|&nbsp;&nbsp;
<a href="/">Project Details</a>
</p>

<h2>Results</h2>


                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class=header colspan=7><A class="header" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=rscProject.getRow(0)%>"/>"><rsc:item name="component_name" row="<%=rscProject.getRow(0)%>"/></A>
                            </tr>
                            <tr>
                                <td class="sidebarTitle" nowrap=nowrap>Competitor</td>
                                <td class="sidebarTitle" align=center nowrap=nowrap>Submission Date</td>
                                <td class="sidebarTitle" align=center>Place</td>
                                <td class="sidebarTitle" align=center>Score</td>
                                <td class="sidebarTitle" align=right>Prizes</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText"><a href="/stat?c=member_profile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                                <td class="sidebarText" align=center nowrap=nowrap>06.03.2004 9:00AM</td>
                                <td class="sidebarText" align=center>1</td>
                                <td class="sidebarText" align=center>90.00</td>
                                <td class="sidebarText" align=right>$1,000</td>
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
