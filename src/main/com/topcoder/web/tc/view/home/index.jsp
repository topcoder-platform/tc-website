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
<%-- TCO06
--%>
      <map name="tco06_map">
      <area shape="rect" alt="" coords="1,1, 265,149" href="/tc?module=Static&d1=tournaments&d2=tco06&d3=about" />
      <area shape="rect" alt="" coords="275,1, 499,149" href="/tc?module=TCO06ComponentTerms" />
      </map>
      <td class="BIGPromoBox" align="center"><IMG SRC="/i/home/tco06_comp_registration.gif" border="0" ALT="2006 TopCoder Open" usemap="#tco06_map" /></td>
<%-- $1,000,000
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
--%>
            <A href="/movies/press/cnn_072405.mp4"><img src="/i/home/mov_cnn_072405.jpg" alt="TopCoder Movies" border="0" /></A>
<%-- SRM SPONSORSHIP
            <map name="srm_sponsor">
            <area shape="rect" alt="" coords="1,1, 269,90" href="/?RoundId=8077&t=schedule&c=srm" />
            <area shape="rect" alt="" coords="1,91, 269,139" href="/tc?module=Static&d1=tournaments&d2=tco06&d3=verisign" />
            </map>
            <img src="/i/home/verisign_srm280.gif" alt="VeriSign" border="0" usemap="#srm_sponsor"/>
--%>
<%-- GCJC
            <A href="/gcjc"><img src="/i/home/gcjc.gif" alt="Google Code Jam China" border="0" /></A>
--%>
         </td></tr>
      </table>
      <table border="0" cellpadding="0" cellspacing="0">
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">January Events:</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>
            <b>1/02</b> - TCO06 Component - Registration opens - 9AM<br><br>
            <b>1/05</b> - SRM 281 - 11AM<br><br>
            <b>1/10</b> - SRM 282 - 9PM - NSA<br><br>
            <b>1/19</b> - SRM 283 - 7AM<br><br>
            <b>1/21</b> - SRM 284 - 12 noon<br><br>
            <b>1/24</b> - SRM 285 - 11AM<br><br>
            <b>1/25</b> - TCO06 Component - Week1 submission deadline- 9AM<br><br>
            <b>1/30</b> - SRM 286 - 9PM - MSN<br><br>
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
            TopCoder Announces NSA Participation in 2006 TopCoder Open in Las Vegas<A href="/tc?module=Static&d1=pressroom&d2=pr_010906">...more</A><br>[January 9]<br><br>
            
            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/incDOTcom_logo.gif" width="67" height="25" alt="Inc.com" border="0" /></div>
            Put a hacker to work [PDF] <A href="/pdfs/press_room/inc_0106.pdf" target="_blank">...more</A><br>[January 2006]<br><br>
            
            TopCoder Welcomes VeriSign as Return Sponsor of 2006 TopCoder Open in Las Vegas <A href="/tc?module=Static&d1=pressroom&d2=pr_121905">...more</A><br>[December 19]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/forbes_logo.gif" width="67" height="23" alt="Forbes" border="0" /></div>
            Help Wanted In Silicon Valley<A href="http://www.forbes.com/home/work/2005/12/09/silicon-valley-hiring-cx_rr_1212hire.html" target="_blank">&nbsp;...more</A><br>[December 12]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/bw_cov120205_small.jpg" width="85" height="82" alt="BusinessWeek" border="0" /></div>
            Rise Of A Powerhouse - How the young knowledge workers of Central Europe are pushing the region to a new level<A href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm" target="_blank">&nbsp;...more</A><br>[December 2]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/usatoday_logo.gif" width="67" height="36" alt="USA Today" border="0" /></div>
            TopCoder Survey in USA Today [PDF] <A href="/pdfs/press_room/usatoday_113005.pdf" target="_blank">...more</A><br>[November 30]<br><br>

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
    <tr><td class="copyright"colspan="5">Copyright &#169; 2001-2005, TopCoder, Inc. All rights reserved.</td></tr>
</table>
</body>
</html>
