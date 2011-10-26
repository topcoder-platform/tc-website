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

<div style="float: right;" align="left"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
<span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="506106" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 9</span><br>09.13.2006 - 09.27.2006
<br><br>

<img src="/i/m/MB___big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="15600321" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="title"><A href="/longcontest/'module=ViewProblemStatement&compid=6091&rd=10105">Polyominoes</A></span>
<br><br>
<span class="bodySubtitle">Introduction</span>
<p>
  During this marathon, we were asked to write a program that
  would select polyominoes of a chosen size and try to place them on a board in
  way that maximizes the score. This problem was entirely original -- it turns
  out that there are no much materials, nor are there hints on Internet that
  would help in developing a solution.
</P>
<span class="bodySubtitle">
  Basic Strategy
</span>
<p>
  It quickly becomes apparent that, with this scoring formula,
  it is better to get one big polyomino than it is to take two halves that equal
  the size of a big one, so it pays to get as big a polyomino as possible.
  Here's the simple algorithm:
</P>
<pre>
Get the best polyomino order
If it's less than 3 then end algorithm
Ask for polyomino of chosen size (call getNext)
Try to put it somewhere on board (call placeNext)
</pre>
<span class="bodySubtitle">
  Getting the best size
</span>
<p>
  This part proved to have a very big influence on the final
  score. While you want to choose a big piece, if you get a smaller one there is
  a bigger probability that you will be able to put it on the board. Also, if
  you chose one size for the previous polyomino, there was no point in
  considering a larger polyomino, because the board hasn't changed, you have
  fewer open spaces where you can put big pieces. The polyominoes are generating
  randomly and, even for small sizes, there were too many possible polyominoes
  of one size to test whether they all can fit somewhere on the board or
  not.
</P>
<p>
  The most common, and a quite simple, approach was to start
  with some maximal size, for example 1000 (as it is the maximum possible size
  input for <I>getNext </I>function) and decrease it until the probability to
  fit polyomino of this size is less than some value ' generally, around 85%. To
  estimate this probability you have to generate a fixed number of random pieces
  and test how many among them can fit into a board. Eighty-five percent is
  roughly equivalent to about 6 out of 7 ' so 2 or more pieces out of 7 couldn't
  be fit into the board you should decrease polyomino order. For a more accurate
  measure, increase the numbers to 2 out of 14, or even 4 out of 28.
</P>
<p>
  This, of course, is not relevant to polyominoes with size 3.
  There are just two shapes of them: 
  <IMG ALIGN=BOTTOM NAME=Object1 src="/i/longcontest/match_editorials/intelmtcs9/ajd92kcbbbb_19gkwhmt.png"/>
  -shaped (L-shaped), and 
  <IMG ALIGN=BOTTOM NAME=Object2 src="/i/longcontest/match_editorials/intelmtcs9/ajd92kcbbbb_20fxd9p4.png"/>-shaped
  one, with the first twice as likely as the second. Because you can't decrease
  size to 2, you must use pieces of size 3 up to the moment when you can place
  at least half of them. Because L-shaped have a 66% chance of being generated,
  you must just check if you can place them on the board and continue while you
  can do so.
</P>
<span class="bodySubtitle">
  Placing polyomino
</span>
<p>
  Here is a sample polyomino of size 10:
</P>
<p>
  <IMG ALIGN=BOTTOM NAME=Object3 src="/i/longcontest/match_editorials/intelmtcs9/ajd92kcbbbb_21dqs58r.png"/>
</P>
<p>
  The point at coordinates (0,0) is the point of origin of the
  polyomino. The main idea is to try and check if the polyomino doesn't cover
  any of the occupied cells on the board after moving its point of origin over
  each cell on board, and scoring each possible position to get the best one
  after considering all placements.
