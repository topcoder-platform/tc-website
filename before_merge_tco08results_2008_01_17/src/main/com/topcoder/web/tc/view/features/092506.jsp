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
    <tc-webtag:forumLink forumID="506123" message="Discuss this article" />
</div>

<span class="bigTitle">Understanding the Mind Game</span>

<div class="authorText">
  By&#160;<tc-webtag:handle coderId="22628020" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

Algorithm competitions are primarily mind games. In the struggle to keep your wits about you during a Single Round Match or Code Jam, your biggest opponent is yourself.
<br><br>
Here are some strategies that might benefit you in such an environment. 
<br><br>
<span class="bodySubtitle">Strategy 1: Don't get too emotional!</span><br>
It is important that you keep your cool before important events like the Collegiate Challenge or Code Jam. If you keep your mind sharp and stay calm, you instantly gain an edge over those others who are either too nervous or too confident. 
<br><br>
<span class="bodySubtitle">Strategy 2: Mugging up doesn't help!</span><br>
Don't revisit the Reference Manual at the last moment -- it really doesn't help. First, this is a competition, not a test. You cannot expect to actually absorb anything at the last minute by frantically reviewing functions -- it's more helpful to just stay relaxed. 
<br><br>
<span class="bodySubtitle">Strategy 3: Conquering the Ultimate Dilemma</span><br>
You've opened the problem, and it's harder than you thought. Can you really do it? How much time should you spend trying? Here are some criteria that might help you decide:
<ol type="a">
<li>Points available: 5 points</li>
<li>Extensiveness of solution vs. Time available: 5 points (The easier the solution and the more time you have, the better the score.)</li>
<li>Comfort with the problem: 8 points (This can be independent of the points available.)</li>
<li>Can you deliver the logic? 7 points (Is the solution really feasible in the time available?)</li>
</ol>
Total: 25 points 
<br><br>
It's not entirely scientific - and you have to be honest with yourself - but the above method can be a helpful tool in deciding whether to keep pushing or cut your losses. These criteria can also help you overcome biases and preconceptions built into the competition. Just because a problem is a 250-pointer, you may or may not be able to put the logic into code - if you don't know how, move on, and don't waste time on it because it's supposed to be 'easy.' Similarly, if you've run through the criteria above on a 1000-pointer and come up with a score of 18 or 19, go for it - based on your assessment of your skills and the problem you've got a good shot, so don't be intimidated because it's supposed to be 'tough.' 
<br><br>
<span class="bodySubtitle">Strategy 4: Never say die!</span><br>
You have selected your problem and coded a decent part of the solution - yet somewhere down the line you feel the solution just isn't there. Let's look at four situations: 
<ol>
<li><i>You have spent only a small amount of time and the problem looks more difficult than it did earlier.</i><br>
There can be two reasons why you are not getting the solution. First, it is genuinely tough and cannot be solved within the time constraints. This is a difficult scenario to reach, as you might have analyzed the problem per the above criteria and weighed the pros and cons. The only solution here is to re-analyze and check if it's possible to get through within the time limit - or else skip the problem altogether. 
<br><br>
The second and more likely reason is that have lost your way through the logic coding. Odds are, this means that you are succumbing to the pressure created by the time limit. Relax and take a deep breath. Do whatever you can to stop your eyes from looking at the ticking clock and focus on the task at hand - just don't get so relaxed that you forget about time altogether.</li>
<li><i>You have spent a moderate amount of time and everything is getting stuck.</i><br>
This is the most crucial situation, and almost everyone faces it at one point or another. Perhaps you have spent 10 minutes on a 500-pointer and haven't even got half the logic right. There is no point giving up here. Try to identify what is really troubling you - is it just that time has passed? Or is your logic truly going haywire? Again, take a deep breath. Do not give in to the temptation to start from scratch. It's true that coding is easy and debugging is tough - but, in a timed situation, doing a little debugging is a lot wiser than starting over from square one and losing both work and time.</li>
<li><i>You are close to the time limit and the solution is still non-existent.</i><br>
This is a terrible situation to be in, but it can also reward you sometimes. You might have the correct code with you and a few tweaks can get you there. If you have already coded a decent amount you can use another five minutes as tweaking time. Use this time wisely. If things get better, get the job finished or else simply quit. But do not quit without trying!</li>
<li><i>I have taken a lot of time for this!</i><br>
If you have used up almost all of your time, your only choice is to try to skip to another question or keep tweaking your current problem until the last second. Avoiding this situation depends on choosing the right problems in the first place.</li>
</ol>
The bottom line, for all these strategies: Never lose confidence, and do not quit without trying. 
<br><br>
<span class="bodySubtitle">Strategy 5: The Final Frontier</span><br>
Okay, the coding is done - now it's time for the challenge round. This round can help you garner a few extra points, but it can also make you lose some. Accordingly, this round must be treated with care. 
<br><br>
When the challenge round begins, there will be several people in the room who have attempted the same problem. Here is a plan you can adopt to identify the weakest link. 
<br><br>
First, decide which problem you found the most 'logically' demanding (again, do not be biased because of the point values). Go for the problem you chose, first. 
<br><br>
Check for those who took either a much smaller or larger amount of time. Among them, choose those who have the lowest ranking and then inspect their code completely, regardless of how boring it is. The challenge round is extremely beneficial in this - it requires competitors to review code, understand it, and find flaws without using a compiler. This kind of activity not only improves your understanding but is also excellent training for debugging your own code. 
<br><br>
If you find someone whose code will fail in certain special cases, go for the challenge. Even top-ranked coders make mistakes here and there, and there is a good chance that novice programmers haven't covered all the conditions or output prerequisites. 
<br><br>
Hopefully, these strategies will give you some fresh insight into your own mind game during competition. Good luck!
        <br><br>
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
