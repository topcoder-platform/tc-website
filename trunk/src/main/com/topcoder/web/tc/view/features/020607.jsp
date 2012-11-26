<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
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
    <tc-webtag:forumLink forumID="506274" message="Discuss this article" />
</div>

<span class="bigTitle">Marathon Man: An interview with battyone</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/d000hg_big.jpg" alt="Author" />
</div>
<div class="authorText">
  <tc-webtag:handle coderId="21464956" context="marathon"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">
<i>On December 27, 2006, TopCoder wrapped up the Intel Multi-Threading Competition Series. Over the course of the 12 Intel competitions, an average of 836 TopCoder members registered for each match, with an average of 206 members submitting at least one solution in each. Despite this competition, Fred Batty (a.k.a. <tc-webtag:handle coderId="7504863" context="algorithm"/>) finished at #1 in six of the 11 Intel competitions in which he participated, and finished within the top 5 in three more. He also eclipsed the rest of the field in winnings, earning a total of $13,880 during the Intel series. With the Intel series now behind us, <tc-webtag:handle coderId="21464956" context="marathon"/> asks <tc-webtag:handle coderId="7504863" context="algorithm"/> for his advice and insights on marathon matches.</i>
<br><br>
<span class="subtitle">How did you get started with marathon contests?</span><br>
I learned about TopCoder in 2003 after reading about the Google Code Jam in the San Jose Mercury News, and have been a regular participant in algorithm competitions since then. When TopCoder announced the marathon beta in December 2005 I gave it a try and found it very interesting, so I've continued to participate in the Intel events.
<br><br>
<span class="subtitle">What attracted you to the marathon format?</span><br>
The problems are really interesting and open-ended. I also like working on my own hours and taking the time to fully explore an idea. The 1 or 2 week duration allows exploring many ideas in depth without running out of them, which keeps it fun. 
<br><br>
The prizes in the Intel competitions were also a big additional incentive. Not the money in and of itself, but because I think winning prizes just for being good at what I do is really cool. Upon entering the competition I didn't think I had a serious chance, but just the possibility made the idea of spending most of my free time competing a lot less dorky. After my first win, which was the one I worked the hardest for, having something to show for it made the accomplishment much more palatable and encouraged me for the following competitions. 
<br><br>
<span class="subtitle">So, you've registered for the latest marathon and just opened the problem statement. Talk me through your work and thought process for the first few hours.</span><br>
I adapt my test framework for the problem (test case generation, scoring). Then I write a basic solution to make sure I have that part right. Then I try more elaborate solutions to get a better understanding of the problem, what's the difficult part about it, that sort of things. 
<br><br>
<span class="subtitle">Do you do much research on the topics covered in the problem statement, or jump in with your own ideas?</span><br>
Usually I do the latter. There have been a few classic problems that have come up -- in these cases, looking at existing research is more productive than trying to retrace the steps of the many researchers who have worked on it before. But it takes a lot of time to find this stuff and sort out which papers are relevant and applicable, so it's more fun when the problem is original.
<br><br>
<span class="subtitle">How often do you completely change your approach - and how do you decide when your current approach isn't worth spending further time on?</span><br>
Not often. Usually it's incremental improvements, or adding a step in the solution.
<br><br>
<span class="subtitle">How much time do you spend coding, and how much working on the theory of your solution?</span><br>
The hard part is coming up with good algorithms. I write my ideas on paper and refine them until I zero in on a model or an algorithm. Writing and debugging the code, which ends up being just several hundred lines, is usually a smaller part of the work.
<br><br>
<span class="subtitle">What kind of local testing do you do?</span><br>
My test framework generates an entire test case by using the test case number as random seed, and scores the solution, so I can easily repeat tests on the same data and find what ideas or tweaks work.
<br><br>
<span class="subtitle">To what extent does optimization and technical understanding of the testing system contribute to your success?</span><br>
Not a whole lot. At one time I was worried that this might turn into an optimization contest where assembly programmers would win, but the problems have turned out to be complex enough -- and to have enough possible approaches -- that it's the algorithms that made the difference. Kudos to the writers for that. Efficient code, data structures, and threads were important, of course, but all the serious competitors realized that, and we were all pretty decent programmers, so in that respect I think the field was pretty even. 
<br><br>
<span class="subtitle">What areas of computer science and mathematics do you consider crucial? What would you recommend learning about?</span><br>
It is different for each problem, but we have enough time to look up anything. Really, what matters most is general problem-solving skills. Solving algorithm Division 1 hard problems in unlimited time is a good way to practice, and I'd suggest newcomers to TopCoder do a few of those before tackling marathon problems.
<br><br>
<span class="subtitle">Do you employ any tactics before or during a match to try and affect other competitors?</span><br>
No. I think the best tactic is simply to post your best solution.
<br><br>
<span class="subtitle">If you were in first place, though, would you still submit an improved solution immediately?</span><br>
Maybe not. That's a special situation :)
<br><br>
<span class="subtitle">Can you give examples of tricks and optimizations that you've found useful in marathons?</span><br>
I don't know if it's much of a trick, but an easy way to thread a search algorithm, which I used in several problems, is to run the algorithm independently in each thread starting from randomized parameters and take the best solution in the end. This doesn't need a multi-processor machine to develop and test.
<br><br>
<span class="subtitle">You've had incredible success in the Intel series. What has enabled you to come up with such good solutions in such a wide range of problems? What's your secret?</span><br>
Beats me. If someone had told me a year ago that I'd end up winning this competition among such an incredibly talented field of world-class software engineers -- not once, but 6 times -- I would have thought they were insane. But back in my student days I used to do really well with unconventional, research-like math or CS problems, so perhaps my tendency to over-analyze things before deciding on an approach pays off in this type of problem. Having a supportive family and enough free time are obviously also very important factors. And I was lucky in the contests I won that my solutions didn't have bugs (and that nobody came up with better ones).
<br><br>
<span class="subtitle">How valuable are your skills from algorithm competitions in marathons?</span><br>
Sometimes parts of my solutions are similar in complexity to algorithm competition problems, and what I learned doing SRMs comes in handy. But SRMs focus more on speed than on particularly difficult algorithms. I think the marathons are the real algorithm competitions.
<br><br>
<span class="subtitle">What have been the highs and lows of competing in marathons for you?</span><br>
It's rewarding when you come up with a theory, and that theory translates perfectly into practice. Or when you finally figure out a linear algorithm that you believed existed but couldn't quite put your finger on. I guess this made MessageReceiver my favorite problem.
<br><br>
Low points would be wasting an hour chasing a bug, or trying ideas that end up not working.
<br><br>
<span class="subtitle">Are you going to start doing regular marathons now that the Intel series has ended?</span><br>
I'd like to do a one-week marathon once in a while, when I find the problem particularly interesting and have enough time. But it won't be a regular thing -- I can't keep doing this every month like I did last year, on top of my full-time job. I have two daughters and other interests, and I'm enjoying having a little more free time to devote to them.
<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
