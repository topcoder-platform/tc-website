<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Schedule</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
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
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="details"/>
   <jsp:param name="tabLev3" value="schedule"/> 
</jsp:include>

            <h2>Schedule and Advancement</h2>
            
            <p><span class="bodySubtitle">Registration</span><br/>
            In order to be eligible to compete in the Algorithm Competition, each competitor must be a registered TopCoder member 
            and have registered separately for the Algorithm Competition.  Registration for the competition is unlimited, 
            however each individual may only register once. Registration for the 2004 TopCoder Collegiate Challenge Algorithm Competition is scheduled as follows:</p>

            <p>NOTE: All times are EST.</p>
            
            <p>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr valign="top">
                    <td class="sidebarText" width="25%">Registration</td>
                    <td class="sidebarText" width="75%">
                        OPENS: Monday, February 1 at 9:00 AM EST<br /><br/>
                        CLOSES: Monday, February 23 at 9:00 AM EST
                    </td>
                </tr>
            </table><br />
            
            OPENS: Monday, February 1 at 9:00 AM<br/>
            CLOSES: Monday, February 23 at 9:00 AM</p>

            <p><span class="bodySubtitle">Open Qualification Round</span><br/>
            All registered competitors will attempt to qualify for the Algorithm Competition at any time during the following
            24-hour period:</p>
            
            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="20%"># of Competitors</td>
                    <td class="sidebarTitle" width="20%"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Qualification Round</td>
                    <td class="sidebarText">
                        START: Monday, February 23<br />
                        12:00 PM EST(noon)<br /><br/>
                        END: Tuesday, February 24<br />
                        12:00 PM EST(noon)
                    </td>
                    <td class="sidebarText">All eligible registered competitors</td>
                    <td class="sidebarText">Top 100 scorers in each of 5 Qualification Round Problems</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: In the event the Qualification Round must be cancelled for any reason, a makeup Qualification Round will begin at 12:00PM noon on Wednesday, February 25 and end at 12:00 PM on Thursday, February 26.
                    </td>
                </tr>
            </table><br />

            <p><span class="bodySubtitle">Online Elimination Rounds</span></p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="20%"># of Competitors</td>
                    <td class="sidebarTitle" width="20%"># of Advancers</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #1</td>
                    <td class="sidebarText">
                        Saturday, February 28<br />
                        Registration:  9:00 AM - 11:55 AM EST<br />
                        Compete: 12:00 PM EST(noon)<br />
                    <td class="sidebarText">500</td>
                    <td class="sidebarText">200</td>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #2</td>
                    <td class="sidebarText">
                        Wednesday, March 3<br />
                        Login by:  9:20 PM EST<br />
                        Compete: 9:30 PM EST<br />
                    </td>
                    <td class="sidebarText">200</td>
                    <td class="sidebarText">100</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #3</td>
                    <td class="sidebarText">
                        Wednesday, March 10<br />
                        Login by:  9:20 PM EST<br />
                        Compete: 9:30 PM EST<br />
                    </td>
                    <td class="sidebarText">100</td>
                    <td class="sidebarText">50</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #4</td>
                    <td class="sidebarText">
                        Wednesday, March 17<br />
                        Login by:  9:20 PM EST<br />
                        Compete: 9:30 PM EST<br />
                    </td>
                    <td class="sidebarText">50</td>
                    <td class="sidebarText">24</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: In the event a round must be cancelled for any reason, the "raindate"
                        will be the following day at the same time.
                    </td>
                </tr>
            </table><br/>
            
            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span></p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="20%"># of Competitors</td>
                    <td class="sidebarTitle" width="20%"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #1</td>
                    <td class="sidebarText">
                        Thursday, April 15<br />
                        Compete: 10:00 AM EST<br />
                    </td>
                    <td class="sidebarText">8</td>
                    <td class="sidebarText">1 - Championship Round<br/>
                    2 - Wildcard Round</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #2</td>
                    <td class="sidebarText">
                        Thursday, April 15<br />
                        Compete: 1:00 PM EST<br />
                    </td>
                    <td class="sidebarText">8</td>
                    <td class="sidebarText">1 - Championship Round<br/>
                    2 - Wildcard Round</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #3</td>
                    <td class="sidebarText">
                        Thursday, April 15<br />
                        Compete: 4:00 PM EST<br />
                    </td>
                    <td class="sidebarText">8</td>
                    <td class="sidebarText">1 - Championship Round<br/>
                    2 - Wildcard Round</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Wildcard Round</td>
                    <td class="sidebarText">
                        Thursday, April 15<br />
                        Compete: 7:00 PM EST<br />
                    </td>
                    <td class="sidebarText">6</td>
                    <td class="sidebarText">1 - Championship Round</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText"><strong>Championship Round</strong></td>
                    <td class="sidebarText">
                        <strong>Friday, April 16<br />
                        Compete: 3:00 PM EST<br /></strong>
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
            

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