</P>
<p>
  Now we must decide what matters the most when placing the
  piece; we would like to fit it in the s unused cells of the board that best
  match this piece, but we don't want to unnecessarily fill up any wide open
  areas where we might be able to place more big polyominoes. One good idea is
  to incorporate the number of occupied cells that would be adjacent to the
  piece into the scoring approach ' so the bigger the score, the better the
  placement. This idea proved a good one, with almost all winning solutions
  based on it.
</P>
<span class="bodySubtitle">
  Know when to quit
</span>
<p>
  Some competitors decided not to end algorithm when L-shaped
  pieces of size 3 can no longer be fit onto the board, but sooner, to prevent
  time from having too big an influence on the score.
</P>
<span class="bodySubtitle">
  Advanced order choosing algorithm
</span>
<p>
  Let's calculate expected score <I>E(n)</I> after asking for
  sequence of polyominoes of order <I>n</I>, until you get a piece that you can
  fit into a board, when there is probability <I>p(n)</I> that it will
  fit:
</P>
<p>
  <IMG ALIGN=ABSMIDDLE NAME=Object4 src="/i/longcontest/match_editorials/intelmtcs9/ajd92kcbbbb_226v37cv.gif" />
</P>
<p>Here is the proof for that equation:</p>
<p>
  <IMG ALIGN=ABSMIDDLE NAME=Object4 src="/i/longcontest/match_editorials/intelmtcs9/image002.gif" />
</P>
<p>
  Based on this, the algorithm can be done:
</P>
<pre>
for n=3...last chose order or fixed if first call, do
    approximate probability p(n)
    calculate expected income E(n)
select n that maximizes E(n)
</pre>
<p>
  This is one idea I've not invented and have no idea of its
  influence on run-time. No one on TopCoder's forums noticed usage of larger
  pieces than of order 100, which could be used as fixed upper bound for
  polyominoes size. Also it was possible to use binary search to find a first
  good order to start from -- from range [3;100], trying to get maximal order
  for which the probability for fitting a piece of this size is quite high (for
  example 50%) and then continuing with a normal algorithm. 
</P>
<span class="bodySubtitle">
  Fitting polyomino - more ideas
</span>
<p>
  Until now, the main idea has been to ask for a polyomino, try
  to place it on the board, and immediately call placeNext if possible. Now we
  can consider delaying calling placeNext. Why' If we have a few pieces in some
  sort of buffer, that are ready to be placed by placeNext function, we can try
  to relocate them. If there is no possibility to put the new piece into the
  board, we can place the piece in an area that is occupied by another piece(s),
  then try to place that pieces in other place, and so on, using back-tracking.
  This consumes a lot of processor time, even for small number of pieces in the
  buffer, because run-time is exponential to the buffer's size. For this reason,
  the size of the buffer should be kept below 5 or 6 pieces. There is an
  additional question: which piece should we get out of the buffer and call
  placeNext for' The simplest way, probably, is to flush one that has the least
  possible placements on the board that don't include other pieces in buffer.
  
</P>
<span class="bodySubtitle">
  Implementation details
</span>
<UL>
    <LI>
    Representation of board and pieces:</li>
        <ul>
            <LI>array of bytes for board and list of (x, y) pairs of each cell occupied in
            polyomino, with 4 pre-calculated rotations,</li>
            <LI>bitmask for board and bitmask for polyominoes, with precalculated 4
            rotations and for each 32 bit shifts.</li>
        </ul>
    <LI>
    Many speed improvements can be done:</li>
        <UL>
            <LI>
            precalculating all 4 rotations (and/or all bit-shifts when using
            bitmasks),</li>
            <LI>
            using old sample pieces instead of generating each time new one,
            when order to test didn't change,</li>
            <LI>
            using threading, with care to not use much
            synchronization, it more often slows things down than makes it
            faster.</li>
        </UL>
</UL>

<span class="bodySubtitle">
  Threading
</span>

