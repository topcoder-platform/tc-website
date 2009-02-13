<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="details"/>
<jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class=bodySpacer>
            
        <p class=bigTitle>Algorithm Competition Schedule</p>

        <p><span class="bodySubtitle">Registration</span><br/>
            In order to be eligible to compete in the Algorithm Competition, each competitor must be a registered TopCoder member 
            and have registered separately for the Algorithm Competition.  Registration for the competition is unlimited, 
            however each individual may only register once. Registration for the 2005 TopCoder Collegiate Challenge Algorithm Competition is scheduled as follows:</p>

            <p>
            <table width="510" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr valign="top">
                    <td class="sidebarText" width="25%">Registration</td>
                    <td class="sidebarText" width="75%">
                        OPENS: Monday, December 20, 2004 at 9:00 AM EST<br /><br/>
                        CLOSES: Tuesday, January 11, 2005 at 9:00 AM EST
                    </td>
                </tr>
            </table>
            
            <p><span class="bodySubtitle">Qualification Round</span><br/>
            All registered competitors can attempt to qualify for the Algorithm Competition at any time during the following
            24-hour period:</p>
            
            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="20%">Round</td>
                    <td class="sidebarTitle" width="40%">Date and Time*</td>
                    <td class="sidebarTitle" width="20%"># of Competitors</td>
                    <td class="sidebarTitle" width="20%"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Qualification Round</td>
                    <td class="sidebarText">
                        START: Tuesday, January 11, 2005<br />
                        12:00 PM EST (noon)<br /><br/>
                        END: Wednesday, January 12, 2005<br />
                        12:00 PM EST (noon)
                    </td>
                    <td class="sidebarText">All eligible registered competitors</td>
                    <td class="sidebarText">Top 100 scorers in each of 5 Qualification Round Problem Sets</td>
                </tr>

            </table><br />

            <p><span class="bodySubtitle">Online Elimination Rounds</span></p>

            <table width="510" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="20%">Round</td>
                    <td class="sidebarTitle" width="40%">Date and Time*</td>
                    <td class="sidebarTitle" width="20%"># of Competitors</td>
                    <td class="sidebarTitle" width="20%"># of Advancers</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #1</td>
                    <td class="sidebarText">
						Saturday, January 15th<br/>Register: 9:00 - 11:55 AM EST<br/>START: 12:00 PM EST (Noon)
                    <td class="sidebarText">500</td>
                    <td class="sidebarText">200</td>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #2</td>
                    <td class="sidebarText">
                        Wednesday, January 19th<br/>Register:  6:30 - 9:25 PM EST<br/>START: 9:30 PM EST
                    </td>
                    <td class="sidebarText">200</td>
                    <td class="sidebarText">100</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #3</td>
                    <td class="sidebarText">
                        Wednesday, January 26th<br/>Register:  6:30 - 9:25 PM EST<br/>START: 9:30 PM EST
                    </td>
                    <td class="sidebarText">100</td>
                    <td class="sidebarText">50</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #4</td>
                    <td class="sidebarText">
                        Wednesday, February 2nd<br/>Register:  6:30 - 9:25 PM EST<br/>START: 9:30 PM EST
                    </td>
                    <td class="sidebarText">50</td>
                    <td class="sidebarText">24</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE:  In the event that a round must be cancelled for any reason, the "rain date" for the cancelled match will be the following day at the same time.
                    </td>
                </tr>
            </table><br/>
            
            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span></p>

            <table width="510" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="20%">Round</td>
                    <td class="sidebarTitle" width="40%">Date and Time*</td>
                    <td class="sidebarTitle" width="20%"># of Competitors</td>
                    <td class="sidebarTitle" width="20%"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" nowrap=nowrap>Semifinal Room #1</td>
                    <td class="sidebarText">
                        Thursday, March 10th<br />
                        Compete: 10:00 AM PST<br />
                    </td>
                    <td class="sidebarText">8</td>
                    <td class="sidebarText">1 - Championship Round<br/>
                    2 - Wildcard Round</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" nowrap=nowrap>Semifinal Room #2</td>
                    <td class="sidebarText">
                        Thursday, March 10th<br />
                        Compete: 1:00 PM PST<br />
                    </td>
                    <td class="sidebarText">8</td>
                    <td class="sidebarText">1 - Championship Round<br/>
                    2 - Wildcard Round</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" nowrap=nowrap>Semifinal Room #3</td>
                    <td class="sidebarText">
                        Thursday, March 10th<br />
                        Compete: 4:00 PM PST<br />
                    </td>
                    <td class="sidebarText">8</td>
                    <td class="sidebarText">1 - Championship Round<br/>
                    2 - Wildcard Round</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" nowrap=nowrap>Wildcard Round</td>
                    <td class="sidebarText">
                        Friday, March 11th<br />
                        Compete: 10:00 AM PST<br />
                    </td>
                    <td class="sidebarText">6</td>
                    <td class="sidebarText">1 - Championship Round</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText"><strong>Championship Round</strong></td>
                    <td class="sidebarText">
                        <strong>Friday, March 11th<br />
                        Compete: 2:30 PM PST<br /></strong>
                    </td>
                    <td class="sidebarText"><strong>4</strong></td>
                    <td class="sidebarText"><strong>1 - Champion</strong></td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: The times of the onsite rounds are subject to change.
                    </td>
                </tr>
            </table><br />
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
