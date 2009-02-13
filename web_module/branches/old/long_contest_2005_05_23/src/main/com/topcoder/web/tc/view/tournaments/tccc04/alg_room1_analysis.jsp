<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Summary</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="summary"/>
   <jsp:param name="tabLev3" value="room1"/>
</jsp:include>

            <img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
            <div class="leadPhoto">
            <span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=photos">See more photos!</a></p></span>
            <img src="/i/tournament/tccc04/onsite_photos/room1.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">The field of battle<br/><br/></span>
            </div>
            
            <h2>tomek takes Room 1... but barely</h2>

            <a href="/tc?module=MemberProfile&cr=299177"><img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
            <p>by <a href="/tc?module=MemberProfile&cr=299177">vorthys</a>, <br/>
            <em>TopCoder Member</em><br />
            Thursday, April 15, 2004<br/>
            introduction by lbackstrom<br/><br/></p>

<p>
All eyes were on Room 1, as top seeded tomek sought to represent and 
crush the competition.  According to radeye's odds, tomek had about a 57% 
chance of winning this room.  But, confident as ever, tomek said the night 
before that he estimated his probability of advancing at 95%.  As the room 
started, all 8 competitors opened the easy problem.  Ruberik, the only Java 
coder in the round, was first to submit, but he was quickly followed by 5 other 
coders in the next 6 minutes.  bstanescu moved on to the hard problem, a 
strategy that paid off for him in the last TCO.  All other competitors opened 
the 500 first.  At the half way mark, everyone had submitted the easy problem, 
and only Polish competitors had submitted the medium, with tomek leading Eryx 
by 27 points.
<br/><br/>
After a little while, a few competitors gave up on the medium, and moved on to 
a brutal hard problem.  lars was among them, but then had an epiphany and went 
back to submit the medium problem, placing him in third.  About an hour into the 
coding phase, tomek psyched out the other competitors, submitting the hard 
problem, despite the fact that he had hardly tested it.  The final submissions 
of the round came when AdrianKuegel submitted the medium, and then 
resubmitted it.
<br/><br/>
During the challenge phase, everyone searched through the problems, hoping 
to pick up an extra 50 points.  But no one had the guts to challenge, and going 
into the system tests, tomek was in the lead with all three problems, while Eryx 
and lars were in second and third.<br/><br/>Surprising no one, tomek's hard 
problem failed, but his other two held up, and he advanced to the final round.  
Eryx and lars took second and third, and must compete again in the Wildcard 
Room later tonight.  Good luck to all the competitors in the next rooms.
</p>

<h1>CoinWeight</h1>
<p>
At first glance, this looks like a bog-standard knapsack problem,
but the ranges on the weight of each coin mean you have to do a little bit
more.  Knapsack suggests dynamic programming, so if you take that
approach, you'll build a table where <tt>T[w,v]</tt> is true if and only if
it is possible to achieve a value <tt>v</tt> using coins with a combined
weight of <tt>w</tt>.  Then you just count the number of trues in the
row for the given weight.
</p>

<p>
You can fill in the table using four nested loops:
<pre>
  T[0,0] = true
  for each coin type c do
     for each weight d in minWeight(c) .. maxWeight(c) do
        for each weight w in d .. total weight do
           for each value v in value(c) .. max value do
              if T[w-d,v-value(c)] then
                 T[w,v] = true
</pre>
There are <i>many</i> possible variations on these loops.  
For example, you can reorder the loops at will, as long as you keep
the <tt>d</tt> loop inside the <tt>c</tt> loop.  Each ordering of the loops
suggests different possible optimizations, some of which get rid of the
<tt>d</tt> loop entirely.  However,
the constraints were small enough that no optimizations were needed.


<h1>StackMachine</h1>

<p>
At its heart, this is a problem about Sethi-Ullman numbering, which is an 
algorithm commonly used in compilers to determine how many registers you 
need to evaluate an arithmetic expression.  The number of registers used
in a register machine is the same as the number of stack slots used in a stack
machine (ignoring the inconvenient fact that most real machines have only a
small number of registers).
</p>

<p>
To apply Sethi-Ullman numbering, you need to know the shape of the 
expression tree, which you can reconstruct by parsing the input string.
Sethi-Ullman numbering calculates the cost of an expression <tt>e</tt> 
as follows.
<pre>
   function minCost(e) is
      if e is a leaf then return 1
      else 
// e is a binary operator applied to a 
// left argument and a right argument
         lcost = minCost(left argument of e)
         rcost = minCost(right argument of e)
// cost without swap (left then right)
         return min( max(lcost,1+rcost),   
// cost with swap (right then left)
                     max(rcost,1+lcost) )  
</pre>
The minimum and the maximums in the return statement have the effect
of returning the bigger of <tt>lcost</tt> and <tt>rcost</tt>, 
unless they are equal,
in which case you return <tt>1+lcost</tt> (or, equivalently, <tt>1+rcost</tt>).
In essence, you want to do the left side first if <tt>lcost</tt> is
bigger and the right side first (ie, do a swap) if <tt>rcost</tt> is bigger.  If the
costs are the same, then it doesn't matter which one you do first.


<p>
Once you know the minimum cost of the expression, you can go back and
compute the minimum number of swaps needed to achieve that cost.
This can be expressed recursively as
<pre>
   function minSwaps(e,cost) is
// can't achieve the given cost
      if cost == 0 then return &infin;    
// no swaps needed
      if e is a leaf then return 0  
// e is a binary operator applied to a 
// left argument and a right argument
      else 
         a = left argument of e
         b = right argument of e
// without swap (left then right)
         return min( minSwaps(a,cost) + minSwaps(b,cost-1),      
// with swap (right then left)
                     1 + minSwaps(b,cost) + minSwaps(a,cost-1) ) 
</pre>
However, this version of <tt>minSwaps</tt> is inefficient because it
repeatedly calls itself on the same subexpressions with the same costs.
Memoization can easily take care of this inefficiency, as can dynamic
programming (albeit a little less simply).

<h1>TreeDrawing</h1>

<p>
Conceptually, this was probably the easiest problem of the round.
Nothing fancy is needed&#8212;no DP!&#8212;just recursion and careful
attention to detail.  But conceptually easy does not necessarily mean
easy to code in 75 minutes.  There are a lot of details to get right,
and a lot of steps along the way.
</p>

<p>
The crucial intuition is to realize that nothing that happens
outside of a given subtree can affect the layout within
that subtree.  In other words, once a subtree is drawn,
it might be moved around as a unit, but the individual
components inside the subtree will never move around with
respect to each other.
</p>

<p>
Therefore, to draw a tree, we recursively draw its subtrees,
squeeze the subtrees as close together as we can, and center
the label of the root over the children.  At the very end,
we pad all the rows with spaces as necessary to make the
final drawing rectangular.
</p>

<p>
The key step is squeezing two subtrees together.  Because
nothing inside the subtrees can change, we only need
to keep track of the left and right borders of each subtree.
Then we position the subtrees so that the right border of
the left subtree and the left border of the right subtree
are separated by exactly one space in some row (and by one or
more spaces in all the other rows).
</p>

<p>
A potentially tricky case arises when calculating the borders of
a new tree.  The left border of the combined tree is the left border
of the left subtree, and the right border of the combined tree is the
right border of the right subtree.  However, when one of the subtrees
is taller than the other one, we still need to fill in the missing border.
For example, if the right subtree is taller than the left subtree,
then the left border of the combined tree is the left border of the
<i>right</i> subtree in those rows below the bottom of the left subtree.

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
