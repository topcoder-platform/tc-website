<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2003 TopCoder Open sponsored by Intel&#174;  - Summary - Final Round</title>

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
   <jsp:param name="selectedTab" value="coding_summary"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="../tco03Sublinks.jsp" >
   <jsp:param name="selectedList" value="summary"/>
   <jsp:param name="selectedTab" value="final"/>
</jsp:include>

            <p class="terciary">
                Play-by-Play&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final_photos">Photos</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=summary&d4=final_analysis">Problem Analysis</a>
            </p>
            
            <div class="leadPhoto">
            <img src="/i/tournament/tco03/final/summary.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">Photo caption.<br/><br/></span>
            </div>
            
            <h2>Final Round</h2>

            <p>by Matt Murphy, <em>TopCoder Staff</em><br />
            Friday, December 5, 2003</p>

            <p>Floats like a butterfly, codes in C.  The crowd could not stop roaring as tomek, the new TopCoder 
            Open Champion, bounced up to receive his $50,000 check. </p>
 
            <p>The sociable student from Poland made his first appearance in TopCoder competitions just 3 months 
            before the start of the tournament.  His friends back home did not think he would be able to come to America 
            and win this kind of money.  "I told them I was going to win," tomek said with a grin.  He hopes that his 
            success will encourage other coders from Poland to compete in TopCoder competitions.</p>
 
            <p>It was a close match.  Yarin held the lead all the way up until the final system test was run on the 
            1000-point problem.  "I was pretty afraid of Yarin," tomek admitted, "I was looking at his score all 
            the time." </p>
 
            <p>As one would expect, winning $50,000 put tomek in a pretty good mood.  His comical responses to 
            the interviewers' questions could barely be heard over the crowd's boisterous laughter.  When asked 
            what he thought about winning, tomek chuckled and replied, "That's what I wanted."</p>

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
