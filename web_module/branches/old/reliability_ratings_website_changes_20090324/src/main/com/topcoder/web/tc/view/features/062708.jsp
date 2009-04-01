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
    <a href="/tc?module=Static&amp;d1=features&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <tc-webtag:forumLink forumID="521878" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Know your hero: yuhch123</span>
<br /><br />
<div class="authorPhoto">
    <img src="/i/m/innocentboy_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22419265" context="algorithm" /><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>Yu Huacheng, known at TopCoder by his handle <tc-webtag:handle coderId="14768757" context="algorithm" />, has the honor of being the second target after <tc-webtag:handle coderId="20812309" context="algorithm" /> while still studying in Hangzhou No. 2 high school. He has also been awarded a gold medal at both the CNOI 2007 (Chinese National Olympiad in Informatics) and the Hua Luogeng Cup (a popular mathematics contest in China). In addition, he's also a member of the Chinese National Training Team for the IOI. Yu seems to have good company, both on TopCoder and in China; all 3 targets from China at the time of this interview - <tc-webtag:handle coderId="19849563" context="algorithm" />, <tc-webtag:handle coderId="15206296" context="algorithm" />, and <tc-webtag:handle coderId="14768757" context="algorithm" /> are from the same Zhejiang province. Let's get to know him better in his own words.</p>

<br />
<p><strong>Q: When did you start programming?</strong><br />
A: I learned Logo in Grade 4. But at that time I couldn't even understand recursion. I could just write a short program which could only make the turtle draw very simple things. When I was in Grade 6, I attended a programming class in which they taught Pascal. One year later I started to learn algorithms. I think it was at this time that I really started programming.</p>

<p><strong>Q: How did you learn about TopCoder? What attracted you to TopCoder?</strong><span style="float:right; padding:10px;"><img style="height:140px; width:126px; border:1px solid #cccccc;" src="/i/m/yuhch123_big.jpg" /><br /><span style="padding-left:40px"><tc-webtag:handle coderId="14768757" context="algorithm" /></span></span><br />
A: The programming class that I attended in Grade 6 lasted until Senior 1 (Grade 10). <tc-webtag:handle coderId="7563318" context="algorithm" /> was the teacher when I was in Junior 3(Grade 9), and he told us about TopCoder. TopCoder's just, interesting, and unique competing rules attracted me a lot :). It provides me with good opportunities to improve my coding skills.  (It's disappointing that I didn't figure out it until last year :( )</p>

<p><strong>Q: What is(are) your proudest TopCoder moment(s)?</strong><br />
A: It was <a href="/stat?c=round_overview&er=5&amp;rd=11127">SRM 393</a>. I worked out the hard which had only 3 submissions passed system test. And I was the fastest of them. It was the first time that I had the fastest time on some problem, although I was second fastest 3 times before. (All of them were Div-1 hard. Probably because there were less passed-system-test submissions, it was easier to get some good place :) )</p>

<p><strong>Q: What was the toughest part you had to overcome in order to become a target?</strong><br />
A: It was programming accuracy I think.</p>

<p><strong>Q: What was your reaction when you saw your name as a target?</strong><br />
A: I became a target at <a href="/stat?c=round_overview&er=5&amp;rd=12013">TCO round 3</a>. I felt I got tonsillitis and some fever that afternoon. So when I saw it, I thought "Am I dreaming? It seems not. It's a hallucination because of the fever? Probably yes." After 0.5 second, I realized it was not a hallucination. :P</p>

<p><strong>Q: What is your next goal on TopCoder?</strong><br />
A: Keeping the target, and break 3200 if possible.</p>

<p><strong>Q: What kind of problems do you enjoy solving the most?</strong><br />
A: Math problems. For example, <a href="/stat?c=round_overview&er=5&amp;rd=11121">SRM 387</a>'s Div I hard and SRM 377's Div I hard.</p>

<p><strong>Q: Given a chance to change one rule in TopCoder, what would you change to make it more interesting?</strong><br />
A: If some problem has less than 10 (or some other number) submissions, everyone can challenge them. If there are few submissions, the challenges on that problem will also be few. It makes a chance for anyone whose program fails in very few cases to pass system test. The problem setters can't always know every mistake contestants make.</p>

