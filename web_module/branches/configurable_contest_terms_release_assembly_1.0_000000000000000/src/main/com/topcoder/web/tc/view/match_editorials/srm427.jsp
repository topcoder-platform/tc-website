<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 427 Problem Set &amp; Analysis</title>

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
    <tc-webtag:forumLink forumID="524728" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 427</span><br />Tuesday, November 27, 2008
<br /><br />


<h2>Match summary</h2> 



<p>

This SRM featured sets of an average difficulty in both divisions. In Div-I, the battle for the first place

arose between 

<tc-webtag:handle coderId="10597114" context="algorithm"/>, author of the fastest 900-pointer, and 

<tc-webtag:handle coderId="10574855" context="algorithm"/>, author of the fastest 600-pointer.

<tc-webtag:handle coderId="10597114" context="algorithm"/> was the first after the coding phase and strengthened his lead on the very beginning of the challenge

phase by making +50. However, than 

<tc-webtag:handle coderId="10574855" context="algorithm"/> retook the lead by making two successfull challenges.

<tc-webtag:handle coderId="10597114" context="algorithm"/> didn't give up and, 4 (!!) seconds before the end of the challenge phase, he reclaimed his

lead by making another successfull challenge and leaving 

<tc-webtag:handle coderId="10574855" context="algorithm"/> on the second place. The excellent

performance allowed <tc-webtag:handle coderId="10597114" context="algorithm"/> to

get 126 rating points and become a target. Congratulations

to 

<tc-webtag:handle coderId="10597114" context="algorithm"/> with very nice match, his first SRM victory

and becoming a target!

Third place went to 

<tc-webtag:handle coderId="10574855" context="algorithm"/> who was behind 

<tc-webtag:handle coderId="10574855" context="algorithm"/>

on slightly more than 200 points.

</p>

<p>

In Div-II, the first three places were taken by 

<tc-webtag:handle coderId="22710035" context="algorithm"/>, 

<tc-webtag:handle coderId="22753817" context="algorithm"/> and 

<tc-webtag:handle coderId="22724081" context="algorithm"/>. All of them

solved all three problems. Newcomer 

<tc-webtag:handle coderId="22763059" context="algorithm"/>

made the fastest submission on 1000-pointer, but took just 7th place because his submission on 500-pointer

failed systests.

</p>

 

<H1> 

The Problems 

</H1>

</p> 



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10046&amp;rd=13518" name="10046">LoveCalculator</a></b> 

</font> 

