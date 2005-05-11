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
<% ResultSetContainer rscProject = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("project_details"); %>
<% ResultSetContainer rsc = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("tco04_project_results"); %>
<% ResultSetContainer rscContest = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("contest_details"); %>
<%
    boolean isComplete = false;
    if(rscProject.getIntItem(0, "complete_status") == 1) {
        isComplete = true;
    }
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
                                <td class=usdcTitle><A class= usdcTitle href="/tc?module=TCO04ContestDetails&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></A> - <A class="usdcTitle" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=rscProject.getRow(0)%>"/>"><rsc:item name="component_name" row="<%=rscProject.getRow(0)%>"/></A>
                                <%if(!isComplete) {%>*<%}%></td>
                            </tr>
                        </table>
                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" nowrap=nowrap>Competitor</td>
                                <td class="sidebarTitle" align=center nowrap=nowrap>Submission Date</td>
                                <td class="sidebarTitle" align=center>Place</td>
                                <td class="sidebarTitle" align=center>Score</td>
                                <td class="sidebarTitle" align=right>Prizes</td>
                            </tr>
                            <rsc:iterator list="<%=rsc%>" id="resultRow">
                            <tr>
                                <td class="sidebarText"><a href="/stat?tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                                <td class="sidebarText" align=center nowrap=nowrap><rsc:item format="MM.dd.yyyy hh:mma" name="submit_timestamp" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><rsc:item name="placed" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=center><rsc:item name="final_score" format="0.00" row="<%=resultRow%>"/></td>
                                <td class="sidebarText" align=right><rsc:item name="payment" ifNull="" format="$#,##0" row="<%=resultRow%>"/></td>
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
