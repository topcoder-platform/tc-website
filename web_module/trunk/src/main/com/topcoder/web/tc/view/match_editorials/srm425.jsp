<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 425 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
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
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/stat?c=round_overview&amp;er=5&amp;rd=13516">Match Overview</a><br />
    <tc-webtag:forumLink forumID="524483" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 425</span><br />Wednesday, November 12, 2008
<br /><br />

<h2>Match summary</h2> 



<p> 

The coders in Division 1 were proposed three problems somehow related search or graphs. 

The easy was a DFS problem, solution for the medium required BFS, and the hard was a task on graph connectivity.

Division 2 shared two of those problems, with a numbers manipulation as the easy.

Newcomer <tc-webtag:handle coderId="22712322" context="algorithm"/> won the Division 2 title, moving over 

1900 rating points after his very first SRM. <tc-webtag:handle coderId="22629908" context="algorithm"/>

and <tc-webtag:handle coderId="22690044" context="algorithm"/> were about half-challenge behind,

significantly ahead of the crowd. In Division 1, 

<tc-webtag:handle coderId="22511877" context="algorithm"/>

got his first SRM win, beating second finisher



<tc-webtag:handle coderId="10574855" context="algorithm"/>



by more than 50 points. Nobody except two winners solved the hard problem,

with 

<tc-webtag:handle coderId="22074760" context="algorithm"/>

coming third thanks to numerous challenges.







</p> 

 

<H1> 

The Problems 

</H1>

</p> 



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10118&amp;rd=13516" name="10118">InverseFactoring</a></b> 

</font> 

