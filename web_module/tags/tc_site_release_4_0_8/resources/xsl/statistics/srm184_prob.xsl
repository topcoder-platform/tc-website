<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 184 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#FFFFFF">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 184</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Tuesday, February 17, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
Both divisions faced a harder set of problems than usual in SRM 183.  Most notable was the Division 1 hard, which only <b>tomek</b> was able to solve
successfully, and for only 322 points, but it was still enough to give him the win for the match.  There were plenty of challenges to be had on that problem,  and although
<b>bladerunner's</b> solution was not successful, 4 of his challenges were.  Division 2 coders also had their work cut out for them, with a combinatorial
medium problem that had a significantly lower submission accuracy than the hard problem.  <b>bl</b> came out on top in Division 2, with only a handful of
coders within reach.
</p>
 
<p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b>RaceApproximator</b>
</font>
<A href="Javascript:openProblemRating(2353)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      232 / 285 (81.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      186 / 232 (80.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>NeverMore</b> for 240.74 points (5 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      172.94 (for 186 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Though there was a long list of notes and contraints for this problem, there was really very little complicated as far as actual coding goes.
Simply plug in the values into the equation that is given, and format the output.  It was important to typecast some values to floating point
numbers when plugging them into the given equation, since <i>a</i>/<i>b</i> can have different answers depending on if <i>a</i> and 
<i>b</i> are integers or floating point numbers.  Beyond this, formatting seconds into hours, minutes, and seconds, 
is a familiar problem to many.  If <i>n</i> is the total number of sceonds, then the number of hours is <i>h</i>=<i>n</i>/3600, the number of minutes
is <i>m</i>=(<i>n</i>-3600*<i>h</i>)/60, and the number of seconds is <i>s</i>=<i>n</i>-3600*<i>h</i>-60*<i>m</i>.   If the function
approxTime(d1,t1,d2,t2,d) is the function described in the problem statement, then the following code will split the value into hours, minutes,
and seconds:
<pre>
    int time=approxTime(d1,t1,d2,t2,d);
    int hours=time/3600;
    int minutes=(time-3600*hours)/60;
    int seconds=time-3600*hours-60*minutes;
</pre>
All that is left is formatting, which can be done differently depending on your language and preference.
Here is a simple Java solution.
<pre>
    String ret=hours+":";
    if (minutes&lt;10) ret+="0";
    ret+=minutes+":";
    if (seconds&lt;10) ret+="0";
    ret+=seconds;
</pre>
</p>
<font size="+2">
<b>BagOfHolding</b>
</font>
<A href="Javascript:openProblemRating(2348)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      106 / 285 (37.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      40 / 106 (37.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Skippy1313</b> for 476.76 points (6 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      305.76 (for 40 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem could have been solved by trying every way of putting items into the bag, and seeing which ones worked, but there
is another solution that requires a bit more insight.
Call the total number of 
items <i>n</i>, the number of items that will not obstruct the item in question <i>s</i>, and the number of items that will obstruct
it <i>b</i>.  Clearly <i>b</i>+<i>s</i>+1=<i>n</i>.  Those <i>b</i> items can be ordered in <i>b</i>! different ways, and the item in question must be placed in the bag after those first
<i>b</i> items.  So we know that when only considering these <i>b</i>+1 items that there are <i>b</i>! ways of ordering them in the bag such that
the item in question can be removed.  The <i>s</i> smaller items can be put into the bag at any point and will not affect anything that we are concerned with.
If we think of those <i>b</i>+1 items in some order and consider adding the <i>s</i> items to that ordering one by one, the first of those <i>s</i> items can
go in one of <i>b</i>+2 places, the next one can go in one of <i>b</i>+3 places, and so on.  So the number of ways the <i>s</i> items can be inserted into an 
ordering of the <i>b</i>+1 items is (<i>b</i>+<i>s</i>+1)!/(<i>b</i>+1)!=<i>n</i>!/(<i>b</i>+1)!.  The total number of orderings which do not
obscure the item in question then is <i>b</i>!<i>n</i>!/(<i>b</i>+1)!=<i>n</i>!/(<i>b</i>+1).  The odds that a random ordering will be one of these acceptable
orderings is the number of acceptable orderings divided by the number of possible orderings, (<i>n</i>!/(<i>b</i>+1))/<i>n</i>!=1/(<i>b</i>+1).  
Once we have this result the coding is pretty easy, just loop through the items and find the number that can obscure the item in question, then return 1/(<i>b</i>+1).
<pre>
    public double oddsReachable(int[] sizes, int item) {
        int b=0;
        for (int i=0;i&lt;sizes.length;i++)
            if (sizes[i]&gt;=sizes[item] &amp;&amp; i!=item)
                b++;
        return 1.0/(double)(b+1);
    }
