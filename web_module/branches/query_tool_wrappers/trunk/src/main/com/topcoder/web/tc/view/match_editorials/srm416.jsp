<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 416 Problem Set &amp; Analysis</title>

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
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13507">Match Overview</a><br />
    <tc-webtag:forumLink forumID="523237" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 416</span><br />Thursday, September 4, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
Division 1 saw a hard problem that seemed more approachable than usually. 
After all, everything was given in the problem statement, the contestants "only" 
had to implement it. However, the problem turned out to be worth each and 
every of those 1000 points, and in the end only two coders 
(<tc-webtag:handle coderId="10574855" context="algorithm"/>
and
<tc-webtag:handle coderId="19849563" context="algorithm"/>)
were able to submit flawless solutions &ndash; and claimed the
top two spots, in this order. 
The third place went to 
<tc-webtag:handle coderId="22629574" context="algorithm"/>,
thanks to a solid time on the 500 and two challenges.
</p>

</p>
In Division 2, more than twenty coders successfully solved the hard problem, and thus the battle
for top spots came down to solving time and challenges.
In the end, the top three were 
<tc-webtag:handle coderId="22671772" context="algorithm"/>,
<tc-webtag:handle coderId="22702977" context="algorithm"/>,
and
<tc-webtag:handle coderId="22699490" context="algorithm"/>.
The best newcomer, 
<tc-webtag:handle coderId="22718494" context="algorithm"/>,
placed thirteenth.
</p> 
 
