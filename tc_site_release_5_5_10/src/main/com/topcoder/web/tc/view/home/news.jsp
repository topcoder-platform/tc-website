<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<table border="0" cellspacing="0" cellpadding="0" width="525">
<tr>
    <td class="newsTitle" align="right" colspan="2"><i>TopCoder News</i></td>
</tr>

<%----------------------------
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/feature.png" alt="Component Competition News" border="0" /><br>11.29.06<br>6:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
        <A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">New Listings in the Component Record Book</A>
        </span><br><br>
      There are new records for 
        Best Average Component Contest Score, 
        Most Submission Reviews, 
        Highest Rating Point Gain, 
        Impressive Debuts, 
        Consecutive Winnings, 
        Consecutive 1st or 2nd place, 
        and Consecutive Rating Increase.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">details</A> | 
         <tc-webtag:forumLink forumID="506192" message="discuss this" /> | 
         <A href="/tc?module=Static&d1=home&d2=news_archive_comp">archive</A>
   </td></tr>
----------------------------%>
<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/alg.png" alt="Algorithm Competition News" border="0" /><br>12.04.06<br>5:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=ViewSurvey&sid=11060">Arena Skin Contest Vote</A></span><br><br>
      The 5 finalists in our Studio contest to redesign the TopCoder Arena are ready, and now YOU pick the winner.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=ViewSurvey&sid=11060">vote</A> | 
         <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=ThreadList&forumID=23">discuss this</A> | 
         <A href="/tc?module=Static&d1=home&d2=news_archive_alg">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/marathon.png" alt="Marathon Match News" border="0" /><br>12.04.06<br>5:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/longcontest/?module=ViewOverview&rd=10649">Intel&#174; Multi-Threading Competition 11 Results</A>
      </span><br><br>
      The Intel&#174; Multi-Threading Competition 11 results are in. Congratulations to the first place winner, <tc-webtag:handle coderId="7504863" />.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/longcontest/?module=ViewOverview&rd=10649">results</A> | 
         <tc-webtag:forumLink forumID="506179" message="discuss this" /> | 
         <A href="/tc?module=Static&d1=home&d2=news_archive_long">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/tournament.png" alt="Tournament News" border="0" /><br>12.04.06<br>2:30 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
        <A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">The 2007 TopCoder High School Tournament</A></span><br><br>
The inaugural installment of the TopCoder High School Tournament is
coming to Purdue University! The tournament will bring together some of
the most talented high school students in a heated battle for bragging
rights and scholarships worth at least $50,000. Registrations starts
February 13, 2007. </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">full story</A> | 
        <tc-webtag:forumLink forumID="506199" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/analysis.png" alt="Problem Set & Analysis" border="0" /><br>12.01.06<br>2:15 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm21">TCHS SRM 21 - Problem Set & Analysis</A></span><br><br>
