<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505558" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 132</span><br>Saturday, February 1, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<P>This afternoon's contest was one of the wackiest in recent memory. Division 2 
featured a couple of math problems that could lead to issues of double 
imprecision if solved the wrong way, and a simple dynamic programming problem 
about binary search trees. Division 1 seemed very simple at first glance, with 
almost everyone submitting the first two problems. And while the 450 ended up 
being as simple as it looked, the 300 timed out in a way that was not caught by 
the examples. As a result, almost everyone submitted the 300 immediately, only 
to find out during the challenge phase that the examples were less than 
exhaustive. This allowed InsaneParadox to get a whopping 11 challenges on one 
problem, probably a new TC record. <BR/></P>

<H1> 
The Problems 
</H1> 

<A name="Typing"></A><FONT size="+2"><B>Typing</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505558" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 1: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">250</TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">192 / 202 (95.50%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">116 / 192 (60.42%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>anup</B> for 249.33 
        points </TD></TR></TBODY></TABLE></BLOCKQUOTE>
        
<P>To find the overall rate, 
all you have to do is take each individual rate times the associated 
probability, and add all that up. At the end, divide by 100, since probabilities 
are always percent/100. 
</P>

<FONT size="+2"><B>HardIneq</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505558" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 2: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">550</TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">164 / 202 (81.19%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">101 / 164 (61.59%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>anup</B> for 544.28 
        points </TD></TR></TBODY></TABLE></BLOCKQUOTE>
<p>        
This problem required a bit of trickery. The task given to you is very simple: Given a formula, find the 
smallest integer that satisfies it. However, the formula involves large 
exponents which produce numbers that are so large, they even overflow double, 
which goes up to around 10^300. So, to make it work, you have to use the log 
identities given to you as a note:<PRE>log(x^y) = y * log(x)
log(x*y) = log(x) + log(y)
</PRE>This allows you to change<BR/><TT>a*(n^k) &lt; k^n</TT> 
<BR/>into:<BR/><TT>log(a)+k*log(n) &lt; n*log(k)</TT> <BR/>This allows you to 
evaluate the inequality for all of the values of a and k that could be inputs. 
<BR/>One thing that one always has to consider when dealing with doubles, is that 
they are inexact. This suggests that it might be better to replace our 
inequality with something like: <TT>log(a)+k*log(n) &lt; n*log(k) - 1E-10</TT>, 
just to be safe. In fact, it turned out that different languages dealt with logs 
and doubles slightly differently, so C++ solutions required an epsilon, while 
Java did not. 
</P>

<FONT size="+2"><B>BSTs</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505558" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 3: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">1000</TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">64 / 202 (31.68%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">54 / 64 (84.38%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>BryanChen</B> for 986.41 
        points </TD></TR></TBODY></TABLE></BLOCKQUOTE>
        
Used as: Division-I, Level 2: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">450</TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">90 / 118 (76.27%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">87 / 90 (96.67%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>John Dethridge</B> for 
        444.93 points </TD></TR></TBODY></TABLE></BLOCKQUOTE>
        
<P>Reference Solution: John Dethridge</P>
<P>Trying to construct all of the BST's and then count them is an approach that 
would probably work, since there are at most 10 nodes, but it would probably 
take quite a long time to do. Instead, you should use a little bit of dynamic 
programming (or catalan number, more on that later). The first thing to notice 
is that the numbers on the nodes are of no consequence. Furthermore, we can pick 
the root node in such a way that there are anywhere i nodes in the left subtree, 
and n-i-1 nodes in the right subtree, where n is the total number of nodes. 
Since each subtree is itself a BST, we can count the number of BSTs with i 
nodes, and the number with n-i-1 nodes, and multiply those two numbers together 
to get the total number of BSTs with a given root. So, we can define a 
recurrence bst(n) = sum(i = 0 to n-1)(bst(i)*bst(n-i-1)), with a base case of 
bst(0) = 1. An iterative approach is the quickest way to solve this, which can 
be seen in John Dethridge's solution. </P>
<P>This is a fairly well-known problem, and it turns out that it can be solved 
with a simple closed form solution, called a Catalan 
number:<TT>C(2n,n)/(n+1)</TT>, where C means stands for choose (C(m,n) = 
fact(m)/fact(n)/fact(m-n)). It turns out that the number of BSTs with n nodes is 
exactly equal to the nth Catalan number. For more on Catalan numbers, check out 
what <A href="http://mathworld.wolfram.com/CatalanNumber.html">MathWorld</A> has 
to say about them. </P>

<FONT size="+2"><B>BigFunc</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505558" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 1: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">300</TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">115 / 118 (88.97%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">55 / 115 (47.83%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>RyanPai</B> for 289.09 
        points </TD></TR></TBODY></TABLE></BLOCKQUOTE>
<P>Reference Solution: WishingBone</P>
<P>This problem appears to be absolutely trivial. So trivial in fact, that one 
has to wonder about the 300 points assigned to it. Most people looked at it, and 
right away and coded it up exactly as given. This solution passed the examples, 
and a number of people submitted for scores of around 299. However, as a result 
this problem ended up with what was probably the lowest submission accuracy 
ever. If one spends a couple minutes to look at the recurrence, he or she would 
realize that it is far from obvious how many recurrences it will take. The moral 
of the story is that the given examples are not always exhaustive, even on the 
easy problems. Especially when it is relatively simple to try a few large 
numbers, as in this case, you should invest the minute or two it will take. That 
rant over, on the the problem analysis. </P>
<P>The naive implementation is very close to correct and can easily be fixed to 
work by using a technique called memoization. To do this, we simply have to 
cache the results of our recursion, and use the cache if we already know the 
result. WishingBone's implementation is a good example of how to do this. The 
idea is that, for a given value of m and n, f always evaluates to the same 
thing. So, there is no need to reevaluate the function each time. Instead, we 
save the returned value of f for each input m and n, and then if f gets called 
again, we just used the saved value. You can do the same thing with g. </P>
<P>Another way to solve this is iteratively, as seen in Maris's code. The trick 
to this approach is to realize that f(m,n) depends only on f(m-1,n) and 
g(m-1,n-1). Similarly g(m,n) depends only on f(m,n) and g(m,n-1). So, if we 
already know f(m-1,n) and g(m-1,n-1), it is easy to calculate f(m,n). You can do 
essentially the same thing with g. As a result, the problem can be solved easily 
with two nested for loops. </P>
<P>Though no one realized it during the contest, it turns out that f(m,n) = 
sum(i = 1 to n)i^m. For a proof of this, click <A 
href="http://www.topcoder.com/contest/problem/BigFunc/proof.pdf">here.</A> 
</P>

<FONT size="+2"><B>PinballLanes</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505558" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 3: 
<BLOCKQUOTE>
  <TABLE cellSpacing="2">
    <TBODY>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">1000</TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">25 / 118 (21.19%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee">12 / 25 (48.00%) </TD></TR>
    <TR>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B></TD>
      <TD class="bodyText" style="BACKGROUND: #eee"><B>John Dethridge</B> for 
        828.78 points </TD></TR></TBODY></TABLE></BLOCKQUOTE>
<P>Reference Solution: John Dethridge</P>
<P>This is a fairly standard dynamic programming problem. There are 2^(number of 
lanes) possible configurations of lights being on or off. So, what we should do, 
is initialize an array with 2^lanes elements, and set them all to 0, except for 
the element representing all off. Then, for each time that the ball goes up and 
back down, we need to calculate the probabilities that the lights are in each 
possible configuration. To do this, we can simple look at all possible paths 
that the ball can take for each configuration. So, we have something that looks 
like this: <PRE>int state[1&lt;&lt;lanes];
state[0] = 1;//0 represents all off, and in general, the ith bit represents the ith light.
foreach(time){
    int nextState[1&lt;&lt;lanes];
    foreach(state s){
        foreach(lane i){
            foreach(lane j){
                nextState[s with up and down lanes toggled] += 
                  state[s]*(probability of rolling down lane j, given it rolled up lane i);
            }
        }
    }
    state = nextState;
}
</PRE>The above code isn't complete. You still have to deal with all of the 
lights turning on, and then resetting. But it illustrates the basica idea behind 
the approach. You also have to determine the actual probabilities from the 
relative probabilities. John Dethridge's code is probably the shortest example 
of this approach. 
</P>

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
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

