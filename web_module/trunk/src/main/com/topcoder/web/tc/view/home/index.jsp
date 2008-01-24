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
        <%--
        <div align="center" style="margin-bottom: 5px;"><a href="/tc?module=Static&d1=about&d2=contactus"><img src="/i/home/contactus.png" alt="Contact us" /></a></div>
        --%>
        <%-- TCO07  fri 
        <map name="tco07">
        <area shape="rect" alt="" coords="313,36,343,96" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=algoFinals" />
        <area shape="rect" alt="" coords="346,36,376,96" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=desSummary" />
        <area shape="rect" alt="" coords="379,36,409,96" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=devSummary" />
        <area shape="rect" alt="" coords="412,36,442,96" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=summary" />
        <area shape="rect" alt="" coords="445,36,475,96" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=studio&d4=summary" />

        <area shape="rect" alt="" coords="1,5,287,146" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about" />
        <area shape="rect" alt="" coords="300,109,361,130" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movies" />
        <area shape="rect" alt="" coords="375,109,430,130" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=photos" />
        <area shape="rect" alt="" coords="442,109,489,130" href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=overview" />
        </map>
        <img src="/i/home/tco07champions.png" alt="2007 TopCoder Open" usemap="#tco07" style="display: block;" />
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
        
        <%-- TCO08 --%>
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tco08&d3=about' refer='homepage' />"><img src="/i/home/tco08registerBanner.png" alt="2008 TopCoder Open" /></a>
        


        <%-- Architecture 
        <a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=architecture&d2=beta' refer='homepage' />"><img src="/i/home/architectureBeta.jpg" alt="Architecture Competition" /></a>
        --%>
        
        <%-- UML Tool 
        <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=dev&d2=umltool&d3=description' refer='homepage' />"><img src="/i/home/umltoolRelease.jpg" alt="UML Tool Release" /></A>
        --%>
    </td>
    <td align="right" valign="top">
<%-- STUDIO DOGEAR --%>
        <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/"><img src="/i/home/studioDogEarStandard.png" style="display: block;" alt="TopCoder Studio" /></A>

<%-- TCO DOGEAR 
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"><img src="/i/home/dogTCO07.png" style="display: block;" alt="TCO07 Sponsored by AOL" /></A>
--%>
    </td>
