<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<br><br>
<table border="0" cellspacing="0" cellpadding="0" width="525">
   <tr>
      <td class="newsTitle" align="right" colspan="2"><i>TopCoder News</i></td>
   </tr>
<%------------------------------------------------------ LEAVE COMMENTED OUT TIL JESSIE GETS APPROVAL
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0" /><br>03.16.06<br>11:15 AM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ubs_chat_031606">UBS TCO06 Round 3 chat session transcript</A>
      </span><br><br>
      UBS was in the arena prior to Round 3 of the TCO06, to discuss working at UBS.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ubs_chat_031606">view</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505918" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>
--%>
<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/comp.gif" alt="Component Competition News" border="0" /><br>03.29.06<br>3:15 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">Software Testing registration extended</A>
      </span><br><br>
      We've extended the registration for the current Testing Active Contests until 03.31.2006.  As a result, we've also extended the submission deadline to 04.03.2006.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">details</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505947" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_comp">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tc.gif" alt="General Competition News" border="0" /><br>03.29.06<br>3:15 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Announcement&annID=13">Intel Multi-Threading Competition 3 server maintenance, extended deadline</A>
      </span><br><br>
There will be scheduled server maintenance that will cause downtime to occur from 8:30 AM EST until 7:30 PM EST on Saturday April 1. Submissions will be disallowed during this time period. In order to accommodate for this downtime, we will be extending the submission deadline for the competition by 24 hours. The new submission deadline will be 12:00 Noon EDT on Thursday April 6.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Announcement&annID=13">details</A>&#160;|&#160;
         <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Announcement&annID=13">discuss this</A>&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /><br>03.27.06<br>9:20 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm294">SRM 294 - Problem Set & Analysis</A></span><br><br>
SRM 294 attracted a record-breaking 1029 participants.
Boosted by 4 successful challenges, <tc-webtag:handle coderId="10574855" context="algorithm"/> scored his third Division 1
victory out of the last five matches,
followed closely by <tc-webtag:handle coderId="251074" context="algorithm"/> and <tc-webtag:handle coderId="279471" context="algorithm"/> in second and third place.
      </td>
      <td class="newsPhoto"><img src="/i/m/legakis_big.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="287269" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=match_editorials&d2=srm294">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505860" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/education.gif" alt="Educational Content" border="0" /><br>03.24.06<br>10:45 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=tutorials&d2=xmiDocumenter">Using XMI Documenter</A></span><br><br>
       This article will show how the <a href="http://software.topcoder.com/catalog/c_component.jsp?comp=20668655">XMI Documenter component</a> component can be used to build an XMI documentation editor which can be used as a replacement for the somewhat sub-optimal documentation editing features of Poseidon.</td>
      <td class="newsPhoto"><img src="/i/m/traugust_mug.gif" /><br>by <tc-webtag:handle coderId="15664457" context="development"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=tutorials&d2=xmiDocumenter">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505953" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=tutorials&d2=comp_index">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0" /><br>03.23.06<br>12:00 NOON</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=SimpleStats&c=tco06_alg_adv_overview&trans=true&d1=tournaments&d2=tco06&d3=alg_adv_overview">Round 4 Results for TCO06 Algorithm Competition</A>
      </span><br><br>
      Find out who will make the trip to Las Vegas.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=SimpleStats&c=tco06_alg_adv_overview&trans=true&d1=tournaments&d2=tco06&d3=alg_adv_overview">results</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505938" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /><br>03.23.06<br>12:00 NOON</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=tco06_online_rd_4">TCO06 Round 4 - Problem Set & Analysis</A></span><br><br>
Round 4 always features some of the hardest problems TopCoder has to offer, and tonight was no exception.  While the easy stumped no one (literally), only 37 coders solved the medium, and only 4 solved the hard.
      </td>
      <td class="newsPhoto"><img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="159052" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=match_editorials&d2=tco06_online_rd_4">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505938" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tc.gif" alt="General Competition News" border="0" /><br>03.22.06<br>3:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/longcontest/?module=ViewActiveContests&rt=15">Intel Multi-Threading Competition 3 is underway</A>
      </span><br><br>
The <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm" target="_blank">Intel&#174; Software Network</A> and TopCoder&#174; have opened registration for the third competition in the <A href="/longcontest/?module=Static&d1=intel_overview">Intel Software Network Multi-Threading Competition Series</A>.  This marathon match style competition encourages the use of multi-threading techniques and will run through April 5th at 12:00 Noon EST.
<br><br>
Explore the <A href="/?t=sponsor&c=link&link=http://www.intel.com/cd/ids/developer/asmo-na/eng/index.htm" target="_blank">The Intel&#174; Software Network's</A> wealth of resources to discover how they can benefit you in the Multi-Threading Competition Series!
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/longcontest/?module=ViewActiveContests&rt=15">view</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505951" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0" /><br>03.22.06<br>11:00 AM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=amd_chat_031706">AMD SRM 293 chat session transcript</A>
      </span><br><br>
      AMD was in the arena prior to SRM 293, to discuss gaming optimization techniques.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=amd_chat_031706">view</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505952" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /><br>03.21.06<br>2:15 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm293">SRM 293 - Problem Set & Analysis</A></span><br><br>
