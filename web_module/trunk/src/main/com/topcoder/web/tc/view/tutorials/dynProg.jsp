<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Algorithm Tutorials</title>

<jsp:include page="../script.jsp" />
<style type="text/css">
    .code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }

</style>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="alg_tutorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

            <h2>Dynamic Programming: From novice to advanced</h2>

<p>
<img src="/i/m/Dumitru_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="7305703" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

<p>
An important part of given problems can be solved with the help of dynamic programming (<b>DP</b> for short).  Being able to tackle problems of this type would greatly increase your skill.
I will try to help you in understanding how to solve problems using DP. The article is based on examples, because a raw theory is very hard to understand.
<br/><br/>
Note: If you're bored reading one section and you already know what's being discussed in it - skip it and go to the next one.
<br/><br/>
<H3>Introduction (Beginner)</H3>
<em><b>What is a dynamic programming, how can it be described?</b></em>
<br/><br/>
A <b>DP</b> is an algorithmic technique which is usually based on a recurrent formula and one (or some) starting states. A sub-solution of the problem is constructed from previously found ones.
DP solutions have a polynomial complexity which assures a much faster running time than other techniques like backtracking, brute-force etc.
<br/><br/>
Now let's see the base of DP with the help of an example:
<br/><br/>
Given a list of N coins, their values (<b>V<sub>1</sub></b>, <b>V<sub>2</sub></b>, ... , <b>V<sub>N</sub></b>), and the total sum <b>S</b>. Find the minimum number of coins the sum of which is <b>S</b> (we can use as many coins of one type as we want), or report that it's not possible to select coins in such a way that they sum up to <b>S</b>.
<br/><br/>
Now let's start constructing a DP solution:
<br/><br/>
First of all we need to find a state for which an optimal solution is found and with the help of which we can find the optimal solution for the next state.
<br/><br/>
<em><b>What does a "state" stand for?</b></em>
<br/><br/>
It's a way to describe a situation, a sub-solution for the problem. For example a state would be the solution for sum <b>i</b>, where <b>i&#8804;S</b>. A smaller state than state <b>i</b> would be the solution for any sum <b>j</b>, where <b>j&lt;i</b>. For finding a <b>state i</b>, we need to first find all smaller states <b>j (j&lt;i) </b>. Having found the minimum number of coins which sum up to <b>i</b>, we can easily find the next state - the solution for <b>i+1</b>.
<br/><br/>
<em><b>How can we find it?</b></em>
<br/><br/>
It is simple - for each coin <b>j, V<sub>j</sub>&#8804;i</b>, look at the minimum number of coins found for the <b>i-V<sub>j</sub></b>sum (we have already found it previously). Let this number be <b>m</b>. If <b>m+1</b> is less than the minimum number of coins already found for current sum <b>i</b>, then we write the new result for it.
<br/><br/>
For a better understanding let's take this example:<br/>
Given coins with values 1, 3, and 5.<br/>
And the sum <b>S</b> is set to be 11.
<br/><br/>
First of all we mark that for state 0 (sum 0) we have found a solution with a minimum number of 0 coins.
We then go to sum 1. First, we mark that we haven't yet found a solution for this one (a value of Infinity would be fine). Then we see that only coin 1 is less than or equal to the current sum. Analyzing it, we see that for sum 1-<b>V<sub>1</sub></b>= 0  we have a solution with 0 coins. Because we add one coin to this solution, we'll have a solution with 1 coin for sum 1. It's the only solution yet found for this sum. We write (save) it.
Then we proceed to the next state - <b>sum 2</b>. We again see that the only coin which is less or equal to this sum is the first coin, having a value of 1. The optimal solution found for sum (2-1) = 1  is coin 1. This coin 1 plus the first coin will sum up to 2, and thus make a sum of 2 with the help of only 2 coins. This is the best and only solution for sum 2.
Now we proceed to sum 3. We now have 2 coins which are to be analyzed - first and second one, having values of 1 and 3. Let's see the first one. There exists a solution for sum 2 (3 - 1) and therefore we can construct from it a solution for sum 3 by adding the first coin to it. Because the best solution for sum 2 that we found has 2 coins, the new solution for sum 3 will have 3 coins.
Now let's take the second coin with value equal to 3. The sum for which this coin needs to be added to make 3 , is 0. We know that sum 0 is made up of 0 coins. Thus we can make a sum of 3 with only one coin - 3. We see that it's better than the previous found solution for sum 3 , which was composed of 3 coins. We update it and mark it as having only 1 coin.
The same we do for sum 4, and get a solution of 2 coins - 1+3. And so on.
<br/><br/>
<b>Pseudocode:</b>
<br/><br/>
<pre class="code">
Set Min[i] equal to Infinity for all of i
Min[0]=0

