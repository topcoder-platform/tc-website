<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 java.text.DecimalFormat,
                 com.topcoder.common.web.data.Navigation,
                 com.topcoder.web.common.model.CoderSessionInfo"%>
<%@  page language="java"  %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
<link type="text/css" rel="stylesheet" href="/css/home.css"/>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<STYLE TYPE="text/css">
body
{
text-align: center;
}
.centerer
{
width: 600px;
margin:0px auto;
}
</STYLE>

</head>

<%
    Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
    if (nav==null) nav = new Navigation(request, response);
    request.getSession(true).setAttribute("navigation", nav);
    CoderSessionInfo sessionInfo = nav.getSessionInfo();
%>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
       <td class="homeTopBar" align=left>
        <span class="time">Current Member Count</span>&#160;:&#160;<%=new DecimalFormat("#,##0").format(sessionInfo.getMemberCount())%> -
        <tc:format object="<%=sessionInfo.getDate()%>" format="MMMM d, yyyy"/>
       </td>
      <td class="homeTopBar" align=right><A href="/tc?module=Static&d1=about&d2=index" class="loginLinks">About TopCoder</A></td>
   </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
      <td width="50%" class="homeLogo" align="left"><img src="/i/home/TC_homeLogo.gif" alt="TopCoder"/></td>
      <td class="BIGPromoBox" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=about"><IMG SRC="/i/home/promos/tco05.gif" border="0" ALT="TCO05" /></a></td>
      <td width="50%" class="homeLogo" align="right">&#160;</td>
   </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" class="centerer">
<%-- Banners --%>
   <tr>
      <td class="homeLeftBan"><A href="/tc"><img src="/i/home/tab_developercenter.gif" alt="Developer Center" border="0" /></A></td>
      <td class="homeGutter" rowspan=2>&#160;</td>
      <td class="homeCentBan"><A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/tab_corporateservices.gif" alt="Corporate Services" border="0" /></A></td>
      <td class="homeGutter" rowspan=2>&#160;</td>
      <td class="homeRightBan"><A href="/tc?module=Static&d1=pressroom&d2=index"><img src="/i/home/tab_newsevents.gif" alt="News & Events" border="0" /></A></td>
   </tr>
<%-- Body --%>
   <tr>
<%-- Left Column --%>
      <td class="homeLeftCol">
      <table border="0" cellpadding="0" cellspacing="0">
         <tr><td class="homeBigPromo"><A href="/tc"><img src="/i/home/promos/developercenter.gif" alt="Developer Center" border="0" /></A></td></tr>
      </table>
      <table border="0" cellpadding="0" cellspacing="0">
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc" class="homeTitleLink">Algorithm Competitions</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">How do you stand up among your peers? <A href="/tc">Compete</A> in our algorithm competitions.</td>
         </tr>

         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/?t=development&c=index" class="homeTitleLink">Software Competitions</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Compete in software <A href="/?t=development&c=index">component</A> competitions and get paid for what you build! You can also earn money by <A href="/?t=development&c=index">reviewing</A> software components.</td>
         </tr>

         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=contracting&d2=index" class="homeTitleLink">Employment Opportunities</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Just <A href="/tc?module=Static&d1=contracting&d2=index">register here</A> and TopCoder will contact you about temporary and permanent positions that fit your skills.</td>
         </tr>

         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=about&d2=jobs" class="homeTitleLink">Work for TopCoder</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Take a look at the <A href="/tc?module=Static&d1=about&d2=jobs">job openings</A> at TopCoder and see if there's a position that is right for you.</td>
         </tr>
      </table>
      </td>
