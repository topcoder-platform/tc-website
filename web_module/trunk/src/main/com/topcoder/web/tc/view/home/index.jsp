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
    <script language="JavaScript" type="text/javascript"><!--
    function openWin(url, name) {
        win = window.open(url, name, "menubar=no,status=no,scrollbars=yes,resizable=no,toolbar=no,width=650,height=650");
        win.location.href = url;
        win.focus();
    }
    window.name="main"; // required for whatistopcoder popup targeting
    //-->
    </script>
</head>

<body>
<%--
<div style="position:absolute; left:120px; top:120px;">
<A href="<tc-webtag:linkTracking link='http://www.theball.com' refer='homepage' />" target="_blank"><img src="/i/interface/tinyBrackets.png" alt="" /></A>
</div>
--%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="homeTopBar" align="left">
            <span class="time">Current Member Count</span>&#160;:&#160;
            <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/>
            -
            <tc-webtag:format object="${sessionInfo.date}" format="MMMM d, yyyy"/>
        </td>
        <td class="homeTopBar" align="right">
            <A href="/reg/" class="loginLinks">Register Now</A>
            | <A href="/tc?module=Static&d1=about&d2=index" class="loginLinks">About TopCoder</A></td>
    </tr>
</table>

<div align="center">
<table cellpadding="0" cellspacing="0" width="100%">
<tbody>
<tr>
    <td align="left" valign="top" style="padding: 10px 0px 0px 10px">
        <A href="/"><img src="/i/home/topcoder.png" alt="TopCoder" style="display: block;" /></A>
    </td>
    <td align="center" style="padding: 10px 10px 10px 10px">
        <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=media&d2=tcchannel&clip=ep1' refer='homepage' />"><img src="/i/home/tcchannelEp1.jpg" alt="TC Channel: Episode 1" /></A>
    </td>
    <td align="right" valign="top">
<%-- STUDIO DOGEAR 
        <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/"><img src="/i/home/studioDogEarStandard.png" style="display: block;" alt="TopCoder Studio" /></A>
--%>
<%-- TCO DOGEAR --%>
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/home/dogTCO07.png" style="display: block;" alt="TCO07 Sponsored by AOL" /></A>
    </td>
</tr>
<tr>
    <td align="center" colspan="3">
        <A href="<tc-webtag:linkTracking link='/whatistopcoder' refer='homepage' />"><img src="/i/home/webuildsoftwareV2.png" alt="" style="display: block;" /></A>
    </td>
