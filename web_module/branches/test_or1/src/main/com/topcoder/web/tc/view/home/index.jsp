<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/home.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <STYLE TYPE="text/css">
        body {
            text-align: center;
        }

        .centerer {
            width: 600px;
            margin: 0px auto;
        }
    </STYLE>
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript">
        <!--
        _uacct = "UA-321688-1"; urchinTracker();
        -->
    </script>
    <c:if test="${!sessionInfo.knownUser}">
        <% if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) { %>
        <script src="/webiq/webiq.js" type="text/javascript"></script>
        <% } %>
    </c:if>

</head>

<body>
<c:if test="${!sessionInfo.knownUser}">
    <% if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) { %>
    <script type="text/javascript">
        <!--
        <%--just comment out the line below to turn off webiq --%>
        inviteUserToBeginWebIQ(1, 524, 500, 525);
        -->
    </script>
    <% } %>
</c:if>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="homeTopBar" align=left>
            <span class="time">Current Member Count</span>&#160;:&#160;
            <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/> -
            <tc-webtag:format object="${sessionInfo.date}" format="MMMM d, yyyy"/>
        </td>
        <td class="homeTopBar" align=right>
            <A href="/reg/" class="loginLinks">Register Now</A>
            | <A href="/tc?module=Static&d1=about&d2=index" class="loginLinks">About TopCoder</A></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td width="50%" class="homeLogo" align="left"><img src="/i/home/TC_homeLogo.gif" alt="TopCoder"/></td>
        <td class="BIGPromoBox" align="center">
<map name="tccc">
<area shape="rect" alt="" coords="1,1,230,149" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=about" />
<area shape="rect" alt="" coords="300,5,350,105" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_finals_analysis" />
<area shape="rect" alt="" coords="355,5,405,105" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_des_summary" />
<area shape="rect" alt="" coords="410,5,460,105" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_dev_summary" />
</map>
<IMG SRC="/i/home/tccc06_winners.png" border="0" alt="TCCC06 Finals" usemap="#tccc"/>
        </td>
        <td width="50%" align="right" valign="top" style="border-bottom: 1px solid #666666; padding:0px; margin:0px;">
            <%--&nbsp;
            <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2045"><img src="/i/home/studioDogEar_20061102.png" alt="TopCoder Studio & AOL Mashups" /></A>
            --%>
        </td>
    </tr>
</table>


<table border="0" cellpadding="0" cellspacing="0" class="centerer">
<%-- Banners --%>
<tr>
    <td class="homeLeftBan"><A href="/tc"><img src="/i/home/tab_developercenter.gif" alt="Developer Center" border="0" style="display:block;" /></A>
    </td>
    <td class="homeGutter" rowspan=2>&#160;</td>
    <td class="homeCentBan">
        <A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/tab_corporateservices.gif" alt="Corporate Services" border="0" style="display:block;" /></A>
    </td>
    <td class="homeGutter" rowspan=2>&#160;</td>
    <td class="homeRightBan">
        <A href="/tc?module=Static&d1=pressroom&d2=index"><img src="/i/home/tab_newsevents.gif" alt="News & Events" border="0" style="display:block;" /></A>
    </td>