<p>
  The process that consumes the most amount of CPU time is
  generating and testing sample polyominoes, fitting them, and fitting pieces
  returned by getNext. In this problem you could ask for up to 10,000
  polyominoes, each one requiring calculations after each getNext call. If you
  use threading you should use synchronization between threads at least
  10'000*number of threads time - it takes a long time to execute just this
  synchronization, so many competitors said that it was too slow. However, there
  is a way to do synchronization that does not use system calls, which is a much
  faster way to do threading. Here is scheme of how I managed threads:
</P>
<TABLE BORDER=1 BORDERCOLOR=#000000 CELLPADDING=5 CELLSPACING=0 WIDTH=640>
  <COL WIDTH=94> <COL WIDTH=90> <COL WIDTH=90> <COL WIDTH=90> <COL WIDTH=90>
  <COL WIDTH=28> <COL WIDTH=87>
  <TR VALIGN=TOP>
    <TD WIDTH=94>
      <P ALIGN=CENTER CLASS=western>
        <B>Thread 1</B>
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <B>Thread 2</B>
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <B>Thread 3</B>
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <B>Thread 4</B>
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <B>Thread 5</B>
      </P>
    </TD>
    <TD WIDTH=28>
      <P ALIGN=CENTER CLASS=western>
        ...
      </P>
    </TD>
    <TD WIDTH=87>
      <P ALIGN=CENTER CLASS=western>
        <B>Thread 7</B>
      </P>
    </TD>
  </TR>
  <TR>
    <TD COLSPAN=7 VALIGN=TOP WIDTH=628>
      <P CLASS=western>
        Until right order is achieved:
      </P>
    </TD>
  </TR>
  <TR VALIGN=TOP>
    <TD WIDTH=94>
      <P ALIGN=CENTER CLASS=western>
        Wait for other threads
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
    <TD WIDTH=28>
      <P ALIGN=CENTER CLASS=western>
        ...
      </P>
    </TD>
    <TD WIDTH=87>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
  </TR>
  <TR>
    <TD COLSPAN=7 VALIGN=TOP WIDTH=628>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
  </TR>
  <TR VALIGN=TOP>
    <TD WIDTH=94>
      <P ALIGN=CENTER CLASS=western>
        getNext
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
    <TD WIDTH=28>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
    <TD WIDTH=87>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
  </TR>
  <TR VALIGN=TOP>
    <TD WIDTH=94>
      <P ALIGN=CENTER CLASS=western>
        Try place piece with rotation 0 deg.
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Try place piece with rotation 90 deg.
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Try place piece with rotation 180 deg.
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Try place piece with rotation 270 deg.
      </P>
    </TD>
    <TD WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
    <TD WIDTH=28>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
    <TD WIDTH=87>
      <P ALIGN=CENTER CLASS=western>
        <BR>
      </P>
    </TD>
  </TR>
  <TR VALIGN=TOP>
    <TD HEIGHT=40 WIDTH=94>
      <P ALIGN=CENTER CLASS=western>
        placeNext
      </P>
    </TD>
    <TD ROWSPAN=2 WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
    <TD ROWSPAN=2 WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
    <TD ROWSPAN=2 WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
    <TD ROWSPAN=2 WIDTH=90>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
    <TD ROWSPAN=2 WIDTH=28>
      <P ALIGN=CENTER CLASS=western>
        ...
      </P>
    </TD>
    <TD ROWSPAN=2 WIDTH=87>
      <P ALIGN=CENTER CLASS=western>
        Generate and test 14 polyominoes
      </P>
    </TD>
  </TR>
  <TR>
    <TD VALIGN=TOP WIDTH=94>
      <P ALIGN=CENTER CLASS=western>
        Wait for other threads
      </P>
    </TD>
  </TR>
</TABLE>
<p>
  I was testing 6*14=84 sample polyominoes, and my times on example tests didn't
  exceeded 2 seconds.
</P>


</p>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170" id="onRight">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>
</body>
</html>