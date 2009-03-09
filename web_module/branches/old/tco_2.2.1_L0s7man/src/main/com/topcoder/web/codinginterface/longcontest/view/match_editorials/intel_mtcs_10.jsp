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
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180" id="onLeft">
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

<div style="float: right;" align="left"><A href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
<span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="506148" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 10</span><br>10.18.2006 - 11.01.2006
<br><br>

<img src="/i/m/JacoCronje_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="283329" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="title"><A href="/longcontest/?module=ViewProblemStatement&compid=6097&rd=10123">MapMaker</A></span>
<p>
  Graph coloring is a widely studied subject, which made this Intel
  Multi-Threaded competition very interesting because a wide variety of
  algorithms could be used to approximate this NP complete problem.
</P>

<p>
  First I created a small program that generated test cases for me. It could
  check for valid solutions, calculate a score for my solution and run my
  solution -- with a few thousand test cases to benchmark it against.
</P>

<p>
  The MapMaker problem can be broken down into two separate problems. The first
  is to find the minimum number of colorings for the graph; the second is to
  optimize the printing cost for a specific number of colors. The minimum number
  of colors was the most important part, and at the end I concentrated to
  improve that instead. My final submission managed to find a better coloring
  than the rest of the competitors in some test cases, and because of that I
  managed to win the contest in the end.
</P>
<H1 CLASS=western>
  Minimum coloring
</H1>
<H2 CLASS=western>
  Four color theorem
</H2>
<p>
  The problem closely relates to the four color theorem. The theorem states that
  a map can be colored with four or less colors if each region is contiguous. In
  the Map Maker case, not all regions are always contiguous. This gave us a hint
  that the optimal number of colors for most test cases will be relatively
  small.
</P>
<H2 CLASS=western>
  Sequential Coloring
</H2>
<p>
  The coloring of a graph using sequential coloring depends on the order in
  which the nodes of the graph are colored. We define <I>order[i]</I> as the
  <I>i</I>-th node that will be colored. The color ordering of the nodes stays
  the same throughout the algorithm. The algorithm works as follows:
</P>
<OL>
  <li>
      Initialize the number of colors used. <I>ColUsed = 0.</I>
    </li><li>
        Start with the first node. <I>i = 0.</I>
      </li><li>
          Set the node to be colored. <I>j = order[i].</I>
        </li><li>
            Find the color with the lowest index between <I>1</I> and
            <I>ColUsed</I> that gives a legal coloring for node <I>j</I>.
          </li><li>
              If no color gives a legal coloring, increase <I>ColUsed</I> with
              one and color node <I>j</I> with <I>ColUsed</I>.
            </li><li>
                Else color node <I>j</I> with the color found in step 4.
              </li><li>
                  Increase <I>i</I> with one.
                </li><li>
                    If <I>i</I> is less than the total number of nodes goto step
                    3.
                  </P>
</OL>
<p>
  Sequential coloring will always be able to find the optimal coloring if you
  can give it the optimal order. Finding the optimal order is NP complete. The
  nice thing about sequential coloring is that given a graph that is already
  colored, you can easily retrieve the coloring order that you can give to the
  sequential algorithm that will produce the same coloring as before. Simply
  order the nodes according to their color, all the nodes with the color 1
  should be colored first, then those with color 2, etc. Sequential coloring is
  also very fast, but as you might notice not very effective.
</P>
<H2 CLASS=western>
  Genetic Algorithm
</H2>
<p>
  The first algorithm that I tried in combination with sequential coloring was a
  genetic algorithm. Each gene is represented by a coloring order.
</P>
<p>
  The fitness of the each gene was calculated as follows:
</P>
<OL>
  <li>
      Run the sequential coloring algorithm on the coloring order of the gene.
    </li><li>
        Calculate the sum of all the colors.
      </li><li>
          Add (number of colors used) * (The number of nodes in the graph) to
          the sum.
        </li><li>
            Use the sum as the fitness value for the gene.
          </P>
</OL>
<p>
  The mutation was performed as follows:
</P>
<OL>
  <li>
      Select a random index <I>i</I> between 0 and the number of nodes in the
      graph.
    </li><li>
        Swap the coloring order of the index selected in 1. with the next
        ordering. i.e. <I>swap(order[i], order[i+1]).</I>
      </li><li>
          Repeat steps 1 and 2, number of nodes divided by 4 times.
        </P>
</OL>
<p>
  I experimented with a few crossover techniques. The simplest one:
</P>
<OL>
  <li>
      Select a random index <I>i</I> between 0 and the number of nodes in the
      graph.
    </li><li>
        The coloring order of the first offspring consists of the coloring order
        of gene 1 from index 0 up to<I> i</I> and the rest of the ordering was
        filled with the ordering of gene 2 where nodes weren’t in the new
        ordering yet.
      </li><li>
          The coloring order of the second offspring worked in the same way, but
          the order of gene 2 was used first instead.
        </P>
