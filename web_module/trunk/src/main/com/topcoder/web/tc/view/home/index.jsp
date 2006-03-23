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

<%--
<div style="position:absolute; left:120px; top:120px;">
<A href="/?t=sponsor&c=link&link=http://www.equitrader.com" target="_blank"><img src="/i/interface/dot.gif" alt="EquiTrader" /></A>
</div>
--%>

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
      <td class="BIGPromoBox" align="center"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=about"><IMG SRC="/i/home/tco06_logo_grn.gif" border="0" ALT="2006 TopCoder Open" /></A></td>
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
            <td class="homeTitle">Software Competitions</td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Compete in Software <A href="/tc?module=ViewActiveContests&ph=112">Design</A>, <A href="/tc?module=ViewActiveContests&ph=113">Development</A> and <A href="/tc?module=Static&d1=dev&d2=assembly&d3=overview">Assembly</A> Competitions and get paid for what you build!</td>
         </tr>
         <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0" /></td>
            <td class="homeTitle"><A href="/longcontest/?module=ViewActiveContests" class="homeTitleLink">Marathon Matches</A></td>
         </tr>
         <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">A more flexible <A href="/longcontest/?module=ViewActiveContests">competition</A> format with an extended timeline and different types of problems than those in a traditional algorithm round.</td>
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
            TopCoder Announces AMD as Title Sponsor of 2006 TopCoder Open in Las Vegas <A href="/tc?module=Static&d1=pressroom&d2=pr_031606">...more</A><br>[March 16]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/adt_logo.gif" width="88" height="24" alt="ADT Mag" border="0" /></div>
            SOA vendors partner with LogicLibrary to create integrated governance platform <A href="http://www.adtmag.com/article.aspx?id=18109" target="_blank">...more</A><br>[March 14]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/wallstreetnTech_logo.gif" width="88" height="34" alt="Wallstreet &amp; Technology" border="0" /></div>
            UBS Sponsors TopCoder Open <A href="http://www.wallstreetandtech.com/showArticle.jhtml?articleID=181502379" target="_blank">...more</A><br>[March 13]<br><br>
            
            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/dnaIndia_logo.gif" width="61" height="33" alt="DNA India" border="0" /></div>
            Code jockey contest returns to IT hub <A href="http://www.dnaindia.com/report.asp?NewsID=1017289&CatID=2" target="_blank">...more</A><br>[March 13]<br><br>
            
            Exclusive: Interview with Pat Conley, VP VeriSign O&I and TopCoder Member <A href="/tc?module=Static&d1=pressroom&d2=art_031006">...more</A><br>[March 10]<br><br>

            <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/postOnline_logo.gif" width="88" height="13" alt="The Post Online" border="0" /></div>
            Gurus compete in coding competition <A href="http://thepost.baker.ohiou.edu/show_news.php?article=N3&date=030806" target="_blank">...more</A><br>[March 8]<br><br>

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
            <A href="/tc?module=Static&d1=about&d2=contactus">Contact Us</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=privacy" class="footerLinks">Privacy</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=terms" class="footerLinks">Terms</A>
         <br>
            <A href="/tc" class="footerLinks">Developer Center</A>&#160;&#160;|&#160;&#160;
            <A href="/corp/?module=Static&d1=corp&d2=index" class="footerLinks">Corporate Services</A>
    <tr><td class="copyright"colspan="5">Copyright &#169; 2001-2006, TopCoder, Inc. All rights reserved.</td></tr>
</table>
</body>
</html>