<A href="Javascript:openProblemRating(10118)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524483" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      844 / 921 (91.64%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      438 / 844 (51.90%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>gobianand</b> for 249.99 points (0 mins 10 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      204.03 (for 438 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

If you'll look at the list of all factors of some number N, you'll recognise that you can find there many pairs of numbers 

f1 and f2 such that f1 * f2 = N (no surprise here, if f1 is a factor of N, then N/f1 will also be a factor). 

Therefore, to find N we need to select two factors such that their product is N and multiply them.

</p>

<p>

How to do that? The easiest way is to sort the array of factors, take the smallest and the biggest factors of N, and return 

their product. Proving that the product of those factors will be equal to N is simple: if (f1 * f2) == N and (a1 * a2) == N, 

and f1 < a1, then (a2 < f2). So, if f1 is the smallest factor of N (f1 < f for any factor f), then f2 will be the biggest 

factor.

</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10117&amp;rd=13516" name="10117">PiecesMover</a></b> 

</font> 

<A href="Javascript:openProblemRating(10117)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524483" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 

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

      46 / 921 (4.99%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      16 / 46 (34.78%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>acsaga</b> for 669.55 points (22 mins 26 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      517.70 (for 16 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 



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

      392 / 666 (58.86%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      296 / 392 (75.51%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>tourist</b> for 448.36 points (9 mins 52 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      293.11 (for 296 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

After solving an easy DFS problem, coders were proposed a much harder BFS problem (<a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=graphsDataStrucs2">read this</a> if "BFS" and "DFS" do not

sound familiar to you).

In general, every time you are asked to find a shortest sequence of moves to reach a certain goal, think

of a <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3">shortest path algorithm</a> through a graph.

For this problem, building the corresponding graph is very simple: each vertex of a graph is represented by an unique configuration

of pieces on the board, and two vertices are connected by a edge if and only if the corresponding configurations can be transformed 

one into another by one move.



We are to find the shortest path from vertex A (corresponding to the starting configuration of the pieces) to

any of the final vertices (where the pieces are at adjacent squares). 



To find this path, we'll use BFS algorithm, which

is pretty well described in the turorial (see links earlier in this paragraph).

Lets "time for vertex V" (Tv) be the length of the shortest path 

from the starting configuration to vertex V.

</p>

<p>

So, the general structure of the algorithm is simple and is a standard for BFS: 

<ol>

<li>

Create a structure to store the visited vertices with their times. 

Create a queue to store the achievable_but_not_checked vertices. Push 

the starting configuration to this queue.

</li>

<li>

Remove the first vertex V from the queue. Check all vertices reachable from V. 

For each such vertex W, check whether it was

visited earlier, and if it wasn't, then add it to queue and to the visited list (time Tw will be equal to 1 + Tv).

</li>

<li>

Continue until the queue is empty.

</li>

<li>

Return the best time Tv for all final vertices V.

</li>



</ol>



Of course, implementation is the hardest part of this problem.

You may meet the following problems during implementation:

<ul>

<li>

<b>How to represent a configuration of the pieces?</b> The obvious way is to have a 2-d boolean array, with the j-th element

of the i-th row being 1 if the j-th cell in the i-th row is occupied by a piece. 

Since reading elements from array takes too much time in some languages, and since copying arrays takes too much time in all

languages (and we'll need to copy arrays to add elements to queue, for example), we can reduce the 2-d array to a 1-d array.

For example, each row of the board can be represented by an integer, with the j-th bit of the integer being 1 if and only if 

the j-th cell of the row is occupied. For example, the array (1, 4, 0, 0, 0) means we have two pieces - one in the first cell

of the first row, and another in the third cell of the second row. The next step is to reduce a 1-d array to one integer - since

each row is only 5 cells long, we can store the board in one integer mask: bits from 1-st to 5-th will represent

the first row, from 6-th to 10-th represent the second row, and so on. For example, the array above will transform to number 129 (the first and the 8-th bits are checked).

Further we'll refer to vertices by their masks.

</li>

<li>

<b>How to store visited vertices and their times?</b> Since each vertex now is represented by a number, the usual way to do this is an array (with the i-th element representing

the time for vertex i). Of course, this will not fit into memory (since masks can vary from 0 to 2^25), so we need to use a <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=dataStructures">hash table</a>.

If a key K is present in the table, then vertex K was already visited and the time for vertex K is equal to the value corresponding to key K in the table.

</li>

<li>

<b>How to make the program run in time?</b> Since the most trivial implementation of our algorithm may time out, we will need

to optimize it. First of all, since each move from a vertex to another vertex takes 1 unit of time, it is safe to interrupt

our BFS as soon as we achieve any final vertex and return the time for that vertex (the proof is left to the reader). 

Second, some configurations seem similar and will result in the same answer. For example, the following two configurations are indeed the same:

<pre>

.....  ..X..

.X...  ...X.

..X..  ...X.

..X..  ....X

...X.  .....

</pre>

The easiest way to use this is to shift each configuration to one of the corners as far as possible. With masks, this can be done easily:

<pre>

// mask represents initial configuration

// If there are no pieces in the first row, shift all pieces one row to the top.

while ((mask & 31) == 0)

	mask >>= 5;

int colMask = 0;

for (int i = 0; i < 5; i++)

	colMask |= (1 << (5 * i));

// Now colMask represents first cells in all rows.

// If there are no pieces in the first column, shift all pieces one column to the left.

while ((colMask & mask) == 0)

	mask >>= 1;

</pre>

Having those two optimizations implemented should be enough to make your solution run in time. 

See an example of java implementation below:

</li>



</ul>



<pre>

public class PiecesMover {

    int N, ans;

    boolean[][] data;

    HashSet<Integer> visit;

    Queue<Integer> q;

    public int getMinimumMoves(String[] board) {

        N = 5;

        data = new boolean[N][N];

        for (int i = 0; i < N; i++)

            for (int j = 0; j < N; j++)

                data[i][j] = board[i].charAt(j) == '*';

        ans = 10000;

        q = new LinkedList();



        int[] xx = {0, 0, 1, -1};

        int[] yy = {1, -1, 0, 0};

        visit = new HashSet<Integer>();

        add(data, 0, archive(data));

        while (!q.isEmpty()) {

            if (ans < 1000)

                break;

            int hash = q.poll();

            int time = q.poll();

            disarchive(hash);

            for (int i = 0; i < N; i++)

                for (int j = 0; j < N; j++)

                    if (data[i][j]) {

                        for (int k = 0; k < 4; k++) {

                            int x = i + xx[k];

                            int y = j + yy[k];

                            if (x >= 0 && x < N && y >= 0 && y < N && !data[x][y]) {

                                data[x][y] = true;

                                data[i][j] = false;

                                int t1 = (N - i - 1) * N + (N - j - 1);

                                int t2 = (N - x - 1) * N + (N - y - 1);

                                add(data, time + 1, hash - (1 << t1) + (1 << t2));

                                data[x][y] = false;

                                data[i][j] = true;

                            }

                        }

                    }

        }

        return ans;

    }

    void go(boolean[][] v, int[][] mark, int r, int c) {

        if (r < 0 || r >= N || c < 0 || c >= N || mark[r][c] != 0 || !v[r][c])

            return;

        mark[r][c] = 1;

        go(v, mark, r - 1, c);

        go(v, mark, r + 1, c);

        go(v, mark, r, c - 1);

        go(v, mark, r, c + 1);

    }

    boolean check(boolean[][] v) {

        int[][] mark = new int[N][N];

        for (int i = 0; i < N; i++)

            for (int j = 0; j < N; j++)

                if (v[i][j]) {

                    go(v, mark, i, j);

                    for (int i1 = 0; i1 < N; i1++)

                        for (int j1 = 0; j1 < N; j1++)

                            if (mark[i1][j1] == 0 && data[i1][j1])

                                return false;

                    return true;

                }

        return true;

    }

    void add(boolean[][] v, int t, int hash) {

        if (t >= ans)

            return;

        while (hash % (1 << N) == 0)

            hash >>= N;

        if (visit.contains(hash))

            return;            

        if (check(v)) {

            ans = t;

            return;

        }

        q.add(hash);

        q.add(t);

        visit.add(hash);

    }



// The following two methods convert a configuration of pieces to a mask and mask to a configuration.

    int archive(boolean[][] v) {

        int ans = 0;

        for (int i = 0; i < N; i++)

            for (int j = 0; j < N; j++)

                ans = (ans << 1) + (v[i][j] ? 1 : 0);

        return ans;

    }

    void disarchive(int code) {

        for (int i = N - 1; i >= 0; i--)

            for (int j = N - 1; j >= 0; j--) {

                data[i][j] = (code % 2) == 1;

                code /= 2;

            }

    }



}

</pre>



</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10095&amp;rd=13516" name="10095">CrazyBot</a></b> 

</font> 

<A href="Javascript:openProblemRating(10095)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524483" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      189 / 921 (20.52%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      140 / 189 (74.07%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>decowboy</b> for 483.52 points (5 mins 16 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      288.88 (for 140 correct submissions) 

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

      526 / 666 (78.98%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      513 / 526 (97.53%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>JongMan</b> for 246.09 points (3 mins 35 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      188.27 (for 513 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem, quite hard with a bit higher constraint, was pretty brute-forcable with short paths. 

Since at each step we choose one of 4 possible directions, the total number of paths of length 14 is 4^14 = 2^28. 

This is a bit too much for a 2-seconds limit, but we may significantly cut this number. 

For example, if the first two steps of a robot will be "EW", then the path is already non-simple and we 

can stop checking further steps. This trick cuts the number of paths to a reasonable number, so the very 

simple DFS will run well in time:

</p>

<pre>



public class CrazyBot {

    int N;

    double e, w, s, n, good;

    boolean[][] visit;

    public double getProbability(int n1, int east, int west, int south, int north) {

        N = n1;

        good = 0;

	// This array stores all points visitied by robot

        visit = new boolean[3 * N + 5][3 * N + 5];

        e = east / 100.;

        w = west / 100.;

        s = south / 100.;

        n = north / 100.;

        go(N + 2, N + 2, 0, 1.);

        return good;

    }

    void go(int x, int y, int step, double prob) {

// If we stay at the point which was already visited, then we stop checking this path. 

        if (visit[x][y])

            return;

// If we made N steps without visiting the same point twice, then we add the probability of this path to the answer.

        if (step >= N) {

            good += prob;

            return;

        }

// Mark this point as visited and continue into each of 4 directions.

        visit[x][y] = true; 

        go(x + 1, y, step + 1, prob * e);

        go(x - 1, y, step + 1, prob * w);

        go(x, y + 1, step + 1, prob * n);

        go(x, y - 1, step + 1, prob * s);

// Unmark the point when we checked all paths.

        visit[x][y] = false;

    }

}

</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=9834&amp;rd=13516" name="9834">RoadsOfKingdom</a></b> 

</font> 

<A href="Javascript:openProblemRating(9834)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524483" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      15 / 666 (2.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      2 / 15 (13.33%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ilyakor</b> for 495.24 points (38 mins 8 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      457.26 (for 2 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem has two solutions - one was intended for higher constraints and is discussed <a href="http://forums.topcoder.com/?module=Thread&threadID=627599#1039941">in forums</a>, and 

the other one will be explained here.

</p>

<p>

Rewording the problem statement, we are to find a probability that after the rain the remaining roads will form a tree connecting

all existing vertices. Since the problem is quite hard, we want to dissect the problem into smaller problems, 

and maybe those smaller problems will be either solvable or similar to the original one. 

</p>

<p>

"V and W are connected" means "cities V and W will still be connected by a road after the heavy rain."

Some other abbreviations to be used in this text:

<ul>

<li><b>P(S)</b> - the probability that, for a set S of cities, the roads connecting them will form a tree (a connected acyclic graph) after the rain.</li>

<li><b>Connected(S, V, X)</b>, where S is a set of vertices, V is a vertex and X is a subset of S - 

the probability that vertex V is connected to all vertices of X and not connected to any other vertex of S.</li>

<li><b>Disconnected(S1, S2)</b>, where S1 and S2 are sets of vertices - the probability that 

no vertex of S1 is directly connected to any vertex of S2.</li>

<li></li>

<li></li>

</ul>

</p>

<p>

Lets start from any vertex V from set S and see how it can be connected to other vertices if the graph is 'good' (i.e. - is a tree). 

Obviously, V must be connected to at least one other vertex. If there is exactly one such vertex W, then we reduced the problem

to a smaller size: <br/><b>P(S)</b> = <b>P(S - V)</b> * <b>ConnectedOnly(V, {W})</b>

</p>

<p>

Lets now see what happens if V is connected to at least 2 cities - W1 and W2. Then 

we can split set (S - V) into subsets S1 and S2 (S2 = S - V - S1), such that every vertex from (S - V) belongs to exactly one subset and 

the following conditions are satisfied. If we remove roads V-W1 and V-W2 from the graph, then:

<ol>

<li>

W1 belongs to S1, and each vertex from S1 is still (maybe indirectly) connected to any other vertex from S1.

</li>

<li>

W2 belongs to S2, and each vertex from S2 is still (maybe indirectly) connected to any other vertex from S2.

</li>

<li>

There is no path from W1 (and any other vertex in S1) to W2 (or any other vertex in S2). Proof: If such path 

W1 - A1 - ... - Ak - W2 exists, then path W1 - A1 - ... - Ak - W2 - V - W1 will form a cycle, contradicting the fact roads form a tree.

</li>

</ol>

We may notice that the shortest path (and the only simple path) from V to any vertex in S1 goes through W1, and 

any path from a vertex in S2 to V goes through W2.

The answer for this case is equal to <br/><b>P(S)</b> = <b>P(S1)</b> * <b>P(S2)</b> * <b>Connected(V, {W1, W2})</b> * 

<b>Disconnected(S1, S2)</b> = <br/> 

<b>P(S1)</b> * <b>P(S - V - S1)</b> * <b>Connected(V, {W1, W2})</b> * <b>Disconnected(S1, S - V - S1)</b> <br/>

We can check all possible ways to split S into two subsets S1 and S2, recursively find 

the values P(S1) and P(S2), and compute the total answer.

</p>

<p>

Similarly, if vertex V is connected to exactly k distinct vertices W1, W2, W3, then set S split into 3 subsets S1, S2, S3 

with properties similar to those mentioned above, and the answer will be:<br/>

<b>P(S)</b> = <b>P(S1)</b> * <b>P(S2)</b> * <b>P(S3)</b> * <b>Connected(V, {W1, W2, W3})</b> * 

<b>Disconnected(S1, S2)</b> * <b>Disconnected(S1, S3)</b> * <b>Disconnected(S2, S3)</b> <br/>



Unfortunately, checking all possible ways to split a set into 3 subsets will push our solution above time limit,

but we can avoid this. 

First, we may notice that <b>Disconnected(S1, S2)</b> * <b>Disconnected(S1, S3)</b> is equal to

<b>Disconnected(S1, S2 + S3)</b> = Disconnected(S1, S - V - S1). Therefore, the answer can be transformed to

<br/>

<b>P(S)</b> = <b>P(S1)</b> * <b>P(S2)</b> * <b>P(S3)</b> * <b>Connected(V, {W1, W2, W3})</b> * 

<b>Disconnected(S1, S - V - S1)</b> * <b>Disconnected(S2, S3)</b><br/>



One may notice that (<b>P(S1)</b> * <b>Disconnected(S1, S - V - S1)</b>) part is common for both previous cases, which 

allows us to develop the following algorithm:

</p>

<p>

If vertex V is connected to vertex W1, and S1 is the set of vertices which are connected to V through W1, then the answer for 

the set S is <br/>:

<b>P(S)</b> = <b>P(S1)</b> * Connected(S1, V, {W1}) * P(S - S1) * Disconnected(S - S1 - V, S1).<br/>

In other words, we compute the probability that all vertices from S1 are connected into a tree T1, that this tree is connected

to V by exactly one road, that all other vertices (see set S - S1) from S will form a tree T2 connected to V as well, and

that trees T1 and T2 will be connected through vertex V only.



</p>

<p>

The first version of the pseudo-code for this formula may look as the following (<b>prob[i][j]</b> is the probability that cities i and j are 

connected by a road after the heavy rain):

<pre>

double Connected(Set S, vertex V, Set X) {

	double answer = 1;

	for (all vertices W in S)

		if (V is in X)

			answer *= prob[V][W];

		else

			answer *= (1 - prob[V][w]);

	return answer;

}



double Disconnected(Set S1, Set S2) {

	double answer = 0;

	for (all vertices W1 in S1)

		for (all vertices W2 in S2)

			answer *= (1 - prob[W1][W2]);

	return answer;

}



double P(Set S) {

	if (S is empty or contains only 1 vertex)

		return 1;

	vertex V = any vertex from S

	double answer = 0;

	for (all non-empty subsets S1 from S not containing V)

		for (all vertices W1 in S1)

			answer += P(S1) * Connected(S1, V, {W1}) * P(S - S1) * Disconnected(S - S1 - V, S1).

	return answer;

}

</pre>



Of course, an implementation of this naive code will a) time out and b) count some possible tree more than once. 

For example, for an obvious input {"08", "80"} the algorithm will return 2 - because we can pick each of two vertices as V and the other will be W1.

To avoid problem b), we need to fix the way to select vertices V and W in method <b>P()</b>. 

The easiest way to do that is always pick only the vertex with the smallest index. Therefore, method <b>P()</b> 

changes to the following:

</p>



<pre>

double P(Set S) {

	if (S is empty or contains only 1 vertex)

		return 1;

	vertex V = vertex from S with the smallest index

	double answer = 0;

	vertex W1 = vertex from S with the smallest index (other than V).

	for (all non-empty subsets S1 from S not containing V and containing W1)

		answer += P(S1) * Connected(S1, V, {W1}) * P(S - S1) * Disconnected(S - S1 - V, S1).

	return answer;

}

</pre>



<p>

Now lets improve the speed of our method. It seems that we often check whether a vertex is connected to all vertices of 

some set S1 or not connected to any vertex of some set. Therefore, we can implement the following two methods:

</p>



<pre>

double connectedToAll(vertex V, set S) {

	double answer = 1;

	for (all vertices W in S)

		answer *= prob[W][V];

	return answer;

}



double notConnectedToAny(vertex V, set S) {

	double answer = 1;

	for (all vertices W in S)

		answer *= (1 - prob[W][V]);

	return answer;

}

</pre>



and reuse them in our <b>Connected()</b> and <b>Disconnected()</b> methods.

The final version of the solution will look as following (of course, the results of most our methods

can be memoized in some arrays, to avoid computing the same value more than once):



<pre>

double connectedToAll(vertex V, set S) {

	double answer = 1;

	for (all vertices W in S)

		answer *= prob[W][V];

	return answer;

}



double notConnectedToAny(vertex V, set S) {

	double answer = 1;

	for (all vertices W in S)

		answer *= (1 - prob[W][V]);

	return answer;

}



double Connected(Set S, vertex V, Set X) {

	double answer = 1;

	return connectedToAll(V, X) * notConnectedToAny(V, S - X);

}



double Disconnected(Set S1, Set S2) {

	double answer = 0;

	for (all vertices W1 in S1)

		answer *= notConnectedToAny(W1, S2);

	return answer;

}



double P(Set S) {

	if (S is empty or contains only 1 vertex)

		return 1;

	vertex V = vertex from S with the smallest index

	double answer = 0;

	vertex W1 = vertex from S with the smallest index (other than V).

	for (all non-empty subsets S1 from S not containing V and containing W1)

		answer += P(S1) * Connected(S1, V, {W1}) * P(S - S1) * Disconnected(S - S1 - V, S1).

	return answer;

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
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
