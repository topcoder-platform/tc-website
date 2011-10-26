<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room2"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div style="float: right;">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tccc06/onsitePhotos/shotRoom2.jpg" alt="" class="photoFrameBig" /><br>
</div>

<p style="vertical-align:top;">
<span class="bigTitle">mathijs wins Room 2</span>
<br><br>
<img src="/i/m/lbackstrom_big.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
<tc-webtag:forumLink forumID="506182" message="Discuss this match" /><br>
Wednesday, November 15, 2006<br>
Introduction by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br /><br />
Round 2 turned out to be a bit more standard, as many coders chugged through all three problems.  As per usual, most coders breezed through the easy problem, and some made short work of the medium, while a few were tripped up.  The hard problem also proved relatively easy, and after solving all three problems quickly, the reigning champ, <tc-webtag:handle coderId="262056" context="algorithm"/>, was left with nothing to do but twiddle his thumbs for 35 minutes.
<br /><br />
<tc-webtag:handle coderId="11829284" context="algorithm"/> was not far behind though and, going into the challenge phase, there was the unprecedented possibility of a coder failing to advance despite solving all three problems.  As the challenge phase started, <tc-webtag:handle coderId="262056" context="algorithm"/> was far enough of ahead of third place <tc-webtag:handle coderId="20286298" context="algorithm"/> that he was almost certain to advance unless one of his problems failed.
<br /><br />
The challenge phase proved fairly tame, compared to round 1, which foreshadowed a relatively uneventful system test.  In the end, the top 6 remained unchanged, meaning that <tc-webtag:handle coderId="262056" context="algorithm"/> and <tc-webtag:handle coderId="11829284" context="algorithm"/> advanced to the finals, while <tc-webtag:handle coderId="20286298" context="algorithm"/>, <tc-webtag:handle coderId="8357090" context="algorithm"/>, <tc-webtag:handle coderId="20635649" context="algorithm"/>, and <tc-webtag:handle coderId="310723" context="algorithm"/> will have to fight it out in the wildcard room.
<br /><br />

<h1>OlympicsBroadcasting</h1>
by <tc-webtag:handle coderId="15231364" context="algorithm"/>
<br /><br />

This problem was a generalization of the classical problem that asks for knowing whether a set of intervals cover a (bigger) interval. The solution can be actually derived from one known
solution for that problem.
</p>
<p>
If we graphically see the intervals as segments, we can see that each interval of the form [n,n+1]
is covered by some number of segments. You can easily see that number is an upper bound on the
number of total channels. For example, here is the picture representing the set of intervals
{ [0,3],[1,5],[2,4],[4,6],[0,6] } over the universe [0,6]. Below the integer coordinates is the
number of segments that cover that length 1 interval. We'll call this numbers the height of the
interval.
</p>
<div align="center">
<img src="/i/tournament/tccc06/writeups/room2_1.png" alt="room2_1" />
</div>
<p>
In this example, the upper bound is 2. Is this upper bound achievable? It is, actually. By shrinking the segments that go through intervals with height greater than the minimum (in the
original statement this can be seen as banning out parts of events, which is allowed) you can always
get all heights to be exactly 2.
</p>
<div align="center">
<img src="/i/tournament/tccc06/writeups/room2_2.png" alt="room2_2" />
</div>
<p>
In this case, note that some intervals may be completely shrunk and disappear.
</p><p>
If heights are all exactly the same (let's call it <i>h</i>), it means that whenever a segment
terminates, another one exactly starts at that point. Simply merging those two and repeating the
operation will lead to exactly <i>h</i> intervals that cover the entire universe, and they represent
one way to assign the channels that achieve the upper bound.
</p><p>
Finally, since we have an always achievable upper bound, all that is needed is to find that number
and return it. Calculate the height in each [n,n+1] interval is not possible because there can be
too many of them, but note that the height only changes when a segment starts or ends (is increased
or decreased by one, respectively), and there are at most 100 of those points (2 for each segment).
Therefore, we can just calculate all heights and keep the minimum by iterating those points. C++ code
follows (for non C++ coders, note that map represents a dictionary that iterates the keys in sorted
order):
</p><pre>
map&lt;int,int&gt; m; //by default, all keys have value 0
for(int i=0;i&lt;from.size();++i) m[from[i]]++, m[to[i]]--; //calculate height different at each point
if (m[0]==0) return 0;
int h=0,hs=100000;
for(map&lt;int,int&gt;::iterator it=m.begin(); it != m.end() ; ++it)
    h+=it->second; //add height difference at this point
    if (it->first&lt;totalUnits) hs=min(hs,h); //if we are before the end, update the minimum
}
return hs;
</pre>


<h1>DominoesFinding</h1>
by <tc-webtag:handle coderId="15231364" context="algorithm"/>
<br /><br />

