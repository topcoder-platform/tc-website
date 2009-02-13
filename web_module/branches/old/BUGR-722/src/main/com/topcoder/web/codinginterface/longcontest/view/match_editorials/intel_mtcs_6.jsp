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
<tc-webtag:forumLink forumID="506055" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 6</span><br>06.14.2006 - 06.28.2006
<br><br>

<img src="/i/m/JacoCronje_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="283329" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="title"><A href="/longcontest/?module=ViewProblemStatement&compid=5916&rd=10083">BoxPacking</A></span>
<br><br>
<span class="subtitle">Introduction</span><br>
Bin packing problems are very common and a lot of research information is
available on the subject, as it is yet another NP Complete problem that was
presented in the contest. In the early stages of the contest there were very
few submissions. I thought it was not caused by a lack of interest, but
because it was difficult to create a basic working algorithm. Testing
your algorithm was also not that straightforward and required a lot of effort.
All of this added up to create a great and exciting contest. The final results
showed that it was a very close contest, and it certainly felt like a real marathon for
me.<br><br>

After reading the problem description, the first thing 
I considered was how the scoring would work. I had to decide whether speed or
quality was the most important. After a few calculations it was clear that the
quality of the solutions were much more important. Speed played a roll in the
small test cases where 40 points added to the cost could easily made a
difference of about 1% in the score for that test case. I had a look on the
Internet and read through a few papers and articles on bin packing, just to get
an idea what other people had thought of. I decided to create a basic solution
and take it step by step from there.<br><br>

<span class="subtitle">Testing Environment</span><br>
To be able to interpret the results that my algorithm would give me, I had to
view and evaluate it somehow. I started by creating a testing environment in
which I could visually see the placement of the items inside the boxes in a 3D
environment. You could rotate/pan/zoom around the results, inspecting the
placement of the items and dimension of the boxes. I displayed the percentage
filled of each box and the cost of each box to give me an idea of what was
going on. Further I extended my box packing class to pack one item at a time
and used it to see step-by-step how my program inserted the items. This
environment was quite handy and it was fun to see how the program was packing
the items one by one.<br><br>

Although we were given 10 example test cases, everyone should know that you
need to test your algorithm with a more exhaustive set. It is important to make
sure that your algorithm can handle the worst case input in the given time and
memory limits. The problem description states how the test cases get
generated for a reason. So, I created another small application that generated
test cases for me in the same way that the problem description stated.
<br><br>
<span class="subtitle">Filling a box</span><br>
First the maximum dimensions of the box should be chosen. A valid size
box with the maximum volume/cost ratio could be chosen and then adjusted and
repacked to find a better cost. My program tried to fill the box with different
dimensions and calculated a score for each of these possible filled boxes. The
score was calculated by using the remaining items to fill boxes in a greedy
way, to estimate what the total cost for the remaining items would be. The box
with the best score was then selected and the algorithm moved on to fill the
next box in the same way. This method solved the cases where one huge item
should rather be packed alone rather than with others (example test case 1
demonstrated this case).<br><br>

<span class="subtitle">How to insert an item</span><br>
You need to write a program that can insert items in valid positions... The first
thing that comes to mind is: How am I going to find these valid positions fast
enough? A few methods were used by the coders. I'll briefly state some of them
here:

<ul>
  <li><strong>List of empty spaces<br>
    </strong>Keep track of the empty spaces available inside the box by keeping a list of
      min/max or min/dimension coordinates of each space. I used this method and
      stored the minimum (x, y, z) coordinate and the dimension of each space in a
      list. To accommodate all available spaces and to ease the insertion of items,
      these spaces may overlap. It is then very easy to verify if an item can be
      inserted into one of the spaces by comparing the dimension of the item with the
      dimension of the empty space. To verify if the item could fit, I checked the
      dimensions of each orientation of the item against the space dimensions. The
      cons of this method are that when you decide to insert an item, you need to
      find all the spaces that intersect with the item. Each intersecting space
      should then be split into new spaces which could result in spaces with the same
      size in the list. After each insertion I removed all the spaces that were
      completely inside other spaces. You only need to check the newly inserted
      spaces for duplication. My first algorithm didn't allow the spaces to overlap
      which made things simpler, when inserting an item I simply split the space into
      3 new empty spaces, but the performance was not so good because the boxes
      couldn't be filled completely. </li>
  <li><strong>Boolean array<br>
    </strong>The idea is to store a 3D array which indicates which part of the box has been
  filled or not. The storage can be compressed by using 1 bit for each cell and
  packing the information for a row into a 64 bit variable. When you need to
  check if an item can be inserted you can scan through this data structure to
  verify that no cell is occupied where you want to place the item. Bitwise
  operations could be used to speedup the process. </li>
  <li><strong>Vertices of inserted items<br>
    </strong>A very clever method that was used by venco, you basically keep track of the
  inserted items instead of the empty spaces. I'll quote him: "I don't track
  empty space, but rather vertices of the box and already inserted items instead.
  At each point I maintain 8 bits describing which of 8 solid angles is empty. If
  some point is closed completely I remove it from scan. When adding a new item I
  scan all available points, and try to add the item at each empty direction with
  each of 6 possible orientations. Then I just iterate all inserted items and see
  if the new item intersects with any of them."
  
