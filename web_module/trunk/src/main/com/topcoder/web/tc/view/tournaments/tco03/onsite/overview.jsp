<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Overview of the Onsite Finals</title>

<jsp:include page="../../../script.jsp" />

</head>

<body onLoad="timer(1);">

<jsp:include page="../../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../../includes/global_left.jsp">
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

<jsp:include page="../tco03Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="../tco03Links.jsp" >
   <jsp:param name="selectedContest" value="coding"/>
   <jsp:param name="selectedTab" value="coding_onsite"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="onsite"/>
   <jsp:param name="selectedTab" value="schedule"/>
</jsp:include>

            <h2><img src="/i/tournament/tco03/onsite_crowd.jpg" alt="" width="301" height="200" border="0" align="right" hspace="8">Come to the Onsite Finals</h2>
            
            <p><strong>The 2003 TopCoder Open sponsored by Intel&#174; is shaping up to be the largest, most exciting TopCoder event ever. On Thursday, the 
            Coding Semi-final rounds will take place... Friday is going to be the BIG day: Component Finals in the morning and Coding Finals in the afternoon. 
            In-between rounds, you can experience the Mohegan Sun, a huge complex with restaurants, shops and casinos.</strong></p>
            
            <p>Secondary paragraph: Add more interesting text here...</p>
            
            <h3>Schedule of Events</h3>
            
            <div align="center">
            <table border="0" cellpadding="5" cellspacing="0">
                <tr>
                    <td colspan="2" class="bodyText"><strong>Wednesday, December 3</strong></td>
                </tr>
                
                <tr>
                    <td class="bodyText">6:00pm - 8:00pm</td>
                    <td class="bodyText">Welcome Reception *</td>
                </tr>

                <tr>
                    <td colspan="2" class="bodyText">&nbsp;</td>
                </tr>
                
                <tr>
                    <td colspan="2" class="bodyText"><strong>Thursday, December 4</strong></td>
                </tr>
                
                <tr>
                    <td class="bodyText">10:00am - 11:45am</td>
                    <td class="bodyText">Semifinal Round 1</td>
                </tr>
                
                <tr>
                    <td class="bodyText">11:45am - 1:00pm</td>
                    <td class="bodyText">Lunch</td>
                </tr>
                
                <tr>
                    <td class="bodyText">1:00pm - 2:45pm</td>
                    <td class="bodyText">Semifinal Round 2</td>
                </tr>
                <tr>
                    <td class="bodyText">2:45pm - 3:45pm</td>
                    <td class="bodyText">Revelation Presentation</td>
                </tr>
                
                <tr>
                    <td class="bodyText">4:00pm - 5:45pm</td>
                    <td class="bodyText">Semifinal Round 3</td>
                </tr>
                
                <tr>
                    <td class="bodyText">5:45pm - 6:45pm</td>
                    <td class="bodyText">TopCoder Member Technical Presentation<br/>(tentative)</td>
                </tr>
                
                <tr>
                    <td class="bodyText">7:00pm - 8:45pm</td>
                    <td class="bodyText">Semifinal Round 4</td>
                </tr>
                
                <tr>
                    <td class="bodyText">8:30pm - 10:00pm</td>
                    <td class="bodyText">NVIDIA Gathering *</td>
                </tr>

                <tr>
                    <td colspan="2" class="bodyText">&nbsp;</td>
                </tr>
                
                <tr>
                    <td colspan="2" class="bodyText"><strong>Friday, December 5</strong></td>
                </tr>
                
                <tr>
                    <td class="bodyText">8:00am - 12:00pm</td>
                    <td class="bodyText">Component Competiton Finals</td>
                </tr>
                
                <tr>
                    <td class="bodyText">12:00pm - 1:00pm</td>
                    <td class="bodyText">Lunch</td>
                </tr>
                
                <tr>
                    <td class="bodyText">12:00pm - 3:30pm</td>
                    <td class="bodyText">Review of Component Competition</td>
                </tr>
                
                <tr>
                    <td class="bodyText">1:00pm - 2:30pm</td>
                    <td class="bodyText">Intel&#174; Technical Presentation</td>
                </tr>
                
                <tr>
                    <td class="bodyText">3:00pm - 4:45pm</td>
                    <td class="bodyText">Final Round</td>
                </tr>
                
                <tr>
                    <td class="bodyText">5:00pm - 6:00pm</td>
                    <td class="bodyText">Media Hour/Press Conference</td>
                </tr>
                
                <tr>
                    <td class="bodyText">6:00pm - 7:00pm</td>
                    <td class="bodyText">Cocktail Hour *</td>
                </tr>
                
                <tr>
                    <td class="bodyText">7:00pm - 9:00pm</td>
                    <td class="bodyText">Dinner and Awards Presentation *</td>
                </tr>
                
                <tr>
                    <td colspan="2" class="bodyText">* Open to competitors, competitor guests and sponsors only</td>
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
            <jsp:include page="../../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../../foot.jsp" />

</body>

</html>
