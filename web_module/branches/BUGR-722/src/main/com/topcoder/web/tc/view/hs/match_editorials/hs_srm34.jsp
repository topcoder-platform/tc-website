<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10769&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516560" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 34</span><br>Tuesday, July 17, 2007
<br><br>

<h2>Match summary</h2> 

 

<p> 

The second SRM of a new High School season attracted 78 competitiors, 21 of them newcomers.
The first two problems were pretty straightforward and were solved by most contestants. 
The third problem required lots of careful coding, so there were much fewer submissions on it, 
and only 3 of them survived system testing. 
The challenge phase was quite uneventful, bringing down only 4 problems, so it was the 
third problem that defined the match winners. 
<tc-webtag:handle coderId="11972352" context="hs_algorithm"/>
won the match by more then 200 points due to his fastest submission on the third problem.
<tc-webtag:handle coderId="22263204" context="hs_algorithm"/>
took second place thanks to one successful challenge, and 
<tc-webtag:handle coderId="22065595" context="hs_algorithm"/>
finished third.

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7594&amp;rd=10769" name="7594">QuoteContest</a></b> 

</font> 

<A href="Javascript:openProblemRating(7594)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516560" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      63 / 73 (86.30%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      62 / 63 (98.41%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>petar1</b> for 249.31 points (1 mins 29 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      224.11 (for 62 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The problem is clearly a parsing one: after the numbers of votes from each group
and the quote text are extracted from each line of the input, the task comes to 
calculating the total numbers of votes for each quote and returning the quote with 
the most total votes.
See <tc-webtag:handle coderId="22677505" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22677505&rd=10769&pm=7594">solution</a> in C++, 
and <tc-webtag:handle coderId="22627975" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22627975&rd=10769&pm=7594">solution</a>
in Java as samples.

</p>
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7955&amp;rd=10769" name="7955">NumbersGame</a></b> 

</font> 

<A href="Javascript:openProblemRating(7955)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516560" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      450 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      59 / 73 (80.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      52 / 59 (88.14%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>DaViDeX</b> for 447.22 points (2 mins 14 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      401.21 (for 52 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The solution is quite straightforward: you need to perform the given transformation
over each number in the input, and compare the results.
As for the transformation itself, you need to convert the number to an array of 
its digits (stored as distinct numbers or as characters), sort it and convert 
the resulting array back to number (see 
<tc-webtag:handle coderId="22065595" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22065595&rd=10769&pm=7955">solution</a>).

</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7831&amp;rd=10769" name="7831">ExploringHoneycombs</a></b> 

</font> 

<A href="Javascript:openProblemRating(7831)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516560" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Value</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1100 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Submission Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      8 / 73 (10.96%) 

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

      <b>Zuza</b> for 713.11 points (23 mins 50 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      553.09 (for 3 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The idea of the solution is to calculate distances between each pair of honey cells
and shortest distances from each honey cell to one of the boundary cells, and then to find 
the sequence of visiting exactly <b>n</b> of the honey cells that can be done with
the least number of moves. 
<br>
<br>
Distances calculation can be done using breadth-first search. Let's have a closer look 
at the finding the shortest distance between a pair of honey cells (finding the shortest 
distance between a honey cell and a boundary cell can be done in a similar way).
<br>
<br>
First, add the starting honey cell to a queue of cells to be processed with zero distance to
the starting cell. 
When processing the current cell of the queue, check every cell which is adjacent to it, is not 
filled with wax and was not visited before. If it is the target cell, end the search, 
otherwise add it to the end of the queue with distance to the starting cell equal to 
(distance from the current cell + 1). Finally, mark the current cell as visited before
and continue to the next cell of the queue.
Thus, the first time you get to the target cell will give you the shortest distance to
it from the starting cell. 
<br>
<br>
You can read more about BFS in 
<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2">this tutorial</a>.
<br>
<br>
The only trick in applying BFS to this problem was to define which cells are adjacent 
to the current one. For a cell in row i and column j adjacent cells will be: 
(i-1,j), (i+1,j), (i,j-1), (i,j+1) and (i-1.j-1), (i-1,j+1) for even columns 
or (i+1,j-1), (i+1,j+1) for odd columns.
<br>
<br>
As for the search of the best honey cells sequence, the constraints were chosen so that 
an exhaustive search of all possible sequences without any optimizations will run in time. See 
<tc-webtag:handle coderId="22065595" context="hs_algorithm"/>'s
<a href="/tc?module=HSProblemSolution&cr=22065595&rd=10769&pm=7831">solution</a> 
for an implementation of this approach.

</p>

 


 

<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15635590" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
