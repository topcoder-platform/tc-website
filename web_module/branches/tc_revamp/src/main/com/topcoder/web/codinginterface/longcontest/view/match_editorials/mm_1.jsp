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
<tc-webtag:forumLink forumID="505971" message="Discuss this match" />
</div>

<span class="bodySubtitle">Marathon Match 1</span><br>05.10.2006 - 05.17.2006
<br><br>

<%--<img src="/i/m/battyone_big.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>--%>
By&#160;<tc-webtag:handle coderId="16064986" context="algorithm"/><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="bodySubtitle"><A href="/longcontest/?module=ViewProblemStatement&compid=5503&rd=9874">RandomWalking</A></span>
<br><br>

In looking at the &quot;RandomWalking&quot; problem statement, it was clear that one could count the minimum number of distinct nodes visited at any point by using fingerprinting (# of incoming and outgoing edges), counting the distinct successors and predecessors and adjacent repetition of a fingerprint. Having a minimum number of nodes was of little help, however, as we could have nodes with the same fingerprint.

<br><br>
The general idea behind my approach was to ask: What is the probability of all the nodes being visited?
<h2>
Counting nodes
</h2>
First I asked the question: <strong>What is the probability of two nodes having the same fingerprint?</strong> Which can be reduced to <strong>What is the probability <code>p(ei,eo)</code> of a node having <code>ei</code> incoming and <code>eo</code> outgoing edges?</strong> Which can be answered by first calculating the probability <code>p(ei)</code> of a node having <code>ei</code> incoming edges, the probability <code>p(eo)</code> of an node having <code>eo</code> outgoing edges, and then <code>p(ei,eo) = p(ei)*p(eo)</code>.

<br><br>
Calculating the probability that a node has <code>ei</code> incoming edges is a simple combinatorical problem: <code> p(ei) = C<superscript>(n-1)</superscript><subscript>(ei)</subscript> = fact(n-1)/fact(ei)*fact(n-1-ei)</code>. The same is true for <code>p(oi)</code>.

<br><br>
So we can calculate <code>p(ei)</code>, <code>p(oi)</code>, <code>p(ei,oi) = p(ei)*p(oi)</code>, and from here the probability of two nodes having the same fingerprint is <code>p(ei,oi)^2</code>.

<br><br>
With this result in hand, and knowing the minimum number of visited nodes (<code>m</code>), we can calculate the probability of having visited <code>(m+1)</code>, <code>(m+2)</code>, <code>...</code>, <code>(n)</code> nodes.

<h2>
Simulating
</h2>
Next, we must how many steps we want to make in the next walk?

<br><br>
For this I made a simple simulation of how the probabilities computed above will change if I make 1, 2, ... steps.

<br><br>
The reasoning is pretty simple.

<br><br>
Let's consider a situation where I know that I have visited <code>m</code> nodes, and I calculated the probabilities of having visited <code>m+1</code>, <code>m+2</code>, <code>...</code>, <code>n</code> nodes:

<br><br>
<table cellpadding="3" cellspacing="0" border="1" class="bodyText">
<tr><td>Nodes visited</td><td>Probability</td></tr>
<tr><td>m</td><td>p0</td></tr>
<tr><td>m+1</td><td>p1</td></tr>
<tr><td>m+2</td><td>p2</td></tr>
<tr><td>...</td><td>...</td></tr>
<tr><td>n</td><td>pn</td></tr>
</table>
<br><br>
One can consider each row as a possible scenario.

<br><br>
In any scenario in which you make a step, two things can happen: 
<ol>
<li>you end up on a new node</li>
<li>you end up on a node which was already visited</li>
</ol>

<br><br>
The probability of a visiting a new node is <code>pNEW(m) = (N-m)/(N-1)</code> and the probability of visiting an old node is <code>pOLD(m) = (m-1)/N-1)</code>, where <code>m</code> denotes the number of visited nodes in the scenario.

<br><br>
Applying this computation to the table we get:

<br><br>
<table cellpadding="3" cellspacing="0" border="1" class="bodyText">
<tr><td>Original #</td><td>Scenario</td><td>New #</td><td>probability</td></tr>
<tr><td>m</td><td>OLD</td><td>m</td><td>p0*pOLD(m)</td></tr>
<tr><td>m</td><td>NEW</td><td>m+1</td><td>p0*pNEW(m)</td></tr>
<tr><td>m+1</td><td>OLD</td><td>m+1</td><td>p1*pOLD(m+1)</td></tr>
<tr><td>m+1</td><td>NEW</td><td>m+2</td><td>p1*pNEW(m+1)</td></tr>
<tr><td>...</td><td>...</td><td>...</td><td>...</td></tr>
<tr><td>n-1</td><td>OLD</td><td>n-1</td><td>p(n-1)*pOLD(n-1)</td></tr>
<tr><td>n-1</td><td>NEW</td><td>n</td><td>p(n-1)*pNEW(n-1)</td></tr>
<tr><td>n</td><td>OLD</td><td>n</td><td>pn*pOLD(n-1)</td></tr>
</table>