</OL>
<p>
  More complex crossover:
</P>
<OL>
  <li>
      Find all the overlapping parts of the colorings produced by gene 1 and 2.
      If node 1 was colored with color 3 by gene 1, and colored with color 4 by
      gene 2, then node 1 will fall into part 3:4. If node 5 was colored with
      color 2 by gene 1, and colored with color 2 by gene 2, then node 5 will
      fall into part 2:2.
    </li><li>
        Create a new graph where each node is linked to a unique part.
      </li><li>
          Setup the adjacency matrix according to the part connections.
        </li><li>
            Run a brute force algorithm on the new graph to try and create a
            better coloring. This new graph is much smaller than the original
            graph.
          </li><li>
              Convert the coloring back to the order that will produce it.
            </P>
</OL>

<p>
  The genetic algorithm worked ok, but again was not very effective.
</P>

<H2 CLASS=western>
  DSATUR – Maximum degree of saturation
</H2>
<p>
  DSATUR works almost the same as sequential coloring, but the coloring order
  changes dynamically after each node has been colored. The basic algorithm:
</P>
<OL>
  <li>
      Start with the node that has the maximum degree.
    </li><li>
        Color the current node with the lowest available color.
      </li><li>
          Select the next node by selecting the node with the maximum degree of
          saturation. This means that you have to select the node that has the
          most number of unique neighboring colors. In case of a tie, use the
          node with the largest degree.
        </li><li>
            Goto step 2. until all nodes are colored.
          </P>
</OL>
<p>
  This algorithm works much better than the sequential coloring algorithm and
  gives a good solid starting solution and can be implemented to run very fast.
</P>

<H2 CLASS=western>
  Brute Force
</H2>
<p>
  I also tried the brute force way. First I started by tweaking the sequential
  coloring algorithm to color the graph recursively, at each step the algorithm
  try to color the current node with all the available colors and move on to the
  next node recursively. This algorithm was guaranteed to find the optimal
  number of colors, but obviously was way too slow.
</P>
<p>
  I then modified the brute force algorithm to use the order given by DSATUR to
  color the graph. It gave me better solutions much faster, but it was still way
  too slow.
</P>
<p>
  I then restricted each node to be colored with a maximum of 2 colors when the
  index of the node was less than 15. This algorithm was not guaranteed to find
  the optimal coloring, but completed within the time limit. I ran the algorithm
  on all 8 cores, each with a different starting node, and it produced good
  results. I managed to stay in the top 10 with this algorithm.
</P>
<H2 CLASS=western>
  Backtracking
</H2>
<p>
  I had to investigate the brute force algorithm further because I could find a
  7 coloring solution -- for example, test case 6 -- with it. I wanted the
  algorithm to be much faster. Clever backtracking can speed up the algorithm.
  Suppose we have an upper bound for our graph coloring, we can determine an
  upper bound by running a DSATUR algorithm. During the brute force algorithm we
  can then determine that we need to backtrack when we can’t color a node with a
  color less than our upper bound. The question is how far we can backtrack. I
  determined the backtracking distance in the following way:
</P>
<OL>
  <li>
      When a node is colored, keep track of the index of when that node is
      colored. For example: If node 12 is the 5<SUP>th</SUP> node that gets
      colored, store the index 5 for node 12.
    </li><li>
        For each unique color that is adjacent to the current node that needs
        backtracking, determine the minimum index calculated in step 1.
      </li><li>
          Find the maximum of all the minimums calculated in step 2.
        </li><li>
            Backtrack up to the index found in step 3.
          </P>
</OL>

<p>
  The algorithm described above could find the best number of colorings for all
  the example test cases that I could find within 20 seconds. I didn’t submit a
  full submission with this algorithm, so I am not sure how it would have done
  with the final test cases. My final submission, which used a different
  algorithm, managed to find these colorings much faster.
</P>

<H2 CLASS=western>
  Iterative greedy
</H2>
<p>
  The iterative greedy algorithm works from an existing graph coloring and uses
  the sequential coloring algorithm to produce graph colorings with the same or
  better colorings. The coloring order of each color class is interchanged and
  given to the sequential coloring to color. The result is guaranteed to produce
  the same or better result. For example: If the original coloring can be
  achieved by coloring nodes:
</P>
<p>
  1, 2, 8 with color 1
</P>
<p>
  3, 5 with color 2
</P>
<p>
  6, 7 with color 3
</P>
<p>
  4 with color 4
</P>
<p>
  For the group ordering (1,2,3,4), the coloring order would be 1, 2, 8, 3, 5,
  6, 7, 4.
</P>
<p>
  For the group ordering (4,3,2,1), the coloring order would be 4, 6, 7, 3, 5,
  1, 2, 8.
