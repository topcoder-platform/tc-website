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
   <jsp:param name="tabLev1" value="overview"/>
   <jsp:param name="tabLev2" value="join_us"/>
   <jsp:param name="tabLev3" value="directions"/>
</jsp:include>

<!-- Onsite Semifinal and Championship Rounds begins -->
            <p><span class="bodySubtitle">Onsite Semifinal and Championship Rounds</span><br />
            The 16 advancers from Online Round #4 will travel to Mohegan Sun on Wednesday, December 3rd to compete in the Semifinal round
            of the tournament being held on Thursday, December 4th.</p>

            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="25%">Round</td>
                    <td class="sidebarTitle" width="35%">Date and Time*</td>
                    <td class="sidebarTitle" width="21%" align="center"># of Participants</td>
                    <td class="sidebarTitle" width="19%" align="center"># of Advancers</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #1</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 10:00 AM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #2</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 1:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #3</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 4:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText">Semifinal Room #4</td>
                    <td class="sidebarText">
                        Thursday, December 4th<br />
                        Compete: 7:00 PM<br />
                    </td>
                    <td class="sidebarText" align="center">4</td>
                    <td class="sidebarText" align="center">1</td>
                </tr>

                <tr valign="top">
                    <td class="bodyText" bgcolor="#006666"><strong><font color="#FFFFFF">Championship Round</font></strong></td>
                    <td class="bodyText" bgcolor="#006666">
                        <strong><font color="#FFFFFF">Friday, December 5th<br />
                        Compete: 3:00 PM<br /></font></strong>
                    </td>
                    <td class="bodyText" bgcolor="#006666" align="center"><strong><font color="#FFFFFF">4</font></strong></td>
                    <td class="bodyText" bgcolor="#006666" align="center"><strong><font color="#FFFFFF">1</font></strong></td>
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
