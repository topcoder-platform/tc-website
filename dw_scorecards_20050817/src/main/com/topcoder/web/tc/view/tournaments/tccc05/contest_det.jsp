<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.DataAccessConstants, 
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.TCCC05ContestDetail,
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
                                <% TCCC05ContestDetail result = (TCCC05ContestDetail)lst.get(i); %>
                                <td class="sidebarText" ><a href="/tc?module=MemberProfile&cr=<%=result.getUserID()%>"><%=result.getHandle()%></a>
                                <% if(result.getIncomplete() > 0)  { 
                                    isComplete = false;%>
                                    *
                                <% } %>
                                </td>
                                <td class="sidebarText" align=center ><%=result.getPoints()%></td>
                                <td class="sidebarText" align=center ><%=result.getComplete()%></td>
                                <td class="sidebarText" align=center ><%=result.getIncomplete()%></td>
                                <td class="sidebarText" align=right><%=result.getPayment()%></td>
                                <td class="sidebarText" align=center><a href="/tc?module=TCCC05MemberResults&ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&cr=<%=result.getUserID()%>">results</a></td>
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
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
