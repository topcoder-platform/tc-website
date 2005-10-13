<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="room1"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<span class="bigTitle">TITLE</span>
<br><br>
<div class="leadPhoto">
<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=photos">See more photos!</a></p></span>
<img src="/i/tournament/tccc05/onsite_photos/shot_room1.jpg" alt="" class="photoFrameBig" /><br/>
<span class="leadPhotoCaption">CAPTION<br/><br/></span>
</div>

<img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
by <tc-webtag:handle coderId="269554" context="algorithm"/>, <br/>
<em>TopCoder Member</em><br />
Thursday, October 13, 2005<br/>
Introduction by <tc-webtag:handle coderId="160049" context="algorithm"/>
<br/><br/>
<tc-webtag:forumLink forumID="505776" message="Discuss this match" />

<p>
ferocious foge's words
<br><br>
<H1>Surprising Strings</H1>
<P>This is a typical dictionary problem, where you have a large set of ordered 
strings and you are asked to pick out one of the strings based on its index. 
Usually in such problems the total number of strings is too large for a brute 
force algorithm to work fast enough.</P>
<P>Not so in this problem. While it's not easy to guess the total number of 
strings based on the constraint, an important hint was given in the notes: at 
most 1 million. This pretty much tells us that a brute force algorithm will do. 
That is, if we can generate the strings one by one in the appropriate sorting 
order, it will be enough. That's good news since there doesn't seem to exist any 
fast way to generate Surprising Strings.</P>
<P>The problem is most easily solved with recursion; each recursive call adds a 
new letter to the current string. In each call, we consider what the next letter 
will be. To make sure we only generate unique (non-equivalent) strings, only 
letters that have already been used, or the next new letter should be 
considered. For instance, if the letters 'A' and 'B' have been used so far, 
letters 'A', 'B' and 'C' should be considered at the next step (assuming the 
size of the alphabet is at least 3 of course). </P>
<P>We must also keep track of all used distances between pairs of letters. This 
can be done in a three dimensional array of bool, which we update accordingly. 
If the array is called <B>a</B> and <B>a</B>[<I>x</I>][<I>y</I>][<I>z</I>] is 
set, if would mean that the letters <I>x</I> and <I>y</I> are <I>z</I> positions 
apart in the current string. This speeds up the generation, which is necessary 
because an extra inner loop can cause the solution to time out on the larger 
inputs. One can optimize this a bit more in various ways, but nothing fancy is 
needed to the get solution to run under 2 seconds. </P>
<P>Some interesting facts and proofs about Surprising Strings can be read <A 
href="http://aleph0.clarku.edu/~djoyce/mpst/surprising/">here</A>. </P>

<H1>Running Trail</H1>
<P>If it had not been for the restriction that we can't run along a path and 
then turn around and run back the same path, the solution would have been 
standard DP: Maintain a two dimension boolean table 
<B>dp</B>[<I>length</I>][<I>node</I>] where true indicates that the junction 
<I>node</I> can be reached after running <I>length</I> units. The table can be 
built by doing a nested loop over length and node, and for each true element 
update future elements based on the edges in the graph.</P>
<P>In order to adapt the above algorithm, we must somehow keep track of which 
node we came from. To extend the array with yet another dimension is out of 
question; it will be too slow to loop over all three dimensions. One idea is to 
have the path index rather than the node index in the dp table (<b>&lt;DP&gt;</b>[<I>length</I>][<I>path</I>] + we also must keep track the direction used). 
This works, but only with some added heuristics - otherwise the solution might 
very well time out on graphs containing 50 paths between node 1 and 2 (you would 
end up with three nested loops ~100000*50*50 which is too much). </P>
<P>A more elegant (in my view) solution is to stick with the original idea, but 
instead of only storing true and false in the table, we store the last path 
index used. So, <B>dp</B>[100][20] = 17 would mean that one can be at node 20 
after running 100 units, where the last path used was 17. If a node can be 
reached by two or more different paths at the same running length, we assign 
that a special number (-1 for instance). The key observation here is that if a 
node can be reached by two or more different paths, we can use <I>all</I> 
neighboring paths when running from that node. </P>
<P>And that's basically it; we keep iterating over length until we reach the 
start node and the total length is greater than the desired length (all future 
visits to the start node will then be worse than the best solution found so 
far). To avoid memory problems, the length can be stored in modulo 5001 since 
the maximum path length is 5000. </P>
<P>One pitfall is to make an erroneous assumption regarding the longest trail. 
It is not 5000*50 = 250000 (a large circle) which one might think at first, but 
5000*100 (a loop, 1-2-3-...-49 and then two paths to node 50). If one uses fixed 
sized arrays, this could cause a run time error. </P>

