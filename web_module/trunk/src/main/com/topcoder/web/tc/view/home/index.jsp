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
      <map name="tco06_map">
      <area shape="rect" alt="" coords="1,1, 265,149" href="/tc?module=Static&d1=tournaments&d2=tco06&d3=about" />
      <area shape="rect" alt="" coords="275,1, 499,149" href="/tc?module=TCO06AlgorithmTerms" />
      </map>
      <td class="BIGPromoBox" align="center"><IMG SRC="/i/home/tco06_algo_reg_AMD.gif" border="0" ALT="2006 TopCoder Open" usemap="#tco06_map" /></td>
--%>
      <td class="BIGPromoBox" align="center"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=about"><IMG SRC="/i/home/tco06_logo_grn.gif" border="0" ALT="2006 TopCoder Open" /></A></td>
<%-- high school
      <td class="BIGPromoBox" align="center"><A href="/tc?module=Static&d1=hs&d2=home"><IMG SRC="/i/home/high_school.jpg" border="0" ALT="TopCoder High School"/></A></td>
--%>
<%-- Intel
      <td class="BIGPromoBox" align="center"><A href="/longcontest/?module=Static&d1=intel_overview"><IMG SRC="/i/home/intel_mtcs_banner.gif" border="0" ALT="Intel Multi-Threading Competition Series"/></A></td>
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
         <tr><td class="homeBigPromo"><A href="/longcontest/?module=Static&d1=intel_overview"><img src="/i/home/intel_multi_threading_sm.gif" alt="Intel Multi-Threading Competition Series" border="0" /></A></td></tr>
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
         <tr><td class="homeBigPromo"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>"><img src="/i/home/tcs.jpg" alt="TopCoder Software" border="0" /></A></td></tr>
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
<%-- CNN 
            <A href="/movies/press/cnn_072405.mp4"><img src="/i/home/mov_cnn_072405.jpg" alt="TopCoder Movies" border="0" /></A>
--%>
<%-- WSJ 
--%>
            <A href="http://webreprints.djreprints.com/1404341094425.html" target="_blank"><img src="/i/home/wsj_020806_sm.gif" alt="The Wall Street Journal" border="0" /></A>
<%-- SRM SPONSORSHIP
            <map name="srm_sponsor">
            <area shape="rect" alt="" coords="1,1, 269,90" href="/?RoundId=8077&t=schedule&c=srm" />
            <area shape="rect" alt="" coords="1,91, 269,139" href="/tc?module=Static&d1=tournaments&d2=tco06&d3=verisign" />
            </map>
            <img src="/i/home/verisign_srm280.gif" alt="VeriSign" border="0" usemap="#srm_sponsor"/>
--%>
<%-- Intel MTCS 
            <A href="/longcontest/?module=ViewActiveContests&rt=15"><img src="/i/home/intel_multi_threading_sm.gif" alt="Intel Multi-Threading Competition Series" border="0" /></A>
--%>
         </td></tr>
      </table>
      <table border="0" cellpadding="0" cellspacing="0">
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">March Events:</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>
            <b>03/01</b> - TCO06 Algorithm - Qualification Round End - 12noon<br><br>
            <b>03/04</b> - TCO06 Algorithm - Online Round 1 - 12noon<br><br>
            <b>03/06</b> - SRM 292 - 9PM - NSA<br><br>
            <b>03/08</b> - TCO06 Algorithm - Online Round 2 - 9:30PM<br><br>
            <b>03/15</b> - TCO06 Algorithm - Online Round 3 - 9:30PM<br><br>
            <b>03/16</b> - TCO06 Component - Round #1 projects posted - 9AM<br><br>
            <b>03/17</b> - SRM 293 - 11AM<br><br>
            <b>03/22</b> - TCO06 Algorithm - Online Round 4 - 9:30PM<br><br>
            <b>03/22</b> - Intel Multi-Threading Competition 3 - 12noon<br><br>
            <b>03/23</b> - TCO06 Component - Round #1 submission deadline - 9AM<br><br>
            <b>03/25</b> - SRM 294 - 12noon<br><br>
            <b>03/29</b> - SRM 295 - 9PM<br><br>
            <b>03/30</b> - TCO06 Component - Round #2 projects posted - 9AM<br><br>
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
            TopCoder Names UBS as Premier Sponsor of 2006 TopCoder Open <A href="/tc?module=Static&d1=pressroom&d2=pr_030306">...more</A><br>[March 3]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/spartanDaily_logo.gif" width="88" height="10" alt="Spartan Daily" border="0" /></div>
            SJSU codes a win <A href="http://www.thespartandaily.com/media/paper852/news/2006/02/16/News/Sjsu-Codes.A.Win-1616451.shtml?norewrite&sourcedomain=www.thespartandaily.com" target="_blank">...more</A><br>[February 16]<br><br>
            
            TopCoder High School Launches Global Programming Tournament in June <A href="/tc?module=Static&d1=pressroom&d2=pr_020806">...more</A><br>[February 8]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/wsj_logo.gif" width="88" height="10" alt="Wall Street Journal" border="0" /></div>
            Programming Contest Pits World's Top Geeks In Battles Over Coding <A href="http://webreprints.djreprints.com/1404341094425.html" target="_blank">...more</A><br>[February 8]<br><br>

            TopCoder Software Component Libraries Selected as Finalist for the 16th Annual Jolt Awards <A href="/tc?module=Static&d1=pressroom&d2=pr_012606">...more</A><br>[January 26]<br><br>

            TopCoder Names Intel Corporation as First Sponsor of New Marathon Match Series <A href="/tc?module=Static&d1=pressroom&d2=pr_012306">...more</A><br>[January 23]<br><br>
                                        
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
    <tr><td class="copyright"colspan="5">Copyright &#169; 2001-2006, TopCoder, Inc. All rights reserved.</td></tr>
</table>
</body>
</html>
