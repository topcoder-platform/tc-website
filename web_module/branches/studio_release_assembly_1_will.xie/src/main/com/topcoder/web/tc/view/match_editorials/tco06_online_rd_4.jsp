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
<tc-webtag:forumLink forumID="505938" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Open <br> Online Round 4 </span><br>March 22, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
Round 4 always features some of the hardest problems TopCoder has to
offer, and tonight was no exception.  While the easy stumped no one
(literally), only 37 coders solved the medium, and only 4 solved the
hard.  Chief amongst them was andrewzta with a 30 point lead over
Ruberik, who opted to do the hard first, though it ended up not
mattering for him.  Eryx and krijgertie got 3rd and 4th with failed
medium submissions.
</p> 

<H1> 
The Problems 
</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6136&amp;rd=9925" name="6136">DrawTree</a></b> 
</font> 
<A href="Javascript:openProblemRating(6136)"><img src="/i/rate_it.gif"hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505938" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      96 / 96 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      95 / 96 (98.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 245.02 points (4 mins 4 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      210.47 (for 95 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The easy problem had nothing tricky in it, but it did require a
reasonable amount of code.  There are a lot of different ways to do
this problem, but most of them involve a recursive function that adds
strings to a global variable.  The calls to the recursive function
should tell how much to indent.  Adding the pipes is a little bit
tricky, but we can just add a loop to find the last child, and add
pipes after every child but the last one.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6142&amp;rd=9925" name="6142">MonotoneSEMin</a></b> 
</font> 
<A href="Javascript:openProblemRating(6142)"><img src="/i/rate_it.gif"hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505938" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      56 / 96 (58.33%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      38 / 56 (67.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>halyavin</b> for 426.43 points (12 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      268.24 (for 38 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The medium problem turned out to be rather difficult.  The first step
to solving it correctly is to realize the shape of the function.
Since it is only evaluated at discrete steps, those are the only
points where its value matters, and so the function ends up being
piecewise flat.  That is, it looks like a staircase (albeit an uneven
one).  Once we have this figured out, we can work on optimizing the
squared error.  Lets think about the simple case where we have the
string "10".  In this case, we'd really like to make the function go
from 1 to 0, but that wouldn't be monotically increasing.  So, we have
to make the function lower for the first bit, or higher for the
second bit, or both.  It turns out that the lowest squared error
occurs when we make the function 0.5 for both of them.  In fact, we
can derive a more general formula: if an interval has A ones and B
zeros, and we have to assign everything in the interval the same
value, then the best value is A/(A+B).<br><br>

This fact is far from obvious, though it does seem reasonable
intuitively.  To prove it is true, one can use calculus.  First, call
the value assigned to the flat function x.  Then determine the squared
error in terms of x, A, and B.  Set the derivative to 0, and solve for
x in terms of A and B.<br><br>

Now, we are almost there, we know how to pick our function for an
interval if it has to be flat, and we know that the overall function
is piecewise flat.  So, the final step is to partition the whole
sequence of bits into the proper flat segments.  We'd like these
segments to be as small as possible, subject to the constraint that
they have to give a monotone function, since small intervals will be
better suited to the bits in them.  One way to do this is to start
with a segment for every bit.  This will give a function with low
squared error, but it will obviously not be monotone.  Next, pick two
adjacent segments which violate the monoticity requirement and merge
them. At first glance, it may seem like the way we pick which two to
merge (out of many possibilities) will matter, but it turns out that
it doesn't.  Eventually, we have a monotone function, and we return
its squared error.<br><br>

So, if each interval [i..j] indicates that the function should return
A/(A+B) for that interval, then the code ends up looking vaguely like
this:
<pre>
bits[1..N]
for(i = 1..N)
    create interval [i..i] 
while(not monotone)
    find intervals [i..j], [j+1..k] that violate monotonicity
    merged [i..j], [j+1..k] into [i..k]
return squared error of function
</pre>

