<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
                 
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge  - Computer Programming Tournament - Overview</title>

<jsp:include page="../../script.jsp" />

<% ResultSetContainer rsc = (ResultSetContainer)request.getAttribute("studentRepList"); %>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" width="100%">

<table width="550" align="center" border="0" cellpadding="0" cellspacing="10">
	<tr><td colspan="2" class="bodyText">
		<div align="center"><img src="/i/tournament/tccc05/monitor_logo.jpg" width="424" height="336" border="0"/></div>
                
                <table width="510" align="center" border=0 cellpadding=0 cellspacing=0>
					<tr><td><h2>Student Reps</h2></td></tr>
				</table>
                <table width="510" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle">
                        Handle
                    </td>
                    <td class="sidebarTitle">
                        School
                    </td>
                    <td class="sidebarTitle">
                        # of Referrals
                    </td>
                    <rsc:iterator list="<%=rsc%>" id="resultRow">
                    <tr>
                        <td class="sidebarText"><a href="/stat?c=member_profile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                        <td class="sidebarText"><rsc:item name="school_name" row="<%=resultRow%>"/></td>
                        <td class="sidebarText"><rsc:item name="total_count" row="<%=resultRow%>"/></td>
                    </tr>
                    </rsc:iterator>
                </tr>
                </table>
	</td></tr>
</table>

            


         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr> 
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
