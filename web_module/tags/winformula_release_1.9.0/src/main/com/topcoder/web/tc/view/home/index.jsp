<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/home20080421.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <style type="text/css">
        body {
            text-align: center;
        }

        .centerer {
            width: 600px;
            margin: 0px auto;
        }
    </style>
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
<a href="<tc-webtag:linkTracking link='http://www.theball.com' refer='homepage' />" target="_blank"><img src="/i/interface/tinyBrackets.png" alt="" /></a>
</div>
--%>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td class="homeTopBar" align="center" colspan="2"><br /><a href="/"><img src="/i/home/tcLogo352.png" alt="TopCoder, Inc." style="display: block;" /></a></td>
    </tr>
    <tr>
        <td class="homeTopBar" align="left">
            <span class="time">Current Member Count</span>&#160;:&#160;
            <tc-webtag:format object="${sessionInfo.memberCount}" format="#,##0"/>
            -
            <tc-webtag:format object="${sessionInfo.date}" format="MMMM d, yyyy"/>
        </td>
        <td class="homeTopBar" align="right">
            <a href="/reg/" class="loginLinks">Register Now</a>
            | <a href="/tc?module=Static&amp;d1=about&amp;d2=index" class="loginLinks">About TopCoder</a></td>
    </tr>
</table>

<div align="center">
<table cellpadding="0" cellspacing="0" width="100%">
<tr>
    <td align="left" valign="top" style="padding: 10px 0px 0px 10px;">
        <p style="height:30px; width:151px;">&nbsp;</p>
    </td>
    <td align="center" style="padding: 20px;">
        <%--
        <div align="center" style="margin-bottom: 5px;"><a href="/tc?module=Static&amp;d1=about&amp;d2=contactus"><img src="/i/home/contactus.png" alt="Contact us" /></a></div>
        --%>
        
        <%-- TCCC07 
        <map name="tccc07">
        <area shape="rect" alt="" coords="1,1,260,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=about" />
        <area shape="rect" alt="" coords="280,9,480,30" target="_blank" href="/pdfs/tournaments/TCCC07_Program_View.pdf" />
        <area shape="rect" alt="" coords="280,47,480,65" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=movies" />
        <area shape="rect" alt="" coords="280,85,480,100" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=photos" />
        <area shape="rect" alt="" coords="280,118,480,135" target="_blank" href="http://www.topcoder.com/wiki/pages/viewrecentblogposts.action?key=tccc07" />
        </map>
        <img src="/i/home/tccc07PDFphotosBlogs.png" alt="TCCC07" usemap="#tccc07" style="display: block;" />
        --%>
        
        <%-- TCCC07 Prestigious Professor Program 
        <map name="tccc07">
        <area shape="rect" alt="" coords="10,26,253,118" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=about" />
        <area shape="rect" alt="" coords="277,11,480,133" href="/tc?module=ViewSurvey&amp;sid=19559" />
        </map>
        <img src="/i/home/tccc07_ppa.png" alt="TCCC07 Prestigious Professor Program" usemap="#tccc07" style="display: block;" />
        --%>
        
        <%-- TCHS08 
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=onlineSchedule' refer='homepage' />"><img src="/i/home/tchs08onlineRd1.png" alt="2008 TopCoder High School" /></a>
        --%>
        
        <%-- TCHS08 And Architecture Competition 
        <map name="tchs08">
        <area shape="rect" alt="" coords="10,10,270,135" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=overview" />
        <area shape="rect" alt="" coords="290,12,455,135" href="/tc?module=Static&amp;d1=architecture&amp;d2=beta" />
        </map>
        <img src="/i/home/tchs08ANDarchComp.png" alt="TCHS08" usemap="#tchs08" style="display: block;" />
        --%>
        
        <%-- TCO08 
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about' refer='homepage' />"><img src="/i/home/tco08compRegBanner.png" alt="2008 TopCoder Open" /></a>
        --%>
        
        <%-- TCO08 champs 
        <map id="tco08" name="tco08">
        <area shape="rect" alt="" coords="12,6,198,114" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about" />
        <area shape="rect" alt="" coords="216,6,466,114" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog" />
        <area shape="rect" alt="" coords="0,136,85,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoFinals" />
        <area shape="rect" alt="" coords="103,136,164,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=desSummary" />
        <area shape="rect" alt="" coords="181,136,295,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=devSummary" />
        <area shape="rect" alt="" coords="310,136,397,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=summary" />
        <area shape="rect" alt="" coords="413,136,474,150" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=summary" />
        </map>
        <img src="/i/home/tco08champs.png" alt="TCO08" usemap="#tco08" style="display: block;" />
        --%>

        <%-- Architecture 
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=architecture&amp;d2=beta' refer='homepage' />"><img src="/i/home/architectureBeta.jpg" alt="Architecture Competition" /></a>
        --%>
        
        <%-- UML Tool 
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=dev&amp;d2=umltool&amp;d3=description' refer='homepage' />"><img src="/i/home/umltoolRelease.jpg" alt="UML Tool Release" /></a>
        --%>

        <%-- OpenAIM 
        <a href="<tc-webtag:linkTracking link='/openaim/' refer='homepage' />"><img src="/i/home/openaim.png" alt="Open AIM Developer Challenge Powered by TopCoder" /></a>
        --%>

        <%-- Truveo 
        <a href="<tc-webtag:linkTracking link='/truveo/' refer='homepage' />"><img src="/i/home/truveo_vote.png" alt="Truveo Developer Challenge Powered by TopCoder" /></a>
        --%>
        
        <%-- ESPN Winning Formula Challange --%>
        <a href="<tc-webtag:linkTracking link='http://winningformula.espn.com/' refer='homepage' />"><img src="/i/home/winformula_week2_540x120.jpg" alt="ESPN Winning Formula Challange Powered by TopCoder" /></a>
        
    </td>
    <td align="right" valign="top">
