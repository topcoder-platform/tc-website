<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Opening Night Reception</title>

<jsp:include page="../../../script.jsp" />

</head>

<body>

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
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="reception"/>
</jsp:include>

            <p class="terciary">
                Summary&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=reception_photos">Photos</a>
            </p>
            
            <div class="leadPhoto">
            <img src="/i/tournament/tco03/reception/summary.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">ZorbaTHut and Yarin enjoy the calm before the storm<br/><br/> </span>
            </div>
            
            <h2>Opening Night Reception</h2>

            <p>by Matt Murphy, <em>TopCoder Staff</em><br />
            Wednesday, December 3, 2003</p>

            <p>Tonight, in a conference room filled with food, drink and plenty of tech related chatter, all eyes were on a few 16.  
            Each one of these coders will be vying for the title of grand champion tomorrow as the final rounds of the 2003 TopCoder Open sponsored by Intel&#174;
            commence.  With more than 1,000 competitors participating six rounds earlier, these contestants have already come a long way.  
            With $130,000 at stake, tensions should have been high when the coders came face to face.  But they weren't.</p>
 
            <p>The environment was fairly relaxing at the welcome reception.  Representatives from NVIDIA and Revelation Software 
            were on hand to mingle with the finalists and to assess the level of competition.  Introductions were made.  Tournament 
            stories were told.  Brainteasers were solved, and reinvented and solved again - warming up for the problems they will 
            face tomorrow morning. </p>
 
            <p>There are a lot of preparations to be made before the semi-finals begin.  After the reception, the competitors retired to 
            their rooms to recover from jetlag.  Hopefully, butterflies won't keep them from their much-needed rest. </p>
            
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
