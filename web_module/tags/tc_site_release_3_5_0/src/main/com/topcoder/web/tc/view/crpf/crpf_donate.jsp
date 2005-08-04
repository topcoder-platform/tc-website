<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Charity Challenge</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/crpfStyle.css"/>
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
                     <A href="/tc?&module=CRPFStatic&d1=crpf&d2=crpf_photos"><img src="/i/events/crpf03/crfp_banner.jpg" width="510" height="160" border="0" alt="TopCoder Charity Challenge benefiting the CRPF;T"></A><br/>
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
               <p>While it is too late to qualify for entry into the tournament, we are still accepting donations to CRPF. Please give generously.</p>

               <p>We are no longer accepting donations for the TopCoder Charity Challenge benifiting the Christopher Reeve Paralysis Foundation. Please feel free to send donations to directly to the CRPF or to find our more information, please visit www.christopherreeve.com.</p>

               <p>In addition, coders can still earn a TopCoder Charity Challenge commemorative t-shirt. If their total donations reach $50 prior to the conclusion of the tournament on November 17th, TopCoder will send them this limited edition shirt!</p>

               <p>Donating to the TopCoder Charity Challenge for the CRPF is easy! Just follow the directions below. 
               <A href="#downloads">Download</A> our handy forms to help collect donations on your behalf.</p>
 
               <table width="500" border="0" cellpadding="0" cellspacing="10" align="center">
                  <tr valign="top">
                     <td width="150" align="center"><img src="/i/tournament/crpf03/creditcard.gif" width="89" height="63" alt="Pay by credit card" border="0"></td>
                     <td class="bodyText">
                        <strong>To donate by credit card:</strong>
                        <ol>
                            <li>Go to the <A href="http://www.crpf.org/contribute/contribute.cfm?orgid=TopCoderWebsite2003" target="_blank">TopCoder Donation</A> 
                            page on www.crpf.org. <strong>Donations will be accepted until 11:59 PM Eastern Time on November 10, 2003.</strong></li>
                            <li>Enter your name and contact information. <strong>Your personal information will remain confidential.</strong></li>
                            <li>On the next page enter the handle or first and last name of the TopCoder member that your donation is in honor of.</li>
                            <li>If you have any questions please contact <A href="mailto:service@topcoder.com?Subject=I have a question about the TopCoder Charity Challenge CRPF" class="bodyText">TopCoder Service.</A></li>
                        </ol>
                     </td>
                  </tr>
                  
                  <tr valign="top">
                     <td width="150" align="center"><img src="/i/tournament/crpf03/check.gif" width="150" height="63" alt="Pay by check" border="0"></td>
                     <td class="bodyText">
                        <strong>To donate by check follow these three simple steps:</strong>
                        <ol>
                            <li>Include the handle or first and last name of the TopCoder member that your donation is in honor of in the memo field.</li>
                            <li>Make your check payable to the <em>Christopher Reeve Paralysis Foundation</em>.</li>
                            <li>Mail your check to:<br/>
                            TopCoder<br />
                            703 Hebron Ave<br />
                            Glastonbury,CT 06033<br />
                            ATTN:  CRPF DONATIONS<br/>
                            <strong>The check must be received no later than November 10, 2003.</strong></li>
                        </ol>
                     </td>
                  </tr>
                  
                  <tr valign="top">
                     <td width="150" align="center"><A name="downloads"><img src="/i/tournament/crpf03/download_forms.gif" width="80" height="63" border="0" alt="Download forms"></A></td>
                     <td class="bodyText">
                        <p><strong>Helpful Downloads</strong><br/>
                        Use this <A href="/i/tournament/crpf03/pledge_collection_form.pdf" target="_blank">form</A> to help collect donations around your office, dorm, 
                        dining hall, etc.</p>
                        
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
