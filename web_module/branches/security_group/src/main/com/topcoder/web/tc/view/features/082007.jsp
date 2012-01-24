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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="517154" message="Discuss this article" />
</div>
 
<span class="bigTitle">Meet the July Coders of the Month</span>
<br /><br />

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="8365955" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<p>July's "Coders of the Month" include an Italian designer, a Chinese algorithm competitor, and a developer from Bosnia &amp;  Herzegovina.  In this article, we ask them for their advice to newbies, the accomplishments that they're most proud of, and the things that stress them out. </p>

<br />
<p>
<div class="authorPhoto">
    <img src="/i/m/ACman_big.jpg" alt="ACman, July's Algorithm Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&achtid=5">Algorithm</a>: <tc-webtag:handle coderId="22629261" context="algorithm"/><br />
  SRM 360: 1696<br />
  SRM 359: 1776<br />
  SRM 358: 1591 
</p>

<p><strong>Q: What brought you to TopCoder? </strong></p>
<p>A: I've been a member of TopCoder since July 2006. My teammate introduced me to the fantastic game of TopCoder Algorithm Competitions, in which I can compete with other good coders. </p>
<p><strong>Q: What's your proudest TopCoder moment? </strong></p>
<p>A: I won the first place in my university during the TopCoder College tour and won an iPod in that contest. And of course, I am very happy being a Coder of the Month. </p>
<p><strong>Q: What's one thing you learned at TopCoder that has helped you in other areas of your life? </strong></p>
<p>A: Actually, I learned many useful things in Single Round Matches -- things like istringstream, which can help me handle some trivial string problems easily. When I view some good coder's source, I discover good code style can help me check my code quickly and conveniently. Apart from that, learning good algorithms is also very important. </p>
<p><strong>Q: What advice would you give to someone just starting out? </strong></p>
<p>A: Nothing but practice, practice makes perfect, right? Checking other coders' implementations is a great short-cut for beginners. </p>
<p><strong>Q: What was the biggest contributor to your progress this month? </strong></p>
<p>A: I am an ACMer, too. I have been training during this summer vacation, which gave me a very good chance to improve my ability to code and discuss some problems with my teammates after every Single Round Match. That's been helpful. </p>
<p><strong>Q: What's your most stressful TopCoder moment? </strong></p>
<p>A: When I see other competitors submitting their code, and I can't figure out what algorithm I should be using to solve the problem &ndash; that's stressful. Sometimes, the key to the problem is very easy but there are some tricks in it. </p>

<br />
<p>
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="fabrizyo, July's Designer of the Month" />
</div>
<a href="/tc?module=COMHistory&achtid=6">Design</a>: <tc-webtag:handle coderId="21926605" context="design"/><br />
9 design wins last month </p><br />

<p><strong>Q: What brought you to TopCoder? </strong></p>
<p>A: I saw an article about the Google Code Jam last year. I got to know about TopCoder through the algorithm competitions. The algorithm competitions are very fun and I think that they are one of the most important aspects of TopCoder. I tried to learn the development competitions, then I tried design. </p>
<p><strong>Q: What's your proudest TopCoder moment? </strong></p>
<p>A: I have many proud moments. My first victory in a design competition was one of these moments, or when I won a room in an algorithm competition. I feel happy about any victory (or also a second place) in a design contest. </p>
<p><strong>Q: What's one thing you learned at TopCoder that has helped you in other areas of your life? </strong></p>
<p>A: I learned several technologies doing the design contests. I also learned the TopCoder methodology and I apply this methodology in some parts of my work. I'm an architect/designer/developer in Java (in my company there is not much distinction among these types of jobs). But I think that the community is the part of TopCoder that I learn from. The community of TopCoder is filled with many highly skilled people from the computer science world. It's very good for me to share in the knowledge of this community. It's a mechanism that can improve ones skills a great deal. </p>
<p><strong>Q: What advice would you give to someone just starting in TopCoder competitions? </strong></p>
<p>A: For the design contests, don't worry if you fail a submission or if you receive a low score. Learn from your mistakes, study the winning submissions and start your next design.&nbsp; </p>

<br />
<p>
<div class="authorPhoto">
    <img src="/i/m/sidonath_big.jpg" alt="sidonath, July's Development Coder of the Month" />
</div>
<a href="/tc?module=COMHistory&achtid=7">Development</a>: <tc-webtag:handle coderId="22680930" context="development"/><br />
2 development wins<br />
4 wins out of first 5 competitions</p><br />

<p><strong>Q: What brought you to TopCoder? </strong></p>
<p>A: I heard about TopCoder a few years ago, but back then I did not have enough time to start competing. However, it turned out quite well in the end, because I have used that time to gather a large amount of experience in software and web development. Once I did start to compete, it all came to be useful. </p>
<p><strong>Q: What's your proudest TopCoder moment? </strong></p>
<p>A: I am still very proud of my first component development victory. When that feeling ultimately wears off, I believe I will be very proud of being chosen as a Coder of the Month. </p>
<p><strong>Q: What advice would you give to someone just starting out? </strong></p>
<p>A: I would advise anyone who considers starting with any coding competitions to stop considering it. Use the time to compete! There is no better teacher than the experience you get from trying. </p>
<p><strong>Q: What was the biggest contributor to your progress this month? </strong></p>
<p>A: Support and understanding from friends and family and the loads of free time I had. Special thanks go to my girlfriend, <tc-webtag:handle coderId="22684061"/>, for her excessive amount of understanding and support. </p>
<p><strong>Q: Do you have a favorite teacher or professor? </strong></p>
<p>A: I'm mostly self-taught in programming, but I must give special acknowledgment to many designers and reviewers at TopCoder. I have learned much from them and, as a matter of fact, I'm still learning. </p>
<p><strong>Q: What's your most stressful TopCoder moment? </strong></p>
<p>A: It is always the same moment almost every week -- Thursday 15:00 (CEST) [the deadline for component submissions]. Although I usually have a working solution by that time, I just have to resubmit because I found that I forgot to put copyright info in one of the source files...</p>
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
