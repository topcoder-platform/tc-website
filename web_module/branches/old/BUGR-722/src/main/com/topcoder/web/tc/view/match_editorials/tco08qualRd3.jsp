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
    <A href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&amp;rd=12058">Match Overview</A><br />
    <tc-webtag:forumLink forumID="519586" message="Discuss this match" />
</div>
<span class="bodySubtitle">2008 TopCoder Open<br />Qualification Round 3</span><br />Wednesday, February 13, 2008<br />(rescheduled from Tuesday, February 12, 2008)
<br /><br />



<h2>Match summary</h2> 

<p>1051 coders fiercely competed for their last chance to advance to round 1 in the final qualification match of the 2008 TCO.  The match was won by <tc-webtag:handle coderId="15718818" context="algorithm"/> with fast submissions on all three problems and no help from the challenge phase.  Second place went to
<tc-webtag:handle coderId="16125061" context="algorithm"/> who was aided by two challenges, and <tc-webtag:handle coderId="15094447" context="algorithm"/> rounded out the top 3.  Special recognition goes to division 2 coder <tc-webtag:handle coderId="22685475" context="algorithm"/>, who finished 5th place in a difficult field of competitors.</p>

<p>The problem difficulties seemed to lie somewhere in between the first and second qualification rounds, with a fast easy being enough to advance to round 1.  However, some competitors were caught off-guard with a medium
that required some algorithmic knowledge, while over 120 people solved the hard problem, which required more brains than fast fingers.</p>

 

<H1> 

The Problems 

</H1>


<font size="+2"> 

<strong><a href="/stat?c=problem_statement&amp;pm=8098&amp;rd=12058" name="8098">SquareConstruction</a></strong> 

</font> 

<A href="Javascript:openProblemRating(8098)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519586" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      250 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      958 / 1040 (92.12%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      917 / 958 (95.72%)  

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>hysramp</strong> for 247.28 points (2 mins 59 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      194.24 (for 917 correct submissions)  

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem can be solved with a simple simulation.  That is, we just iterate through positions as described in the problem statement, making sure that we correctly "wrap around" the edges of the square if necessary.  While Java,
C#, and VB  users can simply concatenate numbers together to form a string for a return element, C++ uses must either make use of the sprintf() function or stringstreams.
A C++ solution to this problem follows:
<pre>
int grid[11][11];

vector &lt;string&gt; SquareConstruction::construct(int N, int a, int b, int c, int d) {
    int y = 0, x = 0;
    int idx = 1;
    memset(grid, -1, sizeof(grid));
    grid[y][x] = idx++;
    //simulate the process
    while (true) {
        y = (y + a) % N; x = (x + b) % N;
        if (grid[y][x] == -1) grid[y][x] = idx++;
        else {
            y = (y + c) % N; x = (x + d) % N;
            if (grid[y][x] == -1) grid[y][x] = idx++;
            else break;
        }
    }
    //format the result
    vector&lt;string> ret;
    for (int i = 0; i &lt; N; i++) {
        stringstream s;
        for (int j = 0; j &lt; N; j++) {
            s &lt;&lt; grid[i][j];
            if(j + 1 &lt; N) s &lt;&lt; ' ';
        }
        ret.push_back(s.str());
    }
    return ret;
}
</pre>

</p>

<font size="+2"> 

<strong><a href="/stat?c=problem_statement&amp;pm=7643&amp;rd=12058" name="7643">CableDonation</a></strong> 

</font> 

<A href="Javascript:openProblemRating(7643)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519586" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      533 / 1040 (51.25%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      339 / 533 (63.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>hysramp</strong> for 476.46 points (6 mins 22 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      312.19 (for 339 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The crucial observation that allows us to solve this problem is found by realizing that after all the extra cable is removed, we're left with the minimum amount of cable that keeps our rooms connected.
Those familiar with graph theory will recognize this as the classic minimum spanning tree (aka MST) problem.  That is, given a graph, we wish to find the set of edges with minimum weight such that every
vertex can reach every other vertex through some path.  It's trivial to prove that such a subgraph will not contain any cycles (assuming all edge weights are positive); thus the resulting subgraph will be a tree that connects
each pair of vertices via some path (such a tree is known as a spanning tree).  Our answer is then the sum of the edge weights in the input graph minus the sum of the weights of the MST.<br /><br />

The simplest algorithm to grasp to solve this problem is Kruskal's algorithm, which works as follows:
<pre>
1) while there are two vertices that are not connected by some path, do
2)   find an edge of minimum weight that connects two vertices that are not connected by some path
3)   add this edge to the minimum spanning tree
4) end
</pre>

While this algorithm can be implemented to have a much better time complexity, there is a very simple to implement and understand O(N^4) way to implement this algorithm, which works as follows:
<pre>
Define C[i][j] be 1 if vertex i is connected (directly or indirectly) to vertex j in the subgraph generated 
so far, and 0 otherwise.  All C[i][j] are initialized to be 0.
1) while there are two vertices such that C[i][j]=0, do
2)   find an edge of minimum weight that connects two vertices (call them i and j) such that C[i][j]=0
3)   add this edge to the minimum spanning tree
4)   let C[i][j]=C[j][i]=1
5)   Use Floyd-Warshall's algorithm to update the C[i][j]'s, so that each pair of vertices a,b that are indirectly connected have C[a][b]=1
6) end
</pre>

