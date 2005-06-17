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
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("contest_results_monthly"); %>

<%
    boolean isComplete = true;
%>
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
                                <td class="usdcTitle" colspan=4 align=left>
                                <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>" />
                                </td>
                            </tr>
                        </table>
                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle">Handle</td>
                                <td class="sidebarTitle" align=center>Position Points</td>
                                <td class="sidebarTitle" align=center>Complete Projects</td>
                                <td class="sidebarTitle" align=center>Projects In Progess</td>
                                <td class="sidebarTitle" align=right>Contest Prize</td>
                                <td class="sidebarTitle" align=center>Results</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText" ><a href="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a>
                                <% if(resultRow.getIntItem("complete_status") == 0)  { 
                                    isComplete = false;%>
                                    *
                                <% } %>
                                </td>
                                <td class="sidebarText" align=center ><rsc:item name="position_points" format="0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center ><rsc:item name="complete_count" format="0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center ><rsc:item name="incomplete_count" format="0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=right><rsc:item ifNull="" name="prize_payment" format="$#,###" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=USDCMemberResults&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>">results</a></td>
                            </tr>
                            </rsc:iterator>
                        </table>
                        <%if(!isComplete) {%>
                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                              <td class="bodyText">* Contains results from projects still in progress, results subject to change</td>
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
