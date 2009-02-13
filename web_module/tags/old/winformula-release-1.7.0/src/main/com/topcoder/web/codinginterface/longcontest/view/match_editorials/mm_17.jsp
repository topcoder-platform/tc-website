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
<tc-webtag:forumLink forumID="515803" message="Discuss this match" />
</div>

<span class="bodySubtitle">Marathon Match 17</span><br>05.16.2007 - 05.30.2007
<br><br>

<img src="/i/m/ecv_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
by <tc-webtag:handle coderId="22651620" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="bodySubtitle"><A href="/longcontest/?module=ViewProblemStatement&compid=6983&rd=10815">ContinuousSameGame</A></span>
<br><br>

<h3>Introduction</h3>
<p>
MM17 attracted a record number of participants for the regular Marathon Matches -- 281 coders sent in a submission of some type, and one half of them were new to MM's. This effect was probably due to the success of the TCO Marathon Matches, but also to the fact that the problem was a very attractive one, and it was fairly easy to implement a working solution.
</p>
<h3>Description of the game</h3>
<p>
<i>Samegame</i> is a version of solitaire which is played in several different flavors. In the continuous version, the one involved in the contest, you are faced with a <i>rows x columns</i> grid, randomly filled with blocks of several colors. The only valid moves consist of removing contiguous groups of two or more cells of the same color. When a group is removed the empty space is filled with the blocks above it, which fall down leaving empty blocks in the top. When a column is completely cleared, the columns to its right shift left and a new column randomly filled appears in the last column. An example move is shown in the next figure.
</p>
<div align="center">
    <img src="/i/longcontest/match_editorials/mm17/mm17-01.png" alt="Marathon Match 17 Image 1" />
</div>
<p>
The increment of score obtained for removing a group of <i>N</i> blocks is simply <i>N x (N-1)</i>, 182 points for the example above. The game ends when there are no groups of two or more contiguous blocks left.
</p>
<p>
Observe that we have played foolishly -- if we had removed first the upper-right green group we would have obtained a red group of 15 blocks and thus 210 points, 28 points more, a large increase for such a small board.
</p>

<h3>The problem</h3>
<p>
The problem asked for an algorithm to play <i>continuous samegame</i>, the sizes of the grids and the number of initial colors differed between the test cases: the number of rows and columns were uniformly chosen between 10 and 100, and the number of initial colors was uniformly chosen between 3 and 7.  The next table, made with 1,000,000 random test cases, gives an idea of the dimensions and complexity of the problem.
</p>
<pre>
      |  number of cells in the board    |    number of initial groups    |%largest color
colors|  mean    stddev   5%   50%  95%  | mean   stddev   5%   50%  95%  |  mean  stddev
------- ------- -------- ---- ---- ----- - ------ ------- ---- ---- ----- - ------ ------
   3  | 3024.07  2154.77  479 2479  7349 | 534.51  377.09   87  439  1289 | 34.47%  0.90%
   4  | 3029.65  2157.64  483 2479  7359 | 605.80  430.85   96  495  1469 | 26.24%  0.91%
   5  | 3031.90  2159.03  479 2484  7370 | 600.02  428.19   94  491  1456 | 21.21%  0.84%
   6  | 3021.12  2161.40  475 2474  7349 | 567.64  407.77   87  462  1384 | 17.89%  0.82%
   7  | 3022.26  2149.88  483 2479  7325 | 531.81  380.40   83  434  1295 | 15.48%  0.78%
------- ------- -------- ---- ---- ----- - ------ ------- ---- ---- ----- - ------ ------
  all | 3025.80  2156.56  479 2479  7349 | 567.95  406.70   89  463  1382 | 23.06%  6.80%
</pre>
<p>
Whenever possible I prepare these kinds of stats, with a few more percentiles, before actually coding. They give a good idea of what you can and what you can't do, and where do you have to take care of limits, or what kind of extreme cases you can safely ignore.
</p>
<p>
To handle the game, the coder had to implement a method <i>move</i>, with a single parameter an array of strings, the actual board, each string representing a row, and each character 'A', 'B', ... representing the color of the cell, '.' for empty cells. The method returns an array of two ints, the coordinates of any cell of the group being removed. The method was called with the updated board, until there were no groups left in the board.
</p>
<p>
As the number of total cells cleared exceeded a multiple of <i>rows x cols</i> a new color was added in every new column, making the game progressively more difficult as it advanced.
</p>
<p>
The scoring system was a little peculiar. For every test case the mean and standard deviation of the 20 largest scores obtained was computed, then the normalized score for the test case was computed as<br /><span style="padding-left:20px;">z = max (0, 10 + (score - mean)/ stddev)</span><br />This scoring procedure has suffered a little criticism since it makes it very difficult for the coders to simulate the scores locally. In addition the number of 20 coders has been considered a little small to reduce seriously the variability of the observed scores during the contest.
</p>

