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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=11121">Match Overview</A><br />
    <tc-webtag:forumLink forumID="518802" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 387</span><br />Wednesday, January 9, 2008
<br /><br />



<h2>Match summary</h2>
<p>

<p>
After two matches, competitors have finally remembered what solving Div1 Hard during the match looks like. This match proved to be of average difficulty. The success rate for almost all problems was pretty good.
</p>

<p>
The match was won by a great high schooler <tc-webtag:handle coderId="14768757" context="algorithm"/> - in a moment he submitted all three problems. The second and third places were taken by <tc-webtag:handle coderId="14946025" context="algorithm"/> and <tc-webtag:handle coderId="7433858" context="algorithm"/>. The Top-3 in Div-II was formed by <tc-webtag:handle coderId="13356348" context="algorithm"/>, <tc-webtag:handle coderId="22652051" context="algorithm"/> and <tc-webtag:handle coderId="22630767" context="algorithm"/>.
</p>

</p>



<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8539&amp;rd=11121" name="8539">GuessingNextElement</a></b>

</font>

<A href="Javascript:openProblemRating(8539)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518802" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      457 / 469 (97.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      397 / 457 (86.87%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>TopRushers</b> for 249.09 points (1 mins 43 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      224.32 (for 397 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>
First of all, we need to determine, whether the sequence represents an integer arithmetic or geometric progression. In an integer arithmetic progression the difference between neighbouring elements is constant. In an integer geometric progression the quotient of neighbouring elements is constant. So we need to check these properties. Then we need to calculate parameter q of the sequence (we don't need parameter p), and to return the next element of the sequence.
</p>

<p>
If the sequence represents an integer arithmetic progression then:
<ul>
  <li>q is equal to the absolute difference between any two neighbouring elements (i.e., A[i] - A[i - 1]).</li>
  <li>The next element is calculated as (the last element of the sequence) + q.</li>
</ul>
</p>

<p>
If the sequence represents an integer geometric progression, we do following:
<ul>
  <li>q is now equal to the quotient of any two neighbouring elements (i.e., A[i] / A[i - 1]).</li>
  <li>The next element is calculated as (the last element of the sequence) * q.</li>
</ul>
</p>

<p>
For a clear implementation see <tc-webtag:handle coderId="22677519" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268083&rd=11121&pm=8539&cr=22677519">code</a>.
</p>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8527&amp;rd=11121" name="8527">MarblesRegroupingEasy</a></b>

</font>

<A href="Javascript:openProblemRating(8527)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518802" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      182 / 469 (38.81%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      59 / 182 (32.42%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Steps09</b> for 482.88 points (14 mins 45 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      315.65 (for 59 correct submissions)

    </td>

  </tr>

</table></blockquote>

Used as: Division One - Level One: <blockquote><table cellspacing="2">

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      300

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      343 / 442 (77.60%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      226 / 343 (65.89%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>overwise</b> for 286.08 points (6 mins 19 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      201.05 (for 226 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>
The crucial part is to notice that in each optimal solution we can always have one joker box, even if we don't use it at all. That joker box doesn't need to contain marbles of different colors - it may also contain only marbles of the same color or even contain no marbles at all.
Now, let's try every box as a joker box and try to optimally solve the problem in each situation. If we know how to do that, the solution is the minimum of optimal solutions for all these situations. Let's see what would we do with each box (except joker box) in dependence with box state:
</p>

<p>
    <ul>
    <li><b>Box is empty</b></li> <br>
        We will eliminate those boxes from consideration as they don't have any importance. Instead of moving marbles to such box, we can move them to joker box.
  </ul>

<p>
    <ul>
    <li><b>Box contains marbles of different colors</b></li> <br>
        As each box must either be empty or contain only marbles of the same color, we will surely need to eliminate some marbles from that box. So, one move will surely be performed. As we can take any number of marbles from one box in one move, why not move all marbles from that box into joker box. So, move them all.
  </ul>
</p>

<p>
    <ul>
    <li><b>Box contains only marbles of the same color</b></li> <br>
        As we cleared all boxes with state 1 or 2, we got only boxes which contain only marbles of the same color. The only trouble we can have now is the restriction that all marbles of the same color (except those in the joker box) must be in the same box. So, if marbles of the same color (except those in the joker box) are distributed in multiple different boxes, we need to group them into one box. So, clear all those boxes, except one.
  </ul>
</p>

<p>
Just perform that algorithm with each possible box as a joker box, and take the minimum of the results. For the clear implementation of this approach see  <tc-webtag:handle coderId="7459080" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=268054&rd=11121&pm=8527&cr=7459080">code</a>. One more optimization can be achieved - we don't need to try each box as a joker box. But that's for an easy homework.
</p>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8538&amp;rd=11121" name="8538">MarblesRegroupingHard</a></b>

</font>

<A href="Javascript:openProblemRating(8538)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518802" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      16 / 469 (3.41%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      8 / 16 (50.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mohamad_jrs</b> for 701.43 points (20 mins 27 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      536.88 (for 8 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>
We know that, on the end, all marbles of the same color will be in the same box and each box will either be empty or contain only marbles of the same color. So, if we know the end-box for some color (the box in which all marbles of that color will be in the end), we simply move all marbles of that color to it, except those which are already in it. So, in every end-box positioning for all colors, we need to count only the marbles which are not already in boxes they should be in the end. That number will be the number of moves necessary to solve the problem with specified end-box positioning in minimal number of moves.
</p>

<p>
Now the problem is: How to position end-boxes for all colors so that we need minimal number of moves necessary to solve the problem? Equivalent question is: How to position end-boxes for all colors so that the number of marbles which are already in their end-boxes is maximal? Let's try to answer on the first question.
</p>

<p>
First of all, let's create a bipartite graph where on the one side are vertices representing all colors, and on the other side are boxes. We will connect i-th color to j-th box with an edge whose weight is equal to:
</p>

<pre>
(total number of marles of color i) - boxes[j][i]
</pre>

<p>
which is actually the number of marbles of color i we will need to move. Now we want to match every color with some box and we want to have a minimal sum of weights of included edges. That's exactly min-cost max flow problem. And it's obviously not appropriate for Div2 Hard. But, with given constraints, it can be done using dynamic programming technique.
</p>

<p>
We will define a function opt(upto, used), where upto tells that only boxes with indexes [0..upto] are considered, and ones in the binary representation of used tells us to which colors we still need to assign the end-boxes. That function returns the minimal number of moves necessary to complete the task starting from a given state. Once we have calculated some function, we store it's result in dp[upto][used]. Now we need to define the opt function's body. The following pseudo code does that:
</p>

<p>
<pre>
opt(upto, used): returns integer
    if upto = -1
        if used = 0 // end-boxes must be assigned to all colors
            return 0;
        else
            return infinite;

    if already calculated
        return dp[upto][used];

    // don't assign upto's box to any color
    dp[upto][used] = opt(upto - 1, used);

    // try to assign upto's box to some color
    for i := 0 to number_of_colors - 1 do
        if i-th bit in used is 1
            used1 = (used, with flipped bit on i-th position);
            t = boxes[upto][i] + opt(upto - 1, used1);

            if (dp[upto][used] &gt; t)
                dp[upto][used] := t;
    end of for

    return dp[upto][used];
</pre>
</p>

<p>
The solution to the problem will be opt(n, first m bits set to 1), where n represents the number of boxes, and m - the number of colors. For the implementation of similar algorithm see <tc-webtag:handle coderId="19828178" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=268083&rd=11121&pm=8538&cr=19828178">solution</a>.
</p>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8084&amp;rd=11121" name="8084">IntervalSubsets</a></b>

</font>

<A href="Javascript:openProblemRating(8084)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518802" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      223 / 442 (50.45%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      171 / 223 (76.68%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Gluk</b> for 484.92 points (5 mins 2 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      350.50 (for 171 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>
There are several approaches to this problem. Most of them use dynamic programming, but some optimized brute-force solutions may also pass system test. Here will be explained an O(n^2) algorithm and it can be relatively easily modified to have O(n * lg(n)) complexity, where n is the number of intervals.
</p>

<p>
First of all, let's sort intervals by their finish points. Then we'll define two functions, partial(x) and total(x). The total(x) returns the number of valid subsets of the set formed by first x + 1 intervals. The partial(x) returns the number of valid subsets, which contains x-th interval, of the set formed by the first x + 1 intervals. The solution would be total(n), where n is the number of intervals. Now, let's see how to calculate each of those two functions.
</p>

<p>
<ul>
<li><b>partial(x)</b>:</li><br>
    Find the interval with the greatest index less then x which doesn't intersect with x-th interval. If such interval doesn't exist, result is 1. If it exists, let its index be y. Then the result is total(y).

<li><b>total(x)</b>:</li><br>
    We want to find all intervals, with indexes between 0 and x, which can be the rightmost intervals in some valid subset (now we don't consider the valid subsets of the whole set of intervals but only of the first x + 1 intervals). When we find them, the solution would be the sum of all partials()-s for each of them. Now, let's see what those intervals found look like - for one with index y we can't find interval with index z such that z &gt; y and z <= x, and y-th interval doesn't intersect z-th interval. If such interval exists, we can add it to the subset as it wouldn't make subset invalid.
</ul>
</p>

<p>
Here is the implementation of that algorithm in C++:
</p>

<pre>
    <font color="green">// it's assumed that intervals are sorted by finish</font>
    <font color="blue">int</font> n = intervals.size();

    <font color="green">// solve</font>
    partial[0] = total[0] = 1;
    <font color="blue">for</font> (<font color="blue">int</font> i = 1; i &lt; n; ++i) {

        <font color="green">// calculate partial[i]</font>
        partial[i] = 1;
        <font color="blue">for</font> (<font color="blue">int</font> j = i - 1; j &gt;= 0; --j) {
            <font color="blue">if</font> (finish[j] &lt; start[i]) {
                partial[i] = total[j];
                break;
            }
        }

        <font color="green">// calculate total[i]</font>
        total[i] = 0;
        <font color="blue">int</font> lmax = 0; <font color="green">// the rightmost start of some processed interval</font>
        <font color="blue">for</font> (<font color="blue">int</font> j = i; j &gt;= 0 && finish[j] &gt;= lmax; --j) {
            total[i] += partial[j];
            lmax &gt;= start[j];
        }
    }

    return total[n - 1];
</pre>

<p>
For another approach see <tc-webtag:handle coderId="307060" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=268053&rd=11121&pm=8084&cr=307060">soluton</a>.
</p>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8086&amp;rd=11121" name="8086">StrangeArray</a></b>

</font>

<A href="Javascript:openProblemRating(8086)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518802" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      59 / 442 (13.35%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      41 / 59 (69.49%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Michael_Levin</b> for 795.81 points (13 mins 2 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      511.45 (for 41 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>
Let L be the least common multiple of A.size and B.size. Now, let's calculate first L elements by simple iteration. If N is less or equal to L, then we'll calculate the result only by iteration. But if it's not, additional calculations need to be performed. Each element will be calculated as A[x] ^ y (^ denotes to exponentation). Now, consider (x + L)-th element - it can be calculated as A[x] ^  (y + L / B.size) as corresponding element in B will be incremented exactly L / B.size times. So, each element of the first L elements will be the first element of some geometric progression of the form:
</p>

<pre>
A[x] ^ y, A[x] ^ (y + C), A[x] ^ (y + 2*C), ... , A[x] ^ (y + R*C)
</pre>

<p>
where C is equal to L / B.size and R + 1 represents the number of elements in that sequence (for i-th element R is equal to (N - i) / L). We need to find the sum of all those elements. To calculate that sum, a simple divide and conquer algorithm exists. So, for each of first L elements calculate the sum of all elements of "its" geometric progression. Then the result is the sum of all those sums.
</p>

<p>
For example of that approach, see <tc-webtag:handle coderId="14768757" context="algorithm"/>'s <a  href="/stat?c=problem_solution&rm=268064&rd=11121&pm=8086&cr=14768757">solution</a>.

</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/Relja_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20641244" context="algorithm"/><br />
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
