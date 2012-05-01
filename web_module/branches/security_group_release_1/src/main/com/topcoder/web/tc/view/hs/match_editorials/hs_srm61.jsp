<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 61 Problem Set &amp; Analysis</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13530&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="524439" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 61</span><br />Thursday, November 6, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
This TCHS match turned out to be quite easy - out of 87 participants, 42 solved the Hard and 31 solved all three problems.
Within such conditions, coding speed was the deciding factor. Young 13-year old
<tc-webtag:handle coderId="22263204" context="hs_algorithm"/> showed excellent
performance and took the first place. For the second HS SRM in a row he makes the fastest
submission times on *all* problems!
<tc-webtag:handle coderId="22686287" context="hs_algorithm"/> and
<tc-webtag:handle coderId="22737276" context="hs_algorithm"/> were just a bit slower and took the second
and third places, respectively.
</p> 
 
<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10176&amp;rd=13530" name="10176">MagicSpell</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10176)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524439" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      83 / 87 (95.40%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      75 / 83 (90.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tourist</strong> for 249.50 points (1 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      222.24 (for 75 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
As it often happens with DivII-Easy problems, to solve this one you just need to implement everything from the
statement properly. One of the ways to do it is as follows:
<ol>
<li>Construct a string <em>AZ</em> containing all 'A'/'Z' characters from <strong>spell</strong>, in order. For example, it would be
"AZAZAA" for <strong>spell</strong>=AABZCADZA.</li>
<li>Set current position to be the last character of the <em>AZ</em> string. Iterate through the characters of <strong>spell</strong>,
from left to right. If the next character is not 'A' or 'Z', just append it to result. Otherwise, append the character
from <em>AZ</em> at current position to result and decrease current position by 1. (In other words, current position
iterates by characters of <em>AZ</em> from right to left and therefore includes them into result in the reversed order.)</li>
</ol>
</p>
<p>Java implementation of this approach can look as follows:</p>
<pre>
public class MagicSpell {
  public String fixTheSpell(String spell) {
    // step 1
    String az="";
    for (int i=0; i&lt;spell.length(); i++)
      if (spell.charAt(i)=='A' || spell.charAt(i)=='Z')
        az += spell.charAt(i);

    // step 2
    String res="";
    int pos = az.length()-1;
    for (int i=0; i&lt;spell.length(); i++)
      if (spell.charAt(i)=='A' || spell.charAt(i)=='Z')
        res += az.charAt(pos--);
      else
        res += spell.charAt(i);
    return res;
  }
}
</pre>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10177&amp;rd=13530" name="10177">ProductOfDigits</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10177)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524439" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      82 / 87 (94.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      57 / 82 (69.51%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tourist</strong> for 498.59 points (1 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      422.43 (for 57 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem allows for many different approaches. Let's present 3 of them.
</p>

<p>
<em>1. Memoization.</em> Let F(X) be the smallest number of digits required to obtain the product X. Obviously, we need to
find F(<strong>N</strong>). There's a following simple reccurrence to calculate F(X). If X &lt; 10, then F(X) = 1 (one digit is enough).
Otherwise, iterate through all digits d from 2 to 9 (it never makes sense to use digit 1 because it doesn't change the
product of digits), inclusive, such that X is divisible by d and try to use d as a first
digit of our number. If d is a first digit, then the product of the rest must be X/d and it requires F(X/d) digits to
fill the rest. Therefore, F(X) = min{F(X/d) + 1} by all d, 2 &le; d &le; 9, such that X is divisible by d.
</p>

<p>
Having such a reccurrence, we have two ways to evaluate it. The first is to create a table F of size <strong>N</strong> and to calculate
values F[1], F[2], ..., F[<strong>N</strong>], in order. Unfortunately, <strong>N</strong> can be as large as 10^9 what makes this approach
impossible. The other approach is to use recursion with memoization. Let's estimate the number of states that will be
visited if we calculate F(<strong>N</strong>) in such way. Note that digits from 2 to 9 have only primes 2, 3, 5 and 7 in their
factorization. Therefore if <strong>N</strong> = 2^A * 3^B * 5^C * 7^D * n, each recursive call will be made for a number representable
as 2^a * 3^b * 5^c * 7^d * n, where 0 &le; a &le; A, 0 &le; b &le; B, 0 &le; c &le; C, 0 &le; d &le; D. It means that
the number of recursive calls is at most (A+1)*(B+1)*(C+1)*(D+1) &le; (29+1)*(18+1)*(12+1)*(10+1) = 81,510. So the number of
visited states is not very large and memoization approach will easily run in time.
</p>

<p>Java implementation of this approach follows.</p>

<pre>
import java.util.*;

public class ProductOfDigits {
  Map<Integer, Integer> memo = new HashMap<Integer, Integer>();

  int solve(int N) {
    if (N&lt;10) return 1;
    if (memo.containsKey(N)) return memo.get(N);
    int res = 1000;
    for (int i=2; i&lt;=9; i++)
      if (N%i==0) res = Math.min(res, solve(N/i)+1);
    memo.put(N, res);
    return res;
  }

  public int smallestNumber(int N) {
    return solve(N) == 1000 ? -1 : solve(N);
  }
}
</pre>

<p>
<em>2. Case analysis.</em> This approach works in O(1), but is somewhat harder to come with. Let's represent <strong>N</strong> as
2^A * 3^B * 5^C * 7^D * n. If n &gt; 1, then <strong>N</strong> is not representable as a product of digits (all digits have only
primes 2, 3, 5, 7 in their factorization). Let's assume that n = 1. There's only one digit divisible by 7 -- it's 7 itself.
Similarly, only 5 itself is divisible by 5. Therefore to obtain 5^C * 7^D we have only one choice -- to include C 5s
and D 7s into our number.
</p>
<p>
Now let's find the best way to obtain 2^A * 3^B.
</p>
<p><em>Lemma.</em> If B &gt; 1, then there's an optimal solution that contains digit 9.</p>
<p><em>Proof.</em> Suppose there's no optimal solution that contains 9. Then we have at least one of the following
possibilities.
<ul>
<li>The optimal solution contains 3 and 3. In this case we can replace these two 3s by one 9 and obtain a solution
with a smaller number of digits. Contradiction.</li>
<li>The optimal solution contains 3 and 6. We can replace them by 2 and 9 thus obtaining an optimal solution
that contains 9. Contradiction.</li>
<li>The optimal solution contains 6 and 6. We can replace them by 4 and 9. Contradiction.</li>
</ul>
<p>
<em>End of proof.</em>
</p>
<p>
In a similar way we can prove that if A &gt; 2, then there's an optimal solution that contains digit 8. Therefore
we can safely include floor(A/3) 8s and floor(B/2) 9s in our solution and what's left is only to solve the case when
A &le; 2 and B &le; 1. In this case there are only 6 possibilities: 1 requires 0 digits (having 1 means that we've
already obtained the required product using 5s, 7s, 8s and 9s), 2, 3, 4 and 6 require 1 digit and 12 requires 2 digits.
Here it's important to not forget about the following corner case: if <strong>N</strong> is initially 1, it requires 1 digit
instead of 0.
</p>
<p>This solution can be implemented in Java in the following way.</p>
<pre>
public class ProductOfDigits {    
  public int smallestNumber(int n) {
    if (n==1) return 1;
    int res = 0;
    int n2 = 0;
    int n3 = 0;
    while (n%2==0) {
      n/=2;
      n2++;
    }
    while (n%3==0) {
      n/=3;
      n3++;
    }
    while (n%5==0) {
      n/=5;
      res++;
    }
    while (n%7==0) {
      n/=7;
      res++;
    }
    if (n&gt;1) return -1;

    res+=n3/2;
    n3%=2;
    res+=n2/3;
    n2%=3;
    if (n3+n2==3)
      res+=2;
    else if (n3+n2&gt;0)
      res++;

    return res;
  }
}
</pre>
<p><em>3. Greedy.</em> It appears that the following greedy algorithm works correctly. Iterate through digits 9 to 2, in
decreasing order. For each digit, use it until <strong>N</strong> is divisable by it. The algorithm has very
simple implementation and intuitively seems to be correct, however, as always with greedy algorithms, one needs
to be very accurate and it's better to prove the correctness formally.
</p>

<pre>
public class ProductOfDigits {
  public int smallestNumber(int N) {
    if (N == 1)
      return 1;
    int p = 0;
    for (int i = 9; i &gt;= 2; i--)
      while (N % i == 0) {
        p++;
        N /= i;
      }
    return (N &gt; 1) ? -1 : p;
  }
}
</pre>

<p><em>Excercises.</em></p>
<p>1. Suppose the problem would be stated not in decimal system, but in system with base B. That is, you need to find
the smallest amount of numbers, each between 1 and B-1, inclusive, such that their product is <strong>N</strong>. Will the same
greedy algorithm as in approach 3 work correctly for every value of B?
In case of negative answer, what is the smallest value of B for which it doesn't work correctly?</p>
<p>2. Solve the following generalized version of the problem: find the smallest integer X such that the product of
its digits in decimal notation is exactly <strong>N</strong>.</p>


<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10173&amp;rd=13530" name="10173">ProgrammingRobots</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10173)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524439" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      63 / 87 (72.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      42 / 63 (66.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tourist</strong> for 972.16 points (4 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      711.94 (for 42 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's consider a simplified version of the problem, where we can assign different programs to different robots.
In this version, if two robots start in different connected components of the maze, we certainly can't bring
them to the same cell. And for all robots starting in the same connected component, they can be moved into the
same position. To do this, just choose an arbitrary cell from the component and assign a program to each robot
that makes him move the path from his starting position to the chosen cell. So, in order to solve this version,
we need to find connected components using
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=graphsDataStrucs2">BFS or DFS</a> and to choose
the component which contains the maximum amount of 'R' cells. This amount will be the answer.
</p>
<p>
Now what changes when we return to the original problem? The answer may seem surprising at the first glance.
Absolutely nothing changes. Still, robots from different components can't be brought into the same cell and
all robots from the same component can be moved into the same position. The first fact is still obvious, but
the second one is far from being obvious. Coders have two different ways of dealing with the second one. They
can experiment with several examples and just trust that this is always true. Or they can come with a formal proof.
Of course, the second way is safer, but at the same time it's harder and requires more thinking time.
</p>
<p>
Let us give a simple and nice proof of this fact (the idea of the proof belongs
to <tc-webtag:handle coderId="8433628" context="algorithm"/>, the problem writer).
</p>
<p><em>Theorem.</em> If two robots start from cells A and B and there's a path between these cells, then there's a program
that moves both robots into the same cell.
<p><em>Proof.</em> Let L be the length of the shortest path between A and B. It's enough for us to find a procedure that allows
to shorten the length of the shortest path between the robots on at least one cell. Then we can just apply this procedure at
most L times and the length of the shortest path between the robots will be 0, i.e. they will be in the same cell.</p>
<p>The required procedure can work as follows. Let's make both robots move a shortest path from A to B. One of the robots
(that starts at A) will certainly not encounter a wall during these moves. The other robot can encounter a wall,
but as only his next move leads to a wall, the shortest distance between the robots becomes at least one cell smaller
(the first robot comes a cell closer, while the second one stays in place), so we can stop the procedure
immediately after this. If the other robot also never encounters a wall, it's possible that the length of the shortest
path is still the same. If this is the case, let's make again both robots move a shortest path between them (note that this
path is still the same as from A and B). Repeat moving the shortest path until the second robot encounters a wall.
Note that this procedure can't last forever, because the maze is finite and each time we move robots along the shortest
path between them, we shift both of them on the same vector A-&gt;B. <em>End of proof.</em></p>
<p>Java implementation that uses DFS is provided below.</p>
<pre>
public class ProgrammingRobots {
  int N, M;
  int[] dx = new int[] {-1,1,0,0};
  int[] dy = new int[] {0,0,-1,1};
  boolean[][] used;
  int cnt = 0;

  void dfs(String[] maze, int i, int j) {
    used[i][j]=true;
    if (maze[i].charAt(j)=='R') cnt++;
    for (int t=0; t&lt;4; t++)
      if (i+dx[t]&gt;=0 &amp;&amp; i+dx[t]&lt;N &amp;&amp; j+dy[t]&gt;=0 &amp;&amp; j+dy[t]&lt;M &amp;&amp;
          maze[i+dx[t]].charAt(j+dy[t]) != '#' &amp;&amp; !used[i+dx[t]][j+dy[t]])
        dfs(maze, i+dx[t], j+dy[t]);
  }

  public int numberOfRobots(String[] maze) {
    this.N=maze.length; this.M=maze[0].length();
    used = new boolean[N][M];
    int res = 0;
    for (int i=0; i&lt;N; i++)
      for (int j=0; j&lt;M; j++)
        if (maze[i].charAt(j) != '#' &amp;&amp; !used[i][j]) {
          cnt = 0;
          dfs(maze, i, j);
          if (cnt&gt;res) res=cnt;
        }
    return res;
  }
}
</pre>
<br />


<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm" /><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