For i = 1 to S
For j = 0 to N - 1
   If (V<sub>j</sub> i AND Min[i-V<sub>j</sub>]+1&lt;Min[i])
Then Min[i]=Min[i-V<sub>j</sub>]+1

Output Min[S]
</pre>
Here are the solutions found for all sums:
<br/><br/>
<table width=400 cellspacing=0 cellpadding=5 class=formFrame align=center>
   <tr>
      <td class=sidebarTitle nowrap=nowrap>Sum</td>
      <td class=sidebarTitle nowrap=nowrap>Min. nr. of coins</td>
      <td class=sidebarTitle nowrap=nowrap>Coin value added to a smaller sum to<br/>obtain this sum (it is displayed in brackets)</td>
   </tr>
   <tr>
      <td class=sidebarText>0</td>
      <td class=sidebarText>0</td>
      <td class=sidebarText>-</td>
   </tr>
   <tr>
      <td class=sidebarText>1</td>
      <td class=sidebarText>1</td>
      <td class=sidebarText>1 (0)</td>
   </tr>
   <tr>
      <td class=sidebarText>2</td>
      <td class=sidebarText>2</td>
      <td class=sidebarText>1 (1)</td>
   </tr>
   <tr>
      <td class=sidebarText>3</td>
      <td class=sidebarText>1</td>
      <td class=sidebarText>3 (0)</td>
   </tr>
   <tr>
      <td class=sidebarText>4</td>
      <td class=sidebarText>2</td>
      <td class=sidebarText>1 (3)</td>
   </tr>
   <tr>
      <td class=sidebarText>5</td>
      <td class=sidebarText>1</td>
      <td class=sidebarText>5 (0)</td>
   </tr>
   <tr>

      <td class=sidebarText>6</td>
      <td class=sidebarText>2</td>
      <td class=sidebarText>3 (3)</td>
   </tr>
   <tr>
      <td class=sidebarText>7</td>
      <td class=sidebarText>3</td>
      <td class=sidebarText>1 (6)</td>
   </tr>
   <tr>
      <td class=sidebarText>8</td>
      <td class=sidebarText>2</td>
      <td class=sidebarText>3 (5)</td>
   </tr>
   <tr>
      <td class=sidebarText>9</td>
      <td class=sidebarText>3</td>
      <td class=sidebarText>1 (8)</td>
   </tr>
   <tr>
      <td class=sidebarText>10</td>
      <td class=sidebarText>2</td>
      <td class=sidebarText>5 (5)</td>
   </tr>
   <tr>
      <td class=sidebarText>11</td>
      <td class=sidebarText>3</td>
      <td class=sidebarText>1 (10)</td>
   </tr>
