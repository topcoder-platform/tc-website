<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
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
<tc-webtag:forumLink forumID="505796" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 282</span><br>Tuesday, January 10, 2006
<br><br>

<h3>
FixTheAverage:
</h3>
<p>
Not surprisingly, this problem did not pose much trouble for Division 2
coders.
To compute the number, they simply had to solve the following equation
for <i>x</i>:
</p>

<blockquote>
(a1 + a2 + ... + an + x) / (n+1) = target
</blockquote>

<p>

The method should multiply <b>target</b> by the size of <b>list</b> plus 1,
and subtract the sum of the elements of <b>list</b> from the result.
</p>




<br><br>
<h3>
TileCutting:
</h3>

<p>
This is the infamous problem of SRM 282.
It was intended to be a straightforward problem,
but very quickly coders began to notice an ambiguity that none of us
caught during testing.
The ambiguity was whether or not it was legal to cover a half-tile region
with two quarter-tile pieces, or to cover an L-shaped region with one
half-tile and one quarter-tile piece, or three quarter-tile pieces.
For example, given the following layout:
</p>

<pre>
    { "x..x",
      "....",
      "....",
      "x..x" }
</pre>

<p>
it was not clear which of the following two solutions was correct:
</p>

<table width=100%>

<tr align=center>
<td width=25%></td>
<td><img src="/i/srm/srm282_1.gif" alt="" border="0"></img></td>
<td><img src="/i/srm/srm282_2.gif" alt="" border="0"></img></td>
<td width=25%></td>
</tr>
<tr align=center>
<td></td>
<td>(a)</td>
<td>(b)</td>
<td></td>
</tr>
</table>

<p>

The intention was for each region to be covered by the largest possible
piece of tile, so (a) above would be the correct solution, requiring 8 cuts.
But the problem statement did not explicitly state this, so several people
assumed that solution (b) above was legal, which requires only 6 cuts.
Incidentally, allowing solution (b) makes the problem more difficult than
we originally intended.
</p>

<p>
Both solutions start out the same way, by analyzing each 2x2 block in
<b>layout</b> and counting the number of quarter-tile (Q), half-tile (H),
and L-shaped (L) pieces needed.
Given these three values, the solution assuming that you may not fill a
larger region with smaller pieces can be computed as follows.
First match up the minimum of L and Q, countng two cuts for each pair, and
then subtract that minimum for each.
Then, count two more cuts for each pair of H pieces, and subtract those
that you've counted from H.
At this point, one (or both) of L and Q will be 0, and H will be either
0 or 1.
If Q is zero, then we add 2*(L+H) and we are done.
Otherwise, we know L is zero, and we match up the remaining H and Q pieces.
The following code performs this computation:
</p>

<pre>
   int calc1(int Q, int H, int L) {

        int ret = 0;

        // match Q and L pieces together:
        while (Q >= 1 && L >= 1) { ret += 2; Q--; L--; }

        // match two H pieces together
        while (H >= 2) { ret += 2; H -= 2; }

        // at this point, H is 0 or 1
        if (Q == 0) {
            ret += (H+L)*2;
        }
        else {
            if (H == 1 && Q >= 2) { ret += 3; H--; Q -= 2; }
            if (H == 1 && Q >= 1) { ret += 3; H--; Q--; }
            if (H == 1) { ret += 2; H--; }
            while (Q >= 4) { ret += 4; Q -= 4; }
            if (Q == 3) ret += 4;
            else if (Q == 2) ret += 3;
            else if (Q == 1) ret += 2;
        }

        return ret;
    }

</pre>

<p>
We can build upon this solution to compute an answer that allows smaller
pieces to be put together to fill larger areas.
Simply iterate over the number of L-shaped pieces the solution will actually
have (from 0 to L, inclusive), replacing L-shaped pieces with one Q and one H.
Inside of that loop, iterate over all the number of half-tile pieces the
solution will actually have (from 0 to H, inclusive), replacing half-tile
pieces with two Qs:
</p>

<pre>
    int calc2(int Q, int H, int L) {

        int ret = 1000000000;

        // loop over all possible values of H:
        for (int H0=0; H0&lt=H; H0++) {
            int c = calc1(Q+(H-H0)*2, H0, L);
            if (c &lt ret) ret = c;
        }

        return ret;   
    }


    int calc3(int Q, int H, int L) {

        int ret = 1000000000;

        // loop over all possible values of L:
        for (int L0=0; L0&lt=L; L0++) {
            int c = calc2(Q+(L-L0), H+(L-L0), L0);
            if (c &lt ret) ret = c;
        }

        return ret;   
    }