</tr>
<tr>
    <td align="center" colspan="3">
        <A href="<tc-webtag:linkTracking link='http://software.topcoder.com/tcs?module=Static&d1=tour&d2=page1' refer='homepage' />"><img src="/i/home/webuildsoftwareV4.png" alt="" style="display: block;" /></A>
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

                <%-- DIGITAL RUN 2008 --%>
                <A href="/tc?module=Static&d1=digital_run&d2=2008&d3=description"><img src="/i/home/dig_run_2008.png" alt="The Digital Run 2008" border="0" style="display:block;"/></A>
                

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

                <%-- SRM SPONSOR 
                <map name="mm">
                <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&rd=10796" />
                <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa" />
                </map>
                <img src="/i/home/srm376_nsa.png" alt="SRM 376 brought to you by NSA" border="0" style="display:block;" usemap="#mm"/>
                --%>

                <%-- LICENSE ID 
                <A href="<tc-webtag:linkTracking link='http://studio.topcoder.com/?module=ViewContestDetails&ct=2093' refer='homepage' />"><img src="/i/home/licenseIDProject.jpg" alt="License ID Project" border="0" style="display:block;"/></A>
                --%>
                
                <%-- CSF 
                <A href="<tc-webtag:linkTracking link='http://csf.topcoder.com/forums?module=Thread&threadID=123&start=0' refer='tc_Index'/>"><img src="/i/home/csfBt.jpg" alt="Microsoft CSF Powered by TopCoder" style="display:block;" /></A>
                --%>
                
               <%-- TCCC07 
               <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tccc07&d3=about' refer='homepage' />"><img src="/i/home/tccc07_promo.png" alt="2007 TopCoder Collegiate Challenge" /></A>
                --%>
                
               <%-- TC CHANNEL 
               <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=media&d2=tcchannel&clip=ep05' refer='homepage' />"><img src="/i/home/tcchannel_promo_ep5.png" alt="TC Channel: Episode 5" /></A>
               --%>
               
               <%-- UML Tool 
               <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=dev&d2=umltool&d3=description' refer='homepage_promo' />"><img src="/i/home/umltool_component.png" alt="UML Tool Release" /></A>
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
                <A href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/customers/index.jsp"><img src="/i/home/tcs_client_directenergy.png" alt="TopCoder &amp; Direct Energy" border="0" style="display:block;"/></A>
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
            <area shape="rect" alt="" coords="1,1,264,95" href="/tc?module=MatchDetails&rd=10783" />
            <area shape="rect" alt="" coords="1,106,264,135" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db" />
            </map>
            <img src="/i/home/srm367_db.png" alt="SRM 367 brought to you by Deutsche Bank" border="0" style="display:block;" usemap="#mm"/>
            --%>
                
            <%-- 2 Registration Prototype contests open @ Studio 
            <A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests" target="_blank"><img src="/i/home/regproto_studiopromo.png" alt="2 Registration Prototype contests open @ Studio" border="0" style="display:block;" /></A>
            --%>
            
            <%-- TCCC07 
               <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tccc07&d3=blog&d4=description' refer='homepage' />"><img src="/i/home/tccc07_promo_blog.png" alt="2007 TopCoder Collegiate Challenge" /></A>
             --%>
             
            <%-- UML Tool 
            <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=dev&d2=umltool&d3=description' refer='homepage_promo' />"><img src="/i/home/umltool_component.png" alt="UML Tool Release" /></A>
            --%>
               
            <%-- TCHS07 
               <A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=onsiteSchedule"><img src="/i/home/tchs07_promo_051007.png" alt="TCHS07" border="0" style="display:block;"/></A>
            --%>
               
            <%-- CSF 
            <A href="<tc-webtag:linkTracking link='http://csf.topcoder.com/?module=Static&d1=assembly&d2=btWorkspaceDetails' refer='tc_Index'/>"><img src="/i/home/csfBt.jpg" alt="Microsoft CSF Powered by TopCoder" style="display:block;" /></A>
            --%>
            
            <%-- LICENSE ID 
            <A href="<tc-webtag:linkTracking link='http://studio.topcoder.com/?module=ViewContestDetails&ct=2093' refer='homepage' />"><img src="/i/home/licenseIDProject.jpg" alt="License ID Project" border="0" style="display:block;"/></A>
            --%>
            
            <%-- TOPCODER EMPLOYEE REFERRAL PROGRAM 
            <A href="/tc?module=Static&d1=my_home&d2=empReferrals"><img src="/i/home/empRefSm_20070517.png" alt="TopCoder Employee Referral Program" border="0" style="display:block;"/></A>
             --%>
             
            <%-- TC CHANNEL 
            <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=media&d2=tcchannel&clip=ep03_sm' refer='homepage' />"><img src="/i/home/tcchannel_promo_ep3.png" alt="TC Channel: Episode 3" /></A>
            --%>
            
            <%-- TCCC07 LOGO DESIGN 
            <A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2104"><img src="/i/home/tccc07_logo_design_promo.png" alt="TCCC07 Logo Design Contest" border="0" style="display:block;"/></A>
            --%> 
             
            <%-- TopCoder on 2007 Inc. 500 --%>
            <A href="<tc-webtag:linkTracking link='/tc?module=Static&d1=pressroom&d2=pr_082707' refer='homepage_promo' />"><img src="/i/home/tc_inc500_promo.png" alt="TopCoder on 2007 Inc. 500" /></A>
            
            
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
        <td class="homeText"><br />

            Rock star coders
            <a target="_blank" href="<tc-webtag:linkTracking link='http://www.computerworld.com/action/article.do?command=viewArticleBasic&articleId=9057899&source=NLT_AM&nlid=1' refer='homepage_index' />">...more</a><br />[January 22]<br /><br />
            
            TopCoder to Speak on Collaboration at Mid-Atlantic CIO Forum
            <a href="/tc?module=Static&d1=pressroom&d2=pr_010708">...more</a><br />[January 7]<br /><br />
            
            Gaming the System
            <a target="_blank" href="<tc-webtag:linkTracking link='http://www.cfo.com/article.cfm/10345535/c_10346944?f=magazine_alsoinside' refer='homepage_index' />">...more</a><br />[January 3]<br /><br />
            
            TopCoder Expands With New Headquarters in Connecticut
            <a href="/tc?module=Static&d1=pressroom&d2=pr_010208">...more</a><br />[January 2]<br /><br />
            
            Coder contests drive app development [PODCAST]
            <a target="_blank" href="<tc-webtag:linkTracking link='http://www.networkworld.com/podcasts/panorama/2007/122007pan-topcoder.html' refer='homepage_index' />">...more</a><br />[December 21]<br /><br />
            
            Eight business technology trends to watch
            <a target="_blank" href="<tc-webtag:linkTracking link='http://www.mckinseyquarterly.com/article_abstract_visitor.aspx?ar=2080&l2=13&l3=11' refer='homepage_index' />">...more</a><br />[December 12]<br /><br />
            


          </td>
    </tr>
    <tr>
        <td class="homeArrow"><img src="/i/home/triangle.gif" alt="" border="0"/></td>
        <td class="homeTitle"><A href="/tc?module=Static&d1=calendar&d2=thisMonth" class="homeTitleLink">January Events:</A></td>
    </tr>
    <tr>
        <td class="homeArrow">&#160; </td>
        <td class="homeText"><br />
            <strong>01.05</strong> - SRM 386 - 12 NOON<br /><br />
            <strong>01.09</strong> - SRM 387 - 9 PM<br /><br />
            <strong>01.09</strong> - MM 28 - 12 NOON - 2 weeks<br /><br />
            <strong>01.12</strong> - TCHS Online Round 1 - 1 PM<br /><br />
            <strong>01.15</strong> - SRM 388 - 11 AM<br /><br />
            <strong>01.19</strong> - TCHS Online Round 2 - 1 PM<br /><br />
            <strong>01.24</strong> - SRM 389 - 7 AM<br /><br />
            <strong>01.24</strong> - TCO CDDC Week 1 Projects - 9 AM<br /><br />
            <strong>01.26</strong> - TCHS Online Round 3 - 1 PM<br /><br />
            <strong>01.30</strong> - MM 29 - 12 NOON - 1 week<br /><br />
            <strong>01.30</strong> - TCO Marathon Round 1 - 12 NOON<br /><br />
            <strong>01.31</strong> - TCO CDDC Week 2 Projects - 9 AM<br /><br />
            <%--<strong>01.13</strong> - <div style="float:left; padding-right:5px;"><A href="/longcontest/?module=ViewActiveContests&rt=15"><img src="/i/longcontest/spon_intel.gif" alt="Intel&#174;" border="0" /></A></div>Intel&#174; Multi-Threading Competition 12 - 12 NOON<br /><br />--%>
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
            <br />
            <A href="/tc" class="footerLinks">Developer Center</A>&#160;&#160;|&#160;&#160;
            <A href="/corp/?module=Static&d1=corp&d2=index" class="footerLinks">Corporate Services</A></td>
        <tr>
            <td class="copyright" colspan="5">Copyright &#169; 2001-2007, TopCoder, Inc. All rights reserved.</td>
        </tr>
</table>

<%-- Google Analytics --%>
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
var pageTracker = _gat._getTracker("UA-3257193-1");
pageTracker._initData();
pageTracker._trackPageview();
</script>

</body>
</html>
