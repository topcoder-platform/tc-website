<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Overview</title>

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

            <h2>Schedule</h2>

            <p><span class="bodySubtitle">Online Elimination Rounds</span><br/>
            Everyone who competes in an online round must login to the TopCoder Competition Arena no later than ten minutes prior to the start of the online round. (See below for competition dates and times.) TopCoder members from around the world may be participating in these rounds, but all start times will be communicated as Eastern Time, so contestants in different time zones must adjust accordingly. If a coder does not participate, for any reason, in an online round they have advanced to, it will be treated as an automatic loss in that round of competition.</p>

            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="50%">Round</td>
                    <td class="sidebarTitle" width="50%">Date and Time*</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Qualification Round</td>
                    <td class="sidebarText">
                        START: Monday, February 23<br />
                        12:00 PM (noon)<br /><br/>
                        END: Tuesday, February 24<br />
                        12:00 PM (noon)
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. In the event a Qualification Round must be cancelled for any reason, the "raindate"
                        will be the following day at the same time.<br/>
                    </td>
                </tr>
            </table><br />

            <p><span class="bodySubtitle">Scoring and Advancing during Online Rounds</span><br/>
            After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) for each coder. In order to advance, a coder must finish each round with a positive (i.e., greater-than-zero) point total. The structure of the online rounds is as follows:</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="50%">Round</td>
                    <td class="sidebarTitle" width="50%">Date and Time*</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #1</td>
                    <td class="sidebarText">
                        Saturday, February28th<br />
                        Registration:  9:30 AM - 11:55 AM<br />
                        Compete: 12:00 PM (noon)<br />
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #2</td>
                    <td class="sidebarText">
                        Wednesday, March 3rd<br />
                        Login by:  9:20 PM<br />
                        Compete: 9:30 PM<br />
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #3</td>
                    <td class="sidebarText">
                        Wednesday, March 10th<br />
                        Login by:  9:20 PM<br />
                        Compete: 9:30 PM<br />
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Online Round #4</td>
                    <td class="sidebarText">
                        Wednesday, March 17th<br />
                        Login by:  9:20 PM<br />
                        Compete: 9:30 PM<br />
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. In the event a Qualification Round must be cancelled for any reason, the "raindate"
                        will be the following day at the same time.
                    </td>
                </tr>
            </table><br/>
            
            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span><br/>
            The twenty-four (24) advancers from Online Round #4 will travel to the Boston Park Plaza Hotel & Towers on Wednesday, April 14th to compete in the Semifinal round of the tournament being held on Thursday, April 15th.  All contestants must arrive at the Boston Park Plaza Hotel & Towers no later than 4:00 PM on Wednesday, April 14th.  If a contestant is unable to attend the onsite rounds, he/she will forfeit his/her eligibility to receive a prize, and his/her spot in the tournament will be given to the next highest overall scorer from Online Round #4.</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="50%">Round</td>
                    <td class="sidebarTitle" width="50%">Date and Time*</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #1</td>
                    <td class="sidebarText">
                        Thursday, April 15th<br />
                        Compete: 10:00 AM<br />
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #2</td>
                    <td class="sidebarText">
                        Thursday, April 15th<br />
                        Compete: 1:00 PM<br />
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #3</td>
                    <td class="sidebarText">
                        Thursday, April 15th<br />
                        Compete: 4:00 PM<br />
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #4</td>
                    <td class="sidebarText">
                        Thursday, April 15th<br />
                        Compete: 7:00 PM<br />
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText"><strong>Championship Round</strong></td>
                    <td class="sidebarText">
                        <strong>Friday, April 16th<br />
                        Compete: 3:00 PM<br /></strong>
                    </td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="4">
                        *NOTE: All times are Eastern Time. The times of the onsite rounds are subject to change.
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
