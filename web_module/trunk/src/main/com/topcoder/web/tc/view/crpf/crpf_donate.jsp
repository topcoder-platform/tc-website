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
   <jsp:param name="selectedTab" value="donate"/>
</jsp:include>

<!-- Tab bar sublinks-->
<jsp:include page="crpfSublinks.jsp" >
   <jsp:param name="selectedList" value=""/>
   <jsp:param name="selectedTab" value=""/>
</jsp:include>

               

               <blockquote>
               <p>Donations can be made by:<br />
               <ul>
               <li>Credit card online at <A href="http://www.christopherreeve.org/topcoder">www.christopherreeve.org/topcoder</A>.  
               Donators will enter in the TopCoder member's name and/or handle so the donation can be matched with a TopCoder member.  
               This is important as eligibility and prizes are determined based on how much money each member raises.</li>
               <li>Check.  Please complete the donation form located at <A href="http://www.topcoder.com/crpf">www.topcoder.com/crpf</A> and submit the form and a check to:<br />
                     <ul>
                     <li>VirtualSprockets<br />
                     17610 West Willard Road<br />
                     Poolsville, MD  20837<br />
                     ATTN:  CRPF DONATIONS</li>
                     </ul></li>
               </ul>
               </p>
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
