<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Challenge</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("usdc_weekly_results"); %>

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
if(Integer.parseInt(request.getParameter("ph")) == 112)
{
%>
<!-- Tab bar links-->
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
                        <a name="week"></a>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                                <td class=usdcTitle>Weekly Challenges</td>
                            </tr>
                        </table>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" width=30%>Challenge</td>
                                <td class="sidebarTitle" width=20% align=center>Start Date</td>
                                <td class="sidebarTitle" width=20% align=center>End Date</td>
                                <td class="sidebarTitle" width=10% align=center>Winner</td>
                                <td class="sidebarTitle" width=10% align=right>Challenge Prizes</td>
                                <td class="sidebarTitle" width=10% align=center>Components</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText" nowrap=nowrap><A href="/tc?module=USDCContestDetails&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>"><rsc:item name="contest_name" row="<%=resultRow%>"/></A></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="start_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="end_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                                <td class="sidebarText" align=right><rsc:item format="$#,##0.00" name="prize_payment" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=USDCContestProjects&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>">view</a></td>
                            </tr>
                            </rsc:iterator>
                        </table>
                        
                        <br/>
<% rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("usdc_monthly_results"); %>                    
                        <a name="month"></a>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                                <td class=usdcTitle>Monthly Challenges</td>
                            </tr>
                        </table>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" width=30%>Challenge</td>
                                <td class="sidebarTitle" width=20% align=center>Start Date</td>
                                <td class="sidebarTitle" width=20% align=center>End Date</td>
                                <td class="sidebarTitle" width=10% align=center>Winner</td>
                                <td class="sidebarTitle" width=10% align=right>Challenge Prizes</td>
                                <td class="sidebarTitle" width=10% align=center>Components</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText" nowrap=nowrap><A href="/tc?module=USDCContestDetails&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>"><rsc:item name="contest_name" row="<%=resultRow%>"/></A></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="start_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="end_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                                <td class="sidebarText" align=right><rsc:item format="$#,##0" name="prize_payment" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=USDCContestProjects&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>">view</a></td>
                            </tr>
                            </rsc:iterator>
                        </table>

                        <br/>
<% rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("usdc_quarterly_results"); %>                    
                        <a name="quarter"></a>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                                <td class=usdcTitle>Quarterly Challenges</td>
                            </tr>
                        </table>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" width=30%>Challenge</td>
                                <td class="sidebarTitle" width=20% align=center>Start Date</td>
                                <td class="sidebarTitle" width=20% align=center>End Date</td>
                                <td class="sidebarTitle" width=10% align=center>Winner</td>
                                <td class="sidebarTitle" width=10% align=right>Challenge Prizes</td>
                                <td class="sidebarTitle" width=10% align=center>Components</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText" nowrap=nowrap><A href="/tc?module=USDCContestDetails&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>"><rsc:item name="contest_name" row="<%=resultRow%>"/></A></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="start_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="end_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                                <td class="sidebarText" align=right><rsc:item format="$#,##0" name="prize_payment" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=USDCContestProjects&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>">view</a></td>
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
