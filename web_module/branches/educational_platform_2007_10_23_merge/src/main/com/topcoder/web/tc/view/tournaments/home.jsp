<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center">
   <div style="width: 550px; text-align: left; margin: 0px 15px 0px 15px;">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="tc_tournaments"/>
        <jsp:param name="title" value="TopCoder Tournaments"/>
    </jsp:include>

<%--
--%>
   <div class="sectionHeader">Upcoming Tournaments</div>

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=preview"><img src="/i/tournament/tco08current.png" alt="2008 TopCoder Open" border="0" /></A><br /></td>
         <td width="100%">
         <span class="bodySubtitle">2008 TopCoder&#174; Open</span>
         <br /><br />
         May 11 - 15, 2008<br />
         The Mirage <br />
         Las Vegas, NV, USA<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tco08&d3=preview">Details</A>
         <br />
         <A href="http://studio.topcoder.com/?module=ViewContestResults&ct=2127">Logo Contest</A>
         </td>
      </tr>
   </table>

   <div class="sectionHeader">Current Tournaments</div>

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about"><img src="/i/tournament/tccc07current.png" alt="2007 TopCoder Collegiate Challenge" border="0" /></A><br /></td>
         <td width="100%">
         <span class="bodySubtitle">2007 TopCoder&#174; Collegiate Challenge</span>
         <br /><br />
         Oct 30 - Nov 2<br />
         Disney World Contemporary Resort<br />
         Orlando, FL, USA<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about">Details</A>
         <br />
         <A target="_blank" href="/pdfs/tournaments/TCCC07_Program_View.pdf">Program [PDF]</A>
         <br />
         <A href="http://studio.topcoder.com/?module=ViewSubmissions&ct=2104">Logo Contest</A>
         </td>
      </tr>
   </table>


   <div class="sectionHeader" width="100%">Past Tournaments</div>
   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/tournament/photo_tco07.jpg" alt="2007 TopCoder Open" border="0" /></A><br /></td>
         <td width="100%">
         <span class="bodySubtitle">2007 TopCoder&#174; Open Sponsored by AOL</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/pressroom/tco07_logo.png" alt="" border="0" /></A></div>
         June 26-29<br />
         The Mirage <br />
         Las Vegas, NV, USA<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about">Details</A>
         <br />
         <A target="_blank" href="/pdfs/tournaments/TCO07_Program_View.pdf">Program [PDF]</A>
         <br />
         <A href="http://studio.topcoder.com/?module=ViewSubmissions&ct=2047">Logo Contest</A>
         </td>
      </tr>
   </table>
   
   <hr width="100%" size="1" noshade="noshade" />
   
    <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview"><img src="/i/tournament/photo_tchs07.jpg" alt="2007 TopCoder High School" border="0" /></A><br /></td>
         <td width="100%">
         <span class="bodySubtitle">2007 TopCoder&#174; High School</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview"><img src="/i/pressroom/tchs07.png" alt="" border="0" /></A></div>
         May 18-20<br />
         The Lawson Building<br />
         Purdue University<br />
         West Lafayette, IN, USA<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">Details</A>
         <br />
         <A target="_blank" href="/pdfs/tournaments/tchs07_webprogram.pdf">Program [PDF]</A>
         <br />
         <A href="http://studio.topcoder.com/?module=ViewContestResults&ct=2030">Logo Contest</A>
         </td>
      </tr>
   </table>
   
   <hr width="100%" size="1" noshade="noshade" />
   
   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about"><img src="/i/tournament/photo_tccc06.jpg" alt="2006 TopCoder Collegiate Challenge" border="0" /></A><br /></td>
         <td width="100%">
         <span class="bodySubtitle">2006 TopCoder&#174; Collegiate Challenge Sponsored by AOL</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=about"><img src="/i/pressroom/tccc06_logo.gif" alt="" border="0" /></A></div>
         November 14-18<br />
         San Diego Marriott Mission Valley<br />
         San Diego, CA, USA<br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=about">Details</A>
         <br />
         <A target="_blank" href="/i/tournament/tccc06/pdfs/tccc06_program.pdf">Program [PDF]</A>
         <br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=logo_overview">Logo Contest</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=about"><img src="/i/tournament/photo_tco06.jpg" alt="2006 TopCoder Open" border="0" /></A><br /></td>
         <td width="100%">
         <span class="bodySubtitle">2006 TopCoder&#174; Open Sponsored by AMD</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=about"><img src="/i/pressroom/tco06_logo.gif" alt="" border="0" /></A></div>
         May 3-5<br />
         Aladdin Resort and Casino<br/>
         Las Vegas, NV, USA<br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=about">Details</A>
         <br />
         <A target="_blank" href="/pdfs/tournaments/tco06_program.pdf">Program [PDF]</A>
         <br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco06&amp;d3=logo_overview">Logo Contest</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about"><img src="/i/tournament/photo_tco05.jpg" alt="2005 TopCoder Open" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2005 TopCoder&#174; Open Sponsored by Sun Microsystems</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about"><img src="/i/pressroom/tco05_logo.gif" alt="" border="0" /></A></div>
         October 12-14<br />
         Santa Clara Marriott<br/>
         Santa Clara, CA, USA<br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=about">Details</A>
         <br />
         <A target="_blank" href="/pdfs/tournaments/tco05_program.pdf">Program [PDF]</A>
         <br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco05&amp;d3=logo_overview">Logo Contest</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=about"><img src="/i/tournament/photo_tccc05.jpg" alt="2005 TopCoder Collegiate Challenge" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2005 TopCoder&#174; Collegiate Challenge Sponsored by Yahoo!&#174;</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=about"><img src="/i/pressroom/tccc05_logo.gif" alt="" border="0" /></A></div>
         March 10-11<br />
         Santa Clara Marriott<br/>
         Santa Clara, CA, USA<br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc05&amp;d3=about">Details</A>
         <br />
         <A target="_blank" href="/i/tournament/tccc05/TCCC05_Program.pdf">Program [PDF]</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about"><img src="/i/tournament/photo_tco04.jpg" alt="2004 TopCoder Open" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2004 TopCoder&#174; Open Sponsored by Microsoft&#174;</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about"><img src="/i/pressroom/tco04_logo.gif" alt="" border="0" /></A></div>
         November 11-12<br />
         Santa Clara Marriott<br/>
         Santa Clara, CA, USA<br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco04&amp;d3=about">Details</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=tccc04_about"><img src="/i/tournament/photo_tccc04.jpg" alt="2004 TopCoder Collegiate Challenge" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2004 TopCoder&#174; Collegiate Challenge Sponsored by Yahoo&#174;</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=tccc04_about"><img src="/i/tournament/logo_tccc04.gif" alt="" border="0" /></A></div>
         April 15-16<br />
         Boston Park Plaza Hotel<br/>
         Boston, Massachusetts<br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc04&amp;d3=tccc04_about">Details</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_overview"><img src="/i/tournament/photo_tco03.jpg" alt="2003 TopCoder Open" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2003 TopCoder&#174; Open Sponsored by Intel&#174;</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=tco03_overview"><img src="/i/tournament/logo_tco03.gif" alt="" border="0" /></A></div>
         December 4-5<br />
         Mohegan Sun Casino<br />
         Uncasville, Connecticut<br />
         <A href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco03&amp;d3=summary&amp;d4=final">Summary</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tccc03&d3=champ"><img src="/i/tournament/photo_tccc03.jpg" alt="2003 TCCC" width="274" height="134" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2003 Sun Microsystems&#153; TopCoder&#174; Collegiate Challenge</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&d1=tournaments&d2=tccc03&d3=champ"><img src="/i/tournament/logo_tccc03.gif" alt="Logo" width="113" height="73" border="0" /></A></div>
         April 4-5<br />
         University Park Hotel @ MIT<br/>
         Cambridge, Massachusetts<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tccc03&d3=champ">Summary</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tci02&d3=champ"><img src="/i/tournament/photo_tci02.jpg" alt="2002 TCI" width="274" height="134" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2002 TopCoder&#174; Invitational</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&d1=tournaments&d2=tci02&d3=champ"><img src="/i/tournament/logo_tci02.gif" alt="Logo" width="113" height="73" border="0" /></A></div>
         November 22-23<br />
         Mohegan Sun Casino<br />
         Uncasville, Connecticut<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tci02&d3=champ">Summary</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tccc02&d3=champ"><img src="/i/tournament/photo_tccc02.jpg" alt="2002 TCCC" width="274" height="134" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2002 Sun Microsystems&#153; TopCoder&#174; Collegiate Challenge</span>
         <br /><br />
         <div style="float: right;"><A href="/tc?module=Static&d1=tournaments&d2=tccc02&d3=champ"><img src="/i/tournament/logo_tccc02.gif" alt="Logo" width="113" height="73" border="0" /></A></div>
         April 19-20<br />
         University Park Hotel @ MIT<br/>
         Cambridge, Massachusetts<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tccc02&d3=champ">Summary</A>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tci01&d3=summary"><img src="/i/tournament/photo_tci01.jpg" alt="2001 TCI" width="274" height="134" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2001 TopCoder&#174; Invitational</span>
         <br /><br />
         November 2-3<br />
         Foxwoods Resort Casino<br />
         Mashantucket, Connecticut<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tci01&d3=summary">Summary</A></p>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />

   <table cellpadding="0" cellspacing="0" style="padding-bottom: 5px;">
      <tr valign="top">
         <td style="padding-right: 8px;"><A href="/tc?module=Static&d1=tournaments&d2=tccc01&d3=summary"><img src="/i/tournament/photo_tccc01.jpg" alt="2001 TCCC" width="274" height="134" border="0" /></A></td>
         <td width="100%">
         <span class="bodySubtitle">2001 TopCoder&#174; Collegiate Challenge</span>
         <br /><br />
         June 5-7<br />
         San Francisco Hilton and Towers<br/>
         San Francisco, California<br />
         <A href="/tc?module=Static&d1=tournaments&d2=tccc01&d3=summary">Summary</A></p>
         </td>
      </tr>
   </table>

   <hr width="100%" size="1" noshade="noshade" />
   <div align="center">
      Also for Software Designers and Developers...<br />
      <A href="/tc?module=Static&d1=dev&d2=usdc_overview">Ultimate Software Development Contest</A><br />
      <A href="/tc?module=Static&d1=dev&d2=bonusContest1">Design Bonus Contest 1</A><br />
      <A href="/tc?module=Static&d1=dev&d2=bonusContest2">Design Bonus Contest 2</A>
   </div>
   <hr width="100%" size="1" noshade="noshade" />
   <div align="center"><A href="mailto:sponsorships@topcoder.com">Sponsor a TopCoder&#174; tournament</A></div>

   <br /><br />
   </div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
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