<br><br>
<em>Note that the resulting table has n-m+1 rows, which makes this computation scalable.</em>

<h2>
Scoring
</h2>

One can calculate the most likely score as follows:

<br><br>
For the scenarios where <code>m < n</code> one calculates the score for the scenario <code>s(m) = 100/(2^(n-m))</code>, and multiplies this by the scenarios probability <code>p(m)</code>.

<br><br>
For the scneario where <code>m = n</code> one calculates 100, and multiplies by its probability.

<br><br>
Now we have to account for the penalties for visiting more nodes than necessary.

<br><br>
Let's note the current step number with <code>k</code>.

<br><br>
While we are stepping through the scenarios, we take a note of the probability that all nodes were visited in that step. This will be the probability of having visited <code>n</code> nodes <code>p(n)</code>.

<br><br>
Then we can always have a table which contains the probabilities of having visited the whole graph at each step:

<br><br>
<table cellpadding="3" cellspacing="0" border="1" class="bodyText">
<tr><td>Step #</td><td>Probability of completion</td></tr>
<tr><td>t</td><td>pc(t)</td></tr>
<tr><td>t+1</td><td>pc(t+1)</td></tr>
<tr><td>t+2</td><td>pc(t+2)</td></tr>
<tr><td>...</td><td>...</td></tr>
<tr><td>k-1</td><td>pc(k-1)</td></tr>
</table>


<br><br>
To find out the penalty for visiting more nodes, one first calculates the number of extra nodes visited, then uses the score calculation formula to calculate the penalty:

<br><br>
<table cellpadding="3" cellspacing="0" border="1" class="bodyText">
<tr><td>Step</td><td>Probability of completion</td><td>Extra steps</td><td>Penalty</td></tr>
<tr><td>t</td><td>pc(t)</td><td>k-t</td><td>(k-t)/3*k</td></tr>
<tr><td>t+1</td><td>pc(t+1)</td><td>k-t-1</td><td>(k-t-1)/3*k</td></tr>
<tr><td>t+2</td><td>pc(t+2)</td><td>k-t-2</td><td>(k-t-2)/3*k</td></tr>
<tr><td>...</td><td>...</td><td>...</td><td>...</td></tr>
<tr><td>k-2</td><td>pc(k-2)</td><td>2</td><td>(k-2)/3*k</td></tr>
<tr><td>k-1</td><td>pc(k-1)</td><td>1</td><td>(k-1)/3*k</td></tr>

</table>

<br><br>
Then we weight the penalties with their probabilities, and we get the most likely penalty for the current scenario.

<br><br>
We combine this with the scores calculated above, and we get the most likely score for the current scenario.

<h2>
When to stop
</h2>

We have set up a simulator which uses the current probability distributions to calculate the score for the next step. We can use this simulator to calculate the most likely score for the second step, then for the third, and so on.

<br><br>
We just let the simulator run, until the most likely score is higher then a wisely chosen threshold. Then we query the simulator to see how many steps it took, and we return it from the walk function.

<br><br>
For each call to the walk function I repeated the procedure above: calculate the probability distribution (based on the new set of information received), setting up a simulation, stepping through and observing the score.

<h2>
Final thoughts
</h2>

In my submission I also considered the probability mentioned in the graph-generation procedure description. I calculated this <code>p</code> from the number of edges observed (<code>p=AverageEdgeCount/NumberOfNodes</code>), and used it to adjust the probability of <code>pOLD</code> and <code>pNEW</code> above.

<br><br>
Also I guess several errors can be found in my implementation: the calculation of the most likely score does not account correctly for the cases when one does not visited all nodes. Also the calculation of the <code>p</code> (from the graph-generation procedure description) is fishy: I calculate the average node count of every node I receive in the walk function, not only the uniquely visited ones.

<br><br>
Choosing the threshold of the score where one should stop was interesting. Common sense dictated that one should stop as soon as it went above a score of 90. When I tried it, it gave timeouts on most of the test cases. I then tried 80, which placed me at the top of the list. I was content, until <strong>rado42</strong> displaced me. 

<br><br>
I was looking for ways to improve my score, and one trial led me to a threshold of 70, which placed me first place. 

<br><br>
After running several test cases, I observed that the highest score was achieved with the threshold of 50. I still have problems understanding why it is so.
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