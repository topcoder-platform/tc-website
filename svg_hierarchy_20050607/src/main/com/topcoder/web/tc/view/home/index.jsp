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
            <td class="BIGPromoBox"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=about"><img src="/i/home/promos/tco05.gif" border="0" alt=""/></A></td>
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
         <tr><td class=homeBigPromo><A href="/i/tournament/tccc05/onsite_movies/reviewBoard.mov"><img src="/i/home/promos/reviewBoardMovie.jpg" border=0 /></A></td></tr>
      </table>
      <table width="100%" border=0 cellpadding=0 cellspacing=0>
         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/?t=schedule&c=index" class=homeTitleLink>June  Events:</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText><br/>
            <b>6/01</b> - SRM 245 - 9:00 PM<br/><br/>
            <b>6/09</b> - SRM 246 - 1:00 PM<br/><br/>
            <b>6/13</b> - TCO05 Component Registration Opens - 9:00 AM<br/><br/>
            <b>6/18</b> - SRM 247 - 12:00 PM<br/><br/>
            <b>6/21</b> - SRM 248 - 9:00 PM<br/><br/>
            <b>6/29</b> - SRM 249 - 9:00 PM<br/><br/>
            <b>6/29</b> - TCO05 Component Registration Closes & Week 1 Projects Posted - 9:00 AM<br/><br/>
            </td>
         </tr>
         <tr>
            <td class=homeArrow><img src="/i/home/triangle.gif" border=0 /></td>
            <td class=homeTitle><A href="/?t=news_events&c=index" class=homeTitleLink>Press Room Highlights</A></td>
         </tr>
         <tr>
            <td class=homeArrow>&#160;</td>
            <td class=homeText><br/>
            Caliper Hires TCS to Enhance Platform & Services<A href="/tc?module=Static&d1=news&d2=pr_060705"> ...more</A><br/>[June 7]<br/><br/>
            Geeks for Charity holds code to help New River charities<A href="http://www.roanoke.com/business%5C24837.html" target="_blank"> ...more</A><br/>[June 4 - Roanoke.com]<br/><br/>
            How To Hire Best-of-Breed Programmers for Your Project<A href="http://www.sourcingmag.com/home/home.aspx?i=18_6/3/2005_cn_507_2_00_00" target="_blank"> ...more</A><br/>[June 2 - Sourcing Mag]<br/><br/>
            Purdue computer programmer making his mark in competitions<A href="http://www.boilerstation.com/planet/stories/200505160purdue_planet1116219600.shtml" target="_blank"> ...more</A><br/>[May 16 - Boiler Station]<br/><br/>
            Interview with Jack Hughes<A href="/tc?module=Static&d1=news&d2=art_051205"> ...more</A><br/>[April 22 - The Wall Street Transcript]<br/><br/>
            TopCoder&#174;-Powered Coding Challenge to Feature at Sun's 2005 JavaOne<sup>SM</sup> Conference<A href="/?&t=news_events&c=pr_05_02_05"> ...more</A><br/>[May 2]<br/><br/>
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