<p><strong>Q: I notice many Chinese high school coders are doing great on TopCoder. Do you have a huge community of programmers where you can help each other solve problems and improve?</strong><br />
A: Every year we have the National Olympiad in Informatics (Summer Camp) in summer holidays and the Winter Camp in winter holidays. The NOI lays stress on competing while the Winter Camp lays stress on training. During the Winter Camp, we have some classes for about 1 week, and all national training team members prepare a 8-minute (it was 15 minutes before) lecture to share something with others. Both in the Summer Camp and the Winter Camp, we exchange contact information which is more important I think.<br /><br />
We can discuss problems after the Camps, its time isn't O(1) while the time to discuss during the Camp is. :P</p>

<p><strong>Q: Who are the other TopCoder members to influence you the most?</strong><br />
A: <tc-webtag:handle coderId="286911" context="algorithm" />, <tc-webtag:handle coderId="7563318" context="algorithm" />, <tc-webtag:handle coderId="10241917" context="algorithm" /> (they taught me in the programming class), <tc-webtag:handle coderId="20093875" context="algorithm" /> and <tc-webtag:handle coderId="15153716" context="algorithm" />(they're my school mates, and we often discussed problems). Moreover <tc-webtag:handle coderId="7563318" context="algorithm" /> let me know the importance of coding skill. Thanks to all of them :).</p>

<p><strong>Q: What are other places apart from TopCoder where you solve problems for practicing?</strong><br />
A: Apart from TopCoder I usually go for <a target="_blank" href="http://acm.timus.ru/">Ural</a> [ed: as of writing, <tc-webtag:handle coderId="14768757" context="algorithm" /> has completed over 400 problems at Timus], <a target="_blank" href="http://acm.sgu.ru/">SGU</a> and <a target="_blank" href="http://www.spoj.pl">SPOJ</a>.<br /><br />
SIDE NOTE: Here are the links to <tc-webtag:handle coderId="14768757" context="algorithm" />'s profiles on Ural, SGU and SPOJ - <br />
<ol>
    <li>On <a target="_blank" href="http://acm.timus.ru/author.aspx?id=30896">Timus Online Judge</a></li>
    <li>On <a target="_blank" href="http://acm.sgu.ru/teaminfo.php?id=011156">SGU</a></li>
    <li>On <a target="_blank" href="http://www.spoj.pl/users/yuhch123">SPOJ</a></li>
</ol></p>

<p><strong>Q: How do you practice to improve your programming skills? What advice would you like to give for the beginners to improve?</strong><br />
A: Algorithm skill is more important than coding skill. I usually solve problems at online judges to improve algorithm skill, and attend SRMs to improve coding skill. (Although algorithm skill is more important than the latter, but the difference of importance between them isn't that large. So do not leave TopCoder. :P )<br /><br />
Trying to solve problems on your own is also important. During the process, one can learn how to design test data (especially tricky ones), how to find the bug quickly and so on. I will not ask others unless I really can't solve it.</p>

<p><strong>Q: What do you do for fun other than programming?</strong><br />
A: I usually play table tennis and run a middle distance running most days of the week.</p>

<p><strong>Q: What University are you planning to attend in future? What is your dream ACM ICPC team :) ?</strong><br />
A: I will attend Tsinghua University this September. I'm not sure if I will compete in ACM ICPC competitions.</p>

<p><strong>Q: What is it that you don't like about ACM ICPC competitions?</strong><br />
A: Probably it will take too much time to practice and make me miss some important things. (If I attend it in the future, then it's because I don't want to miss some other important things. :))</p>

<p><strong>Q: What according to you is more important to excel in competitions - practice or theoretical knowledge?</strong><br />
A: I think if in the competition one is allowed to use pre-written code, theoretical knowledge is more important, otherwise practical knowledge. For example, in OI competitions (Olympiad in Informatics), one can't use any information other than that in the test paper and in the brain. So it's not very possible to write something extremely difficult to code but with relatively good efficiency, such as Voronoi diagrams, dynamic trees and so on. They perform well in theory while bad in practice. But in the ICPC style competitions, it's the opposite. You can just type whatever data structures and base algorithms following the paper without considering what if I make any mistakes and can't find it.</p>

<p><strong>Q: Would you like to recommend any books/research papers/articles on algorithms which you have found interesting?</strong><br />
A: The well-known Introduction to Algorithms (CLRS) is an extraordinarily good book. It introduces a lot of usual data structures and algorithms, and almost all of them have a great use in competitions. Moreover TAOCP (The Art Of Computer Programming) and Concrete Mathematics from Donald Knuth are great. But it's pity that I haven't had enough time to read them fully. :(</p>


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
