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
<tc-webtag:forumLink forumID="505871" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 305</span><br>Wednesday, May 31, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
An unusually tricky Division 2 Medium/Division 1 Easy kept scores generally 
low.  At the end of the coding phase, 
<tc-webtag:handle coderId="8394868" context="algorithm"/>
led by 60 points over 
<tc-webtag:handle coderId="10574855" context="algorithm"/> and
<tc-webtag:handle coderId="7462740" context="algorithm"/>, who were neck
and neck.  However,
three successful challenges for
<tc-webtag:handle coderId="7462740" context="algorithm"/>
and two for
<tc-webtag:handle coderId="10574855" context="algorithm"/>
reversed this order, giving 
<tc-webtag:handle coderId="7462740" context="algorithm"/>
the victory.
</p>

<p>
In Division 2, the only three coders to solve the Hard took the top three
spots, with <tc-webtag:handle coderId="15101078" context="algorithm"/>
holding off <tc-webtag:handle coderId="15614633" context="algorithm"/>
in an active challenge phase, and newcomer
<tc-webtag:handle coderId="22098667" context="algorithm"/>
taking third.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3526&amp;rd=9826"
name="3526">MultiRead</a></b>
</font>
<A href="Javascript:openProblemRating(3526)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505871"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      270 / 304 (88.82%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      248 / 270 (91.85%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>scorpio2g5</b> for 244.91 points (4 mins 6 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      193.05 (for 248 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
In this problem, you count each write as one cycle and each run of
reads as <i>ceiling(size/procs)</i> cycles, where <i>size</i> is the
number of reads in the run.  Of course, integer division normally rounds down, 
so you need to do something special to round up instead.  One easy formula is
<i>(size+procs-1)/procs</i>.
</p>

<p>
See <tc-webtag:handle coderId="20394568" context="algorithm"/>'s and
<tc-webtag:handle coderId="20244809" context="algorithm"/>'s submissions for
nice examples.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6409&amp;rd=9826"
name="6409">UnfairDivision</a></b>
</font>
<A href="Javascript:openProblemRating(6409)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505871"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      99 / 304 (32.57%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      30 / 99 (30.30%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>preyas_p</b> for 417.75 points (13 mins 9 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      272.48 (for 30 correct submissions) 
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
      274 / 309 (88.67%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      189 / 274 (68.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>soul-net</b> for 236.00 points (7 mins 0 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      169.37 (for 189 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
A glance at the submission and success rates in both divisions reveals that 
this was a tricky problem.  At its core are two nested loops, one from 
Albert's point of view and one from Betty's point of view.
</p>

<p>
Albert's loop is fairly straightforward.  He considers all possible places
he could cut and picks the one that gives him the best result.
<pre>
    int bestAlbert = 0;
    for (int a = 1; a < n; a++) {
      int albert = <i>how much does Albert get if he cuts here?</i>
      bestAlbert = max(albert,bestAlbert);
    }
    return bestAlbert;
</pre>
Betty's loop is where things get tricky.  First, you have to remember
to switch points of view.  Otherwise, you essentially let Albert pick
both cuts.  For example, consider a list of 9 assets, all worth $1.
After both cuts have been made and the assets in each sublist have
been totaled, Albert will get the smallest sublist.  If Albert got to
pick both cuts, he could get $3, by first cutting the 9 assets into a
list of 3 and a list of 6, and then cutting the list of 6 into two
lists of 3.  However, Betty is not so cooperative.  If Albert cut the
9 assets into a list of 3 and a list of 6, then Betty would cut the
list of 6 into a list of 5 and a list of 1, giving herself $3 and Albert $1.
Sure, Betty <i>could</i> cut the list of 6 into two lists of 3 and she would
get the same amount.  But remember that she holds a grudge and would rather
see Albert get $1 than $3.
</p>

<p>
The second tricky part about Betty's loop is getting the tiebreaker rules just right.  Many people correctly maximized Betty's share but messed up minimizing Albert's share in the case of ties.  Altogether, Betty's loop looks like
</p>
<pre>
      int bestBetty = 0;
      int albert = 0;
      for (int b = 1; b &lt; n; b++) {
        if (a == b) continue;
        int i = min(a,b), j = max(a,b);
        int[] sorted = { sum(0,i), sum(i,j), sum(j,n) };
        sort( sorted );
        if (sorted[1] &gt; bestBetty || sorted[1] == bestBetty && sorted[0] &lt; albert) {
          bestBetty = sorted[1];
          albert = sorted[0];
        }
      }
</pre>
where <tt>sum</tt> is a helper function that sums the assets in the given range
of indices.
</p>

<p>
See <tc-webtag:handle coderId="16056118" context="algorithm"/>'s solution
for a clean implementation of this logic.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6410&amp;rd=9826"
name="6410">Cannibals</a></b>
</font>
<A href="Javascript:openProblemRating(6410)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505871"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1050 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 304 (2.63%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      3 / 8 (37.50%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>preyas_p</b> for 495.20 points (41 mins 37 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      470.58 (for 3 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Three letters: BFS.  Breadth-first search.  See any algorithms textbook
or 
<tc-webtag:handle coderId="268851" context="algorithm"/>'s
<a
href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2#breadth">tutorial</a>
for a detailed description of BFS.  As with all off-the-shelf
algorithms, however, the hard part is recognizing when to use it.  Common
tipoffs that BFS might be appropriate are (1) trying to find the smallest number of moves to reach a given
state when (2) all moves have equal cost.
</p>

<p>
To use BFS, you first have to decide what a &ldquo;state&rdquo; looks
like.  One thought is the numbers of missionaries and cannibals on
each side of the river, but this is redundant because, given the
numbers of missionaries and cannibals on one side of the river, you
can figure out the numbers on the other side.  You also need to keep track of
where the boat is.  Altogether then, a state is made up of three numbers:
the number of missionaries on one side of the river, the number of cannibals on one side of the river, and the position of the boat.
</p>

<p>
Once you know what a state looks like, you need to figure out which
states you can get to in one move.  You can do this with two loops generating
all combinations of missionaries and cannibals that can fit on the boat.  
However, there are a lot of details to get right.  First, you can't put
more missionaries or cannibals on the boat than are on that side of the river.
Second, you need to make sure that none of the missionaries get eaten, which
involves checking the boat and both sides of the river.  (If your state
only tracks one side of the river, then it is easy to forget to check the
other side.)
</p>

<p>
See newcomer <tc-webtag:handle coderId="22098667" context="algorithm"/>'s submission for a BFS-based solution.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6435&amp;rd=9826"
name="6435">InterleavePal</a></b>
</font>
<A href="Javascript:openProblemRating(6435)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505871"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      84 / 309 (27.18%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      45 / 84 (53.57%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ying</b> for 432.85 points (11 mins 33 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      289.05 (for 45 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Dynamic programming is feared by the vast majority of coders in the
world, so it is amusing to see how little provocation a Division 1
coder needs to reach for DP.  Especially in problems like this, where
a nominally simpler algorithm like depth-first search is all that is
required.  Yes, if you want to claim that a DFS that keeps track of
which states it has visited is doing a kind of DP, I won't argue with
you, but thinking dynamic programming instead of depth-first search
puts you in a different mindset.
</p>

<p>
A depth-first search for this problem can work either outside-in or
inside-out.  In either case, a state is characterized by start and end
points in the first string and start and end points in the second
string.  A state (A,B,C,D) is true if it is possible to interleave the
substrings S.substring(A,B) and T.substring(C,D) to make a palindrome.
If you are working inside-out, then possible successor states are
(A-1,B+1,C,D), (A-1,B,C,D+1), (A,B+1,C-1,D), and (A,B,C-1,D+1),
depending on which pairs of characters match.  Starting from trivial
palindromes for empty or singleton substrings, you &ldquo;grow&rdquo;
larger and larger palindromes, keeping track of the longest you've
found.
</p>

<p>
For example, here is a recursive DFS procedure to do the search.
<pre>
  void dfs(int slo,int shi,int tlo,int thi) {
    // only called when s.substring(slo,shi) and t.substring(tlo,thi)
    // can be interleaved to make a palindrome

    if (visited[slo][shi][tlo][thi]) return;
    visited[slo][shi][tlo][thi] = true;

    int len = (shi-slo)+(thi-tlo);
    if (len &gt; longest) longest = len;

    if (slo &gt; 0) {
      if (shi &lt; m && s[slo-1] == s[shi]) dfs(slo-1,shi+1,tlo,thi);
      if (thi &lt; n && s[slo-1] == t[thi]) dfs(slo-1,shi,tlo,thi+1);
    }
    if (tlo &gt; 0) {
      if (shi &lt; m && t[tlo-1] == s[shi]) dfs(slo,shi+1,tlo-1,thi);
      if (thi &lt; n && t[tlo-1] == t[thi]) dfs(slo,shi,tlo-1,thi+1);
    }
  }
</pre>
This procedure is called by the main function from all possible starting
positions:
<pre>
    for (int i = 0; i &lt;= s.length(); i++) {
      for (int j = 0; j &lt;= t.length(); j++) {
        dfs(i,i,j,j);
        if (i &lt; m) dfs(i,i+1,j,j);
        if (j &lt; n) dfs(i,i,j,j+1);
      }
    }
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6408&amp;rd=9826"
name="6408">PowerCollector</a></b>
</font>
<A href="Javascript:openProblemRating(6408)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505871"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      36 / 309 (11.65%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      18 / 36 (50.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Michael_Levin</b> for 754.03 points (13 mins 1 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      559.04 (for 18 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Obviously, with N up to 10<sup>18</sup>, we cannot hope 
to loop through all the numbers and count which ones are powers.
However, note that 10<sup>18</sup> is approximately 2<sup>60</sup>, so we only
need to consider exponents up to about 60.  That is a small enough
number to loop through.
</p>

<p>
How many powers below N have exponent K?  That's just the K-th root
of N, with can be found using binary search.  (If you trust floating
point arithmetic, you could also try N<sup>1.0/K</sup>, but precision
might be a problem.)  So, one approach is to sum the roots of N for each
possible exponent.
</p>

<p>
Unfortunately, this approach overcounts dreadfully.  
For example, 16 is counted twice, once as 2<sup>4</sup> 
and once as 4<sup>2</sup>.  To avoid this duplication, we only count
exponents that are primes.  So we would count 16 as 4<sup>2</sup> but
not as 2<sup>4</sup>.
</p>

<p>
This still doesn't quite work.  For example, 64 is still counted twice,
once as 8<sup>2</sup> and once as 4<sup>3</sup>.  We can avoid this by
excluding those bases that are themselves powers with a smaller exponent.
For example, 4<sup>3</sup> would be forbidden because 4 is 2<sup>2</sup>.
Now, how many such powers do we need to exclude?  Well, it's the number of
powers up to the relevant root of N.  Hmm, I smell recursion...
</p>

<p>
The core recursive function can be written
<pre>
  long countPowers(long N, int p) {
     // count the powers &lt;= N with a prime exponent &lt; p

     long count = 1;  // always count 1 as a power
     for (int k = 2; k &lt; p; k++) {
        if (!isPrime(k)) continue; 
        long r = root(N,k);  // the k-th root of N, rounded down
        if (r == 1) break;
        count += r - countPowers(r,k);
     }
     return count;
  }
</pre>
Then the main function simply calls the recursive function with the
original N and a large enough p, such as 60.
</p><div class="authorPhoto">
    <img src="/i/m/vorthys_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="299177" context="algorithm"/><br />
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
