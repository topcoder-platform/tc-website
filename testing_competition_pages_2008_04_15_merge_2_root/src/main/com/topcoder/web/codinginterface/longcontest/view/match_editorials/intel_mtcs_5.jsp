<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>
<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
<jsp:param name="key" value="tc_stats"/>
</jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
         <jsp:include page="../includes/global_left.jsp">
            <jsp:param name="node" value="long_editorials"/>
         </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<div align="center">
   <div class="bodyText" style="width: 100%; text-align: left;">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="long_comps_topcoder"/>
        <jsp:param name="title" value="Match Editorials"/>
    </jsp:include>

<div style="float: right;" align="right"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="506010" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 5</span><br>05.17.2006 - 06.01.2006
<br><br>

<img src="/i/m/battyone_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="7504863" context="algorithm"/><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="title"><A href="/longcontest/?module=ViewProblemStatement&compid=5794&rd=10019">PartitionGraph</A></span>
<br><br>
Clustering is a very common real-world data mining problem, and while the data
for this match was artificial, many real-world graphs show strong natural
clusters.  In fact, very similar problems have given rise to quite a few
research papers, and with networks and graphs becoming more and more common,
this sort of data mining is sure to be important.
<br><br>
<span class="subtitle">General Approach</span><br>
<ul>
<li>
Due to the performance metric being optimized, it didn't seem practical to
optimize the number_of_cuts / minimum_cluster_size ratio by allowing both
factors to change, because a change in cluster size usually has a much bigger
effect on that ratio than any change in the number of cuts from moving one node.
Thus, any incremental approach would quickly lock itself in a state where the
minimum cluster size is N/C. So instead, I fixed the minimum cluster size to one
value at a time, starting from N/C, and tried to minimize the number of cuts
with the only constraint being that all the clusters had at least the minimum
size.</li>
<li>
Instead of trying to minimize the number of cuts between clusters, I
worked towards maximizing the number of internal connections in each
cluster. Obviously it is the same thing, but as the number of internal
connections is a property of each cluster independently of the rest of
the graph, it was easier to visualize when trying to come up with methods.</li>
<li>
Since the score is a function of runtime if the result is near
optimal, and zero otherwise, the goal wasn't to create the most accurate
algorithm, or the fastest, but the one that has the best
probability_of_optimality * score. I assumed that at least one
competitor would have the optimal result in all cases. So I ran my first
working algorithm overnight to obtain likely-optimal ratios for my test
graphs, then saved these so the testing program could calculate a score
for all the versions of my algorithm, using the same formula
1/(100+runtime) if optimal, 0 if not, then normalizing against a
theoretical maximum score of 10000 to have comparable results for
different tests.</li>

<li>
Given how the graphs are generated with 'natural' groups, one can in
many cases expect the optimal configuration to be close to the original
distribution (in fact the optimal clusters were usually much better than
the generated clusters), and random solutions to converge fast towards
that optimal. Furthermore, the easiest test cases also tend to be the
fastest to solve, and it's more important to focus on solving these
fast, rather than on solving optimally the harder cases, as the score for these
will be low anyway.</li>
</ul>


<span class="subtitle">Algorithm</span><br>

My algorithm consisted of 5 parts:
<ol>
<li>initial greedy assignment</li>
<li>fast optimization, just moving one node at a time</li>
<li>finer optimization, moving/swapping multiple nodes at a time</li>
<li> move a random number of nodes and repeat steps 2 and 3 a few times</li>
<li> repeat steps 2 and 3 with minimum sizes lower than N/C until it is
apparent these solutions are worse</li>
</ol>
<strong>Initial Assignment</strong><br>

The initial assignment probably doesn't matter much given the fast
convergence, so we just create clusters one at a time, by picking any
unassigned node, then adding unassigned nodes which have the most
connections to the cluster being built.
<br><br>
<strong>Fast Optimization</strong><br>
Here we move nodes to other clusters as long as it increases the number
of internal connections. Clusters under the minimum cluster size are
allowed during the process to speed things up, but since smaller
clusters have less connections to any nodes, to encourage balanced
clusters instead of a situation where many nodes want to go to the
biggest cluster and away from the small ones, we count one extra
connection to a cluster for every missing node in that cluster. This
gives slightly incorrect results but is much faster than without the
margin of error.
<br><br>
<strong>Multiple-Node Swaps</strong><br>
The general idea is to find a maximum matching between nodes and
clusters by finding and adding augmenting paths. We start by scanning
all the nodes and comparing the number of connections of each node to
its current cluster vs the other clusters, and create a table that, for
each source and destination clusters, contains the best node that can be
moved from the source to the destination, along with the resulting gain
or loss in overall number of internal connections. If at this point we
find a positive gain and the source cluster has more than the minimum
size, we just move the node. Otherwise, we search for path of length 2:
for each pair of clusters (source, destination), we check every possible
intermediary cluster and from the table add the gains of moving a node
from source to the intermediary and a node from the intermediary to the
destination, subtracting 1 if the nodes that would be moved are
connected. Then if we find a gain and (source size is greater than
minimum or source equals destination), we move these 2 nodes. Otherwise,
we continue and try to find a path of length 3 using the information we
have for paths of lengths 1 and 2, and so on until paths of size C. When
no more such augmenting paths are found, if there exist some paths of
flow 0, we try moving the corresponding nodes, in case this unlocks
further moves, and give up after a few tries.
<br><br>
<strong>Perturb Solution</strong><br>
Incremental improvements in steps 2 and 3 can help us find
local optimums, but don't explore the solution space to find better local
optimums like in simulated annealing-type methods, as these methods tend
to have exorbitant runtime (also because of some problems in step 3
implementation discussed below). Accordingly we re-mix the clusters a little and try
optimizing them again in the hope of finding a better local optimum. This
is done by removing the worst nodes in each cluster, i.e. those with the
fewest connections to their cluster, reassigning them greedily, then
running the optimization loops 2 and 3 again.
<br><br>
<strong>Relax Minimum Size</strong><br>
Finally we relax the minimum size and run the optimization methods
again, until the resulting ratio is .5% higher than the best found so
far, at which point we consider that the minimum size is too low to find
an optimal ratio, and stop. Out of the 1000 graphs I tested in total,
the only one for which the optimum has a minimum size lower than N/C was
example 1, so this may have been a waste of time.<br><br>

<span class="subtitle">Wrap-Up</span><br>
I was very surprised when my third submission scored as high as it did,
particularly because step 3 needed a lot more work. The worst problems
were that it scanned all the nodes at every iteration, and didn't
remember alternate nodes to move from a cluster to another when the node
stored was connected to one that we also need to move in order to find
an optimal swap, which decreased the swap's value while other nodes
could have a better gain. The solution to both these problems would have
been to maintain a queue of candidate nodes from each cluster to each
cluster, but that seemed very complicated to implement efficiently. So
when the days went by and it looked like that solution was going to win,
I didn't bother. Little did I suspect that the 20 test cases were not
very representative and in reality, starfrog's solution was virtually tied.<br>
<br>

Near the end, since this was after all the multi-threading competition,
I threaded my solution by running it on all 8 cores with a bit of
randomization added in the initial configuration so each thread would
find a different solution, then return the best one in the end. From my
local testing I could tell this would increase the accuracy slightly,
but not whether it was enough to make up for the threading overhead and
waiting for the slowest thread to complete. So I just submitted it, and
when it scored a bit higher than the single-threaded one I let it stand
as my final one. This was probably the move that helped me hold off
starfrog's excellent solution.
<br><br>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="../foot.jsp"/>
</body>
</html>