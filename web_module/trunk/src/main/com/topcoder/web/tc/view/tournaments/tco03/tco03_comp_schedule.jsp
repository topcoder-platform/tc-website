<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Computer Programming Tournament - Schedule</title>

<jsp:include page="../../script.jsp" />

</head>

<body onLoad="timer(1);">

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

<jsp:include page="tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tco03Links.jsp" >
   <jsp:param name="selectedContest" value="component"/>
   <jsp:param name="selectedTab" value="component_schedule"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

            <h2>Schedule</h2>

<!-- Qualification Rounds begins -->
           <p><span class="bodySubtitle">Online Elimination Rounds</span></p>
            <p>All eligible TopCoder members may compete in Online Round 1 of the Component Tournament. For design, the top eight scorers from Round 1
            will advance.  The top eight scorers from Round 1 along with the winners of the previous quarterly component design contests
            will compete in Online Round 2.  For development, the top ten scorers from Round 1 will compete in Online Round 2.
            The top two scorers from Round 2 will compete in the Championship Round at Mohegan Sun on December 5th.</p>

            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="25%" align="center">Development</td>
                    <td class="sidebarTitle" width="25%" align="center">Design</td>
                </tr>
                <tr><td colspan="3" align="center" class="sidebarText">ALL TIMES ARE EASTERN TIME</td></tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Online Round 1</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        09.02.03 12:00am
                     </td>
                     <td class="sidebarText">
                        09.04.03 12:00am
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        09.15.03 11:59pm
                     </td>
                     <td class="sidebarText">
                        09.17.03 11:59pm
                     </td>
                </tr>
                 <tr>
                     <td class="sidebarText">
                        Winners announced
                        </td>
                     <td class="sidebarText">
                        10.02.03
                        </td>
                     <td class="sidebarText">
                        10.02.03
                        </td>
                   </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Online Round 2</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        10.07.03 12:00am
                     </td>
                     <td class="sidebarText">
                        10.09.03 12:00am
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        10.20.03 11:59pm
                     </td>
                     <td class="sidebarText">
                        10.22.03 11:59pm
                     </td>
                </tr>
                  <tr>
                     <td class="sidebarText">
                        Winners announced
                        </td>
                     <td class="sidebarText">
                        11.06.03
                        </td>
                     <td class="sidebarText">
                        11.06.03
                        </td>
                   </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Onsite Championship Round 3</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        11.11.03 12:00am
                     </td>
                     <td class="sidebarText">
                        11.11.03 12:00am
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        11.20.03 11:59pm
                     </td>
                     <td class="sidebarText">
                        11.20.03 11:59pm
                     </td>
                </tr>
                  <tr>
                     <td class="sidebarText">
                        Submissions posted
                        </td>
                     <td class="sidebarText">
                        11.26.03 6:00pm
                        </td>
                     <td class="sidebarText">
                        11.26.03 6:00pm
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Scorecards posted*
                        </td>
                     <td class="sidebarText">
                        12.05.03 8:00am
                        </td>
                     <td class="sidebarText">
                        12.05.03 8:00am
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Final fixes*
                        </td>
                     <td class="sidebarText">
                        12.05.03 8:00am - 12:00pm
                        </td>
                     <td class="sidebarText">
                        12.05.03 8:00am - 12:00pm
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Final reviews*
                        </td>
                     <td class="sidebarText">
                        12.05.03 12:15pm - 3:30pm
                        </td>
                     <td class="sidebarText">
                        12.05.03 12.15pm - 3:30pm
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Winners announced*
                        </td>
                     <td class="sidebarText">
                        12.05.03 4:20pm
                        </td>
                     <td class="sidebarText">
                        12.05.03 4:20pm
                        </td>
                   </tr>
                <tr><td colspan="3" class="sidebarText">*These times are subject to change</td></tr>



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