<A href="Javascript:openProblemRating(10046)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524631" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      554 / 627 (88.36%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      468 / 554 (84.48%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>BrainDeveloper</b> for 245.46 points (3 mins 52 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      189.29 (for 468 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The solution for this problem can be broken in two parts. First, let's implement the method which takes two names

and calculates the probability of love between them. The implementation directly follows the problem statement:

</p>

<pre>

int loveProb(String a, String b) {

  String s=a+b;

  int L=0, O=0, V=0, E=0;

  for (int i=0; i&lt;s.length(); i++) {

    if (s.charAt(i)=='L') L++;

    if (s.charAt(i)=='O') O++;

    if (s.charAt(i)=='V') V++;

    if (s.charAt(i)=='E') E++;

  }

  return ((L+O)*(L+V)*(L+E)*(O+V)*(O+E)*(V+E)) % 100;

}

</pre>

<p>

Now, having such method implemented, we can easily complete the rest of the solution:

</p>

<pre>

public String findBoy(String girl, String[] boys) {

  int bestProb = -1;

  String best = "";

  for (int i=0; i < boys.length; i++) {

    int cur = loveProb(girl, boys[i]);

    if (cur > bestProb || cur == bestProb && boys[i].compareTo(best) < 0) {

      bestProb = cur;

      best = boys[i];

    }

  }

  return best;

}

</pre>

<p><i>Exercise.</i> It may seem that (L+O)*(L+V)*(L+E)*(O+V)*(O+E)*(V+E) doesn't always fit within 32-bit signed integer

value (each multiplier can be up to 40, so the upper bound for the whole expression is 40^6 = 4,096,000,000). If it's really

true, then there can occur an overflow in loveProb method implementation provided above.

Construct an example, that makes (L+O)*(L+V)*(L+E)*(O+V)*(O+E)*(V+E) overflow 32-bit signed integer value, or prove

that such example doesn't exist.</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10155&amp;rd=13518" name="10155">DesignCalendar</a></b> 

</font> 

<A href="Javascript:openProblemRating(10155)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524631" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      264 / 627 (42.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      115 / 264 (43.56%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>niyaznigmatul</b> for 499.00 points (1 mins 16 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      313.74 (for 115 correct submissions) 

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

      438 / 486 (90.12%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      320 / 438 (73.06%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>SkidanovAlex</b> for 248.24 points (2 mins 23 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      191.23 (for 320 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

In order to solve this problem, let's do some simple math. First, we need to introduce several variables:

</p>

<ul>

<li>P - the period of calendar in years (we are looking for the smallest period);</li>

<li>N - the number of days in a normal year;</li>

<li>L - the number of leap years within one period.</li>

</ul>

<p>

The statement asks us to choose P, N and L

in such way that each P calendar years sum to the same amount of days as P real years. It means that the average

year length (in days) according to our calendar is the same as the number of days in a real year.

The number of days in a real year is <b>yearLength</b>/<b>dayLength</b>. The total number of days

in P calendar years is (P - L) * N + L * (N + 1) (L leap years have N + 1 days and the other years have N days).

Therefore, the average year length according to

the calendar is ((P - L) * N + L * (N + 1)) / P = (P*N - L*N + L*N + L) / P = (P*N + L) / P = N + L/P.

So we have an equation to solve: N + L/P = <b>yearLength</b>/<b>dayLength</b>.

</p>

<p>

Let's reduce the fraction <b>yearLength</b>/<b>dayLength</b>. Set yearLength' = <b>yearLength</b>/d, dayLength' = <b>dayLength</b>/d,

where d is the greatest common divisor of <b>yearLength</b> and <b>dayLength</b>. Then the equation from

the previous paragraph can be written as (N*P + L) / P = yearLength' / dayLength'. Now, since the fraction in the

right part is irreducible, it becomes clear that the minimum possible value of P is dayLength'. It's left to show

that this value for P is feasible, i.e. to provide the correct values for N and L, but it's easy to do: N = yearLength' DIV

dayLength' and L = yearLength' MOD dayLength'. These values will work because (N*P + L) / P = ((yearLength' DIV dayLength')*dayLength' +

yearLength' MOD dayLength') / dayLength' = yearLength' / dayLength'.

</p>

<p>

The implementation is really easy and straightforward. We just need to calculate <b>dayLength</b> / gcd(<b>dayLength</b>, <b>yearLength</b>):

</p>

<pre>

public class DesignCalendar {

  int gcd(int a, int b) {

    while (a>0 && b>0)

      if (a>b) a%=b; else b%=a;

    return a+b;

  }



  public int shortestPeriod(int dayLength, int yearLength) {

    return dayLength / gcd(dayLength, yearLength);

  }

}

</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10044&amp;rd=13518" name="10044">Teaching</a></b> 

</font> 

<A href="Javascript:openProblemRating(10044)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524631" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      100 / 627 (15.95%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      17 / 100 (17.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>DanilaVas9ev</b> for 769.15 points (16 mins 38 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      560.63 (for 17 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem is solved using brute force, i.e. by checking all possibilities. The basic idea is simple: we need to

iterate through all subset of <b>K</b> letters, check for each of them how many words it allows to read and return the

maximum. However, inefficient implementation of this approach will lead to time out. There can be up to C(26, 13) =

26! / (13! * 13!) = 10,400,600 possible subsets and checking each of them requires iterating through each letter of

each word (at most 50*15 = 750 operations). Overall, it gives 10,400,600 * 750 = 7,800,450,000 operations, what

is obviously way too much.

</p>

<p>

To obtain working solution, let's apply two optimizations:

</p>

<ol>

<li>We certainly should teach letters 'a', 'n', 't', 'i', 'c', otherwise our students won't be able to read

even a single word. Therefore, if <b>K</b> &lt; 5, we can return 0, and if <b>K</b> &gt; 5, we teach

'a', 'n', 't', 'i', 'c' and then iterate through all possible subsets of <b>K</b> - 5 letters among the rest

of 21 letters. This reduces the number of possible subsets to C(21, 10) = 21! / (10! * 11!) = 352,716.

So this optimization makes our solution work faster in almost 30 times.</li>

<li>It's convenient to represent the subsets of letters by 26-bit masks. The i-th bit in mask is set if and only

if the i-th letter in alphabet is present in the subset represented by mask. This allows for faster checking

whether a subset of letters represented by <i>subsetMask</i> is enough to read the word represented by

<i>wordMask</i>. The mask for a subset of unknown letters can be calculated as 2<sup>26</sup> - 1 - <i>subsetMask</i>.

It's possible to read the word if and only if there's no unknown letter which is present in the word,

that is, if <i>wordMask</i> & (2<sup>26</sup> - 1 - <i>subsetMask</i>) = 0. So instead of iterating through

all the characters of the word, we can perform this simple check and save running time.</li>

</ol>

<p>

With these 2 optimization, in the worst case our solution will require 352,716 * 50 = 17,635,800 checks, what is still pretty

much, but enough to fit within 2 seconds time limit. Java implementation of this approach follows:

</p>

<pre>

public class Teaching {

  int K;

  int[] wordMask;

  int res = 0;



<font color="gray">  // recursive method for checking subsets

  // pos is the index of letter we are currently at

  // have is the number of taken letters

  // mask is the mask of taken letters</font>

  void go(int pos, int have, int mask) {

<font color="gray">   // if the subset is completely formed</font>

   if (pos == 26) {

<font color="gray">     // if the number of taken letters is not K, skip the subset</font>

     if (have != K) return;



<font color="gray">     // calculate how many words we can read</font>

     int cnt = 0;

     for (int i=0; i &lt; wordMask.length; i++)

       if ((wordMask[i] & ((1&lt;&lt;26)-mask-1)) == 0) cnt++;



<font color="gray">     // update maximum if needed</font>

     if (cnt &gt; res) res = cnt;

     return;

   }



<font color="gray">   // if the letter is none of 'a', 'n', 't', 'i', 'c', try skipping it</font>

   if ("antatica".indexOf((char)((int)'a'+pos)) == -1) go(pos+1, have, mask);

   

<font color="gray">   // try learning the letter</font>

   go(pos+1, have+1, mask + (1&lt;&lt;pos));

  }



  public int count(String[] words, int K) {

<font color="gray">    // precalculate the masks for all words</font>

    wordMask = new int[words.length];

    for (int i=0; i&lt;words.length; i++)

      for (int j=0; j&lt;words[i].length(); j++)

        wordMask[i] |= (1 &lt;&lt; (words[i].charAt(j) - 'a'));



    this.K = K;



<font color="gray">    // start recursive checking of all subsets</font>

    go(0, 0, 0);



    return res;

  }

}

</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=9984&amp;rd=13518" name="9984">LocateTreasure</a></b> 

</font> 

<A href="Javascript:openProblemRating(9984)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524631" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      600 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      276 / 486 (56.79%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      127 / 276 (46.01%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 530.06 points (10 mins 36 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      321.74 (for 127 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The key idea for solving this problem is the following lemma which provides a very simple way to calculate

d(x).

</p>

<p><i>Lemma</i>. If x&gt;0, then d(x) = (x%9 == 0 ? 9 : x%9).</p>

<p><i>Proof</i>. First, note that 10^n % 9 = (10 % 9)^n % 9 = 1^n % 9 = 1. Now let n = (a_k a_{k-1} ... a_1 a_0)<sub>10</sub>.

Then n % 9 = (a_k * 10^k + a_{k-1} * 10^{k-1} + ... + a_1 * 10 + a_0) % 9 = (a_k * (10^k % 9) + a_{k-1} * (10^{k-1} % 9) + ... +

a_1 * (10 % 9) + a_0 * (1 % 9)) % 9 = (a_k + a_{k-1} + ... + a_1 + a_0) % 9. So each number has the same remainder modulo 9

as the sum of its digits. When calculating d(x), we repeatedly change number by sum of its digits until it becomes less than

10. As number modulo 9 always remains the same during the process, the result is x%9 if x is not divisible by 9. If x is

divisible by 9, we have two potential choices - 0 and 9. But it's easy to see that sum of digits of positive number is always

a positive number, so the right choice is 9.</p>

<p>

<i>Corollary.</i> d(<b>mul</b>*x) = d(d(<b>mul</b>) * d(x)).

</p>

<p>

It follows from the corollary, that without loss of generality, we can assume that 1 &le; <b>mul</b> &le; 9 (otherwise just

replace <b>mul</b> by d(<b>mul</b>)). Consider the sequence d(1), d(<b>mul</b>), d(<b>mul</b>^2), ..., used in the algorithm

we need to implement. As each next element depends only on previous one, very soon this sequence

becomes periodical with very small period:

</p>

<p>

<b>mul</b> = 1: [1];<br>

<b>mul</b> = 2: [1, 2, 4, 8, 7, 5];<br>

<b>mul</b> = 3: 1, 3, [9];<br>

<b>mul</b> = 4: [1, 4, 7];<br>

<b>mul</b> = 5: [1, 5, 7, 8, 4, 2];<br>

<b>mul</b> = 6: 1, 6, [9];<br>

<b>mul</b> = 7: [1, 7, 4];<br>

<b>mul</b> = 8: [1, 8];<br>

<b>mul</b> = 9: 1, [9].

</p>

<p>

Quite surprising, but the sequence of coordinates, produced for a fixed <b>mul</b> and <b>K</b>=1,2,3,..., is also periodical:

</p>

<p>

<b>mul</b> = 1: [(0, 0), (0, 1), (1, 1), (1, 0)];<br>

<b>mul</b> = 2: [(0, 0), (0, 1), (2, 1), (2, -3), (-6, -3), (-6, 4), (-1, 4), (-1, 3), (-3, 3), (-3, 7), (5, 7), (5, 0)];<br>

<b>mul</b> = 3: (0, 0), (0, 1), [(3, 1), (3, -8), (-6, -8), (-6, 1)];<br>

<b>mul</b> = 4: [(0, 0), (0, 1), (4, 1), (4, -6), (3, -6), (3, -2), (10, -2), (10, -3), (6, -3), (6, 4), (7, 4), (7, 0)];<br>

<b>mul</b> = 5: [(0, 0), (0, 1), (5, 1), (5, -6), (-3, -6), (-3, -2), (-1, -2), (-1, -3), (-6, -3), (-6, 4), (2, 4), (2, 0)];<br>

<b>mul</b> = 6: (0, 0), (0, 1), [(6, 1), (6, -8), (-3, -8), (-3, 1)];<br>

<b>mul</b> = 7: [(0, 0), (0, 1), (7, 1), (7, -3), (6, -3), (6, 4), (10, 4), (10, 3), (3, 3), (3, 7), (4, 7), (4, 0)];<br>

<b>mul</b> = 8: [(0, 0), (0, 1), (8, 1), (8, 0)];<br>

<b>mul</b> = 9: (0, 0), [(0, 1), (9, 1), (9, -8), (0, -8)].

</p>

<p>

To obtain this data, you can write an easy program that prints first 100 members of each sequence and

manually check for repeats within the printed coordinates. We see that period length is either 4 or 12, and pre-periodic

part can contain 0, 1 or 2 elements. Based on this knowledge, it's easy to write a program to solve the problem:

</p>

<pre>

public class LocateTreasure {

  public String location(int K, int multi) {

<font color="gray">    // if K is large, then make it smaller</font>

    if (K &gt;= 12) {

<font color="gray">      // K can be taken modulo 12, because the period length is

      // 12 or 4 (a divisor of 12)</font>

      K %= 12;

<font color="gray">      // K can fall within pre-periodic part after taking

      // modulo 12, so add 12 for safety</font>

      if (K &lt;= 2) K += 12;

    }



<font color="gray">    // calculate K-th member of the sequence

    // K can be at most 14 here</font>

    int x = 0, y = 0;

    int[] dx = new int[] {0, 1, 0, -1};

    int[] dy = new int[] {1, 0, -1, 0};

    int d = 1;

    for (int step=0; step&lt;K; step++) {

      x += dx[step%4] * d;

      y += dy[step%4] * d;

      d *= multi;

      while (d&gt;9) d-=9;

    }



<font color="gray">    // return the result</font>

    return x+" "+y;

  }

}

</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8785&amp;rd=13518" name="8785">PSequence</a></b> 

</font> 

<A href="Javascript:openProblemRating(8785)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524631" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      900 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      56 / 486 (11.52%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      32 / 56 (57.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Psyho</b> for 713.12 points (15 mins 24 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      516.30 (for 32 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Let's first describe how to solve the problem using brute force. Let's build all possible

<b>p</b>-sequences recursively. Our method <i>count</i> will take two parameters -

an integer <i>prev</i>, describing the number we've put onto the previous position in the builded sequence (we

can use some special value <i>BEG</i> to indicate the first position of the sequence when there's no previous position),

and an array of integers <i>left</i>, describing all the integers that haven't been put yet into the sequence.

The method <i>count</i> will return the number of ways to complete the sequence by all numbers from <i>left</i> to obtain <b>p</b>-sequence.

The algorithm is simple: we iterate through all numbers X from <i>left</i> such that X - <i>prev</i> is not divisible by <b>p</b>

(in case <i>left</i> = <i>BEG</i> we just iterate through all numbers from <i>left</i>) and sum the results of calls

to <i>count</i>(X, <i>left</i>/X), where <i>left</i>/X is an array <i>left</i> with element X being removed.

Each such call corresponds to extension of the builded sequence by number X and condition (X - <i>pref</i>) % <b>p</b> != 0

ensures that we check only <b>p</b>-sequences. In case when

<i>left</i> is empty, there's exactly one way to obtain <b>p</b>-sequence &ndash; do nothing, so

we return 1. The answer for the whole problem is <i>count</i>(<i>BEG</i>, <b>S</b>).

</p>

<p>

The described method <i>count</i> works nicely, but it's awfully slow. One useful method that allows to speed up recursion

is memoization, i.e. ensuring that method is called exactly once for every combination of its input parameters

by saving the results of all calculations in some data structure. However, with the approach we've just described,

values of the input parameters don't tend to repeat often, so it doesn't directly help here. So our goal is to modify

input parameters in such way that memoization can be used. Let's make several observations:

</p>

<ol>

<li>The order of elements in <i>left</i> doesn't matter, so we can always assume that it's sorted in non-descending order.</li>

<li>The only condition used in the definition of <b>p</b>-sequence is (s1 - s2) % p != 0 for every two consecutive elements

s1 and s2. This can be rewritten as s1 % p != s2 % p. From this point of view, it directly follows

that instead of actual number X we can store just X % p in <i>left</i>. For example, if <b>p</b>=3, instead of <i>left</i>

={0, 2, 7, 13, 15} we can store <i>left</i>={0, 0, 1, 1, 2} (15 % 3 = 0 % 3 = 0, 13 % 3 = 7 % 3 = 1, 2 % 3 = 2).

It's worth nothing that the same numbers in <i>left</i> must now be treated as if they were distinct, because they are

actually just the same reminders modulo <b>p</b> of several distinct numbers.</li>

<li>The next transformation that can be applied to <i>left</i> is grouping the same elements. For example,

we can transform <i>left</i> = {0, 0, 1, 1, 2} into <i>left</i> = {(2, 0), (2, 1), (1, 2)}, where (2, 0) means

a group of 2 zeros, (2, 1) means a group of 2 ones and (1, 2) means a group of one 2 (in other words,

first integer in a group denotes the number of occurences of the second integer).

Now, observe that from the point of view of method <i>count</i>, there's no actual difference between, for example, a group of seven 3's and

a group of seven 5's. In other words, second integer in each group can be omitted. So, <i>left</i> = {0, 0, 1, 1, 2}

can be transformed into <i>left</i> = {2, 2, 1}, what means that some integer occurs 2 times, some other integer

also occurs 2 times and some third integer occurs 1 time. Finally, it's still useful to assume

that <i>left</i> is sorted in non-descending order, so <i>left</i> = {0, 0, 1, 1, 2} must be transformed into

<i>left</i> = {1, 2, 2}. After this transformation, the meaning of parameter <i>prev</i> slightly changes: instead

of giving the value of the previous element of the builded sequence it can give the index of the group (in <i>left</i>) from which

the previous element of the builded sequence was taken.</li>

</ol>

<p>

After we apply these 3 observations, <i>left</i> will always

contain a <a href="http://en.wikipedia.org/wiki/Partition_(number_theory)">partition</a> of some number less than or equal to

N = length of <b>S</b>. There are at most 28,628 partitions of numbers &le; 30, and there are at most 31 possible

values for parameter <i>prev</i> (at most 30 positions in <i>left</i> and one special value for <i>BEG</i>). Overall,

there are at most 28,628 * 31 = 887,468 combinations of input parameters' values for method <i>count</i>. Note that this

bound is not strict, and in actual cases the number of appeared combinations is much less &ndash; 10,275 in the worst

possible case. So now we can successfully apply memoization to method <i>count</i> to obtain working solution.

</p>

<p>

For an example implementation of this approach, you can check <tc-webtag:handle coderId="10574855" context="algorithm"/>'s

<a href="http://www.topcoder.com/stat?c=problem_solution&rm=299443&rd=13518&pm=8785&cr=10574855">submission</a>. Note that in his code

parameter <i>prev</i>

(it's called <i>numForbidden</i>) there) has a bit different meaning &ndash; instead of the index of the group

from which the previous element was taken, it gives the current number of elements in this group.

</p>

<i>Exercise.</i> The described algorithm is exponential, because the number of partitions of number N

is not bounded by any polynomial on N. Find a polynomial algorithm for solving this problem or prove

that it doesn't exist unless P = NP.
</div>

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
