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
    <A href="/stat?c=round_overview&er=3&rd=10783">Match Overview</A><br />
    <tc-webtag:forumLink forumID="516064" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 367</span><br />Wednesday, September 26, 2007
<br /><br />



<h2>Match summary</h2> 

<p>
In both divisions coders were faced by a quite balanced problem set. Almost all of the problems provided pretty good challenge opportunities.
</p> 

<p>
In Division 1 <tc-webtag:handle coderId="22641658" context="algorithm"/> took the lead after the coding phase and stayed on the top until
the system testing.
But his success rate   (especially on the problems of the hard category) confirmed its relevance, and he fell from the much-desired first place.
Only 13 solutions of the hard problem passed the system tests, thus fortune rewarded good challengers and fast coders.
<tc-webtag:handle coderId="19849563" context="algorithm"/> won the match,
<tc-webtag:handle coderId="7390224" context="algorithm"/> finished second, and
third place went to <tc-webtag:handle coderId="7421158" context="algorithm"/>.
</p>

<p>
Spectators saw plenty of failed solutions in Division 2 as well. The number of failed solutions of the medium and hard problem was quite large; in some rooms, it
was even possible to take the lead without a correct solution of the hard problem, as long as you had plenty of challenges.
<tc-webtag:handle coderId="22376958" context="algorithm"/> took first place without any challenges at all,
thanks to a pretty high score on all of the problems.
<tc-webtag:handle coderId="10527338" context="algorithm"/> finished second with 3 successful challenges, with newcomer <tc-webtag:handle coderId="22691839" context="algorithm"/> in third.
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8204&amp;rd=10783" name="8204">WhiteCells</a></b> </font> <A href="Javascript:openProblemRating(8204)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516064" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      681 / 706 (96.46%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      672 / 681 (98.68%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>catcher</b> for 249.42 points (1 mins 22 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      226.13 (for 672 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
All the rows of a chessboard divide into two categories: even and odd.
Within an even row, all cells located in even columns are white, while all
that are in odd columns are black. Within an odd row, all white cells are
located in odd columns, while blacks are in an even columns.
Thus, the cell is black if and only if its row and column numbers have the same parity.
<br>
So, it is possible to iterate over all cells and count the number
of occupied whites. An alternative approach is to iterate only over
white cells. This idea is implemented in the C++ listing below:
</p>

