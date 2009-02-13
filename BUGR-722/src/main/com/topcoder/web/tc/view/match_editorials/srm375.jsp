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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10794">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516072" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 375</span><br />Saturday, November 10, 2007
<br /><br />



<h2>Match summary</h2> 

<p>
SRM 375 Division 1 victory was deserved by
<tc-webtag:handle coderId="10574855" context="algorithm"/> who showed the
fastest time on both 250-pointer and 1000-pointer. The fastest
500-pointer was written by
<tc-webtag:handle coderId="9906197" context="algorithm"/> who came in second.
Two Ukrainians, <tc-webtag:handle coderId="8433628" context="algorithm"/> and
<tc-webtag:handle coderId="13351270" context="algorithm"/> were 3rd and 4th
respectively, and those are the only four coders who solved all three problems
correctly.</p>

<p><tc-webtag:handle coderId="22682496" context="algorithm"/> won the Division
2, thanks to his fast code in hard problem, leaving
a noticeable gap between him and second-placed
<tc-webtag:handle coderId="22662266" context="algorithm"/>. A newcomer
<tc-webtag:handle coderId="22703862" context="algorithm"/> came in third,
proceeding to Division 1 and becoming also the third
among all coders from Latvia.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8269&amp;rd=10794" name="8269">MixtureDensity</a></b>
</font>
<A href="Javascript:openProblemRating(8269)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516072" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      473 / 517 (91.49%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      414 / 473 (87.53%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>alabastern</b> for 248.98 points (1 mins 49 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      195.54 (for 414 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Div 2 coders were asked to calculate the density of some mixture, given
masses and volumes of all its ingredients. No trick here, all they had to
do was to find the mass of the mixture (as the sum of ingredient masses)
and the volume (as the sum of ingredient volumes). The answer then is
mass divided by volume.</p>

<p>It was also necessary to parse the given strings accurately.
<tc-webtag:handle coderId="22660101" context="algorithm"/>
managed to do it fast and
<a href="/stat?c=problem_solution&rm=267158&rd=10794&pm=8269&cr=22660101">neatly</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8268&amp;rd=10794" name="8268">DukeOnChessBoard</a></b>
</font>
<A href="Javascript:openProblemRating(8268)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516072" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      197 / 517 (38.10%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178 / 197 (90.36%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Alex_KPR</b> for 486.26 points (10 mins 34 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      297.62 (for 178 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
As the size of the board was no more than 8 (compare it to 1,000,000 in
DukeOnLargeChessBoard problem given to Div 1 competitors), a greedy simulation
was the best choice.</p>

<p>Consider a duke standing is some cell. He has a few options:
<ul><li>Finish his path here.</li>
<li>Move to a neighbor cell.</li>
</ul></p>

<p>In order to make the path lexicographically greater, it is always favorable
to make a move rather than to finish the path. So if there is a neighbor cell
that hasn't been visited yet, a move is to be done.</p>

<p>What if there are several unvisited neighbors? In this case (to make the
path lexicographically greater) the move right is the most preferred one, the
second preferred is the move upwards, then downwards and the least preferred
one is the move to the left.</p>

<p>Continue making such moves greedily until there are no unvisited neighboring
cells left. This will be your lexicographically greatest path.</p>

<p><tc-webtag:handle coderId="22698588" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=267145&rd=10794&pm=8268&cr=22698588">code</a>
illustrates what was asked for in this problem.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8318&amp;rd=10794" name="8318">DivisibleByDigits</a></b>
</font>
<A href="Javascript:openProblemRating(8318)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516072" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      142 / 517 (27.47%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      83 / 142 (58.45%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>vot</b> for 868.53 points (8 mins 52 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      586.40 (for 83 correct submissions) 
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
      387 / 421 (91.92%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      323 / 387 (83.46%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 247.33 points (2 mins 57 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      197.40 (for 323 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Let's call a number good if it starts with <b>n</b> and is divisible by
every non-zero digit of <b>n</b>. (The task was to find the smallest good
integer).</p>

<p>Consider a number that starts with <b>n</b> and is divisible by
<i>lcm</i>(1, 2, ..., 9)=2520. This number is divisible by all non-zero digits
1 through 9, obviously including the non-zero digits of <b>n</b>. Therefore,
this number is good.</p>

<p>Now note that there is such number somewhere between <b>n</b>0000 and
<b>n</b>2519, inclusive. Therefore, the smallest good number is either that one
or even smaller.</p>

<p>Thus, in order to find the smallest good number, one has to check the
following candidates: <b>n</b>, <b>n</b>0..<b>n</b>9, <b>n</b>00..<b>n</b>99,
<b>n</b>000..<b>n</b>999 and <b>n</b>0000..<b>n</b>2519. The first number
among them that is divisible by every non-zero digit of <b>n</b> is the answer.
</p>

<p>A
<a href="/stat?c=problem_solution&rm=267129&rd=10794&pm=8318&cr=20286298">solution</a>
by <tc-webtag:handle coderId="20286298" context="algorithm"/>
was the very first submit in this match. It shows an implementation of the
algorithm described above.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8267&amp;rd=10794" name="8267">DateFieldCorrection</a></b>
</font>
<A href="Javascript:openProblemRating(8267)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516072" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      302 / 421 (71.73%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      171 / 302 (56.62%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>krijgertje</b> for 445.55 points (10 mins 11 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      265.89 (for 171 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Since there are only 366 days in the leap year, it was OK to check all the
dates and to calculate the distance from <b>input</b> for each one.</p>

<p>In order to calculate those distances, it was quite handy to have
a table of penalties, which shows the penalty of mistyping <i>i</i> for
<i>j</i> for any two valid characters <i>i</i> and <i>j</i>.</p>

<p>Now, this table is nothing else than a table of shortest distances in
the given keyboard graph from each vertex to each vertex. This problem is called
<a href="http://en.wikipedia.org/wiki/Shortest_path_problem">the all-pairs
shortest path problem</a>, and the easiest algorithm to calculate this table is
the Floyd-Warshall algorithm described in
<a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3">
a tutorial on graphs</a> in TopCoder Educational Content section.</p>

<p>But before running any algorithms from graph theory, it was necessary to
code the graph itself. There were lots of ways to do it, one more tangled than
another. A very beautiful one was invented by
<tc-webtag:handle coderId="10323773" context="algorithm"/>
after the SRM (unfortunately for him). His idea is to consider the following
table:
<pre>
......................
.qqwweerrttyyuuiioopp.
..aassddffgghhjjkkll..
...zzxxccvvbbnnmm.....
......          ......
......................
</pre>
Two keys are neighbors on the keyboard if and only if there is a pair of
adjacent cells in this table containing these two keys. This property makes
the implementation of the keyboard graph an easy exercise.</p>

<p>Another approach was to use the natural coordinate system of the keyboard.
The distance between two keys can be calculated using their coordinates on
the keyboard. However, this calculation process is rather tricky, for example,
<tc-webtag:handle coderId="10574855" context="algorithm"/> had to resubmit
his <a href="/stat?c=problem_solution&rm=267128&rd=10794&pm=8267&cr=10574855">solution</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8317&amp;rd=10794" name="8317">DukeOnLargeChessBoard</a></b>
</font>
<A href="Javascript:openProblemRating(8317)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516072" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      18 / 421 (4.28%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 18 (44.44%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 757.48 points (17 mins 16 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      467.27 (for 8 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Unlike the DukeOnChessBoard problem given to Division 2 coders, the
constraints in this problem didn't allow to use a greedy simulation to find the
lexicographically greatest path of a duke.</p>

<p>The supposed approach was the following: consider a much smaller board,
say 10&times;10 instead of 1,000,000&times;1,000,000; find the
lexicographically greatest path starting from each cell on the small board;
note all the patterns and regularities; and extends these patterns to the
original board.</p>

<p>An ethical question arises: why is this extension from the small board to
the large board correct? Well, the answer is that for each pattern observed on
the small board, a corresponding pattern on the large board also takes place,
an in each case a 5-minute thinking will give you a proof of this fact.</p>

<p>However, the SRM competitors didn't have the time to think over each single
pattern, and all they could do was to believe that the natural extension works
fine.</p>

<p>A good approach was to check that the answers given by your code coincide
with the answers found by greedy simulation on all boards of even sizes, say
4&times;4 through 50&times;50.</p>

<p>Now, let's finally observe the discussed patterns on a 10&times;10 board.
The standard chess notation is used on the picture to make things a bit
simpler.</p>

<pre><table cellspacing=2 cellpadding=5 border=0 align=center>
<tr><td align=center>10&nbsp;</td>
<td align=center bgcolor=silver> a9</td>
<td align=center bgcolor=teal>a10</td>
<td align=center bgcolor=silver> a7</td>
<td align=center bgcolor=teal>a10</td>
<td align=center bgcolor=silver> a5</td>
<td align=center bgcolor=teal>a10</td>
<td align=center bgcolor=silver> a3</td>
<td align=center bgcolor=teal>a10</td>
<td align=center bgcolor=silver> a1</td>
<td align=center bgcolor=teal>a10</td>
</tr><tr><td align=center>9&nbsp;</td>
<td align=center bgcolor=olive>a10</td>
<td align=center bgcolor=green> a7</td>
<td align=center bgcolor=olive>a10</td>
<td align=center bgcolor=green> a5</td>
<td align=center bgcolor=olive>a10</td>
<td align=center bgcolor=green> a3</td>
<td align=center bgcolor=olive>a10</td>
<td align=center bgcolor=green> a1</td>
<td align=center bgcolor=olive>a10</td>
<td align=center bgcolor=blue> a1</td>
</tr><tr><td align=center>8&nbsp;</td>
<td align=center bgcolor=white> a9</td>
<td align=center bgcolor=green> a6</td>
<td align=center bgcolor=white> a7</td>
<td align=center bgcolor=green> a4</td>
<td align=center bgcolor=white> a5</td>
<td align=center bgcolor=green> a2</td>
<td align=center bgcolor=white> a3</td>
<td align=center bgcolor=magenta> b1</td>
<td align=center bgcolor=red> a1</td>
<td align=center bgcolor=magenta> d1</td>
</tr><tr><td align=center>7&nbsp;</td>
<td align=center bgcolor=white> a8</td>
<td align=center bgcolor=green> a5</td>
<td align=center bgcolor=white> a6</td>
<td align=center bgcolor=green> a3</td>
<td align=center bgcolor=white> a4</td>
<td align=center bgcolor=green> a1</td>
<td align=center bgcolor=white> a2</td>
<td align=center bgcolor=blue> a1</td>
<td align=center bgcolor=cyan> b1</td>
<td align=center bgcolor=blue> a1</td>
</tr><tr><td align=center>6&nbsp;</td>
<td align=center bgcolor=white> a7</td>
<td align=center bgcolor=green> a4</td>
<td align=center bgcolor=white> a5</td>
<td align=center bgcolor=green> a2</td>
<td align=center bgcolor=white> a3</td>
<td align=center bgcolor=magenta> b1</td>
<td align=center bgcolor=red> a1</td>
<td align=center bgcolor=magenta> d1</td>
<td align=center bgcolor=red> a1</td>
<td align=center bgcolor=magenta> f1</td>
</tr><tr><td align=center>5&nbsp;</td>
<td align=center bgcolor=white> a6</td>
<td align=center bgcolor=green> a3</td>
<td align=center bgcolor=white> a4</td>
<td align=center bgcolor=green> a1</td>
<td align=center bgcolor=white> a2</td>
<td align=center bgcolor=blue> a1</td>
<td align=center bgcolor=cyan> b1</td>
<td align=center bgcolor=blue> a1</td>
<td align=center bgcolor=cyan> d1</td>
<td align=center bgcolor=blue> a1</td>
</tr><tr><td align=center>4&nbsp;</td>
<td align=center bgcolor=white> a5</td>
<td align=center bgcolor=green> a2</td>
<td align=center bgcolor=white> a3</td>
<td align=center bgcolor=magenta> b1</td>
<td align=center bgcolor=red> a1</td>
<td align=center bgcolor=magenta> d1</td>
<td align=center bgcolor=red> a1</td>
<td align=center bgcolor=magenta> f1</td>
<td align=center bgcolor=red> a1</td>
<td align=center bgcolor=magenta> h1</td>
</tr><tr><td align=center>3&nbsp;</td>
<td align=center bgcolor=white> a4</td>
<td align=center bgcolor=green> a1</td>
<td align=center bgcolor=white> a2</td>
<td align=center bgcolor=blue> a1</td>
<td align=center bgcolor=cyan> b1</td>
<td align=center bgcolor=blue> a1</td>
<td align=center bgcolor=cyan> d1</td>
<td align=center bgcolor=blue> a1</td>
<td align=center bgcolor=cyan> f1</td>
<td align=center bgcolor=blue> a1</td>
</tr><tr><td align=center>2&nbsp;</td>
<td align=center bgcolor=white> a3</td>
<td align=center bgcolor=yellow> j1</td>
<td align=center bgcolor=yellow> j1</td>
<td align=center bgcolor=yellow> j1</td>
<td align=center bgcolor=yellow> j1</td>
<td align=center bgcolor=yellow> j1</td>
<td align=center bgcolor=yellow> j1</td>
<td align=center bgcolor=yellow> j1</td>
<td align=center bgcolor=yellow> j1</td>
<td align=center bgcolor=yellow> j1</td>
</tr><tr><td align=center>1&nbsp;</td>
<td align=center bgcolor=white> a2</td>
<td align=center bgcolor=brown> a1</td>
<td align=center bgcolor=cyan> b1</td>
<td align=center bgcolor=brown> a1</td>
<td align=center bgcolor=cyan> d1</td>
<td align=center bgcolor=brown> a1</td>
<td align=center bgcolor=cyan> f1</td>
<td align=center bgcolor=brown> a1</td>
<td align=center bgcolor=cyan> h1</td>
<td align=center bgcolor=brown> a1</td>
</tr><tr><td></td><td align=center>a</td>
<td align=center>b</td>
<td align=center>c</td>
<td align=center>d</td>
<td align=center>e</td>
<td align=center>f</td>
<td align=center>g</td>
<td align=center>h</td>
<td align=center>i</td>
<td align=center>j</td>
</tr></table></pre>

<p>However, many of coders who solved this problem used another approach.
They did implement the greedy walking of the duke (see DukeOnChessBoard above).
However, unlike the Division 2 competitors they were unable to do it cell by
cell: that would take 10<sup>12</sup> iterations.</p>

<p>The smart Div 1 guys noticed that when we leave certain column, the visited
cells of this column form a continuous interval. Thus, all we need to store in
memory are the 1,000,000 intervals that are visited in each column.</p>

<p>Another lucky observation says that we will move from one column to another
no more than approximately 2,000,000 times. Therefore, if each movement from
one column to its neighbor is implemented to work fast, the overall
simulation process will take reasonable time.</p>

<p><tc-webtag:handle coderId="10574855" context="algorithm"/> showed a terrific
performance, <a href="/stat?c=problem_solution&rm=267128&rd=10794&pm=8317&cr=10574855">solving</a>
this hard problem extraordinarily fast, which gave him time to find and to fix
a bug in his 500-pointer.
</p>




<br /><br />


<div class="authorPhoto">
    <img src="/i/m/darnley_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21971539" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