</li>
  <li><strong>Tetris style - Heightmap<br>
    </strong>Another interesting method is to store the contents of the box as a heightmap,
  and then try to fill the box tetris style. Fill the box from bottom up. You
  just need to try and not create a lot of holes as you fill the box.</li>
  <li><strong>Combining items<br>
    </strong>Another method is to pack each item into its own box and then combine boxes
  that improve your score the most or those who don't waste a lot of space. Keep
  on doing this until you can't improve your score. I experimented with this
  method the last couple of days, but it didn't work very well. I investigated
  this method because it looked promising to optimize the final box with a more
  brute force method. </li>
</ul>
<br><br>

<span class="subtitle">Selecting the item to insert</span><br>
Ok, so now we know how we can insert an item. The next question is, which item
should we try to insert? What would a good heuristic be to define the order of
insertion? If you read a few articles you would quickly come to the conclusion
that the biggest and ugliest items should be inserted first because the smaller
items will fill the gaps. The heuristics that I used were:

<ol>
    <li>Volume of the item. x * y * z.</li>
    <li>Maximum dimension minus minimum dimension. Max(x,y,z)-Min(x,y,z).</li>
    <li>The cost of the item. 4*x*y + 2*x*z + 2*y*z.</li>
    <li>Sum of the dimensions. x + y + z.</li>
</ol>

I used the above heuristics to create the starting order, after each iteration
the order was randomly shuffled (10+n/8) times, where n = total number of
items. I swapped only items that were next to each other in the order.<br><br>

<span class="subtitle">Where to insert the item</span><br>
OK, so now we know how to insert an item and we know the order in which we want
to insert the items. The next step is to determine where to insert the item if
it fits somewhere inside the box. I used the following heuristics to minimize
the:
<ol>
    <li>Cost of the new dimensions of the box after the item has been inserted.</li>
    <li>Dimension sum of the new dimensions of the box after the item has been inserted. This method worked better than heuristic 1.</li>
    <li>Offset of the position where the item will be inserted. (OffX+OffY+OffZ).</li>
    <li>Dimensions of the space where the item will be inserted. (SpaceDimX+SpaceDimY+SpaceDimZ).</li>
    <li>Empty space left inside the box after inserting the item.</li>
</ol>

I used heuristic 2 and 4 when filling boxes other than the last one. For the
last box I tried all the heuristics and kept the best result.<br><br>

<span class="subtitle">Threading</span><br>
The competition is all about multi-threading and the 8 cores can really speed
things up and increase the space that you can search within the time limit. I
used 8 threads to calculate solutions for me, each of them using a different
order based on the heuristics mentioned above.<br><br>

<span class="subtitle">Genetics</span><br>
In the later stages of the contest, I changed my algorithm to be more like a
genetic algorithm. Each gene was represented by the order in which the items
will be inserted. The population consisted of 8 genes, spread across 8 threads.
The fitness of the gene was the score that the algorithm will get when
inserting the items in the order specified by the gene. After each generation,
the best 4 genes and the best gene found thus far were used to generate the
next generation. The order contained in these surviving genes was shuffled.
This approach worked well in the smaller test cases because the time it took to
calculate the fitness of a generation was fast. With the larger test cases it
did not make a big difference because not many generations were calculated.<br><br>

<span class="subtitle">Timeout</span><br>
It is very important to make sure that your function exits in time. One failed
test case can be fatal. I decided to output my best solution whenever the
elapsed time went over 30 seconds. If the next iteration could increase the
execution time to over 35 seconds I didn't iterate again but rather output the
best solution thus far. When no better solution was found in 8 seconds and
2000.0/MaxCost&gt;0.03 I exit the function yet again. (MaxCost = the cost when you
pack each item in its own box.)<br><br>

<span class="subtitle">Conclusion</span><br>
I enjoyed the contest and it was fun. Thanks to Intel and TopCoder for
providing us with such interesting and challenging contests and encouraging us
to learn more about duel core processors and multi-threading. Keep up the good
work!<br><br>
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