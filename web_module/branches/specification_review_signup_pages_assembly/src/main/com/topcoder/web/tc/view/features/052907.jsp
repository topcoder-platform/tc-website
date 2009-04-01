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
    <tc-webtag:forumLink forumID="515948" message="Discuss this article" />
</div>

<span class="bigTitle">Meet the April Coders of the Month</span>
<br /><br />
<%--
<div class="authorPhoto">
    <img src="/i/m/kzimmerman_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21196141" /><br />
      <em>TopCoder Member</em>
</div>
--%>
<br clear="all">

<p>We caught up with April's "coders of the month," to learn a little bit more about them, their proudest TopCoder moments, and more&#8230;</p>

<p>
<div class="authorPhoto">
    <img src="/i/m/nemesis_nitt_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="15687886" /><br>
TCO07 Rd 4: 1690<br>
TCO07 Rd 3: 1478<br>
TCO07 Rd 2: 1263
</p>

<p><strong>What's your proudest TopCoder moment?</strong><br>
<a href="http://forums.topcoder.com/?module=Thread&threadID=573867&start=45&mc=90">This</a>. Of course, it was a great, great day for me. When the world's best puzzle solvers and programmers -- <tc-webtag:handle coderId="272072" />, <tc-webtag:handle coderId="144400" />, <tc-webtag:handle coderId="10574855" />, etc. -- said 'congrats,' and I have no idea how it happened&#8230;</p>

<p><strong>What's one thing you've noticed about the most successful TopCoder members that you think others could learn from?</strong><br>
First, they are "elegant." <tc-webtag:handle coderId="144400" />, whom I rate to be deservedly unbeatable in quite some time around, is very "creative," in the sense that he doesn't usually take the most natural/code-lengthy method. He prefers being experimental and doesn't care if it's the finals of an international event (from his article during finals of TCO a year or two back). I think it's innovation that keeps him running. Despite all this experimentation he's been quite reliable, too -- in the world's riskiest contests, [TopCoder!?] he earns his spot all the time!</p>

<p><strong>What's a tip that you think is particularly important?</strong><br>
I think practice helps quite a lot. These contests cannot be completely new, as such problems can't be re-invented within a hour. Hence they tend to stick around some basic ideas, once we get comfortable with them, I think it boils down to who is more "bug-free." Though it looks bad put this way, that's what I believe to be close to the truth.</p>

<p><strong>What advice would you give to someone just starting in TopCoder competitions?</strong><br>
Don't do this! There are better things to do&#8230;  This is too addictive!</p>

<p><strong>What's the biggest obstacle you've had to overcome?</strong><br>
It is generally bugs. Bugs take 80% of contest time, especially in contests like TopCoder, you don't think too long when compared to the total time spent on a problem. It's just that we get stuck up on a problem for long and, worse, we can't even estimate how much longer this problem is going to take. The good news, though, is that this part generally improves by constant practice and concentration, I think.</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/kyky_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="152342" /><br>
9 first places<br>
Highest Design rating ever<br>
Perfect 100 score 
</p>

<p><strong>What's the coolest thing you've seen at TopCoder? </strong><br>
I saw a competitor solving a dynamic programming (DP) problem -- without prior exposure to the technique. In SRM 30, <tc-webtag:handle coderId="152347" /> solved a simple DP problem without realizing that it was DP. A few SRMs later I mentioned DP to him in a practice room conversation, and he did not recognize the term. When I mentioned the DP problem that he solved a week or so earlier, he said that he figured the trivial solution would time out for it, so he came up with an idea that would just eliminate computing the same thing multiple times.</p>
 
<p><strong>What's your proudest TopCoder moment?</strong><br>
Without a doubt, it is the qualification for the on-sites of the TCI 2002 in algorithms. I finished 17th, but went on-site because several competitors who placed ahead of me could not get their visas in time for the competition. Even joining the "zero-point club" of competitors who scored zero in semifinals did not spoil the fun for me.</p>
 
<p><strong>What's one thing you learned at TopCoder that has helped you in other areas of your life?</strong><br>
Arguing my position during the appeals phase in design competitions has helped a lot in explaining my designs to others at work. TopCoder lets you practice with very tough listeners -- if you learn how to convince <tc-webtag:handle coderId="286907" /> to change your score, your chances of convincing almost anybody else will be great.</p>
 
<p><strong>What's a tip that you think is particularly important?</strong><br>
Give your designs a bit more effort than the bare minimum required - the review board will notice and reward you for it.</p>
<br>

<p>
<div class="authorPhoto">
    <img src="/i/m/magicpig_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="14788013" /><br>
4 first places<br>
Red rating<br><br>
</p>

<p><strong>What brought you to TopCoder?</strong><br>
<tc-webtag:handle coderId="347569" /> told me about topcoder and he encouraged me to participate in the algorithm competition. I found it wonderful and later I started my development competition. It is just about one year since my first win in a development competition, and it is great for me to be a coder of the month, but it is a pity that I can not compete on-site at the TCO due to visa problems.</p>

<p><strong>What's the most interesting thing you've seen at TopCoder?</strong><br>
At the TCCC07 final, Ying missed the chance to be champion due to just one line fault in code. I felt so sorry for Ying, who had led me to the world of algorithms. Code is so magic that you must take care of every case, or it will be cruel to you.</p>

<p><strong>What's your proudest TopCoder moment?</strong><br>
Making an almost perfect performance in April and becoming a red coder.</p>

<p><strong>What's one thing you learned at TopCoder that has helped you in other areas of your life?</strong><br>
I learn that if I start a job, I should try my best to make it perfect.</p>
 
<p><strong>What's a tip that has helped you?</strong><br>
As a developer, you have to be very careful with any code you write, and you should always be seriously considering whether there is a better way to complete it.</p>

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
