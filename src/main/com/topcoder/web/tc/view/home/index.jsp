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
    <%--
        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
        <script type="text/javascript">
            <!--
            _uacct = "UA-321688-1"; urchinTracker();
            -->
        </script>
    --%>

</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="homeTopBar" align=left>
            <span class="time">Current Member Count</span>&#160;:&#160;
            <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/>
            -
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

            <%-- TCHS  --%>
            <map name="tchs07">
            <area shape="rect" alt="" coords="1,1,285,149" href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview" />
            <area shape="rect" alt="" coords="286,1,499,90" href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview" />
            <area shape="rect" alt="" coords="286,95,499,149" href="/tc?module=TCHS07ViewRegistration" />
            </map>
            <img src="/i/home/tchs07registration.png" alt="TCHS07" border="0" style="display:block;" usemap="#tchs07"/>

        </td>
        <td width="50%" align="right" valign="top" style="border-bottom: 1px solid #666666; padding:0px; margin:0px;">
            <%-- standard studio dogear 
            &nbsp;
            --%>
            <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>"><img src="/i/home/studioDogEarStandard.png" alt="TopCoder Studio" /></A>
        </td>
    </tr>
</table>


<table border="0" cellpadding="0" cellspacing="0" class="centerer">
<%-- Banners --%>
<tr>
    <td class="homeLeftBan">
        <A href="/tc"><img src="/i/home/tab_developercenter.gif" alt="Developer Center" border="0" style="display:block;"/></A>
    </td>
    <td class="homeGutter" rowspan=2>&#160;</td>
    <td class="homeCentBan">
        <A href="/corp/?module=Static&d1=corp&d2=index"><img src="/i/home/tab_corporateservices.gif" alt="Corporate Services" border="0" style="display:block;"/></A>
    </td>
    <td class="homeGutter" rowspan=2>&#160;</td>
    <td class="homeRightBan">
        <A href="/tc?module=Static&d1=pressroom&d2=index"><img src="/i/home/tab_newsevents.gif" alt="News & Events" border="0" style="display:block;"/></A>
    </td>
</tr>
<%-- Body --%>
<tr>
<%-- Left Column --%>
<td class="homeLeftCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeBigPromo">
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

            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc" class="homeTitleLink">Algorithm & High School Competitions</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">How do you stand up among your peers? <A href="/tc">Compete</A> in our algorithm
                competitions.
            </td>
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
                what you build!
            </td>
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
                round.
            </td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=contracting&d2=index" class="homeTitleLink">Employment
                Opportunities</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Just <A href="/tc?module=Static&d1=contracting&d2=index">register here</A> and TopCoder
                will contact you about temporary and permanent positions that fit your skills.
            </td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=about&d2=jobs" class="homeTitleLink">Work for
                TopCoder</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Take a look at the <A href="/tc?module=Static&d1=about&d2=jobs">job openings</A> at
                TopCoder and see if there's a position that is right for you.
            </td>
        </tr>
    </table>
</td>
<%-- Center Column --%>
<td class="homeCentCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeBigPromo">
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/customers/index.jsp"><img src="/i/home/tcs_client_caliper.png" alt="TopCoder & Caliper" border="0" style="display:block;"/></A>
            </td>
        </tr>
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
                competition.
            </td>
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
                that.
            </td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/corp/?module=Static&d1=corp&d2=tces_home" class="homeTitleLink">Employment
                Services</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText">Are you a company interested in <A href="/corp/?module=Static&d1=corp&d2=tces_home">hiring</A>
                talent? Let TopCoder bring you together with software engineers looking for jobs.
            </td>
        </tr>
    </table>
