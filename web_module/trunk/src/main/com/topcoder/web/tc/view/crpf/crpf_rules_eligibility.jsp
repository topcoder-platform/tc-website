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
   <jsp:param name="selectedTab" value="registration"/>
</jsp:include>

               

               <blockquote>
                  <h2>Eligibility</h2>
                  <p>All TopCoder members 18 years of age or older (as of November 11, 2003) who have raised a minimum of $25 are eligible to compete.</p>
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