</tr>
<%-- Body --%>
<tr>
<%-- Left Column --%>
<td class="homeLeftCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr><td class="homeBigPromo">
            <%-- INTEL MTCS
            <A href="/longcontest/?module=Static&d1=intel_overview"><img src="/i/home/intel_multi_threading_sm.gif" alt="Intel Multi-Threading Competition Series" border="0" style="display:block;"/></A>
            --%>
            <%-- DIGITAL RUN --%>
            <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/home/digitalrun20061104.png" alt="The Digital Run" border="0" style="display:block;"/></A>
            
            <%-- bloomberg 
            <map name="bbg_srm">
            <area shape="rect" alt="" coords="88,2,265,92" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg" />
            <area shape="rect" alt="" coords="12,10,80,84" href="/tc?module=MatchDetails&rd=9997" />
            <area shape="rect" alt="" coords="17,108,63,128" href="/tc?module=MatchDetails&rd=9997" />
            </map>
            <img src="/i/home/bloomberg_srm317.gif" alt="Bloomberg TCCC Sponsor of SRM 317" border="0" style="display:block;" usemap="#bbg_srm"/>
            --%>
            <%-- SPONSORS 
            <map name="srm">
            <area shape="rect" alt="" coords="1,1,264,85" href="/tc?module=MatchDetails&rd=10006" />
            <area shape="rect" alt="" coords="1,96,264,135" href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa" />
            </map>
            <img src="/i/home/srm326_nsa.png" alt="SRM 326 brought to you by NSA" border="0" style="display:block;" usemap="#srm"/>
            --%>
            <%-- AOL mashups 
            <A href="http://studio.topcoder.com/forums?module=Thread&threadID=123"><img src="/i/home/aol_mashups.gif" alt="AOL mashups" border="0" style="display:block;"/></A>
            --%>

        </td></tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc" class="homeTitleLink">Algorithm & High School Competitions</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">How do you stand up among your peers? <A href="/tc">Compete</A> in our algorithm competitions.</td>
        </tr>

        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc" class="homeTitleLink">Software Competitions</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Compete in Software <A href="/tc?module=ViewActiveContests&ph=112">Design</A>,
                <A href="/tc?module=ViewActiveContests&ph=113">Development</A>,
                <A href="/tc?module=Static&d1=dev&d2=assembly&d3=overview">Assembly</A>, and
                <A href="/tc?module=Static&d1=dev&d2=testing&d3=overview">Testing</A> Competitions and get paid for
                what you build!</td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/longcontest/?module=ViewActiveContests" class="homeTitleLink">Marathon
                Matches</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">A more flexible <A href="/longcontest/?module=ViewActiveContests">competition</A>
                format with an extended timeline and different types of problems than those in a traditional algorithm
                round.</td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=contracting&d2=index" class="homeTitleLink">Employment
                Opportunities</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Just <A href="/tc?module=Static&d1=contracting&d2=index">register here</A> and TopCoder
                will contact you about temporary and permanent positions that fit your skills.</td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=about&d2=jobs" class="homeTitleLink">Work for
                TopCoder</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Take a look at the <A href="/tc?module=Static&d1=about&d2=jobs">job openings</A> at
                TopCoder and see if there's a position that is right for you.</td>
        </tr>
    </table>
</td>
<%-- Center Column --%>
<td class="homeCentCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr><td class="homeBigPromo">
            <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/customers/index.jsp"><img src="/i/home/tcs_client_directenergy.png" alt="TopCoder & Direct Energy" border="0" style="display:block;" /></A>
        </td></tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>" class="homeTitleLink">Software</A>
            </td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Developers from all over the world are competing to build your next application. Learn
                how TopCoder delivers high-quality
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>">software</A> at a lower cost than the
                competition.</td>
        </tr>

        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index" class="homeTitleLink">Marketing
                Services</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Is your company looking to interact with developers from around the world? TopCoder
                offers many <A href="/corp/?module=Static&d1=corp&d2=spon_prog&d3=index">opportunities</A> to do just
                that.</td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/corp/?module=Static&d1=corp&d2=tces_home" class="homeTitleLink">Employment
                Services</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Are you a company interested in <A href="/corp/?module=Static&d1=corp&d2=tces_home">hiring</A>
                talent? Let TopCoder bring you together with software engineers looking for jobs.</td>
        </tr>
    </table>
