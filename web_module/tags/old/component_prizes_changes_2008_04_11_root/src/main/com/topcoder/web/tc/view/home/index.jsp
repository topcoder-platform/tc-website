<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Programming Contests, Software Development, and Employment Services at TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/home20080409.css"/>
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
    <td align="center" style="padding: 20px;">
        <%--
        <div align="center" style="margin-bottom: 5px;"><a href="/tc?module=Static&d1=about&d2=contactus"><img src="/i/home/contactus.png" alt="Contact us" /></a></div>
        --%>
        
        <%-- TCCC07 
        <map name="tccc07">
        <area shape="rect" alt="" coords="1,1,260,150" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about" />
        <area shape="rect" alt="" coords="280,9,480,30" target="_blank" href="/pdfs/tournaments/TCCC07_Program_View.pdf" />
        <area shape="rect" alt="" coords="280,47,480,65" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=movies" />
        <area shape="rect" alt="" coords="280,85,480,100" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=photos" />
        <area shape="rect" alt="" coords="280,118,480,135" target="_blank" href="http://www.topcoder.com/wiki/pages/viewrecentblogposts.action?key=tccc07" />
        </map>
        <img src="/i/home/tccc07PDFphotosBlogs.png" alt="TCCC07" usemap="#tccc07" style="display: block;" />
        --%>
        
        <%-- TCCC07 Prestigious Professor Program 
        <map name="tccc07">
        <area shape="rect" alt="" coords="10,26,253,118" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about" />
        <area shape="rect" alt="" coords="277,11,480,133" href="/tc?module=ViewSurvey&sid=19559" />
        </map>
        <img src="/i/home/tccc07_ppa.png" alt="TCCC07 Prestigious Professor Program" usemap="#tccc07" style="display: block;" />
        --%>
        
        <%-- TCHS08 
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tchs08&d3=onlineSchedule' refer='homepage' />"><img src="/i/home/tchs08onlineRd1.png" alt="2008 TopCoder High School" /></a>
        --%>
        
        <%-- TCHS08 And Architecture Competition 
        <map name="tchs08">
        <area shape="rect" alt="" coords="10,10,270,135" href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=overview" />
        <area shape="rect" alt="" coords="290,12,455,135" href="/tc?module=Static&d1=architecture&d2=beta" />
        </map>
        <img src="/i/home/tchs08ANDarchComp.png" alt="TCHS08" usemap="#tchs08" style="display: block;" />
        --%>
        
        <%-- TCO08 
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=about' refer='homepage' />"><img src="/i/home/tco08compRegBanner.png" alt="2008 TopCoder Open" /></a>
        --%>

        <%-- Architecture 
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=architecture&d2=beta' refer='homepage' />"><img src="/i/home/architectureBeta.jpg" alt="Architecture Competition" /></a>
        --%>
        
        <%-- UML Tool 
        <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=dev&d2=umltool&d3=description' refer='homepage' />"><img src="/i/home/umltoolRelease.jpg" alt="UML Tool Release" /></A>
        --%>

        <%-- OpenAIM --%>
        <a href="<tc-webtag:linkTracking link='/openaim/' refer='homepage' />"><img src="/i/home/openaim.png" alt="Open AIM Developer Challenge Powered by TopCoder" /></a>

    </td>
    <td align="right" valign="top">
<%-- STUDIO DOGEAR --%>
        <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/"><img src="/i/home/studioDogEarStandard.png" style="display: block;" alt="TopCoder Studio" /></A>

<%-- TCO DOGEAR 
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/home/dogTCO07.png" style="display: block;" alt="TCO07 Sponsored by AOL" /></A>
--%>
    </td>
</tr>
</table>
</div>

<div align="center" style="margin-bottom: 20px;">
    <a style="display: block; width: 900px; height: 150px;" href="<tc-webtag:linkTracking link='http://software.topcoder.com/tcs?module=Static&d1=tour&d2=page1' refer='plugInto01' />"><img src="/i/home/plugInto01.jpg" alt="Plug into TopCoder" style="display: block;" /></a>
</div>

