<%@  page language="java"  %>
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<head>

<title>Competition Review Board at TopCoder</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column Begins --> 
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="review_boards"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value=""/>  
        </jsp:include>

<table border="0" cellspacing="10" cellpadding="0" width="100%" align="center">
      <tr>
         <td width="50%"></td>
         <td height="42"><A href="/tc?module=Static&amp;d1=review_board&amp;d2=competition"  target="_top"><img src="/i/promos/competition_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
         <td height="42"><A href="/tc?module=Static&amp;d1=review_board&amp;d2=design"  target="_top"><img src="/i/promos/design_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
         <td height="42""><A href="/tc?module=Static&amp;d1=review_board&amp;d2=development"  target="_top"><img src="/i/promos/development_rb_promo.gif" alt="competition" width="175" height="86" border="0" /></A></td>
         <td width="50%"></td>
      </tr>
</table>

<table width="100%" border="0" cellpadding="3" cellspacing="0">
      <tr><td valign="middle" bgcolor="#999999" colspan="3" class="statText"><font size="3"><strong> Competition Review Board</strong></font></td></tr>
</table>      
<table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
         <td><img src="/i/clear.gif" width="240" height="1" border="0"><br>
<!-- Comment out until Dev info is available            <p align="right" >
               <a href="/?t=features&amp;c=#" class="bodyText"><strong>Go to Development Review Board</strong></a>
            </p> -->
            <p class="bodyText">
            TopCoder is pleased to announce the formation of a Competition Review Board. The Review Board's 
            responsibilities include making recommendations on how to improve the quality and integrity of TopCoder 
            Competitions. The Review Board will also provide us with guidelines on how we can best handle sub-optimal 
            situations that can arise during competitions.
            </p>
            <p class="bodyText">
            The following members have agreed to participate on the TopCoder Competition Review Board:
            <br>
            </p>
         </td>
      </tr>

<table width="100%" border="0" cellpadding="3" cellspacing="0">
</table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=273217"><img src="/i/m/schveiguy_mug.gif" alt="schveiguy" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>                        
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=273217"><strong>schveiguy</strong></a><span class="smallText"></span>
                        graduated with a Bachelors degree in Computer Science from Worcester Polytechnic Institute 
                        and currently works as a Senior Software Developer at Network Engines in Canton, Massachusetts.
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=268546"><img src="/i/m/tangentz_mug.gif" alt="tangentz" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=268546"><strong>TangentZ</strong></a><span class="smallText"></span>
                        received a Master of Computer Science degree from Dalhousie University.  While in 
                        school, he spent time researching artificial intelligence with a focus on neural networks.
                        </p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=158447"><img src="/i/m/vald_mug.gif" alt="vald" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=158447"><strong>ValD</strong></a><span class="smallText"></span>
                        currently studies at the University of Albany and plans to graduate with honors.  In his 
                        spare time, he studies optimization problems and evolution strategies.  In fact, ValD believes 
                        he may be making progress towards a new evolution model.</p>                       
                     </td>
                </tr>
            </table>

            <hr width="100%" size="1" noshade="noshade" />

            <table width="100%" border="0" cellpadding="5" cellspacing="0">
                <tr valign="top">
                    <td width="274"><a href="/stat?c=member_profile&amp;cr=272072"><img src="/i/m/snapdragon_mug.gif" alt="snapdragon" width="63" height="70" border="0" /></a></td>
                    <td width="99%" class="bodyText">
                        <p>
                        <a class="bodyText" href="/stat?c=member_profile&amp;cr=272072"><strong>SnapDragon</strong></a><span class="smallText"></span>
                        has participated in over 50 TopCoder rated events.  As of this writing, he is TopCoder's 
                        highest rated member, and is the only member to have broken the 3400 rating 
                        mark.  SnapDragon is a graduate of the University of Waterloo and currently works for 
                        Bioinformatics Solutions Inc. in Ontario, Canada.</p>                       
                     </td>
                </tr>
            </table>            

            <hr width="100%" size="1" noshade="noshade" />

<p align="middle" >
<A href="mailto:service@topcoder.com" class="bodyText">Have a question about the TopCoder Competition Review Board?</strong></a>
</p>
<p><br></p>

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