<%-- STUDIO DOGEAR --%>
        <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/"><img src="/i/home/studioDogEarStandard.png" style="display: block;" alt="TopCoder Studio" /></a>

<%-- TCO DOGEAR 
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=about"><img src="/i/home/dogTCO07.png" style="display: block;" alt="TCO07 Sponsored by AOL" /></a>
--%>
    </td>
</tr>
</table>
</div>

<%-- Plug Into TopCoder V1
<div align="center" style="margin-bottom: 20px;">
    <a style="display: block; width: 900px; height: 150px;" href="<tc-webtag:linkTracking link='http://software.topcoder.com/tcs?module=Static&amp;d1=tour&amp;d2=page1' refer='plugInto01' />"><img src="/i/home/plugInto01.jpg" alt="Plug into TopCoder" style="display: block;" /></a>
</div>
--%>
<%-- Plug Into TopCoder V2 --%>
<div align="center" style="margin-bottom: 20px;">
    <a style="display: block; width: 900px; height: 150px;" href="<tc-webtag:linkTracking link='http://software.topcoder.com/tcs?module=Static&d1=tour&d2=page1' refer='plugInto02' />"><img src="/i/home/plugInto02.png" alt="Plug into TopCoder" style="display: block;" /></a>
</div>

<table border="0" cellpadding="0" cellspacing="0" class="centerer">
<%-- Banners --%>
<tr>
    <td>
        <a href="/tc" class="homeLeftBan"><span>Compete</span></a>
    </td>
    <td class="homeGutter" rowspan="5">&#160;</td>
    <td>
        <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/" class="homeCentBan"><span>Software</span></a>
    </td>
    <td class="homeGutter" rowspan="5">&#160;</td>
    <td>
        <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" class="homeRightBan"><span>News &amp; Events</span></a>
    </td>
</tr>
<tr>
    <td colspan="5">&nbsp;</td>
