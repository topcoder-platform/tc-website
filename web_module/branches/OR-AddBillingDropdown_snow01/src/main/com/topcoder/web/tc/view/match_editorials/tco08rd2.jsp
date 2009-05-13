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
    <A href="/stat?c=round_overview&amp;er=5&amp;rd=12012">Match Overview</A><br />
    <tc-webtag:forumLink forumID="519799" message="Discuss this match" />
</div>
<span class="bodySubtitle">2008 TopCoder Open<br />Online Round 2</span><br />Saturday, February 23, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
The second round of this year's TopCoder Open used a rather easy problemset. More than 80 coders
scored more than 1,000 points each. However, many top rated coders overlooked a tricky case in
the hard problem. Some of the "big names" later discovered the case and resubmitted their solutions.
The random numbers generator slightly influenced this round as well, by putting five targets into a single
room.
</p> 

<p>
Also during the challenge phase the top spot in the rankings often changed. After the system tests
it belonged to <tc-webtag:handle coderId="15881985" context="algorithm"/>. The next four spots were
claimed by 
<tc-webtag:handle coderId="15764636" context="algorithm"/>,
<tc-webtag:handle coderId="7442498" context="algorithm"/>,
<tc-webtag:handle coderId="15117368" context="algorithm"/>,
and 
<tc-webtag:handle coderId="22675094" context="algorithm"/>.
All four of them reached their new highest rating after this match.
</p>

<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8599&amp;rd=12012" name="8599">OneWayStreets</a></b> 

</font> 