</td>
<%-- Right Column --%>
<td class="homeRightCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr><td class="homeBigPromo">
            <%-- AOL webcast team 
            <A href="http://dev.aol.com/video"><img src="/i/home/aolWebcast_20061113.jpg" alt="Meet the TCCC webcast team" border="0" style="display:block;" /></A>
            --%>
            <%-- AOL Mashups --%>
            <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2045"><img src="/i/home/aolmashups_sm.jpg" alt="AOL Mashups" border="0" style="display:block;" /></A>
            
        </td></tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0">
        <%-- Press Room --%>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=pressroom&d2=index" class="homeTitleLink">Highlights</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>

                AOL and TopCoder Announce Web AIM Mashup Competition
                <A href="/tc?module=Static&d1=pressroom&d2=pr_113006">...more</A><br>[November 30]<br><br>

                TopCoder to Present Keynote Address: Future of Virtual Communities as Business; at Gartner CIO Summit 2006
                <A href="/tc?module=Static&d1=pressroom&d2=pr_112906">...more</A><br>[November 29]<br><br>

                <div style="float: right; padding-left: 5px;">
                <img src="/i/pressroom/internetnews_logo.gif" width="81" height="11" alt="internetnews.com logo" border="0" /></div>
                Who is the Top Coder?
                <A href="http://www.internetnews.com/dev-news/article.php/3644456">...more</A><br>[November 17]<br><br>

                <div style="float: right; padding-left: 5px;">
                <img src="/i/pressroom/businessweek_logo.gif" width="80" height="18" alt="BusinessWeek" border="0" /></div>
                TopCoder members WishingBone and assistant in BusinessWeek
                <A href="/tc?module=Static&d1=pressroom&d2=art_110206">...more</A><br>[November 2]<br><br>
            
                <div style="float: right; padding-left: 5px;">
                <img src="/i/pressroom/csmonitor_logo.jpg" width="80" height="32" alt="Christian Science Monitor" border="0" /></div>
                How to build software? Henry Ford, meet eBay.
                <A href="http://www.csmonitor.com/2006/1101/p01s04-usec.htm" target="_blank">...more</A><br>[November 1]<br><br>

                <div style="float: right; padding-left: 5px;">
                <img src="/i/pressroom/gigaOm_logo.jpg" width="80" height="26" alt="gigaOm" border="0" /></div>
                The New American Idol&#8230; The Coder
                <A href="http://gigaom.com/2006/10/23/the-new-american-idol-the-coder/" target="_blank">...more</A><br>[October 24]<br><br>

            </td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">November
                Events:</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160; </td>
            <td class="homeText"><br>
                <b>11.01</b> - Marathon Match 7 - 12 NOON<br><br>
                <b>11.02</b> - CDDC Round 3 Projects Posted - 9 AM<br><br>
                <b>11.02</b> - SRM 325 - AOL - 9 PM<br><br>
                <b>11.06</b> - TCHS SRM 19 - 10 AM<br><br>
                <b>11.11</b> - SRM 326 - NSA - 12 NOON<br><br>
                <b>11.15</b> - Algo Room 1 - 9 AM PST<br><br>
                <b>11.15</b> - CDDC 1 - 1 PM PST<br><br>
                <b>11.15</b> - Algo Room 2 - 4 PM PST<br><br>
                <b>11.15</b> - <div style="float:left; padding-right:5px;"><A href="/longcontest/?module=ViewActiveContests&rt=15"><img src="/i/longcontest/spon_intel.gif" alt="Intel&#174;" border="0" /></A></div>Intel&#174; Multi-Threading Competition 11 - 12 NOON<br><br>
                <b>11.16</b> - Algo Room 3 - 9 AM PST<br><br>
                <b>11.16</b> - CDDC 2 - 1 PM PST<br><br>
                <b>11.16</b> - Algo Wildcard - 4 PM PST<br><br>
                <b>11.17</b> - CDDC Finals - 9 AM PST<br><br>
                <b>11.17</b> - Algo Finals - 1:30 PM PST<br><br>
                <b>11.20</b> - TCHS SRM 20 - 6 AM<br><br>
                <b>11.22</b> - SRM 327 - 7 AM<br><br>
                <b>11.27</b> - TCHS SRM 21 - 7 PM<br><br>
                <b>11.29</b> - SRM 328 - 11 AM<br><br>
<%-- DECEMBER EVENTS 
                <b>12.04</b> - TCHS SRM 22 - 2 PM<br><br>
                <b>12.06</b> - Marathon Match 8 - 12 NOON<br><br>
                <b>12.09</b> - SRM 329 - 12 Noon<br><br>
                <b>12.11</b> - TCHS SRM 23 - 10 AM<br><br>
                <b>12.13</b> - <div style="float:left; padding-right:5px;"><A href="/longcontest/?module=ViewActiveContests&rt=15"><img src="/i/longcontest/spon_intel.gif" alt="Intel&#174;" border="0" /></A></div>Intel&#174; Multi-Threading Competition 12 - 12 NOON<br><br>
                <b>12.13</b> - SRM 330 - 9 PM<br><br>
                <b>12.18</b> - TCHS SRM 24 - 6 AM<br><br>
                <b>12.21</b> - SRM 331 - 7 AM<br><br>
                <b>12.27</b> - TCHS SRM 25 - 7 PM<br><br>
                <b>12.28</b> - SRM 332 - 9 PM<br><br>
--%>
            </td>
        </tr>

    </table>
</td>
</tr>
</table>
<%-- Footer --%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr><td class="homeFooter" colspan="5">
        <A href="/" class="footerLinks">Home</A>&#160;&#160;|&#160;&#160;
        <A href="/tc?module=Static&d1=about&d2=index" class="footerLinks">About TopCoder</A>&#160;&#160;|&#160;&#160;
        <A href="/tc?module=Static&d1=pressroom&d2=index" class="footerLinks">Press Room</A>&#160;&#160;|&#160;&#160;
        <A href="/tc?module=Static&d1=about&d2=contactus">Contact Us</A>&#160;&#160;|&#160;&#160;
        <A href="/tc?module=Static&d1=about&d2=privacy" class="footerLinks">Privacy</A>&#160;&#160;|&#160;&#160;
        <A href="/tc?module=Static&d1=about&d2=terms" class="footerLinks">Terms</A>
        <br>
        <A href="/tc" class="footerLinks">Developer Center</A>&#160;&#160;|&#160;&#160;
        <A href="/corp/?module=Static&d1=corp&d2=index" class="footerLinks">Corporate Services</A></td>
        <tr><td class="copyright" colspan="5">Copyright &#169; 2001-2006, TopCoder, Inc. All rights reserved.</td></tr>
</table>
</body>
</html>
