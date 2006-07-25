<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />
<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="student_reps"/>
<jsp:param name="tabLev3" value=""/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<span class="bigTitle">Student Representatives</span>
<br><br>
Here are the results of the TCCC06 Referral Program. Check back often for updates.
<br><br>
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
		<%--<rsc:iterator list="<%=rsc%>" id="resultRow">--%>
		<tr>
			<td class="sidebarText">dok<%--<a href="/tc?module=MemberProfile&cr=<rsc:item name="user_id" row="<%=resultRow%>"/>"><rsc:item name="handle" row="<%=resultRow%>"/></a>--%></td>
			<td class="sidebarText">hard knocks<%--<rsc:item name="school_name" row="<%=resultRow%>"/>--%></td>
			<td class="sidebarText" align=center>111<%--<rsc:item name="total_count" row="<%=resultRow%>"/>--%></td>
			<td class="sidebarText" align=center>52<%--<rsc:item name="total_comp_count" row="<%=resultRow%>"/>--%></td>
		</tr>
		<%--</rsc:iterator>--%>
	</tr>
	</table>
<br><br><br><br><br><br><br><br>

 
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
