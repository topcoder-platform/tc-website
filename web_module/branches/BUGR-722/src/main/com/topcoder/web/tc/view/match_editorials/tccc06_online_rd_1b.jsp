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
<tc-webtag:forumLink forumID="506108" message="Discuss this match" /></div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge <br> Online Round 1-B</span><br>September 23, 2006
<br><br>

<h2>Match summary</h2> 

 

<p>
This section had the highest number of registrants among all Round 1 sections, with participants including the three most recent TCCC champions.
The competition pace was really tough, and only four people were able to submit the hard problem in time. 
<tc-webtag:handle coderId="144400" context="algorithm"/> traditionally was ahead after the coding phase, 
but a bug in the hard problem moved him a dozen positions lower. 
Only <tc-webtag:handle coderId="251074" context="algorithm"/>'s and <tc-webtag:handle coderId="19786437" context="algorithm"/>'s
hard submissions survived the system tests, giving them the top 2 spots. 
<tc-webtag:handle coderId="8355516" context="algorithm"/>, <tc-webtag:handle coderId="20156359" context="algorithm"/>
and <tc-webtag:handle coderId="7390224" context="algorithm"/> rounded the top 5.
</p>

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=1289&amp;rd=10100" name="1289">Spirals</a></b> 

</font> 

<A href="Javascript:openProblemRating(1289)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506108" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      461 / 530 (86.98%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      325 / 461 (70.50%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>kalinov</b> for 246.01 points (3 mins 37 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      171.93 (for 325 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Iterating through the cells of a table is easy when you go row by row, but spiral movement is a bit less obvious.
To implement it correctly, let's take a closer look at how the spiral is built:
</p>
<pre>
Beginning    Second      Later     Even Later  Finally
  01234       01234       01234       01234      01234

0 .....       .....       .....       012..      01234
1 .....       .....       .678.       96789      96789 
2 ..0..       ..01.       .501.       85010      85010
3 .....       .....       .432.       74321      74321
4 .....       .....       .....       65432      65432
</pre>
<p>
As you can see, you have to make the following steps to complete the spiral:
<pre>
1 step - right
1 step - down
2 steps - left
2 steps - up
3 steps - right
3 steps - down
4 steps - left
4 steps - up
....
</pre> 
The process is cyclical, and on the i-th iteration you have to make (2*i + 1) steps right and down, and 
(2*i + 2) steps left and up. As soon as any of your steps ends out of the board, you are done. 
For a clean implementation of this approach, see 
<tc-webtag:handle coderId="251074" context="algorithm"/>'s 
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=249782&rd=10100&pm=1289&cr=251074">solution</a>:
<pre>
bool go(int dr, int dc, int moves)
{
    for (int x = 0; x < moves; x++)
    {
        if (r < 0 || r >= (int) ans.size()) 
        return false;
        if (c < 0 || c >= (int) ans[0].size()) 
        return false;
        ans[r][c] = '0' + p;
        p = (p + 1) % 10;
        r += dr;
        c += dc;
    }
    return true;
}

vector <string> Spirals::draw(int width, int height, int startx, int starty)
{
.............
    r = starty;
    c = startx;
    p = 0;
    int moves = 1;
    while (true)
    {
        if (!go(0, 1, moves)) 
        return ans;
        if (!go(1, 0, moves)) 
        return ans;
        l++;
        if (!go(0, -1, moves)) 
        return ans;
        if (!go(-1, 0, moves)) 
        return ans;
        l++;
    }
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6725&amp;rd=10100" name="6725">FactoryCounting</a></b> 

</font> 

<A href="Javascript:openProblemRating(6725)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506108" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      155 / 530 (29.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      127 / 155 (81.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>gawry</b> for 467.81 points (7 mins 33 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      293.32 (for 127 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Your first step should be to reword the problem statement in terms of graph theory.
Given a non-oriented graph, you are asked to find the number of different bipartite cliques of size n*m (K<sub>n,m</sub>).
The intended solution for this problem was the brute force approach with some optimizations.
The total number of all possible cliques (C(30, 8) * C(22, 8)) is too large to be iterated, therefore we will use a trick -- check all possible sets of building factories, and for each set compute the number of different sets of assembling factories. 
The sum of all these numbers is the answer to our problem. There exist at most C(30, 8)  (approx. 6 millions) different sets of building factories, therefore we need to compute the number of proper sets of assembling factories pretty quickly. 
</p>
<p>
First, we'll fix a set of building factories X  (X<sub>1</sub>, X<sub>2</sub>,..., X<sub>n</sub>).
Let's call a factory <i>good</i>, if it is connected by a road to all factories X<sub>1</sub>, X<sub>2</sub>,..., X<sub>n</sub>.
Let's call the set A (factories A<sub>1</sub>, A<sub>2</sub>,..., A<sub>m</sub>) <i>good</i>, if sets X and A form a proper factory complex. To satisfy this condition, every factory A<sub>i</sub> must be connected by a road to all factories X<sub>j</sub>.
Therefore, set A is <i>good</i> if and only if every factory A<sub>i</sub> is <i>good</i>.
</p>
<p>
Let sets of factories A (factories A<sub>1</sub>, A<sub>2</sub>,..., A<sub>m</sub>) and B (B<sub>1</sub>, B<sub>2</sub>,..., B<sub>m</sub>) both be <i>good</i>. This means that, for every 1 <= j <= m, factories A<sub>j</sub> and B<sub>j</sub> are <i>good</i>. 
If we merge sets A and B into one set Y (A<sub>1</sub>, A<sub>2</sub>,..., A<sub>m</sub>, B<sub>1</sub>, B<sub>2</sub>,..., B<sub>m</sub>), all factories in set Y will be <i>good</i>.
Therefore, if we take any m factories from set Y, all factories in this new set will be <i>good</i>,
and this set will be <i>good</i> itself.
As you can see now, any m <i>good</i> factories will form a <i>good</i> set.
Therefore, the total number of <i>good</i> sets for set X is equal to C(T, m), where T is the number of <i>good</i> factories for set X.
</p>
<p>
To quickly compute the total number of <i>good</i> factories for set X, you need to use the standard trick with keeping connections
for each factory in a bitmask (instead of an array of boolean). The following C++ code implements this approach:
</p>
<pre>
        // element cnk[i][j] contains the value C(i, j).
        vector<vector<long long> > cnk; 
        // element connection[i] contains the bitmask, representing 
        // all the factories connected to the i-th factory
        vector<int> connection; 
        // computes the number of 1's in the binary code of number i.
        int ones(int n) { return n ? 1 + ones(n & (n - 1)) : 0;} 
        // the core method, which tries adding the current factory or skipping it.
        long long go(int factory, int count, int assembly) { 
            if (count == m)
                return cnk[ones(assembly)][n];
            if (factory >= N) 
                return 0;
            // move to the next factory
            return go(factory + 1, count, assembly) + 
                go(factory + 1, count + 1, assembly & connection[factory]); 
// add the current factory to the list, updating the total count and connections list
        }
        long long count(int n, int m, vector <string> county) 
            { 
            N = county.size(); // the total number of cities
            this.m = m; this.n = n;
            if (m + n > N) // we definitely can not build the complex
                return 0;
            connection = vector<int>(N, 0);
            for (int i = 0; i < N; i++) for (int j = 0; j < N; j++) 
                if (county[i][j] == 'Y') connection[i] |= (1 << j);
            cnk= vector<vector<long long> >(N + 1, vector<long long>(N + 1, 0));
            for (int i = 0; i < N; i++) cnk[i][0] = 1;
            for (int i = 1; i < N; i++) for (int j = 1; j < N; j++) 
        cnk[i][j] = cnk[i - 1][j - 1] + cnk[i - 1][j];
            return go(0, 0, (1 << N) - 1); 
// start from factory 0, 
//with total of 0 factories added to the set, 
// with all factories "connected" to our empty set.
            }
</pre>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6414&amp;rd=10100" name="6414">Monopolies</a></b> 

</font> 

<A href="Javascript:openProblemRating(6414)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506108" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      5 / 530 (0.94%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      2 / 5 (40.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>bmerry</b> for 492.70 points (38 mins 29 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      469.64 (for 2 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The first thing to notice here is that both players are independent, therefore the probability to reach cell i on the j-th turn is the same for both players (for any i and j). If we'll be able to find probabilities for a player to reach the cell <b>square</b> in i turns for any i, 
the return value for the problem can be computed in the following way (prob[i] represents the probability to a player to land on the cell <b>square</b> on the i-th turn).
<pre>
        double ans = 0;
        // the probability that the first player hasn't reached 
        // the cell <b>square</b> yet.
        double first = 1; 
        for (int i = 0; i < 22; i++) {
        // note that the probabilities to land on the 
        // cell <b>square</b> on the i-th turn are independent for all i
        first -= prob[i]; 
        ans += prob[i] * first; // probability that the second player lands on the cell on this turn
            // and the first player hasn't landed on it yet.
        }
        return ans;
</pre>

Since the players can move only forwards (to the cells with higher indices), the probability for a player to reach cell i in j moves depends 
only on the probabilities for a player to reach cells with lower indices. 
Therefore, we can iterate through cells from the 0 to 39, calculating the probabilities for cells one by one. 
The most natural state for this DP is a triple (cell, numbers of moves, number of doubles rolled). 
Since the player can land on more than 1 cell during a turn (after rolling doubles or drawing a card), 
we will keep the probabilities for the cell <b>square</b> in a separate array (changing it when the player lands on this cell). Carefully implementing the moves between states, we 
<pre>
public class Monopolies {
    int N = 40, square;
    int[] move = {11, 24, 29, 39};
    int[] probMoves = {0, 0, 0, 2, 2, 4, 4, 6, 4, 4, 2, 2};
    int jail = 30;
    boolean needCard(int s) { return 7 == s || 22 == s || 36 == s;}
    public double probability(int square) {
        double[][][] data = new double[23][N][4];
        double[] prob = new double[23];
        data[0][0][0] = 1;
        for (int i = 0; i < 22; i++) {
            for (int j = 0; j <= square; j++) for (int k = 0; k < 2; k++) {
                for (int a = 2; a <= 12 && a + j <= square; a += 2) {
                    double p = data[i][j][k] / (36. * 20.);
                    int nxt = j + a;
                    if (nxt == square) 
            prob[i + 1] += p * 20;
                    if (nxt == jail) 
            continue;
                    if (needCard(nxt)) {
                        data[i][nxt][k + 1] += p * 14;
                        for (int q = 0; q < move.length; q++) {
                            if (move[q] < nxt) 
                    continue;
                            if (move[q] == square) 
                    prob[i + 1] += p;
                            data[i][move[q]][k + 1] += p;
                        }
                        continue;
                    }
                    data[i][nxt][k + 1] += p * 20;
                }
            }
            for (int j = 0; j <= square; j++) for (int k = 0; k < 3; k++) {
                for (int a = 2; a < probMoves.length && a + j <= square; a++) {
                    double p = data[i][j][k] * probMoves[a] / (36. * 20.);
                    int nxt = j + a;
                    if (nxt == square) 
                prob[i + 1] += p * 20;
                    if (nxt == jail) 
                continue;
                    if (needCard(nxt)) {
                        data[i + 1][nxt][0] += p * 14;
                        for (int q = 0; q < move.length; q++) {
                            if (move[q] < nxt) 
                        continue;
                            if (move[q] == square) 
                        prob[i + 1] += p;
                            data[i + 1][move[q]][0] += p;
                        }
                        continue;
                    }
                    data[i + 1][nxt][0] += p * 20;
                }
            }
        }
        double ans = 0;
        // the probability that the first player hasn't reached the cell <b>square</b> yet.
        double first = 1; 
        for (int i = 0; i < 22; i++) {
        // note that the probabilities to land on the cell <b>square</b> 
        // on the i-th turn are independent for all i
        first -= prob[i]; 
        // probability that the second player lands on the cell on this turn
        ans += prob[i] * first; 
            // and the first player hasn't landed on it yet.
        }
        return ans;
}
</pre>

<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />
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
