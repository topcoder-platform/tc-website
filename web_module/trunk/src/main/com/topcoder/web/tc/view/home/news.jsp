<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<br><br>
<table border="0" cellspacing="0" cellpadding="0" width="525">
   <tr>
      <td class="newsTitle" align="right" colspan="2"><i>TopCoder News</i></td>
   </tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/alg.gif" alt="Algorithm Competition News" border="0" /><br>12.05.05<br>5:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=508140&mc=1#518768">GCC Upgrade</A></span><br><br>
      We've finished upgrading our C++ compilers to GCC 4.0.2.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=508140&mc=1#518768">discuss this</A>&#160;|&#160;
      <A href="/tc?module=Static&d1=home&d2=news_archive_alg">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0" /><br>12.05.05<br>10:00 AM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=about">Announcing the 2006 TopCoder Open</A></span><br><br>
      Read up on the next big TopCoder event.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=about">details</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505852" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0" /><br>12.05.05<br>10:00 AM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ccip_description">TCO06 Complete Coder Incentive Program</A></span><br><br>
      Learn how you can earn more prize money by participating in both Component and Algorithm competitions.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=ccip_description">details</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505851" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/pressroom.gif" alt="Press Releases & Articles" border="0" /><br>12.02.05<br>10:45 AM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm">Rise Of A Powerhouse</A></span><br><br>
      <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/bw_cov120205_small.jpg" alt="BusinessWeek" border="0" /></div>
      "How the young knowledge workers of Central Europe are pushing the region to a new level. They came from around the world, young men with handles like SnapDragon and Bladerunner attacking computing problems so complex that even experienced coders could only stare at the screen in bewilderment. Only one mastered the final algorithm problem: Eryk Kopczynski, a.k.a. Eryx"
      <br><br>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
       <A href="http://www.businessweek.com/magazine/content/05_50/b3963021.htm">full story</A>&#160;|&#160;
       <tc-webtag:forumLink forumID="505850" message="discuss this" />&#160;|&#160;
       <A href="/tc?module=Static&d1=pressroom&d2=art_archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /><br>12.01.05<br>4:30 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm275">SRM 275 - Problem Set & Analysis</A></span><br><br>
      <tc-webtag:handle coderId="144400" context="algorithm"/> continued his quest to regain top position on the coder rankings list from <tc-webtag:handle coderId="10574855" context="algorithm"/> by easily winning Division 1 by almost 100 points.
      </td>
      <td class="newsPhoto"><img src="/i/m/NeverMore_mug.gif" /><br>by <tc-webtag:handle coderId="287130" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=match_editorials&d2=srm275">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505789" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/education.gif" alt="Educational Content" border="0" /><br>12.01.05<br>11:20 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=tutorials&d2=sorting">Sorting Tutorial</A></span><br><br>
        Any number of practical applications in computing require things to be in order. Even before we start computing, the importance of sorting is drilled into us.</td>
      <td class="newsPhoto"><img src="/i/m/timmac_mug.gif" /><br>by <tc-webtag:handle coderId="10407399" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=tutorials&d2=sorting">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505834" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=tutorials&d2=alg_index">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0" /><br>11.30.05<br>5:30 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=tournaments&d2=tco06&d3=logo_winner">b21 is the TCO06 Logo Contest Winner!</A></span><br><br>
      Congratulations to <tc-webtag:handle coderId="14947701"/>.  Take a look at the final results.  It was a close one.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=SurveyResults&sid=213">survey results</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505817" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/pressroom.gif" alt="Press Releases & Articles" border="0" /><br>11.30.05<br>4:25 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/pdfs/press_room/usatoday_113005.pdf">TopCoder Survey in USA Today [PDF]</A></span><br><br>
      A TopCoder survey on where members would prefer to work (given equal pay) is running as a Snapshot in today's Money section of USA Today (bottom left).
      <br><br>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
       <A href="/pdfs/press_room/usatoday_113005.pdf">full story</A>&#160;|&#160;
       <tc-webtag:forumLink forumID="505833" message="discuss this" />&#160;|&#160;
       <A href="/tc?module=Static&d1=pressroom&d2=art_archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /><br>11.25.05<br>2:15 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm274">SRM 274 - Problem Set & Analysis</A></span><br><br>
      SRM 274 was won by <tc-webtag:handle coderId="10574855" context="algorithm"/> with 1862.76 points, with the second-fastest time on each of the three problems, and 5 successful and 2 unsuccessful challenges.
      </td>
      <td class="newsPhoto"><img src="/i/m/John_Dethridge_mug.gif" /><br>by <tc-webtag:handle coderId="270505" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=match_editorials&d2=srm274">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505788" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /><br>11.25.05<br>2:15 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm273">SRM 273 - Problem Set & Analysis</A></span><br><br>
      In Div1, the top scores were quite impressive. Out of the 14 coders who solved all three problems, <tc-webtag:handle coderId="10574855" context="algorithm"/> was a clear winner with a score of 1483.76.
      </td>
      <td class="newsPhoto"><img src="/i/m/supernova_mug.gif" /><br>by <tc-webtag:handle coderId="7371063" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=match_editorials&d2=srm273">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505787" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0" /><br>11.23.05<br>10:00 AM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=ViewSurvey&sid=213">Vote for the TCO06 logo</A></span><br><br>
      The 10 finalists are ready for you to rank.  Voting ends at 5:00pm on Wednesday, November 30, 2005.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=ViewSurvey&sid=213">vote</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505817" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/pressroom.gif" alt="Press Releases & Articles" border="0" /><br>11.22.05<br>5:25 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html">Google to hold programming competition in China</A></span><br><br>
      "Hoping to attract talented Chinese programmers to Google's (Profile, Products, Articles) planned research and development (R&D) center in Beijing, the company will host a programming competition, called the Google China Code Jam."
      <br><br>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
       <A href="http://www.infoworld.com/article/05/11/22/HNgooglecompetition_1.html">full story</A>&#160;|&#160;
       <tc-webtag:forumLink forumID="505832" message="discuss this" />&#160;|&#160;
       <A href="/tc?module=Static&d1=pressroom&d2=art_archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/employment.gif" alt="Employment Opportunities" border="0" /><br>11.18.05<br>5:10 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=contracting&d2=msn_chat_111905">MSN chat session from SRM 272</A></span><br><br>
      MSN recently held a chat session just prior to SRM 272 to discuss working at MSN.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=contracting&d2=msn_chat_111905">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505830" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_employment">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/analysis.gif" alt="Problem Set & Analysis" border="0" /><br>11.21.05<br>11:00 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm272">SRM 272 - Problem Set & Analysis</A></span><br><br>
      With twelve coders in Div1 solving all three problems, this match was easier than some, but not without its difficulties. <tc-webtag:handle coderId="277659" context="algorithm"/> was able to come up with two successful challenges to pass <tc-webtag:handle coderId="8355516" context="algorithm"/> and take 3rd in the match.
      </td>
      <td class="newsPhoto"><img src="/i/m/Ryan_mug.gif" /><br>by <tc-webtag:handle coderId="284007" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=match_editorials&d2=srm272">full story</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505786" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/pressroom.gif" alt="Press Releases & Articles" border="0" /><br>11.21.05<br>9:00 AM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=pressroom&d2=pr_112105">Component Competition Winnings Surpass $1 Million</A></span><br><br>
      Contributions to TopCoder Software Competitions and Projects Show Attractive Returns for Global Programming Community from Countries Including China, Russian Federation and Romania As Royalty Payments Grow.
      <br><br>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
       <A href="/tc?module=Static&d1=pressroom&d2=pr_112105">full story</A>&#160;|&#160;
       <tc-webtag:forumLink forumID="505831" message="discuss this" />&#160;|&#160;
       <A href="/tc?module=Static&d1=pressroom&d2=pr_archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/employment.gif" alt="Employment Opportunities" border="0" /><br>11.18.05<br>5:10 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=contracting&d2=msn">MSN chat session scheduled for SRM 272</A></span><br><br>
      MSN will be in the Arena Applet at 11:00 AM EST on 11/18 just before SRM 272 to discuss working for MSN.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=contracting&d2=msn">job openings</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505830" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_employment">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/alg.gif" alt="Algorithm Competition News" border="0" /><br>11.17.05<br>6:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle">$5,000 prize purse and iPod raffle per match for SRMs <A href="/?RoundId=8070&t=schedule&c=srm">273</A>, <A href="/?RoundId=8073&t=schedule&c=srm">276</A>, <A href="/?RoundId=8076&t=schedule&c=srm">279</A>, sponsored by <A href="/tc?module=Static&d1=sponsors&d2=sap">SAP</A></span><br><br>
      Compete in any of these SRM's sponsored by SAP for a chance to win cash prizes.  There's also a raffle for an iPod.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <tc-webtag:forumLink forumID="505828" message="discuss this" />&#160;|&#160;
      <A href="/tc?module=Static&d1=home&d2=news_archive_alg">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/alg.gif" alt="Algorithm Competition News" border="0" /><br>11.14.05<br>3:20 PM</td>
      <td class="newsTextCell"><span class="newsTitle">$5,000 prize purse per match for SRM <A href="/?RoundId=8069&t=schedule&c=srm">272</A>, <A href="/?RoundId=8074&t=schedule&c=srm">277</A>, <A href="/?RoundId=8081&t=schedule&c=srm">284</A>, sponsored by <A href="/tc?module=Static&d1=contracting&d2=msn">MSN</A></span><br><br>
      Compete in any of these SRM's sponsored by MSN for a chance to win cash prizes.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <tc-webtag:forumLink forumID="505827" message="discuss this" />&#160;|&#160;
      <A href="/tc?module=Static&d1=home&d2=news_archive_alg">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/employment.gif" alt="Employment Opportunities" border="0" /><br>11.14.05<br>12:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=contracting&d2=msn">MSN is hiring TopCoders</A></span><br><br>
      "YOU are the individuals who possess the ability to solve the technical challenges of the future..."
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=contracting&d2=index">see all available jobs</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="505826" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_employment">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/alg.gif" alt="Algorithm Competition News" border="0" /><br>11.11.05<br>5:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=507907&mc=1#516943">Upgraded Compiler Machines</A></span><br><br>
      We've upgraded the compiler machines we use in the algorithm arena to new 3.6Ghz P4 machines. Everyone should now experience signficantly faster compile times.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
      <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=507907&mc=1#516943">discuss this</A>&#160;|&#160;
      <A href="/tc?module=Static&d1=home&d2=news_archive_alg">archive</A>
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
</table>

<br><br>
