<%@ page import="com.topcoder.web.tc.Constants"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="m_competitions"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="Component Competitions"/>
        </jsp:include>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr class="bodyText">
  <td nowrap="nowrap">12.18.08 12:30 PM -</td>
  <td><a href="http://www.topcoder.com/tc?module=Static&d1=sponsors&d2=amdOverview">AMD Multicore Threadfest Competition 4 is Underway</a></td>
</tr>
<tr class="bodyText"><td nowrap="nowrap">12.12.08 12:00 PM - </td><td width="100%"><a href="/tc?module=ProjectDetail&pj=30005645">XBMC Competitions!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.12.08 11:00 AM - </td><td width="100%"><a href="/wiki/display/tc/Contest+Details+-+ChumBonus+Community+Site+Conceptualization">ChumBonus Community Site Conceptualization Launched</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.11.08 12:00 AM - </td><td width="100%"><a href="/wiki/display/tc/Agent+Directory+Application">Agent Directory Conceptualization Launched</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.10.08 9:30 AM - </td><td width="100%"><a href="/wiki/display/tc/Broker+Site+Conceptualization+Contest">Broker Site Conceptualization Contest Launched!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.06.08 12:30 PM - </td><td width="100%"><a href="/tc?module=ProjectDetail&pj=30005625">iPhone App Assembly Contest!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.06.08 12:00 PM - </td><td width="100%"><a href="/wiki/display/docs/Contest+Details+-+Specification+Diana+EHR+3.1+ADS+Requirements+Contest">Write the Diana EHR 3.1 ADS Requirements Specification!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.05.08 11:00 AM - </td><td width="100%"><a href="/wiki/pages/viewpage.action?pageId=33457768">Compete in a Specification contest for a Calendar Scheduling &amp; Workflow Application! </a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.04.08 8:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Contest+Details+-+Game+Plan+Widget+Conceptualization">What's the "Game Plan"?</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.27.08 8:00 AM - </td><td width="100%"><a href="/tc?module=ProjectDetail&pj=30005592">New System Architecture Contests Announced - $1,125 in prizes!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.26.08 5:30 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>?module=ViewContestDetails&ct=1000338">Redesign This Page</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.21.08 9:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Contest+Details+-+Hypnos+Carrier+Call+Detail+Conceptualization">More New Contests, More Prize Money!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.21.08 6:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Contest+Details+-+Hera+Status+Portal+1.0+Req.+Specification">Compete in a Specification contest for a Status Portal Application!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.18.08 12:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Contest+Details+-+Auto+Tree+Conceptualization">$1500 Conceptualization Contest – You write the Business Requirements</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.08 2:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Contest+Details+-+Diana+Mira+2.0+Req.+Specification">Write an Application Specification!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.13.08 6:00 PM - </td><td width="100%"><a href="/wiki/display/tc/Contest+Details+-+Agent+Visibility+Component+Specification">Component Requirements Contest – You Write the Spec!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.04.08 9:00 AM - </td><td width="100%"><a href="/wiki/pages/viewpage.action?spaceKey=tc&amp;title=Contest+Details+-+Aether+OCS">$900 Conceptualization Contest - You Write The Business Requirements</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.22.08 1:00 PM - </td><td width="100%"><a href="/tc?module=ProjectDetail&amp;pj=30005406">PHP Component Contest Running Now</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.17.08 3:00 PM - </td><td width="100%"><a href="/wiki/display/tc/TopCoder+Conceptualization+Contests">Compete in a Specification Contest!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.29.08 7:00 PM - </td><td width="100%"><a href="/wiki/display/docs/Seam">JBoss Seam Contests Approaching</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.18.08 10:00 AM - </td><td width="100%"><a href="/wiki/display/tc/Active+Bug+Races">TopCoder: Kills Bugs Dead</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.06.08 10:30 AM - </td><td width="100%"><a href="/tc?module=ViewAssemblyActiveContests">5000 DR Points in the NORM Assembly Run!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.05.08 4:30 PM - </td><td width="100%"><a href="/tc?module=ProjectDetail&amp;pj=30005156">Supercharge the TC Platform!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.03.08 11:45 AM - </td><td width="100%"><a href="/tc?module=ViewAssemblyActiveContests">High Prizes, High DR, High Profile</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.21.08 9:45 AM - </td><td width="100%"><a href="/wiki/display/docs/Competition+Environments">$3500 in Bug Races – Get on the Cloud!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.19.08 9:30 AM - </td><td width="100%"><a href="/tc?module=ProjectDetail&amp;pj=30005074">MySQL Memory Engine Architecture Contest Re-Launched!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.22.08 10:30 PM - </td><td width="100%"><a href="/truveo/">Use the New TC Battle Widget to Vote for Your Favorite Truveo Apps!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.08.08 7:30 PM - </td><td width="100%"><a href="/truveo/">Two Weeks Left in the Truveo Challenge!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.26.08 1:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=617309">Changes Coming to Digital Run</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.18.08 10:30 AM - </td><td width="100%"><a href="/dobbs">TopCoder Contest at Dr. Dobb's Architecture &amp; Design World Conference</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.12.08 1:30 PM - </td><td width="100%"><a href="/tc?module=ViewActiveContests&amp;ph=113">New Component Testing Competitions</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.04.08 12:30 PM - </td><td width="100%"><a href="/truveo/">Video Apps Aplenty in the Truveo Challenge</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.27.08 10:00 AM - </td><td width="100%"><a href="/wiki/display/tc/Active+Bug+Races">Week at the Races</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.21.08 10:00 AM - </td><td width="100%"><a href="/tc?module=ViewAssemblyActiveContests">An Assembly of Cockpit Widget Assemblies</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.15.08 6:00 PM - </td><td width="100%"><a href="/openaim/">Open AIM Developer Challenge - We Have Our Winners!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.13.08 2:00 PM - </td><td width="100%"><a href="/truveo/">TopCoder launches the $100,000 Truveo Developer Challenge</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.07.08 9:30 AM - </td><td width="100%"><a href="/openaim/">Open AIM Developer Challenge Closes, Vote for Your Favorites!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.15.08 1:00 PM - </td><td width="100%"><a href="/openaim/">AIM Apps by TopCoder Members, for TopCoder Members</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.07.08 2:30 PM - </td><td width="100%"><a href="/openaim/">One Month Into the Open AIM Developer Challenge</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.20.08 2:30 PM - </td><td width="100%"><a href="/registration/actions/Registration.do?method=openRegistrations">Two Assembly Comps Launched with over $10,000 in Prizes</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.05.08 11:00 AM - </td><td width="100%"><a href="/openaim/">Introducing the Open AIM Developer Challenge</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.25.08 9:00 PM - </td><td width="100%"><a href="/registration/actions/ProjectDetails.do?method=displayProjectDetails&amp;projectId=30003815">Mobile Development on Three Platforms</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.20.08 7:00 PM - </td><td width="100%"><a href="/registration/actions/Registration.do?method=openRegistrations">Increased Assembly Prize Money</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.20.08 7:00 PM - </td><td width="100%"><a href="/tc?module=Static&amp;d1=digital_run&amp;d2=2007dot5&amp;d3=asmLeaderboardS2">2007.5 Digital Run: Assembly Cup Stage 2 Winners</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.18.08 6:30 PM - </td><td width="100%"><a href="/wiki/display/tc/TopCoder+UML+Tool+Source+Code">TC UML Tool Source Code is in Your Hands Now</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.12.08 5:00 PM - </td><td width="100%"><a href="/registration/actions/Registration.do?method=openRegistrations">Some Assembly Required</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.29.08 4:30 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Announcement&annID=592">RSS Feeds for Software Active Contests</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.21.07 9:30 AM - </td><td width="100%"><a href="/tc?module=Static&d1=digital_run&d2=2008&d3=description">Digital Run 2008 Stage 1 Starts Soon</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.29.07 5:30 PM - </td><td width="100%"><a href="http://forums.topcoder.com/?module=Announcement&annID=466">The TopCoder UML Tool 1.0.0 is Released, Required</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.02.07 7:30 PM - </td><td width="100%">TCCC07 Component <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desSummary">Design</a> and <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devSummary">Development</a> Finals: Round 3</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.01.07 5:00 PM - </td><td width="100%">TCCC07 Component <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desSummary">Design</a> and <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devSummary">Development</a> Finals: Round 2</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.31.07 7:30 PM - </td><td width="100%">TCCC07 Component <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desSummary">Design</a> and <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devSummary">Development</a> Finals: Round 1</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.07 4:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=umltool&d3=description">How Do You Like the UML Tool?</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.07 1:30 PM - </td><td width="100%"><a href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=stage1Winners">2007.5 Digital Run: Stage 1 Winners</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.20.07 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=umltool&d3=description&node=des_uml_tool">Try the TopCoder UML Tool</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.30.07 12:45 PM - </td><td width="100%"><a href="/tc?module=Static&d1=digital_run&d2=2007Stage4Winners">Digital Run: Stage 4 winners</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.23.07 7:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=support&d3=desReliability">Design &amp; Development reliability bonuses increased</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.04.07 10:00 AM - </td><td width="100%"><a href="/dr">Announcing the Digital Run 2007.5 Season</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.02.07 2:00 PM - </td><td width="100%"><a href="/tc?module=ViewSurvey&sid=16730">Vote for the TopCoder UML Tool Splash Screen Design</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.16.07 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">Metric Reporting Testing Competitions</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.02.07 3:30 PM - </td><td width="100%"><a href="/tc?module=Static&d1=digital_run&d2=2007Stage3Winners">Digital Run: Stage 3 Winners</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.13.07 9:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Category&categoryID=22">Software Forums integrated into TopCoder Forums</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.27.06 5:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Announcement&annID=55">Poseidon version update</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.05.06 5:15 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=assembly&d3=activeContests">Three Assembly Competitions open: $55,000+ in prizes</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.04.06 9:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">New Records in the Component Record Book</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.10.06 12:10 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=assembly&d3=det_orpheusGameServer">New Assembly contest online: $45,000 in prizes!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.01.06 9:00 AM - </td><td width="100%"><a href="/tc?module=Static&d1=digital_run&d2=2006_des_prizes">Design prizes <strong><em>DOUBLED</em></strong> for next Digital Run stage</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.31.06 3:45 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=assembly&d3=activeContests">Latest Software Assembly winners claim $22,500 in prizes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.23.06 6:00 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewPastContests">leungxiao wins Digital Run logo contest</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.06 11:00 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2040">UML Tool Icons contest over at the Studio</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.03.06 10:00 AM - </td><td width="100%">Appeals statistics on member profiles and <a href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">Record Book</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.21.06 12:30 PM - </td><td width="100%"><a href="/tc?module=ViewActiveContests&ph=112">Puzzled? Components offer brainy challenge</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.20.06 3:00 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=assembly&d3=det_costingEngineAdminTool">New Assembly contest online: $22,500 in prizes!</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.14.06 10:30 PM - </td><td width="100%">Design and Development Submission Downloads<br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.31.06 2:30 PM - </td><td width="100%">Digital Run: Stage 1 winners finalized<br />
<a href="/tc?module=LeaderBoard&ph=112&sc=&sd=&staid=1&nr=50&sr=1">Design Stage 1 Leaderboard</a>&#160;|&#160;<a href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=1&nr=50&sr=51">Development Stage 1 Leaderboard</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.24.06 1:25 PM - </td><td width="100%"><a href="/tc?module=Static&d1=digital_run&d2=2006_stage1_winners">Announcing the Digital Run: Stage 1 winners</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.18.06 2:30 PM - </td><td width="100%">A banner week for Component Competitions <br />
<a href="/tc?module=ViewActiveContests&ph=112">design contests</a>&#160;|&#160;<a href="/tc?module=ViewActiveContests&ph=113">development contests</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.03.06 12:30 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=assembly&d3=activeContests">Assembly Competition prizes top five figures</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.26.06 1:30 PM - </td><td width="100%">New guidelines for component competitors and reviewers<br />
<a href="/tc?module=Static&d1=dev&d2=support&d3=desDocumentation">design docs</a>&#160;|&#160;<a href="/tc?module=Static&d1=dev&d2=support&d3=devDocumentation">development docs</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.08.06 5:30 PM - </td><td width="100%">Poseidon 4.1 now the official standard</td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.28.06 5:30 PM - </td><td width="100%">New Software <a href="/tc?module=Static&d1=dev&d2=support&d3=desGettingStarted">Design</a> and <a href="/tc?module=Static&d1=dev&d2=support&d3=devGettingStarted">Development</a> Tutorial Movies</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.29.06 3:15 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">Software Testing registration extended</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.21.06 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">Software Testing Active Contests</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.15.06 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=assembly&d3=overview">Introducing Software Assembly Competitions</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.15.06 10:00 AM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=testing&d3=overview">Introducing Software Testing Competitions</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.11.06 2:25 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=support&d3=desReviewSample">Design Review Scorecard Changes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.08.05 11:25 AM - </td><td width="100%"><a href="/tc?module=Static&d1=contracting&d2=tcs_chat_110805">TopCoder Software chat session from SRM 271</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.07.05 5:30 PM - </td><td width="100%">TopCoder Software chat session scheduled for SRM 271</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.27.05 11:05 AM - </td><td width="100%"><a href="/tc?module=CompList&amp;<%=Constants.PHASE_ID%>=112">Design</a> and <a href="/tc?module=CompList&amp;<%=Constants.PHASE_ID%>=113">Development</a> Contest Lists, Scorecard Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.05.05 9:25 AM - </td><td width="100%">Reliability Rating changes</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.26.05 3:00 PM - </td><td width="100%">Software Royalties updated in Member Profiles</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.17.05 8:00 PM - </td><td width="100%">New Statistics: Component Contest Details</td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.12.05 3:50 PM - </td><td width="100%"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp">software.topcoder.com</a> will be down for maintenance on 7/18</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.27.05 5:45 PM - </td><td width="100%"><a href="/tc?module=Static&d1=dev&d2=support&d3=desReviewSample">New Sample Design Review Scorecard now available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.23.05 11:20 AM - </td><td width="100%"><a href="/i/development/downloads/topcoder_global.build">Global NAnt properties file now available</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.17.05 11:55 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=14836181">oldbig scores a perfect 100 in a Component Development Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.06.05 1:05 PM - </td><td width="100%"><a href="/rtables/viewThread.jsp?forum=205768&thread=495791&mc=1">Reviewer minimum requirements updated</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.29.05 3:25 PM - </td><td width="100%">TCS to post Design and Development projects on Wednesdays</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.30.05 11:15 AM - </td><td width="100%"><a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/index.jsp">"Top 10 Most Downloaded Components" added to TCS homepage</a></td></tr>
</table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
