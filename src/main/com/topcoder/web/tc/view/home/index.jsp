<%@ page import="com.topcoder.shared.util.ApplicationServer,
                 java.text.DecimalFormat,
                 com.topcoder.common.web.data.Navigation,
                 com.topcoder.web.tc.model.CoderSessionInfo"%>
<%@  page language="java"  %>
<%@ taglib uri="tc-taglib.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
<link type="text/css" rel="stylesheet" href="/css/home.css"/>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>

<%
    Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
    if (nav==null) nav = new Navigation(request, response);
    request.getSession(true).setAttribute("navigation", nav);
    CoderSessionInfo sessionInfo = nav.getSessionInfo();
%>
 
<body>
<table width="100%" border=0 cellpadding=0 cellspacing=0>
<%-- Header --%>
   <tr>
      <td colspan=7>
      <table width="100%" border=0 cellpadding=0 cellspacing=0>
         <tr>
             <td class=homeTopBar align=left>
                 <span class=time>Current Member Count</span>&#160;:&#160;<%=new DecimalFormat("#,##0").format(sessionInfo.getMemberCount())%> -
                 <tc:format object="<%=sessionInfo.getDate()%>" format="MMMM d, yyyy"/>
             </td>
            <td class=homeTopBar ></td>
            <td class=homeTopBar align=right><A href="/tc?module=Static&d1=about&d2=index" class="loginLinks">About TopCoder</A></td>
         </tr>
         <tr>
            <td width="50%" class="homeLogo"><img src="/i/home/TC_homeLogo.gif" alt=""/></td>
            <td class="BIGPromoBox"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about"><img src="/i/home/promos/BIG_tccc05.gif" border="0" alt=""/></A></td>
            <td width="50%" class="homeLogo">&#160;</td>
         </tr>            
      </table>
      </td>
   </tr>

<%-- Banners --%>
   <tr>
      <td width="50%" rowspan=2>&#160;</td>
      <td class=homeLeftBan><A href="/tc"><img src="/i/home/tab_developercenter.gif" border=0 /></A></td>
      <td class=homeGutter rowspan=2>&#160;</td>
      <td class=homeCentBan><A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/tab_corporateservices.gif" border=0 /></A></td>
      <td class=homeGutter rowspan=2>&#160;</td>
      <td class=homeRightBan><A href="/?t=news_events&c=index"><img src="/i/home/tab_newsevents.gif" border=0 /></A></td>
      <td width="50%" rowspan=2>&#160;</td>
   </tr>
<%-- Body --%>
   <tr>
<%-- Left Column --%>
      <td class=homeLeftCol>
      <table width="100%" border=0 cellpadding=0 cellspacing=0>
         <tr><td class=homeBigPromo><A href="/tc"><img src="/i/home/promos/developercenter.gif" border=0 /></A></td></tr>
      </table>
      <table width="100%" border=0 cellpadding=0 cellspacing=0>
         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/tc" class=homeTitleLink>Algorithm Competitions</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText>How do you stand up among your peers? <A href="/tc">Compete</A> in our algorithm competitions.</td>
         </tr>

         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/?t=development&c=index" class=homeTitleLink>Software Competitions</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText>Compete in software <A href="/?t=development&c=index">component</A> competitions and get paid for what you build! You can also earn money by <A href="/?t=development&c=index">reviewing</A> software components.</td>
         </tr>

         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/tc?module=Static&d1=contracting&d2=index" class=homeTitleLink>Looking for your next Gig?</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText>Just <A href="/tc?module=Static&d1=contracting&d2=index">register here</A> and TopCoder will contact you about temporary and permanent positions that fit your skills.</td>
         </tr>

         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/tc?module=Static&d1=about&d2=jobs" class=homeTitleLink>Work for TopCoder</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText>Take a look at the <A href="/tc?module=Static&d1=about&d2=jobs">job openings</A> at TopCoder and see if there's a position that is right for you.</td>
         </tr>
      </table>
      </td>
