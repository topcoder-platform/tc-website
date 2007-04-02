<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/general.png" alt="General TopCoder News" border="0" /><br>04.02.07<br>2:00 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle">
        <A href="/to/">Predict the homepage redesign winner</A>
        </span><br><br>
        For TopCoder Studio competitions, we often face the question "Which submission is the best?"  In the spirit of experimentation, we're going to try out a new winner selection format, and it involves the community more than ever before.
        </td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/to/">details</A> | 
        <tc-webtag:forumLink forumID="514973" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
   </td></tr>
   
<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>03.30.07<br>5:20 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle">
        <A href="/tc?module=SimpleStats&d1=tournaments&d2=tco07&d3=algorithm&&d4=qualification&c=tco07_alg_qual&trans=true">TCO07 Algorithm Qualification Round 1 advancers</A>
        </span><br><br>
        The TCO07 Algorithm Qualification Round 1 results are ready.
        </td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=SimpleStats&d1=tournaments&d2=tco07&d3=algorithm&&d4=qualification&c=tco07_alg_qual&trans=true">details</A> | 
        <tc-webtag:forumLink forumID="514899" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>
   
<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>03.30.07<br>5:00 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle">
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Qualification Round 2 set for March 31</A></span><br><br>
        Qualification Round 2 of the TCO07 Algorithm Competition, brought to you by AOL, is set for 1:00 PM EDT on March 31.
        </td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">full story</A> | 
        <tc-webtag:forumLink forumID="514899" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>
   
<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/general.png" alt="General TopCoder News" border="0" /><br>03.30.07<br>10:00 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle">
        <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=Thread&threadID=363">Bug in the voting results</A>
        </span><br><br>
On February 27, we accidentally introduced a bug into our code that caused it to display the wrong results for any votes using the Schultz voting system. As a result of this mistake, we displayed incorrect results for the TopCoder Badges, Studio Badges, and Press Room Redesign contests. We have fixed the bug and the correct results are now displayed.
<br><br>
<strong>TopCoder Badges</strong> (<A href="/tc?module=SurveyResults&sid=16491">correct results</A> | <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/i/misc/tcbadges.png">incorrect results</A>)
<br><strong>Studio Badges</strong> (<A href="/tc?module=SurveyResults&sid=16380">correct results</A> | <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/i/misc/studiobadges.png">incorrect results</A>)
<br><strong>Press Room Badges</strong> (<A href="/tc?module=SurveyResults&sid=16651">correct results</A> | <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/i/misc/pressroom.png">incorrect results</A>)
<br><br>
Unfortunately the damage has been done, and we announced incorrect winners for those contests based on inaccurate data. We offer our sincerest apologies to the competitors who we have affected with this bug. As a measure of good faith, we will pay prizes to both the incorrect and correct contest winners. Obviously the real winners deserve to have their designs implemented, so those are the designs we will use.
<br><br>
Again, we are very sorry for our mistake and we would be happy to answer any questions about this situation.
        </td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=Thread&threadID=363">details</A> | 
        <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=Thread&threadID=363">discuss this</a> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
   </td></tr>
   
<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/feature.png" alt="Feature Article" border="0" /><br>03.29.07<br>2:00 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="tc?module=Static&d1=features&d2=032907">A Crash Course in Relational Databases, Part 2</A></span><br><br>
With the information in the first part of this article, you should have been able to get your own Oracle Express Edition database up and running, and update it with TopCoder's active algorithm competitor data. In Part 2, we'll look at more of the key concepts and terms that will help you manage and maintain your database.
        </td>
      <td class="newsPhoto"><img src="/i/m/dcp_big2.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="21684580" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="tc?module=Static&d1=features&d2=032907">full story</A> | 
        <tc-webtag:forumLink forumID="514866" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=features&d2=archive">archive</A>
   </td></tr>
   
<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/general.png" alt="General TopCoder News" border="0" /><br>03.29.07<br>11:30 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle">
        <A href="/tc?module=ViewSurvey&sid=16690">Vote for the new TopCoder video portal</A></span><br><br>
        TopCoder is building a new web video portal where viewers will be able to access breaking news, interesting instructional segments and fun human interest stories. But first, we need you to vote for the new name and logo!
        </td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=ViewSurvey&sid=16690">full story</A> | 
        <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=Thread&threadID=354">discuss this</a> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
   </td></tr>
   

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>03.28.07<br>5:20 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle">
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">TCO07 Algorithm Qualification Round 1 set for March 29</A></span><br><br>
        Qualification Round 1 of the TCO07 Algorithm Competition, brought to you by AOL, is set for 7:00 AM EDT on March 29.
        </td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule">full story</A> | 
        <tc-webtag:forumLink forumID="514899" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>
   
<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>03.28.07<br>9:00 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle">
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=byes">TCO07 Algorithm Qualification Byes</A>
        </span><br><br>
        The following competitors get a bye for the qualification round and advance right to Round 1.
        </td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=byes">full story</A> | 
        <tc-webtag:forumLink forumID="514899" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>03.27.07<br>5:00 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">DRW Trading chat session scheduled for SRM 344</A></span><br><br>
        Join representatives from DRW Trading in the Arena at 10:00 AM EDT on March 28 and learn more about the company and its job opportunities.</td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw">full story</A> | 
        <tc-webtag:forumLink forumID="514387" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>03.27.07<br>4:00 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">Component Catalog, T-shirt contests now open at Studio</A></span><br><br>
        Five TCO-eligible contests are now open at Studio, including four T-shirt designs and a contest to redesign TopCoder's Component Catalog.</td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewActiveContests">full story</A> | 
        <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=Category&categoryID=3">discuss this</a> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>03.27.07<br>3:00 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2070">Win a trip to blog from the TCO</A></span><br><br>
        We're looking for two bloggers who can convey the thrills, chills, and behind-the-scenes experience of attending this year's TCO. This time around, we're opening the floodgates to all manner of creative expression and running the contest through Studio.</td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&ct=2070">full story</A> | 
        <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=ThreadList&forumID=43">discuss this</a> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>03.27.07<br>12:30 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about">TCO07 Algorithm registration ends March 27</A></span><br><br>
        Registration for the 2007 TopCoder Open Algorithm Competition closes at 5:00 PM EDT on Tuesday, March 27. If you haven't registered yet, don't wait any longer!</td>
      </tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about">full story</A> | 
        <tc-webtag:forumLink forumID="514380" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