<h1> 
The Problems 
</h1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9905&amp;rd=13507" name="9905">MostCommonLetters</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9905)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523237" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      612 / 675 (90.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      534 / 612 (87.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>snomak</strong> for 248.31 points (2 mins 21 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      200.51 (for 534 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Even with tasks like this one, it usually pays off to be systematic and break
the solution into smaller steps. In our solution, we start by computing the
number of occurrences for each of the 26 letters.
Once we have these 26 values, we can easily compute their maximum. 
Now, we can process the 26 letters in alphabetical order, and each
time we encounter one with a number of occurrences equal to the maximum,
we add it at the end of the result.
</p>

<pre>
  string listMostCommon(vector &lt;string&gt; text) {
    <font color="#0000ff">// count the occurrences of each letter</font>
    vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; occurrence_count(<font color="#ff00ff">26</font>,<font color="#ff00ff">0</font>);
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>unsigned</strong></font> i=<font color="#ff00ff">0</font>; i&lt;text.size(); i++)
      <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>unsigned</strong></font> j=<font color="#ff00ff">0</font>; j&lt;text[i].size(); j++)
        <font color="#a52829"><strong>if</strong></font> (isalpha(text[i][j]))
          occurrence_count[ text[i][j]-<font color="#ff00ff">'a'</font> ]++;

    <font color="#0000ff">// find the maximum count</font>
    <font color="#298a52"><strong>int</strong></font> maximum_count = -<font color="#ff00ff">1</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">26</font>; i++)
      maximum_count = max(maximum_count, occurrence_count[i]);

    <font color="#0000ff">// process all letters in order and list the most frequent ones</font>
    string res = <font color="#ff00ff">&quot;&quot;</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">26</font>; i++)
      <font color="#a52829"><strong>if</strong></font> (occurrence_count[i]==maximum_count)
        res += <font color="#298a52"><strong>char</strong></font>(<font color="#ff00ff">'a'</font>+i);
    <font color="#a52829"><strong>return</strong></font> res;
  }
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=8576&amp;rd=13507" name="8576">NextNumber</a></strong> 
</font> 
<a href="Javascript:openProblemRating(8576)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523237" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      513 / 675 (76.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      139 / 513 (27.10%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>togi_</strong> for 490.74 points (3 mins 55 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      297.53 (for 139 correct submissions) 
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
      572 / 581 (98.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      452 / 572 (79.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Knio</strong> for 249.07 points (1 mins 44 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      198.37 (for 452 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let S(X) be the binary representation of the number X, that is, a string of ones and zeroes.
For example, S(18)=10010 and S(24)=11000.
</p>

<p>
If we take two numbers A&lt;B with an equal number of binary digits, it can easily
be seen that S(A)&lt;S(B) &ndash; the most significant binary digit where A and B differ 
corresponds to the leftmost character where S(A) and S(B) differ.
</p>

<p>
Except for one special case, the problem statement can now be rephrased as follows:
Take the string S(N). 
Out of all permutations of this string (these are the binary representations
of other numbers with the same weight), find the one that is next in the lexicographic order.
</p>

<p>
The special case we mentioned above is the case where S(N) is of the form 11...100...0.
In this case, the next number with an equal number of ones will have one more decimal
digit.
</p>

<p>
An elegant way to get rid of this special case is to always start the string S(X) with a 
leading zero. For example, S(18) will be 010010 and S(24) will be 011000.
Now the problem statement simply becomes: Find the next permutation of the given
string of zeroes and ones.
</p>

<p>
In C++, we can use the STL function <tt>next_permutation</tt> to do all of our work.
</p>

<pre>
  <font color="#298a52"><strong>int</strong></font> getNextNumber(<font color="#298a52"><strong>int</strong></font> N) {
    <font color="#0000ff">// break N into bits</font>
    vector&lt;<font color="#298a52"><strong>int</strong></font>&gt; bits(<font color="#ff00ff">32</font>,<font color="#ff00ff">0</font>);
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">32</font>; i++)
      <font color="#a52829"><strong>if</strong></font> (N &amp; <font color="#ff00ff">1</font>&lt;&lt;i)
        bits[<font color="#ff00ff">31</font>-i] = <font color="#ff00ff">1</font>;

    <font color="#0000ff">// find the next permutation of this many 0s and 1s</font>
    next_permutation( bits.begin(), bits.end() );

    <font color="#0000ff">// convert the bits back into a number</font>
    <font color="#298a52"><strong>int</strong></font> res = <font color="#ff00ff">0</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> i=<font color="#ff00ff">0</font>; i&lt;<font color="#ff00ff">32</font>; i++)
      <font color="#a52829"><strong>if</strong></font> (bits[i])
        res += <font color="#ff00ff">1</font>&lt;&lt;(<font color="#ff00ff">31</font>-i);
    <font color="#a52829"><strong>return</strong></font> res;
  }
</pre>

<p>
Alternately, we could do all the work ourselves. 
The general next_permutation algorithm is described, for example, in <a href="/tc?module=Static&d1=match_editorials&d2=srm148">previous editorials</a>.
However, in the case of binary strings the algorithm can be simplified as follows:
</p>
<ol>
<li>Find the first 0 from the right that is followed by a 1. Clearly, in the next number, this position already has to contain a 1, and the positions
to the left of it will remain unchanged.
<li>Place a 1 at the position found.
<li>Fill in the remaining positions from the left to the right, first using all the remaining zeroes, then all the remaining ones.
(This produces the smallest such number.)
</ol>

For example, consider the string 01011000. This process will look as follows:
<pre>
step 1:   the position we seek is this one: 01*.....
step 2:     this position must contain a 1: 011.....
step 3a: fill in the four remaining zeroes: 0110000.
step 3b:     fill in the one remaining one: 01100001
</pre>

<p>This approach is implemented in many
of the top contestants' solutions:
<a href="/stat?c=problem_solution&amp;rm=298521&amp;rd=13507&amp;pm=8576&amp;cr=10574855">first</a>,
<a href="/stat?c=problem_solution&amp;rm=298519&amp;rd=13507&amp;pm=8576&amp;cr=19849563">second</a>,
and can even be reduced to <a href="http://forums.topcoder.com/?module=Thread&threadID=623246&mc=20#1020463">a few bitwise operations</a>.
</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9902&amp;rd=13507" name="9902">DancingCouples</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9902)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523237" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br /> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
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
      119 / 675 (17.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 119 (20.17%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>iliyafilippov</strong> for 890.91 points (10 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      559.91 (for 24 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>
Probably the most important aspect of this task was to realize how big the output value can be. 
It is tempting to deduce that the worst case is when we want to make 10 pairs of boys and girls 
that like each other &ndash; where the answer is 10! = 3,628,800.
However, this is not true. The worst case is when we want 8 pairs. We can select the 8 boys in
choose(10,8) = 45 ways, and assign them the girls in 10*9*8*7*6*5*4*3 = 1,814,400 ways,
for a total of 81,648,000 ways how to assign the dancers.
</p>

<p>
Actually, this number is still reasonably low, and I believe that a heavily optimized program
with time complexity linear in the answer could be able to finish within the time limit.
However, there was a better way, and all the top finishers in division 2 realized this.
The brute force search that considers all possible pairings will often be solving the same subproblems.
For example, regardless of whether we have pairs Alice-Bob and Eve-Oscar or pairs Alice-Oscar and Eve-Bob,
the number of ways how to make other three couples is in both cases the same.
</p>

<p>
Each subproblem is clearly defined by three variables: the set of unmatched boys, the set of unmatched girls,
and the number of couples we need to make. 
This would give us 2<sup>10</sup> * 2<sup>10</sup> * 10 = approximately 10 million states. 
</p>

<p>
There is still one more easy improvement: we can process the boys in order. In that case, there will only 
be at most 11 possible sets of unmatched boys &ndash; for each K, the set that contains the first K boys.
In this way, we reduced the number of states to 11 * 2<sup>10</sup> * 10 = approximately one hundred thousand,
which is low enough for our solution to be reasonably fast.
</p>

<p>
In the program below, we represent the set of available girls as an integer from 0 to 1023, where bit X is
set iff girl X is still available.
</p>

<pre>
  <font color="#298a52"><strong>int</strong></font> memo[<font color="#ff00ff">12</font>][<font color="#ff00ff">1030</font>][<font color="#ff00ff">12</font>];
  vector&lt;string&gt; canDance;

  <font color="#298a52"><strong>int</strong></font> solve(<font color="#298a52"><strong>int</strong></font> boys, <font color="#298a52"><strong>int</strong></font> available_girls, <font color="#298a52"><strong>int</strong></font> couples) {
    <font color="#0000ff">// handle the trivial cases</font>
    <font color="#298a52"><strong>int</strong></font> girls = __builtin_popcount(available_girls);
    <font color="#a52829"><strong>if</strong></font> (couples&gt;boys || couples&gt;girls) <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">0</font>;
    <font color="#a52829"><strong>if</strong></font> (couples==<font color="#ff00ff">0</font>) <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">1</font>;

    <font color="#0000ff">// if we already solved this case, return the memoized answer</font>
    <font color="#a52829"><strong>if</strong></font> (memo[boys][available_girls][couples] &gt;= <font color="#ff00ff">0</font>)
      <font color="#a52829"><strong>return</strong></font> memo[boys][available_girls][couples];

    <font color="#0000ff">// in the general case, first try not to match the last boy...</font>
    <font color="#298a52"><strong>int</strong></font> result = solve(boys-<font color="#ff00ff">1</font>, available_girls, couples);

    <font color="#0000ff">// ... and then try all valid pairs for the last boy</font>
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> girl=<font color="#ff00ff">0</font>; girl&lt;canDance[boys-<font color="#ff00ff">1</font>].size(); girl++)
      <font color="#a52829"><strong>if</strong></font> (canDance[boys-<font color="#ff00ff">1</font>][girl]==<font color="#ff00ff">'Y'</font>)
        <font color="#a52829"><strong>if</strong></font> (available_girls &amp; <font color="#ff00ff">1</font>&lt;&lt;girl)
          result += solve(boys-<font color="#ff00ff">1</font>, available_girls ^ (<font color="#ff00ff">1</font>&lt;&lt;girl), couples-<font color="#ff00ff">1</font>);

    <font color="#0000ff">// store and return the result</font>
    memo[boys][available_girls][couples] = result;
    <font color="#a52829"><strong>return</strong></font> result;
  }

  <font color="#298a52"><strong>int</strong></font> countPairs(vector &lt;string&gt; cD, <font color="#298a52"><strong>int</strong></font> K) {
    <font color="#0000ff">// initialize the global variables</font>
    canDance = cD;
    memset(memo,-<font color="#ff00ff">1</font>,<font color="#a52829"><strong>sizeof</strong></font>(memo));

    <font color="#0000ff">// recursively solve the task</font>
    <font color="#a52829"><strong>return</strong></font> solve(canDance.size(), (<font color="#ff00ff">1</font>&lt;&lt;canDance[<font color="#ff00ff">0</font>].size())-<font color="#ff00ff">1</font>, K);
  }
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9904&amp;rd=13507" name="9904">CustomDice</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9904)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523237" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      147 / 581 (25.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      119 / 147 (80.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>ainu7</strong> for 443.76 points (10 mins 23 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      270.84 (for 119 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
First, note that the problem statement contains the following information: For any set of 6 distinct integers, there are exactly 30
ways how to place them on a dice. Thus it is enough to count the sets of integers that satisfy the requirement, and at the end
multiply the result by 30.
</p>

<p>
Second, the condition "the average must not exceed M" can be rephrased as "the sum must not exceed 6M". 
In this way, we got rid of any non-integer operations. From this point on, all the numbers in this solution will be integers.
</p>

<p>
We now want to count the number of sets {x<sub>1</sub>, ..., x<sub>6</sub>} such that: 
<br/>
0 &lt; x<sub>1</sub> &lt; ... &lt; x<sub>6</sub>
<br/>
x<sub>1</sub> + ... + x<sub>6</sub> &le; 6M
</p>

<p>
The dynamic programming solution that will be presented below can directly be applied at this point. 
However, I prefer to simplify the problem first.
</p>

<p>
By substituting y<sub>i</sub>=x<sub>i</sub>-i we get an equivalent problem: Count the number of sequences 
(y<sub>1</sub>, ..., y<sub>6</sub>) such that:
<br/>
0 &le; y<sub>1</sub> &le; ... &le; y<sub>6</sub>
<br/>
y<sub>1</sub> + ... + y<sub>6</sub> &le; 6M-21
</p>

<p>
At this point it is obvious that for M&le;3 there are no solutions.
Now, we can get rid of the condition y<sub>i</sub>&le;y<sub>i+1</sub> as well.
</p>

<p>
Let:
<br/>
z<sub>1</sub>=y<sub>6</sub>-y<sub>5</sub>, 
<br/>
z<sub>2</sub>=y<sub>5</sub>-y<sub>4</sub>,
<br/>
...
<br/>
z<sub>5</sub>=y<sub>2</sub>-y<sub>1</sub>,
<br/>
z<sub>6</sub>=y<sub>1</sub>
</p>

<p>
In ASCII graphics, this substitution can be visualised as shown below.
Note that sum(y<sub>i</sub>) = sum(i &times; z<sub>i</sub>).
</p>

<pre>
y1: +---------+
y2: +------------+
y3: +------------------+
y4: +----------------------+
y5: +----------------------------+
y6: +---------------------------------+

    +---------+--+-----+---+-----+----+
        z6     z5   z4   z3   z2   z1
</pre>

<p>
We get another equivalent problem: Count the number of sequences
(z<sub>1</sub>, ..., z<sub>6</sub>) such that:
<br/>
0 &le; z<sub>1</sub>, ..., z<sub>6</sub>
<br/>
z<sub>1</sub> + 2z<sub>2</sub> + ... + 6z<sub>6</sub> &le; 6M-21
</p>

<p>
At this point, there is no obvious way how to simplify the formula even further. (However, in many
similar tasks there might be one, which is why we present this approach.)
</p>

<p>
We can now count the number of valid sequences as follows. There are two types of valid sequences:
Those where z<sub>6</sub>&gt;0 and those where z<sub>6</sub>=0. In the first case, we can subtract
1 from z<sub>6</sub>, and get the same problem with the right side of the inequality smaller by 6.
In the second case, we get a similar problem with only 5 variables.
</p>

<p>
This can be formulated as a recurrence relation. Let cnt[v][s] be the number of ways in which we can
set variables z<sub>1</sub> to z<sub>v</sub> so that the total (z<sub>1</sub> + ... + vz<sub>v</sub>) does not exceed s.
Then we have: cnt[v][s] = cnt[v-1][s] + cnt[v][s-v].
</p>

<p>
After adding proper boundary conditions (and limiting the program to only use two rows of the dynamic programming table to save memory)
we get the code below:
</p>

<pre>
  <font color="#298a52"><strong>int</strong></font> MOD = <font color="#ff00ff">1000000007</font>;
  <font color="#298a52"><strong>int</strong></font> cnt[<font color="#ff00ff">2</font>][<font color="#ff00ff">6000047</font>];

  <font color="#298a52"><strong>int</strong></font> countDice(<font color="#298a52"><strong>int</strong></font> M) {
    M = <font color="#ff00ff">6</font>*M-<font color="#ff00ff">21</font>;
    <font color="#a52829"><strong>if</strong></font> (M&lt;<font color="#ff00ff">0</font>) <font color="#a52829"><strong>return</strong></font> <font color="#ff00ff">0</font>;
    memset(cnt,<font color="#ff00ff">0</font>,<font color="#a52829"><strong>sizeof</strong></font>(cnt));
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> s=<font color="#ff00ff">0</font>; s&lt;=M; s++) cnt[<font color="#ff00ff">0</font>][s]=<font color="#ff00ff">1</font>;
    <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> v=<font color="#ff00ff">1</font>; v&lt;=<font color="#ff00ff">6</font>; v++)
      <font color="#a52829"><strong>for</strong></font> (<font color="#298a52"><strong>int</strong></font> s=<font color="#ff00ff">0</font>; s&lt;=M; s++) {
        cnt[v%<font color="#ff00ff">2</font>][s] = cnt[<font color="#ff00ff">1</font>-v%<font color="#ff00ff">2</font>][s];
        <font color="#a52829"><strong>if</strong></font> (s &gt;= v) cnt[v%<font color="#ff00ff">2</font>][s] += cnt[v%<font color="#ff00ff">2</font>][s-v];
        cnt[v%<font color="#ff00ff">2</font>][s] %= MOD;
      }
    <font color="#a52829"><strong>return</strong></font> (<font color="#ff00ff">30LL</font>*cnt[<font color="#ff00ff">0</font>][M])%MOD;
  }
</pre>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9857&amp;rd=13507" name="9857">RussianCheckers</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9857)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=523237" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
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
      10 / 581 (1.72%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 10 (20.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Petr</strong> for 640.18 points (24 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      556.71 (for 2 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Everything we need is spelled out in the problem statement.
Clearly, the number of possible moves will always be small, and thus we can use backtracking 
to generate the list of all possible moves. 
The difficulty in this problem lies in finding a way how to implement all the rules
easily, with as little effort as possible, and at the same time to make sure
that we didn't forget any of the rules.
</p>

<p>
Some important rules and observations that were easy to overlook:
</p>

<ul>
<li>When the "king" moves zero or more additional squares after jumping over the opponent, it must stop at a square from which it can perform another capture if possible.
<li>If a "man" reaches the far side of the board as the result of a capturing move, it becomes a "king" and must continue capturing if possible, but as a "king".
<li>We can <strong>not</strong> remove captured pieces at the moment when we capture them, we shall only mark them as captured. Otherwise we will get illegal moves,
e.g., a king on c3 with opponents at b2 and d4 is <strong>not</strong> allowed to jump c3:a1:e5.
<li>We <strong>can</strong> visit the same cell twice during a move: a man at g1 with opponents at f2, d2, b2, b4, d4, and f4 is allowed to jump
g1:e3:c1:a3:c5:e3:g5, visiting e3 twice. Thus we need to mark opponent's pieces as captured, marking visited cells does not work.
<li>The first capturing move of a man is allowed to be backwards. (In this aspect the problem statement differs from checkers rules I'm used to, in the contest
this is where I would most probably make a mistake.)
</ul>

<p>
Suggestions how to implement things nicely:
</p>

<ul>
<li>Obviously, we can process our pieces one at a time.
<li>Have separate functions for generating simple moves and capturing moves. Only if the second one returns nothing for each of our pieces, start calling 
the first one.
<li>Have a global array stating which pieces are captured at the moment.
<li>Write a single recursive function to look for capturing moves, with a boolean flag whether the piece is a king as one of the arguments. 
Note that this flag may change during the search. 
</ul>

<p>
Petr's <a href="/stat?c=problem_solution&amp;rm=298521&amp;rd=13507&amp;pm=9857&amp;cr=10574855">solution</a>
is as readable as it gets.
</p>
<br />


<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