</pre>
</p>
<font size="+2">
<b>TeamBuilder</b>
</font>
<A href="Javascript:openProblemRating(2356)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      41 / 285 (14.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      30 / 41 (73.17%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>sharprose</b> for 911.50 points (9 mins 1 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      711.41 (for 30 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem statement was a silly way of not mentioning the word 'graph'.  What we have is a directed graph where the locations are vertices, and the 
paths between them are directed edges.  In this problem we want to find the number of vertices that can reach all other vertices, and the number of 
vertices that can be reached by all other vertices.  What we need to determine is the transitive closure of this graph.  The transitive closure
of a graph <i>G</i> has the same set of vertices as <i>G</i> and has an edge from <i>u</i> to <i>v</i> if there is a path from <i>u</i> to <i>v</i> in <i>G</i>.
Once we have this it is easy to calculate the values we are after, and lucky for us there is an incredibly easy-to-code algorithm for finding the transitive
closure of a graph.  First we need the adjacency matrix of a graph, which is actually what we are given.  For a graph <i>G</i> of <i>n</i> vertices, the adjacency
matrix is a <i>n</i>x<i>n</i> matrix with the element <i>G</i>[<i>u</i>][<i>v</i>]=1 if there is an edge from <i>u</i> to <i>v</i>, and 
G[<i>u</i>][<i>v</i>]=0 otherwise.  The following algorithm, also known as Floyd-Warshall, will find the transitive closure of a graph.
<pre>
    public void transitiveClosure(int[][] paths) {
        for (int k=0;k&lt;paths.length;k++)
        for (int i=0;i&lt;paths.length;i++)
        for (int j=0;j&lt;paths.length;j++)
            if (paths[i][k]==1 &amp;&amp; paths[k][j]==1) paths[i][j]=1;
    };
</pre>
Now that we have this, any vertex that can reach all other vertices will cause there to be a row of '1's in the adjacency matrix of the transitive closure,
except maybe the value on the diagonal (<i>G</i>[<i>u</i>][<i>u</i>]) is a '0'.
Similarly, any vertex that can be reached by all other vertices will cause there to be a column of '1's in the adjacency matrix of the transitive closure, again,
except for the value on the diagonal.
It is now a simple matter to count these and return the values.
</p>
<font size="+2">
<b>RaceCalculator</b>
</font>
<A href="Javascript:openProblemRating(2250)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      184 / 206 (89.32%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      168 / 184 (91.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Ruberik</b> for 234.44 points (7 mins 25 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      163.37 (for 168 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem used the same equation as the Div 2 easy, but this time coders were required to follow a very specific algorithm to determine which of
a runner's  races was the best race.  Here most of the difficulty came from just following the prescribed algorithm to the letter.  The first task was to
calculate the badness of each race, the following code demonstrates this:
<br/>
<pre>
    double[] badness = new double[dist.length];
    for (int i=0;i&lt;badness.length;i++)
        badness[i]=-1.0/0;    //-Infinity,  so anything else will get put into the array

    //loop over all races, and then over all pairs of
    //other races to calculate badness of that race
    for (int k=0;k&lt;dist.length;k++)
    for (int i=0;i&lt;dist.length;i++)
    for (int j=0;j&lt;dist.length;j++) {
        if (i==j || j==k || i==k) continue;
        double expected=approxTime(dist[i],times[i],dist[j],times[j],dist[k]);
        double err=(times[k]-expected)/expected;
        badness[k]=Math.max(err,badness[k]);
    }
