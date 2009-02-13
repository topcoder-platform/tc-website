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
    <tc-webtag:forumLink forumID="516505" message="Discuss this article" />
</div>

<span class="bigTitle">An Interview with <tc-webtag:handle coderId="20812309" /></span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/dcp_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21684580" /><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">

<p>"I'm in awe."  Those were the words used by TopCoder member <tc-webtag:handle coderId="22651496" /> in describing <tc-webtag:handle coderId="20812309" />, one of the newest "targets" in algorithm competitions, and the first ever high school student to achieve such status.  His rating graphs show steady improvement over the course of his time at TopCoder.  Without a doubt, he has made his mark in regular TopCoder algorithm competitions as well as TCHS competitions.  In addition, he has achieved red status in both tracks, which is something that only a handful of competitors have been able to accomplish.</p>

<p>You might think that all this success came easily for <tc-webtag:handle coderId="20812309" />.  But the truth is that he has put a great deal of work into reaching his current level, typically practicing 20-30 hours per week, and sometimes over 40 hours.</p>

<p>In this interview, we'll get a chance to learn more about this incredible competitor and how he reached this remarkable achievement.  He'll also share some of his practice tips and offer helpful advice for members looking to improve their rating. </p>

<p><strong>What is your name?</strong></p>
<p>My name is Yang Yi.<br>
My handle comes from the Province I live in (AnHui) and my name.  I use this id everywhere on the Internet because "YangYi" is registered everywhere while "<tc-webtag:handle coderId="20812309" />" is always available.</p>

<p><strong>How did you get started in programming?</strong></p>
<p>When I was in primary school, I began experimenting a little with BASIC by copying code down to my computer and examining the program output. Later on, I learned the LOGO language at my school. LOGO is very funny; and I found myself spending a lot of time with it. After winning the LOGO city competitions for primary school kids, I decided to keep on programming and learn about Computer Science.</p>

<p><strong>How did you get started in programming competitions? </strong></p>
<p>As I mentioned above, there was an annual LOGO competition in my city. However it didn't involve real coding because it was an exam on paper.</p>
<p>Besides this one, my first "real" programming contest was the NOIP (National Olympiad in Informatics Partitional). I took part in it in the year of 2001.</p>

<p><strong>How did you learn about TopCoder?</strong></p>
<p>I dreamed of having a frequently held competition. TopCoder realized that dream. TopCoder competitions provide me with an excellent way to practice, compete, compare myself with others, see how I am improving, and so on.</p>

<p><strong>Which do you like the best, the TCHS competitions or SRM's, and why?</strong></p>
<p>The TCHS competitions, because the problems are easier to solve.</p>

<p><strong>How did it feel to win SRM 345?</strong></p>
<p>It was very, very surprising. I did the 250 and 500 point problems quickly, and was very lucky to find a simple challenge case that many people didn't care about (3 chests, each with 3 stones). With it, I got 250 challenge points, and those points allowed me win to the SRM. </p>
<p>I used to think I must finish all the problems, correctly and quickly. But I didn't solve the 1000-pointer in SRM 345, so it was somewhat magical to win that contest. That fact that the challenge points made the difference made it really magical.</p>

<p><strong>How important do you think math skills are to doing well in SRM's?</strong></p>
<p>Math skills (including graph theory, algorithms, number theory, etc.) are half of programming. Coding is the other half.</p>

<p><strong>What is the hardest TopCoder problem you have ever solved during a competition?</strong></p>
<p>I can't remember.  It seems that I rarely do the problems nobody else can solve (i.e. I can only solve easier problems.) </p>

<p><strong>How do you prepare for an SRM? </strong></p>
<p>I'm not so strange.  However, I usually stop working on other things several hours before the SRM (which helps ensure that I won't get too tired during the SRM). And I usually keep every program closed during the contest, except the arena (how can I compete without it?).</p>

<p><strong>How many hours do you spend practicing each week?</strong></p>
<p>I'm not sure. Sometimes 40 hours or more, but sometimes no practice at all (like this week).  If you want an average time, maybe it's 20-30 hours per week.</p>

<p><strong>Did programming always come naturally for you or did you struggle a lot at first?</strong></p>
<p>Both. I saw programming as a kind of "playing" when I was young because I felt it was very interesting. And I spent much time on it. Being a middle school student, I found there were many things to learn before I could master programming. So I then worked hard on things like algorithms, data structures and so on.</p>

