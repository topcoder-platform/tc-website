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
   <jsp:param name="tabLev1" value="overview"/>
   <jsp:param name="tabLev2" value="join_us"/>
   <jsp:param name="tabLev3" value="schedule"/>
</jsp:include>


<h2>Schedule of Onsite Events</h2>
<p class="smallText" align="center">Note: Times and scheduled events are subject to change.</p>

            <div align="center">
            <table border="0" cellpadding="5" cellspacing="0">
                <tr>
                    <td colspan="2" class="statText" bgcolor="#999999"><strong>Wednesday, April 14</strong></td>
                </tr>

                <tr>
                    <td class="bodyText" bgcolor="#EEEEEE">6:00pm - 8:00pm</td>
                    <td class="bodyText" bgcolor="#EEEEEE">Welcome Reception</td>
                </tr>

                <tr>
                    <td colspan="2" class="bodyText">&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="2" class="statText" bgcolor="#999999"><strong>Thursday, April 15</strong></td>
                </tr>

                <tr>
                    <td class="bodyText" bgcolor="#EEEEEE">10:00am - 11:45am</td>
                    <td class="bodyText" bgcolor="#EEEEEE">Semifinal Room 1</td>
                </tr>

                <tr>
                    <td class="bodyText">11:45am - 1:00pm</td>
                    <td class="bodyText">Lunch</td>
                </tr>

                <tr>
                    <td class="bodyText" bgcolor="#EEEEEE">1:00pm - 2:45pm</td>
                    <td class="bodyText" bgcolor="#EEEEEE">Semifinal Room 2</td>
                </tr>


                <tr>
                    <td class="bodyText">4:00pm - 5:45pm</td>
                    <td class="bodyText">Semifinal Room 3</td>
                </tr>


                <tr>
                    <td class="bodyText" bgcolor="#EEEEEE">7:00pm - 8:45pm</td>
                    <td class="bodyText" bgcolor="#EEEEEE">Wildcard Round</td>
                </tr>

                <tr>
                    <td colspan="2" class="bodyText">&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="2" class="statText" bgcolor="#999999"><strong>Friday, April 16</strong></td>
                </tr>

                <tr>
                    <td class="bodyText" bgcolor="#006666"><strong><font color="#FFFFFF">8:00am - 12:00pm</font></strong></td>
                    <td class="bodyText" bgcolor="#006666"><strong><font color="#FFFFFF">Component Competiton Finals</font></strong></td>
                </tr>

                <tr>
                    <td class="bodyText" bgcolor="#EEEEEE">12:00pm - 1:00pm</td>
                    <td class="bodyText" bgcolor="#EEEEEE">Lunch </td>
                </tr>

                <tr>
                    <td class="bodyText">12:00pm - 3:30pm</td>
                    <td class="bodyText">Review of Component Competition</td>
                </tr>

                <tr>
                    <td class="bodyText" bgcolor="#006666"><strong><font color="#FFFFFF">3:00pm - 4:45pm</font></strong></td>
                    <td class="bodyText" bgcolor="#006666"><strong><font color="#FFFFFF">Coding Tournament Finals</font></strong></td>
                </tr>

                <tr>
                    <td class="bodyText">5:00pm - 6:00pm</td>
                    <td class="bodyText">Media Hour/Press Conference</td>
                </tr>

                <tr>
                    <td class="bodyText" bgcolor="#EEEEEE">6:00pm - 7:00pm</td>
                    <td class="bodyText" bgcolor="#EEEEEE">Cocktail Hour </td>
                </tr>

                <tr>
                    <td class="bodyText">7:00pm - 9:00pm</td>
                    <td class="bodyText">Dinner and Awards Presentation </td>
                </tr>

                <tr>
                    <td colspan="2" class="bodyText" bgcolor="#999999"></td>
                </tr>

                <tr>
                    <td colspan="2" class="bodyText">&nbsp;</td>
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