Note that any MST will have exactly n-1 edges, so if the outer-while loop of our algorithm terminates in less than n-1 iterations, then there is no MST, and we should return -1.
In the above algorithm, Floyd-Warshall's algorithm is a simple algorithm that computes the all-pairs shortest paths of a graph, and can be read about <a href="/tc?module=Static&d1=tutorials&d2=graphsDataStrucs3">here</a>.  Note
that we also could have used a simple depth-first search to update the C[i][j]'s.  A complete C++ implementation of this approach follows:
<pre>
int graph[51][51];
bool C[51][51];
const int BIG=1000000;

int CableDonation::cable(vector &lt;string&gt; g) {
    int n = g.size(), sum = 0;
    //initialize the graph to not contain any edges
    for(int i = 0; i &lt; n; i++) for(int j = 0; j &lt; n; j++) graph[i][j]=BIG;
    
    for(int i = 0; i &lt; n; i++) for(int j = 0; j &lt; n; j++) {
        //if an edge is present, update our graph
        if (g[i][j] == '0') continue;
        if (islower(g[i][j])) graph[i][j] = g[i][j] - 'a' + 1;
        if (isupper(g[i][j])) graph[i][j] = g[i][j] - 'A' + 27;
        sum += graph[i][j];
    }
    
    int mst = 0;
    int added = 0;
    //keep adding edges if possible.
    while (true) {
        int a = -1, b = -1, small = BIG;
        //find the edge of minimum weight that connects two "unconnected" vertices
        for (int i = 0; i &lt; n; i++) for (int j = 0; j &lt; n; j++) if(i != j &amp;&amp; C[i][j] == 0)
            if (graph[i][j] &lt; small) {
                small = graph[i][j];
                a = i; b = j;
            }
            
        if (small == BIG) break;
        added++;
        mst += small;
        
        //these vertices are now connected
        C[a][b] = C[b][a] = 1;
        //use floyd-warshall to update the C[i][j]'s
        for (int k = 0; k &lt; n; k++) for (int i = 0; i &lt; n; i++) for (int j = 0; j &lt; n; j++) C[i][j] |= C[i][k] &amp; C[k][j];
    }
    if (added != n - 1) return -1;
    else return sum - mst;
}
</pre>