<%-- Center Column --%>
      <td class="homeCentCol">
      <table border="0" cellpadding="0" cellspacing="0">
         <tr><td class="homeBigPromo"><A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/promos/placement.gif" alt="Corporate Services" border="0" /></A></td></tr>
      </table>
      <table border="0" cellpadding="0" cellspacing="0">
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class="homeTitleLink">Software</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Developers from all over the world are competing to build your next application. Learn how TopCoder delivers high-quality <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>">software</A> at a lower cost than the competition.</td>
         </tr>

         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class="homeTitleLink">Marketing Services</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Is your company looking to interact with developers from around the world? TopCoder offers many <A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index">opportunities</A> to do just that.</td>
         </tr>
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/corp/?module=Static&d1=corp&d2=tces_home" class="homeTitleLink">Employment Services</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Are you a company interested in <A href="/corp/?module=Static&d1=corp&d2=tces_home">hiring</A> talent? Let TopCoder bring you together with software engineers looking for jobs.</td>
         </tr>
      </table>
      </td>
<%-- Right Column --%>
      <td class="homeRightCol">
      <table border="0" cellpadding="0" cellspacing="0">
         <tr><td class="homeBigPromo"><A href="/?t=sponsor&c=link&link=/pdfs/tournaments/tco05_program.pdf&refer=homepage"><img src="/i/home/tco05_program.gif" alt="TCO05 Program" border="0" /></A></td></tr>
      </table>
      <table border="0" cellpadding="0" cellspacing="0">
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">October Events:</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>
            <b>10/01</b> - SRM 266 - 12PM - Yahoo!<br><br>
            <b>10/05</b> - SRM 267 - 9PM - Sun<br><br>
            <b>10/12-14</b> - TCO05 Onsite Finals<br><br>
            <b>10/18</b> - SRM 268 - 11AM - Sun<br><br>
            <b>10/26</b> - SRM 269 - 9PM - NSA<br><br>
            </td>
         </tr>
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=pressroom&d2=index" class="homeTitleLink">Press Room Highlights</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/carynews_logo.gif" width="67" height="20" alt="CN" border="0" /></div>
            Ready, again, for TopCoder battle <A href="http://www.carynews.com/enterprise/story/2805639p-9249369c.html" target="_blank">...more</A><br>[September 28]<br><br>

            Onsite Finalists Announced In 2005 TopCoder Open Sponsored by Sun Microsystems <A href="/tc?module=Static&d1=pressroom&d2=pr_092805">...more</A><br>[September 2]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/irishdev_logo.gif" width="67" height="48" alt="IDN" border="0" /></div>
            Google announces Winner of 2005 Code Jam <A href="http://www.irishdev.com/NewsArticle.aspx?id=1046">...more</A><br>[September 26]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/dndj_logo.gif" width="67" height="20" alt="DNDJ" border="0" /></div>
            Engineering + Reuse = Savings [PDF] <A href="/pdfs/press_room/dndj_082005.pdf">...more</A><br>[August]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/pcwk_logo.gif" width="67" height="34" alt="PCWK" border="0" /></div>
            Poland Takes the Lead <A href="/tc?module=Static&d1=pressroom&d2=art_091205">...more</A><br>[September 12]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/adt_logo.gif" width="67" height="23" alt="ADT" border="0" /></div>
            Components for SOAs and Other App Dev Projects <A href="http://www.adtmag.com/article.asp?id=11752" target="_blank">...more</A><br>[September 6 - ADT]<br><br>

            </td>
         </tr>
      </table>
      </td>
   </tr>
</table>
<%-- Footer --%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
   <tr><td class="homeFooter"colspan="5">
            <A href="/" class="footerLinks">Home</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=index" class="footerLinks">About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=pressroom&d2=index" class="footerLinks">Press Room</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=contacts&c=index" class="footerLinks">Contact Us</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=privacy" class="footerLinks">Privacy</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=terms" class="footerLinks">Terms</A>
         <br>
            <A href="/tc" class="footerLinks">Developer Center</A>&#160;&#160;|&#160;&#160;
            <A href="/corp/?module=Static&d1=corp&d2=index" class="footerLinks">Corporate Services</A>
    <tr><td class="copyright"colspan="5">Copyright &#169; 2001-2004, TopCoder, Inc. All rights reserved.</td></tr>
</table>
</body>
</html>
