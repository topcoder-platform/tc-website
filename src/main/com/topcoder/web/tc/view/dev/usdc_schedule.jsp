<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Ultimate Software Development Contest</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="contests"/>
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

<!-- Tab bar sublinks-->
<jsp:include page="usdc_sublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

<h2>Schedule</h2>
		<div align="center">
			<table>
				<tr>
					<td valign="top">
						<table width="280" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                			<tr>
                    			<td width="40%" class="sidebarTitle" valign="top"><strong>Design Contest</strong></td>
                    			<td width="30%" class="sidebarTitle">Start Date</td>
                    			<td width="30%" class="sidebarTitle">End Date</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Quarter 1</td>
                    			<td width="30%" class="sidebarText">6/3/2004</td>
                    			<td width="30%" class="sidebarText">9/2/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Month 1</td>
                    			<td width="30%" class="sidebarText">6/3/2004</td>
                    			<td width="30%" class="sidebarText">7/1/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Month 2</td>
                    			<td width="30%" class="sidebarText">7/1/2004</td>
                    			<td width="30%" class="sidebarText">8/5/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Month 3</td>
                    			<td width="30%" class="sidebarText">8/5/2004</td>
                    			<td width="30%" class="sidebarText">9/2/2004</td>
                			</tr>                			
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 1</td>
                    			<td width="30%" class="sidebarText">6/3/2004</td>
                    			<td width="30%" class="sidebarText">6/10/2004</td>
                			</tr>             			
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 2</td>
                    			<td width="30%" class="sidebarText">6/10/2004</td>
                    			<td width="30%" class="sidebarText">6/17/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 3</td>
                    			<td width="30%" class="sidebarText">6/17/2004</td>
                    			<td width="30%" class="sidebarText">6/24/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 4</td>
                    			<td width="30%" class="sidebarText">6/24/2004</td>
                    			<td width="30%" class="sidebarText">7/1/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 5</td>
                    			<td width="30%" class="sidebarText">7/1/2004</td>
                    			<td width="30%" class="sidebarText">7/8/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 6</td>
                    			<td width="30%" class="sidebarText">7/8/2004</td>
                    			<td width="30%" class="sidebarText">7/15/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 7</td>
                    			<td width="30%" class="sidebarText">7/15/2004</td>
                    			<td width="30%" class="sidebarText">7/22/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 8</td>
                    			<td width="30%" class="sidebarText">7/22/2004</td>
                    			<td width="30%" class="sidebarText">7/29/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 9</td>
                    			<td width="30%" class="sidebarText">7/29/2004</td>
                    			<td width="30%" class="sidebarText">8/5/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 10</td>
                    			<td width="30%" class="sidebarText">8/5/2004</td>
                    			<td width="30%" class="sidebarText">8/12/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 11</td>
                    			<td width="30%" class="sidebarText">8/12/2004</td>
                    			<td width="30%" class="sidebarText">8/19/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 12</td>
                    			<td width="30%" class="sidebarText">8/19/2004</td>
                    			<td width="30%" class="sidebarText">8/26/2004</td>
                			</tr>
                			<tr>
                    			<td width="40%" class="sidebarText" valign="top">Week 13</td>
                    			<td width="30%" class="sidebarText">8/26/2004</td>
                    			<td width="30%" class="sidebarText">9/2/2004</td>
                			</tr>
						</table>
					</td>
					<td><img src="/i/clear.gif" width="10" height="1" border="0"></td>
					<td valign="top">
						<table width="280" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                			<tr>
                    			<td width="50%" class="sidebarTitle" valign="top"><strong>Development Contest</strong></td>
                    			<td width="25%" class="sidebarTitle">Start Date</td>
                    			<td width="25%" class="sidebarTitle">End Date</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Quarter 1</td>
                    			<td width="25%" class="sidebarText">6/1/2004</td>
                    			<td width="25%" class="sidebarText">8/31/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Month 1</td>
                    			<td width="25%" class="sidebarText">6/1/2004</td>
                    			<td width="25%" class="sidebarText">6/29/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Month 2</td>
                    			<td width="25%" class="sidebarText">6/29/2004</td>
                    			<td width="25%" class="sidebarText">7/27/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Month 3</td>
                    			<td width="25%" class="sidebarText">7/27/2004</td>
                    			<td width="25%" class="sidebarText">8/31/2004</td>
                			</tr>                			
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 1</td>
                    			<td width="25%" class="sidebarText">6/1/2004</td>
                    			<td width="25%" class="sidebarText">6/8/2004</td>
                			</tr>             			
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 2</td>
                    			<td width="25%" class="sidebarText">6/8/2004</td>
                    			<td width="25%" class="sidebarText">6/15/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 3</td>
                    			<td width="25%" class="sidebarText">6/15/2004</td>
                    			<td width="25%" class="sidebarText">6/22/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 4</td>
                    			<td width="25%" class="sidebarText">6/22/2004</td>
                    			<td width="25%" class="sidebarText">6/29/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 5</td>
                    			<td width="25%" class="sidebarText">6/29/2004</td>
                    			<td width="25%" class="sidebarText">7/6/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 6</td>
                    			<td width="25%" class="sidebarText">7/6/2004</td>
                    			<td width="25%" class="sidebarText">7/13/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 7</td>
                    			<td width="25%" class="sidebarText">7/13/2004</td>
                    			<td width="25%" class="sidebarText">7/20/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 8</td>
                    			<td width="25%" class="sidebarText">7/20/2004</td>
                    			<td width="25%" class="sidebarText">7/27/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 9</td>
                    			<td width="25%" class="sidebarText">7/27/2004</td>
                    			<td width="25%" class="sidebarText">8/3/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 10</td>
                    			<td width="25%" class="sidebarText">8/3/2004</td>
                    			<td width="25%" class="sidebarText">8/10/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 11</td>
                    			<td width="25%" class="sidebarText">8/10/2004</td>
                    			<td width="25%" class="sidebarText">8/17/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 12</td>
                    			<td width="25%" class="sidebarText">8/17/2004</td>
                    			<td width="25%" class="sidebarText">8/24/2004</td>
                			</tr>
                			<tr>
                    			<td width="50%" class="sidebarText" valign="top">Week 13</td>
                    			<td width="25%" class="sidebarText">8/24/2004</td>
                    			<td width="25%" class="sidebarText">8/31/2004</td>
                			</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="right.jsp"/>
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
