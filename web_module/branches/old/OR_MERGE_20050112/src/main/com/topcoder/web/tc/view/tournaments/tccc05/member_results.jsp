<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.TCCC05MemberResult,
                 java.util.List"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>
<% ResultSetContainer rscContest = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("contest_details"); %>
<% ResultSetContainer rscUser = (ResultSetContainer) ((Map)request.getAttribute("resultMap")).get("user_details"); %>

<% List lst = (List)request.getAttribute("results");%>
<%
    boolean isComplete = true;
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
                                <td class="usdcTitle" colspan=5 align=left>
                                <%String module = rscContest.getIntItem(0, "contest_type_id") == 8 ? "TCCC05ContestDetails" : "TCCC05ContestDetailsOverall";%>
                                <A href="/tc?module=<%=module%>&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>" class=usdcTitle><rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>" /></A> - 
                                <A href="/stat?c=member_profile&cr=<rsc:item name="coder_id" row="<%=rscUser.getRow(0)%>" />" class=usdcTitle><rsc:item name="handle" row="<%=rscUser.getRow(0)%>" /></A>
                                </td>
                            </tr>
                        </table>
                        <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                            <tr>
                                <td class="sidebarTitle" nowrap=nowrap>Component Name</td>                              
                                <td class="sidebarTitle" align=center>Submit Date</td>
                                <td class="sidebarTitle" align=center>Points</td>
                                <td class="sidebarTitle" align=right>Component Prize</td>
                                <td class="sidebarTitle" align=center >Placed</td>
                                <td class="sidebarTitle" align=center >Placement Points</td>
                            </tr>
                            <%for(int i = 0; i < lst.size(); i++) { %>
                            <tr>
                                <% TCCC05MemberResult result = (TCCC05MemberResult)lst.get(i); %>
                                <td class="sidebarText"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=result.getCompID()%>"><%=result.getComponent()%></A>
                                <% if(!result.isComplete())  { 
                                    isComplete = false;%>
                                    *
                                <% } %>
                                </td>                               
                                <td class="sidebarText" align=center nowrap=nowrap><%=result.getSubmitTimestamp()%></td>
                                <td class="sidebarText" align=center><%=result.getScore()%></td>
                                <td class="sidebarText" align=right><%=result.getPayment()%></td>
                                <td class="sidebarText" align=center><%=result.getPlaced()%></td>
                                <td class="sidebarText" align=center><%=result.getPoints()%></td>
                            </tr>
                            <% } %>
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
