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
      <td class="BIGPromoBox" align="center"><A href="/tc?module=Static&d1=pressroom&d2=pr_112105"><IMG SRC="/i/home/milestone_million.gif" border="0" ALT="$1,000,000 in Component Competition Payouts"/></A></td>
<%-- MSN
      <td class="BIGPromoBox" align="center"><A href="/tc?module=Static&d1=contracting&d2=msn"><IMG SRC="/i/home/msn_emp_opps.gif" border="0" ALT="MSN is hiring"/></A></td>
--%>
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
         <tr><td class="homeBigPromo">
<%-- CNN MOVIE
            <A href="/movies/press/cnn_072405.mp4"><img src="/i/home/mov_cnn_072405.jpg" alt="TopCoder Movies" border="0" /></A>
--%>
<%-- MSN
            <A href="/?RoundId=8069&t=schedule&c=srm"><img src="/i/home/msn_srm272.gif" alt="MSN" border="0" /></A>
--%>
<%-- SAP
--%>
            <A href="/?RoundId=8073&t=schedule&c=srm"><img src="/i/home/sap_srm276.gif" alt="SAP" border="0" /></A>
<%-- GCJC
            <A href="/gcjc"><img src="/i/home/gcjc.gif" alt="Google Code Jam China" border="0" /></A>
--%>
         </td></tr>
      </table>
      <table border="0" cellpadding="0" cellspacing="0">
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">December Events:</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>
            <b>12/08</b> - SRM 276 - 11AM - SAP<br><br>
            <b>12/17</b> - SRM 277 - 12 noon - MSN<br><br>
            <b>12/19</b> - SRM 278 - 9PM<br><br>
            <b>12/21</b> - SRM 279 - 7AM - SAP<br><br>
            <b>12/28</b> - SRM 280 - 9PM<br><br>
            </td>
         </tr>
<%-- Press Room --%>
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=pressroom&d2=index" class="homeTitleLink">Press Room Highlights</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>
            
            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/bw_cov120205_small.jpg" width="85" height="82" alt="BusinessWeek" border="0" /></div>
            Rise Of A Powerhouse<A href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm" target="_blank">&nbsp;...more</A><br>[December 2]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/usatoday_logo.gif" width="67" height="36" alt="USA Today" border="0" /></div>
            TopCoder Survey in USA Today [PDF] <A href="/pdfs/press_room/usatoday_113005.pdf" target="_blank">...more</A><br>[November 30]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/infoworld_logo.gif" width="67" height="12" alt="InfoWorld" border="0" /></div>
            Google to hold programming competition in China <A href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html" target="_blank">...more</A><br>[November 22]<br><br>

            TopCoder Payouts to Winners of Design and Development Competitions Surpass $1 Million <A href="/tc?module=Static&d1=pressroom&d2=pr_112105">...more</A><br>[November 21]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/ftponline_logo.gif" width="67" height="18" alt="FTPONLINE" border="0" /></div>
            Spirited Reusable Component Development <A href="http://www.ftponline.com/weblogger/forum.aspx?ID=13&DATE=11/01/2005&blog=#449" target="_blank">...more</A><br>[November 1]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/info_week_logo.gif" width="67" height="10" alt="Information Week" border="0" /></div>
            Winning Design Ways <A href="http://www.informationweek.com/showArticle.jhtml?articleID=172901456" target="_blank">...more</A><br>[October 31]<br><br>

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