</pre>
Now that we know the badness of each race, we just go through them all and return the index  of the race with the lowest badness.
<pre>
    int best=0;
    for (int i=0;i&lt;badness.length;i++)
        if (badness[i]&lt;badness[best]) best=i;
    return best;
</pre>
</p>
<font size="+2">
<b>BagOfDevouring</b>
</font>
<A href="Javascript:openProblemRating(2299)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      84 / 206 (40.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      63 / 84 (75.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 466.12 points (7 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      330.07 (for 63 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Though the problem statement began much like the Division 2 medium problem, this ended up being a much different problem.  
It may be quite obvious that the solution will be done with dynamic programming or recursion with memoization, but probability
can easily trip up many people.  I find that memoization usually makes for an easier to understand solution, so that is what I
will present here. 
<br/>
First we need a clear understanding of how this bag works.  At each step we can choose
which item to remove from the bag, and in each of these cases we get a different expected yield, since items have different probabilities
of being devoured depending on the contents of the bag.  
If we choose to remove a particular item from the bag, then the yield will be the value of the item we just removed plus the sum of the expected yields of each possible state of our bag
(i.e. the contents of our bag, considering that one of the remaining items may be devoured) each weighted by the probability of that
state occuring.  We write a recursive function to solve this that takes a set of items and returns the expected yield of that set of items.  That is, it
will determine the expected yield for all choices of what item to remove next, and return the yield for the case in which the yield was the highest.  The function
calls itself when necessary to determine what the expected yields of smaller subsets of items are.  The base case of this function is when there is 
one or zero items, in which case the expected yield is the value of that item, or zero if the bag is empty.  To make this run quickly, of course, we 
need to memoize.  That is, once we calculate the result
for a certain set of items, we store that value so we never have to calculate it again.  Since there are <i>n</i> items, there are
2^<i>n</i> subsets, so an array of size 2^<i>n</i> works fine since the input size, 15, is small.
<pre>
    double yield(int mask) {
        //if we've gotten an answer for mask before, return it
        if (memo[mask]!=-1) return memo[mask];
        double best=0;
        //try removing each item, save the best result
        for (int i=0;i&lt;values.size();i++) {
            if (!(mask &amp; (1&lt;&lt;i))) continue;
            double current=values[i];
            double totalweight=100;
            //sum up the weights in the bag + 100
            for (int j=0;j&lt;weights.size();j++)
                if (i!=j &amp;&amp; (mask &amp; (1&lt;&lt;j))) 
                    totalweight+=weights[j];
            //each item might get devoured, add the best yield
            //after that, weighted by how likely it is to happen
            for (int j=0;j&lt;weights.size();j++)
                if (i!=j &amp;&amp; (mask &amp; (1&lt;&lt;j)))
                    current+=weights[j]/totalweight*yield(mask-(1&lt;&lt;i)-(1&lt;&lt;j));
            //the leftover chance is how likely it is that
            //nothing is devoured, weight that as well
            current+=100.0/totalweight*yield(mask-(1&lt;&lt;i));
            if (current&gt;best) best=current;
        }
        memo[mask]=best;
        return best;
    };
</pre>
All we need  to do from aside from this is initialize the base cases in <i>memo</i>.  For zero items, and for exactly one item we know
the best case result, so store those in the memo before starting.  Now all we need to do is call this function with <i>mask</i> set to 
indicate that all the items are available.
</p>
<font size="+2">
<b>TeamBuilding</b>
</font>
<A href="Javascript:openProblemRating(2327)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      40 / 206 (19.42%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1 / 40 (2.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 322.07 points (51 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      322.07 (for 1 correct submission)
    </td>
  </tr>