<table border="0" cellpadding="0" cellspacing="0" class="centerer">
<%-- Banners --%>
<tr>
    <td class="homeLeftBan">
        <A href="/tc"><img src="/i/home/tab_compete.png" alt="Compete" border="0" style="display:block;"/></A>
    </td>
    <td class="homeGutter" rowspan="2">&#160;</td>
    <td class="homeCentBan">
        <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/"><img src="/i/home/tab_software.png" alt="Software" border="0" style="display:block;"/></A>
    </td>
    <td class="homeGutter" rowspan="2">&#160;</td>
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
                <%-- DIGITAL RUN --%>
                <A href="/tc?module=Static&d1=digital_run&d2=description"><img src="/i/home/digital_run_20080128.png" alt="The Digital Run" border="0" style="display:block;"/></A>
                
                
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

                <%-- Marathon Match Sponsor 
                <map name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=schedule" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign" />
                </map>
                <img src="/i/home/mmtco4_verisign.png" alt="TCO07 Marathon Match 4 brought to you by VeriSign" border="0" style="display:block;" usemap="#mm"/>
                --%>

                <%-- SRM SPONSOR 
                <map name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&rd=12168" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lilly" />
                </map>
                <img src="/i/home/srm396_lilly.png" alt="SRM 396 brought to you by Eli Lilly" border="0" style="display:block;" usemap="#mm"/>
                --%>
                
                <%-- UML Tool 
                <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=dev&d2=umltool&d3=description' refer='homepage_promo' />"><img src="/i/home/umltool_component.png" alt="UML Tool Release" /></A>
                --%>
                
                <%-- TCHS08 
                <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tchs08&d3=bracketInd' refer='homepage_promo' />"><img src="/i/home/tchs08Champion_promo.png" alt="TCHS08" /></A>
                --%>
                
                <%-- TCO08 
                <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=verisign' refer='homepage_promo' />"><img src="/i/home/tco08verisignPromo.png" alt="VeriSign sponsor of TCO08" /></A>
                --%>
                
                <%-- AMD Multicore Threadfest 
                <A href="<tc-webtag:linkTracking link='/threadfest' refer='homepage_promo' />"><img src="/i/home/amdMCT_promo.png" alt="AMD Multicore Threadfest" /></A>
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
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>"><img src="/i/home/tcs.jpg" alt="Software" border="0" style="display:block;"/></A>
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
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&rd=10783" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db" />
                </map>
                <img src="/i/home/srm367_db.png" alt="SRM 367 brought to you by Deutsche Bank" border="0" style="display:block;" usemap="#mm"/>
                --%>
                    
                <%-- 2 Registration Prototype contests open @ Studio 
                <A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests" target="_blank"><img src="/i/home/regproto_studiopromo.png" alt="2 Registration Prototype contests open @ Studio" border="0" style="display:block;" /></A>
                --%>
                
                <%-- UML Tool 
                <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=dev&d2=umltool&d3=description' refer='homepage_promo' />"><img src="/i/home/umltool_component.png" alt="UML Tool Release" /></A>
                --%>
                   
                <%-- TOPCODER EMPLOYEE REFERRAL PROGRAM 
                <A href="/tc?module=Static&d1=my_home&d2=empReferrals"><img src="/i/home/empRefSm_20070517.png" alt="TopCoder Employee Referral Program" border="0" style="display:block;"/></A>
                 --%>
                 
                <%-- TC CHANNEL 
                <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=media&d2=tcchannel&clip=ep03_sm' refer='homepage' />"><img src="/i/home/tcchannel_promo_ep3.png" alt="TC Channel: Episode 3" /></A>
                --%>
                
                <%-- TopCoder on 2007 Inc. 500 
                <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=pressroom&d2=pr_082707' refer='homepage_promo' />"><img src="/i/home/tc_inc500_promo.png" alt="TopCoder on 2007 Inc. 500" /></A>
                --%>
                
                <%-- CFO: Gaming the System --%>
                <A target="_blank" href="<tc-webtag:linkTracking link='/i/pressroom/pdfs/cfo_20080103_v2.pdf' refer='homepage_promo' />"><img src="/i/home/cfoGamingTheSystem_promo.png" alt="CFO Magazine: Gaming the System" /></A>
                
            </td>
        </tr>
    </table>
</td>
</tr>
</table>

<%-- Footer --%>
<div style="margin-top: 80px;">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="homeFooter" colspan="5">
            <A href="/" class="footerLinks">Home</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=index" class="footerLinks">About TopCoder</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=pressroom&d2=index" class="footerLinks">Press Room</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=contactus">Contact Us</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=jobs">Careers</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=privacy" class="footerLinks">Privacy</A>&#160;&#160;|&#160;&#160;
            <A href="/tc?module=Static&d1=about&d2=terms" class="footerLinks">Terms</A>
            <br />
            <A href="/tc" class="footerLinks">Competitions</A>&#160;&#160;|&#160;&#160;
            <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/" class="footerLinks">Software</A></td>
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