</P>
<p>
  For the group ordering (2,4,1,3), the coloring order would be 3, 5, 4, 1, 2,
  8, 6, 7.
</P>
<p>
  All of the above coloring orders are guaranteed to produce graph colorings
  with at most 4 colors.
</P>
<p>
  The iterative greedy process can be repeated with different permutations of
  the group ordering to produce different results. My version of the algorithm
  keeps track of the best solution found thus far, and selects a random
  permutation at each iteration. If there were no improvement over 100
  iterations, the algorithm starts again with the current best solution.
</P>
<p>
  Iterative greedy algorithm worked ok, but on its own it didn’t produce
  excellent colorings.
</P>
<H2 CLASS=western>
  TABU search
</H2>
<p>
  The basic idea behind TABU search is to take a graph coloring that contains
  conflicts, and then try to repair the conflicts to produce a valid graph
  coloring. When a graph coloring contains conflicts, it means that there are
  some nodes in the graph whose color is the same as an adjacent node. My TABU
  algotihm worked as follows:
</P>
<OL>
  <li>
      Take a valid graph coloring solution as input.
    </li><li>
        Reduce the amount of colors used by assigning a random color to the
        nodes that are colored with the maximum color.
      </li><li>
          Generate (number of nodes)/4 neighbors for the current coloring.
        </li><li>
            A neighbor is generated by selecting a random node which is in
            conflict and assign a random color to that node.
          </li><li>
              Select the neighbor that contains the least amount of conflicts.
            </li><li>
                Use the neighbor selected in step 5. as the new coloring.
              </li><li>
                  If no conflicts exist, exit the search, otherwise goto step 3
                  until the maximum number of iterations are reached.
                </li><li>
                    If no solution has been found, increase the number of colors
                    to use and goto step 3.
                  </P>
</OL>
<p>
  During the TABU search, you have to keep a list which contains the reverse
  move that was done, and don’t allow moves in the list during the following
  iterations. I used a tabu list of size 15. If the size of the list is too
  small, cycles might occur during the search. If the size is too big, the
  search might get stuck. I cleared the list when no neighbor could be
  generated. The tabu list works in a FIFO manner, so when it reaches the
  maximum size, you need to remove the oldest item.
</P>

<p>
  For example: If the best neighbor was created by coloring node 23 with color 5
  and the color of node 23 was 1 before the move was made, then 23:1 should be
  added to the list, don’t allow node 23 to be colored with 1 during the
  following iterations as long as 23:1 is in the list.
</P>
<H2 CLASS=western>
  Combined TABU search and Iterative greedy
</H2>
<p>
  My final submission contained an algorithm that combined the Iterative Greedy
  and TABU search algorithms. It basically does the following:
</P>
<OL>
  <li>
      Execute the Iterative Greedy algorithm for X amount of iterations.
    </li><li>
        Execute the TABU search algorithm on the best solution found thus far.
        Use Y amount of iterations for the search.
      </li><li>
          Goto step 1 until the time is up.
        </P>
</OL>
<H1 CLASS=western>
  Minimum printing cost for a coloring
</H1>
<p>
  After each sequential coloring my program tried to reduce the printing cost by
  using a hill climbing algorithm.
</P>
<p>
  First it sorted the color classes according to the total area size of each
  color class. For example if the area of all the nodes with color 5 is 2000 and
  the nodes with color 4 is 1000, then it is better to color the nodes with area
  2000 with color 4 and those with area 1000 with color 5.
</P>
<p>
  Next I tried to exchange the colors of nodes to produce a smaller cost.
</P>
<OL>
  <li>
      Calculate the cost of the coloring.
    </li><li>
        For each node color it with each color used.
      </li><li>
          For each node that is in conflict with the node in step 2 find a valid
          color.
        </li><li>
            If there are no conflicts after step 3 for the node in step 2
            calculate the cost of the coloring.
          </li><li>
              If the cost calculated in step 4 is less than the cost calculated
              in step 1 accept the new coloring otherwise undo the coloring.
            </li><li>
                Continue step 2.
              </P>
</OL>

<H1 CLASS=western>
  Multi Threading
</H1>
<p>
  I created 8 threads and ran the TABU search + Iterative greedy algorithm on
  each of them with different parameters. The parameters consisted of the number
  of iterations to use for the Iterative Greedy algorithm and the number of
  iterations for the TABU search. The threads that used a high number of
  iterations for TABU search had a better chance of producing a better coloring,
  while the other threads produce a better printing cost for the specific
  coloring.
</P>

<H1 CLASS=western>
  Conclusion
</H1>
<p>
  There are a lot of papers available on the Internet about graph coloring,
  which gave everyone a chance to expand their knowledge. Thank you, TopCoder
  and Intel, for providing us with such a challenging contest!
</P>
   </div>
</div>
</td>

<%-- Right Column Begins --%>
<td width="170" id="onRight">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>
</body>
</html>