</table>
<br/><br/>
As a result we have found a solution of 3 coins which sum up to 11.
<br/><br/>
Additionally, by tracking data about how we got to a certain sum from a previous one, we can find what coins were used in building it. For example: to sum 11 we got by adding the coin with value 1 to a sum of 10. To sum 10 we got from 5. To 5 - from 0.
This way we find the coins used: 1, 5 and 5.
<br/><br/>
Having understood the basic way a <b>DP</b> is used, we may now see a slightly different approach to it. It involves the change (update) of best solution yet found for a sum i, whenever a better solution for this sum was found. In this case the states aren't calculated consecutively.
Let's consider the problem above. Start with having a solution of 0 coins for sum 0. Now let's try to add first coin (with value 1) to all sums already found. If the resulting sum <b>t</b> will be composed of fewer coins than the one previously found - we'll update the solution for it. Then we do the same thing for the second coin, third coin, and so on for the rest of them.
For example, we first add coin 1 to sum 0 and get sum 1. Because we haven't yet found a possible way to make a sum of 1 - this is the best solution yet found, and we mark <b>S[1]=1</b>. By adding the same coin to sum 1, we'll get sum 2, thus making <b>S[2]=2</b>. And so on for the first coin.
After the first coin is processed, take coin 2 (having a value of 3) and consecutively try to add it to each of the sums already found. Adding it to 0, a sum 3 made up of 1 coin will result. Till now, <b>S[3]</b> has been equal to 3, thus the new solution is better than the previously found one. We update it and mark <b>S[3]=1</b>. After adding the same coin to sum 1, we'll get a sum 4 composed of 2 coins. Previously we found a sum of 4 composed of 4 coins; having now found a better solution we update <b>S[4]</b> to 2.
The same thing is done for next sums - each time a better solution is found, the results are updated.
<br/><br/>
<H3>Elementary</H3>
To this point, very simple examples have been discussed. Now let's see how to find a way for passing from one state to another, for harder problems. For that we will introduce a new term called recurrent relation, which makes a connection between a lower and a greater state.
<br/><br/>
Let's see how it works:
<br/><br/>
Given a sequence of N numbers - <b>A[1] </b>, <b>A[2] </b>, ..., <b>A[N] </b>. Find the length of the longest non-decreasing sequence.
<br/><br/>
As described above we must first find how to define a "state" which represents a sub-problem and thus we have to find a solution for it. Note that in most cases the states rely on lower states and are independent from greater states.
<br/><br/>
Let's define a state <b>i</b> as being the longest non-decreasing sequence which has its last number <b>A[i] </b>. This state carries only data about the length of this sequence. Note that for <b>i&lt;j</b> the state <b>i</b> is independent from <b>j</b>, i.e. doesn't change when we calculate state <b>j</b>. Let's see now how these states are connected to each other. Having found the solutions for all states lower than <b>i</b>, we may now look for state <b>i</b>. At first we initialize it with a solution of 1, which consists only of the <b>i-th</b> number itself. Now for each <b>j&lt;i</b>  let's see if it's possible to pass from it to state i. This is possible only when <b>A[j]&#8804;A[i] </b>, thus keeping (assuring) the sequence non-decreasing. So if <b>S[j] </b> (the solution found for state <b>j</b>) + <b>1</b> (number <b>A[i] </b> added to this sequence which ends with number <b>A[j] </b>) is better than a solution found for <b>i</b> (ie. <b>S[j]+1>S[i] </b>), we make <b>S[i]=S[j]+1</b>.
This way we consecutively find the best solutions for each <b>i</b>, until last state N.
<br/><br/>
Let's see what happens for a randomly generated sequence: 5, 3, 4, 8, 6, 7:
<br/><br/>
<table width=400 cellspacing=0 cellpadding=5 class=formFrame align=center>
   <tr>
      <td class=sidebarTitle nowrap=nowrap width="100%">I</td>
      <td class=sidebarTitle nowrap=nowrap>The length of the longest<br/>non-decreasing sequence<br/>of first i numbers</td>
      <td class=sidebarTitle nowrap=nowrap>The last sequence i from<br/>which we "arrived"<br/>to this one</td>
   </tr>
   <tr>
      <td class=sidebarText>1</td>
      <td class=sidebarText>1</td>
      <td class=sidebarText>1 (first number itself)</td>
   </tr>
   <tr>
      <td class=sidebarText>2</td>
      <td class=sidebarText>1</td>
      <td class=sidebarText>2 (second number itself)</td>
   </tr>
   <tr>
      <td class=sidebarText>3</td>
      <td class=sidebarText>2</td>
      <td class=sidebarText>2</td>
   </tr>
   <tr>
      <td class=sidebarText>4</td>
      <td class=sidebarText>3</td>
      <td class=sidebarText>3</td>
   </tr>
   <tr>
      <td class=sidebarText>5</td>
      <td class=sidebarText>3</td>
      <td class=sidebarText>3</td>
   </tr>
   <tr>
      <td class=sidebarText>6</td>
      <td class=sidebarText>4</td>
      <td class=sidebarText>4</td>
   </tr>