<A href="Javascript:openProblemRating(8599)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=519799" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      702 / 824 (85.19%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      513 / 702 (73.08%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 247.69 points (2 mins 45 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      196.95 (for 513 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
The problem statement can be rephrased as follows: Given a graph
with both directed and undirected edges, is it possible to pick
directions for the undirected edges so that the resulting graph
will contain no cycles?
</p>

<p>
One important observation about this problem could be made by analyzing
the examples. The observation is: If the directed edges form a cycle
somewhere in the network, the answer is "NO". The reason is clear:
the king can't change these edges, and thus the cycle will remain there.
</p>

<p>
The second part of solving this problem was realizing that the converse
holds as well.
</p>

<p>
Consider example 4 &ndash; a complete undirected graph. Here one
possible solution is to direct each edge so that its target has
a larger number than its source. This will clearly make the graph
acyclic. And a similar strategy can be used in all cases.
</p>

<p>
More precisely, suppose that there are no directed cycles in the original graph.
In other words, if we throw away all undirected edges, we'll have
an acyclic graph. Each acyclic graph has got a <a target="_blank"
href="http://en.wikipedia.org/wiki/Topological_sorting">topological
ordering</a>. This means that we can order the vertices into a
sequence such that 
for each edge the source vertex occurs before the target vertex.
</p>

<p>
If there are more possible orderings, pick any one of them.
Now we'll add all the undirected edges back. When adding an edge,
find its two endpoints in our topological order. The one that
occurs earlier will be the source vertex.
</p>

<p>
In this way, we ensure that the topological ordering remains
valid all the time, and thus the resulting graph is still acyclic.
</p>

<p>
Of course, this was just the reasoning behind our algorithm,
we don't actually need to implement any of this. 
We just argued that the answer is "YES" if and only if 
the input graph contains no directed cycles.
And this is the only thing we need to check.
</p>

<p>
For a 50-vertex graph the easiest way how to check for 
presence of a cycle is to use Floyd's algorithm to find 
the <a target="_blank" href="http://en.wikipedia.org/wiki/Transitive_closure">transitive closure</a>
of the graph. This is a special case of the better-known
<a target="_blank" href="http://en.wikipedia.org/wiki/Floyd-Warshall_algorithm">Floyd-Warshall algorithm</a>
for all-pairs shortest paths in a graph. In our case, we don't care about lengths,
we only need to know whether a path exists or not.
</p>

<p>
Java code follows.
</p>

<pre>
  public String canChange(String[] roads) {
    int N = roads.length;
    boolean[][] G = new boolean[N][N];
    for (int i=0; i&lt;N; i++)
      Arrays.fill(G[i],false);

    for (int i=0; i&lt;N; i++)
      for (int j=0; j&lt;N; j++)
        if (roads[i].charAt(j)=='Y' &amp;&amp; roads[j].charAt(i)=='N')
          G[i][j] = true;

    for (int k=0; k&lt;N; k++)
      for (int i=0; i&lt;N; i++)
        for (int j=0; j&lt;N; j++)
          G[i][j] |= G[i][k] &amp;&amp; G[k][j];

    for (int i=0; i&lt;N; i++)
      if (G[i][i])
        return "NO";
    return "YES";
  }
</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8570&amp;rd=12012" name="8570">CreatureTraining</a></b> 

</font> 

<A href="Javascript:openProblemRating(8570)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=519799" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      590 / 824 (71.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      363 / 590 (61.53%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ACRush</b> for 489.43 points (4 mins 11 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      314.35 (for 363 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
We are given total freedom in how we do the upgrades.
When looking for the optimal algorithm, freedom is bad &ndash; it gives us too many possibilities to try.
How can we constrain the search?
</p>

<p>
We can decide to be a bit systematic in doing the upgrades. We will start by spending some (possibly
zero) days upgrading level 0 creatures, then we'll upgrade some level 1 creatures, and so on.
Clearly, in this way we'll be able to achieve the optimal total power. (If we have an optimal solution that
makes the upgrades in some other order, we can easily rearrange them and do them in our order.)
</p>

<p>
Now we could easily write a recursive solution that would try all the possibilities.
Of course, we would like to memoize the computed values to avoid exponential time complexity.
To do this, we need to identify precisely what describes the state of the computation.
</p>

<p>
Two parameters are obvious: the level L of the creatures we are currently upgrading, and the number
D of days left. However, this is not all, there is one more important issue. We might have done some
previous upgrades, and thus the current number of level L creatures may be higher than the input
value. This difference will be the third, and final, parameter.
</p>

<p>
There are at most N=50 levels, and at most D=100 days. Obviously, the third parameter can never
exceed D. Thus there are at most N*D*D=500,000 states. The time complexity of computing one state is
O(D), leading to the overall time complexity O(N*D<sup>3</sup>).
</p>

<p>
C++ code follows. 
</p>

<pre>
  long long memo[52][102][102];
  long long counts[52], powers[52];
  int N;

  long long solve(int level, int add, long long upgrades) {
    long long &amp;res = memo[level][add][upgrades];
    if (res &gt;= 0) return res;
    res = 0;
    if (level==N) return res;
    int maxUpgrades = min( upgrades, counts[level]+add );
    for (int now=0; now&lt;=maxUpgrades; now++) {
      long long thisLevel = powers[level] * (counts[level]+add-now);
      long long nextLevels = solve(level+1,now,upgrades-now);
      res = max( res, thisLevel+nextLevels );
    }
    return res;
  }

  long long maximumPower(vector &lt;int&gt; _count, vector &lt;int&gt; _power, int D) {
    memset(memo,-1,sizeof(memo));
    N = _count.size();
    for (int i=0; i&lt;N; i++) counts[i] = _count[i];
    for (int i=0; i&lt;N; i++) powers[i] = _power[i];
    return solve(0,0,D);
  }
</pre>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8605&amp;rd=12012" name="8605">PreciousStones</a></b> 

</font> 

<A href="Javascript:openProblemRating(8605)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&amp;forumID=519799" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      235 / 824 (28.52%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      122 / 235 (51.91%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>msg555</b> for 896.87 points (9 mins 51 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      618.70 (for 122 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<h4>Greedy solution</h4>

<p>
First of all, when reading the constraints, we should note a nasty special case &ndash;
stones where gold=silver=0. We will throw such stones away immediately. In the rest of
this solution, each stone contains at least one ore type.
</p>

<p>
After playing around with the examples, we can get a feeling that some greedy
approach could work here. But this is always dangerous ground, and being careful
pays off.
</p>

<p>
Imagine that the two doctors will be taking turns. In each turn, each doctor will
take one microgram of the ore he likes. (If they don't use the metric system, they
may take twelfths of a grain instead.) 
Now, note that if we are out of pure gold, dr. Austin will not only get his
microgram of gold but also some silver. This silver will be thrown away.
Now dr. Austin's optimal choice becomes obvious: pick a piece from the stone
where the gold/silver ratio is largest, and thus minimize the amount of silver 
that gets thrown away.
The opposite strategy can be used by Dr. Agnew. 
</p>

<p>
Thus the optimal strategy looks as follows: We sort the stones according to their gold/silver
ratio. Dr. Austin will start picking from one end, dr. Agnew from the other, and they will
meet somewhere in the middle, possibly splitting the last stone.
</p>

<p>
(An exact proof should, of course, use the continuous nature of the problem, not the 
discrete approximation we used above. One possibility how to do the proof: suppose that
the optimal way of splitting the stones differs from the one our algorithm produces.
Then dr. Agnew got a piece that's "further to the left", and dr. Austin a piece that's
"further to the right" than in our solution. If they swap appropriate parts of these
pieces, the solution's value will increase, which is a contradiction.)
</p>

<p>
An elegant way how to implement this solution is to use binary search on the final
amount of ore the doctors get. For a given amount of ore, we can easily count how
many stones each of them gets, and check whether their desired intervals overlap.
</p>

<p>
C++ code follows.
</p>

<pre>
  class Stone {
    public:
      int gold, silver;
      Stone(int g, int s) { gold=g; silver=s; }
  };

  bool myLess(const Stone &amp;A, const Stone &amp;B) {
    if (A.gold+A.silver==0) return false;
    if (B.gold+B.silver==0) return true;
    return A.gold*B.silver &gt; A.silver*B.gold;
  }

  double howManyStones(const vector&lt;int&gt; &amp;stuff, double bound) {
    int N = stuff.size();
    int whole = 0;
    double total = 0;
    while (whole&lt;N &amp;&amp; total+stuff[whole]&lt;=bound) total += stuff[whole++];
    if (whole==N) return N;
    return whole + (bound-total) / stuff[whole];
  }

  double value(vector &lt;int&gt; _silver, vector &lt;int&gt; _gold) {
    vector&lt;Stone&gt; S;
    for (unsigned i=0; i&lt;_silver.size(); i++)
      if (_silver[i]+_gold[i] &gt; 0)
        S.push_back( Stone(_silver[i],_gold[i]) );

    int N = S.size();
    if (N==0) return 0;
    sort( S.begin(), S.end(), myLess );

    vector&lt;int&gt; gold, silver;
    for (int i=0; i&lt;N; i++) gold.push_back( S[i].gold );
    for (int i=0; i&lt;N; i++) silver.push_back( S[N-1-i].silver );

    double mn=0, mx=6000;
    for (int loop=0; loop&lt;300; loop++) {
      double md=(mn+mx)/2;
      if (howManyStones(gold,md) + howManyStones(silver,md) &lt;= N) mn=md; else mx=md;
    }
    return mn;
  }
</pre>


<h4>Linear programming solution</h4>

<p>
One final note: This problem can be converted to a <a target="_blank" href="http://en.wikipedia.org/wiki/Linear_programming">linear programming</a>
instance. Several coders used pre-written LP solvers to achieve high scores for this problem.
</p>

<p>
More precisely, for N stones we will have 2N variables, x<sub>0</sub> to x<sub>2N-1</sub>.
The variable x<sub>i</sub> is the part of i-th stone given to dr. Agnew, and x<sub>N+i</sub>
is the part of i-th stone given to dr. Austin.
We get N obvious constraints: for each i, x<sub>i</sub> + x<sub>N+i</sub> &le; 1.
(The problem statement requires =1, but clearly the optimal solution will use all the stones anyway.)
</p>

<p>
Now comes the tricky part: we will try to maximize the amount of silver taken by dr. Agnew, subject to
one more constraint: this amount of silver must not exceed the amount of gold left for dr. Austin to take.
</p>

<p>
This final constraint can be expressed as follows: The amount of silver taken is: <br/>
silver<sub>0</sub>*x<sub>0</sub> + ... + silver<sub>N-1</sub>*x<sub>N-1</sub> <br/>
The amount of gold left is:
gold<sub>0</sub>*(1-x<sub>0</sub>) + ... + gold<sub>N-1</sub>*(1-x<sub>N-1</sub>) <br/>
We get the inequality: <br/>
silver<sub>0</sub>*x<sub>0</sub> + ... + silver<sub>N-1</sub>*x<sub>N-1</sub> &le; 
gold<sub>0</sub>*(1-x<sub>0</sub>) + ... + gold<sub>N-1</sub>*(1-x<sub>N-1</sub>) <br/>
And this can be rewritten as: <br/>
(silver<sub>0</sub>+gold<sub>0</sub>)*x<sub>0</sub> + ... + (silver<sub>N-1</sub>+gold<sub>N-1</sub>)*x<sub>N-1</sub> &le; 
gold<sub>0</sub> + ... + gold<sub>N-1</sub>.
</p>

<p>
See 
<tc-webtag:handle coderId="15764636" context="algorithm"/>'s
<a href="/stat?c=problem_solution&amp;rm=269208&amp;rd=12012&amp;pm=8605&amp;cr=15764636">solution</a> for an implementation of this approach.
</p>

<br /><br />


<div class="authorPhoto">
    <img src="/i/m/misof_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="8357090" context="algorithm"/><br />
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
