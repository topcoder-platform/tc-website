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
<tc-webtag:forumLink forumID="505934" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Open <br> Online Round 2 </span><br>March 8, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This round of the TCO goes to tomek, thanks to a solid time on all three tasks. 
A successful challenge phase helped ante to jump to the second place, ploh
finished third. 
</p>

<p>
The problem set was reasonably easy, more than 20 coders were able to correctly
solve the whole set. The only glitch in this round were the broadcasts concerning
the 550-point problem. On one hand, it was a bit of a shame, as the problem really
needed a correct formal problem statement. On the other hand, the examples allowed
only the interpretation given in the broadcasts. Thus there was no reason to 
cancel the match, and the results are valid. Congratulations to all advancers!
</p>


<H1>

The Problems

</H1>




<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=4515&amp;rd=9891"
name="4515">PowerDigit</a></b>

</font>

<A href="Javascript:openProblemRating(4515)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505934"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

<br>

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

      368 / 370 (99.46%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      202 / 368 (54.89%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>turuthok</b> for 245.58 points (3 mins 49 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      205.15 (for 202 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
As <a
href="/stat?c=problem_solution&rm=247863&rd=9891&pm=4515&cr=152614">turuthok's
submission</a> shows, Java coders had a distinct advantage in this problem, thanks to the bigInteger
class. 
</p>

<p>
In other programming languages the coders had to be a bit more careful.
The hardest part of this problem is determining when to return -1. 
The rest is simple: If the number <i>x<sup>y</sup></i> has the <i>k</i>-th
digit (as defined in the problem statement), we can compute it 
as <i><a href="http://mathworld.wolfram.com/FloorFunction.html">floor</a>( x<sup>y</sup> / 10<sup>k</sup> ) mod 10</i>.
</p>

<p>
Probably the simplest way to solve both parts at once: Sequentially compute powers of <i>x</i> modulo
100,000. Keep a flag whether the result is already at least equal to 100,000. At the end, you'll have the
value <i>x<sup>y</sup> mod 100,000</i>, and you will know whether this is the actual value. 
This is enough information to determine the result. C++ code follows.
</p>

<pre>
  int digitK(int x, int y, int k) {
    bool large = false;

    // compute:
    // tmp = (x^y) mod 100000
    // large = (x^y &gt;= 100000)
    
    long long tmp = 1;
    while (y--) {
      tmp *= x;
      if (tmp &gt;= 100000) large = true;
      tmp %= 100000;
    }

    // convert the number into a vector of digits
    vector&lt;int&gt; digits;
    while (tmp) {
      digits.push_back(tmp%10);
      tmp /= 10;
    }
    // BE CAREFUL! A SPECIAL CASE!
    if (x==0) digits.push_back(0);

    // fill in the missing digits correctly
    if (large) {
      while (digits.size() &lt;= k) digits.push_back(0);
    } else {
      while (digits.size() &lt;= k) digits.push_back(-1);
    }

    return digits[k];
  }
</pre>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6047&amp;rd=9891"
name="6047">InverseCollatz</a></b>

</font>

<A href="Javascript:openProblemRating(6047)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505934"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

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

      140 / 370 (37.84%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      116 / 140 (82.86%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Eryx</b> for 510.87 points (7 mins 59 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      292.92 (for 116 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
Given the string S and a valid result R, we can easily "invert" the result to get the initial
number &ndash; we can go backwards and compute all the intermediate values.
</p>

<p>
For example, if the string S="EOE" and the result was 14, we can deduce the whole sequence
as follows: In the last step, the even-rule was applied, thus the previous number was twice
as big, i.e., 28. The previous step had to be 9 &rarr; 28, and the first step was 18 &rarr; 9.
Thus we started with the number 18.
</p>

<p>
Note that each of the two operations preserves order, in the sense that if we have a larger
(valid) input, we will get a larger output. This also means that the inverse operation
described above has to preserve order in the same way: if we take a larger (valid) result
and "invert" it, we will get a larger starting number. 
</p>

<p>
This can bring us to the idea to try to compute the solution to the given task by going backwards 
in the given string.
</p>

<p>
A brute force solution could work as follows: Consider all possible result values: 1, 2, 3, ...
For each of them, verify whether it is valid by going backwards, and if it is valid, note the
starting number. As soon as we have found two valid starting numbers P, Q (P&lt;Q), we are done.
From the observation about preserving order we know that these two numbers are the smallest two.

Thus the sequence we seek has to be "(Q-P)k + P".
</p>

<p>
The large example in the problem statement shows that this approach, while correct, will be too
slow to solve the large cases. Luckily, we can easily fix this.
</p>

<p>
We won't be going backwards through the whole string. Instead, will compute the solution
one step at a time. 
</p>

<p>
For example, suppose that S = 'O' + T, and that we already know that for the input T the solution
is "8k+6". If we want to determine the solution for the whole sequence S, we have to determine
which of these values are reachable after an 'O'-step, and what are the corresponding input numbers.
</p>

<p>
In this case, the first few elements of the solution for T are { 6, 14, 22, 30, 38, 46, 54 ... }
Let's consider them one after the other
</p>

<ul>
<li>The number 6 can't be reached, it is not of the form 3k+1.</li>
<li>The number 14 can't be reached, it is not of the form 3k+1.</li>
<li>The number 22 can be reached as 7 &rarr; 22.</li>
<li>The number 30 can't be reached, it is not of the form 3k+1.</li>
<li>The number 38 can't be reached, it is not of the form 3k+1.</li>
<li>The number 46 can be reached as 15 &rarr; 46.</li>
</ul>

<p>
We can stop here.
The first two reachable values are 22 and 46, the smallest two original values are 7 and 15. 
This means that the answer is "8k+7".
</p>

<p>
The case when the first step is an 'O'-step can be solved as shown in the example. 
The 'E'-case is even simpler, all values can be reached, the answer changes from
"Pk+Q" to "(2*P)k+(2*Q)". Still, we can use the same approach here.
</p>

<p>
While it is possible to compute exact formulas giving the changed sequence in both cases, 
I consider this approach to be more robust, less error-prone, and it still leads to a 
pretty short piece of code. First, we will write a function to make one 
step backwards, or return zero if the step is impossible:
</p>

<pre>
  long long inverseStep(char ch, long long x) {
    if (ch=='E') return 2*x;
    if (x%3 != 1) return 0;  // no valid original
    x /= 3;
    if (x%2 == 0) return 0;  // the original is NOT odd, we wouldn't take an 'O'-step!
    return x;
  }
</pre>

<p>
Now we can write the main function as follows:
</p>

<pre>
  string getForm(string s) {
    long long a=1, b=0;
    for (int d=s.size()-1; d&gt;=0; d--) {
      vector&lt;long long&gt; originals;
      for (long long k=0; ; k++) {
        long long x = inverseStep( s[d], a*k+b );
        if (x) originals.push_back(x);
        if (originals.size() == 2) break;
      }
      a = originals[1] - originals[0];
      b = originals[0];
      
      // one more small fix necessary:
      // the correct form of a sequence {a, 2a, 3a, ...} is "ak+0", not "ak+a"
      if (b==a) b=0;
    }

    stringstream SS;
    SS &lt;&lt; a &lt;&lt; "k+" &lt;&lt; b;
    return SS.str();
  }
</pre>

<p><b>Homework for advancers #1.</b></p>

<p>
To gain a deeper understanding of this problem, try to answer the following questions:
</p>

<ul>
<li>Can you prove that the result will always be an arithmetic sequence?</li>
<li>Moreover, can you prove that its difference will always be some power of two?</li>
<li>Can you find a straight relationship between the string S and the exponent of this power of two?
(Hint: Look at letter counts.)</li>
<li>Can you write a one-liner solving this task?</li>
</ul>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6044&amp;rd=9891"
name="6044">BlindMazeSolve</a></b>

</font>

<A href="Javascript:openProblemRating(6044)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505934"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"
border="0" /></A>

<br>

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

      112 / 370 (30.27%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      86 / 112 (76.79%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>krijgertje</b> for 888.73 points (10 mins 19 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      600.16 (for 86 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
The immediate question after reading the problem statement should've been: How do I 
build a graph corresponding to this problem? 
</p>

<p>
What we really want is to make sure that we reached the exit. What we initially know
is that we can be at any of the free squares. This is a piece of information we can
update after we move: For each of our possible positions, try to make a move, and note
the position where it ended. 
</p>

<p>
Also the small size of the maze (at most 20 squares) suggests that a state space search
is the way to go.
</p>

<p>
We have at most 21 possible positions: at most 20 squares, and the exit. Our current 
state at any moment of the game can be uniquely described by giving the set of positions
where we can be at that moment. Thus we have 2<sup>21</sup> theoretically possible states.
</p>

<p>
Now consider a graph where states are vertices, and each edge corresponds to
us making one move in the game. The starting vertex will be the state containing all free
squares, the destination vertex is the state containing only the exit. 
The solution of our problem corresponds to the
lexicographically smallest of the shortest paths between these two vertices.
</p>

<p><i>(Some coders decided to use only 2<sup>20</sup> states, with the state "you can't be on
any of the squares" corresponding to the destination vertex. In this situation, both approaches
are correct. However, if the problem statement would ask for the length of the path, this
approach would have to handle a maze full of 'X's separately.)</i></p>

<p>
The canonical approach to finding shortest paths (in unweighted graphs) is breadth-first search.
If we want a lexicographically smallest shortest path, we have to be a bit more careful.
There are two possible approaches:
</p>

<p>
The first approach is to search backwards. If you find several ways how to reach a vertex
in an optimal number of steps, consider all possible predecessors and keep only that one
that corresponds to the lexicographically smallest first step. (This can be done on the fly,
for each vertex you keep its predecessor, you only have to adjust the code that handles a
situation when you process an edge that leads to an already visited vertex.)
</p>

<p>
The second approach is simpler to code but harder to believe. Run a normal BFS. Each time you
process a vertex, process the outgoing edges in lexicographical order. For each vertex,
keep the first found predecessor.
</p>

<p>
(The easiest way to show why this works is to split the vertices into "layers" according
to their distance from the starting vertex. Then we can prove that the vertices in each
layer will be processed in lexicograpical order (i.e., the path into a later discovered
vertex will be lexicographically greater).
</p>

<p>
<a href="/stat?c=problem_solution&rm=247865&rd=9891&pm=6044&cr=9906197">krijgertje's
solution</a> is a pretty clean implementation of the second approach.
</p>

<p><b>Homework for advancers #2.</b></p>

<ul>
<li>Find an input that leads to the longest possible answer.</li>
<li>Find an input that leads to the largest possible number of actually visited states.</li>
<li>Prove that a solution exists if the exit is reachable from each of the squares.</li>
</ul>



<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
