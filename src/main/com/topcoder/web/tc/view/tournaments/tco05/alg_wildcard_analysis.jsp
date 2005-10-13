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
<jsp:param name="tabLev3" value="wildcard"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign=top>
      <td valign=top align=center>
      <div class="bodySpacer">
            
<div class="leadPhoto">
<p align="center"><span class="bodyText" align="center"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=photos">See more photos!</a></span></p>
<img src="/i/tournament/tco05/onsite_photos/shot_wildcard.jpg" alt="" class="photoFrameBig" /><br>
<span class="leadPhotoCaption">CAPTION<br><br></span>
</div>

<p>
<span class="bigTitle">TITLE</span>
<br><br>
<img src="/i/m/FogleBird_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/>
<tc-webtag:forumLink forumID="505776" message="Discuss this match" /><br>
Friday, October 14, 2005<br>
Introduction by <tc-webtag:handle coderId="160049" context="algorithm"/>
<br><br><br>
INTRODUCTION
</p>

<h1>CaterpillarTree</h1>
by <tc-webtag:handle coderId="269554" context="algorithm"/>
<br><br>
Caterpillar trees have some theoretical importance in graph theory. For one thing, a caterpillar tree will always have a graceful labeling (a way to label the nodes in tree with distinct integers from 0 to m such that the edge-differences are all integers 1 to m).
<br><br>
Since each node in the tree requires two characters input (except the start node), the maximum size of the input tree is 1251 nodes. So a O(N2) algorithm should be enough, and that's what I'll describe here. It's not very hard to turn this into an O(N) solution, but I'll leave that as an exercise to the reader.
<br><br>
The problem asked for the fewest number of nodes to remove to end up with a caterpillar tree. This is really the same thing as finding the largest subtree in the given tree so that the subtree is a caterpillar tree. The easiest way to find the largest such subtree is to consider all possible stalks in the subtree. This can be done by testing all nodes as potential start nodes in the stalk. Since it makes no sense for the stalk to begin on something other than a leaf node this can be optimized a bit, even though it's not really necessary. For each start node we do a depth first search, exploring all possible paths in the tree. When doing this traversal, we make sure to keep track on the number of nodes that we touch but never visit in the current path; the touched nodes are part of the caterpillar tree. Whenever the traversal should backtrack, we have a potential stalk. Since we during the recursion kept track of the number of touched nodes, we know the size of the caterpillar tree if the current stalk is used. 
<br><br>
If one tries to simplify the problem by assuming that the optimal solution would always be reached by selecting the longest path in the original tree as the stalk to use, one would fail. A counterexample is a graph that has one node with 100 neighbors, but where this node is not on the longest path. 

<h1>TriangleRooks</h1>
by <tc-webtag:handle coderId="251317" context="algorithm"/>
<br><br>
Each step in the given sequence provides some information about the columns and rows of the board.
If the sequence ever increases by more than 1 or decreases by more than 1 we know something is
fishy.  In addition, we know that moving horizontally can only add rooks, while moving vertically
can only subtract rooks.  If the input doesn't agree with either of these two observations, we can
return an empty array.  Assuming neither of these oddities occurs, we can process the sequence as
follows.  Each column we pass potentially gives us a rook to place.  
These rooks are added to a stack, so the rooks on top occur in later columns.  When we pass a
row that requires a rook, we pop a column off the stack and place the rook.  Clearly placing the
last possible rook will guarantee our ordering is desirable (early rows should get earlier rooks).
The only potential qualm would be that placing a rook in the wrong column could ruin the board, thus
making the placement of future rooks impossible.  Fortunately, this is not an issue.  If there is a
feasible board setup that places the rook in the currently observed row earlier, and thus
uses the column at the top of the stack in a higher row, then we could swap these two rooks yielding another
feasible (and better) assignment.

<h1>XORing</h1>
by <tc-webtag:handle coderId="159052" context="algorithm"/>
<br><br>
It may not be obvious, but this problem is strongly related to linear algebra, though with slightly different operations then you are used to in linear algebra problems. Instead of addition, we have the XOR operation. However, it turns out that XOR has many of the same properties as addition. Both are commutative, associative, and distributive. There is also an identity value and an inverse function for each of them.
<br><br>
Now, lets look at a simple example, that should make it clear how these similarities come into play. Lets say we have the input M = [11,10], t = [01]. We can represent this as two equations: 
<pre>
a<sub>0</sub>*1 ^ a<sub>1</sub>*1 = 0
a<sub>0</sub>*1 ^ a<sub>1</sub>*0 = 1
</pre>
Now, lets think about what happens if we XOR the two equations together. Because of the properties of XOR, we end up with a new equation: 
<pre>
a<sub>0</sub>*1 ^ a<sub>1</sub>*1 ^ a<sub>0</sub>*1 ^ a<sub>1</sub>*0 = 0^1
= (a<sub>0</sub>^a<sub>0</sub>)*1 ^ a<sub>1</sub>*1 = a<sub>1</sub> = 1
</pre>
Furthermore, we no longer need both of the original equations. If we have just one of them and the new equation that we derived above, we can derive the discarded equation with the same process. Now, if you are familiar with solving systems of linear equations, this should all look very familiar. We can put all of the equations and the answers in one big matrix, as you would when solving any linear algebra problem. For instance, the above example would go in a matrix like this (note how we combined m and t) 
<pre>
110
101
</pre>
The algorithm for this problem is analogous to row reducing a matrix. First, sort the rows in descending order by the first column. Break ties by the second column, and so on. Now, find the leftmost 1 in the first row. For every other row that has a 1 in the same position, XOR that row with the first row, in place. This will eliminate 1's from the leftmost column in every row but the first. Next, resort the rows, and find the leftmost 1 in the second row and repeat, removing all the 1's in that position except for one of them. Repeat this process until you get to the last row. Now, if any of the rows have just a single 1 in the rightmost position (the answer column) then there are 0 valid functions, as you can't get a 1 by XORing a bunch of 0's. Otherwise, we want to count the free variables. A variable is free if whenever there is 1 in the column that represents that variable, there is another 1 in the same row that is further left (this is trivially true when there is no column containing a 1 for that variable). Finally, the answer is simply 2<sup>number of free variables</sup>. This is because we can assign the free variables however we want, and once we've assigned them, each of the bound (not free) variables must be assigned in a certain way to make the equations all true. For instance, lets say that you start out with the following matrix: 
<pre>
010101
010010
001011
000111
</pre>
Its already sorted properly, so first we remove the 1's from the second column by XORing the first row into the second: 
<pre>
010101        010101
000111  SORT  001011
001011  --->  000111
000111        000111
</pre>
Now, we don't have to remove any 1's from the third column, as there is already only one row with a 1 there, so we move on to the third row. Now, we XOR that row into the first and fourth rows and get: 
<pre>
010010
001011
000111
000000
</pre>
Here, we are done. There are no rows that have just a 1 in the rightmost position, so there is at least one solution. The variables corresponding to the first and fifth columns are free, so we can make both of them either 0 or 1, and thus there are 4 valid solutions. You can verify that for each of the 4 choices for the first and fifth variables, there is only one possibility for the bound variables.
<br><br>
An implementation detail is that if you use a 64 bit integer for each row, all of the coding becomes pretty simple.
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
