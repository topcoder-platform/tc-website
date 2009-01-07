<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 424 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13515">Match Overview</a><br />
    <tc-webtag:forumLink forumID="524438" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 424</span><br />Thursday, November 6, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
This match attracted 1301 participants - 561 in Division I and 740 in Division II. Both divisions featured quite
easy problemsets. The easy problem in Div-I was quite straightforward, 600-pointer required some insight to solve
and 900-pointer was an exercise on using binary indexed trees. 
<tc-webtag:handle coderId="10574855" context="algorithm"/> was pretty fast and gained his
48th match victory even after scoring -25 during the challenge phase. His concurrents were quite close behind -
<tc-webtag:handle coderId="20812309" context="algorithm"/> with the fastest 600-pointer submission
scored just 18.96 points less than <tc-webtag:handle coderId="10574855" context="algorithm"/> and took the second
place. <tc-webtag:handle coderId="19849563" context="algorithm"/> was the fastest on 900-pointer, but he
had to resubmit the 600-pointer and lose many
points because of this. With 125 points during the challenge phase he was able to claim the third position.
</p>
<p>
The winning receipt in Div-II was fast solving the Hard problem and having a couple of challenges.
<tc-webtag:handle coderId="22702038" context="algorithm"/> won
the match exactly in this way. <tc-webtag:handle coderId="22669151" context="algorithm"/> was the fastest
on the Hard problem, but without any challenges it
was only enough to claim the second spot. The third place was taken by
<tc-webtag:handle coderId="22722557" context="algorithm"/>.
</p>
 