<%-- Center Column --%>
      <td class=homeCentCol>
      <table width="100%" border=0 cellpadding=0 cellspacing=0>
         <tr><td class=homeBigPromo><A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/promos/techAssessTool.jpg" border=0 /></A></td></tr>
      </table>
      <table width="100%" border=0 cellpadding=0 cellspacing=0>
         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class=homeTitleLink>Software</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText>Developers from all over the world are competing to build your next application. Learn how TopCoder delivers high-quality <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>">software</A> at a lower cost than the competition.</td>
         </tr>

         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class=homeTitleLink>Marketing Services</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText>Is your company looking to interact with developers from around the world? TopCoder offers many <A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index">opportunities</A> to do just that.</td>
         </tr>
         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/corp/?module=Static&d1=corp&d2=tces_home" class=homeTitleLink>Employment Services</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText>Are you a company interested in <A href="/corp/?module=Static&d1=corp&d2=tces_home">hiring</A> talent? Let TopCoder bring you together with software engineers looking for jobs.</td>
         </tr>
      </table>
      </td>
<%-- Right Column --%>
      <td class=homeRightCol>
      <table width="100%" border=0 cellpadding=0 cellspacing=0>
         <tr><td class=homeBigPromo><A href="/i/tournament/tco04/onsite_movies/Nvidia2.mov"><img src="/i/home/promos/nvidiaRepMovie.jpg" border=0 /></A></td></tr>
      </table>
      <table width="100%" border=0 cellpadding=0 cellspacing=0>
         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/?t=schedule&c=index" class=homeTitleLink>February Events:</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText><br/>
            <b>2/02</b> - TCCC05 Round 4<br/><br/>
            <b>2/08</b> - SRM 230<br/><br/>
            <b>2/19</b> - SRM 231<br/><br/>
            <b>2/23</b> - SRM 232
            </td>
         </tr>
         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/?t=news_events&c=index" class=homeTitleLink>Press Room Highlights</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText><br/>
            TC Community Surpasses 50,000 Worldwide Nears 10,000 Rated Member Mark<A href="/?&t=news_events&c=pr_02_07_05"> ...more</A><br/>[February 7]<br/><br/>
            Software Taming Gene Data Pool<A href="http://www.wired.com/news/medtech/0,1286,66458,00.html?tw=wn_tophead_1" target="_blank"> ...more</A><br/>[February 2 - Wired]<br/><br/>
            DE-CODER: The kings of coding<A href="/?&t=news_events&c=art_02_01_05"> ...more</A><br/>[February 1 - ADT]<br/><br/>
            TCS Delivers for International Consortium of Spinal Cord Injury Researchers<A href="/?&t=news_events&c=pr_01_25_05"> ...more</A><br/>[January 25]<br/><br/>
            TopCoder&#174; Announces Motorola as Premier Sponsor of 2005 TopCoder Collegiate Challenge<A href="/?&t=news_events&c=pr_01_18_05"> ...more</A><br/>[January 18]<br/><br/>
            Code Reuse Pays Off for ING<A href="http://www.computerworld.com/industrytopics/financial/story/0,10801,98834,00.html" target="_blank"> ...more</A><br/>[January 10]<br/><br/>
            </td>
         </tr>
      </table>
      </td>
   </tr>
<%-- Footer --%>
    <tr><td class="homeFooter" colspan=7>
            <A href="/" class="footerLinks">Home</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=index" class="footerLinks">About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=news_events&c=index" class="footerLinks">Press Room</A>&#160;&#160;|&#160;&#160;
            <A href="/?t=contacts&c=index" class="footerLinks">Contact Us</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=privacy" class="footerLinks">Privacy</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=terms" class="footerLinks">Terms</A>
         <br/>
            <A href="/tc" class="footerLinks">Developer Center</A>&#160;&#160;|&#160;&#160;
            <A href="/corp/?module=Static&d1=corp&d2=index" class="footerLinks">Corporate Services</A>
    <tr><td width="100%" class="copyright" colspan=7>Copyright &#169; 2001-2004, TopCoder, Inc. All rights reserved.</td></tr>
</table>


</body>
</html>