<p><strong>When practicing, do you use practice problems from TopCoder or do you use problems from other sites (UVA, SPOJ, etc.)?  </strong></p>
<p>I used to use ZJU (http://acm.zju.edu.cn) to practice (WishingBone was the Administrator). However I prefer the sites like URAL (http://acm.timus.ru ) and SGU (http://acm.sgu.ru).  To Petr's fans: there are 2 contests of his at the http://acm.sgu.ru site.  I also use SPOJ.  I did a few problems from UVA, but the number of problems in UVA is so huge&#8230;</p>

<p><strong>Did you have any teachers that helped you to develop the skills needed for programming competitions, or did you learn mostly on your own?</strong></p>
<p>Yes I have a teacher, but I learned more by myself than from my teacher. And the help from my friends (for example, Tang Wenbin, see question 20) has been really great.</p>

<p><strong>When practicing, what methods do you use?  Do you just try to solve all the problems in a TopCoder practice room, do you target specific skills to practice (DP, geometry, etc.) and find problems that deal with those specific skills? </strong></p>
<p>I usually don't spend a lot of time on extremely hard problems because failing on a problem which doesn't look doable will just make me very frustrated. On the other hand, I used to try to do all the problems I could. That way, I could improve all kinds of coding skills. However it takes time. So I gradually switched to only doing the problems that look useful for helping me improve.</p>
<p>Usually, I don't try to do problems pertaining to specific knowledge. But I will do so after learning something new, to help develop that skill.</p>

<p><strong>If you've done other programming competitions, how do they compare with TopCoder?</strong></p>
<p>OI contests and SRMs are of quite different styles. Maybe the major similarity between them is that their problems are usually very algorithmic. However, OI emphasizes the ability to think out a complex algorithm and realize it, while SRMs are more about coding speed and precision. </p>
<p>Compared with ICPC-style contests, SRMs are a mini version of ICPC. But SRMs aren't judged during the contest (a bit like OI), and they have the "Challenge" phase, which makes the contest more exciting and dramatic.</p>

<p><strong>In your opinion, what are the most important skills someone needs to do well in TopCoder SRMs?</strong></p>
<p>First, the coding precision. I mean, the ability to get the code to really work. Without the correctness, none of the other skills really matter.</p>
<p>Then the algorithm ability and the coding speed are both useful. One reduces the time in thinking, and the other reduces the time of coding.</p>
<p>And another useful skill is the debugging skill. It not only reduces the annoying time of debugging, but also strengthens your performance in the Challenge Phase. However I am not good at challenging (except for the magical SRM 345).</p>

<p><strong>When doing an SRM, do you always open the problems in order (i.e. easy, medium, then hard) or do you sometimes open the problems in a different order?</strong></p>
<p>I always open them in order. Maybe opening them in a different order is a good strategy. However, I usually need some warmup before doing the 500 pointer or the 1000 pointer, and the 250 pointer is a great "practice".  Opening problems in order isn't always the best choice, but often it is.</p>
<p>Of course, sometimes the "easiest" problem is actually hard. If I find I can't solve this problem in time, I may switch to the next problem.</p>

<p><strong>What are your plans when you finish high school (what areas do you plan to study in college)?</strong></p>
<p>I haven't thought about it very much. I have another year before I finish high school. So I can think more about it in the future. I will probably go into Computer Science. </p>

<p><strong>What interests do you have outside of TopCoder (i.e. do you play sports, what music do you like, do you have other types of hobbies, etc.)?</strong></p>
<p>I like many kinds of sports, but am good at none of them.</p>

<p><strong>Who has been the single most important influence on you?</strong></p>
<p>Tang Wenbin (<tc-webtag:handle coderId="15206296" />). He introduced TopCoder SRMs to me (although I registered before, I didn't realize what SRMs were like). In the year of 2006 we practiced together in a team named "Himalaya Zerglings" (with Zhu Chenguang), and we took part in many ICPC-like contests, including the IPSC 2006.</p>

<p><strong>What advice do you have for lower rated TopCoder members on how they can improve?</strong></p>
<ol>
	<li>Spend some time practicing different kinds of problems, and do more contests. Doing a contest is completely different from doing a list of problems. </li>
	<li>Be calm in the contests. This is a weekly held contest. If you fail in this contest, you can get your rating back in another contest.</li>
	<li>Don't forget what Petr said:  "Do not spend all your time on training or studying - this way you will probably become very exhausted and unwilling to compete more. Whatever you do - have fun. Once you find programming is no fun anymore - drop it. Play soccer, find a girlfriend, study something not related to programming, just live a life - programming contests are only programming contests, and nothing more. Don't let them become your life - for your life is much more interesting and colorful."</li>
</ol>

<p><strong>Do you get nervous before SRMs and what methods do you use to stay calm?</strong></p>
<p>Doing SRMs is a very good way of practice.  Because of their high frequency and the method of calculating rating, everyone can experience success and failure in these contests. And most of the SRMs are not decisive (in terms of drastically affecting your rating or having to achieve some rank to qualify, as with the ACM-ICPC regionals, for example), so why should I feel nervous before them? </p>
<p>However, some SRMs do make me nervous. For example, at the time of SRM 352, my rating was 2993 and I was a little nervous to be so close to becoming a target. And I also got a little nervous in the Online Round of the TCHS tournament. </p>
<p>Maybe it's the "side-effect" of being under 18, as I don't get any cash prize from the SRMs. So whether it's a money contest or not doesn't have much effect on me (however, in the money contests I often face more powerful opponents). </p>
<p>What is "the method used to stay calm"?  If you think you're nervous, you'll find yourself really nervous. It's just a psychological state. I think the best way to stay calm is to try not to think about being "nervous", but just focus on the problems.</p>

<p><strong>How does it feel to be a "target" and one of the top ranked competitors in the world?</strong></p>
<p>It's glorious for me!  I'm very happy to join the targeteers. Maybe I'll drop below 3000 soon, maybe not. But that's not important. Becoming a target proved my skill in the SRMs.  It also proved I can do something well after some hard work and failure. Because I can do well in SRMs, I may also be able do other things well. That's a great benefit to my confidence in doing anything. </p>
<p>However, doing SRMs isn't everything, that is, I still have many things to do. While I'm good at coding and thinking the algorithmic problems, I may be not so good at other things. The target means I did well, but what I need is to be even better at other things.</p>

<p><strong>What are your long-term goals with programming competitions?</strong></p>
<p>Programming competitions are so much fun, and they increased my interest and knowledge in Computer Science. That may be the most important advantage of Programming Contests. I hope I can go abroad by taking part in one of the big tournaments, as that would be a great experience for me. </p>
<p>Besides SRMs, I may try other contests (Design/Development/Studio/Blog/&#8230;) in the future. Each contest will have its own joy, and it would be better if I can do something different.</p>
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