</table>
<br/><br/>
<b>Practice problem:</b><br/>
Given an undirected graph <b>G</b> having <b>N</b> (1&lt;N&lt;=1000) vertices and positive weights. Find the shortest path from vertex 1 to vertex N, or state that such path doesn't exist.
<br/><br/>
Hint: At each step, among the vertices which weren't yet checked and for which a path from vertex 1 was found, take the one which has the shortest path, from vertex 1 to it, yet found.
<br/><br/>
Try to solve the following problems from TopCoder competitions:
<ul>
<li><A href="/tc?module=ProblemDetail&rd=4493&pm=1259">ZigZag</A> - 2003 TCCC Semifinals 3</li>
<li><A href="/tc?module=ProblemDetail&rd=5009&pm=2402">BadNeighbors</A> - 2004 TCCC Round 4</li>
<li><A href="/tc?module=ProblemDetail&rd=5006&pm=1918">FlowerGarden</A> - 2004 TCCC Round 1</li>
</ul>
<h3>Intermediate</h3>
Let's see now how to tackle bi-dimensional DP problems.
<br/><br/>
<b>Problem:</b><br/>
A table composed of <b>N x M</b> cells, each having a certain quantity of apples, is given.
You start from the upper-left corner. At each step you can go down or right one cell.
Find the maximum number of apples you can collect.
<br/><br/>
This problem is solved in the same way as other DP problems; there is almost no difference.
<br/><br/>
First of all we have to find a state. The first thing that must be observed is that there are at most 2 ways we can come to a cell - from the left (if it's not situated on the first column) and from the top (if it's not situated on the most upper row). Thus to find the best solution for that cell, we have to have already found the best solutions for all of the cells from which we can arrive to the current cell.
<br/><br/>
From above, a recurrent relation can be easily obtained:<br/>
<b>S[i][j]=A[i][j] + max(S[i-1][j], if i>0 ; S[i][j-1], if j>0) </b> (where <b>i</b> represents the row and <b>j</b> the column of the table , its left-upper corner having coordinates {0,0} ; and <b>A[i][j]</b> being the number of apples situated in cell <b>i,j</b>).
<br/><br/>
<b>S[i][j] </b> must be calculated by going first from left to right in each row and process the rows from top to bottom, or by going first from top to bottom in each column and process the columns from left to right.
<br/><br/>
Pseudocode:
<pre class="code">
For i = 0 to N - 1
   For j = 0 to M - 1
   S[i][j] = A[i][j] +
      max(S[i][j-1], if j>0 ; S[i-1][j], if i>0 ; 0)

Output S[n-1][m-1]
</pre>
Here are a few problems, from TopCoder Competitions, for practicing:
<ul>
<li><A href="/tc?module=ProblemDetail&rd=4709&pm=1889">AvoidRoads</A> - 2003 TCO Semifinals 4</li>
<li><A href="/tc?module=ProblemDetail&rd=4482&pm=1592">ChessMetric</A> - 2003 TCCC Round 4</li>
</ul>

<h3>Upper-Intermediate</h3>

This section will discuss about dealing DP problems which have an additional condition besides the values that must be calculated.
<br/><br/>
As a good example would serve the following problem:
<br/><br/>
Given an undirected graph <b>G</b> having positive weights and <b>N</b> vertices.
<br/><br/>
You start with having a sum of <b>M</b> money. For passing through a vertex <b>i</b>, you must pay <b>S[i] </b> money. If you don't have enough money - you can't pass through that vertex.
Find the shortest path from vertex 1 to vertex N, respecting the above conditions; or state that such path doesn't exist. If there exist more than one path having the same length, then output the cheapest one.
Restrictions: 1&lt;N&lt;=100 ; 0&lt;=M&lt;=100 ; for each i, 0&lt;=S[i]&lt;=100.
As we can see, this is the same as the classical Dijkstra problem (finding the shortest path between two vertices), with the exception that it has a condition.
In the classical Dijkstra problem we would have used a uni-dimensional array <b>Min[i] </b>, which marks the length of the shortest path found to vertex <b>i</b>.
However in this problem we should also keep information about the money we have.
Thus it would be reasonable to extend the array to something like <b>Min[i][j] </b>, which represents the length of the shortest path found to vertex <b>i</b>, with <b>j</b> money being left. In this way the problem is reduced to the original path-finding algorithm.
At each step we find the unmarked state (i,j) for which the shortest path was found. We mark it as visited (not to use it later), and for each of its neighbors we look if the shortest path to it may be improved. If so - then update it.
We repeat this step until there will remain no unmarked state to which a path was found. The solution will be represented by <b>Min[N-1][j] </b> having the least value (and the greatest <b>j</b> possible among the states having the same value, i.e. the shortest paths to which has the same length).
<br/><br/>
Pseudocode:

