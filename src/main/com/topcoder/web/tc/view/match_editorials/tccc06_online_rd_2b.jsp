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
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 12px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}

</style>
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
    <A href="/stat?c=round_overview&er=5&rd=10112">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506111" message="Discuss this match" />
</div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge <br> Online Round 2B</span><br>October 7, 2006
<br><br>


<h2>Match summary</h2>

This online round turned out to be very mathy, with two problems dealing with arithmetics. This caused
    problems for several high ranked coders. Of 34 "red" coders, 15 were eliminated (5 being current
or former 2600+ rated members), while the two most recent TCCC winners, <tc-webtag:handle coderId="262056" context="algorithm"/> and <tc-webtag:handle coderId="144400" context="algorithm"/>, finished
modestly in places 34 and 30, respectively.
<br />
<br />
Early on, the match looked like a one-man show from <tc-webtag:handle coderId="8355516" context="algorithm"/>, who had the fastest submissions on the
    first two problems as well as a fast submission on the last problem. But a resubmit on the hard
    problem caused him to drop a few places as other coders catched up. <tc-webtag:handle coderId="14970299" context="algorithm"/> overtook first
    place for a short while with a very fast submission on the hard, but resubmits on the first
    two problems spoiled his winning chances. In the end, the round was won by Polish coder
<tc-webtag:handle coderId="8472826" context="algorithm"/>, slightly ahead of <tc-webtag:handle coderId="20801712" context="algorithm"/>
    and <tc-webtag:handle coderId="7394165" context="algorithm"/>.
<br /><br />
 The challenge phase was relatively calm, with few solutions successfully challenged. The system test took a heavier toll, but overall the success rate on the submitted problems was fairly high.
<br /><br />

