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
    <A href="/stat?c=round_overview&er=5&rd=10659">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506225" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 335</span><br>Wednesday, January 17, 2007
<br><br>

<h2>Match summary</h2>

<a href="http://www.topcoder.com/stat?c=round_overview&er=5&rd=10659">Single Round Match 335</a> saw a fairly high number
of coders face a seemingly innocent -- but tough -- set of problems. In both divisions there were many failed submissions
in more than one problem. Luckily, many failures arose during the challenge phase, which was a great deal of fun and resulted
in big points for successful challengers.
<br /><br />
In division 1,
<tc-webtag:handle coderId="10574855" context="algorithm"/>
took the lead at the end of the match, despite his resubmission of the medium, thanks to the high score in both the easy and the hard problems and +200 during the challenge phase.
<tc-webtag:handle coderId="20315020" context="algorithm"/>
was second with solid performances on the problems and a n extra +150 due to challenges. <tc-webtag:handle coderId="310333" context="algorithm"/>
came in third because he "just" got +50 on challenges.
<br /><br />
In division 2, three newcomers attained yellow ranking by monopolizing the podium -- although first, second and third all finished within 75 points of each other, there was a margin of more than 150 point
between them and the fourth place finisher.
Suprisingly, the three top finishers all got the problems and exactly one succesful challenge each.
First place was taken by
<tc-webtag:handle coderId="22668451" context="algorithm"/>
with the fastest submission of the hard.
<tc-webtag:handle coderId="22669143" context="algorithm"/>
came in second and <tc-webtag:handle coderId="22659805" context="algorithm"/> took third.
<br /><br />

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7279&amp;rd=10659" name="7279">Palindromize</a></b>
</font>
<A href="Javascript:openProblemRating(7279)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506225" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      453 / 570 (79.47%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      371 / 453 (81.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sidag011235</b> for 249.11 points (1 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      185.65 (for 371 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem was a little tougher than the usual Division 2 easy problem, but the examples were very useful in helping to solve it. To start off, you have the string <b>s</b> and assume that the best answer adds exactly <i>k</i>
characters. Those <i>k</i> characters have to be the first <i>k</i> characters of <b>s</b> reversed because, after
adding them, we need it to become a palindrome. We can try every possible <i>k</i> until we find a palindrome.
For an  implementation on this idea see
<tc-webtag:handle coderId="22669143" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263342&rd=10659&pm=7279&cr=22669143">code</a>.
<br /><br />
Since this means the last size(<b>s</b>)-<i>k</i> characters of <b>s</b> must form a palindrome, it was
also possible to find for the largest such palindrome (a postfix of <b>s</b>) and then complete it properly.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6835&amp;rd=10659" name="6835">Multifactorial</a></b>
</font>
<A href="Javascript:openProblemRating(6835)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506225" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      392 / 570 (68.77%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      87 / 392 (22.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jekica</b> for 492.71 points (3 mins 28 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      354.88 (for 87 correct submissions)
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
      480 / 487 (98.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      288 / 480 (60.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 248.99 points (1 mins 49 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      215.79 (for 288 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem was about having a safe way to detect overflow in multiplication -- no matter what
the input was, the overflow or the result would appear with at most 20 factors multiplied, so runtime
was no issue. Since the
limit was close to the upper bound of a 64 bit integer, the detection method had to be a little trickier
than a simple greater than comparison.
<br /><br />
The selection of the method is a matter of personal choice, but my opinion is that the best approach is to multiply
and then check if the result is correct with a division and a modulus comparison. Since division and modulus
never overflow, this check is completely safe. Another way of looking at this is to see if the maximum possible
value divided by one of the factors is less than the other factor. Both approaches are equally safe and are fairly similar.
To see the code for this, check out the
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263309&rd=10659&pm=6835&cr=10574855">implementation</a>
<tc-webtag:handle coderId="10574855" context="algorithm"/> that was used to get the fastest submission.
<br /><br />
It was also safe to use large integer arithmetic. This was especially useful for Java coders. For an
example of this see <tc-webtag:handle coderId="22659805" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263322&rd=10659&pm=6835&cr=22659805">code</a>.
<br /><br />
Using floating point allows a greater upper bound than integers, but it's tricky because of the loss
of precision. Suprisingly, 80 bit floating points have enough precision to solve the problem, according to
<tc-webtag:handle coderId="21290434" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263349&rd=10659&pm=6835&cr=21290434">solution</a>.
<br /><br />
In a language without long doubles, you could use a mix of integer calculation for the cases without overflow or
with overflow by a little margin and a regular double to detect larger margin overflows, as
<tc-webtag:handle coderId="310333" context="algorithm"/>
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263316&rd=10659&pm=6835&cr=310333">did</a>.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7363&amp;rd=10659" name="7363">MinimumVariancePartition</a></b>
</font>
<A href="Javascript:openProblemRating(7363)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506225" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      68 / 570 (11.93%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      32 / 68 (47.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>MasterZerg</b> for 787.65 points (15 mins 39 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      581.91 (for 32 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem had one important first step after which, if you had enough experience with DP, it was pretty
straightforward. Many coders realized, without the need of a formal proof, that it was always optimal to sort
the sequence and then cut that it into pieces instead of taking subsets. I won't give a formal proof
here, but you can try doing it by taking an optimal solution that couldn't come from cutting the sorted sequence
and take it to  one that could with little steps that never increase the sum of variances.
<br /><br />
Once you grasped this idea, the problem is pretty classical: Among all the ways of cutting this, take
the one that minimizes a certain function (in this case, the sum of variances). Formally, we have a function f(i,k)
that represent the least sum of variances that can be obtained from the sequence that starts at index i, splitting
it into k or less pieces (since it's always better or equal to use more pieces, there is no need to worry about
making it exactly k, though it was pretty simple to do so). So, if A is the sorted array of mixed samples:
<ul>
<li>f(i,k) = 0 if i &gt;= length of A </li>
<li>f(i,k) = infinite if k &lt;= 0 and i &lt; length of A </li>
<li>f(i,k) = min{ f(j,k-1)+var(i,j) | i &lt; j &lt;= n } </li>
</ul>
where var is the function that calculates the variance of the partition that starts at index i and ends at
index j-1, inclusive. From the above formal definition to a memoized implementation is just a little step.
<br /><br />
Check out <tc-webtag:handle coderId="22006740" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263336&rd=10659&pm=7363&cr=22006740">solution</a> for
an example of the iterative version.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7337&amp;rd=10659" name="7337">ExpensiveTravel</a></b>
</font>
<A href="Javascript:openProblemRating(7337)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506225" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      254 / 487 (52.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      105 / 254 (41.34%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>krijgertje</b> for 488.89 points (10 mins 18 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      294.60 (for 105 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem sounded strange when read too fast, but the extra 50 points should have warned coders to approach it
with care. Many Division 1 coders realized that this was a shortest path problem right away, but the exact
way to do it was not that obvious. There were 2 possible approaches to it.
<br /><br />
<strong>Modified dijkstra</strong><br />
In this approach the basic idea is that if a node (cell) is on the path you are taking, you always want to
get there in the first interval that is possible. Among two ways of doing it during the same interval, you always want 
the one that has less cost consumed for that interval. From this reasoning, you could code a
<a href="http://en.wikipedia.org/wiki/Dijkstra's_algorithm">dijkstra algorithm</a> (even the O(n<sup>2</sup>)
version, since there are at most 2500 nodes) where at each node you keep the best pair
<i>&lt;interval,consumed_cost&gt;</i> found so far. As you can easily see, the invariant for the algorithm
is mantained with this kind of cost (furthermore, you can use any cost that has a total ordering of preference).
When examining edges out of the current closing node, you must check to see if it can be traversed during this
interval, or if it can be done by waiting until the next interval and then tranversing the edge
<br /><br />
For a clean implementation of this approach, see the
<a href=http://www.topcoder.com/stat?c=problem_solution&rm=263313&rd=10659&pm=7337&cr=251074>solution</a>
by <tc-webtag:handle coderId="251074" context="algorithm"/>.
<br /><br />
<strong>BFS + dijkstra to calculate edges</strong><br />
This idea was longer to code, but much more straightforward from the problem statement. Simpy run a dijkstra
from each cell to see which cells are reachable during an interval, add an edge to them, then do a BFS
in the resulting graph. The only trick here was that you needed a O(m*log(n)) dijkstra implementation in
order to get in on time, or to realize that only cells with manhattan distance less than 9 were reachable to avoid
getting an overall execution time of roughly O(n<sup>3</sup>), which was actually 180*n<sup>2</sup>. Both
cases, however, had a danger of timing out (actually, some naive implementations of a n<sup>2</sup> dijkstra may work if
you maintain a list with the currently open nodes instead of iterating all of them when looking for the one to close next).
<br /><br />
Check out <tc-webtag:handle coderId="8357090" context="algorithm"/>'s
<a href=http://www.topcoder.com/stat?c=problem_solution&rm=263296&rd=10659&pm=7337&cr=8357090>implementation</a>
on this idea.
<br /><br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7384&amp;rd=10659" name="7384">RandomFights</a></b>
</font>
<A href="Javascript:openProblemRating(7384)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506225" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      110 / 487 (22.59%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      78 / 110 (70.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 896.71 points (7 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      518.43 (for 78 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem had two important parts. The first was to reduce the formula from all possible pairings (<b>n</b>!)
to all possible pairs (<b>n</b><sup>2</sup>). Since O(<b>n</b><sup>2</sup>) was too high in this case, we needed to
play with the formula a little to find a faster way to calculate its result.
<br /><br />
Precision was also an important issue. In order to get it correct, you needed to do almost every calculation on
integers (long double alone was also not enough).
<br /><br />
First part: We need to calculate the expected result for any possible pairing. Since every possible pair is
in the same situation in the formula, then the correct result must be proportional to the average result for
a pair. In fact, it is the sum of the results of all pairs divided by <b>n</b> (this is the same as the
average result multiplied by <b>n</b>). This intuitive idea can be formalized by looking at the formula for
the expected result and associating to each pair its number of appearances in the sum (it's easy to see that it's
the same number for all pairs).
<br /><br />
Second part: We need the average value of a fight, and iterating through every possible pair is not feasible because of
the size of <b>n</b>. If we fix one member of A (let's call it a) we'll see that it contributes some positive
points -- because of the fights with all members of B with less strength -- as well as some negative ones -- because of
the fights with members of B with greater strength. If B is sorted, these two sets form a prefix and a postfix of
the B sequence, respectively. We are getting close, now we need to calculate the sum of each. Both are of the
form

<pre>(a-x<sub>1</sub>)<sup>2</sup>+(a-x<sub>2</sub>)<sup>2</sup>...+(a-x<sub>k</sub>)<sup>2</sup></pre>
for some X = {x<sub>1</sub>,...,x<sub>k</sub>} each time (X contained in B), so we can rewrite the formula as:
<pre>a<sup>2</sup>*k+sumOfSquares(X)-2*a*sumOf(X).</pre>
By calculating the accumulated sum and the accumulated sum of squares of B we can calculate the sum or
the sum of the squares of any contiguous subsequence given its start and end indices, including any
prefix or postfix. Since we can calculate those indices with binary search, we get an overall complexity
of <b>n</b>*log(<b>n</b>), which is small enough to fit on time. A clear C++ implementation of this idea follows:
<pre>
double expectedNrOfPoints(vector <int> AA, vector <int> BB, int n) {
    vector&lt;long long&gt; A=parse(AA,n), B=parse(BB,n); //parse generates the input of size n
    sort(B.begin(),B.end());
    vector&lt;long long&gt; SB(n+1,0);  //SB2[i]=sum of B[x] up to i-1
    vector&lt;long long&gt; SB2(n+1,0); //SB2[i]=sum of B[x]<sup>2</sup> up to i-1
    long long r=0;
    for(int i=1;i&lt;=n;++i) SB[i]=SB[i-1]+B[i-1], SB2[i]=SB2[i-1]+B[i-1]*B[i-1];
    for(int i=0;i&lt;n;++i) {
        long long l=lower_bound(B.begin(),B.end(),A[i])-B.begin();
        long long g=lower_bound(B.begin(),B.end(),A[i]+1)-B.begin();
        long long won=A[i]*A[i]*l+SB2[l]-A[i]*SB[l]*2; //sum of all fights won by member i of A
        long long lost=A[i]*A[i]*(n-g)+SB2[n]-SB2[g]-A[i]*(SB[n]-SB[g])*2; //sum of all fights lost by Ai
        r+=won-lost; //we do everything with 64 bit integer arithmetic
    }
    return double(r)/n; //only floating point operation
}
</pre>
<br /><br />
 

<div class="authorPhoto">
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
   <jsp:param name="level1" value="default"/>
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