</pre>

<p>
</p>



<br><br>
<h3>
Reciprocal:
</h3>

<p>
This problem requires you to perform long division the way you learned
in elementary school, but with an added twist.
Since you must compute digits over 1 billion places from the decimal point,
you cannot simply compute them one at a time.
The trick is to take advantage of the fact that the digits will eventually
fall into a cycle, and to recognize when this happens.
This will allow you to jump quickly to the digits you are interested in.
</p>



<br><br>

<h3>
Fractionalization:
</h3>

<p>
This straightforward problem was essentially an implementation exercise.
The problem statement basically walked you through the algorithm.
</p>

<p>
This problem calls for a recursive solution, where at each step you have a
call and a fraction <i>m/n</i>.
If the current call has <i>p</i> parts, the method finds the largest fraction
<i>i/p</i> less than or equal to <i>m/n</i>, and adds the first <i>i</i>

parts of the call to the list of calls to return.
The test <i>i/p</i> &lt= <i>m/n</i> can be computed with integer arithmetic
as:

<blockquote>
<i>i*n</i> &lt= <i>m*p</i>
</blockquote>

Then, the method invokes itself on part <i>i</i>+1 of the call.
The remaining fraction for the recursive call is computed as:

</p>

<blockquote>
(<i>m/n</i> - <i>i/p</i>) * <i>p</i>.
</blockquote>

<p>
If at any time the method is asked to fractionalize a call that does not
have a definition (i.e. an atomic unit) with a fraction other than 0 or 1,
the method returns the string "ILLEGAL".
</p>

<p>
I would like to thank professional square dance caller Bill Ackerman for
providing the inspiration for this problem.
</p>



<br><br>
<h3>
GreatExpectations:
</h3>

<p>
Conceptually, this problem requires you to solve for two mutually-dependent
sets of data: the expected time for each room, and for each room whether or
not you would go through each of the 4 doors given the opportunity.
The expectations depend on the decisions you would make for each door,
and the decisions you would make for each door depend on the expectations.
To solve this problem, we don't need to actually solve for the door
decisions -- we can compute them implicitly on the fly.
</p>

<p>
Let's say we wish to compute the expected time from a room, given the 
expectations of its four neighbors: A, B, C, and D.
Let's assume that these are sorted in ascending order of expectations.
Let's also assume for now that we know we will leave this room through any of
the four doors, given the opportunity.
During any given second, you would choose among the doors that are open
and go through the one that leads to the room with the smallest expected time.
Thus if door A is open, you would go through it.
If door A is closed and B is open, you would go through door B.
If doors A and B are closed and C is open, you would go through door C.
If doors A, B, and C are closed and D is open, you would go through door D.
If all doors are closed, you would wait for the next second and try again.

</p>
<p>
Given the expectations for the four rooms (eA, eB, eC, and eD) and
the probabilities of each of the doors being open at any given second
(pA, pB, pC, and pD),
the expectation for this room can be computed (with a little algebra) with
the equation:
</p>

<pre>
    E =   eA    * pA
        + eB    * pB * (1-pA)
        + eC    * pC * (1-pB) * (1-pA)
        + eD    * pD * (1-pC) * (1-pB) * (1-pA)
        + (E+1)      * (1-pD) * (1-pC) * (1-pB) * (1-pA)
</pre>

<p>
Now, we don't know that it is correct to assume that we would go through
any door, even if it were open.
Rather than computing this, we can simply loop over all 15 possibilities,
modifying the formula above by replacing pA, pB, pC, and/or pD with zero for
any door we're considering not going through.
From among these 15 possibilities, we select the one that yields the lowest
expectation.
</p>

<p>
To turn this into a complete solution, we initialize the lower-right room
with an expectation of 0 and mark its neighbors as "dirty".
All other rooms are initialized with a large value representing unreachable.
We then repeatedly update the expectation of "dirty" rooms, each time
clearing its dirty flag and setting the dirty flag of its neighbors whenever
its value decreases.
Once there are no more dirty rooms, the expectation of the upper-left room
is the final answer.
</p><div class="authorPhoto">
    <img src="/i/m/legakis_mug.gif" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="287269" context="algorithm"/><br />
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
