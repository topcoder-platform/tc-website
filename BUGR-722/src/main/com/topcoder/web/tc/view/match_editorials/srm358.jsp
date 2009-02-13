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
    <A href="/stat?c=round_overview&er=5&rd=10768">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516055" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 358</span><br>Tuesday, July 17, 2007
<br><br>



<h2>Match summary</h2> 

<p>
<tc-webtag:handle coderId="14970299" context="algorithm"/>, with fast time on all three problems, won the match thanks to a last minute challenge that left <tc-webtag:handle coderId="307060" context="algorithm"/>, with 7 successful challenges and a resubmit on the 500, behind. They were followed by <tc-webtag:handle coderId="20286298" context="algorithm"/>, <tc-webtag:handle coderId="7581406" context="algorithm"/> and <tc-webtag:handle coderId="14768757" context="algorithm"/> who also had all three problems solved and each had at least one successful challenge. Contestants faced a simple but tricky (and challengeable) 250, a moderate 500 that trapped many coders, and a 1000 that wasn't a big problem for red and top yellow with even some blue coders solving it.  
<br>
<br>

Division 2 was won by <tc-webtag:handle coderId="22687480" context="algorithm"/> with 300 points on challenges followed by <tc-webtag:handle coderId="22628075" context="algorithm"/> and  <tc-webtag:handle coderId="22688056" context="algorithm"/>.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7694&amp;rd=10768" name="7694">CyclicWords</a></b> </font> 
<A href="Javascript:openProblemRating(7694)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516055" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      452 / 565 (80.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      356 / 452 (78.76%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>srele</b> for 246.78 points (3 mins 15 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187.39 (for 356 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
For every word in the input check if it's the same as at least the one that appeared before it in the input.  If there is no such word, add 1 to the solution. The only thing that's left is to make a function that checks if the two words are the same. We can easily generate all the representations of one word. Two words are equal if and only if there exists at least one representation of the first word that is equal to the second word.
<br>
<br>

Also, we can normalize each word so the two words are equal if and only if their normalizations are equal.  Normalization of a word is its unique representation, which can be defined as the lexicographically lowest of all its representations. So, normalization of a word "ball" is lexicographically lowest of { "ball", "allb", "llba", "lbal" }, which is "allb".
<br>
<br>

For implementation using normalization refer to <tc-webtag:handle coderId="15534031" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265539&rd=10768&pm=7694&cr=15534031">solution</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7716&amp;rd=10768" name="7716">BrokenButtons</a></b> </font> 
<A href="Javascript:openProblemRating(7716)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516055" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      260 / 565 (46.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 260 (8.46%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tangyouze</b> for 431.30 points (11 mins 43 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300.65 (for 22 correct submissions) 
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
      454 / 476 (95.38%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      217 / 454 (47.80%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kia</b> for 245.88 points (3 mins 41 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      192.76 (for 217 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This one was a gold mine for people who found tricky cases like optimal solution navigating to
pages over 500,000. Also, many people's solution thought it can go to page 0 even if the button '0'
is broken. You had to be very careful in reading the statement as in the actual programming to solve it.
<br><br>

The Optimal entered page will never be larger than 1,000,000, so simple brute force will run in 
time. Many people wrongly understood the problem statement thinking you can't enter pages 
larger than 500,000. For every possible entered page (page for which the digit buttons are not 
broken) we navigate first to that page and then enter the '+' or '-' buttons. The number of 
presses required is the number of digits of the entered page (let's say page 100 has 0 digits) + 
the absolute difference between the entered and desired page (number of '+' or '-' button presses).
<br>
<br>

For a nice clean implementation see <tc-webtag:handle coderId="15604398" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265508&rd=10768&pm=7716&cr=15604398">solution</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7705&amp;rd=10768" name="7705">SameDigits</a></b> </font> 
<A href="Javascript:openProblemRating(7705)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516055" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      12 / 565 (2.12%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      0 / 12 (0.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>null</b> for null points (NONE) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      No correct submissions 
    </td>
  </tr>
</table></blockquote>
<p>
Classic example of dynamic programming unfortunately proved to be too hard for division 2 coders.
<br>
<br>

Let's first solve the problem of finding out how many n-digit numbers have the required 
property. Start building the number from left to right. The only things that we must know in 
a certain moment is how many digits we must add, how many last digits are the same, and whether we
reach the required maximum subsequence before. Let that number be f( n, last_same, did_reach ).
It is fairly easy to get the recurrence relation from this formula, as we know that 
exactly one number will increase the last_same by 1, and the other 9 numbers will downgrade 
it back to 1.
<br>
<br>

To get how many numbers with exactly n digits are there we call 9*f( n-1, 1, false ). 
For every number i from k to n we sum up number of solutions with exactly i digits and return the sum.
Java code follows:
<br><br>

<pre>
public class SameDigits {
    final static long MOD = 44444444;
    long[][][] memo;
    int K;

    long f( int n, int last_same, int did_reach ){
        if( memo[n][last_same][did_reach] != -1 ) return memo[n][last_same][did_reach];

        if( n == 0 ){
            if( did_reach == 1 || last_same == K ) {
                return memo[n][last_same][did_reach] = 1;
            } else {
                return memo[n][last_same][did_reach] = 0;
            }
        }
        if( k == K ) return memo[n][last_same][did_reach] = ( 9*f( n-1, 1, 1 ) )%MOD;

        return memo[n][last_same][did_reach] = 
            ( f( n-1, last_same+1, did_reach ) + 9*f( n-1, 1, did_reach ) )%MOD;
    }

    public int howMany( int n, int k ) {
        K = k;
        memo = new long[ n+1 ][ k+1 ][2];

        for( int i = 0; i < memo.length; ++i ) 
            for( int j = 0; j &lt; memo[i].length; ++j ) Arrays.fill( memo[i][j], -1 );

        long sol = 0;
        for( int i = k; i &lt;= n; ++i ){
            sol = (sol + 9*f( i-1, 1, 0 )) % MOD;
        }
        
        return (int)sol;
    }
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7845&amp;rd=10768" name="7845">BalanceScale</a></b> </font> 
<A href="Javascript:openProblemRating(7845)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516055" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      184 / 476 (38.66%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      81 / 184 (44.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Egor</b> for 461.31 points (8 mins 22 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      303.39 (for 81 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
First, let's divide all elements from <b>weight</b> with greatest common divisor of <b>weight</b>. Now, gcd of <b>weight</b> is 1.
I will proove that subset of <b>weight</b> that can measure every element from <b>weight</b> is equivalent to
subset of <b>weight</b> for which gcd is 1. If gcd of a subset is 1, with generalization of
<a href='http://en.wikipedia.org/wiki/B%C3%A9zout%27s_identity'>Bézout's identity</a> we can easily see that
we can measure all positive integers and therefore we can measure every element from the set. If gcd of a subset
is k which is greater than 1, we can only measure integers divisible by k. GCD of <b>weight</b> is 1, so there
exists at least one element not divisible by k and therefore not measurable.
<br><br>

Now we see that the problem is equivalent to finding minimum subset of <b>weight</b> so that gcd of that
subset equals gcd of <b>weight</b> (or 1 after we divide all the elements with gcd of a set).
<br><br>

Factorize all the elements, so that for every element you have an array of different prime factors of that
element (we ignore multiple prime factors). The maximal number of different prime factors for number less than
or equal to 10,000,000 is 8. For every element first assume that it's in the final answer. Then notice that
for each of these different prime factors there must be at least one element in the final answer that doesn't
contain the prime factor. Do a dynamic programming for every element trying to nullify all of his prime factors.
C++ code of the solve function follows:<br>
(PF[i] is vector<int> containing prime factors of i-th weight)
<br><br>

<pre>
int solve( int k, int n, int mask ){
    if( n &gt;= w.size() ) {
        if( mask == ( ( 1 &lt;&lt; PF[k].size() ) - 1 ) ) return 0;
        else return INF;
    }

    if( memo[k][n][mask] != -1 ) return memo[k][n][mask];

    int new_mask = mask;
    
    for( int i = 0; i &lt; PF[k].size(); ++i ){
        if( w[n] % PF[k][i] != 0 ) new_mask |= (1&lt;&lt;i);
    }

    return memo[k][n][mask] = 
        min( solve( k, n+1, mask ), solve( k, n+1, new_mask )+1 );
}
</pre>
<br><br>

However, most of the coders used the fact there is not much gcd values of all subsets of a set with 50 elements where
all elements are not greater than 10,000,000. They had state DP[x] = minimal size of a subset with gcd x. The solution
is then DP[1]. See <tc-webtag:handle coderId="263396" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265513&rd=10768&pm=7845&cr=263396">solution</a>. For optimized recursion that works too, see <tc-webtag:handle coderId="11829284" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265502&rd=10768&pm=7845&cr=11829284">solution</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7834&amp;rd=10768" name="7834">SharksDinner</a></b> </font> 
<A href="Javascript:openProblemRating(7834)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516055" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      138 / 476 (28.99%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      51 / 138 (36.96%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kedaizd</b> for 886.11 points (10 mins 27 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      648.15 (for 51 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
We have to maximize the number of eaten sharks. We will first consider a little easier variation of this problem,
in which every shark can eat at most one other shark. Let's describe our problem through a bipartite graph.
Every shark will be represented with two nodes, Ai and Bi. If shark x can eat shark y, let's draw a arc from Ax to By.
Now all we need is to do a maximum cardinality matching, and report number_of_sharks - maximum_matching_cardinality as
the answer.
<br>
<br>

Similary, if every shark can eat at most 2 other sharks, we will represent every shark as 3 nodes, namely A1i, A2i and Bi.
And if shark x can eat shark y then draw an arc to both A1x->By and A2x->By. Again, just do the maximum cardinality matching
and report the answer.
<br><br>

There was a tricky part of ensuring that two sharks don't eat each other. This is only possible when these sharks have
exactly the same properties. We will call such sharks equivalent. Such cases can be handled by not letting a shark eat
another equivalent shark which has a lower index than him.
<br><br>

For implementation, refer to <tc-webtag:handle coderId="21264786" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=265506&rd=10768&pm=7834&cr=21264786">solution</a>.
</p>
<br /><br />






<div class="authorPhoto">
    <img src="/i/m/icanadi_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10256411" context="algorithm"/><br />
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