<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10176&amp;rd=13515" name="10176">MagicSpell</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10176)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524438" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
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
      662 / 740 (89.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      594 / 662 (89.73%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>dolphin.orca</strong> for 248.43 points (2 mins 15 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.30 (for 594 correct submissions) 
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
<strong><a href="/stat?c=problem_statement&amp;pm=10177&amp;rd=13515" name="10177">ProductOfDigits</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10177)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524438" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
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
      554 / 740 (74.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      371 / 554 (66.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Alex_KPR</strong> for 495.60 points (2 mins 41 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      369.20 (for 371 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

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
      554 / 561 (98.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      474 / 554 (85.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>bmerry</strong> for 249.35 points (1 mins 27 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      220.63 (for 474 correct submissions) 
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
  Map&lt;Integer, Integer&gt; memo = new HashMap&lt;Integer, Integer&gt;();

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
    if (n>1) return -1;

    res+=n3/2;
    n3%=2;
    res+=n2/3;
    n2%=3;
    if (n3+n2==3)
      res+=2;
    else if (n3+n2>0)
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
<strong><a href="/stat?c=problem_statement&amp;pm=10172&amp;rd=13515" name="10172">BestRoads</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10172)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524438" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      159 / 740 (21.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      30 / 159 (18.87%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>[G][U]nawan</strong> for 578.92 points (24 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      444.36 (for 30 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
It's not hard to see that the required set doesn't exist in the following 2 cases:
<ul>
<li><strong>M</strong> is greater than the total amount of roads;</li>
<li>the set of all roads is not connected.</li>
</ul>
</p>
<p>
If we don't have any of these 2 cases, a connected set of <strong>M</strong> roads can be constructed as follows. First
find any spanning tree (it contains N-1 roads) and then add any <strong>M</strong>-N+1 free roads to this tree.
However, there's one problem -- we've constructed an arbitrary connected set of <strong>M</strong> roads, but
in fact we need to construct such set with the highest priority.
</p>
<p>
To find the set with the highest priority, let's make two fixes to the presented approach. First, find the spanning
tree <em>with the highest priority</em> and then, add free roads <em>with the highest priority</em>. The second part
(adding free roads) is trivial and to solve the first one it's convenient to use
<a href="http://en.wikipedia.org/wiki/Kruskal's_algorithm">Kruskal's algorithm</a>. That is, we assign each vertex
into a separate component and check roads in the decreasing order of priority. If a road connects 2 cities from
different components, we add it to the tree and merge these components together, otherwise we skip it.
</p>
<p>
Java implementation of this approach follows.
</p>
<pre>
public class BestRoads {
  public int[] numberOfRoads(String[] roads, int M) {
    // initialization
    int N = roads.length;
    char[][] c = new char[N][N];
    for (int i=0; i &lt; N; i++) c[i] = roads[i].toCharArray();

    // Kruskal's algorithm
    int[] id = new int[N];
    for (int i=0; i &lt; N; i++) id[i] = i;
    int compCnt = N;
    int[] deg = new int[N];
    for (int i=0; i &lt; N; i++)
      for (int j=i+1; j &lt; N; j++) {
        if (c[i][j] == 'N' || id[i] == id[j]) continue;
        int idi = id[i], idj = id[j];
        M--; compCnt--;
        c[i][j] = 'N'; c[j][i] = 'N';
        deg[i]++; deg[j]++;
        for (int t=0; t &lt; N; t++) if (id[t] == idi) id[t] = idj;
      }

    // the set of all roads is not connected
    if (compCnt &gt; 1) return new int[] {};

    // adding free roads
    for (int i=0; i &lt; N; i++)
      for (int j=i+1; j &lt; N; j++)
        if (c[i][j] == 'Y' &amp;&amp; M &gt; 0) {
          M--;
          c[i][j] = 'N'; c[j][i] = 'N';
          deg[i]++; deg[j]++;
        }

    // M is greater than the total number of roads
    if (M != 0) return new int[] {};

    // return result
    return deg;
  }
}
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10174&amp;rd=13515" name="10174">StrengthOrIntellect</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10174)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524438" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      239 / 561 (42.60%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      106 / 239 (44.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ahyangyi</strong> for 554.99 points (8 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      349.02 (for 106 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's describe the state of our character by three parameters: (current strength, current intellect, current free points).
Here free points are those points that the character obtained and not yet has distributed to his parameters.
Initial state of the game is (1, 1, 0). The following two simple observations are crucial to solving the problem:
</p>
<ol>
<li>If our current parameters allow to complete a mission, it always makes sense to complete it. That is almost obvious,
we lose nothing and gain more free points.</li>
<li>Current free points are uniquely determined by current strength and intellect. Let the current state be (S, I, P).
By the previous observation we can easily calculate the number of gained points: it's the sum of <strong>points</strong>[i] by
all missions that we are able to complete with strength S and intellect I. Out of these gained points, exactly
S+I-2 needed to raise strength and intellect to S and I. All the other points are free and this number can be uniquely
determined.</li>
</ol>
<p>
The second observation allows us to present the state as (current strength, current intellect). Now it's clear that
the character's algorithm looks basically as follows:
</p>
<pre>
Set strength=1, intellect=1, free points=0;
While True
  Complete all possible missions that are not completed yet
  If there is no free points, break
  Make a decision: increase strength or intellect by 1
End While
</pre>
<p>
Our goal is to make decisions in such way that allows to complete the maximum number of missions. Note that this
number is also uniquely determined by our final strength and intellect, so in fact it's enough to find which
pairs (strength, intellect) the character can achieve and which he can't. After this, we can just choose
the pair (strength, intellect) which is possible to achieve and which allows to complete the maximum number of missions.
</p>
<p>
Let <em>can</em>(S, I) be true, if it's possible to achieve strength S and intellect I. Let's also <em>freePnt(S, I)</em>
be the number of free points the character has if he achieved strength S, intellect I and completed all possible missions.
When discussing the second observation, we gave the way to calculate <em>freePnt</em>(S, I). To calculate <em>can</em>(S, I),
we can use the following reccurrence:
</p>
<pre>
Can(1, 1) = true
Can(S, I) = true, if:
  a) S &gt; 1, freePnt(S-1, I) &gt; 0 and can(S-1, I)
or
  b) I &gt; 1, freePnt(S, I-1) &gt; 0) and can(S, I-1)
</pre>
<p>
The idea of this reccurrense is easy: to obtain strength S and intellect I, we must be able to either obtain strength S-1 and
intellect I and then increase strength by 1, or to obtain strength S and intellect I-1 and then increase intellect by 1.
</p>
<p>
Java implementation of this approach is presented below.
</p>
<pre>
public class StrengthOrIntellect {
  public int numberOfMissions(int[] strength, int[] intellect, int[] points) {
    boolean[][] can = new boolean[1001][1001];
    int[][] freePnt = new int[1001][1001];
    int res=0;
    for (int S=1; S&lt;=1000; S++)
      for (int I=1; I&lt;=1000; I++) {
        freePnt[S][I] = 2 - S - I;
        int missionCnt = 0;
        for (int x=0; x &lt; strength.length; x++)
          if (strength[x] &lt;= S || intellect[x] &lt;= I) {
            freePnt[S][I] += points[x];
            missionCnt++;
          }
        can[S][I] = (S == 1 &amp;&amp; I == 1 ||
                     S &gt; 1 &amp;&amp; can[S-1][I] &amp;&amp; freePnt[S-1][I]&gt;0 ||
                     I &gt; 1 &amp;&amp; can[S][I-1] &amp;&amp; freePnt[S][I-1]&gt;0);
        if (can[S][I]) res = Math.max(res, missionCnt);
      }
    return res;
  }
}
</pre>
<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=10170&amp;rd=13515" name="10170">ProductOfPrices</a></strong> 
</font> 
<a href="Javascript:openProblemRating(10170)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=524438" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      900 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      157 / 561 (27.99%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      69 / 157 (43.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ACRush</strong> for 870.42 points (5 mins 16 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      522.28 (for 69 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
In order to solve this problem, we need a structure that stores the information about some array A[1..N] of integers,
initially filled by zeros, and is able to perform two types of operations:
</p>
<ol>
<li>Set A[pos] := A[pos] + value (where value and pos are given and value can be of arbitrary sign).</li>
<li>Calculate sum(A, l, r) = A[l] + A[l+1] + ... + A[r-1] + A[r] (where l and r are given).</li>
</ol>
<p>
We need this structure to perform both operations in time O(log N). The way to achieve this is to use
Binary Indexed Trees (BIT). For those not familiar with BITs, please look at the following
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=binaryIndexedTrees">tutorial</a>.
</p>
<p>
In our solution we will use two BITs indexed 1..<strong>L</strong>. The first one is called <em>cnt</em> and <em>cnt</em>[i]
is the number of currently planted trees having a coordinate i (we increase all coordinates by 1 to fit them
into interval [1..L]). The second tree is called <em>dst</em> and <em>dst</em>[i] = <em>cnt</em>[i] * i. In other
words, <em>dst</em>[i] is the sum of coordinates of all trees planted at point i.
</p>
<p>
Suppose we want to plant a tree at point x[i] and wish to calculate its price in a fast way. There are
CL = sum(<em>cnt</em>, 1, x[i]-1) trees located to the left of x[i]. Each of these tree with coordinate x<sub>0</sub>
is located on distance x[i] - x<sub>0</sub> from our tree. So, the sum of all distances is 
CL * x[i] - sum(all x<sub>0</sub>) = CL * x[i] - sum(<em>dst</em>, 1, x[i]-1).
Similarly, there are CR = sum(<em>cnt</em>, x[i]+1, L) trees located to the right of x[i] and the sum of distances for
them is sum(<em>dst</em>, x[i]+1, L) - CR * x[i]. So the total price of the tree can be calculated as follows:
</p>
<pre>
price = x[i] * (sum(cnt, 1, x[i]-1) - sum(cnt, x[i]+1, L)) +
        sum(dst, x[i]+1, L) - sum(dst, 1, x[i]-1)
</pre>
<p>
After the price is calculated, we just need to update <em>cnt</em> and <em>dst</em>: <em>cnt</em>[x[i]] := <em>cnt</em>[x[i]] + 1,
<em>dst</em>[x[i]] := <em>dst[x[i]]</em> + i. The overall complexity of this approach is O(N * logL), which is fine
to fit within the time limit.
</p>
<pre>
public class ProductOfPrices {
  long[] sumDst = new long[200001];
  long[] sumCnt = new long[200001];

  // BIT operations implementation
  void add(long[] s, int pos, int value) {
    while (pos &lt;= 200000) {
      s[pos] += value;
      pos |= pos - 1;
      pos++;
    }
  }

  long getSum(long[] s, int pos) {
    long res = 0;
    while (pos &gt; 0) {
      res += s[pos];
      pos &= pos - 1;
    }
    return res;
  }

  long getSum(long[] s, int l, int r) {
    if (l &gt; r) return 0;
    return getSum(s, r) - getSum(s, l - 1);
  }

  public int product(int N, int L, int X0, int A, int B) {
    int[] x = new int[N];
    x[0] = X0 % L;
    for (int i=1; i &lt; N; i++)
      x[i] = (int)(((long)x[i-1] * (long)A + (long)B) % L);

    long res = 1;
    add(sumDst, x[0] + 1, x[0] + 1);
    add(sumCnt, x[0] + 1, 1);
    for (int i=1; i &lt; N; i++) {
      long price = (long)(x[i] + 1) * (getSum(sumCnt, 1, x[i]) -
                                       getSum(sumCnt, x[i]+2, L))
                   - getSum(sumDst, 1, x[i]) + getSum(sumDst, x[i]+2, L);
      price %= 1000000007;
      res = (res * price) % 1000000007;
      add(sumDst, x[i] + 1, x[i] + 1);
      add(sumCnt, x[i] + 1, 1);
    }

    return (int)res;
  }
}
</pre>
<br />


<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
