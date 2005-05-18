<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.util.ApplicationServer"%>
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
<% ResultSetContainer rscContest = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("contest_details"); %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco04_contest_results_monthly"); %>

<%
    boolean isComplete = true;
%>
<%
if( rscContest.getIntItem(0, "phase_id") == 112)
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



<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

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
                                <td class="sidebarText" ><a href="/stat?tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a>
                                <% if(resultRow.getIntItem("complete_status") == 0)  { 
                                    isComplete = false;%>
                                    *
                                <% } %>
                                </td>
                                <td class="sidebarText" align=center ><rsc:item name="position_points" format="0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center ><rsc:item name="complete_count" format="0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center ><rsc:item name="incomplete_count" format="0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=right><rsc:item name="prize_payment" ifNull="" format="$#,##0" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><a href="/tc?module=TCO04MemberResults&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>">results</a></td>
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
