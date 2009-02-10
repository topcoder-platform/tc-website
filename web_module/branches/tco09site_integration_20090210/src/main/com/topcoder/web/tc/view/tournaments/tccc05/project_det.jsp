<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.ProjectDetail,
                 java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>
<body>
<% ResultSetContainer rscProject = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("project_details"); %>
<% ResultSetContainer rscContest = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("contest_details"); %>
<% List lst = (List)request.getAttribute("results");%>
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
            
		    <table width="510" align="center" border="0" cellpadding="5" cellspacing="0" class="bodyText">
                            <tr>
                                <td class=usdcTitle><A class= usdcTitle href="/tc?module=TCCC05ContestDetails&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>"><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/></A> - <A class="usdcTitle" href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=rscProject.getRow(0)%>"/>"><rsc:item name="component_name" row="<%=rscProject.getRow(0)%>"/></A>
                                <%if(!isComplete) {%>*<%}%></td> 
                            </tr>
                        </table>
                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" nowrap=nowrap>Competitor</td>
                                <td class="sidebarTitle" align=center nowrap=nowrap>Submission Date</td>
                                <td class="sidebarTitle" align=center>Place</td>
                                <td class="sidebarTitle" align=center>Placement Points</td>
                                <td class="sidebarTitle" align=center>Score</td>
                                <td class="sidebarTitle" align=right>Prizes</td>
                            </tr>                           
                            <%for(int i = 0; i < lst.size(); i++) { %>
                            <tr>
                                <% ProjectDetail result = (ProjectDetail)lst.get(i); %>
                                <td class="sidebarText"><a href="/tc?module=MemberProfile&cr=<%=result.getUserID()%>"><%=result.getHandle()%></a></td>
                                <td class="sidebarText" align=center nowrap=nowrap><tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="'<strong>'MM.dd.yyyy'</strong><br>'HH:mm z"/></td>
                                <td class="sidebarText" align=center><%=result.getPlaced()%></td>
                                <td class="sidebarText" align=center><%=result.getPoints()%></td>
                                <td class="sidebarText" align=center><%=result.getScore()%></td>
                                <td class="sidebarText" align=right><%=result.getPayment()%></td>
                            </tr>
                            <% }%>
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
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
