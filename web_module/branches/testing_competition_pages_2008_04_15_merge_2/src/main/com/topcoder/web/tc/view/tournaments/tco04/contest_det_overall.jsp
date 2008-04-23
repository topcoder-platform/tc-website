<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.TCO04OverallResult,
                 java.util.List"%>
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
<% List lst = (List)request.getAttribute("results");%>

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
                            <%for(int i = 0; i < lst.size(); i++) { %>
                            <tr>
                                <% TCO04OverallResult result = (TCO04OverallResult)lst.get(i); %>
                                <td class="sidebarText" ><a href="/tc?module=MemberProfile&cr=<%=result.getUserID()%>"><%=result.getHandle()%></a>
                                <% if(result.isPending())  { 
                                    isComplete = false;%>
                                    *
                                <% } %>
                                </td>
                                <td class="sidebarText" align=center ><%=result.getPoints()%></td>
                                <td class="sidebarText" align=center ><%=result.getCompleteProjects()%></td>
                                <td class="sidebarText" align=center ><%=result.getIncompleteProjects()%></td>
                                <td class="sidebarText" align=right><%=result.getContestPrize()%></td>
                                <td class="sidebarText" align=center><a href="/tc?module=TCO04MemberResults&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&cr=<%=result.getUserID()%>">results</a></td>
                            </tr>
                            <% }%>
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