Note that it is possible to implement Kruskal's algorithm in O(E log V) time.  There is another algorithm called Prim's algorithm (which is very similar to Dijkstra's algorithm) that can also be implemented in O(E log V) time.

</p>

<font size="+2"> 

<strong><a href="/stat?c=problem_statement&amp;pm=8018&amp;rd=12058" name="8018">EvenOnes</a></strong> 

</font> 

<A href="Javascript:openProblemRating(8018)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=519586" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br /> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Value</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1000 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Submission Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      175 / 1040 (16.83%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Success Rate</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      122 / 175 (69.71%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>High Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>nevenastan</strong> for 940.57 points (7 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <strong>Average Score</strong> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      650.07 (for 122 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

This problem involved very little coding, as the main challenge to overcome was figuring out the mathematical logic behind it.  The first thing we may wonder is why the input always consists of an odd number of rows and columns.
One important property that this restriction gives us is that if we, say, perform a move on a particular row, then the parity of the ones and zeros in that row is always changed, and the same holds for performing a move on a particular column.
When we talk about the parity of ones or zeros, we mean the property that the number of ones or zeros in a row or column is even or odd.  From this property, we have two important observations:<br />
<ul>
<li>If we perform a move on row i, the parity of ones in row i is changed, and the parity of ones and zeros in <em>every</em> column is changed.</li>
<li>If we perform a move on column j, the parity of ones in column j is changed, and the parity of ones and zeros in <em>every</em> row is changed.</li>
<li>If we perform an even number of moves on the set of rows, then the parity of ones and zeros in <em>every</em> column remains unchanged, otherwise it is changed.</li>
<li>If we perform an even number of moves on the set of columns, then the parity of ones and zeros in <em>every</em> row remains unchanged, otherwise it is changed.</li>
</ul>

Now, let's define the number of rows with an even number of ones as Gr (good rows), the number of rows with an odd number of ones as Br (bad rows), the number of columns with an even number of ones as Gc (good columns), and the number 
of columns with an odd number of ones as Bc (bad columns).  Also assume that there are N rows and M columns in our grid.  We have two possible ways of making the partity of ones in the rows and columns to be even:<br /><br />

First, we can perform moves on every bad row.  If Br is even, then after performing our moves on the bad rows, the parity of ones in all the columns remains constant.  Now we complete our task by performing moves on every bad column, and the total number of moves required is Br + Bc.
However, if Br is odd, then the partity of ones in all the columns will change after performing the moves on the bad rows.  Thus, all the good columns become bad columns, and vice-versa.
Therefore we must perform moves on all the originally good columns, and the total number of moves required is Br + Gc.<br /><br />

The other possible solution is to perform moves on every good row.  If Gr is even, then after performing our moves on the good rows, the parity of ones in all the columns remains constant similar to the above.
We again complete the task by performing moves on every bad column, and the total number of moves required is Gr + Bc.  However, if Gr is odd, then the partity of ones in all the columns will change after performing the moves on the good rows,
so all the good columns become bad columns, and vice-versa.  Therefore we must perform moves on all the good columns, and the total number of moves required is Gr + Gc.<br /><br />

Of course, there may be situations where after performing the required operations on the chosen rows and columns, that the resulting grid could still have some row or column with an odd number of ones.  However, it can be shown that
this situation can never happen, so we will never return -1.  The proof of this fact is left as an exercise to the reader (hint: <font color="white">consider a case-by-case analysis and a proof by contradiction</font>).  A sample C++ solution to this problem follows:
<pre>
int EvenOnes::minOperations(vector &lt;string&gt; mat) {
    int badrow = 0, badcol = 0;
    int n = mat.size(); int m = mat[0].size();
    
    //get number of bad rows
    for (int i = 0; i &lt; n; i++) {
        int ones = 0;
        for (int j = 0; j &lt; m; j++) if (mat[i][j]=='1') ones++;
        if (ones % 2 == 1) badrow++;
    }
    
    //get number of bad cols
    for (int i = 0; i &lt; m; i++) {
        int ones = 0;
        for (int j = 0; j &lt; n; j++) if (mat[j][i] == '1') ones++;
        if (ones % 2 == 1) badcol++;
    }
    int a = 0, b = 0;
    //choose bad rows
    a = badrow;
    if (badrow % 2 == 1) a += m - badcol;
    else a += badcol;
    
    //choose good rows
    b = n - badrow;
    if ((n - badrow) % 2 == 1) b += m - badcol;
    else b += badcol;
    
    return min(a, b);
}
</pre>
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/eleusive_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8369955" context="algorithm"/><br />
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
