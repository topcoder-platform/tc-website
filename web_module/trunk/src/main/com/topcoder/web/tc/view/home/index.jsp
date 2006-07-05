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
         <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_winner"><img src="/i/home/tccc06_logo_contest_winner.gif" border="0" alt="TopCoder Collegiate Challenge Logo Contest"/></A>
        </td>
        <td width="50%" class="homeLogo" align="right">&#160;</td>
    </tr>
</table>


<table border="0" cellpadding="0" cellspacing="0" class="centerer">
<%-- Banners --%>
<tr>
    <td class="homeLeftBan"><A href="/tc"><img src="/i/home/tab_developercenter.gif" alt="Developer Center" border="0"/></A>
    </td>
    <td class="homeGutter" rowspan=2>&#160;</td>
    <td class="homeCentBan">
        <A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/tab_corporateservices.gif" alt="Corporate Services" border="0"/></A>
    </td>
    <td class="homeGutter" rowspan=2>&#160;</td>
    <td class="homeRightBan">
        <A href="/tc?module=Static&d1=pressroom&d2=index"><img src="/i/home/tab_newsevents.gif" alt="News & Events" border="0"/></A>
    </td>
</tr>
<%-- Body --%>
<tr>
<%-- Left Column --%>
<td class="homeLeftCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr><td class="homeBigPromo">
            <A href="/longcontest/?module=Static&d1=intel_overview"><img src="/i/home/intel_multi_threading_sm.gif" alt="Intel Multi-Threading Competition Series" border="0"/></A>
        </td></tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc" class="homeTitleLink">Algorithm Competitions</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">How do you stand up among your peers? <A href="/tc">Compete</A> in our algorithm
                competitions.</td>
        </tr>

        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle">Software Competitions</td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Compete in Software <A href="/tc?module=ViewActiveContests&ph=112">Design</A>,
                <A href="/tc?module=ViewActiveContests&ph=113">Development</A> and
                <A href="/tc?module=Static&d1=dev&d2=assembly&d3=overview">Assembly</A> Competitions and get paid for
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
            <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>"><img src="/i/home/tcs.jpg" alt="TopCoder Software" border="0"/></A>
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
            <%-- CNN
                        <A href="/movies/press/cnn_072405.mp4"><img src="/i/home/mov_cnn_072405.jpg" alt="TopCoder Movies" border="0" /></A>
            --%>
            <%-- WSJ 
            <A href="/?t=sponsor&c=link&link=http://webreprints.djreprints.com/1466111183234.html" target="_blank"><img src="/i/home/wsj_051006_sm.gif" alt="The Wall Street Journal" border="0"/></A>
            --%>
            <%-- Intel MTCS
                        <A href="/longcontest/?module=ViewActiveContests&rt=15"><img src="/i/home/intel_multi_threading_sm.gif" alt="Intel Multi-Threading Competition Series" border="0" /></A>
            --%>
            <%-- employee referral --%>
            <A href="/tc?module=Static&d1=my_home&d2=empReferrals"><img src="/i/home/emp_ref_062806_sm.gif" alt="TopCoder Employee Referral Program" border="0"/></A>
            
        </td></tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">July
                Events:</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>
                <b>07/05</b> - TCHS SRM 5 - 7 PM<br><br>
                <b>07/06</b> - SRM 310 - 9 PM<br><br>
                <b>07/10</b> - TCHS SRM 6 - 2 PM<br><br>
                <b>07/12</b> - SRM 311 - 7 AM<br><br>
                <b>07/12</b> - Marathon Match 3 - 12 NOON<br><br>
                <b>07/17</b> - TCHS SRM 7 - 10 AM<br><br>
                <b>07/19</b> - Intel Multi-Threading Competition 7 - 12 NOON<br><br>
                <b>07/22</b> - SRM 312 - 12 NOON<br><br>
                <b>07/24</b> - TCHS SRM 8 - 6 AM<br><br>
                <b>07/26</b> - SRM 313 - 11 AM<br><br>
                <b>07/31</b> - TCHS SRM 9 - 7 PM<br><br>
            </td>
        </tr>

        <%-- Press Room --%>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=pressroom&d2=index" class="homeTitleLink">Press Room
                Highlights</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>
                <div style="float: right; padding-left: 5px;">
                    <img src="/i/pressroom/javaPosse_logo.gif" width="68" height="31" alt="Java Posse" border="0"/></div>
                Java Posse - Interviews from Topcoder and Java One
                <A href="http://media32b.libsyn.com/aHeceJl2a3eTdmd2bHOcq5qkZnaZ/podcasts/dickwall/JavaPosse065.mp3" target="_blank">...more</A><br>[July 5]<br><br>

                TopCoder Announces Bloomberg L.P. As Premier Sponsor of TCCC06
                <A href="/tc?module=Static&d1=pressroom&d2=pr_062606">...more</A><br>[June 26]<br><br>

                AOL Named Title Sponsor of 2006 TopCoder Collegiate Challenge
                <A href="/tc?module=Static&d1=pressroom&d2=pr_061906">...more</A><br>[June 19]<br><br>

                Science Museum of Minnesota Partners with TopCoder High School Competitions
                <A href="/tc?module=Static&d1=pressroom&d2=pr_060706">...more</A><br>[June 7]<br><br>

                AOL, Bloomberg, UBS and NSA Announced as Sponsors/Patrons of 2006 TopCoder Collegiate Challenge
                <A href="/tc?module=Static&d1=pressroom&d2=pr_060606">...more</A><br>[June 6]<br><br>

                <div style="float: right; padding-left: 5px;">
                    <img src="/i/pressroom/gartner_logo.gif" width="68" height="15" alt="Gartner" border="0"/></div>
                Gartner cites TopCoder as model for "Web 2.0" community
                <A href="http://biz.yahoo.com/bw/060516/20060516005941.html?.v=1" target="_blank">...more</A><br>[May 16]<br><br>

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
