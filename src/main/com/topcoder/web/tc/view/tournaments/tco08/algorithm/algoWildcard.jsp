<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="summary"/>
    <jsp:param name="tabLev3" value="wildcard"/>
    </jsp:include>


        <h2>Algorithm Competition Wildcard Summary</h2>
        
        <div class="sub_content">
            <p><img src="/i/m/d000hg_big.jpg" alt="d000hg" style="width:55px; height:61px; border:0px; padding-right:2px;" hspace="6" vspace="1" align="left" class="myStatsPhoto" /><span>Tuesday, May 13, 2008<br />Introduction by <tc-webtag:handle coderId="21464956" darkBG="true" /></span></p>
            <p align="right"><tc-webtag:forumLink forumID="521201" message="Discuss this competition" /></p>
            <br /><br />
            
            <h3>tomek wins Wildcard round!</h3>
            <br />
            <p style="float:right; width:200px; height:350px; margin-left:10px;"><img src="/i/tournament/tco08/shotR4.jpg" alt="tomek wins Wildcard round!" /></p>
            <p><strong>The Wildcard play-by-play can be found <a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=613454&amp;start=0&amp;mc=30">here</a>.</strong></p>
            
            <br /><br />
            <p>by <tc-webtag:handle coderId="287131" context="algorithm"/></p>
            <h4>OptimalPlay</h4>
            <p>There are two sorts of decisions that the second player has to make in this
problem: whether or not to call when bet at, and whether or not to raise when
checked to.  Imagine that the second player has card <tt>j</tt> and decided to
call when bet at.  We can easily calculate the expected value from this
decision.  When we are beat, we will lose $1.  When we win, we will win $2.
When we tie, we will win $0.5.  Consider the case where the first player has
card <tt>i</tt>, and bets this card with probability <tt>p</tt>.  Card
<tt>j</tt> either loses, ties or wins against card <tt>i</tt>, so we know how
much we will win in this case.  Now, the expected value of calling will be
product of the winnings with the probability of the scenario.  The probability
of the scenario is just the product of the probabilities of the cards,
<tt>1/N<sup>2</sup></tt>, with the probability that player 1 will bet,
<tt>betProb[i]</tt>.  If we sum this over all <tt>i</tt>, we can find the
expected value of calling with card <tt>j</tt>.  If we fold with
card <tt>j</tt>, we neither win nor lose nothing, so we don't even have to
consider this case.</p>
<p>
If our opponent checks to us, the analysis is pretty much the same.  We
compute the expected value of betting and checking with each card, and pick
the higher one.  As in the calling case, the expected value is just the
probability of each scenario, times the gain from that scenario.</p>
<pre class="code">
double ret = 0;
for(int j = 0; j&lt;bet.length; j++){<span style="color:navy">//me</span>
    double win1 = 0, win2 = 0, win3 = 0;
    for(int i = 0; i&lt;bet.length; i++){<span style="color:navy">//him</span>
        if(i &lt; j) win1 += 2 * bet[i];
        else if(i == j) win1 += bet[i] / 2;
        else win1 -= bet[i];

        if(i &lt; j) win2 += 2*call[i];
        else if(i == j) win2 += call[i]/2;
        else win2 -= call[i];
        win2 += 1-bet[i]-call[i];

        if(i &lt; j) win3 += 1-bet[i];
        else if(i == j)win3+= (1-bet[i])/2;
    }
    if(win1 &gt; 0)ret += win1;<span style="color:navy">//call</span>
    if(win2 &gt; win3) ret += win2;<span style="color:navy">//bet</span>
    else ret += win3;<span style="color:navy">//check</span>
}
return ret / bet.length / bet.length;
</pre>


            <br />
            <p>by <tc-webtag:handle coderId="10481120" context="algorithm"/></p>
            <h4>BSTConstruction</h4>
            <p>