While the greedy solution above works (in O(N) when done properly),
most coders opted to use some form of dynamic programming instead.
They computed the best squared error for the first j bits, as well as
the value of the function at the j<sup>th</sup> bit.  Then, using
dynamic programming, then tried adding each sized interval after the
first j bits, with the same value all along it, as described.  See
SnapDragon's solution for an example of this algorithm.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6110&amp;rd=9925" name="6110">TreeReconstruct</a></b> 
</font> 
<A href="Javascript:openProblemRating(6110)"><img src="/i/rate_it.gif"hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505938" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      11 / 96 (11.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 11 (36.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Eryx</b> for 733.78 points (18 mins 35 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      585.95 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Lets start by thinking of the simple cases of 2 or 3 nodes.
Obviously, if the subset contains 2 nodes the original tree may have
only had 2 nodes also, with the same distance between them.  However,
this is not the case when there are 3 nodes.  Lets call the three
nodes A, B and C, and call AB, AC, and BC the distances between them.
Now, imagine that there was some other node D in the original tree,
and that A, B, and C were all connected to it.  In this case, it is
not hard to see that <tt>AB + AC = BC + 2*AD</tt>.  Thus, working
backwards, we can figure out AD.  If AD is 0, then there wasn't an
extra node in the original graph -- A was simply between B and C.
Otherwise, AD lets us figure out BD and CD, and thus we can insert D.
In some cases, it will turn out that BD or CD is 0, in which case we
clearly don't insert a new node, since D is equal to B or C.  Those
are all the possible cases.  The impossible cases come from AD being
negative, or implying that BD or CD are negative.  Also, since the
original weights have to be integral, if any of the weigts are
fractional, the case is invalid.<br><br>

Once we can do 3 nodes properly, adding more isn't that much harder
conceptually.  We can build up the graph by adding nodes to it one
node at a time.  Each time we add one of the nodes from the input, we
may also need to add an extra node, which is not in the input (or
which has not been added from the input yet).  However, though this
sounds like a reasonable approach, it ends up getting a bit messy.
There are a number of cases to deal with, and it is a bit harder to
figure out where exactly to insert when there are already a bunch of
nodes in the graph.  Instead, we can use a slightly different
approach, courtesy of radeye.<br><br>

For every triple, A, B and C of nodes in the input, there must be some
node D (possibly the same as A, B or C) that is on the path between
each pair.  That is, getting from any one to any other goes through D.
Now, we can figure out the distances AD, BD, and CD, as described
above -- this part is no more complicated when there are extra nodes.
Next, consider a fifth node E.  We are interested in how far E is from
D: DE.  We know that DE &ge; AE-AD, since AD+DE&ge;AE.  We have
similar inequalities for B and C.  Finally, since D lies on the paths
between pairs of A, B, and C, at least one of these inequalities must
have equality, otherwise E would be between A and D, between B and D,
and between C and D, which is impossible.  The only way to have
equality and still satisfy the inequalities is to set DE to the max of
(AE-AD,BE-BD,CE-CD).  Thus, for every triple A, B, and C, we can find
D and then find DE for every node E in the input.  This gives us a
distance vector which is unique to D.  If multiple triples generate
the same distance vector, they are generating the same node D.  Thus,
by placing all the generated distance vectors, along with the input
distance vectors in a set, the return ends up being the size of the
set.  Here is radeye's implementation:

<pre>
public class TreeReconstruct {
  public int reconstruct(String[] g1, String[] g2) {
    HashSet r = new HashSet() ;
    int n = g1.length ;
    int[][] d = new int[n][n] ;
    StringBuffer sb = new StringBuffer() ;
    for (int i=0; i&lt;n; i++) {
      sb.setLength(0) ;
      for (int j=0; j&lt;n; j++) {
        d[i][j] = Integer.parseInt("" + g1[i].charAt(j) + g2[i].charAt(j), 16) ;
        sb.append(d[i][j]).append(",") ;
      }
      r.add(sb.toString()) ;
    }
    for (int a=0; a&lt;n; a++)
      for (int b=a+1; b&lt;n; b++)
        for (int c=b+1; c&lt;n; c++) {
          int da = d[a][b] + d[a][c] - d[b][c] ;
          int db = d[a][b] + d[b][c] - d[a][c] ;
          int dc = d[a][c] + d[b][c] - d[a][b] ;
          if (((da | db | dc) &amp; 0x1000001) != 0)
            return -1 ;
          sb.setLength(0) ;
          for (int e=0; e&lt;n; e++) {
            int de = Math.max(Math.max(d[a][e]-da/2, d[b][e]-db/2),
                d[c][e]-dc/2) ;
            int cs = 0 ;
            if (da/2 + de == d[a][e])
              cs++ ;
            if (db/2 + de == d[b][e])
              cs++ ;
            if (dc/2 + de == d[c][e])
              cs++ ;
            if (de &lt; 0 || cs &lt; 2)
              return -1 ;
            sb.append(de).append(",") ;
          }
          r.add(sb.toString()) ;
        }
    return r.size() ;
  }
}
</pre>
</p>


<div class="authorPhoto">
    <img src="/i/m/lbackstrom_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