<H1>Bridges</H1>
<P>Bridges is another logic puzzle game from the Japanese publisher Nikoli 
(their most well known game is without a doubt Sudoku). The original name of 
Bridges is Hashiwokakero. More about it can be read at <A 
href="http://en.wikipedia.org/wiki/Hashiwokakero">Wikipedia</A>. </P>
<P>There is no elegant matching algorithm or anything that solves Bridges 
puzzles nicely (the island connection criteria spoils that fun), so we're pretty 
much stuck with brute force algorithms (almost, see below). That brute force is 
enough can be guessed at by looking at the constraints: the grid size is at most 
10x10 and, more importantly, we can assume that there is a unique solution (in 
puzzle books this is always the case). This makes a lot of otherwise potential 
evil test cases invalid, and it turns out that a fairly standard backtracking 
algorithm with some pruning will solve the problem nicely. </P>
<P>An elegant (design-wise) backtracking solution would first explicitly build 
up the underlying graph, where each island is a vertex, and each pair of islands 
lying in sight along the horizontal or vertical axis would correspond to an 
edge. All edges that intersect would have to be stored somewhere as well, so not 
both are used. This is all nice and well, but do we really want to waste time 
writing elegant code when time is flying and the score is dropping? To get a 
good score, one should probably instead let the input string array (or a 
corresponding char[][]) be the graph, and then do the backtracking in this 
format immediately. </P>
<P>Define deg(<I>x</I>) as the number of bridges that must yet be built from an 
island for it to satisfy the input. When deg(<I>x</I>) is 0, no more bridges 
should be built from the island. Define max(<I>x</I>) as the sum of, for each 
direction where <I>x</I> has a neighboring island <I>y</I>, MIN(deg(<I>y</I>), 
2) assuming that there is no crossing bridge between <I>x</I> and <I>y</I>. </P>
<P>First, if we find an island <I>x</I> where deg(<I>x</I>)&gt;max(<I>x</I>), we 
have done something wrong and should backtrack. Otherwise we select an island 
where max(<I>x</I>)-deg(<I>x</I>) is minimized. If we have an island where 
max(<I>x</I>)=deg(<I>x</I>), then all possible remaining bridges that can be 
built from the island should be built; if the difference is just 1, almost all 
bridges should be built etc. Selecting such an island will greatly speed up the 
recursion, because here the number of combinations of which bridges should be 
built is much less than if we would have picked any island at random. </P>
<P>After selecting an island in the recursion step, we pick a direction that has 
the least number of possibilities regarding the quantity of bridges (0, 1 or 2). 
We loop over the possible values, and to a recursive call. This edge should then 
never be considered in nested recursive calls; once we have decided if there 
should be 0, 1 or 2 bridges between a pair of island, we stick with that until 
it's time to backtrack. </P>
<P>What about connectivity? There are several ways to check this. One could 
either check this once all bridges have been placed and deg(<I>x</I>)=0 for all 
islands. This might be a bit risky because we could have test cases with very 
many solutions had connectivity not been required. It's safer to check this at 
each recursive call. The check can be done with a regular DFS search. Here we 
now assume that there is a bridge between all neighboring islands x and y, 
assuming there is no crossing bridge between x and y and that deg(<I>x</I>)&gt;0 
and deg(<I>y</I>)&gt;0 (or a bridge between <I>x</I> and <I>y</I> has already 
been built). </P>
<P>And that's it. While the solution algorithm outlined above isn't exactly 
rocket science, it requires some serious coding to get the problem successfully 
solved. </P>
<P>Now, for those of you who thought this wasn't so hard, here's a much harder 
challenge, requiring a more sophisticated solution: write a program which 
calculates the total number of solutions for the input below in less than two 
seconds. For verification purposes, the answer is greater than one million, and 
in modulo 1024 it's 544. </P>
<PRE> "3.4.5.3.4.4.4.3"
 "..............."
 "4.3.3.2.4.4.5.3"
 "..............."
 "4.4.2.2.2.2.3.."
 ".....2.2.3....4"
 "4.4.2.2.2.3.4.."
 ".....2...2....."
 "4.3.1.1.2.2.4.2"
 ".....2.1.2.1..."
 "1.3.4.2.3.2.4.2"
 "..............."
 "1.2.4.5.4.2.3.2"
 "..............."
 "1.2.4.4.1.1.2.1"
</PRE>

      </p>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