With the TCO stimulating our coding adrenalin to the max, a high number of registrants in regular SRMs has ceased to surprise us. With 898 competitors, this match was no exception.
      </td>
      <td class="newsPhoto"><img src="/i/m/supernova_big.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="7371063" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=match_editorials&d2=srm293">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505859" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/comp.gif" alt="Component Competition News" border="0" /><br>03.21.06<br>10:00 AM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">Software Testing Active Contests</A>
      </span><br><br>
      Testing Competitions are now open for registration.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=dev&d2=testing&d3=activeContests">details</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505947" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_comp">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /><br>03.20.06<br>11:45 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_2">Intel Multi-Threading Competition 2 Analysis</A></span><br><br>
Puzzles vary in difficulty, but even the hardest ones are quite easy to solve with even simple algorithms.  However, in this problem the difficulty increases in two ways.
      </td>
      <td class="newsPhoto"><img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="159052" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_2">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505923" message="discuss this" />&#160;|&#160;
         <A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
       <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/pressroom.gif" alt="Press Releases & Articles" border="0" /><br>03.16.06<br>6:15 PM</td>
       <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=pressroom&d2=pr_031606">AMD TCO06 Sponsorship Press Release</A></span><br><br>
"AMD Developer Central, AMD's program to support software developers, is pleased to sponsor the 2006 TopCoder Open and help showcase the unique creativity and genius shown by TopCoder members in this competition."
      </td>
   </tr>
   <tr><td class="newsLinksCell">
       <A href="/tc?module=Static&d1=pressroom&d2=pr_031606">full story</A>&#160;|&#160;
       <tc-webtag:forumLink forumID="505925" message="discuss this" />&#160;|&#160;
       <A href="/tc?module=Static&d1=pressroom&d2=pr_archive">archive</A>
   </td></tr>


</table>
<br><br>
<table align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox" width="525">
   <tr>
      <td class="sidebarTitle" colspan="4">News Archives</td>
   </tr>
   <tr class="bodyText">
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_tc"><img src="/i/home/icons/tc.gif" alt="General TopCoder News" border="0" /></A></td>
      <td width="50%"><A href="/tc?module=Static&d1=home&d2=news_archive_tc">General TopCoder News</A></td>
      <td><A href="/tc?module=Static&d1=pressroom&d2=index"><img src="/i/home/icons/pressroom.gif" alt="Press Releases & Articles" border="0" /></A></td>
      <td width="50%"><A href="/tc?module=Static&d1=pressroom&d2=index">Press Releases & Articles</A></td>
   </tr>
   <tr class="bodyText">
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_alg"><img src="/i/home/icons/alg.gif" alt="Algorithm Competition News" border="0" /></A></td>
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_alg">Algorithm Competition News</A></td>
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_comp"><img src="/i/home/icons/comp.gif" alt="Component Competition News" border="0" /></A></td>
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_comp">Component Competition News</A></td>
   </tr>
   <tr class="bodyText">
      <td><A href="/tc?&module=SurveyList"><img src="/i/home/icons/survey.gif" alt="Surveys" border="0" /></A></td>
      <td><A href="/tc?&module=SurveyList">Surveys</A></td>
      <td><A href="/tc?module=Static&d1=match_editorials&d2=archive"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /></A></td>
      <td><A href="/tc?module=Static&d1=match_editorials&d2=archive">Problem Sets & Analyses</A></td>
   </tr>
   <tr class="bodyText">
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_tournie"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0" /></A></td>
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_tournie">Tournament News</A></td>
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_employment"><img src="/i/home/icons/employment.gif" alt="Employment Opportunities" border="0" /></A></td>
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_employment">Employment Opportunities</A></td>
   </tr>
   <tr class="bodyText">
      <td><A href="/tc?module=Static&d1=tutorials&d2=alg_index"><img src="/i/home/icons/education.gif" alt="Educational Content" border="0" /></A></td>
      <td><A href="/tc?module=Static&d1=tutorials&d2=alg_index">Educational Content</A></td>
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_movies"><img src="/i/home/icons/movie.gif" alt="TopCoder Movies" border="0" /></A></td>
      <td><A href="/tc?module=Static&d1=home&d2=news_archive_movies">Movies</A></td>
   </tr>
   <tr class="bodyText">
      <td colspan="4" align="center"><A href="/tc?module=Static&d1=home&d2=news_archive_podcast"><img src="/i/home/icons/headphones.gif" alt="Podcasts" border="0" /></A> &#160;&#160;&#160;
      <A href="/tc?module=Static&d1=home&d2=news_archive_podcast">Podcasts</A></td>
   </tr>
</table>

<br><br>