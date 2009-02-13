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
    <tc-webtag:forumLink forumID="516667" message="Discuss this article" />
</div>

<span class="bigTitle">Know your hero: bmerry</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/mohit_ranka_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21201116" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>Welcome to the first edition of &ldquo;Know Your Hero,&rdquo; a series of interviews with the coders, designers and developers who are at the top of the ratings.</p>
<p>In this edition, I present an interview with Bruce Merry (TopCoder Handle: <tc-webtag:handle coderId="251074" context="algorithm"/>; Algorithm Rating: 3100; Marathon Matches Rating: 2268). <tc-webtag:handle coderId="251074" context="algorithm"/> is currently positioned at no. 4 in the world in algorithm competitions, and is one of the few to cross the coveted 3000-point mark in the ratings. </p>
<p>We talked about his preparation for the TCO finals, his hobbies, future plans, SRM strategies and the difference between SRM and Marathon matches. </p>
<p><strong>How long have you been engaged with programming? How did you start?</strong></p>
<p>I've been programming almost as long as I can remember. My parents both program, so they encouraged me as a child. I started with Logo and moved on to GWBasic, then Pascal. </p>
<p><strong> </strong><strong>When did you start to realize that you would achieve so much?</strong></p>
<p>I guess it was when I was still in primary school. In my last year of primary school, I came second in the national high school contest. Then at IOI I got gold medals in my last two years.</p>
<p>But I'm still surprised to find myself currently at #3 on the TopCoder ranking. I knew I was good, but some of the top guys are really amazing. </p>
<p><strong> </strong><strong>What are your hobbies, other than TopCoder?</strong></p>
<p>What, there are other things to do than TopCodering? </p>
<p>OK, seriously, I do some other programming contests, but also read books, watch movies, play table tennis. I'm a serious fan of Monty Python too. </p>
<p><strong> </strong><strong>How do you approach an algorithmic SRM event?</strong></p>
<p>A lot of it is about having the right mindset - believing that you can solve the problems and having faith in your solution. At the moment I'm working in the order easy-medium-hard. I usually submit as soon as I can solve all the sample cases, although depending on the problem I might test some corner cases as well. </p>
<p>Something I learned from <tc-webtag:handle coderId="10574855" context="algorithm"/> is to then test the problem immediately, rather than hoping there is time to come back and do it later. </p>
<p><strong> How did you go about preparing for the TCO07 Finals?</strong></p>
<p>Initially, I just took part in as many SRMs as I could. When I started, I switched to VIM on Windows, which is the environment I used at the finals. I also worked through old finals in the practice rooms. Finals tend to have tougher problems than SRMs, so it was important to make the mental adjustment. </p>
<p><strong> </strong><strong>How have TopCoder events changed your programming?</strong></p>
<p>It's definitely made my coding faster and less error-prone. I don't type any faster, but I've picked up a lot of shortcuts and so I write less code. And the less code you write, the less chance there is of bugs. </p>
<p>I also used to try to fully optimize almost everything, as a result of experience with IOI and similar contests. I now take the approach that I try to write the minimum amount of code to get the job done, even if it's a bit slower to run. </p>
<p><strong> </strong><strong>What topics of study would you suggest to a new TopCoder member who wants to excel in algorithmic contests?</strong></p>
<p>You should definitely work through the <a href="/tc?module=Static&d1=tutorials&d2=alg_index">Algorithm tutorials</a> on the TopCoder site - they're all important. I guess dynamic programming and graph theory are the two pillars on which most contest problems are based. </p>
<p>But no amount of book-learning is going to help without experience. The best way to get good at TopCoder is to take part in a lot of matches and, after each match, find out what theory you needed to solve the problems. </p>
<p><strong> </strong><strong>What is your proudest moment in TopCoder? How did you feel?</strong></p>
<p>I would say advancing from the final round at the TCCC06 finals. I was really happy about it, and a little bit disbelieving. </p>
<p><strong> </strong><strong>You have done exceedingly well in both Algorithm SRMs and Marathon Matches. What's the difference in the approach required by these kinds of competition?</strong></p>
<p>There is an element of planning in both, but to excel in an algorithm match you have to dive in quite quickly and trust your instincts. </p>
<p>In a marathon match it pays to take things slowly and methodically, making notes of different ideas, analyzing things theoretically before implementing them, and testing changes one at a time instead of in a big bunch. </p>
<p><strong> </strong><strong>What are your future plans?</strong></p>
<p>At the moment I'm finish up a PhD. After that I'm hoping to find a job in the computer graphics industry. Hopefully I'll still be able to compete in TopCoder. </p>
<p><strong> </strong><strong>They say, &ldquo;Behind every man&rsquo;s success, there is a woman&rdquo;, maybe you could coin a new phrase. &ldquo;Behind every man&rsquo;s successful coding, there is a _________&rdquo;??</strong></p>
<p>Debugger? </p>
<p><strong>What do you think is the main key to your success?</strong></p>
<p>I think its proficiency for algorithms and reasonable consistency. I haven't won many SRMs, and I don't have the highest submission success rate, but I usually get 2 or 3 problems in reasonably quickly and I don't often crash out totally. </p>
<p><strong>A piece of advice to fellow TopCoder members?</strong></p>
<p>Practice, practice, practice. </p>
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
