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
            <jsp:include page="/includes/global_left.jsp">
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
   <jsp:param name="tabLev1" value="component"/>
   <jsp:param name="tabLev2" value="details"/>
   <jsp:param name="tabLev3" value="schedule"/>
</jsp:include>

            <h2>Schedule</h2>

            <p>Both the design and development competitions will have two (2) online rounds and one (1) onsite Championship round.</p>

            <p>Each contestant in an online round must submit his/her design and/or development submissions by the deadlines indicated below (NOTE: All times are EST):</p>

            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="25%" align="center">Design</td>
                    <td class="sidebarTitle" width="25%" align="center">Development</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Online Round #1</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        <a href="/?t=development&c=comp_projects">01.27.04 12:00AM</a>
                     </td>
                     <td class="sidebarText">
                        02.17.04 9:00AM
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        02.03.04 9:00AM
                     </td>
                     <td class="sidebarText">
                        02.24.04 9:00AM
                     </td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3">Review Board:</td>
                 </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Screening due
                        </td>
                     <td class="sidebarText">
                        02.03.04 6:00PM
                        </td>
                     <td class="sidebarText">
                        02.24.04 6:00PM
                        </td>
                   </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Reviews due
                        </td>
                     <td class="sidebarText">
                        02.05.04 6:00PM
                        </td>
                     <td class="sidebarText">
                        02.26.04 6:00PM
                        </td>
                   </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Appeals due
                        </td>
                     <td class="sidebarText">
                        02.08.04 9:00AM
                        </td>
                     <td class="sidebarText">
                        02.29.04 9:00AM
                        </td>
                   </tr>
                 <tr>
                     <td class="sidebarText">
                        Winners announced
                        </td>
                     <td class="sidebarText">
                        02.09.04
                        </td>
                     <td class="sidebarText">
                        03.01.04
                        </td>
                   </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Online Round #2</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        02.17.04 9:00AM
                     </td>
                     <td class="sidebarText">
                        03.09.04 9:00AM
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        02.24.04 9:00AM
                     </td>
                     <td class="sidebarText">
                        03.16.04 9:00AM
                     </td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3">Review Board:</td>
                 </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Screening due
                        </td>
                     <td class="sidebarText">
                        02.24.04 6:00PM
                        </td>
                     <td class="sidebarText">
                        03.16.04 6:00PM
                        </td>
                   </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Reviews due
                        </td>
                     <td class="sidebarText">
                        02.26.04 6:00PM
                        </td>
                     <td class="sidebarText">
                        03.18.04 6:00PM
                        </td>
                   </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Appeals due
                        </td>
                     <td class="sidebarText">
                        02.29.04 9:00AM
                        </td>
                     <td class="sidebarText">
                        03.21.04 9:00AM
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Winners announced
                        </td>
                     <td class="sidebarText">
                        03.01.04
                        </td>
                     <td class="sidebarText">
                        03.22.04
                        </td>
                   </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3"><strong>Onsite Championship Round #3</strong></td>
                 </tr>
                 <tr>
                     <td class="sidebarText">
                        Projects posted
                     </td>
                     <td class="sidebarText">
                        03.30.04 9:00AM
                     </td>
                     <td class="sidebarText">
                        03.30.04 9:00AM
                     </td>
               </tr>
               <tr>
                     <td class="sidebarText">
                        Submission deadline
                     </td>
                     <td class="sidebarText">
                        04.06.04 9:00AM
                     </td>
                     <td class="sidebarText">
                        04.06.04 9:00AM
                     </td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText" colspan="3">Review Board:</td>
                 </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Screening due
                        </td>
                     <td class="sidebarText">
                        04.06.04 6:00PM
                        </td>
                     <td class="sidebarText">
                        04.06.04 6:00PM
                        </td>
                   </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Reviews due
                        </td>
                     <td class="sidebarText">
                        04.09.04 6:00PM
                        </td>
                     <td class="sidebarText">
                        04.09.04 6:00PM
                        </td>
                   </tr>
                 <tr>
                     <td class="sidebarTextIndent">
                        Appeals due
                        </td>
                     <td class="sidebarText">
                        n/a
                        </td>
                     <td class="sidebarText">
                        n/a
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Scorecards posted*
                        </td>
                     <td class="sidebarText">
                        04.16.04 8:00AM
                        </td>
                     <td class="sidebarText">
                        04.16.04 8:00AM
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Final fixes*
                        </td>
                     <td class="sidebarText">
                        04.16.04 8:00AM - 12:00PM
                        </td>
                     <td class="sidebarText">
                        04.16.04 8:00AM - 12:00PM
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Final reviews*
                        </td>
                     <td class="sidebarText">
                        04.16.04 12:15PM - 3:30PM
                        </td>
                     <td class="sidebarText">
                        04.16.04 12.15PM - 3:30PM
                        </td>
                   </tr>
                  <tr>
                     <td class="sidebarText">
                        Winners announced*
                        </td>
                     <td class="sidebarText">
                        04.16.04 4:20PM
                        </td>
                     <td class="sidebarText">
                        04.16.04 4:20PM
                        </td>
                   </tr>
                <tr><td colspan="3" class="sidebarText">*These phases of the tournament will be conducted onsite at the Championship Round. These times are subject to change.</td></tr>
             </table>

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
