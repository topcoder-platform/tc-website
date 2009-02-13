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
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tc.gif" alt="General Competition News" border="0" /><br>09.18.06<br>4:00 PM</td>
      <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=Static&d1=pressroom&d2=art_091806">In memoriam: Victor_lxd</A>
      </span><br><br>
      We are deeply saddened to share the news that TopCoder member Xiao Dong Li - <tc-webtag:handle coderId="13377493" /> - passed away last week 
      at the age of 26. If you wish to send a gift to help Victor's family, you may do so directly or by donating a portion of your TopCoder 
      winnings&#8230;
   </tr>
   <tr><td class="newsLinksCell">
         <A href="/tc?module=Static&d1=pressroom&d2=art_091806">view</A>&#160;|&#160;
         <tc-webtag:forumLink forumID="506118" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>09.18.06<br>12:10 PM</td>
    <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=ViewSurvey&sid=219">Vote for the TCCC t-shirt quote</A></span><br><br>
      Rate these 5 quotes, and the winner goes on the TCCC06 t-shirt!
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=ViewSurvey&sid=219">vote</A> | 
    <A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=512330">discuss this</A> | 
    <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/education.gif" alt="Educational Content" border="0"/><br>09.18.06<br>11:00 AM</td>
    <td class="newsTextCell">
        <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
            <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&amp;d1=features&amp;d2=091806">Computational geometry with complex numbers</A></span><br><br>
               Computational geometry problems appear frequently in Topcoder contests and a series of articles has already been written on the subject. However, 
               competitors who have tried to implement these algorithms (particularly in C++) will no doubt have been frustrated&#8230;</td>
            <td class="newsPhoto"><img src="/i/m/bmerry_mug.gif" alt="" /><br>
            by <tc-webtag:handle coderId="251074" /></td></tr>
        </table>
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&amp;d1=features&amp;d2=091806">article</A> | 
    <tc-webtag:forumLink forumID="506116" message="discuss this"/> | 
    <A href="/tc?module=Static&d1=features&d2=archive">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>09.18.06<br>11:00 AM</td>
    <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa">NSA SRM 319 chat session</A></span><br><br>
      NSA will be in the arena at 8:00 PM just prior to SRM 319 to discuss working at NSA.
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=nsa">view</A> | 
    <tc-webtag:forumLink forumID="504999" message="discuss this"/> | 
    <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>09.18.06<br>9:00 AM</td>
    <td class="newsTextCell"><span class="newsTitle"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=pickme_contest">TCCC06 "Pick Me" Contest</A></span><br><br>
      Did you miss out on making it as a TCCC finalist? Still want to see the finals in San Diego anyway? Here's your chance!
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=pickme_contest">view</A> | 
    <tc-webtag:forumLink forumID="506113" message="discuss this"/> | 
    <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
</td></tr>

<%--------------------------------------------------------%>
   <tr>
      <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/comp.gif" alt="Component Competition News" border="0" /><br>09.14.06<br>10:30 PM</td>
      <td class="newsTextCell"><span class="newsTitle">Design and Development Submission Downloads</span><br><br>
            You can now download submissions from the Contest Details page for any component design or development contest.
      </td>
   </tr>
   <tr><td class="newsLinksCell">
         <tc-webtag:forumLink forumID="506115" message="discuss this" />&#160;|&#160;
         <A href="/tc?module=Static&d1=home&d2=news_archive_comp">archive</A>
   </td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/education.gif" alt="Educational Content" border="0"/><br>09.14.06<br>4:25 PM</td>
    <td class="newsTextCell">
        <table cellspacing="0" cellpadding="0" class="newsPhotoTable"><tr>
            <td valign="top"><span class="newsTitle"><A href="/tc?module=Static&amp;d1=features&amp;d2=091406">Introduction to OpenMP, Part 2</A></span><br><br>
               In Part 1, we looked at an overview of multi-threading, introduced OpenMP, and began to review its directives. Part 2 continues with a look at the reduction directive.</td>
            <td class="newsPhoto">by
                <tc-webtag:handle coderId="21464956" /></td></tr>
        </table>
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&amp;d1=features&amp;d2=091406">article</A> | 
    <tc-webtag:forumLink forumID="506105" message="discuss this"/> | 
    <A href="/tc?module=Static&d1=features&d2=archive">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
  <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tc.gif" alt="General Competition News" border="0" /><br>09.14.06<br>3:00 PM</td>
  <td class="newsTextCell"><span class="newsTitle">
  <A href="/tc?module=Static&d1=collegetour&d2=description">2006 TopCoder College Tour continues</A>
  </span><br><br>
  TopCoder will be touring college campuses during the remainder of 2006 and early 2007 to promote TopCoder competitions, both Component and 
  Algorithm, and to grow membership. We're looking for collegiate CS students who are interested in hosting TopCoder on campus for an evening 
  of problem solving, food, prizes and fun.