</tr>
<%-- Header Links Must Match Active Promo Links Below!! --%>
<tr>
    <td align="center">
        <a href="/dr" class="tabHeader"><span>The Digital Run</span></a>
    </td>
    <td align="center">
        <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/" class="tabHeader"><span>Software</span></a>
    </td>
    <td align="center">
        <a target="_blank" href="<tc-webtag:linkTracking link='http://www.topcoder.com/tc?module=Static&d1=pressroom&d2=pr_082108' refer='homepage_promo_inc500' />" class="tabHeader"><span>News &amp; Events</span></a>
    </td>
</tr>

<%-- Body --%>
<tr>
<%-- Left Column --%>
<td class="homeLeftCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeBigPromo">
                <%-- DIGITAL RUN --%>
                <a href="/dr"><img src="/i/home/dr2008v2.png" alt="The Digital Run" border="0" style="display:block;"/></a>
                
                
                <%-- DIGITAL RUN ASSEMBLY CUP 
                <a href="/dr"><img src="/i/home/digitalrunAsmblyCup.png" alt="The Digital Run Assembly Cup" border="0" style="display:block;"/></a>
                --%>
                
                <%-- DIGITAL RUN DESIGN CUP 
                <a href="/dr"><img src="/i/home/digitalrunDesCup.png" alt="The Digital Run Design Cup" border="0" style="display:block;"/></a>
                --%>
                
                <%-- DIGITAL RUN DEVELOPMENT CUP 
                <a href="/dr"><img src="/i/home/digitalrunDevCup.png" alt="The Digital Run Development Cup" border="0" style="display:block;"/></a>
                --%>
                
                <%-- DIGITAL RUN TOTAL PRIZES 
                <a href="/dr"><img src="/i/home/digitalrunTotalPrizes.png" alt="The Digital Run Total Prizes" border="0" style="display:block;"/></a>
                --%>

                <%-- Marathon Match Sponsor 
                <map id="mm" name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&amp;rd=13499" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&amp;d1=sponsors&amp;d2=predictiveOverview" />
                </map>
                <img src="/i/home/predictive1_tc2.png" alt="Predictive Marathon Competition 1" border="0" style="display:block;" usemap="#mm"/>
                --%>

                <%-- SRM SPONSOR 
                <map id="srm" name="srm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&amp;rd=13503" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=bt" />
                </map>
                <img src="/i/home/srm412_bt.png" alt="SRM 412 brought to you by BT" border="0" style="display:block;" usemap="#srm"/>
                --%>
                
                <%-- UML Tool 
                <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=dev&amp;d2=umltool&amp;d3=description' refer='homepage_promo' />"><img src="/i/home/umltool_component.png" alt="UML Tool Release" /></a>
                --%>
               
                <%-- TCO08 
                <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=betfair' refer='homepage_promo' />"><img src="/i/home/tco08betfairPromo.png" alt="Betfair sponsor of TCO08" /></a>
                --%>
                
                <%-- AMD Multicore Threadfest 
                <a href="<tc-webtag:linkTracking link='/threadfest' refer='homepage_promo' />"><img src="/i/home/amdMCT_promo.png" alt="AMD Multicore Threadfest" /></a>
                --%>
            </td>
        </tr>
    </table>
