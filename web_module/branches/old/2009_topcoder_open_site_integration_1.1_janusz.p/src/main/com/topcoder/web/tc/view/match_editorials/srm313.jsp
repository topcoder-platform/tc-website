<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
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
         <jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505988" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 313</span><br>Wednesday, July 26, 2006
<br><br>

<h2>Match summary</h2> 

<p>
Twenty minutes ago I started trying to think up a joke to open this editorial and couldn't think of
anything clever, so I'll just paste
<a href="/tc?module=Static&d1=match_editorials&d2=srm306">a link to the previous one I wrote</a>
&ndash; for the next SRM I'll remember to make something go wrong in the match,
so it will be easier to write funny introductions.<br>
<br/>
<small>*Note for the admins: This was a joke. Please let me keep doing SRMs, I won't ruin them on purpose. I promise.</small>
</p>
<p>
SRM 313 attracted 928 participants from 62 different countries.
Division 1 featured a surprisingly difficult medium problem that got the drop on almost 400 of the competitors, while the other
two problems in that division were pretty standard. In division 2, the problem set turned out to
be pretty balanced, leaving a final table with a surprising continuity in scores
that almost had no big holes.
</p>
<p>
Division 1 was dominated by <tc-webtag:handle coderId="7546003" context="hs_algorithm"/>,
thanks to that tricky medium problem and his solid performance in the other two.
He was followed by <tc-webtag:handle coderId="10574855" context="hs_algorithm"/>, who was the only
other coder to finish all three problems correctly.
<tc-webtag:handle coderId="7390467" context="hs_algorithm"/> took the third spot in the podium
by having  almost the fastest submissions in the easy and hard problems as well as a successful challenge.
</p>
<p>
In division 2, <tc-webtag:handle coderId="16096823" context="hs_algorithm"/> started his TopCoder
experience with a victory, thanks to the fastest submission in the medium and hard and a second fastest
in the easy problem.<tc-webtag:handle coderId="22510201" context="hs_algorithm"/> was second and
the third spot almost deserves to be shared between
<tc-webtag:handle coderId="22628707" context="hs_algorithm"/>,
<tc-webtag:handle coderId="22060726" context="hs_algorithm"/> and
<tc-webtag:handle coderId="22268867" context="hs_algorithm"/>,
all packed whithin less than 2.5 points.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6159&amp;rd=9993" name="6159">CyclesInPermutations</a></b>
</font>
<A href="Javascript:openProblemRating(6159)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505988" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      414 / 469 (88.27%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      364 / 414 (87.92%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>wilan</b> for 248.24 points (2 mins 23 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      196.95 (for 364 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>

This problem was a fairly simple simulation. For each possible starting square you could simulate the behavior
while counting the number of squares visited and keeping track of the maximum length found. This can easily be done
with two loops, one inside the other.
Since in each square you can do at most 50 steps to get back, and there are at most 50 squares, the inner part
of the program does a maximum of 50*50 repetitions, which is way under the time limit.
</p>
<p>
You can see <tc-webtag:handle coderId="20002558" context="hs_algorithm"/>'s
<a href="/stat?c=problem_solution&rm=249298&rd=9993&pm=6159&cr=20002558">code</a>
for a perfectly clear implementation in English.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6569&amp;rd=9993" name="6569">PrefixFreeSets</a></b>
</font>
<A href="Javascript:openProblemRating(6569)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505988" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      301 / 469 (64.18%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      196 / 301 (65.12%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hohosky</b> for 485.93 points (4 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      345.27 (for 196 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      385 / 397 (96.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      344 / 385 (89.35%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gevak</b> for 249.60 points (1 mins 8 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      211.08 (for 344 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Prefix free sets are a useful thing in many computer science applications. For example
a prefix free set as an alphabet is good because it can be parsed in an easy and
deterministic manner. This idea is used in <a href="http://en.wikipedia.org/wiki/Huffman_coding">huffman</a>
coding for compression. This made this problem particularly natural and therefore good
(at least in my not so humble opinion).
</p>
<p>
To solve it, the main idea was to see that if you have a forbidden pair (s,t) where s is a prefix
of t, it was always better (or equal) to remove s. Many people found this clear enough to solve the problem pretty quickly, but if you need a formal proof, here goes:
</p>
<p>
Let S be the set of words, let (s,t) be a pair belonging to S such that s is a prefix of t.
We want to prove that the largest subset of S - {s} that is prefix-free has a less or equal
number of elements that the largest subset of S - {t} that is prefix free. Let A be a prefix-free
subset of S - {s} that has maximum number of elements. Let A' be (A - {s}) U {t}.
</p><p>
We want to show that:
</p><p>
1. A' is a subset of S - {t}. This follows clearly from construction of A'.<br/>
2. A' has at least the same number of elements of A. This also follows clearly
from construction because you substract at most one element and add exactly one element
(because since A is a subset of S - {t}, A - {s} cannot already contain t).<br/>
3. A' is prefix free. Since A is prefix-free, there is no pair of distinct elements
(x,y) such that x is a prefix of y. In A' the only pairs (x,y) that could be forbidden
are the ones of the form (t,y) for some y (because all other pairs are not forbidden because
both elements appear in A too). If a pair of the form (t,y) is forbidden, (s,y) is forbidden
too, because being a prefix is a transitive relation. And (s,y) is in A, therefore is not
forbidden, so (t,y) is not forbidden. In conclusion, A' has no forbidden pairs and therefore
is prefix-free.<br/>
</p><p>
With 1, 2 and 3 proved, the initial proposition is demonstrated.
</p><p>
The straightforward implementation was following this pseudo-code:
</p><pre>
for each i in 0 .. words - 1
   for each j in i+1 .. words-1
      if words[i] is a prefix of words[j]
         remove words[i] and start again.
return the size of words
</pre><p>
For a clear implementation of this idea see
<tc-webtag:handle coderId="10574855" context="hs_algorithm"/>'s
<a href="/stat?c=problem_solution&rm=249269&rd=9993&pm=6569&cr=10574855">code</a>.
</p><p>
There were also many optimizations that could be done, but this is
perfectly within the time limits. For a discussion of those optimizations
see <a href="http://forums.topcoder.com/?module=Thread&threadID=512241">this thread</a>
in the forums.


</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6517&amp;rd=9993" name="6517">ParallelProgramming</a></b>
</font>
<A href="Javascript:openProblemRating(6517)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505988" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      119 / 469 (25.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      66 / 119 (55.46%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>hohosky</b> for 829.14 points (13 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      621.78 (for 66 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
There were many different solutions for this problem, all relying on the same
idea. I'll examine two similar approaches, one using a prewritten graph algorithm
and the other without it, for people who are not familiar with graphs. Finally,
I'll point out the simplest code I've seen that only simulates the situation.
</p>
<h3>The idea using some graph theory</h3>
<p>
The first step is running a
<a href="http://en.wikipedia.org/wiki/Topological_sorting">topological sort</a>
on the dependencies graph given. If you do not know what is this, simply
follow the link to a brief and clear explanation of its meaning and implementation.
</p>
<p>
This could lead to two possible outcomes:
</p><p>
1. There is a cycle, and no topological sort is possible: In this case, our
program simply returns -1, because if there are cyclic dependencies neither
process in the cycle will ever be able to start, so it's impossible to
finish them all.<br/>
2. There is no cycle, in this case, we have a topological sort of the graph
as output.<br/>
Let A[0], A[1], ... , A[N-1] be an array where A[i] is the number of the ith process
in the topological ordering. The following pseudocode solves the problem:
</p><pre>
set N = number of processes
set startTime = an array of N integer elements
set endTime = an array of N integer elements
for i = 0 to N-1
   set p = A[i]
   startTime[p] = 0
   for each x such that p depends on x
      startTime[p] = max(startTime[p], endTime[x])
   endTime[p] = startTime[p] + time[p]

return the maximum element of endTime
</pre><p>
The idea is simple, start each process as soon as possible. Since they are calculated
in the order given by the topological sort, when a process is processed to calculate
it's starting time, all it's dependencies are calculated (because topological sort
gives an order such that each edge goes forward, so dependencies are always before
in the order). When all starting and ending times are calculated, simply return
the latest end time.
</p>
<h3>The idea without using some graph theory</h3>
<p>
Here is the pseudocode:
<pre>
set N = number of processes
endTime = array of N integer elements
canWork = array of N boolean elements
for i = 0 to N-1
   canWork[i] = process i has any dependencies?
   if canWork[i]
      endTime[i] = time[i]

do
   set changes = false

   for i = 0 to N-1
      if canWork[i] is false
         set canStart = true
         set startTime = 0
         for each x such that i depends on x
            if canWork[x] is false, set canStart = false
            startTime = max(startTime, endTime[x])
         if canStart
            changes = true
            canWork[i] = true
            endTime[i] = startTime + time[i]
while changes

if every element of canWork is true
   return the maximum element of endtime
else
   return -1
</pre>
The idea here is the same as before, but we don't precalculate the order in which we have to process
the processes &ndash; instead, we simply process each item we can until we can't process anything. If everything was processed,
the latest end time is the answer, and if some processes were left unprocessed (ironically), we return -1.
</p>
<h3>The simulation idea (if you prefer looking at code to reading)</h3>
<p>
See <a href="/stat?c=problem_solution&rm=249297&rd=9993&pm=6517&cr=22628707>code</a>
by <tc-webtag:handle coderId="22628707" context="hs_algorithm"/>. A tip to understand the code, that is
simple and self-explanatory: <tt>time[i] = 0</tt> means process i is already terminated.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6465&amp;rd=9993" name="6465">CrazyRunning</a></b> </font> <A href="Javascript:openProblemRating(6465)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505988" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      19 / 397 (4.79%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      17 / 19 (89.47%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dmytro</b> for 413.27 points (17 mins 36 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      258.40 (for 17 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Picture yourself as an average division 1 coder. You have just quickly finishedy quickly the easy problem and think
that there's enough time left to take the medium slow. The 50 extra points contribute to this impression. After
reading the problem statement, you write down some numbers and mathematical expressions, maybe think about a
dynammic programming approach, but nothing convinces you. After 15 minutes of doing this, you are mad at yourself
and take a look at the division summary: Nobody has submitted! Not even one of the many coders that have several
hundred rating points more than you. Now you are not mad at yourself anymore &ndash; you are mad at  John and
his inability to develop a decent running strategy.
</p>
<p>
Solving this problem required imagination and either faith or a good proof. The strange thing in this case
is that almost everybody solved it differently, but the idea behind all solutions is the same: Any input has the same
answer as having 1 corridor of length corridors[0] and N-1 of length average(corridors[1],...,corridors[N-1]).
</p>
<p>
At this point, I could invoke faith and keep writing the rest of the problem, but I won't, because I want you
all to keep being mad at John and not mad at me. I also won't give a mathematical proof because it would be too long
and annoying. I will, instead, give an informal proof or idea.
</p>
<p>
After John finished running, he can make a list of the corridors he visited in order.
This list is finite and starts with 0. One way to express the expected
length is to calculate the probability of such a sequence happening and
then calculate the infinite sum of all sequence probabilities multiplied
by the length of the path in each case:<br/>
sum over each list : prob(list)*length(list)<br/>
<br>
Here the length is the sum of twice the length of each mention of each corridor, with
  the exception of the first and last, which are added only once.</p>
<p>
In this summation, all terms can be
divided in groups of (N-1)! lists such that:
<ul>
<li>All have the same length</li>
<li>For any pair (p,q), there exists a permutation of N in which perm[0]=0
and all other elements can be in any order, such that if the permutation
is applied to all elements of p, the resulting list is q.</li>
</ul>
This last property means that in each case the list is basically the same but each corridor is
playing the part of some other corridor, with the special case of 0 (since all lists start with 0,
we cannot make another corridor take its place because it will result in a list starting with a
non-zero element).
</p>
<p>
Of course, all these lists have equal probability, so we can take the common factor out and <br/>
sum over each of the groups:<br/>
   prob(anyListInTheGroup)*(sum over each member of the group: length(member))<br/>
    <br>
  Now, suppose we write all members of a group one below the other. Some columns contain pure 0s (because
it is never transformed). The rest of the columns have (N-2)! times each of the N-1 other corridors.
It's clear now than when summing the length of each member of the group, each corridor except corridor 0
contributes the same number of times, and therefore, as long as the sum of them is maintained constant,
the actual values can be changed without changing the result. Replacing each one for the average, of course,
maintains the sum constant.
</p>
<p>
Now we have a problem with 3 parameters:<br/>
N = size(corridors), c0 = corridors[0] and cr = average(corridors[1], corridors[N-1]).<br/>
From here on there are many different approaches, and using some math tricks can greatly
reduce the coding. That depends on what you do better, coding or solving equations. I'll
explain one intermediate approach.
</p>
<p>
Let f(n) be the expected length of a path when you are in the center, coming from a corridor
that is not the first one, and having n corridors left to visit. At the beginning you run
to the center, then run to the outer end of some corridor that is not the c0, and the run back
to the center, so the solution to the problem is c0 + cr * 2 + f(N-2). The only thing left is
to see how to calculate f.
</p>
<p>
When you are in the situation described, exactly one of these 4 things can happen:
<ul>
<li>Enter a visited corridor that is not corridor 0</li>
<li>Enter corridor 0 and then a different already visited corridor</li>
<li>Enter an unvisited corridor</li>
<li>Enter corridor 0 and then an unvisited corridor (both times getting back to the center)</li>
</ul>
Is easy to see that the 4 cases cover every possibility. In the first 2 you are in the same situation
and in the last 2 you are in situation n-1, so the general expression for f is:<br/>
f(n) = p1*(cr*2+f(n)) + p2*(2*c0+2*cr+f(n)) + p3*(2*cr+f(n-1)) + p4*(2*c0+2*cr+f(n-1))<br/>
where p1, p2, p3 and p4 are the probabilities of each case and each one appears multiplied by the expected
length to finish if that's the case. Note that the number of "moves" of each case is not the same for all
of them, but that's not important as long as all cover disjoint cases.
</p><p>
Let's calculate the probabilities:
<ul>
<li>p1 = (N-n-2)/(N-1), because there are N-n visited corridors, one is forbidden (the one we
just came from) and one is corridor 0.</li>
<li>p2 = 1/(N-1) * (N-n)/N-1, because there is 1/(N-1) probability of entering corridor 0
and after doing that we have any of the visited nonzero corridors available.</li>
<li>p3 = n/(N-1), because John can enter any of the unvisited corridors.</li>
<li>p4 = 1/(N-1) * n/N-1, the same as p2 for corridor 0 and then it's possible to enter any unvisited corridor.</li>
</ul>
At this point, it's easy to check that p1+p2+p3+p4=1. If n=1 the "+f(n-1)" have to be replaced by a "-cr"
because in those two cases John runs to the outer end of that last corridor and stops. This can be done
by setting f(0) = -cr.
</p><p>
Now, to calculate f, we can do it with great precision with the following code:
</p><pre>
f(n)
   if n is 0 return -cr
   rec = f(n-1)
   p = 1
   r = p3*(2*cr+rec) + p4*(2*c0+2*cr+rec) <i>//time to finish</i>
   while p > reallySmallEpsilon
      r = r + p*p1*2*cr + p*p3*2*cr
      p = p * (p1 + p3) <i>//probability of remaining unfinished</i>

   return r
</pre>
<p>
It's good to calculate any recursive function dependent only on itself and smaller terms. In this
case memoization is not needed because there is only one call to f(n-1), but it may be needed if f(n) is dependant
on more than one term apart from itself. I think its a good idea to implement this, to have the idea clear for
further use in future competitions.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6546&amp;rd=9993" name="6546">BasketballStrategy</a></b>
</font>
<A href="Javascript:openProblemRating(6546)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505988" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      950 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      66 / 397 (16.62%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      47 / 66 (71.21%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 658.42 points (20 mins 57 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      452.23 (for 47 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>

This problem is pretty straightforward if you know a little about many aspects
of programming. You needed some, but not much, of:
<ul>
<li>Probabilities</li>
<li>Graph theory</li>
<li>Math</li>
<li>Integer or algebraic geometry</li>
<li>Floating point or euclidian geometry</li>
</ul>
Let's take it one step at a time, first what was obviously needed was to know the exact
probability of an arbitrary pass between two of your players or an arbitrary shot. This
two things were similar, with the only difference of the final formula.
</p>
<p>
To make everything simpler it is better to have a point structure or class defined that has
two double precision (<tt>double</tt>) floating point members: x and y. Also have the + and -
operators as applying the operator to both x and y. Since the only non-given variables of
the formulas are <tt>ls</tt> and <tt>dr</tt>, we will calculate them and then apply the
corresponding formula with the corresponding given constant.
</p>
<pre>
double length(point from, point to)
   set relTo = to - from
   return sqrt(relTo.x<sup>2</sup>+relTo.y<sup>2</sup>)

double probability(bool isShot, point from, point to, point[] rivals)
   double ls,dr;
   set ls=length(from, to)
   set dr = calculateDr(from, to, rivals)
   if isShot
      return applyShotFormula(ls, dr)
   else
      return applyPassFormula(ls, dr)
</pre></p>
Now we need the calculation of dr function:
</p><pre>
double calculateDr(point from, point to, point[] rivals)
   double dr = 10<sup>200</sup>
   <i>//note here that making dr really big by default
   //makes the dr/(dr+1) term practically equal to 1
   //if no rival can intercept</i>
   for each r in rivals
      if canIntercept(from, to, r)
         dr = min(dr, perpendicularDistance(from, to, r))
   return dr
</pre>
<p>
Up to this point everything is easy and intuitive. Let's get to
the first problem: how far is a rival that we know we can intercept?<br/>
If we see the 3 points as a triangle, the perpendicular line
that passes through the rival point is one height, and since we
can easily calculate the base corresponding to that height
(because is the distance of the pass) and also the area of
the triangle
(<a href="http://mcraefamily.com/MathHelp/GeometryTriangleAreaVector.htm">using cross product</a>),
we have it all:
</p><pre>
double perpendicularDistance(pint from, point to, point r)
   set area = triangleArea(from, to, r)
   set base = length(from, to)
   return area * 2 / base

double triangleArea(point p1, point p2, point p3)
   return abs(crossProduct(p2-p1,p3-p1))/2

double crossProduct(point p, point q)
   return p.x*q.y-q.x*p.y
</pre>
<p>
About testing for ability of each rival to intercept the trajectory, as was discussed
<a href="http://forums.topcoder.com/?module=Thread&threadID=512250">in the forums</a>,
it can be done with pure integer arithmetic, avoiding small precision errors. In general,
when you need to test a boolean condition it's almost a must to use only integers; a small precision error can easily change true to false or false to true and
that could further lead to much bigger precision errors (see the linked thread in
the forums with a better explanation and discussion of this point).
</p>
<p>
Let's see the triangle formed again. For a rival to be in position to intercept
the trajectory, the two angles formed by the trajectory line and each of the
lines that connect the rival with each of your players have to be less than or
equal to 90 degrees. Testing this is equivalent to say that the
<a href="http://en.wikipedia.org/wiki/Dot_product">dot product</a>
of the relative vectors is greater than 0 (this follows from algebraic definition
of angle, that can be found in the link above). Following this reasoning, the
code for this part is:
</p><pre>
<i>//for this part we need the points to have integer coordinates or use
//different points structures</i>
boolean canIntercept(point from, point to, point r)
   return dotProduct(from-to,r-to) &gt;= 0 and dotProduct(to-from,r-from) &gt;= 0

int dotProduct(point p, point q)
   return p.x*q.x+p.y*q.y
</pre>
<p>
At this point we have left geometry behind and can easily build a lovely graph
that has one node for each of our players and one node for the scoring place.
Each pair of nodes has a connecting edge that is labeled with the probability
of that pass or shot being succesful. What we need now is a
<a href="http://en.wikipedia.org/wiki/Path_graph">path</a> in that graph
that goes from the starting player to the scoring place such that the product
of the labels each traversed edge (the probability of the strategy represented
by that path) is maximum.
</p>
<p>
For some people its obvious that you can easily adapt any shortest path algorithm
to solve this, simply changing minimum for maximum and adding for mutliplying. If
you are not part of that group, or would like to reuse your prewritten
<a href="http://en.wikipedia.org/wiki/Dijkstra_algorithm">Dijkstra</a>,
<a href="http://en.wikipedia.org/wiki/Floyd-Warshall_algorithm">Floyd-Warshall</a> or
<a href="http://en.wikipedia.org/wiki/Bellman_Ford">Bellman-Ford</a> without modifying
anything inside, see the following magical idea.
</p>
First step: Build the minus logarithm graph. This graph is the same but each label l
is transformed to -log(l) (the base of the logarithm is not important).<br/>
Second step: Find the shortest path from player 0 to scoring place in this new graph.<br/>
Since this starts to sound <b>too</b> crazy, let's explain and continue after that.
Shortest path in this new graph is a path in which the sum of the new labels is minimum.
This sum, in terms of old labels, can be written as:<br/>
(-log(l<sub>1</sub>)) + (-log(l<sub>2</sub>)) +  ... + (-log(l<sub>n</sub>)) <br/>
where l<sub>i</sub> are the labels in the original graph of each corresponding edge.
From that expression we can derive the following:<br/>
(-log(l<sub>1</sub>)) + (-log(l<sub>2</sub>)) +  ... + (-log(l<sub>n</sub>)) = <br/>
- ((log(l<sub>1</sub>) + log(l<sub>2</sub>) +  ... + log(l<sub>n</sub>)) = <br/>
-log( l<sub>1</sub> * l<sub>2</sub> * ... * l<sub>n</sub>) <br/>
Since this last expression was minimized (because we looked for a shortest path), that
means that the opposite expression was maximized. And since the logarithm is an
strictly monothonic increasing function the inside expression<br/>
l<sub>1</sub> * l<sub>2</sub> * ... * l<sub>n</sub><br/>
is maximal. To find it's value, simply take L = the length of the shortest path
found, and calculate b<sup>-L</sup>, where b was the base used for logarithms (any
positive base is ok).
</p>
<p>
To see any shortest path algorithm work, think that since oringal labels
lie on (0;1] interval, the logarithm is always non-positive and the minus
logarithm is therefore always non-negative.
</p>
<p>
After seeing this "magical" approach, maybe you are convinced that the initially
mentioned approach of simply changing &lt; for &gt; and + for * works.
If you are not, maybe you should. And if you don't think you should, come discuss in the forums.
</p>
<p>
For an implementation you can see
<tc-webtag:handle coderId="19929536" context="hs_algorithm"/>'s
<a href="/stat?c=problem_solution&rm=249270&rd=9993&pm=6546&cr=19929536">code</a>,
its similarly modularized to this presentation (he uses Dijkstra and generates the labels
of the graph on demand). 
To see the integer arithmetic in intercept ability test, see
<tc-webtag:handle coderId="19786437" context="hs_algorithm"/>'s
<a href="/stat?c=problem_solution&rm=249262&rd=9993&pm=6546&cr=19786437">code</a>.
</p><div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