</tr>
<tr><td class="newsLinksCell">
	 <A href="/tc?module=Static&d1=collegetour&d2=description">view</A>&#160;|&#160;
	 <tc-webtag:forumLink forumID="506114" message="discuss this" />&#160;|&#160;
	 <A href="/tc?module=Static&d1=home&d2=news_archive_tc">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>09.13.06<br>4:15 PM</td>
    <td class="newsTextCell"><span class="newsTitle">
      TCCC06 Algorithm Sections: <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionA">A</A>, <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionB">B</A>, and <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionC">C</A>
      </span><br><br>
      Here are the section assignments for Sections <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionA">A</A>, <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionB">B</A>, and <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionC">C</A>.
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionA">Section A</A> | 
    <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionB">Section B</A> | 
    <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=alg_sectionC">Section C</A> | 
    <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>09.13.06<br>11:45 AM</td>
    <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=SimpleStats&d1=tournaments&d2=tccc06&d3=alg_qualification&c=tccc06_alg_qual&trans=true">TCCC06 Algorithm Qualification Round 3 Results</A>
      </span><br><br>
      The results are in for the third TCCC06 Algorithm Qualification Round.
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=SimpleStats&d1=tournaments&d2=tccc06&d3=alg_qualification&c=tccc06_alg_qual&trans=true">results</A> | 
    <tc-webtag:forumLink forumID="506103" message="discuss this" /> | 
    <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>09.13.06<br>11:30 AM</td>
    <td class="newsTextCell"><span class="newsTitle">
      <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg_chat_082406">Bloomberg SRM 317 chat session transcript</A>
      </span><br><br>
      Bloomberg recently held a chat session just prior to SRM 317 to discuss working at Bloomberg.  Check it out.
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg_chat_082406">view</A> | 
    <tc-webtag:forumLink forumID="506076" message="discuss this"/> | 
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">archive</A>
</td></tr>

<%--------------------------------------------------------%>
<tr>
    <td class="newsIconCell" rowspan="2"><img src="/i/home/icons/tournie.gif" alt="Tournament News" border="0"/><br>09.12.06<br>1:45 PM</td>
    <td class="newsTextCell"><span class="newsTitle">
      TCCC Registration Ends This Week
      </span><br><br>
      Registration for the 2006 TopCoder Collegiate Challenge ends this week. <A href="/tc?module=TCCC06ViewAlgoReg">Algorithm competition registration</A> closes September 12 at 6:00 PM EDT, and <A href="/tc?module=TCCC06ComponentTerms">Component competition registration</A> ends Thursday, September 14 at 9:00 AM EDT.<br><br>Don’t delay - register now!
    </td>
</tr>
<tr><td class="newsLinksCell">
    <A href="/tc?module=TCCC06ViewAlgoReg">Algorithm Registration</A> | 
    <A href="/tc?module=TCCC06ComponentTerms">Component Registration</A> | 
    <A href="/tc?module=Static&d1=home&d2=news_archive_tournie">archive</A>
</td></tr>
