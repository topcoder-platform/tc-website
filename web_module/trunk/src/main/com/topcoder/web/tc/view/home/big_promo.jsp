<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%-- Competitions at TopCoder --%>
<img id="competitions" src="/i/home/catcStatic.png" alt="Digital Run" border="0" usemap="#Competitions" />
    <map name="Competitions" id="Competitions">
        <area shape="poly" coords="154,177,356,179,333,310,175,309" href="/tc?module=Static&amp;d1=digital_run&amp;d2=description" alt="Digital Run - $350,000 in Prizes" onmouseover="MM_swapImage('competitions','','/i/home/catcDigitalRun.png',1)" onmouseout="MM_swapImgRestore()" />
        <area shape="poly" coords="378,146,506,125,472,230,357,249" href="/tc?module=ViewActiveContests&amp;ph=113" alt="Component Development" onmouseover="MM_swapImage('competitions','','/i/home/catcDevelopment.png',1)" onmouseout="MM_swapImgRestore()" />
        <area shape="poly" coords="2,125,129,147,153,247,36,230" href="/tc?module=ViewActiveContests&amp;ph=112" alt="Component Design" onmouseover="MM_swapImage('competitions','','/i/home/catcDesign.png',1)" onmouseout="MM_swapImgRestore()" />
        <area shape="poly" coords="100,184,241,196,230,101,87,92" href="/wiki/display/tc/Assembly" alt="Assembly" onmouseover="MM_swapImage('competitions','','/i/home/catcAssembly.png',1)" onmouseout="MM_swapImgRestore()" />
        <area shape="poly" coords="271,191,407,186,429,91,281,100" href="/wiki/display/tc/Bug+Races" alt="Bug Races" onmouseover="MM_swapImage('competitions','','/i/home/catcBugraces.png',1)" onmouseout="MM_swapImgRestore()" />
        <area shape="poly" coords="49,112,31,45,158,58,169,127" href="/longcontest/?module=ViewActiveContests" alt="Marathon" onmouseover="MM_swapImage('competitions','','/i/home/catcMarathon.png',1)" onmouseout="MM_swapImgRestore()" />
        <area shape="poly" coords="177,59,333,59,320,145,189,146" href="javascript:arena();" alt="Algorithm" onmouseover="MM_swapImage('competitions','','/i/home/catcAlgorithm.png',1)" onmouseout="MM_swapImgRestore()" />
        <area shape="poly" coords="464,110,341,129,355,53,480,44" href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/" alt="Studio" onmouseover="MM_swapImage('competitions','','/i/home/catcStudio.png',1)" onmouseout="MM_swapImgRestore()" />
    </map>
    

<%-- digital run 
<a href="/tc?module=Static&d1=digital_run&d2=description"><IMG SRC="/i/home/digitalrun20070504.png" border="0" alt="The Digital Run - 2007.5 Season" /></a>
--%>
<%-- TCHS08 
<a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=tournaments&d2=tchs08&d3=onlineSchedule' refer='/tc' />"><img src="/i/home/tchs08onlineRd1.png" alt="2008 TopCoder High School" /></a>
--%>

<%-- TCHS08 And Architecture Competition 
<map name="tchs08">
<area shape="rect" alt="" coords="10,10,270,135" href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=overview" />
<area shape="rect" alt="" coords="290,12,455,135" href="/tc?module=Static&d1=architecture&d2=beta" />
</map>
<img src="/i/home/tchs08ANDarchComp.png" alt="TCHS08" usemap="#tchs08" style="display: block;" />
--%>

<%-- TCO08 --%>
<br />
<a href="<tc-webtag:linkTracking link='/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog' refer='/tc' />"><img src="/i/home/tco08BlogSlim.png" alt="2008 TopCoder Open" /></a>


<%-- UML Tool 
<a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=dev&d2=umltool&d3=description' refer='/tc' />"><img src="/i/home/umltoolRelease.jpg" alt="UML Tool Release" /></a>
--%>

<%-- Architecture 
<a href="<tc-webtag:linkTracking link='/tc?module=Static&d1=architecture&d2=beta' refer='/tc' />"><img src="/i/home/architectureBeta.jpg" alt="Architecture Competition" /></a>
--%>

<%-- New Competitions Available 
<map name="newComp">
<area shape="rect" alt="" coords="4,42,153,138" href="/wiki/display/tc/Active+Bug+Races" />
<area shape="rect" alt="" coords="166,42,320,138" href="/registration/actions/Registration.do?method=openRegistrations" />
<area shape="rect" alt="" coords="347,42,462,138" href="/wiki/display/tc/Testing+Active+Contests" />
</map>
<img src="/i/home/newCompetitionsBanner.png" alt="New Competitions Available" usemap="#newComp" style="display: block;" />
--%>

<%-- The Bug Races 
<a href="/wiki/display/tc/Bug+Races"><img src="/i/home/theBugRaces2_banner.png" alt="The Bug Races" /></a>
--%>

<%-- Mobile Development on Three Platforms 
<a href="/registration/actions/ProjectDetails.do?method=displayProjectDetails&amp;projectId=30003815"><img src="/i/home/aolMobileAssembly_banner.png" alt="Mobile Development on Three Platforms" /></a>
--%>

<%-- OpenAIM 
<br />
<a href="<tc-webtag:linkTracking link='/openaim/' refer='/tc' />"><img src="/i/home/openAIMslimBannerVote.png" alt="Open AIM Developer Challenge Powered by TopCoder" /></a>
--%>