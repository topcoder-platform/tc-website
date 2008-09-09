<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="component"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=bigTitle>Component Schedule</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr valign="top">
                    <td class="sidebarText" width="25%">Registration</td>
                    <td class="sidebarText" width="75%">
                        OPENS: Monday, December 20, 2004 at 9:00 AM EST<br /><br/>
                        CLOSES: Monday, January 3, 2005 at 6:00 PM EST
                    </td>
                </tr>
            </table>

			<br/><br/>

			<table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle">Design Contest</td>
                    <td class="sidebarTitle">Start Date/Projects Posted</td>
                    <td class="sidebarTitle">Registration Deadline</td>
                    <td class="sidebarTitle">End Date / Submission Deadline</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Week 1</td>
                    <td class="sidebarText" nowrap=nowrap>01.06.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.08.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.13.2005 9:00AM</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Week 2</td>
                    <td class="sidebarText" nowrap=nowrap>01.13.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.15.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.20.2005 9:00AM</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Week 3</td>
                    <td class="sidebarText" nowrap=nowrap>01.20.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.22.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.27.2005 9:00AM</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Week 4</td>
                    <td class="sidebarText" nowrap=nowrap>01.27.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.29.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>02.03.2005 9:00AM</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Championship round</td>
                    <td class="sidebarText" nowrap=nowrap>03.10.2005</td>
                    <td class="sidebarText" nowrap=nowrap>N/A</td>
                    <td class="sidebarText" nowrap=nowrap>03.10.2005</td>
				</tr>
			</table>

			<br/><br/>

			<table width="500" align="center" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle">Development Contest</td>
                    <td class="sidebarTitle">Start Date/Projects Posted</td>
                    <td class="sidebarTitle">Registration Deadline</td>
                    <td class="sidebarTitle">End Date / Submission Deadline</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Week 1</td>
                    <td class="sidebarText" nowrap=nowrap>01.04.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.06.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.11.2005 9:00AM</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Week 2</td>
                    <td class="sidebarText" nowrap=nowrap>01.11.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.13.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.18.2005 9:00AM</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Week 3</td>
                    <td class="sidebarText" nowrap=nowrap>01.18.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.20.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.25.2005 9:00AM</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Week 4</td>
                    <td class="sidebarText" nowrap=nowrap>01.25.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>01.27.2005 9:00AM</td>
                    <td class="sidebarText" nowrap=nowrap>02.01.2005 9:00AM</td>
				</tr>
				<tr>
                    <td class="sidebarText" nowrap=nowrap>Championship round</td>
                    <td class="sidebarText" nowrap=nowrap>03.10.2005</td>
                    <td class="sidebarText" nowrap=nowrap>N/A</td>
                    <td class="sidebarText" nowrap=nowrap>03.10.2005</td>
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