</tr>
</tbody>
</table>
</div>

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
                <%-- DIGITAL RUN 
                <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/home/digitalrun20061104.png" alt="The Digital Run" border="0" style="display:block;"/></A>
                --%>
                
                <%-- DIGITAL RUN ASSEMBLY CUP 
                <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/home/digitalrunAsmblyCup.png" alt="The Digital Run Assembly Cup" border="0" style="display:block;"/></A>
                --%>
                
                <%-- DIGITAL RUN DESIGN CUP
                <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/home/digitalrunDesCup.png" alt="The Digital Run Design Cup" border="0" style="display:block;"/></A>
                --%>
                
                <%-- DIGITAL RUN DEVELOPMENT CUP
                <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/home/digitalrunDevCup.png" alt="The Digital Run Development Cup" border="0" style="display:block;"/></A>
                --%>
                
                <%-- DIGITAL RUN TOTAL PRIZES
                <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/home/digitalrunTotalPrizes.png" alt="The Digital Run Total Prizes" border="0" style="display:block;"/></A>
                --%>

                <%-- TCO07
               <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/home/tco07sm.png" alt="TCO07" border="0" style="display:block;"/></A>
               --%>

                <%-- Marathon Match Sponsor 
                <map name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=schedule" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign" />
                </map>
                <img src="/i/home/mmtco4_verisign.png" alt="TCO07 Marathon Match 4 brought to you by VeriSign" border="0" style="display:block;" usemap="#mm"/>
                --%>

                <%-- SRM SPONSOR --%>
                <map name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&rd=10674" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw" />
                </map>
                <img src="/i/home/srm350_drw.png" alt="SRM 350 brought to you by DRW" border="0" style="display:block;" usemap="#mm"/>
                 

                <%-- LICENSE ID 
                <A href="<tc-webtag:linkTracking link='http://studio.topcoder.com/?module=ViewContestDetails&ct=2093' refer='homepage' />"><img src="/i/home/licenseIDProject.jpg" alt="License ID Project" border="0" style="display:block;"/></A>
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
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/customers/index.jsp"><img src="/i/home/tcs_client_ims.png" alt="TopCoder & IMS Health" border="0" style="display:block;"/></A>
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
            <%-- WSJ
            <A href="/?t=sponsor&c=link&link=http://webreprints.djreprints.com/1466111183234.html" target="_blank"><img src="/i/home/wsj_051006_sm.gif" alt="The Wall Street Journal" border="0" style="display:block;" /></A>
            --%>

            <%-- AOL webcast team
            <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=movies"><img src="/i/home/tccc06webcast20060108.jpg" alt="TCCC Webcast" border="0" style="display:block;"/></A>
            --%>

            <%-- Marathon Match Sponsor 
            <map name="mm">
            <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule" />
            <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa" />
            </map>
            <img src="/i/home/tco07Rd1-B_nsa.png" alt="TCO07 Round 1-B brought to you by NSA" border="0" style="display:block;" usemap="#mm"/>
            --%>

            <%-- SRM SPONSOR 
                <map name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&rd=10673" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=ubs" />
                </map>
                <img src="/i/home/srm349_ubs.png" alt="SRM 349 brought to you by UBS" border="0" style="display:block;" usemap="#mm"/>
                --%>
                
            <%-- 2 Registration Prototype contests open @ Studio 
            <A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests" target="_blank"><img src="/i/home/regproto_studiopromo.png" alt="2 Registration Prototype contests open @ Studio" border="0" style="display:block;" /></A>
            --%>
            
            <%-- TCO07 
               <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/home/tco07sm.png" alt="TCO07" border="0" style="display:block;"/></A>
             --%>
             
            <%-- TCHS07 
               <A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onsiteSchedule"><img src="/i/home/tchs07_promo_051007.png" alt="TCHS07" border="0" style="display:block;"/></A>
            --%>
               
            <%-- CSF 
            <A href="<tc-webtag:linkTracking link="http://csf.topcoder.com/?module=ViewContestDetails&ct=1005" refer="tc_Index"/>"><img src="/i/home/csfBt.jpg" alt="Microsoft CSF Powered by TopCoder" style="display:block;" /></A>
            --%>
            
            <%-- LICENSE ID 
            <A href="<tc-webtag:linkTracking link='http://studio.topcoder.com/?module=ViewContestDetails&ct=2093' refer='homepage' />"><img src="/i/home/licenseIDProject.jpg" alt="License ID Project" border="0" style="display:block;"/></A>
            --%>
            
            <%-- TOPCODER EMPLOYEE REFERRAL PROGRAM --%>
            <A href="/tc?module=Static&d1=my_home&d2=empReferrals"><img src="/i/home/empRefSm_20070517.png" alt="TopCoder Employee Referral Program" border="0" style="display:block;"/></A>
             
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

            <%-- POST WEDNESDAY ???
            Yodlee to Sponsor TopCoder Single Round Match Series
            <A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_052207">...more</A><br>[May 23]<br><br>
            --%>

            Belarus All College Programming Event
            <A target="_blank" href="/tc?module=Static&d1=features&d2=050807">...more</A><br>[May 8]<br><br>

            TopCoder Appoints Russ Malz Vice President of Sales
            <A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_040907">...more</A><br>[April 9]<br><br>

            <div style="float: right; padding-left: 5px;">
                <img src="/i/pressroom/china_20061027.gif" alt="TopCoder & China" width="67" height="25" border="0"/>
            </div>
            TopCoder Appoints Jiazhi Wu VP of Technology for China
            <A target="_blank" href="/tc?module=Static&d1=pressroom&d2=pr_040307">...more</A><br>[April 3]<br><br>
            
            <div style="float: right; padding-left: 5px;">
                <img src="/i/pressroom/usatoday_logo.gif" alt="USA Today Logo" width="67" height="25" border="0"/>
            </div>
            Why Google put a research lab in Poland
            <A target="_blank" href="http://www.usatoday.com/tech/techinvestor/industry/2007-03-13-google-poland_N.htm">...more</A><br>[March 13]<br><br>

            <div style="float: right; padding-left: 5px;">
                <img src="/i/pressroom/tco07_logo.png" alt="TCO07" width="88" height="41" border="0"/>
            </div>
            UBS, DRW, and NSA Join TCO 07
            <A href="/tc?module=Static&d1=pressroom&d2=pr_030507">...more</A><br>[March 5]<br><br>

        </td>
    </tr>
    <tr>
        <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
        <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">May Events:</A></td>
    </tr>
    <tr>
        <td class="homeArrow">&#160; </td>
        <td class="homeText"><br>
            <b>05.01</b> - SRM 347 - 7 AM<br><br>
            <b>05.09</b> - SRM 348 - NSA - 9 PM<br><br>
            <b>05.10</b> - CDDC Round 1 Projects Posted - 9 AM<br><br>
            <b>05.15</b> - SRM 349 - UBS - 11 AM<br><br>
            <b>05.16</b> - Marathon Match 17 - 12 NOON<br><br>
            <b>05.19</b> - TCHS07 Semifinal Round - 10 AM<br><br>
            <b>05.19</b> - TCHS07 Championship Round - 2:30 PM<br><br>
            <b>05.23</b> - SRM 350 - DRW - 9 PM<br><br>
            <b>05.24</b> - CDDC Round 2 Projects Posted - 9 AM<br><br>
            <b>05.29</b> - SRM 351 - 7 AM<br><br>
            <%--<b>01.13</b> - <div style="float:left; padding-right:5px;"><A href="/longcontest/?module=ViewActiveContests&rt=15"><img src="/i/longcontest/spon_intel.gif" alt="Intel&#174;" border="0" /></A></div>Intel&#174; Multi-Threading Competition 12 - 12 NOON<br><br>--%>
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
