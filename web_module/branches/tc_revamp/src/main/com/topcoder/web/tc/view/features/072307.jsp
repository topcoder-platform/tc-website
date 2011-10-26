<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
}
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="516686" message="Discuss this article" />
</div>

<span class="bigTitle">What happened in Vegas: TCO07 winners tell all</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/mohit_ranka_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21201116" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>
--%>
<br clear="all">

<p>We asked the five winners of the 2007 TopCoder Open five simple questions each to find out just what the winning experience was like. Here's what they told us:</p>
<p><span class="bodySubtitle">Algorithm Competition</span><br />
Winner: <tc-webtag:handle coderId="309453" context="algorithm"/></p>
<p><strong>Q: When did you realize you were going to win? </strong></p>
<p> A: I only realized it the exact moment I won. When my solution passed, I was going to be second anyways. Whether I would be first only depended on <tc-webtag:handle coderId="144400" context="algorithm"/>'s solutions. He expected them to be correct, but a small bug is easy to make. Fortunately... </p>
<p><strong>Q: What do you think was the one most important thing that made the difference and helped you win? </strong></p>
<p> A: Chill out and relax... The night before the final I played some poker in the Mirage poker room until around 2:00 AM. I slept in until about 10:00, got up, enjoyed a good breakfast and went to the AOL presentation. After a quick lunch, I spent half an hour swimming in the Mirage pool before going to the contest area and arrived there completely relaxed and not nervous at all. </p>
<p><strong>Q: What was the hardest part of the competition? </strong></p>
<p> A: Beating tough opponents such as <tc-webtag:handle coderId="144400" context="algorithm"/> and <tc-webtag:handle coderId="19849563" context="algorithm"/>. On the other hand, since I know they are much better than I am, I had nothing to lose. That might've helped. </p>
<p><strong>Q: If you had to do it again, what would you do differently? </strong></p>
<p> A: I would do nothing different apparently... I won! :) </p>
<p><strong>Q: What was it like to win? </strong></p>
<p> A: When <tc-webtag:handle coderId="144400" context="algorithm"/>'s solutions failed, I just couldn't believe I had just won. I was completely surprised by what just happened, but it felt great of course! </p>
<p>For a play-by-play view of the Algorithm Competition final round, check out <tc-webtag:handle coderId="10574855" context="algorithm"/>'s <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=blogs&d4=Petr09">blog</a>.</p>
<p><span class="bodySubtitle">Marathon Match Competition</span><br />
Winner: <tc-webtag:handle coderId="10600282" context="marathon"/></p>
<p><strong>Q: When did you realize you were going to win? </strong></p>
<p> A: After 3 hours I was almost certain I had no chance to win and my only aim was to be in the first four. After another 3 hours I was leading. However, I also ran out of simple ideas and was very anxious seeing others coding hard. 10 minutes before the deadline I saw that <tc-webtag:handle coderId="9987185" context="marathon"/> had given up and then I was pretty sure that I reached my goal - the first two. However, because of a very unstable scoring formula, I wasn't certain if I was going to win. My doubts were multiplied when I saw the first final results - <tc-webtag:handle coderId="269788" context="marathon"/> overtook <tc-webtag:handle coderId="21932422" context="marathon"/> and <tc-webtag:handle coderId="7459326" context="marathon"/> beat <tc-webtag:handle coderId="15803924" context="marathon"/>. Note that, if <tc-webtag:handle coderId="7459326" context="marathon"/> had beaten <tc-webtag:handle coderId="15803924" context="marathon"/> I could have been easily beaten by both <tc-webtag:handle coderId="261024" context="marathon"/> and <tc-webtag:handle coderId="9987185" context="marathon"/>. Therefore, it was a long couple of seconds when I was waiting for my final result to appear. </p>
<p><strong>Q: What  one thing  most helped you win? </strong></p>
<p> A: I decided to follow a simpler path (and one that was more appropriate for 8 hours of coding) than <tc-webtag:handle coderId="9987185" context="marathon"/> and I didn't have serious bugs like <tc-webtag:handle coderId="261024" context="marathon"/>. However, I still believe that the most important thing was to accelerate in a direction which is perpendicular to the gravitation in order to avoid planets. </p>
<p><strong>Q: What was the hardest part of the competition? </strong></p>
<p> A: To calm down and make the first reasonable submission. Moreover, it is really difficult to work on such projects without a debugger and the environment you are accustomed to. </p>
<p><strong>Q: If you had to do it again, what would you do differently? </strong></p>
<p> A: I would read the problem statement more carefully and make sure that I hadn't missed anything important as far as the problem and the visualizer were concerned. </p>
<p><strong>Q: How did it feel to win? </strong></p>
<p> A: NICE! The one thing I was astonished by was that only champions counted and the rest were just finalists. There were no runner-ups or third places. </p>
<p>For more on the final Marathon Match problem, read <tc-webtag:handle coderId="10600282" context="marathon"/>'s <a href="/longcontest/?module=Static&d1=match_editorials&d2=mm_tco07">editorial</a>. </p>
<p><span class="bodySubtitle">Component Design Competition</span><br />
Winner: <tc-webtag:handle coderId="152342" context="design"/></p>
<p><strong>Q: When did you realize you were going to win? </strong></p>
<p>A: On the second day of the competitions, when one of the reviewers (<tc-webtag:handle coderId="10348862" context="design"/>) accepted my appeals. </p>
<p><strong>Q: What one thing most helped you win? </strong></p>
<p>A: I am undecided on this one - maybe it was the schedule that let me work more on my submissions because one of the projects was during a week with a long weekend, or maybe it was the Digital Run that burned out <tc-webtag:handle coderId="287614" context="design"/> and kept <tc-webtag:handle coderId="252022" context="design"/> busy, or even more likely it was that unfortunate circumstances did not let <tc-webtag:handle coderId="119676" context="design"/> compete this year. </p>
<p><strong>Q: What was the hardest part of the competition? </strong></p>
<p>A: The first project was very hard - it was too large to fit in one week. </p>
<p><strong>Q: If you had to do it again, what would you do differently? </strong></p>
<p>A: I would introduce fewer features into projects in an attempt to chase the enhancement points. </p>
<p><strong>Q: What was it like to win? </strong></p>
<p>A: It was a big relief -- this was my fifth design competition, and I was going into it as the highest-rated competitor. There was a lot of pressure to win this one, and I was very glad that everything worked out so well for me.</p>
<p>Check out the final Component Design <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=desSummary">summary</a>, with an overview of the components and complete scores and wagers. </p>
<p><span class="bodySubtitle">Component Development Competition</span><br />
Winner: <tc-webtag:handle coderId="15214882" context="development"/></p>
<p><strong>Q: When did you realize you were going to win? </strong></p>
<p> A: I knew all the finalists were so outstanding that each had the opportunity to win. I felt confident from the very beginning, though, which encouraged me to do my best and not give up pursuing the championship. I felt that I could win before leaving for Las Vegas, but it was not until the last minute when my last appeal succeed,  and I jumped from 3rd place to 1st, that I realized my dream had come true. </p>
<p><strong> Q: What one thing most helped you win? </strong></p>
<p> A: The level of experience and technique among all the competitors was so close, I think the most important thing was my strong desire to win. To avoid being defeated, I had to make everything perfect. </p>
<p><strong> Q: What was the hardest part of the competition? </strong></p>
<p> A: The development itself was not hard at all -- what I needed to do was try not to make any careless mistakes. Besides this, it&rsquo;s better to have some improvements to distinguish your work from the other competitors. Luckily I succeeded on both counts. </p>
<p><strong> Q: If you had to do it again, what would you do differently? </strong></p>
<p> A: I didn&rsquo;t warm up quickly in my first two components, for each of which I spent only 4 days coding and the other 3 days doing nothing. This fault brought me some anxiety and almost made me lose but fortunately I managed to calm down and do well in my last component. </p>
<p><strong> Q: What was it like to win? </strong></p>
<p> A: Everybody should find that out for themselves. Keep learning, from books and other competitors, and never stop improving yourself. </p>
<p>Check out the final Component Development <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=devSummary">summary</a>, with an overview of the components and complete scores and wagers. </p>
<p><span class="bodySubtitle">Studio Design Competition</span><br />
Winner: <tc-webtag:handle coderId="10481546"/></p>
<p><strong>Q: When did you realize you were going to win? </strong></p>
<p> A: The rank list of studio design contest was announced in reverse order. When I saw that the 2nd through 7th place submissions were not mine, I knew I was winning. </p>
<p><strong>Q: What one thing  made the difference for you? </strong></p>
<p> A. I think it is experience. Thanks to TopCoder Studio, I did more designs within one year than I did in the previous ten years! </p>
<p><strong>Q: What was the hardest part of the competition? </strong></p>
<p> A: Jet lag is a big problem for me. I couldn't go to sleep at all during the night. When the final contest started &ndash; at about the time I usually go to bed at home -- I became too tired. Luckily, I persisted successfully, though I fell asleep for about 10 minutes at my desk. </p>
<p><strong>Q: If you had to do it again, what would you do differently? </strong></p>
<p>A:  I would reduce the radius of the rounded rectangles to 5px, and optimize the color style. The white area in the page seems to have a bit of glare, so I would like to make it darker. </p>
<p><strong>Q: What was it like to win? </strong></p>
<p> A: Dreams come true, absolutely. :) </p>
<p>Check out the TCO07 Studio Design Contest <a href="/tc?module=SurveyResults&sid=19040">final vote results</a>. </p>
<br>

<p>&nbsp;</p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
