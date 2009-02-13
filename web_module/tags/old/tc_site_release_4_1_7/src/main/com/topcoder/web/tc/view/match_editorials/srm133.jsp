<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

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
<tc-webtag:forumLink forumID="505559" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 133</span><br>Wednesday, February 5, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p>It seems that SRM 131 was no exception, and that 400+ competitors in a SRM will become standard. The problem set was written by yours truly, thus any comments I make will definitely be biased - I wouldn't write a problem if I didn't think it was "good"! For a change though, no problem required dynamic programming. Instead two of the problems could be considered to be graph theory, although of different kind.</p>

<p>Division 1 contained two rather easy problems and one quite difficult, which only 5 people got successfully. A funny thing was that the top 4 scorers in Division 1 all competed in room 3 (<b>SnapDragon</b>, <b>bstanescu</b>, <b>antimatter</b> and <b>WishingBone</b>). The level of the Division 2 problems was fairly standard, maybe with a slightly harder level 1 problem than usual. Winner was first timer <b>mr_nice_guy</b>, who was not-so-nice to some of his roommates, delivering three successful challenges (and one failed).</p>
                             
<H1> The Problems </H1> 

<font size="+2"><b>Anonymous</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505559" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">300</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">177 / 239  (74.06%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">125 / 177  (70.62%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>coshx</b> for 289.97 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>This problem is pretty straightforward, although most likely a successful solution required more code than what was normal for a Division-II, Level 1 problem (hence it's 300 points).</p>

<p>First we need to find out the frequency of each letter in the headlines (not considering if it's upper or lower case). Thus we start by looping through all characters in all headlines, and update the frequency count for each letter (and ignore all space characters).</p>

<p>The second step is to loop through each message, and check if the frequency count of the letters is less (for each letter) than those in the headlines. This can be done in at least two ways:</p>

<ul>
<li>Make a backup copy of the frequency array and for each letter in a message decrease the frequency. If any frequency goes below 0, this message clearly can't be written.</li>
<li>Loop through all 26 letters, 'A' to 'Z', and for each letter verify that there are no more occurrences of that letter in the message than in all headlines. If this is true for all letters in a message, clearly this message can be written.</li>
</ul>

<font size="+2"><b>FEN</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505559" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">500</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">162 / 239  (67.78%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">142 / 162  (87.65%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>MisterZimbu</b> for 483.47 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>First, we don't really have to think of the input as a chess position.
All we should do is replace consecutive dots ('.') with the appropriate digit.
Since we should only consider consecutive dots on the same line, clearly we should process each line by itself, and make sure to add a slash ('/') between the lines in the output. The probably easiest way is to initialize a FEN string to the empty string and then add characters to it whenever we find a chess piece (plus the appropriate digits).</p>

<p>For each line we loop from left to right. We initialize a counter to 0 for each line - this counter represents how many dots we have seen so far on this line consecutively. If the next character on the line is a dot, we increase the counter and don't append anything to FEN string. Otherwise we have a piece at this square. Then we should first output the number of empty squares before this piece (that is, the counter) <i>if</i> this number is greater than 0, and then output the piece. Once we're finished with the line, we must also make sure to output the number of empty squares to the end of the line, if greater than 0.</p>

<font size="+2"><b>Internet</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505559" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-II, Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1000</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">46 / 239  (19.25%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">23 / 46  (50.00%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>mr_nice_guy</b> for 820.56 points</td></tr>
</table>
</blockquote>

Used as: Division-I, Level 2:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">450</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">113 / 141  (80.14%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">91 / 113  (80.53%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>WishingBone</b> for 439.93 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>A network of routers connected to each other is a typical example of a <i>graph</i>. A graph is a structure containing <i>vertices</i> (nodes) and <i>edges</i>, connecting the vertices with each other. In this problem, the routers are the vertices in the graph, and the connections are the edges.</p>

<p>The problem of finding the <i>articulation points</i> (also called cut-vertices) in a graph is a well-known one, and can be done quite efficiently. In this problem, efficiency is of no importance since the graph is so small (at most 50 vertices). The most straightforward solution is to loop through all vertices, remove it (and all edges connecting this vertex with another vertex), and check if the graph has now been split into at least two components. Actually, you don't have to explicitly remove a vertex, you can simply mark in a variable that a vertex is removed and abort whenever you reach it.</p>

<p>To check if the graph, after the removal of a vertex, is still connected (i.e. contains only one component) can be done by a graph search. We start at one vertex in the graph, then recursively visit neighbouring vertices. We must also make sure we don't visit the same vertex twice during this search; otherwise the search will never stop! If we, after this search is done, have visited all vertices (except the removed one), the graph is connected and the removed vertex is thus not an articulation point.</p>

<p>There is no need to store the graph in some special data structure. When we do
the search, we can parse the neighbouring vertices directly from the string corresponding to that router, like this:</p>

<pre>
<b><i>Java:</i></b>

boolean visited[50];
int removed_router;

void search(int current, String[] routers)
{
    if (visited[current]) return;
    if (current==removed_router) return;
    visited[current]=true;
    String[] links=routers[current].split(" ");
    for(int i=0;i&lt;links.length;i++)
        search(Integer.parseInt(links[i]),routers);
}

<b><i>C++:</i></b>

bool visited[50];
int removed_router;

void search(int current, vector&lt;string&gt; &amp;routers)
{
    if (visited[current]) return;
    if (current==removed_router) return;
    visited[current]=true;
    stringstream s(routers[current]);
    int n;
    while (s &gt;&gt; n)
        search(n,routers);
}
</pre>

<font size="+2"><b>RemoveDigits</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505559" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 1:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">300</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">129 / 141  (91.49%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">93 / 129  (72.09%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>cruizza</b> for 293.40 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>There are several possible ways to solve this problem, and you can easily make a mistake, which challenge phase proved. One method, which was partly explained in the first example in this problem, is to collect the larger digits in the front of the new number. Since the final number will always have the same number of digits (|n|-m) no matter which digits we remove, a number starting with a 9 will always be greater than an number starting with an 8, even if we have to remove many more digits to get the 9 in front. This idea gives the following algorithm:</p>

<pre>
  Let <i>x</i> be the position of the largest digit (<i>y</i>) among the first <i>m</i>+1 digits
    (in case of a tie, select the leftmost digit)
  Remove <i>x</i> digits so we get <i>y</i> in the front.
</pre>

<p>After this we should consider maximizing the next digit, but
now we only have <i>m</i> - <i>x</i> removals left. This is a smaller instance of the same
problem, so we can simply call the method again with the new parameters!
A recursive function must always have a termination condition, and in this
case it is if <i>m</i> = |<i>n</i>|, in which case we should remove all remaining digits.
The whole code becomes like this:

<pre>
<b><i>C++:</i></b>

string maxNumber(string n, int m) {
    if (m==n.size()) return "";
    char *p=max_element(&amp;n[0],&amp;n[m+1]);
    return *p+maxNumber(string(p+1,&amp;n[n.size()]),m-(p-&amp;n[0]));
}
</pre>
</p>

<p>A completely different solution is to solve the easier problem
"Remove one digit so the remaining number is maximized" <i>m</i> times. This
can be done with two nested loops, the outer loop decreasing m until 0
and the inner loop testing removing all digits, and keep track of
which number is the greatest. The pseudocode could look like this:</p>

<pre>
loop m times
    largest=0
    for each position i in n
        s=n
        remove digit at position i in s
        if s>largest
            largest=s
    end loop
    n=largest
end loop
</pre>

<p>This solution can also be optimized: You don't actually have to try remove all digits in the inner loop and then compare with the best found so far. Instead it's enough to find where the non-increasing sequence of digits ends, starting from the left. For instance, if we want to remove one digit from the number 9987776544338138327, we start at the beginning and step ahead until the next digit is greater than the previous digit - this happens after the two 3's. Removing the last digit in the non-increasing sequence of digits will <i>always</i> create the biggest number. This is because such a removal will increase the digit at that position (the position where the 3 was will in the case be replaced with the 8), and it's not possible to increase a digit at a position more to left than this. Increasing a digit in a position to the right will always result in a smaller number.</p>


<font size="+2"><b>SlidingGame</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505559" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division-I, Level 3:

<blockquote>
<table cellspacing="2">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1100</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">7 / 141  (17.00%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">5 / 7  (41.18%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>SnapDragon</b> for 615.10 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>Given a puzzle containing 8 pieces, calculate the fewest number of moves required to reach a goal configuration starting at a start configuration. This can be seen, again, as a graph problem where each vertex in the graph is a configuration of the bricks and an edge is a legal move between two configurations. While it is possible to build the actual graph explicitly as it contains "only" 24240 vertices (and each vertex has at most 8 edges) and then perform a shortest-path search (using breadth-first search), this is unnecessary. Instead we can just directly perform the search on the configurations, like this:</p>

<pre>
int solve(start,goal)
    add start to queue
    include start in set of visited configurations
    while queue is not empty
        x=front element of queue
        pop front element of queue
        for each neighbour y to x
            if y is not in set of visisted configurations
                add y to queue
            include y in set of visited configurations
        end
      end
      if goal is not in set of visited configurations
          return -1
    return distance to goal
end
</pre>

<p>The distance is simply kept as an extra attribute in the set of visited
configurations. This set can be implemented using either
set/map (C++) or HashSet/HashMap (Java). Now, this is all very straightforward
and I'm sure most Division-I competitors have done similar searches many times.
The "nasty" part of the problem is how to store the configurations. We must not
only be able to generate all neighbours from a configuration, but also
find configurations that are identical even though the actual symbols representing
the pieces may differ. Luckily, there is an elegant solution to all this: bitmasks.</p>

<p>Instead of representing a configuration as a set of coordinates for
the pieces, which makes finding legal moves a cumbersome checking procedure,
each piece can be represented as an integer using 16 bits. Each bit
correspond to one square in the frame, the first 4 bits being the upper row:</p>

<pre>
  0  1  2  3
  4  5  6  7
  8  9 10 11
 12 13 14 15
</pre>

<p>A piece occupying squares 1 and 5 would correspond to the integer
which has bits 1 and 5 set (that is, 2<sup>1</sup> + 2<sup>5</sup> = 34).
Moving a piece in either direction requires only a shift, for instance
moving left requires shifting one step to the left, moving down four steps
to the right etc. Before moving, we must also check that the piece
doesn't touch the edge, which is done with bitmasking. For instance,
we can't move the piece to the right if it already occupies one of the
squares 3, 7, 11 or 15, so we <i>mask</i> the piece integer with
2<sup>3</sup> + 2<sup>7</sup> + 2<sup>11</sup> + 2<sup>15</sup>. If
the answer is 0, the piece does not occupy any of these squares.
Finally, we must make sure the piece doesn't end up on top of any other
piece, which is checked by masking the new piece location with the positions
of all other pieces.</p>

<p>The configuration can thus be represented as an array of 8 integers.
A "bonus" with this is that you can simply sort this array of integers
to get a representative of this configuration, and thus avoid the problem
with finding identical configurations! That is, after sorting, all identical
configurations will contain the same elements in the array in the same order.</p>

<p>
<img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="269554" context="algorithm"/><br />
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
