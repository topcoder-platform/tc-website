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
         <td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<!--CRPF Header-->
               <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                  <tr>
                     <td><img src="/i/events/crpf03/banner_online_rounds_start.gif" alt="Online rounds start November 11" width="510" height="41" border="0"><br/>
                     <A href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_overview"><img src="/i/events/crpf03/crpf_banner_2.jpg" width="510" height="135" border="0" alt="TopCoder Charity Challenge benefiting the CPPF"></A><br/>
                     <img src="/i/clear.gif" width="10" height="15" border="0"/></td>
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
               <table width="100%" border="0" cellpadding="0" cellspacing="10">
                  <tr>
                      <td class="bodyText" colspan="2">
                        <p>Donating to the TopCoder Charity Challenge for the CRPF is easy! Just follow the directions below. 
                        <A href="#downloads">Download</A> our handy forms to help collect donations on your behalf.</p>
                     </td>
                  </tr>
                  
                  <tr valign="top">
                     <td width="150" align="center"><img src="/i/tournament/crpf03/creditcard.gif" width="89" height="63" alt="Pay by credit card" border="0"></td>
                     <td class="bodyText">
                        <strong>To donate by credit card</strong>
                        <ol>
                            <li>Go to the <A href="http://www.crpf.org/contribute/contribute.cfm?orgid=TopCoderWebsite2003" target="_blank">TopCoder Donation</A> 
                            page on www.crpf.org. <strong>Donations will be accepted until 11:59 PM Eastern Time on November 10th</strong>.</li>
                            <li>Enter your name and contact information. <strong>Your personal information will remain confidential.</strong></li>
                            <li>On the next page enter the handle or first and last name of the TopCoder member that your donation is in honor of.</li>
                            <li>If you have any questions please contact <A href="mailto:service@topcoder.com?Subject=I have a question about the TopCoder Charity Challenge CRPF" class="bodyText">TopCoder Service.</A></li>
                        </ol>
                     </td>
                  </tr>
                  
                  <tr valign="top">
                     <td width="150" align="center"><img src="/i/tournament/crpf03/check.gif" width="150" height="63" alt="Pay by check" border="0"></td>
                     <td class="bodyText">
                        <strong>To donate by check:</strong>
                        <ol>
                            <li>Make your check payable to the <em>Christopher Reeve Paralysis Foundation</em>.</li>
                            <li>Include the handle or first and last name of the TopCoder member that your donation is in honor of.</li>
                            <li>Mail your check to:<br/>
                            TopCoder<br />
                            703 Hebron Ave<br />
                            Glastonbury,CT 06033<br />
                            ATTN:  CRPF DONATIONS</li>
                        </ol>
                     </td>
                  </tr>
                  
                  <tr valign="top">
                     <td width="150" align="center"><A name="downloads"><img src="/i/tournament/crpf03/download_forms.gif" width="80" height="63" border="0" alt="Download forms"></A></td>
                     <td class="bodyText">
                        <p><strong>Download forms</strong><br/>
                        Hang this <A href="/i/tournament/crpf03/pledge_collection_form.pdf" target="_blank">pledge collection form</A> around your office, dorm 
                        or dining hall to help spread the word about your participation in the TopCoder Charity Challenge for CRPF.</p>
                        
                        <p>This <A href="/i/tournament/crpf03/donation_form.pdf" target="_blank">donation form</A> provides simple instructions for an individual donor.</p>
                        
                        <p><A href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank"><img src="/i/tournament/crpf03/get_adobe_reader.gif" width="88" height="31" alt="Get Adobe Reader" border="0"></A></p>
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