<h3>General Strategy</h3>
<p>
All the top coders coincided in a common overall strategy: Eliminate successively all the groups except those of a chosen color. This led usually to a big group of the chosen color, which was then eliminated obtaining a very big score (the <i>big bang</i> as it was called by one participant). The remaining groups were eliminated while trying to open as many new columns as possible, in order to have the largest possible set to begin with in the next round. The cycle was repeated with the fresh set of columns, until the disorder devoured the board.
</p>
<p>
While the general strategy was common, the details of how to construct the big group differed a lot between the different coders, leading sometimes to seemingly contradictory approaches.
</p>

<h3>Obtaining the big group</h3>
<p>
The process I used to obtain the big block is the following:
<ul style="list-style:none;">We pre-compute the complete sequence of moves to completely clear all the groups in the actual set of columns
    <li>1. Pick a color for the big group; I call it the tabu color and a group of this color a tabu group.</li>
    <li>2. While there are groups of a non-tabu color choose one using the following procedure:<br />
        <span style="padding-left:20px;">a. Shuffle the columns and reorder them by decreasing height</span><br />
        <span style="padding-left:20px;">b. Within the higher columns pick all the non-tabu groups that have some block in that column until you have a minimum number of groups (all the available non-tabu groups if there are not enough).</span><br />
        <span style="padding-left:20px;">c. For each selected group measure the disorder of the board after choosing it. Then choose the one that leads to a smaller disorder and simulate the resulting board, the next iteration in 2 will be done with this board.</span><br />
        <span style="padding-left:20px;">d. If the largest tabu block in this board is the maximum so far then keep the actual position for later use.</span></li>
    <li>3. Go back to the position of the sequence computed in 2.d, say the moment where we had a largest tabu group, and discard all the moves since this one to the end of the computed sequence.</li>
    <li>4. Now begin again removing all the groups (tabu or non-tabu) except the big one, pick in every step the movement which gives a largest increase of the big group, or that keeps the same size but increases the global value of all the groups. Stop when there are no groups that increase the value.</li>
    <li>5. Select the big group (<i>the big bang</i>).</li>
    <li>6. With the groups remaining after <b>5</b> apply again the method described in <b>2</b>, but this time without any special color, repeat until there are no groups left.</li>
</ul>
</p>
<p>
We repeat the process 1-6 choosing the different colors as the tabu color, picking first those with a larger number of cells. Measuring the time needed for computing 1-6 for a color, we continue while we think we have time enough to process another color. When we have finished with all the colors, we begin again with the first color, but this time we randomly add in the step 2 movements that increase the size of the big group instead of reducing the disorder.
</p>
<p>
We continue this way until exhausting the time reserved for this turn, then we choose the sequence of moves which leads to a larger value, where this value was computed as the score obtained by the sequence multiplied by a factor of the form <span style="color:red;">1 + const x NC/cols</span> where <span style="color:red;">NC</span> represents the number empty columns obtained in the process.
</p>
<p>
Now we have a sequence of moves which we return one by one to the caller, until being careful of not making an invalid move.
</p>
<p>
The scheduling of times devoted to the different complete rounds described above was a very delicate issue which had very important consequences in the final score. I had only a very rough system to distribute the time, but it led to a very important increase in the score when I devoted more effort to the first rounds and less to the later ones. 
</p>

<h3>Measuring the disorder</h3>
<p>
The function I used to measure the disorder of given board was very simple and could be computed in a reasonable time. We scanned every column from bottom to top adding the following:<br />
<span style="padding-left:20px;">+3 for every isolated block of a non-tabu color such that the last observed isolated cell in this column is of a different color.</span><br />
<span style="padding-left:20px;">+1 for every isolated tabu block.</span><br />
<span style="padding-left:20px;">+1 for every isolated cell of the same color of the last observed isolated cell.</span><br />
</p>
<p>
This function worked rather well, note that we consider that tabu cells add less disorder than the others, since we expect them to finally make part of the big group. The second condition is easily explained with the following figure: The two blue cells are isolated, but they will constitute a group when the green block disappears, this is not the case of the yellow and black clocks, so we can consider that the left column is more ordered than the second.
</p>
<pre>
ask for color in  row, col 
       // returns the necessary moves to place a block of the 
       // asked color in (row,col). An empty list if failure. 

       if is_a_group(row,col) 
             if the first block above the group in row,col has the asked color. 
                 Return a list with (row,col) 
             else ask for a block of color in the first upper position 
                  not in the group 
                  if success return the sequence of moves followed by (row,col)
                  else 
                      simulate the removal of row,col if 
                      ask for a block of color in (row,col)
                      if success return (row,col) followed by the move seq.
                      else return an empty list.
       else
             color2 = color(row,col)
             moves = ask for color2 in row-1,col 
             if success 
                 if block inmediatly above group in row-1,col has the 
                 asked color
                    return moves followed by (row,col)
                 ask for color in cell above group in row-1,col
                 ..... (similar to the pseudo-code above)
             else 
                 moves = ask for color2 in row,col+1 
                 if success 
                     .....