<pre>
struct WhiteCells {
    int countOccupied(vector &lt;string&gt; board) {
        int ret = 0;
        for (int i = 0; i < board.size(); i++)
            // j must have the same parity as i
            for (int j = i % 2; j < board[i].size(); j += 2)
                if (board[i][j] == 'F') ret++;
        return ret;
    }
};
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8181&amp;rd=10783" name="8181">ObtainingDigitK</a></b>
</font>
<A href="Javascript:openProblemRating(8181)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516064" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      630 / 706 (89.24%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      233 / 630 (36.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>winterflame</b> for 493.78 points (3 mins 11 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      362.17 (for 233 correct submissions) 
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
      589 / 597 (98.66%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      419 / 589 (71.14%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>cep21</b> for 249.21 points (1 mins 36 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      220.39 (for 419 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This task asked coders to find the minimal possible number <b>x</b> that could be added to the given number <b>a</b>
in such a way that their sum <b>(a + x)</b> contains at least one instance of a given digit <b>k</b>.
</p>

<p><strong>Approach 1 - Brute-force</strong><br />
Let's brute-force <b>x</b> starting from 0 and check if <b>(a + x)</b> contains digit <b>k</b>.
This idea looks very simple, but don't forget that <b>a</b> may not fit in 64-bit integer.
Java users are strongly aided by BigInteger class, but it is not much trouble for others
to implement a function that increments a long number by one (actually it's enough, because when
we increment <b>x</b>, we can use the already calculated <b>(a + x - 1)</b> to obtain <b>(a + x)</b>).
</p>

<p><strong>Approach 2 - Examining cases</strong><br />
Let <b>d</b> be the least significant digit of <b>a</b> and <b>d'</b> be the least significant digit of <b>a + x</b>.
It's obvious that <b>x</b> can't be more than 9, because we make <b>d'</b>
to have any value (from 0 to 9, inclusive) using <b>x &le; 9</b>.
<br>
The first thing to do is to check if <b>a</b> already contains a digit <b>k</b>,
in this case the answer is 0.
Then, if <b>d</b> is less than or equal to <b>k</b>, then <b>x = k - d</b>.
<br>
Otherwise, we need to find the digit to the left from <b>d</b>, skipping all the nines. Let's call this digit <b>z</b>.
For example, if <b>a = 12399997</b>, then <b>d = 7</b> and <b>z = 3</b>.
If <b>a = 997</b>, we can treat it as <b>0997</b>, thus <b>z = 0</b> in this case.
<br>
Now, let's examine <b>z</b>: if it is equal to <b>k + 1</b>, then <b>x = 10 - d</b>, because
using this <b>x</b>, the digit in position of digit <b>z</b> increments by one and becomes equal to the desired value <b>k</b>.
<br>
In the other case the answer is <b>10 + k - d</b> (raising <b>d</b> to <b>k</b>).
<br>
As you can see, this approach requires much more thinking the the previous one.
Moreover, if the coder will not notice at least one of the mentioned cases, his solution will most probably fail.
</p>

<p>
Most Division 1 coders used the first approach, thus avoiding a lot of pitfalls.
Many Division 2 coders, however, ran into problems by using the second approach.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=8212&amp;rd=10783" name="8212">ProgrammingDevice</a></b>
</font>
<A href="Javascript:openProblemRating(8212)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516064" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      286 / 706 (40.51%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      48 / 286 (16.78%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>espr1t</b> for 841.98 points (12 mins 48 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      527.09 (for 48 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The first thing to do here is to realize that we must send full packets only, because (in contrast to div 1 medium)
we need to minimize the number of packets, but not anything else. Also, we need to realize that there is no reason to
send any unimportant bytes (which don't belong to any of the given pieces) in the beginning of the packet, i.e. each
packet must begin with an important byte.
The second is to sort all the given pieces in ascending order of their offsets.
Once the mentoined sorting is done, we can easily iterate over pieces in the "from left to right" order
and greedily send as much data by one packet as possible. In order to fit under the 2 second running time
we need to use the following trick: determine the number of packets necessary to entirely cover the current piece,
and treat them all at once (which leads to O(n ^ 2) complexity, where n is the number of pieces) .
The desired number can be obtained by dividing the amount of unsent bytes of the current piece
by the maximal allowed size of the packet, rounding the result to the up.
<br>
<br>
C++ code follow:
</p>

<pre>
struct ProgrammingDevice
{
    int minPackets(vector &lt;int&gt; offset, vector &lt;int&gt; size, int maxData) {
        // pos - position of the first (leftmost) non-sent important byte
        long long pos, k;
        int ret = 0, n, i, j;
        n = offset.size();
        // sort pieces
        for (i = 0; i &lt; n; i++) for (j = i + 1; j &lt; n; j++)
            if (offset[i] &gt; offset[j]) {
                swap(offset[i], offset[j]);
                swap(size[i], size[j]);
            }
        i = 0; // begin from the leftmost piece
        // set the pos equal to the first important byte
        pos = offset[0];
        // process until all important bytes are sent
        while (pos &lt; offset[n - 1] + size[n - 1]) {
            // k - the number of packet neccessary tosend in order
            // to cover whole the current piece i
            k = (offset[i] + size[i] - pos + maxData - 1) / maxData;
            ret += k;
            // always send a full packets
            pos += maxData * k;
            // find the leftmost piece which is not entirely sent yet
            for (; i &lt; n; i++) if (pos &lt; offset[i] + size[i]) break;
            // skip all contiguous unimportant bytes located to the left of the piece i
            if (i &lt; n && pos &lt; offset[i]) pos = offset[i];
        }
        return ret;
    }
};
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7810&amp;rd=10783" name="7810">DeviceProgramming</a></b>
</font>
<A href="Javascript:openProblemRating(7810)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516064" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      313 / 597 (52.43%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      190 / 313 (60.70%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bmerry</b> for 480.61 points (5 mins 45 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      290.50 (for 190 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Both approaches to solving this one are based on the idea of dynamic programming and assume that
pieces are previously sorted in ascending order of their offsets.
The following symbols are used:</p>
<ul>
<li><b>n</b> - the number of pieces</li>
<li><b>m</b> - the maximal number of contiguous bytes that can be sent in one packet, i.e. <b>m = maxPacket - overhead</b></li>
<li><b>dp</b> - the array, which contains the answers for DP subproblems</li>
</ul>

<p><strong>Approach 1</strong><br />
The DP state is <b>(i, j)</b>, where <b>i</b> is the index of the current piece and <b>j</b> is the position in this piece
(all bytes to the left of this position are already sent, while all the others did not).
The starting state is (0, 0). <b>dp[i][j]</b> contains the amount of bytes neccessary to send all important bytes
(a byte is important if it belongs to some of the pieces) located to the right of the <b>j</b>-th byte of the <b>i</b>-th piece and this byte itself too.
Let's determine what is the maximal number of full packets, containing the bytes
starting from the <b>j</b>-th byte of the current piece only, we can send. It is equal to <b>(size[i] - j) / maxData</b> (rounding down).
Once we have sent these packets, the <b>j</b> has been changed.
Now, there are <b>O(n)</b> possible moves. We must try to move to all states <b>(k, 0)</b>, where <b>i &lt; k &lt; n</b>,
which are reachable from the current state within one packet. Actually the state <b>(k, 0)</b> is reachable from the state
<b>(i, j)</b> if <b>offset[i] + j + m >= offset[k - 1] + size[k - 1]</b>.
Thus, complexity of the described algorithm is <b>O(n * m * n)</b>.
</p>

<p><strong>Approach 2</strong><br />
The state is <b>i</b>, where <b>i</b> is the index of the current piece.
<b>dp[i]</b> contains the answer for the subproblem, considering only <b>i</b> leftmost pieces.
As an initial value of <b>dp[i]</b> for each <b>0 &le; i &lt; n</b>
we try to send all bytes from the leftmost byte of the piece 0 to the last byte of the <b>i</b>-th piece,
inclusive (greedily packing these bytes into packets), possible including unimportant bytes which may lie between them.
There are <b>O(n)</b> possible moves from state <b>i</b>: to states <b>j</b>, where <b>0 <= j < i</b>.
A move is always possible each time we send all the bytes from the leftmost byte of the <b>i</b>-th piece
to the rightmost byte of the <b>j</b>-th piece, inclusive (greedily packing bytes into packets), and add <b>dp[j]</b>.
</p>

<p>
Java code of the very elegant solution by <tc-webtag:handle coderId="10481120" context="algorithm"/> illustrates the second approach:
</p>

<pre>
public class DeviceProgramming {
    public long getSize(long maxPacketSize, long overhead, long size) {
        long maxInfo = maxPacketSize - overhead;
        long packetsNeeded = (size % maxInfo == 0 ? size / maxInfo : size / maxInfo + 1);
        return size + packetsNeeded * overhead;
    }

    public long minBytes(int[] offset, int[] size, int maxPacketSize, int overhead) {
        int N = offset.length;
        int[] st = new int[N], fn = new int[N];
        for (int i=0; i &lt; N; i++) {
            st[i] = offset[i]; // beginning of the piece
            fn[i] = offset[i] + size[i] - 1; // end of the piece
        }
        // sort the pieces
        for (int i=0; i+1 &lt; N; i++)
            for (int j=0; j+1 &lt; N; j++)
                if (st[j] &gt; st[j+1]) {
                    int tmp = st[j]; st[j] = st[j+1]; st[j+1] = tmp;
                    tmp = fn[j]; fn[j] = fn[j+1]; fn[j+1] = tmp;
                }
        long[] F = new long[N];
        for (int i=0; i &lt; N; i++) {
            // calculate the initial answer
            F[i] = getSize(maxPacketSize, overhead, fn[i] - st[0] + 1);
            for (int j=1; j &lt;= i; j++)
                // try to move to state j
                F[i] = Math.min(F[i], F[j-1] + getSize(maxPacketSize, overhead, fn[i] - st[j] + 1));
        }
        return F[N-1];
    }
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7816&amp;rd=10783" name="7816">WSNParentsAssignment</a></b>
</font>
<A href="Javascript:openProblemRating(7816)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516064" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      60 / 597 (10.05%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 60 (21.67%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 695.05 points (20 mins 50 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500.04 (for 13 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This is a max flow problem. There is a wireless sensor network (WSN) graph shown in figure 1 and its corresponding flow-graph in figure 2.
</p>

<p align="center"><img src="/i/education/srm367_1.png" align="top" /><img src="/i/education/srm367_2.png" /></p>

<p>
Vertices of the WSN-graph are devices and a control center of the WSN. Edge from vertex <b>i</b> to vertex <b>j</b> exists if and only if
the device corresponding to vertex <b>i</b> can transmit data directly to the device corresponding to vertex <b>j</b>.
Edge from the vertex <b>i</b> to the vertex, corresponding to the control center, exists if and only if the device corresponding
to vertex <b>i</b> can trasmit directly to the control center.
Building a flow-graph is a much more sophisticated task. It requires accomplishing the following steps (assuming that the flow-graph is initially empty):
<ol>
<li>Add <b>source</b> and <b>sink</b> vertices;</li>
<li>For each device add two vertices: "left half" and "right half";</li>
<li>For each device add an edge from its "right half" to the <b>sink</b> of capacity 1;</li>
<li>For each device, which can transmit directly to the control center, add an edge from <b>source</b> to its "right half" of capacity 1;</li>
<li>For each pair of devices <b>i</b> and <b>j</b>, if device <b>i</b> can transmit directly to device <b>j</b>, add an edge from
the "left half" of device <b>j</b> to the "right half" of device <b>i</b> of capacity 1;</li>
<li>For each device add an edge from <b>source</b> to its "left half" of capacity <b>k</b>.</li>
</ol>
Here <b>k</b> is a desired network's burden level. Minimal possible network's burden level can be found using a search (it may be a binary search
or just a straight-forward bruteforce) over <b>k</b>, the network's burden level can be equal to <b>k</b> if and only if a maximal flow
in the corresponding flow-graph is equal to <b>n</b>, where <b>n</b> is a number of devices in the WSN.
</p>

<p>
Once the minimal network's burden level is found, the parents vector should be built. This task can be solved by greedy algorithm combined with
a brute-force. Iterate over the device in ascending order of their indices and find the minimal possible index of its parent, which leads
to the minimal network's burden level equal to the previously found minima, using a brute-force. Once it is declared that device <b>j</b>
is the parent of device <b>i</b>, edge from the "right half" of device <b>i</b> should be removed and the capacity of the edge from
the "left half" of device <b>j</b> to the "right half" of device <b>i</b> should be decreased by 1.
</p>

<br /><br />



<div class="authorPhoto">
    <img src="/i/m/gevak_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7340263" context="algorithm"/><br />
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