The first idea that can come to somebody's mind after reading the statement is just to implement the given pseudocode. Unfortunately, such approach can work too slow on some cases.
For example imagine a case with <b>N</b> = 250,000 and <b>limit</b> = 0. It generates the permutation p = (0, 1, 2, ..., 250,000). You need to perform i steps to insert the i-th element of p into the
tree, which gives totally like 250,000^2 / 2 steps. It's obviously too much. The cases with <b>limit</b> = 0 can be hardcoded, but there are plenty of other cases with relatively small values
of <b>limit</b>, where the tree structure is more complex and the height is still quite large.
</p>
<p>
So we need more efficient approach to solve the problem. Let's make some helpful observations. Consider any vertex V of the tree and subtree T rooted at this vertex. Let m be the minimal
integer in subtree T, M be the maximal one and R be the integer at V. The following facts are intuitively obvious and can be easily proved:</p>
<ul>
<li>T contains each integer between m and M, inclusive, exactly once;</li>
<li>among all integers between m and M, inclusive, R has the smallest index in permutation p;</li>
<li>the left subtree of T contains all integers between m and R-1, inclusive;</li>
<li>the right subtree of T contains all integers between R+1 and M, inclusive.</li>
</ul>
<p>
Using these facts, we can change the process of tree construction to the following pseudocode:
</p>
<pre>
Procedure construct(integer m, integer M)
    Find the value of R in the root of the tree
    If m &lt; R then call construct(m, R-1) to get the left subtree
    If R &lt; M then call construct(R+1, M) to get the right subtree
End
</pre>
<p>
To construct the whole tree we just need to call construct(0, <b>N</b> - 1).
</p>
<p>
There are still 2 problems that need to be resolved. The first one is possible stack overflow. It can be resolved by replacing stack with queue. We first put the
pair (0, <b>N</b>-1) into the queue. Then, until queue is not empty, we take a pair (m, M) from the queue, calculate R and put two (or less) pairs (m, R-1) and (R+1, M) into the queue.
</p>
<p>
The second problem is efficient calculation of R. If we check the whole permutation p each time to find R, it'll still be too slow. What can help us is the
<a href="/tc?module=Static&amp;d1=tutorials&amp;d2=lowestCommonAncestor">Range Minimum Query</a> problem.
Let's construct an array pos, where the i-th element gives the index of integer i in the permutation p. Now, to calculate R by m and M
we need to find the smallest value minPos among pos[m], pos[m+1], ..., pos[M] and set R = p[minPos]. So each R calculation
requires just one RMQ query in array pos, which allows to make it efficiently.
</p>
<p>
All problems are resolved and we can construct the whole tree in O(<b>N</b> * log <b>N</b>) time. To calculate the answer we can just keep the height during the
construction and then sum all the heights. Alternatively, we can even not construct the tree itself and calculate the answer as the sum of (M - m + 1) over all tree vertices.
</p>

            <br />
            <p>by <tc-webtag:handle coderId="10481120" context="algorithm"/></p>
            <h4>AlmostConvexPolygons</h4>
            <p>
The first thing which we should do in this problem is to iterate through all subsets of given points and construct the convex hull for each subset (see
the <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=geometry2#convexhull">geometry tutorial</a> for the algorithm
of convex hull construction). We'll need to calculate convex hulls many times later, so it's faster to calculate them just once for each subset.
</p>
<p>
Now let's again iterate through all subsets of points and calculate for each subset how many almost convex polygons
contain exactly all the vertices from this subset. To do this, we try all possible variants for diagonal, which splits the polygon into
two convex polygons. Once the diagonal is fixed, we can check whether it's appropriate or not. Note that vertices of one of convex polygons
must all lie to the left from the diagonal, and the vertices of the other polygon must lie to the right. So we can split the vertices into two subsets
(including diagonal's endpoints into both subsets) and check whether the convex hull for each of 2 subsets contains all the vertices from the subset.
If it's not true for any of subsets, the diagonal is not appropriate. Otherwise, it's appropriate and we can uniquely glue the two convex polygons
we have into one almost convex.
</p>
<p>
Now we have constructed all possible almost convex polygons, but the problem is that some of them are possibly constructed more than once, so
we need to remove duplicates, and it should be done quite efficiently. One possible way is to calculate the hash code for each polygon, sort all the codes
to group the same codes together and then just find the number of groups. To calculate the hash code for a polygon, find the lowest-indexed vertex in it,
start polygon from this vertex, proceed to the lowest-indexed of two neighbours, and then proceed to the other polygon's vertices in the chosen direction.
Treating the obtained sequence of vertices as a 15-based integer and calculating its decimal value will give us the hash code for the polygon.
</p>
            
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
