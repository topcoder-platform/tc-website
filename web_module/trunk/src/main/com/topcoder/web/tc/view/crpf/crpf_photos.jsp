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

<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>

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
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!--CRPF Header-->
               <table align="center">
                  <tr>
                     <td>
                     <A href="/tc?&amp;module=CRPFStatic&amp;d1=crpf&amp;d2=crpf_photos"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
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

                <p class="terciary">
                Photos&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/tc?module=CRPFStatic&d1=crpf&d2=crpf_overview">Details</a>
            </p>
            
            <h2><i>A Magical Evening</i> Photos</h2>

            <p>Monday, November 24, 2003</p>
            
            <table border="0" cellspacing="0" cellpadding="3" width="100%">            
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/01.jpg');"><img src="/i/events/crpf03/photos/01_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/02.jpg');"><img src="/i/events/crpf03/photos/02_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/03.jpg');"><img src="/i/events/crpf03/photos/03_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/04.jpg');"><img src="/i/events/crpf03/photos/04_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/05.jpg');"><img src="/i/events/crpf03/photos/05_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
                
                <tr>
                    <td class="bodyText" align="center"><img src="/i/events/crpf03/photos/01.jpg" name="bigVersion" width="432" height="288" class="photoFrameBig" /></td>
                </tr>            
                
                <tr>
                    <td class="thumbnails" align="center">
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/06.jpg');"><img src="/i/events/crpf03/photos/06_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/07.jpg');"><img src="/i/events/crpf03/photos/07_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/08.jpg');"><img src="/i/events/crpf03/photos/08_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/09.jpg');"><img src="/i/events/crpf03/photos/09_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                        <a href="Javascript:void changeImage('bigVersion', '/i/events/crpf03/photos/10.jpg');"><img src="/i/events/crpf03/photos/10_sm.jpg" alt="" width="96" height="64" class="photoFrameSmall" /></a>             
                    </td>
                </tr>
            </table>
            
            <p>The grand prize winners of the TopCoder Challenge, sponsored by AT&T, were treated to <i>A Magical Evening</i>, 
            the annual start-studded ball honoring the Christopher Reeve Paralysis Foundation. The top fundraisers were Cristobal 
            Baray (cbaray) and his wife Catherine (catbaray), Bryan Brown (bryanb2002), and Jay Slupesky (Jay_Slupesky). 
            The top scorers in the tournament were Jared Showalter (jms137), John Dethridge (John Dethridge), Po-Shen Loh (po), 
            and Yevgeniy Kuznetsov (hamster). Jason Woolever (qubits) replaced po, who was not able to attend. Geir Engdahl (dark_lord), 
            Stevie Scraudner (stevietodd) were picked in the wild-card drawing. Dressed in their black-tie finest, the winners appear in 
            the photos below, along with TopCoder Founder and Chairman, Jack Hughes, as well as William Sardone, AT&T Sales Center 
            Vice President - New York. The final photo features actor John Lithgow, who emceed this year's event.  </p>

            <p>TopCoder would like to thank all of the competitors and fundraisers who participated in the first TopCoder Charity Challenge, 
            sponsored by AT&T. <b>Our tournament resulted in a total donation of $37,380 for CRPF. Great job everyone!</b></p>


            <p><br /></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"><br/>
            <jsp:include page="crpf_right.jsp" />
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
