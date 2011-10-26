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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="517934" message="Discuss this article" /><br />
    <a href="/tc?module=Static&d1=help&d2=writeForTC">Write for TopCoder</a
</div>

<span class="bigTitle">Meet the September Coders of the Month</span>
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

<p><em>We caught up with two of September's "coders of the month," to learn a little bit more about them, their proudest TopCoder moments, and more...</em></p>

<%--
<p>
<div class="authorPhoto">
    <img src="/i/m/nemesis_nitt_big.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="15687886" /><br />
TCO07 Rd 4: 1690<br />
TCO07 Rd 3: 1478<br />
TCO07 Rd 2: 1263
</p>

<p><strong>What's your proudest TopCoder moment?</strong><br />
<a href="http://forums.topcoder.com/?module=Thread&threadID=573867&start=45&mc=90">This</a>. Of course, it was a great, great day for me. When the world's best puzzle solvers and programmers -- <tc-webtag:handle coderId="272072" />, <tc-webtag:handle coderId="144400" />, <tc-webtag:handle coderId="10574855" />, etc. -- said 'congrats,' and I have no idea how it happened&#8230;</p>

<p><strong>What's one thing you've noticed about the most successful TopCoder members that you think others could learn from?</strong><br />
First, they are "elegant." <tc-webtag:handle coderId="144400" />, whom I rate to be deservedly unbeatable in quite some time around, is very "creative," in the sense that he doesn't usually take the most natural/code-lengthy method. He prefers being experimental and doesn't care if it's the finals of an international event (from his article during finals of TCO a year or two back). I think it's innovation that keeps him running. Despite all this experimentation he's been quite reliable, too -- in the world's riskiest contests, [TopCoder!?] he earns his spot all the time!</p>

<p><strong>What's a tip that you think is particularly important?</strong><br />
I think practice helps quite a lot. These contests cannot be completely new, as such problems can't be re-invented within a hour. Hence they tend to stick around some basic ideas, once we get comfortable with them, I think it boils down to who is more "bug-free." Though it looks bad put this way, that's what I believe to be close to the truth.</p>

<p><strong>What advice would you give to someone just starting in TopCoder competitions?</strong><br />
Don't do this! There are better things to do&#8230;  This is too addictive!</p>

<p><strong>What's the biggest obstacle you've had to overcome?</strong><br />
It is generally bugs. Bugs take 80% of contest time, especially in contests like TopCoder, you don't think too long when compared to the total time spent on a problem. It's just that we get stuck up on a problem for long and, worse, we can't even estimate how much longer this problem is going to take. The good news, though, is that this part generally improves by constant practice and concentration, I think.</p>
<br />
--%>

<p>
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="14840263" context="design" /><br />
2 wins scoring<br />
in the 90s<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
I had discovered the site some time ago, looked over it and found TopCoder's approach to software development amazing and very appealing to me, and I had to give it a try.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
Every time I finish a component is a very proud moment for me. Every time I win, it is even better.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Being a novice was hard, when I started out. There are many great designers to compete against and a lot of guidelines to learn and follow.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Failing is not a big deal. Everyone fails sometime. You just pick yourself up, dust yourself off and start all over again.</p>
 
<p><strong>What advice you give to someone just starting out?</strong><br />
Learning and creative thinking are your only sources of competitive advantage.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
I just had a little more available time to dedicate to design competitions.</p>
 
<p><strong>What is your most stressful TopCoder moment?</strong><br />
Whenever I am competing against some of the high rated designers. But, I do not see it as a plague as it energizes me, it's what drives me to excel.</p>
<br />

<p>
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="21180848" context="development" /><br />
3 wins<br />
Steady ratings climb<br /><br />
</p>

<p><strong>What brought you to TopCoder?</strong><br />
My friend <tc-webtag:handle coderId="20076717" context="development" /> brought me here, and I have many classmates in algorithm match.</p>
 
<p><strong>What is your proudest TopCoder moment?</strong><br />
My proudest moment is whenever I finish a component or whenever I have completed a final fix.</p>
 
<p><strong>What is the biggest obstacle you have had to overcome?</strong><br />
Learning a new technology and using it to compelete matches during a very busy time is a big obstacle.</p>
 
<p><strong>What is one thing that you have learned at TopCoder that has helped you in other areas of your life?</strong><br />
Always learn new technology all the time and don't give up.</p>
 
<p><strong>What is the biggest contributor to your progress this month?</strong><br />
Many people, <tc-webtag:handle coderId="151743" context="design" />, <tc-webtag:handle coderId="22651514" context="design" />, and <tc-webtag:handle coderId="15604762" context="development" />, have helped me a lot.</p>
 
<p><strong>What is your most stressful TopCoder moment?</strong><br />
Whenever the competition is closing but the work is not compelete, that is real RUSH time!</p>
<br />

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
