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
<tc-webtag:forumLink forumID="505580" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 144</span><br>Wednesday, April 30, 2003
<br><br>

<span class="bigTitle">Match summary</span>

                        <p>ZorbaTHut was dominant in SRM 144, outscoring second place SnapDragon by almost 150 points - without the aid of any 
                        challenges. His strong performance gave him 116 points, and moved him up to 6th overall. SnapDragon came in second as 
                        the only other coder with 3 correct submissions. Overall, the problems were a little more difficult than usual, and were 
                        scored as such. In division 2, bladerunner, a new comer, led the pack by an equally large margin, beating second place 
                        jorend by almost 200 points. Congrats to ZorbaTHut and bladerunner. </p>

<H1> The Problems </H1> 

                        <font size="+2"><strong>Time</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505580" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II, Level 1:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">200</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">234 / 252 (92.86%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">212 / 234  (90.60%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>haro</strong> for 199.20 points</td></tr>
                        </table>
                        </blockquote>


                        <h4>Implementation</h4>

                        <p>
                        This problem could be solved pretty simply with a couple of division and modulus operators. The important thing here was to understand the % operator which gives you 
                        the remainder from a division. Thus, you could find &lt;H&gt;, &lt;M&gt; and &lt;S&gt; easily as follow: 
<pre>
int h = seconds/3600;
int m = (seconds%3600)/60;
int s = seconds%60;
</pre>


                        
                        </p>

                        <font size="+2"><strong>Binary Code</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505580" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II, Level 2:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">550</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">141 / 252 (55.95%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">33 / 141 (23.40%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>bladerunner</strong> for 440.91 points</td></tr>
                        </table>
                        </blockquote>
                        
                        Used as: Division-I, Level 1:
                        
                         <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">300</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">96 / 104 (92.31%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">66 / 96 (68.75%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>SnapDragon</strong> for 289.24 points</td></tr>
                        </table>
                        </blockquote>


                        <h4>Implementation</h4>

                        <p>This problem was a little bit tricky at first glance. However, the examples in the problem statement gave you a good idea of how to do it. Once you make an assumption about 
                        the value of the first bit, you can then determine the value of the next bit, and so one until you get to the last bit. If, while you are going along, you find that you would have to 
                        set a bit to a number other than 0 or 1 to make the sum work out, then the assumption you made at the beginning has caused some sort of inconsistency, and leads to the answer 
                        "NONE". One tricky thing is that, when you get to the last bit, you have to look ahead and see what the next bit would have to be for the given encoding to occur. Since the last 
                        bit is off the end of the string, it has to be 0. If the encoding requires it to be anything else, you again have an inconsistency. Most people who failed seemed to make mistakes 
                        either with the single digit case, or in checking the end digit. </p>
     
                        <font size="+2"><strong>PowerOutage</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505580" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II, Level 3:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">1100</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">24 / 252 (9.52%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">9 / 24 (37.50%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>bladerunner</strong> for 872.75 points</td></tr>
                        </table>
                        </blockquote>



                        <h4>Implementation</h4>

                        <p>In this problem we are given series of tunnels, which can be represented as a rooted tree, and are asked to find the total path length required to visit every node at 
                        least once, starting from node 0. The way to solve this problem is to think about how you would do it if you had to. First, you would go down one tunnel leading away 
                        from tunnel 0, and then go down all of the tunnels leading away from that one. In other words, you should completely explore a subtree before returning to the root 
                        to explore another subtree. If you think about this a little, and draw some trees, you see that every edge gets traversed exactly once. However, at the end, you don't 
                        have to go back to the root. Once you have visited all of the nodes, you are done. So, it makes sense to end your search at the node that is farthest away from the root. 
                        That way, you have to traverse all of the edges from the root to that node one less time. Thus, the total distance turns out to be (2 * sum of all edge weights) - 
                        (length of the longest path starting at the root). </p>

                        <font size="+2"><strong>Lottery</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505580" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I, Level 2:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">550</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">52 / 104 (50.00%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">45 / 52 (86.54%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>ZorbaTHut</strong> for 482.98 points</td></tr>
                        </table>
                        </blockquote>


                        <h4>Implementation</h4>

                        <p>
 There are a couple of different ways to solve this. One of them involves 
dynamic programming, and the other involves combinatorics. I will describe the 
combinatoric approach, which is simpler to code, if you can come up with it. 
<BR />
<BR />First, it is clear that most of the problem involves counting the number 
of possible ways to fill in each lottery ticket. After that it's just sorting. 
There are 4 cases to consider here. 
<OL>
  <LI>The easiest is when both unique and sorted are false. There are then 
  <TT>choices</TT> options for <TT>blanks</TT> spaces, for a total of 
  <TT>choices<SUP>blanks</SUP></TT> total tickets. </LI>
  
  <LI>The next easiest case is when they only have to be unique. There are 
  <TT>choose(choices,blanks)</TT> ways to choose <TT>blanks</TT> numbers to fill 
  in, and <TT>fact(blanks)</TT> ways to order each set. So, there are 
  <TT>choose(choices,blanks) * fact(blanks)</TT> total ways to fill in a ticket 
  that must be unique. For those of you not familiar with it, the function 
  <TT>choose(n,m)</TT> is a binomial coefficient and is given by 
  <TT>fact(n)/fact(m)/fact(n-M)</TT> and gives the number of ways to choose m 
  things out of n total (<A 
  href="http://mathworld.wolfram.com/BinomialCoefficient.html">read more at 
  MathWorld</A>). fact(blanks) then gives the number of ways to order the chosen 
  numbers. </LI>
  
  <LI>Perhaps equally easy is when they must be both unique and sorted. 
  Similarly, there are <TT>choose(choices,blanks)</TT> ways to pick your 
  numbers, but now there is only one way to fill them in - sorted. Thus the 
  number of ways to fill in the ticket when sorted and unique are both true is 
  just <TT>choose(choices,blanks).</TT> </LI>
  
  <LI>The trickiest case is when sorted is true, and unique is false. The answer 
  turns out to be <TT>choose(choices + blanks - 1,blanks)</TT>, though this 
  certainly isn't obvious. One way to think about this is to imagine that you 
  have <TT>(choices + blanks - 1)</TT> balls in a row, and you want to color 
  <TT>blanks</TT> of them red, and the rest blue. Now, we will assign a number 
  to each of the red balls that is equal to the number of blue balls to the left 
  of that red ball + 1. Since there are a total of <TT>choices</TT> - 1 blue 
  balls, all of the red balls will be numbered in the range 1 .. 
  <TT>choices</TT>. Also, the numbers on the balls must be in non-descending 
  order, since there can't be less blue balls to the left of a ball that is 
  further to the right. For example, if you blanks = 4 and choices = 7, then you 
  have 10 balls, and color 4 of them red. If you color them as: 
  
  <BR /><pre>         RBBRRBBBRB</pre> 
  <BR />The numbers on the red balls are then 1,3,3,6. It turns out that every 
  sequence of non-descending integer in the given range can be generated by 
  coloring some balls red as described and that all of the colorings lead to 
  distinct sequences of integers. Thus, the total number of sequences for this 
  case is <TT>choose(choices + blanks - 1,blanks)</TT>. 
  </LI>
  </OL>Once you have the odds for all four cases, you are pretty much done. 
                        
                        </p>

                        <font size="+2"><strong>PenLift</strong></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505580" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-I, Level 3:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">550</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">6 / 104 (5.77%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">4 / 6 (66.67%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>ZorbaTHut</strong> for 830.84 points</td></tr>
                        </table>
                        </blockquote>


                        <h4>Implementation</h4>

                        <p>
A fairly well known theorem states that to go over all of the edges in a 
connected graph requires numOfOddVertices/2 total paths. This is related to 
Euler's famous theorem that a graph has an Eulerian walk if and only if the 
number of odd vertices is less than or equal to 2. So, now how does this apply? 
Well, if we look at the drawing we are trying to make as a graph, where 
intersections and endpoints are vertices, and segments are edges, then we are 
trying to go over all of the edges in this graph <TT>n</TT> times. This is the 
same as having <TT>n</TT> edges between each pair of adjacent vertices. So, once 
we construct the graph, we should first split it into a number of connected 
components, and then compute the number of odd vertices in each component. The 
total number of paths required will be the <TT>sum over all 
components(min(1,numberOfOddVerticesInComponent/2))</TT>. Since we get to start 
anywhere, the actual result will be one less than this. Finding the connected 
components and the number of odd vertices is pretty simple graph theory and can 
be done with a depth first search. The tricky part is building the graph. There 
are probably many ways to do this, and I'll just describe my approach: 
<OL>
  <LI>Merge all pairs of segments that are colinear and overlap into a single 
  segment. </LI>
  <LI>Initialize a set of points that will represent vertices in the graph. </LI>
  <LI>Add both of the endpoints of all of the line segments to the set.</LI> 
  <LI>Check all pairs of perpendicular segments. If they intersect, add the 
  point of intersection to the set. </LI>
  <LI>Initialize a graph whose vertices correspond to all the points in the set. 
</LI>
  <LI>For each pair of vertices with equal x or equal y coordinates, check to 
  see if there is another vertex on the line segment between them. If there is, 
  continue on to the next pair. If there isn't, check all of the given line 
  segments to see if both of the points are on the segment, and hence are 
  connected. If they are connected, add an edge in the graph between the two 
  vertices.</LI> 
  <LI>Wherever there is an edge between 2 vertices, set the number of edges 
  between the two vertices to <TT>n</TT>. </LI>
  <LI>Run your graph algorithm to obtain the result. </LI>
  </OL>
  It is worth noting that the only thing that matter is whether <TT>n</TT> is odd or even. If it is 
even, the answer is simply the <TT>number of connected components - 1</TT>. 
                        
                        </p>

<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
