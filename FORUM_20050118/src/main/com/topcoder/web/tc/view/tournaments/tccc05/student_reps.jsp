<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge  - Computer Programming Tournament - Overview</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>

<% ResultSetContainer rsc = (ResultSetContainer)request.getAttribute("studentRepList"); %>
</head>

<body>
<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="student_reps"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>

        <p class=bigTitle>Student Representatives</p>

               <p>The following is the results for the TCCC05 Referral Program.</p>

                <table width="510" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle">
                        Handle
                    </td>
                    <td class="sidebarTitle">
                        School
                    </td>
                    <td class="sidebarTitle" align=center>
                        # of Referrals
                    </td>
                    <td class="sidebarTitle" align=center>
                        Qualification Participants
                    </td>
                    <rsc:iterator list="<%=rsc%>" id="resultRow">
                    <tr>
                        <td class="sidebarText"><a href="/stat?c=member_profile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a></td>
                        <td class="sidebarText"><rsc:item name="school_name" row="<%=resultRow%>"/></td>
                        <td class="sidebarText" align=center><rsc:item name="total_count" row="<%=resultRow%>"/></td>
                        <td class="sidebarText" align=center><rsc:item name="total_comp_count" row="<%=resultRow%>"/></td>
                    </tr>
                    </rsc:iterator>
                </tr>
                </table>

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