<pre class="code">
Set states(i,j) as unvisited for all (i,j)
Set Min[i][j] to Infinity for all (i,j)

Min[0][M]=0

While(TRUE)

Among all unvisited states(i,j) find the one for which Min[i][j]
is the smallest. Let this state found be (k,l).

If there wasn't found any state (k,l) for which Min[k][l] is
less than Infinity - exit While loop.

Mark state(k,l) as visited

For All Neighbors p of Vertex k.
   If (l-S[p]>=0 AND
    Min[p][l-S[p]]>Min[k][l]+Dist[k][p])
      Then Min[p][l-S[p]]=Min[k][l]+Dist[k][p]
   i.e.
If for state(i,j) there are enough money left for
going to vertex p (l-S[p] represents the money that
will remain after passing to vertex p), and the
shortest path found for state(p,l-S[p]) is bigger
than [the shortest path found for
state(k,l)] + [distance from vertex k to vertex p)],
then set the shortest path for state(i,j) to be equal
to this sum.
End For

End While

Find the smallest number among Min[N-1][j] (for all j, 0&lt;=j&lt;=M);
if there are more than one such states, then take the one with greater
j. If there are no states(N-1,j) with value less than Infinity - then
such a path doesn't exist.
</pre>
Here are a few TC problems for practicing:
<ul>
<li><A href="/tc?module=ProblemDetail&rd=4705&pm=1166">Jewelry</A> - 2003 TCO Online Round 4</li>
<li><A href="/tc?module=ProblemDetail&rd=4555&pm=1215">StripePainter</A> - SRM 150 Div 1</li>
<li><A href="/tc?module=ProblemDetail&rd=5072&pm=2829">QuickSums</A> - SRM 197 Div 2</li>
<li><A href="/tc?module=ProblemDetail&rd=4630&pm=1861">ShortPalindromes</A> - SRM 165 Div 2</li>
</ul>
<h3>Advanced</h3>
The following problems will need some good observations in order to reduce them to a dynamic solution.
<br/><br/>
<b>Problem <A href="/tc?module=ProblemDetail&rd=5854&pm=2940">StarAdventure</A> - SRM 208 Div 1:</b>
<br/><br/>
Given a matrix with <b>M</b> rows and <b>N</b> columns (<b>N x M</b>). In each cell there's a number of apples.<br/>
You start from the upper-left corner of the matrix. You can go down or right one cell. You need to arrive to the bottom-right corner. Then you need to go back to the upper-left cell by going each step one cell left or up. Having arrived at this upper-left cell, you need to go again back to the bottom-right cell.<br/>
Find the maximum number of apples you can collect.<br/>
When you pass through a cell - you collect all the apples left there.
<br/><br/>
Restrictions: 1 &lt; <b>N</b>, <b>M</b> &lt;= 50 ; each cell contains between 0 and 1000 apples inclusive.
<br/><br/>
First of all we observe that this problem resembles to the classical one (described in Section 3 of this article), in which you need to go only once from the top-left cell to the bottom-right one, collecting the maximum possible number of apples. It would be better to try to reduce the problem to this one.
Take a good look into the statement of the problem - what can be reduced or modified in a certain way to make it possible to solve using DP?
First observation is that we can consider the second path (going from bottom-right cell to the top-left cell) as a path which goes from top-left to bottom-right cell. It makes no difference, because a path passed from bottom to top, may be passed from top to bottom just in reverse order.
In this way we get three paths going from top to bottom. This somehow decreases the difficulty of the problem.
We can consider these 3 paths as left, middle and right.
When 2 paths intersect (like in the figure below)
<br/><br/>
<center>
<img src="/i/education/dynProg_1.gif" border=0/>
</center>
<br/><br/>
we may consider them as in the following picture, without affecting the result:
<br/><br/>
<center>
<img src="/i/education/dynProg_2.gif" border=0/>
</center>
<br/><br/>
This way we'll get 3 paths, which we may consider as being one left, one middle and the other - right. More than that, we may see that for getting an optimal results they must not intersect (except in the leftmost upper corner and rightmost bottom corner). So for each row <b>y</b> (except first and last), the <b>x</b> coordinates of the lines (<b>x1[y] </b>, <b>x2[y] </b> and respectively <b>x3[y] </b>) will be : <b>x1[y] </b> &lt; <b>x2[y] </b> &lt; <b>x3[y] </b>.
Having done that - the DP solution now becomes much clearer. Let's consider the row y. Now suppose that for any configuration of <b>x1[y-1] </b>, <b>x2[y-1] </b> and <b>x3[y-1] </b> we have already found the paths which collect the maximum number of apples. From them we can find the optimal solution for row <b>y</b>.
We now have to find only the way for passing from one row to the next one.
Let <b>Max[i][j][k] </b> represent the maximum number of apples collected till row <b>y-1</b> inclusive, with three paths finishing at column <b>i</b>, <b>j</b>, and respectively <b>k</b>. For the next row <b>y</b>, add to each <b>Max[i][j][k] </b> (obtained previously) the number of apples situated in cells (<b>y,i</b>) , (<b>y,j</b>) and (<b>y,k</b>). Thus we move down at each step. After we made such a move, we must consider that the paths may move in a row to the right.
For keeping the paths out of an intersection, we must first consider the move to the right of the left path, after this of the middle path, and then of the right path. For a better understanding think about the move to the right of the left path - take every possible pair of, <b>k</b> (where <b>j&lt;k</b>), and for each i (1 i&lt;j) consider the move from position (<b>i-1,j,k</b>) to position (<b>i,j,k</b>). Having done this for the left path, start processing the middle one, which is done similarly; and then process the right path.
<br/><br/>
TC problems for practicing:
<ul>
<li><A href="/tc?module=ProblemDetail&rd=4710&pm=1996">MiniPaint</A> - SRM 178 Div 1</li>
</ul>
<b>Additional Note:</b><br/>
When have read the description of a problem and started to solve it, first look at its restrictions. If a polynomial-time algorithm should be developed, then it's possible that the solution may be of DP type. In this case try to see if there exist such states (sub-solutions) with the help of which the next states (sub-solutions) may be found. Having found that - think about how to pass from one state to another. If it seems to be a DP problem, but you can't define such states, then try to reduce the problem to another one (like in the example above, from Section 5).