<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6777&amp;rd=10112" name="6777">BComputation</a></b>
</font>
<A href="Javascript:openProblemRating(6777)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
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
      124 / 136 (91.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      112 / 124 (90.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 227.79 points (9 mins 2 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      158.59 (for 112 correct submissions)
    </td>
  </tr>
</table></blockquote>

Perhaps the hardest part of this problem was understanding it -- or at least that was my impression, as the problem set tester.
Since the equation should hold for all positive <i>n</i>, we have an infinite number of equations to satisfy, each equation
being a sum of terms -- in other words, we have an infinite linear equation. To get an idea how to solve it, we start by expanding
the equation for a couple of different <i>n</i>, starting with <i>n</i> = 1:

<pre>
    0 = B<sub>0</sub> + <sub>2</sub>C<sub>1</sub>B<sub>1</sub>
</pre>


Since we know B<sub>0</sub> (that was given in the input), and <sub>2</sub>C<sub>1</sub> can be calculated
either by the formula given in the notes or using <a href="http://en.wikipedia.org/wiki/Pascals_triangle">Pascals triangle</a>,
we see that <tt>B<sub>1</sub> = -B<sub>0</sub> / <sub>2</sub>C<sub>1</sub></tt>.
<br /><br />    
For <i>n</i> = 2, the equation becomes</p>

<pre>
    0 = B<sub>0</sub> + <sub>3</sub>C<sub>1</sub>B<sub>1</sub> + <sub>3</sub>C<sub>2</sub>B<sub>2</sub>
</pre>

The only unknown variable in this equation is B<sub>2</sub>, so we can easily calculate it.
    Now a pattern starts to appear: for each <i>n</i>, we can calculate one B<sub>N</sub>. So to
    solve the problem, we loop over all <i>n</i> from 1 to <i>pos</i>, solve the equation <i>pos</i> times, and then return
    B<sub>pos</sub>.
<br /><br />
An extra annoyance in this problem is that all calculations must be done using fractions.
    Experienced coders most likely had a prewritten fraction class lying around, ready to be
    used in situations like this. If not, writing one doesn't have to take very much time
    (it's almost always better to put the fraction logic in a separate class instead of cluttering
    the code with fraction calculations).                                
    The input constraints were set so that using integers for the nominator and denominator
    in the fraction class would be enough if the fraction was reduced by the gcd after every operation.
    While this is hard to estimate when coding the problem, the limited input range made it possible
to test all inputs and make sure that there were no overflows.
<br /><br />    
    

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6520&amp;rd=10112" name="6520">FracSum</a></b>
</font>
<A href="Javascript:openProblemRating(6520)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
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
      112 / 136 (82.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      91 / 112 (81.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 495.49 points (2 mins 43 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      371.27 (for 91 correct submissions)
    </td>
  </tr>
</table></blockquote>
By simple arithmetic, the equation <i>a</i>/<i>b</i> = <i>c</i>/<i>d</i> + <i>e</i>/<i>f</i> can be rewritten
    as <i>a</i>/<i>b</i> = (<i>cf</i> + <i>de</i>) / <i>df</i>.
    We should start by dividing <i>a</i> and <i>b</i> with their greatest common divisor, gcd(<i>a</i>,<i>b</i>). Then
    <i>df</i> must equal <i>b</i>. Without loss of generality, we can assume that <i>d</i> &lt;= <i>f</i>,
    and hence that <i>f</i> = <i>b</i>/<i>d</i>. <i>d</i> can then be no greater than the square root of <i>b</i>. The problem constraint guaranteed
    that <i>b</i> was at most 2 billion, so we can try all divisors less than or equal to sqrt(<i>b</i>)
    by simply looping up to sqrt(b), skipping all non-divisors. We then get the equation <i>cf</i> + <i>de</i> = <i>a</i> where
    <i>a</i>, <i>d</i> and <i>f</i> are known integers, and <i>c</i> and <i>e</i> are unknown integers. This is a traditional
    <a href="http://mathworld.wolfram.com/DiophantineEquation.html" target="_blank">linear diophantine equation</a>,
    which is solveable if and only if <i>a</i> is divisible by gcd(<i>d</i>,<i>f</i>). But because of the initial
    division with gcd(<i>a</i>,<i>b</i>), gcd(<i>d</i>,<i>f</i>) must equal 1 (otherwise <i>cf</i> + <i>de</i> and <i>df</i>
    would share a common factor), and <i>a</i> is of course always "divisible" by 1.
    <br />
    <br />
    <tc-webtag:handle coderId="8355516" context="algorithm"/> solved this problem blazingly fast. See his <a href="http://www.topcoder.com/stat?c=problem_solution&rm=249933&rd=10112&pm=6520&cr=8355516">solution</a>
    for a clean implementation of this algorithm.<br>
    <br>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4648&amp;rd=10112" name="4648">SplitSubgraphs</a></b>
</font>
<A href="Javascript:openProblemRating(4648)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
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
      31 / 136 (22.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      20 / 31 (64.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Egor</b> for 884.52 points (10 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      609.17 (for 20 correct submissions)
    </td>
  </tr>
</table></blockquote>
    There are several approaches to this problem, some of them completely wrong. For instance,
    it might be tempting to count the number of ways to partition the graph into one A
    partition (the independent set, where none of the vertices are pairwise adjacent), one B partition (the
    clique partition, where all vertices are pairwise adjacent) and a set of nodes not part of the split graph.
    This does not     work, however, because a split graph generally has several ways of being split up into an
    A and a B partition.
<br /><br />
    One method that obviously is too slow is to test all subgraph (about one million in worst case),
    and for each subgraph test if it's split. This can't be done very fast, though, because a subproblem
    to this is to find the maximal clique in the subgraph, a problem that in itself is NP-complete.
    The trick is to do both of these operations simultaneously.
<br />
<br />
    One important property of a split graph is that all subgraphs of it must also be a split graph
    (unless the subgraph contains less than two nodes). Conversely, a split graph S' can be generated
    from a smaller graph S by adding a new vertex (including its edges) to it. This new vertex must
    then either have no edge to any of the vertices in an A partition of S, or to all vertices
    in a B partition of S.
<br /><br />
    But given that we have a split graph, which vertices in it belong to respective partition?
    As mentioned earlier, a split graph generally can be split into several different A and
    B partitions. It turns out that if we know one way to split the vertices into an A and a B partition,
    we can generate the other possible splits fairly easy. Given one possible split A and B, in all other
    splits A' and B', A' can contain at most one node from B, and B' can contain at most one node from A.
    This can easily be proved, because if two nodes went from A to B', that means they were not adjacent
    before, and they must be adjacent for them to be in B'. Similarly if two nodes went from B to A',
    they must have been adjacent before, but that's not allowed in A'. We end up with the following pseudo code
    to check if a vertex can be added to a split graph S:

<pre>
Input:   S(A,B)      a split graph, where A is the set of nodes in S that
                       are non-adjacent, and B the set of nodes that are adjacent.
         <i>v</i>           vertex that should be added to S

Output:  S'(A',B')   a new split graph with vertex <i>v</i> added to it
                       <i>or</i> null if <i>v</i> can't be added
                       
Algorithm:           for each vertex <i>a</i> in A   // move one vertex from A to B'
                        if <i>a</i> is adjacent to all vertices in B
                           A' = A - {<i>a</i>}
                           B' = B + {<i>a</i>}
                           if <i>v</i> has no edge to any vertex in A'
                              return S'(A' + {<i>v</i>}, B')
                           if <i>v</i> has an edge to all vertices in B'
                              return S'(A', B' + {<i>v</i>})
                      
                     for each vertex <i>b</i> in B   // move one vertex from B to A'
                        if <i>b</i> has no edge to any vertex in A
                           A' = A + {<i>b</i>}
                           B' = B - {<i>b</i>}
                           if <i>v</i> has no edge to any vertex in A'
                              return S'(A' + {<i>v</i>}, B')
                           if <i>v</i> has an edge to all vertices in B'
                              return S'(A', B' + {<i>v</i>})
                       
                      for each vertex <i>a</i> in A   // move one vertex from A to B'
                         for each vertex <i>b</i> in B   // and one from B' to A
                            if <i>b</i> has no edge to any vertex in A - {a}
                               if <i>a</i> has an edge to all vertices in B - {b}
                                  A' = A + {<i>b</i>} - {<i>a</i>}
                                  B' = B - {<i>b</i>} + {<i>a</i>}
                                  if <i>v</i> has no edge to any vertex in A'
                                     return S'(A' + {<i>v</i>}, B')
                                  if <i>v</i> has an edge to all vertices in B'
                                     return S'(A', B' + {<i>v</i>})
                      
                      return null
</pre>

Now, counting the number of split graphs among the subgraphs of the input graph is an easy task.
    Recursively we can for each vertex decide whether or not we want it in the subgraph. If we
    want a vertex in the subgraph, we use the algorithm above to determine in which partition it will
    go (and if it is possible at all to include it).
<br /><br />
Regarding implementation details, it's convenient to use a bitmask to store the adjacency matrix
    of the input graph. In that way, operation like <tt>if <i>b</i> has no edge to any vertex in A - {a}</tt>
    can be done with logical bitwise operations. Furthermore, the first two parts of the pseudo code above
    can be incorporated in the last nested loops by simply considering "empty" vertices <i>a</i> and <i>b</i>.
<br /><br />
I didn't find an implementation among the contestants that exactly matched this solution description,
    so for a clean implementation of this algorithm, see my solution in the practice room. But as I said,
    there are many ways to solve this problem, so it might be useful to check out some of the contestants
solutions as well.


<div class="authorPhoto">
    <img src="/i/m/Yarin_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="269554" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