</pre>

<h3>The column clean-up</h3>
<p>
When we have finally played the moves in the sequence obtained before, we are left with a set of dirty columns with no groups on them) in the left-hand side of the board and a set of fresh full columns in the right. The contents of these columns were unknown until now, so we might try to find a sequence of moves that uses the new columns to clear some of the dirty ones.
</p>
<p>
The procedure I wrote tries to clear always the lowest-right block of the dirty columns, asking for the necessary moves to put a block of the same color in his right neighbour, the procedure runs roughly as is shown in the next pseudocode:
</p>
<div align="center">
    <img src="/i/longcontest/match_editorials/mm17/mm17-02.png" alt="Marathon Match 17 Image 2" />
</div>
<p>
the depth of the search was limited to 4 levels, and the procedure was only called under very restrictive conditions on the height of the last dirty column, but sometimes it lead to the cleanup of 4 or more columns leading to very big increases in the score.
</p>
<div align="center">
    <img src="/i/longcontest/match_editorials/mm17/mm17-03.png" alt="Marathon Match 17 Image 3" />
</div>

<h3>Breaking the board in groups</h3>
<p>
One of the main difficulties faced by the coders was the simulation of the effect in the board of a given move, mainly when you were interested in knowing the resulting group structure. This is a very expensive operation, making unaffordable (except in very restrictive conditions) the exhaustive search of all possible moves, or the in depth exploration of several consecutive moves.
</p>
<p>
On the other hand, if all you need is the resulting board after a move, you can find the shape of the group with a BFS (if you don't have it already from the group structure), and then simulate the new board. My method was not very fast since it needed to copy the whole board, but a coder had the clever idea of swapping rows and cols in the original board and, as strings are kept as references, only the modified columns (usually only a few) were actually copied leading to a much faster algorithm.
</p>
<p>
For dealing with the group structure, I used an algorithm <i>weighed union-find with path compression</i>, also called <i>disjoint set data structure</i> which does the job in time almost linear in the size of the board. In spite of the imposing names the algorithm is extremely simple and can be coded in a few lines:
</p>
<pre>
vector&lt;int&gt; count; // count[i] = number of blocks in the tree rooted at i
vector&lt;int&gt; root;  // root[i]  = some ancestor of node i.
                   // when root[i] == i then i is the root of it's component
 
int getRoot(int nd){
    for(; root[nd] != nd; nd=root[nd] )
        root[nd] = root[root[nd]];   // path compression to fasten next search
    return nd;
}
 
void addEdge(int nd1, int nd2){
    int r1 = getroot( nd1 ), r2 = getroot(nd2);
    if(r1 != r2)    
        if( count[r2] &lt; count[r1] )  // pick the new root from the largest tree
            count[r1] += count[r2], root[r2] = r1;
        else 
            count[r2] += count[r1], root[r1] = r2;
}
</pre>
<p>
For a graph with V nodes the algorithm begins with an array root[0..V-1] initialized with root[i] = i and an array count[0..V-1] initialized with count[i] = 1. The edges are added one by one, and at the end, we can answer very fast questions such as: are nodes i and j connected? How many nodes does this component have?
</p>
<p>
To break the board in groups I simply scanned the board left to right and top to bottom adding edges whenever the upper neighbor or the left neighbor, which have been already processed, are of the same color than the current cell.
</p>

<h3>Conclusion</h3>
<p>
As it usually happens with game problems, there have been a lot of different approaches and ideas, leading to very different results. I want to thank TopCoder for another very interesting problem. I'm also grateful for all the recent improvements such as the ratings, the statistics, and the visualization tools (and mainly the TCO!) which are attracting a lot of people to Marathon Matches and making the competition more exciting.
</p>
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