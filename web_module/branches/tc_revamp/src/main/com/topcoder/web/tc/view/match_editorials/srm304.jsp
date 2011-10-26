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
<tc-webtag:forumLink forumID="505870" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 304</span><br>Saturday, May 27, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This match was a popular one, with 965 members participating. One reasons for the high participation may have been that this was the last SRM before the upcoming Google Code Jam Europe, so a lot of Europeans took this SRM as a training opportunity.
<br><br>
In division 1, <tc-webtag:handle coderId="7433858" context="algorithm"/> took home his second SRM win with a comfortable 200 point lead over <tc-webtag:handle coderId="10157606" context="algorithm"/>, who was followed by <tc-webtag:handle coderId="10481120" context="algorithm"/>. The problem set was fairly tough: it had a tricky 300 that fooled a lot of coders into taking a greedy approach; a 450 that involved understanding probability theory and using dynamic programming; and a hard game theory problem as the 1,000. This resulted in only 190 coders out of 420 scoring more than 0 &ndash; leading to another instance in which some who scored 0 actually increased their ratings.
<br><br>
Division 2 had newcomer <tc-webtag:handle coderId="21971539" context="algorithm"/> as a winner, followed closely by <tc-webtag:handle coderId="21109496" context="algorithm"/>. Third place went to <tc-webtag:handle coderId="22221928" context="algorithm"/>, another newcomer. The problems were of medium to hard dificulty, with the hard problem the same as the tricky easy problem from div 1.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6195&amp;rd=9825"
name="6195">RugSizes</a></b>
</font>
<A href="Javascript:openProblemRating(6195)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505870"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      481 / 507 (94.87%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      260 / 481 (54.05%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>duckyaya</b> for 248.24 points (2 mins 24 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      201.40 (for 260 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem was pretty straightforward as you needed to count the number of ways you can multiply two natural numbers a and b so that the result is the area. To avoid counting the same pair twice we impose that a<=b. The problem also requires that if
a!=b, then a or b must be odd. This translates into the following code:
<pre>
public class RugSizes {
    public int rugCount(int area) {
        int res = 0;
        for (int a = 1; a * a <= area; a++) {
            if (area % a == 0) {
                b = area / a;
                if (a == b) res++;
                else if (a % 2 != 0 || b % 2 != 0) res++;
            }            
        }
        return res;
    }
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3495&amp;rd=9825"
name="3495">MovingAvg</a></b>
</font>
<A href="Javascript:openProblemRating(3495)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505870"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      457 / 507 (90.14%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      428 / 457 (93.65%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>not2knight</b> for 495.07 points (2 mins 50 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      408.39 (for 428 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
To solve this problem we need to find the average of every contiguous subsequence of k numbers in the array, find the maximum and minimum of these values and return their difference. 
<pre>
public class MovingAvg {
    public double difference(int k, double[] data) {
        double min = 1000000, max = -1;
        for (int i = 0; i <= data.length - k; i++) {
            double sum = 0;
            for (int j = 0; j < k; j++) {
                sum += data[i + j];
            }
            if (min > sum) min = sum;
            if (max < sum) max = sum;
        }
        return (max - min) / k;
    }
}
</pre>This solution has O(n * k) complexity. Other solutions in O(n) are possible. For example, when computing the sum of the next subsequence of the lenght k, one can reuse the sum of the current subsequence. It suffices to add the next element and substract the first element of the current subsequence Yet another O(n) approach would be to consider a sum array so that sum[i] = data[0] + data[1] + ... + data[i]. Using this array we can compute the sum data[i] + data[i + 1] + ... + data[j] as sum[j] - sum[i - 1].</p>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6190&amp;rd=9825"
name="6190">PolyMove</a></b>
</font>
<A href="Javascript:openProblemRating(6190)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505870"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      116 / 507 (22.88%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      19 / 116 (16.38%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>duckyaya</b> for 915.31 points (8 mins 48 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      563.74 (for 19 correct submissions) 
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
      264 / 406 (65.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      97 / 264 (36.74%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bmerry</b> for 279.59 points (7 mins 47 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      201.23 (for 97 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This task was a tricky one mainly due to the small numbers of examples. First let's see how do we move the vertex A from a triangle ABC such that we maximize the resulting area. The area depends on the length of the altitude from the vertex A, and on the length of the side BC. To maximize the area by moving a vertex A we need to maximize the length of the altitude. So we move A perpendicularly to 
the side BC and we get an increase in the area equal to BC * 1/2.
The greedy approach that a lot of people took was to move every second vertex of the polygon first beginning from the first vertex of the polygon and then beginning from the second vertex. But this aproach failed on tests like the one suggested by <tc-webtag:handle coderId="19786437" context="algorithm"/> in the <a href="http://forums.topcoder.com/?module=Thread&threadID=511260">forums</a>.
To solve the task correctly we needed to use dynamic programing. To make the problem linear (not circular) we must split the polygon at one point. Now we have three different cases, first we don't move the point with the index 0 or the point with index n - 1, second we move the point with index 0, third we move the point with index n - 1. We use the best[i] array to find the best area difference we can get by moving the points 1 .. i - 1. It is obvious that best[i] = max( best[i - 1], best[i - 2] + distance(Point[i - 2], Point[i]) / 2).

<pre>
public class PolyMove {
    double dist(long x, long y, long x1, long y1) {
        return Math.sqrt((x - x1) * (x - x1) + (y - y1) * ( y - y1));
    }
    public double addedArea(int[] x, int[] y) {
        int n = x.length;
        double[] best = new double[n];
        // first case
        best[0] = 0;
        best[1] = 0;
        for (int i = 2; i < n; i++) {
            best[i] = Math.max(best[i-1], best[i - 2] + dist(x[i-2], y[i-2], x[i], y[i])* 0.5);
        }
        double res = best[n - 1];
        
        //second case
        Arrays.fill(best, 0);
        best[0] = 0;
        best[1] = dist(x[n-1], y[n-1], x[1], y[1])* 0.5;
        best[2] = best[1];
        for (int i = 3; i < n; i++) {
            best[i] = Math.max(best[i-1], best[i - 2] + dist(x[i-2], y[i-2], x[i], y[i])* 0.5);
        }
        res = Math.max(best[n - 1], res);
        //third case
        Arrays.fill(best, 0);
        best[0] = dist(x[n-2], y[n-2], x[0], y[0])* 0.5;
        best[1] = best[0];
        for (int i = 2; i < n - 1; i++) {
            best[i] = Math.max(best[i-1], best[i - 2] + dist(x[i-2], y[i-2], x[i], y[i])* 0.5);
        }
        res = Math.max(best[n - 2], res);
        
        return res;
        
    }
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6412&amp;rd=9825"
name="6412">Conditional</a></b>
</font>
<A href="Javascript:openProblemRating(6412)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505870"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      196 / 406 (48.28%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      139 / 196 (70.92%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 428.67 points (6 mins 24 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      275.81 (for 139 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
We will solve the problem using dynamic programming, but first we will need to find the state space. Let's try to reduce the problem to a simpler one that we can easily solve. Also let’s require to have no dice throw with the result v. Then let’s find the probability that after i throws the result will be equal to j and no dice will have the value v. We will call this probability prb[i][j]. How would we compute this probability? Well, we've reached state (i, j) of this problem from a state (i - 1, j - diceValue) with a probability 1/maxSide when we threw a dice with the result diceValue, and diceValue != v. So we conclude that prb[i][j] =
 (prb[i - 1][j - 1] + prb[i - 1][j - 2] + ... + prb[i - 1][j - diceValue + 1] + prb[i - 1][j - diceValue - 1]  + ... + prb[i - 1][j - maxSide])/maxSide. Now that we know how to compute prb[i][j], lets think about the modified problem of finding prb1[i][j] which is the probability that from i dice throws at least one of the results was v and the sum of dice values is equal to j. We either could get in the state (i, j) from other states (i - 1, j - diceValue) from this problem where diceValue is any number from 1 to maxSide, or from the state (i - 1, j - v) of the previous problem. We conclude that prb1[i][j] = (prb1[i - 1][j - 1] + prb1[i - 1][j - 2] + ... + prb1[i - 1][j - maxSide] + prb[i - 1][j - v]) / maxSide. 
<br>
The return result will be overSumProb / totalProb, where overSumProb is the probability that from nDice throws we got a sum larger or equal to theSum, and totalProb is the probability that in nDice throws at least one dice throw has the result v ( overSumProb =prb1[nDice][theSum] + prb1[nDice][theSum + 1] + ... + prb1[nDice][nDice * maxSide] totalProb = prb1[nDice][0] + prb1[nDice][nDice] + ... + prb1[nDice][nDice * maxSide]).
<br>
A simple implementation of what was explained before follows:

<pre>
public class Conditional {
    public double probability(int nDice, int maxSide, int v, int theSum) {
        double[][] prb = new double[nDice + 1][nDice * maxSide + 1], 
			prb1 = new double[nDice + 1][nDice * maxSide + 1];
        prb[0][0] = 1;
        double pb = 1.0/maxSide;
        for (int i = 0; i < nDice; i++) {
            for (int j = 0; j <= nDice * maxSide; j++) {
                if (prb[i][j] != 0 || prb1[i][j] != 0) {
                    for (int k = 1; k <= maxSide; k++) {
                        if (k != v) {
                            prb[i + 1][j + k] += pb * prb[i][j];
                            prb1[i + 1][j + k] += pb * prb1[i][j];
                        } else
                            prb1[i + 1][j + k] += pb * prb[i][j] + pb * prb1[i][j];
                    }
                }
            }
        }
        double res = 0, res1 = 0;
        for (int i = 0; i <= nDice * maxSide; i++)      {
            if (i >= theSum)res += prb1[nDice][i];
            res1 += prb1[nDice][i];
        }
        return res/res1;
    }
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6137&amp;rd=9825"
name="6137">TheXGame</a></b>
</font>
<A href="Javascript:openProblemRating(6137)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505870"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      15 / 406 (3.69%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 15 (53.33%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ying</b> for 625.00 points (25 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      532.77 (for 8 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem was a hard one and at least three of the participants with correct submissions guessed that their solution would work but did not have any proof. To solve it we have to be familiar to concepts in game theory, particularly in impartial combinatorial games.
<br>
First we will talk about the game of Nim: <i>There are n heaps of stones. Two players will take(alternatively) any number of stones from the same heap. The winner is the player who picks up the last stone.</i><br>
For n <= 2 the strategy is trivial, but for n > 2 the strategy is hard to see. The winning states of the game are the ones for which the bitwise xor sum of the number of stones in each heap is not equal to 0. For example if we have four heaps of stones each with 1, 3, 5, 7 then the xor sum is 1 ^ 3 ^ 5 ^ 7 = 0. We know that if both players play a perfect game, then the first player loses in the game where the heaps have 1, 3, 5 and 7 stones. You can find a proof <a href="http://en.wikipedia.org/wiki/Nim#Proof_of_the_winning_formula">here</a>.
<br>
Now let's try to prove that our problem has the same winning/losing state space.
The '-' characters in our problem correspond to the stones in the Nim problem. The continuous sequences of dashes correspond to the heaps of stones in the Nim game. Marking some consecutive 'X' characters is as taking some stones from one heap and maybe splitting it into two heaps. The Nim problem didn't include a splitting move, but including one doesn't change the xor sum strategy, as the move of thaking some stones from a heap of size a and getting two heaps of sizes b and c, brings us to the same xor sum as we would get if we removed (a - (b xor c)) stones from that heap.<br>
We will prove by induction that if player2 is faced with n stones in total and the xor sum of the heaps is 0 then player1 will win by a minimum of n/2 * current_multiplier points.<br> If the game will end in two moves, then player2 is faced with two heaps, and if the xor sum of the sizes of the heaps is 0 then it means the two heaps have equal sizes, so player1 wins by n/2 * current_multiplier.<br>Suppose we are not at the last two moves in the game. Player2 can take at most n/2 stones from the game, because for the xor sum to be 0, the largest heap in the game can't be of size bigger than n/2. Now suppose player2 takes n/2 stones from the game, now player1 will take x stones from the game, and we are left with a smaller game of n/2 - x stones. By the induction hypothesis this game will get player1 at least (n/2 - x)/2 * 4 * current_multiplier advantage (we did two moves so the multiplier increased 4 times). So the first player will have a advantage given by x * 2 * current_multiplier which is the cost of taking x stones and by (n/2 - x)/2 * 4 * current_multiplier which is the advantage he gets in the (n/2 - x) game from which we substract n/2 * current_multiplier which was scored by player2.  In the worst case this amounts at least to n/2 * current_multiplier. So our hypothesis is proved. (this proof is due to <tc-webtag:handle coderId="7433858" context="algorithm"/>'s post in the <a href="http://forums.topcoder.com/?module=Thread&threadID=511254">forum</a>).
<br>
Now to solve the problem we can make every possible move and see if the nim-like problem has the xor sum equal to 0. A clean simple implementation by <tc-webtag:handle coderId="7433858" context="algorithm"/> of this solution can be found <a href="/stat?c=problem_solution&rm=248768&rd=9825&pm=6137&cr=7433858">here</a>.
</p><div class="authorPhoto">
    <img src="/i/m/Cosmin.ro_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="303185" context="algorithm"/><br />
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
