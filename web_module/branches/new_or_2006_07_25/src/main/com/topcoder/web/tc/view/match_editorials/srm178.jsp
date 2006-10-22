<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505627" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 178</span><br>Wednesday, January 7, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
Last night's dynamic programming course began with an excursion into the land of typesetting.  After
coders completed the Div 1 easy (Div 2 medium), and were quite happy to be through with it, they
moved on to a sequence of DP/Memoization problems.  Div 2 coders faced a short, but tricky problem
on strings, with interesting mathematical properties.  Div 1 coders faced a sequence of DP problems,
the second of which required 2 levels of DP.  radeye and John Dethridge, clearly experts at all
things DP, lead the pack.  Each of them conducted a challenging lecture later on, preying on many of
the Div 1 easy submissions.  In Division 2, the newcomer matmis proved he wasn't new to
programming.  Newcomers win division 2 so frequently, other competitors must be cautious competing
with them.  After all, tomek and SnapDragon were newcomers once.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>SimpleCalculator</b> 
</font> 
<A href="Javascript:openProblemRating(2272)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505627" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      214 / 236 (90.68%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      208 / 214 (97.20%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Krumble</b> for 248.75 points (2 mins 1 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      202.90 (for 208 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
The major issue with this problem, was correctly parsing the input.  Once complete, the actual
computation was trivial.  The C++-ish solution uses a single sscanf statement, or a few
stringstreams.  A Java-ish solution uses either StringTokenizer, or split combined with a replaceAll
regular expression:
<pre>
       input.replaceAll("([-+*/])"," $1 ").split(" ");
</pre>
Understanding the above code, gives some good insight into Java regular expressions.
</p> 

<font size="+2"> 
<b>TeXLeX</b> 
</font> 
<A href="Javascript:openProblemRating(2271)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505627" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
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
      80 / 236 (33.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      23 / 80 (28.75%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>BradAustin</b> for 400.41 points (22 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      282.71 (for 23 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 



Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      350 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      173 / 200 (86.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      73 / 173 (42.20%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>radeye</b> for 316.08 points (9 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      190.75 (for 73 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem was nasty.  TeX, Donald Knuth's ubiquitous typesetting software, has many intracacies
that even diehard TeX/LaTeX users don't know about.  In order to support many different input mechanisms,
TeX gives users the ability to easily access all characters using caret sequences.  These are
particularly useful when trying to access characters outside of the printable range.  The code that
goes into handling this convenience was the point of this problem.  <br/>
<br/>
To implement the primitive TeX lexer required for this problem, we read in characters from the left
side of the input.  At any point in time, we are only concerned with the leftmost 4
characters.  If the leftmost character is not a caret, we simply remove it from the input and
append its value to the returned
list.  Otherwise, we try to match one of the caret processing rules to the 4-character block.  In
this process, we need be careful that the string doesn't end prematurely, and that we store the
values in an int or unsigned character, to avoid negatives.  The last 2 pitfalls accounted for most
of the incorrect submissions.  The character produced by the caret rule should be returned to the
input, to be processed again.  The characters used to produce the new character are removed.
</p> 

<font size="+2"> 
<b>BadSubstring</b> 
</font> 
<A href="Javascript:openProblemRating(1872)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505627" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      40 / 236 (16.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 40 (50.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>matmis</b> for 934.41 points (7 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      701.16 (for 20 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem is a bit tricky conceptually, but requires very little code.  There are many ways of
understanding how to solve this problem.  If you happen to be familiar with DFAs (Deterministic
Finite Automata), build a 3 state DFA that accepts the set of strings which don't have
&quot;ab&quot; as a substring ( L((b+a*c)*a*) ) for those savvy with regular expressions).  Consider
the expression for how many strings of a given length will end up on either of the final states.  An
analogous approach is to consider, for any given length, how many strings (which do not have an
"ab" substring) end with an 'a', and how many do not.  The key here, is that these values can be
defined inductively.  Let A(k) and N(k) denote how many strings of length k end with 'a', or do not
respectively.  Again, we are only referring to the strings that do not contain &quot;ab&quot;.  We
then have the following recurrence:<pre>
         A(k) = A(k-1) + N(k-1) for k > 0       (1)                            
         N(k) = 2*N(k-1) +A(k-1) for k > 0     (2)                             
</pre>
These recurrence relations are staring at you when you build the DFA.  The reasoning is as follows:
<ul>
<li>1) Any string that does or doesn't end with an 'a', can be made into a string that does by
appending an 'a'.</li>
<li>2) Any string that ends with an 'a' can be made into one that doesn't by appending a 'c'.  We
cannot append a 'b' here, since we would create an &quot;ab&quot; substring.  For
the ones that don't end with an 'a', 'b' or 'c' can be appended (the 2 choices are what cause the
multiplier of 2 in the formula for N(k)).  </li>
</ul>
Iterating this recurrence, the answer is computed quite quickly.  For those math buffs out there,
try to prove that the answer is just the fibonacci sequence in disguise.
</p> 

<font size="+2"> 
<b>RandomFA</b> 
</font> 
<A href="Javascript:openProblemRating(2287)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505627" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      52 / 200 (26.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      43 / 52 (82.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>mathijs</b> for 407.93 points (14 mins 10 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      273.06 (for 43 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This was one of those DP-Probability questions.  Since this was a medium, the bounds on maxLength
were low enough to allow brute force, but the DP solution is far cleaner in my opinion.  We maintain
an array of states that will hold the probability of being on each state, for a given length of
string.  The probability of being on state p for strings of length n is directly computable from the
probabilities for length n-1.  This property allows DP to work.  The only remaining trick is to
properly weight the given probabilities.  Since there are 3 times more strings of length k than k+1,
we need to weight its affect on the final probability three times more.  There are many ways to
accomplish this task.  Java code for one such method follows:
<pre>
public double getProbability(String[] rulesa, String[] rulesb, 
                             String[] rulesc, int finalState, int maxLength) {
   double[] ret = new double[rulesa.length+1], actual = new double[ret.length];
   double[][][] probs = new double[ret.length][ret.length][3];
   String[][] arrs = {rulesa, rulesb, rulesc};
   //Parse the input, and store it in probs
   //The value ret.length-1 is used for the state 999
   for (int a = 0; a &lt; 3; a++) {
      for (int r = 0; r &lt; arrs[a].length; r++) {
         String toks[] = arrs[a][r].split(" ");
         int left = 100;
         if (arrs[a][r].length()==0) {
            probs[r][ret.length-1][a] = left/100.0;
            continue;
         }
         for (int c = 0; c &lt; toks.length; c++) {
            String[] pair = toks[c].split(":");
            int st = Integer.parseInt(pair[0]), 
                prob = Integer.parseInt(pair[1]);
            probs[r][st][a] = prob/100.0;
            left-=prob;
         } probs[r][ret.length-1][a] = left/100.0;
      } probs[ret.length-1][ret.length-1][a] = 1;
   }
   //Now the actual good stuff begins
   double num = 1, denom = 4, adder = 9;
   ret[0] = actual[0] = 1;
   for (int i = 0; i &lt; maxLength; i++) {
      double[] newprob = new double[ret.length];
      for (int a = 0; a &lt; 3; a++) 
         for (int s = 0; s &lt; newprob.length; s++) 
            for (int t = 0; t &lt; newprob.length; t++) 
               newprob[t] += actual[s]*probs[s][t][a]/3.0;
      for (int s = 0; s &lt; ret.length; s++) 
         ret[s] = (num*ret[s] + (denom-num)*newprob[s]) / denom;
      actual = newprob;
      num = denom;
      denom+= adder;
      adder*=3;
   }
   return ret[finalState==999?ret.length-1:finalState];
}
</pre>
</p> 

<font size="+2"> 
<b>MiniPaint</b> 
</font> 
<A href="Javascript:openProblemRating(1996)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505627" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
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
      13 / 200 (6.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      9 / 13 (69.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dgarthur</b> for 830.04 points (13 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      591.46 (for 9 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem was DP in disguise.  At first glance, the solution appears to be greedy.  Will
arranging the contiguous sections of paint in order of length work?  Unfortunately, greedy
methods do not seem applicable.  It turns out, you probably need to use DP twice!  Consider the following strip:<pre>
    "WWWBBBBWWWBBBB"
</pre>
Let's consider the least number of mispainted squares, for each possible number of strokes:<pre>
   0 Strokes : 14 mispainted
   1 Stroke  : 6 mispainted
   2 Strokes : 3 mispainted
   3 Strokes : 3 mispainted
   4 Strokes : 0 mispainted
</pre>
The greedy methods I have seen have a hard time producing these results, and completely breakdown
for more complex strips.  Using DP/Memoization we compute the cost for the whole strip, using the
costs for smaller substrips.  Java code implementing memoization follows:
<pre>
int[][][] cache = new int[3][50][51];
int BIG = 3000;
int stripScore(int[][] row, int[][][] cache, int start, int needed, int prev) {
   if (needed > 0 &amp;&amp; start >= row[0].length) return BIG;
   if (needed == 0 || start >= row[0].length) return 0;
   if (cache[prev][start][needed] != -1) return cache[prev][start][needed];
   int best = BIG;
   for (int i = 0; i &lt; 3; i++) {
      int newneeded = needed, adder = 0;
      if (i == 0 || i == prev) newneeded--;
      if (i == 0 || i!=row[1][start]) adder += row[0][start];
      best = Math.min(best,stripScore(row,rowid,start+1,newneeded,i)+adder);
   } return cache[prev][start][needed] = Math.min(BIG,best);
}
</pre>
In the code above, prev denotes the color we used to paint the region immediately to the left of the
current region.  prev values of 0,1 and 2 denote not painted, white, and black respectively.
row[0][k] denotes the length of the kth contiguous region of the strip, and row[1][k] denotes its
color, using the same numbering system as prev.  start is the number of the currently processed region,
starting from the left.  needed denotes the number of strokes that should be used.  For example,
passing 3,5,and 1 for start, needed and prev is like asking: &quot;Starting at the 3rd region from
the left, with the last color used being white, and using exactly 5 strokes, what is the least
number of mispainted spaces possible?&quot;  To obtain the best score for a row using exactly k
strokes, we pass 0, k, and 0 to start needed and prev.  The key to this algorithm, is that the best
score for the area to the right of the kth region, is uniquely determined by the number of strokes
needed, and the color used to paint the (k-1)th region.<br/>
<br/>
stripScore allows us to find the least number of mispainted spaces, for any row, given a particular
number of strokes.  Using this row data, we now have to find the best score for the whole picture.
Once again, this process requires DP/Memoization.  We build an array that stores, for each number of
strokes, the least number of mispainted spaces.  Then, using the same process that is used to solve
0-1 knapsack or coin changing, we try each stroke amount for each row, and compute the best score.
</p> 
 
<div class="authorPhoto">
    <img src="/i/m/brett1479_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
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
