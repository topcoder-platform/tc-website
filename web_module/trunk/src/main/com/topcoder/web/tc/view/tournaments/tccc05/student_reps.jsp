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

      <table cellpadding="0" cellspacing="3" border="0" class="bodyText" width="510">
         <tr>
            <td align="left" class="bodyText" valign="top">
               <img src="/i/m/supernova_mug.gif" alt="" width="55" height="61" border="0" vspace="5" align="left" class="myStatsPhoto"/>
            </td>

            <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

            <td align="left" width ="100%" class="bodyText" valign="top" rowspan="2">
               <p>
               The following are the results for the TCCC05 Referral Program.
               <br><br>
               Congratulations to <strong>supernova</strong> for outperforming the rest of the Student Representatives!  As a result of his efforts, he has won a trip to the 2005 TopCoder Collegiate Challenge onsite finals, and has added more than <strong>75 new TopCoder members</strong>!</p>
            </td>
         </tr>
         <tr>
            <td align="left" class="bodyText" valign="top">
               <a class="bodyText" href="/stat?c=member_profile&amp;cr=7371063"><strong>supernova</strong></a>
            </td>
         </tr>
      </table>

               <br><br>
               Check out <A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=supernova">"My TCCC05 Experience"</A>, supernova's personal account of what it was like at the TCCC05.
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