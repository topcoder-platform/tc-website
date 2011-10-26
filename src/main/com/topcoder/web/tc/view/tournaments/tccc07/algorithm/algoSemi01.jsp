<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="../nav.jsp" >
        <jsp:param name="tabLev1" value="<%=EventType.ALGORITHM_TOURNAMENT_ID%>"/>
        <jsp:param name="tabLev2" value="summary"/>
        <jsp:param name="tabLev3" value="room1"/>
        </jsp:include>
        
        <div id="pageBody">
            <h1><span>Petr wins Room 1!</span></h1>
            <p><img src="/i/m/Olexiy_big2.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
            <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518014">Discuss this match</A><br />Wednesday, October 31, 2007<br />Introduction by <tc-webtag:handle coderId="303644" context="algorithm"/></p>
            <p style="float:right; width:200px; 350px; margin-left:10px;"><img src="/i/tournament/tccc07/shotR1.jpg"></p>
            <br /><br />
            
            <p><strong><tc-webtag:handle coderId="10574855" context="algorithm"/>, the top seed of TCCC-2007 and the reigning champion, started his title defence with an overwhelming win in Semi 1. He needed only 40 minutes to submit 3 correct solutions for almost 1600 points and advance to the Championship round. "The only Dutch coder without a tournament win", <tc-webtag:handle coderId="9906197" context="algorithm"/>, advanced to the Finals too, as he was the only other coder with correct submissions for all 3 problems. Croatian fellows <tc-webtag:handle coderId="310333" context="algorithm"/> and <tc-webtag:handle coderId="7390467" context="algorithm"/> will go to the WildCard, as well as <tc-webtag:handle coderId="22652597" context="algorithm"/> and <tc-webtag:handle coderId="8472826" context="algorithm"/>.</strong></p>
            
            <br /><br />
            <p>by <tc-webtag:handle coderId="8357090" context="algorithm"/></p>

<h2>CardsAndSlots</h2>

<p>
First, let us forget about letters. We'll just want to find out whether a solution exists. How to check this efficiently?
</p>

<p>
If the smallest value is smaller than the smallest requirement, we are out of luck and there is no solution -- the smallest value has to be used somewhere, but all requirements are larger.
</p>

<p>
Otherwise, we can't lose anything by using the smallest value to satisfy the smallest requirement. We are left with a smaller instance of the same problem. Thus, we can repeat the same argument, until we either find that no solution exists, or construct a valid assignment.
</p>

<p>
In other words, to check whether a solution exists, it is enough to sort both the values and the requirements, and to check whether for all i we have values[i]&ge;required[i].
</p>

<p>
Now for the original problem. We will construct the answer linearly, going from left to right In each step, check all letters that can be used to satisfy the current requirement.
For each of them, use the above process to verify whether after using this letter here the remaining letters can be assigned somehow. If yes, mark this letter as a candidate.
After you are done, pick the lexicographically smallest candidate. (And if you have more options, pick the one with a lower value.) </p>


<h2>UnfriendlyMultiPermutation</h2>

<p>
The main problem in this task was reducing the search space enough to fit the time and memory constraints. To do this, we need to identify patterns -- similar situations, where we can argue that the answer is the same. Once we find such a pattern, it reduces our search
space: we only have to solve one of the situations, and we get the answer for all similar situations as well.
</p>

<p>
Imagine that we are generating the multipermutation from left to right, and that we already generated a part of it. Now we want to find in how many ways can we fill in the rest of the multipermutation. What does this value depend on?
</p>

<p>
Consider two multipermutations, the first one starting "1,2,3,1,3,..." and the second one starting "3,1,2,1,3,...". Clearly, if we have a valid way to fill in the rest of the first multipermutation, it can be used for the second one, and vice versa.
The result only depends on the last value used, and on the multiset of unused values.
</p>

<p>
Now suppose that we are in a situation where the last number used was 3, and we still have to use numbers (1,1,1,2,2,3,4). Clearly, the answer would be the same if we had to use, say, the numbers (47,47,47,2,2,3,4). Thus we can notice that the exact values don't matter as well.
The important information is: how many different values do we have, and how many times does each of them occur?
</p>

<p>
Precisely, the states of our search will be 6-tuples (a1,a2,a3,a4,a5,x).
This state represents the situation where we still have to place: a1 different values once,
a2 values twice, ..., and a5 values five times. Specially, we still have to place x copies of the last value placed.
For example, the situation from the previous paragraph corresponds to the state (2,1,1,0,0,1).
</p>

<p>
In any state, the sum a1+a2+a3+a4+a5 is at most equal to N.
This means that we reduced our search to roughly 300,000 states. This number is already small enough to compute the answer for each of the states using dynamic programming (or equivalently memoization).
</p>


<h2>AncientLanguage</h2>

<p>
Consider any substring "xyz" of length 3 of the input string. We have to be able to produce the letter "y", thus at least one of "xy" and "yz" has to be a word.
We will now formalize this observation.
</p>

<p>
We will build a graph where the vertices are all 2*26*26 possible words.
The edges will be determined by the input string. More precisely, each substring of length 3 induces one edge. For example, for the input "AaAbBaAcCaAa" we get the following edges:
Aa-aA, aA-Ab, Ab-bB, ...
</p>

<p>
(A small technical issue: we have to pick the first and the last two letters as words. In our graph, we can represent this by adding two special vertices "start" and "end", and adding two edges: start-first_word, and last_word-end.) </p>

<p>
As we already said, each edge in our graph states that we have to pick at least one of its two vertices. In other words, our task is to select the smallest number of vertices
(words) so that each of the edges contains a selected vertex. Thus our task is to find the size of the minimum vertex cover in the given graph </p>

<p>
(Back to the technical issue: Note that there surely is a minimum vertex cover that does not contain the two special vertices.) </p>

<p>
Luckily for us, due to the nature of the input string our graph is bipartite.
(One partition are vertices of the form xY, the other are vertices of the form Xy.
The special vertices have degree 1, and thus can be assigned to one of the partitions as well.) </p>

<p>
To compute the size of the minimum vertex cover, we can use Koenig's
theorem:
in bipartite graphs
its size is equal to the size of the maximum matching. Thus, all we have to do is to find the maximum matching in the bipartite graph we just constructed.
</p>

            
            

        </div>
    </div>
    <jsp:include page="../footer.jsp" />
    </div>
</div>
</body>
</html>