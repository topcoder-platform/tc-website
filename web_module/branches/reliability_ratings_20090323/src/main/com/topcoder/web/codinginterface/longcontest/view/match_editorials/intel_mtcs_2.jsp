<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="right"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505923" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 2</span><br>02.22.2006 - 03.08.2006
<br><br>

<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
Sudoku is a puzzle which has becomes increasingly popular in recent years.
Typically, you are given a puzzle with some numbers filled in, and you need to
fill in the rest of them.  Puzzles vary in difficulty, but even the hardest ones
are quite easy to solve with even simple algorithms.  However, in this problem
the difficulty increases in two ways.  First, you need an algorithm that can
solve much larger sudoku puzzles: as big as 64x64.  Second, you need to do more
than just solve them, you need to also figure out which cells in the puzzle
would give you the most information if only you knew what number went in them.
<br><br>

First, we will talk about the solver.  There are two basic approaches to this:
logic and brute force.  In the logic approach, one applies a number of
increasingly complex rules to try to deduce the contents of a cell.  One starts
with the easiest rule: if there is only one option for a cell, fill it in.
Another simple rule starts by finding if there is only one cell that is a
candidate for some digit, and then fills that in (this is known as a hidden
single).  A simple web search will turn up dozens of other techniques for
solving these puzzles, some of which are quite complicated.  Thus, this first
approach, though automated, is essentially doing the same thing as a human
solver would do, but much faster.
<br><br>

The second approach to solving these puzzles is brute force.  At each step, we
pick an empty cell, and fill it in with a digit that doesn't create any
conflicts.  If we get stuck at any point along the way, then we undo the
previous fill-in and try a different digit.  This technique is known as
backtracking because it tries all possibilities and then backtracks if it gets
to a point where it can go no further.  While this seems like it would be far
too slow, it turns out that with a couple of simple tricks, it can solve most
sudokus very quickly.  One big speedup comes from making intelligent decisions
about picking which cell to fill in at each step.  Rather than filling in an
arbitrary cell, we should pick the cell with the fewest possibilities, as we'll
have the least work to do for this cell.  This heuristic is almost always a good
idea, and can be found in most constraint satisfaction problem solvers.  A
second speedup comes from the data structures that we use to store the problem,
which determines how much work we need to do when we fill in, or unfill a cell.
In a recent paper, <A href="http://en.wikipedia.org/wiki/Donald_Knuth" target="_blank">Donald Knuth</A> presented a nice algorithm to do this known as <A href="http://en.wikipedia.org/wiki/Dancing_Links" target="_blank">Dancing Links, or DLX</A>.
<br><br>

While both of these general approaches on their own can solve most sudokus, the
fastest solvers use some combination of them.  Programming in tons of logic
rules is tedious, and it is impossible to ensure that every deduction which can
be made will by some finite set of rules.  On the other hand, the brute force
algorithm is not particularly fast on larger Sudokus and benefits a great deal
from more intelligent filling in of cells.  Thus, a simple algorithm that
combines the two approaches would be to wrap the brute force algorithm around
the logic algorithm: after each guess is made, try to make as many deductions as
possible before making another guess.
<br><br>

Now that we have a good handle on the solver, we need to figure out which cells
we should query.  This was really the hard part of the problem, since solving
Sudokus is a fairly well-studied problem.  One way to do this is to apply the
logic algorithm above as far as possible, and then ask for more information.
This was the approach taken by roma, which ended up giving him the win.
However, it was a little bit more complicated than just picking a random cell
and asking about it.  Since the goal is to make as few queries as possible, one
needs to ask about the locations which will help the most in solving the
puzzle.
<br><br>

One step in the right direction is to ask about cells which have more
possibilities.  If one cell can take on 20 different values without causing a
conflict, while another can only take on 2, then asking for concrete information
about the one that could take 20 values seems like it must be more useful.  Its
likely that learning some other cell will narrow down the cell with 2
possibilities to 1 possiblity.  But, it will take quite a bit of information
from other cells to narrow down from 20 to 1 possiblity.
<br><br>

Another idea, and the one which made roma win, is to take advantage of the fact
that learning one cell will give you information about other cells that are
nearby, allowing you to fill them in.  Furthermore, information tends to cascade
from one location to other locations of the sudoku.  If I can fill in all of the
upper left quarter of the puzzle, I will probably be able to fill in (or almost
fill in) all the rest without very much additionaly information.    Also,
because one quarter of the puzzle is so much smaller than the whole thing, the
hope is that it will be much easier to fill in one quarter than it will be to
fill in the whole thing.<br><br>

With this intuition, the formula roma used for cell i,j was:<br>
<tt>N<sup>3</sup>*possibilities(i,j)-i*j</tt><br>
The cells with high values for this formula have many possible values.
Furthermore, because the formula favors positions close to (0,0), we get
information about a particular part of the puzzle which allows us to solve that
part, and learn more about the rest than we would if we only scored cells based
on the number of possibilities they had.  The exact details of the formula are a
bit mysterious, but it accords well with intuition and turns out to work well in
practice, especially on large puzzles (though its not clear if maybe other
people's techniques just worked poorly on large puzzles).  <br><br>

Congratulations to roma on an impressive victory.
<br><br>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="../foot.jsp"/>
</body>
</html>