<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="review_board"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="tournaments"/>
                <jsp:param name="level2" value="charity"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
               <jsp:include page="../body_top.jsp" >
                  <jsp:param name="image" value="events"/>  
                  <jsp:param name="image1" value="white"/>  
                  <jsp:param name="title" value="TopCoder Charity Challenge"/>  
               </jsp:include>

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td><img src="/i/tournament/crpf03/crpf_banner.gif" width="601" height="152" border="0"  vspace="15"/></td>
                  </tr>
               </table>
               
<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="rules"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value="rules"/>
   <jsp:param name="selectedTab" value="prizes"/>
</jsp:include>

               

               <blockquote>
               <h2>Prizes<h2>
               <p>All competitors who raise a minimum of $50 USD will be awarded a commemorative t-shirt.</p>

               <p>All competitors who raise a minimum of $100 USD will be put into a grand prize drawing.  A competitor will receive one 
               entry into the drawing for every $100 he/she raises.  (For example, if a member raises $300, he/she will receive 3 entries 
               into the drawing.)  In the event TopCoder draws a member who is also one of the 4 top scorers or top 4 fund-raisers, another 
               name will be drawn.

               <p><strong>Grand Prizes</strong><br />
               Up to a total of 10 members will win a grand-prize.  The grand-prize winners are as follows:<br />
               <ul>
               <li>4 highest scoring competitors in Round 3</li>
               <li>4 members who raised the most money as of 11:59pm on November 10th.  Members must raise a minimum of $500 to 
               be awarded this grand-prize</li>
               <li>2 members will be randomly chosen on November 11th to receive a grand-prize.  All members who raise a minimum of 
               $100 will be entered into the drawing.  Members will receive one chance for every $100 he/she raises</li>
               </ul>

               <p>All grand-prize winners will travel to New York City on Monday, November 24th to attend A Magical Evening, the annual 
               star-studded gala ball benefiting CRPF.  A Magical Evening will be held at the Marriott Marquis on November 24th at 5:00pm.  
               If a grand-prize winner is unable to attend the A Magical Evening, he/she will forfeit his/her eligibility to receive a prize, and 
               his/her prize will be given to the next eligible member (i.e. next highest scorer if a high-scorer can not attend, the next highest 
               fund-raiser if a top fund-raiser can not attend, etc.). </p>

               <p>TopCoder will provide travel arrangements for each winner, up to a cost of $1,000 per person.  (That is, if a contestant�s 
               airfare is greater than $1,000, the contestant will be responsible for the difference between the cost of the airfare and $1,000.)  
               In addition, TopCoder will provide overnight accommodations and travel arrangements to and from the airport to your hotel.  All 
               other expenses are the responsibility of the member.</p>
               
               </blockquote>
            
            <p><br /></p>
         </td>                       
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="review_board"/>
               <jsp:param name="level2" value="competition"/> 
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