</td>
<%-- Center Column --%>
<td class="homeCentCol">
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="homeBigPromo">
                <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>"><img src="/i/home/tcs.jpg" alt="Software" border="0" style="display:block;"/></a>
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
                <a href="/?t=sponsor&amp;c=link&amp;link=http://webreprints.djreprints.com/1466111183234.html" target="_blank"><img src="/i/home/wsj_051006_sm.gif" alt="The Wall Street Journal" border="0" style="display:block;" /></a>
                --%>
    
                <%-- AOL webcast team
                <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc06&amp;d3=movies"><img src="/i/home/tccc06webcast20060108.jpg" alt="TCCC Webcast" border="0" style="display:block;"/></a>
                --%>
    
                <%-- Marathon Match Sponsor 
                <map name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=nsa" />
                </map>
                <img src="/i/home/tco07Rd1-B_nsa.png" alt="TCO07 Round 1-B brought to you by NSA" border="0" style="display:block;" usemap="#mm"/>
                --%>
    
                <%-- SRM SPONSOR 
                <map name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&amp;rd=10783" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tccc07&amp;d3=sponsorpatrons&amp;d4=db" />
                </map>
                <img src="/i/home/srm367_db.png" alt="SRM 367 brought to you by Deutsche Bank" border="0" style="display:block;" usemap="#mm"/>
                --%>
                    
                <%-- 2 Registration Prototype contests open @ Studio 
                <a href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests" target="_blank"><img src="/i/home/regproto_studiopromo.png" alt="2 Registration Prototype contests open @ Studio" border="0" style="display:block;" /></a>
                --%>
                
                <%-- UML Tool 
                <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=dev&amp;d2=umltool&amp;d3=description' refer='homepage_promo' />"><img src="/i/home/umltool_component.png" alt="UML Tool Release" /></a>
                --%>
                   
                <%-- TOPCODER EMPLOYEE REFERRAL PROGRAM 
                <a href="/tc?module=Static&amp;d1=my_home&amp;d2=empReferrals"><img src="/i/home/empRefSm_20070517.png" alt="TopCoder Employee Referral Program" border="0" style="display:block;"/></a>
                 --%>
                 
                <%-- TC CHANNEL 
                <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=media&amp;d2=tcchannel&amp;clip=ep03_sm' refer='homepage' />"><img src="/i/home/tcchannel_promo_ep3.png" alt="TC Channel: Episode 3" /></a>
                --%>
                
                <%-- TopCoder on 2007 Inc. 500 
                <a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=pressroom&amp;d2=pr_082707' refer='homepage_promo' />"><img src="/i/home/tc_inc500_promo.png" alt="TopCoder on 2007 Inc. 500" /></a>
                --%>
                
                <%-- CFO: Gaming the System
                <a target="_blank" href="<tc-webtag:linkTracking link='/i/pressroom/pdfs/cfo_20080103_v2.pdf' refer='homepage_promo' />"><img src="/i/home/cfoGamingTheSystem_promo.png" alt="CFO Magazine: Gaming the System" /></a>
                 --%>
                
                <%-- Inc. 500 x 2 --%>
                <a target="_blank" href="<tc-webtag:linkTracking link='http://www.topcoder.com/tc?module=Static&d1=pressroom&d2=pr_082108' refer='homepage_promo_inc500' />"><img src="/i/home/2x_500.png" alt="Inc. 500 x 2" /></a>
                
            </td>
        </tr>
    </table>
</td>
</tr>
</table>
<%-- TopCoder is Hiring! --%>
<br />
<div align="center" style="margin-bottom: 20px;">
    <a style="display: block; width: 894px; height: 82px;" href="<tc-webtag:linkTracking link='/tc?module=Static&d1=about&d2=jobs' refer='homepage' />"><img src="/i/home/banner_hiring.jpg" alt="TopCoder is Hiring!" style="display: block;" /></a>
</div>


<%-- Footer --%>
<div style="margin-top: 80px;">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="homeFooter" colspan="5">
            <a href="/" class="footerLinks">Home</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=index" class="footerLinks">About TopCoder</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=pressroom&amp;d2=index" class="footerLinks">Press Room</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=contactus">Contact Us</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=jobs">Careers</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=privacy" class="footerLinks">Privacy</a>&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=about&amp;d2=terms" class="footerLinks">Terms</a>
            <br />
            <a href="/tc" class="footerLinks">Competitions</a>&#160;&#160;|&#160;&#160;
            <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/" class="footerLinks">Software</a>
        </td>
    </tr>
    <tr>
        <td class="copyright" colspan="5">Copyright &#169; 2001-2008, TopCoder, Inc. All rights reserved.</td>
    </tr>
</table>
</div>

<%-- Google Analytics --%>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-3257193-1");
_udn="topcoder.com";
pageTracker._initData();
pageTracker._trackPageview();
</script>

</body>
</html>
