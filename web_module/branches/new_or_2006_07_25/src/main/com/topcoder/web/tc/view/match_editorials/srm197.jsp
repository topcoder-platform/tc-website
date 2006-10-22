<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
<!-- Left Column Begins-->
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
		<jsp:param name="node" value="algo_match_editorials"/>
	</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
<tc-webtag:forumLink forumID="505660" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 197</span><br>Wednesday, June 2, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This match had the overall theme of graph theory and dynamic programming.  The writer of the match was yours truly, 
and it should be no surprise that these two topics are some of my most favorite.  Division 1 coders flew through the 
easy problem, only to be surprised by an unusual medium and hard problems.  <b>SnapDragon</b> was the only one who was 
able to solve all 3 problems, taking over 41 minutes on the hard problem.  In the end, he was ahead of everyone by at 
least 400 points.
<br/><br/>
Division 2 had a different outcome, with 19 successful submissions to the hard problem.  <b>Grk037</b> won the division 
by less than 6 points and is proudly marching on to Division 1.  The success rate of submissions was over 70% for all 
problems, which should be relieving after the last match.
</p>

<p><H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=987&amp;rd=5072">GardenHose</a></b>
</font>
<A href="Javascript:openProblemRating(987)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505660" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2">
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Value</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     250
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Submission Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     118 / 188 (62.77%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     85 / 118 (72.03%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>hustler</b> for 242.41 points (5 mins 3 secs)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     170.60 (for 85 correct submissions)
   </td>
 </tr>
</table></blockquote>

<p>
As the statistics show, this problem gave very little trouble to the coders.  Indeed, it is very straight 
forward and has an easy solution.  We can simply traverse all n*n plants and check each one if it can be 
watered.  This can be done with two nested loops like so:
<br/><br/>
for(int row=0; row&lt;n; row++){ <br/>
&#160;&#160;&#160;for(int col=0; col&lt;n; col++){ <br/>
&#160;&#160;&#160;&#160;&#160;&#160;// Try watering from ends of row. <br/>
&#160;&#160;&#160;&#160;&#160;&#160;if((row+1)*rowDist &lt;= hoseDist) continue; <br/>
&#160;&#160;&#160;&#160;&#160;&#160;if((n-row)*rowDist &lt;= hoseDist) continue; <br/>
<br/>
&#160;&#160;&#160;&#160;&#160;&#160;//Try watering from ends of column. <br/>
&#160;&#160;&#160;&#160;&#160;&#160;if((col+1)*colDist &lt;= hoseDist) continue; <br/>
&#160;&#160;&#160;&#160;&#160;&#160;if((n-col)*colDist &lt;= hoseDist) continue; <br/>
&#160;&#160;&#160;&#160;&#160;&#160;deadPlants++; <br/>
&#160;&#160;&#160;} <br/>
}
<br/><br/>
The four conditions inside the loops check if the plant can be reached by the hose from 4 possible locations.  
In the end, <b>deadPlants</b> contains the number of plants that cannot be watered.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2430&amp;rd=5072">GeneralChess</a></b>
</font>
<A href="Javascript:openProblemRating(2430)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505660" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Value</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     500
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Submission Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     83 / 188 (44.15%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     59 / 83 (71.08%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>SumZero</b> for 390.50 points (16 mins 0 secs)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     275.71 (for 59 correct submissions)
   </td>
 </tr>
</table></blockquote>



Used as: Division One - Level One: <blockquote><table cellspacing="2">
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Value</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     250
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Submission Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     153 / 154 (99.35%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     134 / 153 (87.58%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>tmyklebu</b> for 243.65 points (4 mins 36 secs)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     185.94 (for 134 correct submissions)
   </td>
 </tr>
</table></blockquote>

<p>
With a total of 20001<sup>2</sup> locations, it should be obvious that testing every threatening location will not work.  
We can make the problem requirements work for us.  Notice how we should return only the locations that 
threaten every piece.  This implies that we only need to check 8 locations, all of which threaten the first 
piece in the list.  If any of those 8 locations threaten all pieces, then we add it to the return list.  Sorting 
the final list is a simple matter.  It can be done with good old Bubble Sort, or simply by checking the initial 8 
locations in sorted order.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2829&amp;rd=5072">QuickSums</a></b>
</font>
<A href="Javascript:openProblemRating(2829)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505660" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Value</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     1100
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Submission Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     26 / 188 (13.83%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     19 / 26 (73.08%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>KiD</b> for 871.97 points (15 mins 23 secs)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     664.12 (for 19 correct submissions)
   </td>
 </tr>
</table></blockquote>

<p>
This problem is very flexible when it comes to solving it.  Memoization, dynamic programming, and brute force 
are all good options here.  With at most 10 digits, there are at most 2<sup>9</sup> ways to insert plus signs into the string.  
Therefore, there are at most 2<sup>9</sup> possibilities to consider.  We can use recursion to go through all possibilities and 
keep track of the minimum number of additions required.  The only thing to watch out for is not parsing numbers 
so large that they do not fit into an integer type.  To avoid this problem altogether, we may use a 64-bit integer 
type.  As a challenge, you may write a dynamic programming solution that uses the same principles as the Matrix 
Multiplication problem.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2431&amp;rd=5072">Paths</a></b>
</font>
<A href="Javascript:openProblemRating(2431)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505660" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Value</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     600
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Submission Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     80 / 154 (51.95%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     40 / 80 (50.00%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>tmyklebu</b> for 573.27 points (6 mins 11 secs)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     400.81 (for 40 correct submissions)
   </td>
 </tr>
</table></blockquote>

<p>
This problem has a few different approaches, some of which are dynamic programming and modified shortest path 
algorithms.  Here, I will discuss a way to modify DFS to solve the problem.  First off, DFS can be easily used 
to find the shortest paths from <b>from</b> to all other nodes.  Store those path lengths in a table.  Now, the sentence 
"[find the] ...shortest path length in a directed graph, which is not equal to the optimal shortest path length." 
should immediately jump out because that is exactly what we will do next.  The modified DFS function will start 
from the node <b>from</b> and just like the original DFS, it will recursively search through all edges.  The difference 
is that now you must keep track of all paths and store only the ones that come closest to the optimal path lengths, 
without being equal to those lengths.  Here is what this method may look like:
<br/><br/>
void findSecondBest(int i, int c){ //i=current node.  c=cost to get from <b>from</b> to i<br/>
&#160;&#160;&#160;if(c&gt;=secBest[i]) return;<br/>
&#160;&#160;&#160;if(c==best[i] &amp;&amp; seen[i]) return;<br/>
&#160;&#160;&#160;if(c==best[i]) seen[i]=true;<br/>
&#160;&#160;&#160;else secBest[i]=c;<br/>
<br/><br/>
&#160;&#160;&#160;for(int x=0; x&lt;cost.length; x++){<br/>
&#160;&#160;&#160;&#160;&#160;&#160;findSecondBest(x, c+cost[i][x]);<br/>
&#160;&#160;&#160;}<br/>
}
<br/><br/>
Keep a table <b>seen</b> to avoid checking the same paths many times.  Also, initialize <b>secBest</b> with <br/>
some very large values.<br/>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2428&amp;rd=5072">WaterBot</a></b>
</font>
<A href="Javascript:openProblemRating(2428)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505660" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Value</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     1000
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Submission Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     9 / 154 (5.84%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Success Rate</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     1 / 9 (11.11%)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>High Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     <b>SnapDragon</b> for 472.59 points (41 mins 28 secs)
   </td>
 </tr>
 <tr>
   <td class="bodyText" style="background: #eee;">
     <b>Average Score</b>
   </td>
   <td class="bodyText" style="background: #eee;">
     472.59 (for 1 correct submission)
   </td>
 </tr>
</table></blockquote>

<p>
Dynamic programming can be disguised in so many ways, and this is one of them.  We need to break up the problem into two 
tasks:
<br/><br/>
1) Find all shortest paths between the well and the plants.  To be more precise, store all paths in a table such that you 
can look up the distance from any plant to any other plant or the well and vice versa.  The problem is slightly more 
complicated, because each plant may be watered from four locations and the robot can get water from four locations.  We 
need to have <b>all</b> of those distances in a table for immediate look-up.
<br/><br/>
2) Use DP to solve the problem.  You must imagine the table you created in step 1 as a graph. The edge weights are the 
distances between the plants and the well.  Each plant and the well is represented by four nodes from which the robot can see 
the corresponding plant or well.  Now, two almost obvious observations must be made in order to make DP work.  The first is 
that there are at most 155520 states.  How did I arrive at this number?  It only makes sense if the only places the robot visits 
are plants and the well; any additional movement is pointless.  So, the robot can be found at (4+1)*4 locations at any time.  
In addition, the plants can be in 6<sup>4</sup> states.  Finally, the robot has 6 different amounts of water that it can carry.  
So, there are at most (4+1)*4 * 6<sup>4</sup> * 6 = 155520 states.  This implies that we need to calculate 155520 minimal 
solutions.  The second observation to be made has to do with those states.  We have to realize that optimal solutions from "earlier" 
states can be used to find optimal solutions to "later" states.  For example, the only way to arrive at a state where all plants 
are fully watered is from a state where some plant needs to be watered.  So, we only need to initialize the earliest states where 
no plants have been watered yet and step through all states in order, until all plants are watered.  The averall minimal cost of 
time is in a state where all plants are watered.  Do not forget to allow the robot to go for refills of any amount or water any 
plant with any amount at every state.  The last task is to encode every state to allow for storing of solutions in a table.
<br/><br/>
The overall graph that this DP solution works on is immensely complex to imagine (yes, any DP function by nature solves some 
underlying graph).  As a challenge, try to work backwards after finding the minimal time and print out the optimal path the 
robot should take.
</p>
 
 
<div class="authorPhoto">
    <img src="/i/m/ValD_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="158447" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>