<br/><br/>
<span class=bodySubtitle>Mentioned in this writeup:</span><br/>
TCCC '03 Semifinals 3 Div I Easy - <A href="/tc?module=ProblemDetail&rd=4493&pm=1259">ZigZag</A><br/>
TCCC '04 Round 4 Div I Easy - <A href="/tc?module=ProblemDetail&rd=5009&pm=2402">BadNeighbors</A><br/>
TCCC '04 Round 1 Div I Med - <A href="/tc?module=ProblemDetail&rd=5006&pm=1918">FlowerGarden</A><br/>
TCO '03 Semifinals 4 Div I Easy - <A href="/tc?module=ProblemDetail&rd=4709&pm=1889">AvoidRoads</A><br/>
TCCC '03 Round 4 Div I Easy - <A href="/tc?module=ProblemDetail&rd=4482&pm=1592">ChessMetric</A><br/>
TCO '03 Round 4 Div I Med - <A href="/tc?module=ProblemDetail&rd=4705&pm=1166">Jewelry</A><br/>
SRM 150 Div I Med - <A href="/tc?module=ProblemDetail&rd=4555&pm=1215">StripePainter</A><br/>
SRM 197 Div II Hard - <A href="/tc?module=ProblemDetail&rd=5072&pm=2829">QuickSums</A><br/>
SRM 165 Div II Hard - <A href="/tc?module=ProblemDetail&rd=4630&pm=1861">ShortPalindromes</A><br/>
SRM 208 Div I Hard - <A href="/tc?module=ProblemDetail&rd=5854&pm=2940">StarAdventure</A><br/>
SRM 178 Div I Hard - <A href="/tc?module=ProblemDetail&rd=4710&pm=1996">MiniPaint</A><br/>
</p>


        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
