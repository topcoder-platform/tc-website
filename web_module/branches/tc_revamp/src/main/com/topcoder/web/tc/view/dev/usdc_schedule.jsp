<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />


<!-- Tab bar links-->
<jsp:include page="usdc_links.jsp" >
   <jsp:param name="selectedTab" value="schedule"/>
</jsp:include>


<h2>Schedule</h2>
		<div align="center">
							<p><strong>All times are Eastern Standard Time, unless otherwise Noted.</strong></p>

						<table width="550" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                			<tr>
                    			<td width="31%" class="sidebarTitle" valign="top"><strong>Design Contest</strong></td>
                    			<td width="23%" class="sidebarTitle">Start Date/<br/>Projects Posted</td>
                    			<td width="23%" class="sidebarTitle">Registration Deadline</td>
                    			<td width="23%" class="sidebarTitle">End Date/<br/>Submission Deadline</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top">Quarter 1</td>
                    			<td width="23%" class="sidebarText">06.03.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText"></td>
                    			<td width="23%" class="sidebarText">09.02.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="40" height="1" border="0">Month 1</td>
                    			<td width="23%" class="sidebarText">06.03.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText"></td>
                    			<td width="23%" class="sidebarText">07.01.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 1</td>
                    			<td width="23%" class="sidebarText">06.03.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.04.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.10.2004 9:00AM</td>
                			</tr>             			
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 2</td>
                    			<td width="23%" class="sidebarText">06.10.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.11.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.17.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 3</td>
                    			<td width="23%" class="sidebarText">06.17.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.18.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.24.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 4</td>
                    			<td width="23%" class="sidebarText">06.24.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.25.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.01.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="40" height="1" border="0">Month 2</td>
                    			<td width="23%" class="sidebarText">07.01.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText"></td>
                    			<td width="23%" class="sidebarText">08.05.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 5</td>
                    			<td width="23%" class="sidebarText">07.01.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.02.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.08.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 6</td>
                    			<td width="23%" class="sidebarText">07.08.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.09.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.15.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 7</td>
                    			<td width="23%" class="sidebarText">07.15.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.16.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.22.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 8</td>
                    			<td width="23%" class="sidebarText">07.22.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.23.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.29.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 9</td>
                    			<td width="23%" class="sidebarText">07.29.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.30.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.05.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="40" height="1" border="0">Month 3</td>
                    			<td width="23%" class="sidebarText">08.05.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText"></td>
                    			<td width="23%" class="sidebarText">09.02.2004 9:00AM</td>
                			</tr>                			


                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 10</td>
                    			<td width="23%" class="sidebarText">08.05.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.06.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.12.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 11</td>
                    			<td width="23%" class="sidebarText">08.12.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.13.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.19.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 12</td>
                    			<td width="23%" class="sidebarText">08.19.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.20.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.26.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 13</td>
                    			<td width="23%" class="sidebarText">08.26.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.27.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">09.02.2004 9:00AM</td>
                			</tr>
						</table>
						
						<p><br/></p>
						
						<table width="550" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                			<tr>
                    			<td width="31%" class="sidebarTitle" valign="top"><strong>Development Contest</strong></td>
                    			<td width="23%" class="sidebarTitle">Start Date/<br/>Projects Posted</td>
                    			<td width="23%" class="sidebarTitle">Registration Deadline</td>
                    			<td width="23%" class="sidebarTitle">End Date/<br/>Submission Deadline</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top">Quarter 1</td>
                    			<td width="23%" class="sidebarText">06.01.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText"></td>
                    			<td width="23%" class="sidebarText">08.31.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="40" height="1" border="0">Month 1</td>
                    			<td width="23%" class="sidebarText">06.01.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText"></td>
                    			<td width="23%" class="sidebarText">06.29.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 1</td>
                    			<td width="23%" class="sidebarText">06.01.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.02.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.08.2004 9:00AM</td>
                			</tr>             			
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 2</td>
                    			<td width="23%" class="sidebarText">06.08.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.09.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.15.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 3</td>
                    			<td width="23%" class="sidebarText">06.15.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.16.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.22.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 4</td>
                    			<td width="23%" class="sidebarText">06.22.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.23.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.29.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="40" height="1" border="0">Month 2</td>
                    			<td width="23%" class="sidebarText">06.29.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText"></td>
                    			<td width="23%" class="sidebarText">07.27.2004 9:00AM</td>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 5</td>
                    			<td width="23%" class="sidebarText">06.29.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">06.30.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.06.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 6</td>
                    			<td width="23%" class="sidebarText">07.06.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.07.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.13.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 7</td>
                    			<td width="23%" class="sidebarText">07.13.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.14.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.20.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 8</td>
                    			<td width="23%" class="sidebarText">07.20.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.21.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.27.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="40" height="1" border="0">Month 3</td>
                    			<td width="23%" class="sidebarText">07.27.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText"></td>
                    			<td width="23%" class="sidebarText">08.31.2004 9:00AM</td>
                			</tr>                			


                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 9</td>
                    			<td width="23%" class="sidebarText">07.27.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">07.28.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.03.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 10</td>
                    			<td width="23%" class="sidebarText">08.03.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.04.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.10.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 11</td>
                    			<td width="23%" class="sidebarText">08.10.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.11.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.17.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 12</td>
                    			<td width="23%" class="sidebarText">08.17.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.18.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.24.2004 9:00AM</td>
                			</tr>
                			<tr>
                    			<td width="31%" class="sidebarText" valign="top"><img src="/i/clear.gif" width="80" height="1" border="0">Week 13</td>
                    			<td width="23%" class="sidebarText">08.24.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.25.2004 9:00AM</td>
                    			<td width="23%" class="sidebarText">08.31.2004 9:00AM</td>
                			</tr>
						</table>

		</div>
			<p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>

         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
