<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>

<jsp:include page="../script.jsp" />

<SCRIPT type="text/javascript">
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) {
  // Linux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders_linux.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle_linux.css"/>');
} else {
  // NonLinux Stylesheets
  document.write('<link type="text/css" rel="stylesheet" href="/css/style.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/coders.css"/>');
  document.write('<link type="text/css" rel="stylesheet" href="/css/crpfStyle.css"/>');
}
</SCRIPT>

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
                <jsp:param name="level1" value="events"/>
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
                     <td><img src="/i/events/crpf03/banner_online_rounds_start.gif" alt="Online rounds start November 11" width="510" height="41" vspace="15" border="0"><br/>
                     <A href="/tc?&module=Static&d1=crpf&d2=crpf_overview"><img src="/i/events/crpf03/crpf_banner_2.jpg" width="510" height="135" border="0" vspace="15" alt="TopCoder Charity Challenge benefiting the CPPF"></A></td>
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
               <table class="bodyText"> 
                  <tr>
                     <td>
                     </td>
                      <td>
                        <p>Donations can be made by:<br />
                     </td>
                  </tr>
                  <tr>
                     <td width="150" align="center" valign="top"><img src="/i/tournament/crpf03/creditcard.gif" width="89" height="63" border="0">
                     </td>
                     <td>
                        <ul><li>Credit card:</li>                        
                        <ol>
                        <li>Go to <A href="http://www.crpf.org/contribute/contribute.cfm?orgid=TopCoderWebsite2003" target="_blank">www.christopherreeve.org/topcoder</A>.  <b>Note:  Donations will be accepted until 11:59 PM Eastern Time on November 10th</b>.</li>
                        <li>Remember to enter the TopCoder member's name and/or handle so the donation can be matched to the correct competitor</li>
                        <li>If you have any questions about this please contact <A href="mailto:service@topcoder.com" class="bodyText">TopCoder Service</A></li>                        
                        </ol>
                        </ul>                    
                     </td>
                  </tr>
                  <tr>
                     <td width="150" align="center" valign="top"><img src="/i/tournament/crpf03/check.gif" width="150" height="63" border="0">
                     </td>
                     <td>
                        <ul><li>
                        Check:
                        <ol><li>Please complete this <A href="/i/tournament/crpf03/donation_form.pdf" target="_blank">donation form</A>.<br>
                        <A href="http://www.adobe.com/products/acrobat/readstep.html">Adobe Acrobat 5</A> is required to view this form</li>
                        <li>Make your check payable to the Christopher Reeve Paralysis Foundation</li>
                        <li>Checks must be received at TopCoder <b>no later than November 10</b>.<br />
                        Mail the form and check to:<br /> 
                        TopCoder<br />
                        703 Hebron Ave<br />
                        Glastonbury,CT 06033<br />
                        ATTN:  CRPF DONATIONS</li></ol></li></ul>
                     </td>
                  </tr>
                  <tr>
                     <td></td>
                     <td>
                        <ul><li>If you would like to collect donations around the office, this <A href="/i/tournament/crpf03/pledge_collection_form.pdf" target="_blank">form</A> may be helpful.</li></ul>
                     </td>
                  </tr>
               </table>
               </blockquote>
            
            <p><br /></p>
         </td>                       
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="crfp_right.jsp" />
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
