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
                     <td><A href="/tc/?&module=Static&d1=crpf&d2=index"><img src="/i/tournament/crpf03/crpf_banner.gif" width="601" height="152" border="0"  vspace="15"/></A></td>
                  </tr>
               </table>
               
<!-- Tab bar links-->
<jsp:include page="crpfLinks.jsp" >
   <jsp:param name="selectedTab" value="overview"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value=""/> 
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

               

               <blockquote>
            <h2>Overview of the Tournament</h2>
            
            <ul>
                <li><strong>Dates: </strong><br />
                     Online Rounds on November 11th, 13th, and 17th</li>
                <li><strong>Qualification: </strong><br />
                     Must be 18 years of age or older<br />
                     Must raise a minimum of $25 USD for CRPF</li>
                <li><strong>Prizes:</strong><br />
                     <ul>
                     <li>T-shirt for all members who raise $50 USD or more</li>
                     <li>10 Grand Prize winners</li>
                     </ul>
                     Grand Prize: An expenses paid trip to <i>A Magical Evening</i>, the annual star studded gala ball benefiting CRPF.  The ball will be held at the Marriott Marquis in New York City on November 24th.  Tickets to this event are valued at $1,000 USD each. <br />
                     The grand prize will be awarded to:
                     <ul>
                     <li>The four top scorers in the final round </li>
                     <li>The four members who raise the most money for CRPF ($500 minimum)</li>
                     <li>Two "raffle" winners, which will be chosen from every member who raises a minimum of $100.</li>
                     </ul></li>
                <li><strong>Philanthropy: </strong><br />
                     TopCoder will match every dollar raised, up to $50,000 USD</li>
            </ul>
               
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
               <jsp:param name="level1" value="crpf"/>
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
