<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament</title>
<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
</head>
<body>
<a name="top">

<%
if(Integer.parseInt(request.getParameter("ph")) == 112)
{
%>
<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="design"/>
<jsp:param name="tabLev3" value="results"/>
</jsp:include>
<%
}
else
{
%>
<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="development"/>
<jsp:param name="tabLev3" value="results"/>
</jsp:include>
<%
}
%>


<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco04_online_round_results"); %>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

		<br/>
                        <a name="week"></a>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                                <td class=usdcTitle>Online Rounds</td>
                            </tr>
                        </table>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" width=30%>Contest</td>
                                <td class="sidebarTitle" width=20% align=center>Start Date</td>
                                <td class="sidebarTitle" width=20% align=center>End Date</td>
                                <td class="sidebarTitle" width=10% align=center>Winner</td>
                                <td class="sidebarTitle" width=10% align=right nowrap=nowrap>Contest Prizes</td>
                                <td class="sidebarTitle" width=10% align=center>Components</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText" nowrap=nowrap><A href="/tc?module=TCO04ContestDetails&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>"><rsc:item name="contest_name" row="<%=resultRow%>"/></A></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="start_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="end_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/stat?tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                                <td class="sidebarText" align=right><rsc:item format="$#,##0" name="prize_payment" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=TCO04ContestProjects&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>">view</a></td>
                            </tr>
                            </rsc:iterator>
                        </table>
                        
                        <br/>
<% rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco04_overall_results"); %>                    
                        <a name="month"></a>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                                <td class=usdcTitle>Overall</td>
                            </tr>
                        </table>
                        <table width="100%" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" width=30%>Contest</td>
                                <td class="sidebarTitle" width=20% align=center>Start Date</td>
                                <td class="sidebarTitle" width=20% align=center>End Date</td>
                                <td class="sidebarTitle" width=10% align=center>Winner</td>
                                <td class="sidebarTitle" width=10% align=right nowrap=nowrap>Contest Prizes</td>
                                <td class="sidebarTitle" width=10% align=center>Components</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText" nowrap=nowrap><A href="/tc?module=TCO04ContestDetailsOverall&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>"><rsc:item name="contest_name" row="<%=resultRow%>"/></A></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="start_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="end_date" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/stat?tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                                <td class="sidebarText" align=right><rsc:item format="$#,##0" name="prize_payment" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=TCO04ContestProjects&ct=<rsc:item name="contest_id" row="<%=resultRow%>"/>">view</a></td>
                            </tr>
                            </rsc:iterator>
                        </table>

        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco04"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../foot.jsp" />

</body>

</html>
