<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statisics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505774" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 266</span><br>Saturday, October 1, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p>
SRM 266 posed a new challenge to the daring competitors. What appeared to be an easy in Division 1, turned 
out to actually give more trouble than the medium. The same happened in Division 2, where only 7 people 
solved the medium, but 60 got the hard! As this match tested one’s ability to adapt to a change of pace, 
some experienced coders tried new strategies: after solving the medium, they opened the hard.  
<br></br>
In Division 1, <b>Egor</b> took home his first SRM win, followed by <b>bmerry</b> and <b>Yarin</b>. 
<b>Petr</b> came in the 4-th, after losing his points on the easy problem. But ExploringEuropa was an easy 
mission for <b>Sputnik</b>, a former blue, who managed to get the 9-th place.

<br></br>
In Division 2, the best performers were <b>shd</b>, <b>.Invader</b> and <b>wildclaw</b>.
</p>

<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4821&amp;rd=7999" name="4821">SwimmersDelight</a></b>

</font>
<A href="Javascript:openProblemRating(4821)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>
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
      300 / 396 (75.76%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      91 / 300 (30.33%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>GMania</b> for 226.99 points (9 mins 14 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      162.34 (for 91 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Actually, you don’t need to carry a laptop to cross this river. As there are only 2 stones, the cases to consider are relatively few. 
Let’s denote the starting shore by X, the stones by A and B and the destination shore by Y. We have the following alternatives:
<pre>
X -> A -> B -> Y 
X -> B -> A -> Y 
X -> A -> Y 
X -> B -> Y 
</pre>

The code below explores each of them:<pre>

public int longestJump (int x[], int y[])
{
  double best = 10;
  for (int i = 0; i <= 1; i++) 
    for (int j = 0; j <= 1; j++) 
    { 
        double dist = x[i];  <font color="blue">// first jump </font>
        dist = max(dist, Math.hypot(x[i] - x[j], y[i] - y[j])); <font color="blue">// second jump</font>

        dist = max(dist, 10 - x[j]);  <font color="blue">// third jump</font>
	best = min(dist, best);
    }
  return best;
}

Note that X -> B -> B -> Y is the same as X -> B -> Y. 
</pre>

This can be easily adapted to 3 or 4 stones, but for a more general case you should use a variation of 
<a name="n1" href="http://www.comp.nus.edu.sg/~stevenha/programming/prog_graph6.html"> Floyd Warshall </a> algorithm. 
The distance you were asked to compute in this problem is also known as the frog distance, or <i> minimax </i> distance.  

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4809&amp;rd=7999" name="4809">ExploringEuropa</a></b>
</font>
<A href="Javascript:openProblemRating(4809)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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

      29 / 396 (7.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      7 / 29 (24.14%)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gy</b> for 327.65 points (27 mins 44 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      275.60 (for 7 correct submissions)
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
      142 / 302 (47.02%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      81 / 142 (57.04%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bmerry</b> for 252.67 points (12 mins 48 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      153.28 (for 81 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Ah, NASA problems … This one required a bit of logical thinking, and the solution was not obvious. 
The first thing we need to do is to start from the goal. <br></br>

<b><h3>The simple case </h3></b>
For now we  just consider the first vent. The probe is continuously moving, so the only option we have is to make it
come back as soon as we know there is a vent there.
<div align="center">
<img src="/i/srm/srm266_1.gif" alt="" border="0" />
</div>
<br><br>
As you can see in this image, the probe is 2 * <b>delay</b> away from the vent when it finally turns back. 
Thus, it takes another 2 * <b>delay</b> units of time for it to reach the vent. There is also a lag of <b>delay</b> units of time at the 
beginning, so the total time is  T = 5 * <b>delay</b> + the position of this first vent. 


<b><h3>A few deductions </h3></b>
<ul>
<li>The time we found earlier is ensured by the existence of a vent. Thus, we are only looking for better alternatives. </li>
<li>No matter the vent distribution, the probe always goes 2 * <b>delay</b> beyond the first vent detected.   </li>
<li>Ideally, you wish your probe to stop right at the next vent on its way back.  </li>
</ul>

<b><h3>Getting the idea</h3></b>
In the following example, we consider surface = " S - - - V - V - - V - - - - " and <b>delay</b> = 4. The table below illustrates the real-time 
behavior of the probe. When a command takes effect on the probe, it is highlighted with yellow.


<pre>
<table border=0>
<tr> <td> Probe location </td><td> S </td><td> S </td><td> S </td><td> S </td><td style="background: yellow;"> S </td><td> - </td><td> - </td><td> - </td><td> V </td>

<td> - </td><td> V </td><td> - </td><td> - </td><td> V </td><td> - </td><td> - </td><td style="background: yellow;"> - </td><td> - </td><td> - </td><td> V </td><td> - </td>

<td> - </td><td style="background: yellow;"> V </td>
</tr>
<tr><td> Incoming transmission  </td><td> S </td> <td> S </td> <td> S </td> <td> S </td> <td> S </td> <td> S </td> <td> S </td> 

<td> S </td><td> S </td><td> - </td><td> - </td><td> - </td><td> V </td>
<td> - </td><td> V </td><td> - </td><td> - </td><td> V </td><td> - </td><td> - </td><td> - </td><td> - </td><td> - </td>

</tr>
<tr>
<td>Command issued </td><td> <b> F </b> </td><td> </td><td> </td><td></td><td></td><td></td><td></td><td></td><td></td>
<td></td><td></td><td></td><td><b> R </b></td><td></td><td></td><td></td><td></td><td></td><td><b> S </b></td><td></td><td></td><td></td><td></td><td>
</tr>
</table>

</pre>

In this case, we managed to stop our probe one vent earlier (at location 6).  The vent at location 9 is not detected in time - thus it would take less than 
<b> delay </b> units of time for the probe to reach it,  so the lag of <b>delay</b> units of time ensued by the STOP command is too high.
<br></br>
After a short analysis, we find out that all the vents that are within <b> delay </b> units of time distance from the first vent discovered (the closest to 'S') 
can be approached directly, using the single reverse command at the beginning. For the remaining cases, we have to determine whether a second turn 
is less time consuming. <br></br>

Let's consider surface to be " S - - - - V - - - V - - V V - - - -" and <b>delay</b> = 6.
<div align="center">
<img src="/i/srm/srm266_2.gif" alt="" border="0" />
</div>
<br><br>
The green lines denote the probe's path if we aim for the vent at location 9. For this, only a single reverse command is needed, issued in 
the moment we receive the transmission that the probe has reached the vent at location 5. The blue lines denote the probe's path if we aim for 
the vent at location 12.  For this, we issue another reverse command when the vent at location 12 is first encountered 
(the probe is on its way back, at location 16 then). The purple lines denote the probe's path if we aim for the vent at location 13.  As you can see in 
the image above, the length of the purple path is 3 units longer than the length of the blue path.
<br></br>

<b><h3>The source code </h3></b>
<pre>
public int travelTime (String surface, int delay)
{
  int pos = 0;
  while (surface.charAt(pos) != 'V') pos++;
  int time = 5 * delay + pos; 
  int best = time;

  for (int i = pos + 1; i < surface.length(); i++)
  {
    if (i – pos <= delay) time--;
    else time = time + 3;
    if (surface.charAt(i) == 'V' && time < best) best = time; 
  }
  return best;
}

</pre>
Now you can enjoy the trip!<br></br>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4808&amp;rd=7999" name="4808">ZCurve</a></b>
</font>
<A href="Javascript:openProblemRating(4808)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      900
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      92 / 396 (23.23%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      60 / 92 (65.22%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gkv</b> for 892.91 points (2 mins 32 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      627.55 (for 60 correct submissions)
    </td>
  </tr>

</table></blockquote>

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
      254 / 302 (84.11%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      227 / 254 (89.37%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>bmerry</b> for 445.63 points (2 mins 49 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      374.18 (for 227 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

This problem wasn't hard, and the most common approach was to compute the Z-value recursively. A Z-curve of order N is made up of 
4 quadrants, each of them being a Z-curve of order N - 1. The easiest way is to translate the point of coordinates (r,c) to the upper-left quadrant, adding 
the total number of cells of every quadrant with lower Z-values. 

<pre>
public int zValue(int N, int x, int y) {
    if (N == 0) return 0;
    int p = 1 << (N - 1);
    int quarter = ((x >= p ? 2 : 0)  + (y >= p ? 1 : 0));
    return  quarter * p * p + zValue(N - 1, x % p, y % p);

}
</pre>

Another approach is to convert r and c to base-2 bit strings. <br></br>
<div align="center">
<img src="/i/srm/srm266_3.gif" alt="" border="0" />
</div>
<br><br>
Multiply each character-digit of r with 2 and add 1 to it if its corresponding character in c is '1'. This is the Z-value, written in base 4.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4440&amp;rd=7999" name="4440">AntiChess</a></b>
</font>

<A href="Javascript:openProblemRating(4440)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>
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
      28 / 302 (9.27%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 28 (21.43%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Egor</b> for 570.14 points (29 mins 55 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      520.18 (for 6 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

This problem can be solved with <i> minimax </i> trees, a pretty common concept in Game Theory. The following elements should 
usually hint to this kind of approach:
<ul>
<li> It is a two-person game in which the two players alternate making moves. </li>
<li> There is a reciprocal assumption that each player plays optimally. </li>
<li> The number of possible states is not very large. </li>
</ul>

A classical example for this class of problems is Tic-Tac-Toe, 
also given as <a href="http://www.topcoder.com/stat?c=problem_statement&pm=920&rd=4492" name="link01"> TicSolver</a> 
at the TCCC '03 Semifinals. 
<br></br>
A <i>minmax</i> tree is a tree where the nodes represent the current status of the game and the arcs represent 
the moves. The game tree consists of all possible moves for the current players starting at the root and all possible moves for the 
next player as the children of these nodes, and so forth, as far into the future of the game as desired. The leaves of the game 
tree represent terminal positions - there, the outcome of the game is clear.  

<br></br>
Let's take an example, in which white is {"a7", "h7"} and black is "g7" - we write it as "a7, h7, Qg7". 
The diagram below gives the tree associated to this position: 
<br></br>
<div align="center">
<img src="/i/srm/srm266_4.gif" alt="" border="0" />
</div>
<br><br>
The value of an arc is the number of pawns that will be captured if we are going down on that branch. Arcs are assigned bottom-up. With red are denoted 
the arcs representing the queen's moving alternatives. The <i>minimum</i> value of these arcs is the value of the blue arc connecting the parent node.
With blue are denoted the arcs representing the pawns' moving alternatives. The <i>maximum</i> value of these arcs is the value of the red arc connecting 
the parent node (or the final answer, if we reached the root).

<br></br>
If recursivity in ZCurve was just a warm-up, this problem required a deeper understanding of the concept. You may either use indirect recursion, or 
make it all in the same function (but having an extra parameter to know whose turn is, and then treat the two cases separately).
After tackling the daunt
<br></br>
Here are a few possible optimizations that can be made:
<ul>
<li> Check whether a square is occupied by a piece or not in constant time. For this, you need to declare a matrix, board [8][8], which retains 
the state of each square. </li>
<li> Stop calculations if white can sacrifice all pawns present on the board.
<li> Apply partial memoization. This saves you from recursing to the same position more than once. Each pawn may have one of the following 8 
states (rows 2 to 8, or captured). We cannot retain them all, but it is reasonable to only consider the cases when pawns are captured, or advance 
at most 3 rows from their initial position. You may assume the black queen to be on any of the 64 squares. </li>
</ul>

And it looks like <b>Petr</b> did some alpha-beta pruning. 
Code <a name="link2" href="http://www.topcoder.com/stat?c=problem_solution&rm=203754&rd=7999&pm=4440&cr=10574855"> here</a>.
</p>


<p>
<img src="/i/m/supernova_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="7371063" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