</td>
<%-- Right Column --%>
<td class="homeRightCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeBigPromo">
                <%-- AOL Mashups 
                <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2048"><img src="/i/home/aolmashups20070104_sm.jpg" alt="AOL Mashups" border="0" style="display:block;"/></A>
                --%>
                <%-- WSJ
                <A href="/?t=sponsor&c=link&link=http://webreprints.djreprints.com/1466111183234.html" target="_blank"><img src="/i/home/wsj_051006_sm.gif" alt="The Wall Street Journal" border="0" style="display:block;" /></A>
                --%>
                <%-- AOL webcast team --%>
                <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies"><img src="/i/home/tccc06webcast20060108.jpg" alt="TCCC Webcast" border="0" style="display:block;"/></A>
            </td>
        </tr>
    </table>
    <table border="0" cellpadding="0" cellspacing="0">
        <%-- Press Room --%>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=pressroom&d2=index" class="homeTitleLink">Highlights</A>
            </td>
        </tr>
        <tr>
            <td class="homeArrow">&#160;</td>
            <td class="homeText"><br>

                <div style="float: right; padding-left: 5px;">
                    <img src="/i/pressroom/csflogo.png" alt="Connected Services Sandbox Logo" width="67" height="45" border="0"/>
                </div>
                Connected Services Sandbox Launches
                <A href="/tc?module=Static&d1=pressroom&d2=pr_021207">...more</A><br>[February 12]<br><br>

                <div style="float: right; padding-left: 5px;">
                    <img src="/i/pressroom/chinadaily_logo.png" alt="China Daily logo" width="67" height="25" border="0"/>
                </div>
                Undergraduate VP of multinational company
                <A href="http://www.chinadaily.com.cn/china/2006-12/08/content_754200.htm">...more</A><br>[December
                8]<br><br>

                <div style="float: right; padding-left: 5px;">
                    <img src="/i/pressroom/ieeesoftware_logo.png" width="67" height="25" alt="IEEE Software" border="0"/>
                </div>
                Programming Contests Show Impressive Growth [PDF]
                <A href="/pdfs/press_room/ieeeSoftware_20061206.pdf">...more</A><br>[December 6]<br><br>

                <div style="float: right; padding-left: 5px;">
                    <img src="/i/pressroom/success_logo.png" width="67" height="21" alt="Success Magazine" border="0"/>
                </div>
                Maverick Rules for Success [PDF]
                <A href="/pdfs/press_room/success200612.pdf">...more</A><br>[November]<br><br>

                AOL and TopCoder Announce Web AIM Mashup Competition
                <A href="/tc?module=Static&d1=pressroom&d2=pr_113006">...more</A><br>[November 30]<br><br>

                TopCoder to Present Keynote Address: Future of Virtual Communities as Business; at Gartner CIO Summit
                2006
                <A href="/tc?module=Static&d1=pressroom&d2=pr_112906">...more</A><br>[November 29]<br><br>

            </td>
        </tr>
        <tr>
            <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
            <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">February
                Events:</A></td>
        </tr>
        <tr>
            <td class="homeArrow">&#160; </td>
            <td class="homeText"><br>
                <b>02.03</b> - SRM 337 - 12 NOON<br><br>
                <b>02.05</b> - TCHS SRM 31 - 10 AM<br><br>
                <b>02.07</b> - SRM 338 - 7 AM<br><br>
                <b>02.10</b> - SRM STRESS TEST - 12 Noon<br><br>
                <b>02.12</b> - TCHS SRM 32 - 6 AM<br><br>
                <b>02.13</b> - TCHS07 Registration Opens - 9 AM<br><br>
                <b>02.14</b> - Marathon Match 12 - 12 NOON<br><br>
                <b>02.14</b> - SRM 339 - 9 PM<br><br>
                <%--<b>01.13</b> - <div style="float:left; padding-right:5px;"><A href="/longcontest/?module=ViewActiveContests&rt=15"><img src="/i/longcontest/spon_intel.gif" alt="Intel&#174;" border="0" /></A></div>Intel&#174; Multi-Threading Competition 12 - 12 NOON<br><br>--%>
                <b>02.20</b> - SRM 340 - 11 AM<br><br>
                <b>02.25</b> - TCHS07 Registration Closes - 6 PM<br><br>
                <b>02.26</b> - TCHS07 Gamma Round 1 - 10 AM<br><br>
                <b>02.26</b> - TCHS07 Alpha Round 1 - 9 PM<br><br>
          </td>
        </tr>

    </table>
</td>
</tr>
</table>
<%-- Footer --%>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="homeFooter" colspan="5">
            <A href="/" class="footerLinks">Home</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=index" class="footerLinks">About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=pressroom&d2=index" class="footerLinks">Press Room</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=contactus">Contact Us</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=privacy" class="footerLinks">Privacy</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=terms" class="footerLinks">Terms</A>
            <br>
            <A href="/tc" class="footerLinks">Developer Center</A>&#160;&#160;|&#160;&#160;
            <A href="/corp/?module=Static&d1=corp&d2=index" class="footerLinks">Corporate Services</A></td>
        <tr>
            <td class="copyright" colspan="5">Copyright &#169; 2001-2007, TopCoder, Inc. All rights reserved.</td>
        </tr>
</table>
</body>
</html>