In total there were 278 submissions for HS SRM 21 by 148 members. 
Continuing his impressive performance, <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> 
enjoyed another HS SRM win with 1708.72 points.
      </td>
      <td class="newsPhoto"><img src="/i/m/zhuzeyuan_big2.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="19929536" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm21">full story</A> | 
        <tc-webtag:forumLink forumID="506043" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/pressroom.png" alt="Press Releases & Articles" border="0" /><br>12.01.06<br>NOON</td>
      <td class="newsTextCell"><span class="newsTitle"><A href="/pdfs/press_room/success200612.pdf">Maverick Rules for Success</A> [PDF]</span><br><br>
        <div style="float: right; padding-left: 5px;"><img src="/i/pressroom/success_logo.png" width="67" height="21" alt="Success Magazine" border="0" /></div>
      "Our panelists hail from a wide range of industries, but they agree on a critical element of success in the 21st century: You can't do big things with your company or career if you're content with doing things a little better than everyone else."
      </td>
   </tr>
   <tr><td class="newsLinksCell">
       <A href="/pdfs/press_room/success200612.pdf">full story</A> | 
       <tc-webtag:forumLink forumID="506198" message="discuss this" /> | 
       <A href="/tc?module=Static&d1=pressroom&d2=art_archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/analysis.png" alt="Problem Set & Analysis" border="0" /><br>12.01.06<br>11:05 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm328">SRM 328 - Problem Set & Analysis</A></span><br><br>
        More than 1,000 coders took the opportunity to practice their algorithmic skills and, with several targets competing, SRM 328 was bound to be an exciting event.
      </td>
      <td class="newsPhoto"><img src="/i/m/_efer__big.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="8593420" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=match_editorials&d2=srm328">full story</A> | 
        <tc-webtag:forumLink forumID="506003" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
    <tr>
        <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/feature.png" alt="Educational Content" border="0" /><br>12.01.06<br>10:30 AM</td>
        <td class="newsTextCell">
            <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
            <td valign="top"><span class="newsTitle">
            <A href="/tc?module=Static&d1=features&d2=120106">TopCoder @ Work: Professional Ethics</A>
            </span><br><br>
            By providing near limitless flexibility and unparalleled access to resources, technology has lubricated the downward slide of ethics in the workplace. However, it's up to you to transcend distractions and figure out your own ethical standards: what is right, what is wrong, and what is fair.</td>
            <td class="newsPhoto"><img src="/i/m/timmac_big.jpg"  alt="" width="55" height="61"/>&#160;<img src="/i/m/rhudson_big.jpg"  alt="" width="55" height="61"/><br>by 
            <tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /></td></tr></table>
        </td>
    </tr>
    <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=features&d2=120106">full story</A> | 
        <tc-webtag:forumLink forumID="506196" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=features&d2=archive">archive</A>
    </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/general.png" alt="General Competition News" border="0" /><br>12.01.06<br>9:30 AM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=Static&d1=calendar&d2=jan_07">Events Calendar updated through May 2007</A>
      </span><br><br>
      See what's happening in the coming months. 
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=calendar&d2=jan_07">view</A> | 
         <tc-webtag:forumLink forumID="506197" message="discuss this" /> | 
         <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
    <tr>
        <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/feature.png" alt="Educational Content" border="0" /><br>11.28.06<br>4:10 PM</td>
        <td class="newsTextCell">
            <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
            <td valign="top"><span class="newsTitle">
            <A href="/tc?module=Static&d1=features&d2=112806">Digital Run Stage 2: Going for the win</A>
            </span><br><br>
            Over the course of just ten weeks of the stage, <tc-webtag:handle coderId="287614" context="design"/> competed on 35 components, winning 28 and taking second place on 7. Here, he tells us how he did it.</td>
            <td class="newsPhoto"><img src="/i/m/argolite_big.jpg"  alt="" width="55" height="61"/><br>by 
            <tc-webtag:handle coderId="287614" context="design"/></td></tr></table>
        </td>
    </tr>
    <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=features&d2=112806">full story</A> | 
        <tc-webtag:forumLink forumID="506190" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=features&d2=archive">archive</A>
    </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/analysis.png" alt="Problem Set & Analysis" border="0" /><br>11.27.06<br>11:30 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=match_editorials&d2=srm327">SRM 327 - Problem Set & Analysis</A></span><br><br>
        After winning the TCCC '06, <tc-webtag:handle coderId="10574855" context="algorithm"/> took his hand at writing the problems for SRM 327. Unfortunately he stumbled onto a trap that has befallen other algorithm greats before.
      </td>
      <td class="newsPhoto"><img src="/i/m/Ryan_big.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="284007" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=match_editorials&d2=srm327">full story</A> | 
        <tc-webtag:forumLink forumID="506002" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/analysis.png" alt="Problem Set & Analysis" border="0" /><br>11.27.06<br>11:30 AM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_10">Intel&#174; Multi-Threading 10 - Analysis</A></span><br><br>
        Graph coloring is a widely studied subject, which made this Intel Multi-Threaded competition very interesting because a wide variety of algorithms could be used to approximate this NP complete problem.
      </td>
      <td class="newsPhoto"><img src="/i/m/JacoCronje_big.jpg" alt="" width="55" height="61"/><br>by <tc-webtag:handle coderId="283329" /></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/longcontest/?module=Static&d1=match_editorials&d2=intel_mtcs_10">full story</A> | 
        <tc-webtag:forumLink forumID="506148" message="discuss this" /> | 
        <A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/v2/analysis.png" alt="Problem Set & Analysis" border="0" /><br>11.21.06<br>4:30 PM</td>
      <td class="newsTextCell">
      <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
      <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm20">TCHS SRM 20 - Problem Set & Analysis</A></span><br><br>
        By now, HS SRMs are well underway, with incredibly gifted high schoolers from around the world competing
        regularly, and HS SRM 20 was no exception.
      </td>
      <td class="newsPhoto"><%--<img src="/i/m/gevak_big2.jpg" alt="" width="55" height="61"/><br>--%>by <tc-webtag:handle coderId="343655" context="algorithm"/></td></tr></table>
      </td>
   </tr>
   <tr><td class="newsLinksCell">
        <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=hs_srm20">full story</A> | 
        <tc-webtag:forumLink forumID="506042" message="discuss this" /> | 
        <A href="/tc?module=Static&d1=match_editorials&d2=archive">archive</A>
   </td></tr>

