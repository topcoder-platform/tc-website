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
<tc-webtag:forumLink forumID="505859" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 293</span><br>Friday, March 17, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p> 
With the TCO stimulating our coding adrenalin to the max, a high number of registrants in regular SRMs has ceased to surprise us. With 898 competitors, this match was no exception. Because of a small technical problem, the coding phase started 10 minutes later. This was no impediment for the code enthusiasts and the match was prolonged with 10 minutes, as expected. The problems were not very tricky this time and, because of the clarifying examples, the number of challenges was relatively low. 
<br><br>
In Division 1, <b>Petr</b> added another victory to his impressive record. <b>kalinov</b> took the second place and <b>mathijs</b> came in third. 
<br><br>
In division 2, only three coders managed to solve all the problems. <b>Daumilas</b>, the winner, is also the proud owner of  a score of 1111.1. Newcomer <b>Daumilas</b> claimed the second spot, and <b>Michael.tamm</b> finished the third.
</p> 

<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6124&amp;rd=9814" name="6124">Aquarium</a></b> 
</font> 
<A href="Javascript:openProblemRating(6124)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505859" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      374 / 478 (78.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      314 / 374 (83.96%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>otoc</b> for 247.81 points (2 mins 40 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      184.24 (for 314 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The most straightforward way to solve this problem is so simply check every possible size of Bob in the range [minSize, maxSize]. You can then compare each of these possible sizes with the size of every fish in the aquarium. If any conflict is detected, the size of Bob that arose the conflict is discarded. Below is the source code in Java that solves this problem:
<pre>
public int peaceful(int minSize, int maxSize, int[] fishSizes) {
  int n = fishSizes.length;
  int sol = 0;
  for (int i = minSize; i <=maxSize ; i++) {
    boolean ok = true;
    for (int j = 0; j < n; j++) {
      if (i >= 2 * fishSizes[j] && i <= 10 * fishSizes[j]) ok = false;
      if (fishSizes[j] >= 2 * i && fishSizes[j] <= 10 * i) ok = false;
    }
    if (ok) sol++;
  }      
  return sol;
}
</pre>
Another simple method that was used a lot is to build a boolean array of size 1000, where the  i-th element represents whether Bob can have a size of i or not. Then, for every fish in the aquarium, you mark with "false" all the elements in the array that represent wrong sizes for Bob. In the end you count how many elements of the array with indices between minSize and maxSize are "true".
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6116&amp;rd=9814" name="6116">ScrabbleBet</a></b> 
</font> 
<A href="Javascript:openProblemRating(6116)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505859" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      124 / 478 (25.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      94 / 124 (75.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>JBoy</b> for 448.69 points (9 mins 50 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      279.01 (for 94 correct submissions) 
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
      282 / 350 (80.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      268 / 282 (95.04%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NauCoder</b> for 297.51 points (2 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219.65 (for 268 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Although ScrabbleBet was a pretty classical problem of probability theory, there are quite a few different approaches one could use to get around.   
<br><br>
For the math fans, this problem can be solved in a few lines with the formula of <A href="http://mathworld.wolfram.com/BinomialDistribution.html" target="_blank">binomial distribution</A>. Let us denote the number of games played in a meeting by n, the number of wins you need by r and the probability of winning one game by p. Then, the chances you have to win one meeting are given by the following formula:
<div align="center" style="padding:5px;">
<img src="/i/srm/srm293_1.gif" alt="" />
</div>
This formula can be applied again for meetings, as n becomes the number of meetings, r becomes 1 (the number of meetings you need to win), and p becomes the old P computed earlier. 
<br><br>
However, this problem can be solved without knowing the complicate formula above.  Knowing the following two more basic formulas is also good enough:
<div align="center" style="padding:5px;">
<img src="/i/srm/srm293_2.gif" alt="" />
</div>
<div align="center" style="padding:5px;">
<img src="/i/srm/srm293_3.gif" alt="" />
</div>
For the first part of the problem, to determine the probability of winning one meeting, the first formula can be used. There are 2 ^  games possible ways a meeting could evolve and you need to analyze them one by one, applying the first formula to determine their probabilities that are then added up. Note than an event in this case can be either a win (with a probability of winChance), or a loss (with a probability of 1 - winChance).
<br><br>
For the second part, you just apply the second formula with each event having the probability we computed earlier.
<br><br>
For more details, refer to the <A href="/tc?module=Static&d1=tutorials&d2=probabilities">Understanding Probabilities</A> tutorial.
<br><br>
A math free, and also easy to code solution, is to use a dynamic programming approach. Denote with c[n][r] the chance of winning at least r games out of n with a chance of p to win one single game. Then, you can compute c as follows:<br>
c[n][r] = 1, if r = 0<br>
c[n][r] = 0, if n = 0 and r > 0<br>
c[n][r] = p* c[n-1][r-1] + (1-p)*c[n-1][r], otherwise.<br>
In the end, you should return 1 - c[games][winsNeeded] ^ trials<br>
For more information on the use of DP in probability problems, check the <A href="/tc?module=Static&d1=tutorials&d2=probabilities">Step by Step Probability Computation</A> chapter.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=4499&amp;rd=9814" name="4499">Bingo</a></b> 
</font> 
<A href="Javascript:openProblemRating(4499)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505859" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
By&#160;<tc-webtag:handle coderId="159544" context="algorithm"/>
<br><br>
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
      16 / 478 (3.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 16 (37.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk2</b> for 499.82 points (37 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      389.12 (for 6 correct submissions) 
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
      209 / 350 (59.71%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      105 / 209 (50.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ploh</b> for 386.33 points (11 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      247.18 (for 105 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Because there are quite a lot of rules to follow (and of course the examples didn't cover them all), this problem had the lowest success rate in both divisions. 
<br><br>
The last sentence of the problem statement, "If the call that first allows you to win allows you to win in more than one way, the method must return the winning sequence that had the earliest call in it" must be carefully analyzed and properly understood in order to proceed with the algorithm. The first thing to note is that once you have a winning sequence, the method winner should return something. That is, from this moment the game is over (you won) and the remaining calls should be ignored. Because the last call can simultaneously produce more than one winning sequence, you are told to select the one that had the earliest call in it. Then ... you have to read the whole problem statement again. You want to know what happens if there are more winning sequences with the same first call. Unfortunately you don't find this information anywhere in the statement. But working on a paper with concrete examples (this is usually a wise thing to do), you quickly realize that such a situation is not possible. From coder to coder, this analysis can take varying amounts of time. As the clock starts from the moment you open the problem, this time is of course significant. To find out more on how to deal with problems like this, you may want to read the <A href="/tc?module=Static&d1=tutorials&d2=dissectProblem">How To Dissect a TopCoder Problem Statement</A> tutorial.
<br><br>
Then, coding is quite straightforward. Represent the grid as a matrix with 5 lines and 5 columns, and mark on it the calls in the order they appear. After each new call, you should check every line, column and main diagonal to see if a winning sequence has been reached.  The code in Java is given below:
<pre>
public class Bingo{
    int[][] idx = new int[5][5];
    int[] win = new int[5];
    public String winner(String[] card, String[] call){
        int[][] a = new int[5][5];
        for (int r = 0; r < 5; r++){
            String[] x = card[r + 1].trim().split("[ ]+");
            for (int c = 0; c < 5; c++) {
                if (c !=2 || r != 2)
                    a[r][c] = Integer.parseInt(x[c]);
            }
        }
        for (int r = 0; r < 5; r++) for (int c = 0; c < 5; c++) idx[r][c] = -1;
        idx[2][2] = 99;
        for (int i = 0; i < call.length-1;i++) {
            int v = Integer.parseInt(call[i].substring(1));
            for (int r = 0; r < 5; r++)for (int c = 0; c < 5; c++)
                if (a[r][c] == v) idx[r][c] = i;
        }
        win[4] = 100;  // winning index
        for (int r = 0; r < 5; r++) getWin(r,0,0,1);
        for (int c = 0; c < 5; c++) getWin(0,c,1,0);
        getWin(0, 0, 1, 1); getWin(0, 4, 1, -1);
        if (win[4] == 100) return "YOU LOSE";
        String ret="";
        for (int i = 0;i < 5; i++) if (i == 0 || win[i] != win[i - 1])    
            ret += "," + call[win[i]];
        return ret.substring(1);
    }
    void getWin(int r, int c, int dr, int dc){
        int[] w = new int[5];
        for (int i = 0; i < 5; i++) w[i] = idx[r + i * dr][c + i * dc];
        Arrays.sort(w);
        if (w[4] == 99) w[4] = w[3];
        if (w[0] == -1 || w[4] > win[4]) return;
        if (w[4] == win[4] && w[0] > win[0]) return;
        win = w;
    }
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=5877&amp;rd=9814" name="5877">CirclesOfDestruction</a></b> 
</font> 
<A href="Javascript:openProblemRating(5877)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505859" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      21 / 350 (6.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      14 / 21 (66.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 783.21 points (15 mins 53 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      581.25 (for 14 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is actually not as hard as it seems. Suppose you want to reach from a point A to a point X on the edge of the map. What's the quickest way to get there? If there are no obstacles, it is of course a straight line. The only reason you may want to deviate from the straight line is an expanding circle that reaches to an intermediary point on the segment AX before you. This means that the distance between a point of the circle and X is smaller than the distance between you and X. But because the speed of the circle is the same as yours, you will never be able to catch up. So, it's an all or nothing game - you can either reach a destination point by moving on a straight line, or you can not reach it at all.
<div align="center" style="padding:5px;">
<img src="/i/srm/srm293_4.gif" alt="" />
</div>
Let's now suppose that you want to reach the right edge of the map (the other 3 edges are treated similarly). Let a be the distance between point A (your initial position) and the right edge.  AX is the total distance you need to travel in order to safely reach the border. You want to find, if possible, a location for point X such that A'X is minimized. Then, you determine for every expanding circle (a circle's center is denoted by a red dot in the diagram above) the interval of points on the axis that get enclosed before you can reach there. To find such an interval, you'll need to determine one of its edges, which is exactly the point where AX = BX.  You find that x = (a * a - d * d - b * b) / (2 * d). Every such interval is open on the other edge, since AX - BX is a monotone function on X. This can be proved by applying the properties of square numbers, or deducted by working on an example. Because of this property, you can also successfully apply binary search instead of the more precise formula to find the point X. 
<br><br>
You may need to treat separately the case when B is on the AA' segment. In that case every point on the axis is obstructed, so there are no solutions there. 
</p><div class="authorPhoto">
    <img src="/i/m/supernova_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="7371063" context="algorithm"/><br />
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
