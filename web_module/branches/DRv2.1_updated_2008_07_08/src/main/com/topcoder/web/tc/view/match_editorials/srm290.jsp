<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
<tc-webtag:forumLink forumID="505856" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 290</span><br>Thursday, February 16, 2006
<br><br>

<span class="bigTitle">Match summary</span>
<p>
Division 1 coders faced a pretty balanced set of 3 completely different problems. 
Petr showed a tremendous performance, 
outplaying the second (misof) and third (andrewzta) finishers by almost 500 points.
With his 15th SRM win, Petr shares with radeye the 4th place in career SRM wins.
dmwright (16) and tomek (19) aren't far ahead, but catching up to SnapDragon (39) may take a while...
</p> 
<p> 
In Division 2, 13 coders were able to solve the hard.
MMind and kappa took the top 2 spots, with newcomer neitsch at third, AJA and gootsa took fourth and fifth respectively.
All these coders advance to Div 1, except AJA who will need to compete in Div 2 at least once more.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5982&amp;rd=9811" name="5982">SpeedTyper</a></b> 
</font> 
<A href="Javascript:openProblemRating(5982)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505856" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
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
      293 / 308 (95.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      278 / 293 (94.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Viali</b> for 248.97 points (1 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      210.06 (for 278 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem, we need to first compute the average time it takes Johny to type a letter.
If <b>times</b> has N elements, then the total time needed to type all letters is <b>times[N - 1]</b> and 
the average is <b>times[N - 1]/N</b>. 
Now we just iterate through all letters and check whether typing this letter (<b>times[i]</b> - <b>times[i - 1]</b>) takes longer than average.
The only exception is the first letter, time for each can be computed as just <b>times[0]</b>.
Java code follows:
<pre>
    public String lettersToPractice(String letters, int[] times) {
        String ans = "";
        int N = times.length;
        if (times[0] * N > times[N - 1]) ans += letters.charAt(0);
        for (int i = 1; i < N; i++) if ((times[i] - times[i - 1]) * N > times[N - 1]) ans += letters.charAt(i);
        return ans;
    }
</pre>
Please note we replace division with multiplication to avoid floating point imprecision. 
Doing so when possible is a very useful habit.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5962&amp;rd=9811" name="5962">BrokenClock</a></b> 
</font> 
<A href="Javascript:openProblemRating(5962)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505856" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
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
      256 / 308 (83.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      140 / 256 (54.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>jerschneid</b> for 487.03 points (4 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      376.41 (for 140 correct submissions) 
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
      302 / 306 (98.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      218 / 302 (72.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>overwise</b> for 247.56 points (2 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      222.62 (for 218 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Many coders were trapped by this problem, though it didn't require any special skills or algorithms.
The hardest thing was to make sure you've chosen a correct approach. 
If you are not sure, sometimes its better to implement a bit longer but safer algorithm instead of trying to prove the short one.
</p>
<p>
The shortest was greedy algorithm.
It can be proved that the optimal strategy uses the minimal possible hours button clicks (the proof is left to reader).
Knowing the exact number of hours button clicks, we adjust minutes properly and find the exact number of minutes button clicks.
See <a href="/tc?module=MemberProfile&cr=10574855">Petr</a>'s 
<a href="/stat?c=problem_solution&rm=247651&rd=9811&pm=5962&cr=10574855">solution</a> for a clean implementation.
</p>
<p>
If you were not sure about the greedy approach during the contest, the problem could be brute forced through all reasonable strategies.
Even in a contest haste one can easily see that neither button should be clicked more than, say, 1000 times.
Therefore one can just iterate through all 1M cases, 
check for each case whether it fixes the clock and return the minimal number of clicks among all proper cases.
This approach isn't error-prone and doesn't require any tricks, so you are safe choosing it.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5980&amp;rd=9811" name="5980">GalaxyTrip</a></b> 
</font> 
<A href="Javascript:openProblemRating(5980)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505856" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
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
      61 / 308 (19.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 61 (21.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kappa</b> for 715.40 points (19 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      527.69 (for 13 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Being able to dissect a problem into subproblems was essential for this task 
(see antimatter's <a href="/tc?module=Static&d1=tutorials&d2=dissectProblem">article</a> on this). 
So, this problem consists of several parts. 
First, we need to find which machines can be taken independently, and can not.
As soon as we find all groups of machines which can be taken independently, 
we'll take powers of these groups and combine them to get the answer.
Lets look at these parts in order.
</p>
<p>
The most important detail to solve the first part is to note that dependency relation is symmetrical.
In other words, if machine A is dependent on machine B, then machine B is dependent on machine A.
Therefore all machines can be represented as vertices of the graph, where two vertices are connected 
if and only if they represent machines which depend on each other. 
One can easily see that if machine A needs machine B to work, and B needs machine C, then machine A needs machine C too.
Therefore, if vertices X1 and X2 are connected in our graph, then machines X1 and X2 can not be used apart. 
To solve first part of our problem, split the graph into connected components. 
For each connectivity component, we can either use all machines from it or don't use any of them,
therefore for each component we store only the number of vertices in it.
</p>
<p>
Now lets continue with the second part of our problem. 
We have a set of numbers (powers of connectivity components) and we want to find all possible sums 
of its subsets. 
Regarding coding details, you can use Floyd-Warshall to compute the transitive closure of the graph, 
and a simple BFS to find connectivity components. 
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5968&amp;rd=9811" name="5968">SnailRace</a></b> 
</font> 
<A href="Javascript:openProblemRating(5968)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505856" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      195 / 306 (63.73%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      165 / 195 (84.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>laibo</b> for 473.01 points (6 mins 51 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      285.83 (for 165 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First, you need to note that if George is slower than a snail, the answer will be <b>(distance - 1) / snailSpeed</b>. 
Therefore, we can concentrate on cases when George is faster than a snail.
</p>
<p>
The easiest way to solve the problem is a classical binary search, with the distance George carries each of snails as the parameter
(we can binary search over the time George spends carrying each snail as well).
At each step of the binary search, one can simulate the whole race, 
storing and changing the time spend and George's position. 
The optimal value is reached if George drops the last shail exactly 1 meter from the finish.
If he drops it earlier, we increase the time George carries each snail, and vice versa. 
</p>
<p>
Instead of simulating the process each time, we can find the place where George drops the last snail in O(1) time.
If George carries each snail for d meters, it takes him <b>d / georgeSpeed</b> to do this.
Snails will have enough time to cover <b>d1 = d * snailSpeed/ georgeSpeed</b>. 
Next, George and snails will move one to each other, covering <b>(d - d1)</b> with the speed of <b>(georgeSpeed + snailSpeed)</b>.
Playing with this formulas a bit gives you that it takes George <b>t0 = (2 * d) / (georgeSpeed + snailSpeed)</b> hours to carry a snail and return for the next one.
George will spend this time for each of the snails except for the last one.
Therefore, the total time snails will travel is equal to <b>T = (snails - 1) * t0 + (d / georgeSpeed)</b>, 
and the distance they'll pass is equal to <b>T * snailSpeed</b>.
If this is smaller than <b>distance - 1</b>, we increase d, otherwise we decrease it. 
See andrewzta's <a href="/stat?c=problem_solution&rm=247649&rd=9811&pm=5968&cr=11829284">solution</a>
for a clear implementation of this approach.
</p>
<p>
If this optimization isn't enough for you, you can avoid binary search at all, solving the last equation mathematically.
(see Petr's <a href="/stat?c=problem_solution&rm=247651&rd=9811&pm=5968&cr=10574855">solution</a>).
On the other hand, during the contest its really important to correctly estimate your skills and abilities.
If you think coding the "slow" binary search will take you less time than looking for the formula, it may be better to go with one of the first approaches.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5981&amp;rd=9811" name="5981">GalaxyExpedition</a></b> 
</font> 
<A href="Javascript:openProblemRating(5981)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505856" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1100 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 306 (10.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 31 (19.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 871.08 points (15 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      548.58 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
We can reword the problem in the therms of graph theory, building a graph of dependencies.
Each machines becomes a node of the graph, and, if machine A depends on machine B, we add a vertex from A to B.
First of all, the dependency relationship is transitive. 
That is, if machine A depends on machine B, and machine B depends on machine C, then machine A also depends on machine C
(because, if we won't take C, we won't be able to take B and, therefore, A). 
To use this property we build the transitive closure on the graph 
(further in this text, saying "dependent" will mean transitive dependency).
</p>
<p>
Now, like in the D2 hard problem, we need to group together machines which can not be used one without another.
In D2 hard problem we had a non-oriented graph and needed to find connectivity components. 
In this problem, the graph is oriented. Machines A and B cannot be used one without another if and only if there is a path from A to B and from B to A.
In other words, if A and B are in the same strongly connected component of the graph. 
Splitting the graph into strongly connected components is a classical problem, and low constraints for this problem allow you to choose from a number of algorithms.
</p>
<p>
As soon as we split the graph into strongly connected components, we find the component which isn't dependent on any other component 
(prooving that at least one such component always exists is left to the reader). 
Having this component found, we can split all vertices of the graph into 3 subsets: C, D and N. 
C will contain all vertices from the selected component, D contains all vertices which are <b>d</b>ependent on vertices from C, 
and N will contain all vertices which are not dependent on any vertice C (neither vertice from C can not depend on any vertices outside C by definition).
Next step will be proving that sets N and D are independent from each other (so, a machine from N can not depend on machine from D and vice versa).
</p>
<p>
First, all machines in D depend on machines from C. If machine A from N depends on machine B from D, then, because of the transitivity, machine A must depend on any machine from C.
But all machines from N are not dependent on any machine from C, therefore we are in conradiction.
<br>
Second, let machine A from D depend on machine B from N. But machine A from D also depends on any machine c1 from C. 
According to the problem statement, <i>"If a machine A depends on machines B and C, then B is dependent on C, C is dependent on B, or both B and C depend on each other."</i>.
Therefore, machine c1 depends on B or B depends on c1. Anyway, either of these cases contradicts the definition of set N. 
Our assumption is proved, so sets N and D are independent from each other.
</p>
<p>
Having that proved, we run the algo recursively on sets N and D, getting sets S<sub>N</sub> and S<sub>D</sub> as answers.
To solve the problem for the whole set, we need to consider three following cases.
<br>
In the first case, we don't take any machine from C. Therefore, we can't take any machine from D too, so each number from S<sub>N</sub> will be represented in the answer.
<br>
In the second case, we don't take any machines from N, but take all machines from C. 
Here, for any s1 from S<sub>D</sub>, the answer will contain (s1 + |C|), where |C| stands for the number of machines in C.
<br>
In the third case, we take all machines from C and may take some machines from N.
Then, for any s1 from S<sub>D</sub> and s2 from S<sub>N</sub>, (s1 + s2 + |C|) will be in the answer.
<br>
The answer for the whole problem will be the set containing all numbers which can be received in at least one of the cases mentioned above.
</p>
<p>
As an implementation note, representing the set of all possible answers as a long number (with the ability to take k machines represented as the k-th bit in the number) makes the coding much shorter and easier.
</p><div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
