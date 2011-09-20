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
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12171">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520961" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 399</span><br />Wednesday, April 23, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
SRM 399 was dominated by <tc-webtag:handle coderId="10574855" context="algorithm"/>, who even without his easy submission would have won the match. Winning this match let <tc-webtag:handle coderId="10574855" context="algorithm"/> break the 3800 rating barrier, and we're all wondering how long it will be before he breaks 4000.  Rounding out the top
3 spots in division 1 were <tc-webtag:handle coderId="144400" context="algorithm"/> and <tc-webtag:handle coderId="22690368" context="algorithm"/>.<br><br>

The division 1 problems were a bit harder than average, mostly due to a tricky easy problem which many people failed.  Due to the tricky nature of the easy problem, the challenge phase was particularly exciting, as many submissions
were challenged within the first minute.  The division 2 set was of average difficulty, and had the uncommon property that the hard problem was the same as division 1's easy problem.  Division 2 was won by newcomer <tc-webtag:handle coderId="22726132" context="algorithm"/>, followed by 
<tc-webtag:handle coderId="10326323" context="algorithm"/> and <tc-webtag:handle coderId="22726383" context="algorithm"/>, who will all compete in division 1 for the next match.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8761&amp;rd=12171" name="8761">CircularLine</a></b> 
</font> 
<A href="Javascript:openProblemRating(8761)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520961" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      424 / 540 (78.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      392 / 424 (92.45%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ahmed_aly</b> for 245.64 points (3 mins 48 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      181.45 (for 392 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem, all we need to do is iterate through each pair of stations, find the fastest time to travel between them, and return the maximum of these times.  Given two stations i and j where i&ltj, one way
to go between them is just to iterate from i up to j summing up the travel time between each pair of consecutive stations.  The other way is to iterate from j to n-1 (where n is the number of stations), then from 0 to i again summing up the travel time
between each pair of consecutive stations.  The fastest time to get from i to j (and vice-versa) is the minimum of these two values.  A sample solution in C++ follows:
<pre>
int CircularLine::longestTravel(vector &lt int &gt t) {
    int ret = 0;
    for (int i = 0; i &lt t.size(); i++) for (int j = i + 1; j &lt t.size(); j++) {
        int a = 0, b = 0;
        for (int k = i; k &lt j; k++) a += t[k];
        for (int k = j; k &lt t.size(); k++) b += t[k];
        for (int k = 0; k &lt i; k++) b += t[k];
        ret = max(ret, min(a,b));
    }
    return ret;
}
</pre>
<b> Exercises:</b><br>
1.1: Find an O(N^2) solution to this problem.<br>
1.2: Find an O(N * lg(N)) solution to this problem.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8760&amp;rd=12171" name="8760">MaximalProduct</a></b> 
</font> 
<A href="Javascript:openProblemRating(8760)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520961" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      381 / 540 (70.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      260 / 381 (68.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>solafide</b> for 495.83 points (2 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      397.65 (for 260 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
While it's possible to solve this problem via dynamic programming, a simple observation leads to a much simpler solution.  First, let's suppose that s is a multiple of k.  Then is there any solution
better than using s/k for each a<sub>i</sub>?  It turns out that the answer is no (see exercise).  Intuitively, the reason this works is because numbers that are as close together as possible will give us the maximal product.<br><br>

This idea can be extended to the case where s is not a multiple of k.  Suppose that we start off with each number as being floor(s/k).  Clearly these numbers do not
sum to s (unless s is a multiple of k).  Note that the additional "sum" that's missing is s-k*floor(s/k)=s%k, which is strictly less than k.  The key here is to keep our numbers as close
together as possible, so we can pick s%k of our k copies of floor(s/k) and just add 1 to them.  This construction actually gives us the best possible result, as exercise asks you to prove.  A sample C++ solution follows (beware of overflow!):
<pre>
long long MaximalProduct::maximalProduct(int s, int k) {
    int regular = s / k;
    int other = s % k;
    int ok = k - other;
    long long ret = 1;
    for (int i = 0; i &lt ok; i++) ret *= regular;
    for (int i = 0; i &lt other; i++) ret *= regular + 1;
    return ret;
}
</pre>
<b>Exercises:</b><br>
2.1: Prove that this construction works. Hint: <font color="white">proof by contradiction</font>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8758&amp;rd=12171" name="8758">AvoidingProduct</a></b> 
</font> 
<A href="Javascript:openProblemRating(8758)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520961" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      192 / 540 (35.56%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 192 (11.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sange</b> for 729.60 points (18 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      492.38 (for 22 correct submissions) 
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
      401 / 411 (97.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      126 / 401 (31.42%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 243.88 points (4 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      181.23 (for 126 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
While this problem wasn't terribly conceptually challenging, it was a very easy problem to make a small implementation error on.  The most common bug that coders seemed to have is that they made bad assumptions
on the maximum size of numbers that could be in the result.  For example, there are cases where we may need factors greater than n, and even cases where we may need factors greater than 1000.<br><br>

That being said, the solution to this problem is very straitforward.  One observation that helps is that we will never need a number greater than n+51 (why?).  Therefore we can just iterate through all possible combinations of x, y, and z
from 1 to N+51, making sure we "break out early" if the products get too large. We must keep track of the best value of |n-x*y*z| seen so far and update if we find a better solution. We can also speed things up a bit by ensuring that x&lt=y&lt=z as we iterate.  
You can view <tc-webtag:handle coderId="8493941" context="algorithm"/>'s submission for a nice implementation of this approach.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8711&amp;rd=12171" name="8711">BinarySum</a></b> 
</font> 
<A href="Javascript:openProblemRating(8711)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520961" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      214 / 411 (52.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      103 / 214 (48.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 433.54 points (11 mins 29 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      274.52 (for 103 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
While we're looking for specific permutations of the binary representations of a, b, and c, the key observation that allows us to solve this problem is that all we care about should be the number of 1's in a, b, and c.  Clearly, given the number of ones
in an n-bit integer, we can deduce the number of zeros.  Now let us imagine that we're looking for the least significant bit (LSB) of a', b', and c'.  There are exactly 4 possibilties for these bits, because there are 2 possibilties for 
the LSBs of both a' and b'.  Given these bits, we can uniquely deduce what the LSB of c' must be as well.  However, if the LSBs of both a' and b' are 1, then the choice for the second LSB of c' must be effected by a carry bit (just like long addition in decimal arithmetic).<br><br>

We wish to build a recurrence relation based on this technique.  Let us define F(a1,b1,c1,k,carry) to be the smallest result for the first (most significant) k bits of c', such that the first k bits of a', b', and c' have a1, b1, and c1 one bits, respectively.
Carry is a boolean value that tells us if the current bit must also include a carry bit from the last operation.  Note that we can uniquely deduce the number of zero bits that a', b', and c' must have by computing k-a1, k-b1, and k-c1, respectively.
We can then try all possible bit combinations for the kth bit of a' and b' (which as above gives a unique value for the kth bit of c' when the carry bit is also considered).  Assuming we have enough of the bits we're trying to use, we can
then recurse.  For example, suppose we wish to use a '1' and a '0' as the kth a' and b' bits, and carry is 0.  Then the kth bit of c' will be '1', and we examine the result of F(a1-1,b1,c1-1,k-1,0).  Similarly, if we wish to use '1' and '1' as the kth a' and b'
bits and carry is 1, the kth bit of c' will be '1', and we will examine the result of F(a1-1,b1-1,c1-1,k-1,1).  If this result (determined via recursion) is valid, we can then concatenate the kth c' bit and try to use this number as our final result.  So we try all possible combinations of the current bits and take the minimum of all valid results.<br><br>

Note that our base case is when we need to compute F(0,0,0,0,carry).  Note that if carry = 1, then we have an invalid result, since we would need to add another bit to c', which we aren't allowed to do.  Otherwise, the result is 0.  To compute
the final answer, we simply compute F(a1,b1,c1,k,0), where a1, b1, and c1 are the number of one bits in a, b, and c, respectively.  Here, k is the number of bits in a, b, and c and our carry bit should initially be set to 0.  Of course we can
compute the values of F via either memoization or dynamic programming.  The runtime of this algorithm is O(k^4), where k is the number of bits in a, b, and c.<br><br>

As a small caveat, it may not be obvious that the above algorithm uses the "optimal substructure" property.  But this can be seen because we minimize the MOST significant bits of c' at each step, and a smaller result for the most significant
bits of the result will always give us a globally optimal answer.  You can view <tc-webtag:handle coderId="144400" context="algorithm"/>'s solution for an implementation of this approach.<br><br>

<b>Exercises:</b><br>
4.1: Find a solution that uses O(k^3) memory and still O(k^4) time.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8754&amp;rd=12171" name="8754">DancingParty</a></b> 
</font> 
<A href="Javascript:openProblemRating(8754)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520961" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      91 / 411 (22.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      23 / 91 (25.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 896.81 points (9 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      631.82 (for 23 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Whenever you see a problem that involves matching or pairing things together, there's a good chance that it's reducible to a maxflow problem, which is certainly the case in this problem.  For readers unfamiliar with this topic, see <tc-webtag:handle coderId="8593420" context="algorithm"/>'s tutorial.<br><br>

As is the case with most flow-related problems, the challenge here is to reduce the problem to a flow problem and set up the flow network.  To do so, let's suppose we want to determine if it's possible to complete exactly M rounds of dancing.
We'll set up our flow network as follows (see the figure below).  The left black node will be the source and the right black node the sink.  Red vertices represent boys and the grey vertices represent girls.  If a boy and girl like eachother, we'll add an edge
of unit capacity between the corresponding red and grey vertices (the top and bottom edges in the figure).  Otherwise, we'll add an edge of unit capacity between the blue and green nodes that are connected to the corresponding red and grey nodes (read below).<br><br>

<p align=center><img src="/i/education/srm399.jpg" alt="Graph" /></p>

Here, the blue and green nodes can be seen as "protective" layers for the boys and girls.  Any boy who will be matched to a girl he doesn't like must go through these layers.  Therefore, we want to make the edge capacities between the red and blue nodes equal to k, and the same for the edges
between the green and grey nodes.  Also note that each boy/girl pair will have an edge between either (but never both) a pair of red/grey vertices or a pair of blue/green vertices.  Since we need each boy and girl to participate in exactly M rounds of dancing, we want to make the edge capacities between the source and the red nodes equal to M.  We will also make the edge capacities between the grey nodes and the sink equal to M.<br><br>

Now that we have a flow network, we will find the maximum flow between the source and the sink vertices.  It can be easily shown that there can be exactly M rounds only if the flow going into the sink is equal to N*M, where N is the number of boys.<br><br>

Of course, the problem remains on finding the largest M where this is true.  This can easily be done by performing a binary search to find this value of M and computing a maximum flow for the network induced by each value of M we try.<br><br>

However, there is a more efficient way of finding M.  Suppose we know that there can be 1 round of dancing.  Then we have a maximum flow in our flow network with M=1 with flow N.  Now suppose we want to know if it's possible to have a second round of dancing.  Then we can simply
increment the capacities of the edges going out of the source and into the sink by one, and continue finding augmenting paths given the previous flow.  That is, we use (or recycle) the flow for M=1  and continue finding augmenting paths to compute the maximum flow for M=2, and so on
until the maximum flow is not equal to N*M.  This eliminates the lg(N) factor induced by the binary search approach given above.  See <tc-webtag:handle coderId="144400" context="algorithm"/>'s solution for a clean implementation of this faster approach.<br><br>

<b>Exercises:</b><br>
5.1: Show how to set up the flow graph by eliminating the need for the blue and green layers.
</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/eleusive_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8369955" context="algorithm"/><br />
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