</table></blockquote>
<p>
This problem proved to be deceptively difficult, which <b>tomek</b> apparently noticed in time enough to resubmit at the end of the round to get 
the only working solution to this problem.  As with the Division 2 hard problem this is a directed graph.  Our problem here is to find the minimum
number of edges to add to this graph such that every vertex belongs to some cycle, even if that cycle is just an edge from the vertex to itself.
The solution that occurred to many coders but was incorrect was to take the number of  vertices with no incoming edge, the 
number of vertices with no outgoing edges, and return the maximum of those two values.  The thinking is that as long as all nodes have incoming and
outgoing edges that all vertices will belong to some cycle, but it is only true that this conditions guarantees that some vertices will belong to some cycle.
To show a counter example to this solution, consider two disjoint cycles and an edge from one of the cycles to a vertex, and another edge from that vertex to
the other cycle.  In this case all of the vertices have incoming and outgoing edges, but that vertex between the two cycles does not belong to any cycle.
<br/><br/>
For our directed graph, <i>G</i>, find a subset of the vertices , <i>source</i>, such that every vertex in <i>G</i> can be reached by at  least one vertex
in <i>source</i>.  Also find a subset of the vertices, <i>sink</i>, such that every vertex in <i>G</i> can reach at least one vertex in <i>sink</i>.  Now for 
each vertex in <i>sink</i>, if there are any vertices in <i>source</i> that cannot reach it, add an edge from the vertex in <i>sink</i> to one of those
 vertices  in <i>source</i>.  Also, for every vertex in <i>source</i>, if there are any vertices in <i>sink</i> that it cannot reach, add an edge from one 
of them to the vertex in <i>source</i>.  The most edges that can be added in this fashion is the maximum of the cardinalities of <i>source</i> and <i>sink</i>.
After these edges have been added, every vertex will belong to some cycle.  Consider any vertex, from this vertex there is a path to some vertex in <i>sink</i>.
There is an edge leading from this vertex in <i>sink</i> to some vertex in <i>source</i>.  Now from here there is either a path to our original vertex, or there is
a path to a different node in <i>sink</i> than the one we were previously at.  From this new <i>sink</i> vertex we can get to a different <i>source</i> vertex.  We
can continue on in this fashion until we reach a <i>source</i> vertex that leads to our original vertex.  The edges we added ensure that this is the case because 
when we add edges from <i>sink</i> vertices to <i>source</i> vertices in the event that a particular <i>source</i> vertex couldn't get to a particular <i>sink</i>
vertex, we ensure that when traveling from that vertex in <i>sink</i> to the one in <i>source</i> that we will be able to reach a different <i>sink</i> vertex than
the one we started at.  When we add edges from <i>sink</i> to <i>source</i> when a particular <i>sink</i> vertex cannot reach a particular <i>source</i> vertex,
we are ensuring that a cycle will occur (not one cycle for every one of these such edges added, but at least one cycle will be added after all of these edges have been added).
<br/><br/>
Now, since we know that adding edges in this manner will cause all vertices to belong to a cycle, all we need to do is find the minimum possible cardinalities
for <i>source</i> and <i>sink</i>.  In addition, when choosing <i>source</i> and <i>sink</i>, we don't require that a vertex that is already part of a cycle is able to
reach any of the vertices in <i>sink</i>, and we also do not require that it can be reached from a vertex in <i>source</i>.
Unfortunately the best way I know of doing this is also known as Minimum Set Cover, and is an NP-Complete problem.
Basically all there is to do at this point is when calculating <i>sink</i>, try all 2^<i>n</i> combinations of vertices and take the smallest valid set.  Find 
<i>source</i> in the same way.  Now the return value is what was stated before, the maximum of the cardinality of these two sets.  It is less difficult to show that
with the minimum <i>source</i> and <i>sink</i> sets that the maximum of the cardinalities of these two sets is not only sufficient, it is necessary.  I will leave that proof
as an exercize for the reader.  I'll admit my proof here
isn't iron-clad (and i am only mostly sure that it is correct), and I'm not sure that this problem is NP-Complete, but perhaps that is something we can figure out on the 
round tables.  For code that solves this problem in the way I have described here, look at <b>writer</b>'s solution in the practice room.
</p>




                        <p>
                        <img src="/i/m/Running_Wild_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=274760"><strong>Running Wild</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
                    </td>
                </tr>
            </table>

            <p><br /></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>