<p>
Backtracking. Yes, that's it. Knowing that a problem is in fact solvable with a backtracking
approach is most times a matter of intuition gained with experience. Anyway, in this and some
other cases, there can be found more formal estimators that the idea is in fact THE idea.
</p>
<p>
I'll describe a possible backtracking approach, possibly the easiest to implement, but there are
other possibilities. The idea is based on the fact that all squares must be used. For example, if
we take the upper-left square of the board, we can see that we must connect it with one of its
two neighbors. With this in mind, we can iterate over all squares and, each time we find an unused
one, we know that we must match it with one of its two (or one) remaining neighboors -- or both, if we
iterate in a column-row or a row-column fashion; when we find an unused square, we know that
everybody in its upper-left rectangle is already used.
</p>
<p>
As we do this, we go marking each used piece and only continue trying if the new piece made by
each new matching is "new". In this way, if we finally get all squares to be used, we know also
that all pieces are used (because we managed to get no repeats) and then, we add 1 to the counter.
</p>
<p>
To be sure this approach works perfectly in time, you can conduct a little experiment and run the
algorithm over an empty board without the "new piece" pruning. This will show you that there are
less than 1.3 million ways to divide the board (1,292,697 actually), so it is perfectly feasible
to try every one of them. Of course, the pruning of the "new piece" will reduce the running time
dramatically in most cases.
</p>
<p>
There is also a good theoretical estimator that the approach will work in time, to convince ourselves
before programming anything (many programmers think this is a must). There is a total of 56 squares
in the board, our algorithm does nothing for half of them (when it finds them already used) and tries
2 or less cases for the other half (the ones it finds unused). This means the total number of leaves
in the search tree will be bounded by 2<sup>56/2</sup> which is roughly 256 millions. This is pretty
big, but considering it is a wide margin upper bound, it can be pretty well used as a "proof" that
time limits won't bother. Main part of a Java code follows:
</p>
<pre>
void spi(int a, int b, boolean st) {
    pi[a][b]=pi[b][a]=st;
}
int count(int i, int j) {
    if (j==7) {i++;j=0;}
    if (i==8) return 1;
    if (oc[i][j]) return go(i,j+1);
    int r=0;
    if (!oc[i][j+1] && !pi[b[i][j]][b[i][j+1]]) {
        spi(b[i][j],b[i][j+1],true);
        oc[i][j+1]=oc[i][j]=true;
        r+=go(i,j+2);
        oc[i][j+1]=oc[i][j]=false;
        spi(b[i][j],b[i][j+1],false);
    }
    if (!oc[i+1][j] && !pi[b[i][j]][b[i+1][j]]) {
        spi(b[i][j],b[i+1][j],true);
        oc[i+1][j]=oc[i][j]=true;
        r+=go(i,j+1);
        oc[i+1][j]=oc[i][j]=false;
        spi(b[i][j],b[i+1][j],false);
    }
    return r;
}
</pre>

<h1>FastGossip</h1>
by <tc-webtag:handle coderId="15231364" context="algorithm"/>
<br /><br />

<p>
Noting the low upper bound of the number <i>n</i> of nodes of the graph, probably many finalists
immediately started thinking of an exponential idea. The fact that the running time of the problem
was an exponential with base 3 instead of the usual 2 made coming up with it a little more
complicated.
</p><p>
Each individual can be in one of 3 states at each moment:
<ol>
<li>Not aware of the news</li>
<li>On the phone</li>
<li>Aware of the news and not on the phone</li>
</ol>
This means combining the state of every friend we have a total of 3<sup><i>n</i></sup> states, which
for <i>n</i> &lt; 15 is less than 5 million, which is a manageable number.
</p>
<p>
The initial state is of course the individual 0 in state (2) and the rest in state (0). Now, let's add
an edge of weight 0 for every possible communication, which means, from state <i>s</i> all ways of
selecting a friend <i>i</i> in state 2 and another one <i>j</i> in state 0 such that <i>i</i> is willing
to call <i>j</i> and "make them talk" by pointing the edge to a state that has everybody in the same state
as in <i>s</i>, except for <i>i</i> and <i>j</i> that will be in state (1). Also, let's add an edge of weight
1 from each state <i>s</i> that has at least one friend on state (1) to another state in which all individuals
in state (2) are given state (1). This edge represents the minute passing. All that's left is to run a bifid BFS
or a bounded edge dijkstra algorithm on the graph and return the minimum path to the final state (which is,
of course, the state with all friends in state (2)).
</p>
<p>
Problem: The graph may have almost 5 million nodes and from each node there can be up to 14*14 edges. To make
the algorithm run on time with 14*14*5*10<sup>6</sup> nodes you must do a lot of somehow low level prunning.
But of course, there is a much better solution. Instead of adding edges of weight 0 for making any pair talk,
only add edges for a fixed friend <i>i</i> and all possible <i>j</i>'s. Since the order in which you make the
pairing (i.e., tranverse the edges of weight 0) is not important, whenever friend <i>i</i> calls somebody,
this simplification is still optimal. The only missing possibility is that at some minute friend <i>i</i> must
call nobody (probably because everybody he is willing to call is already aware of the news). To contemplate
that case, we add an edge of weight 0 from state <i>s</i> to the state in which <i>i</i> is in state (1) and
all the rest are unchanged. This "being on the phone with himself" represent that he is not going to actually
use the phone this minute. This new graph has approximately 14*5*10<sup>6</sup> which is a 1/14 improvement
from the previous graph and can fit in time without any kind of low level optimizations.
</p>
        </div>
      </td>
        
         
<!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="all"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
