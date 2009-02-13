<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:import href="../top.xsl"/>
 <xsl:import href="../script.xsl"/>
 <xsl:import href="../includes/body_top.xsl"/>
 <xsl:import href="../foot.xsl"/>
 <xsl:import href="../includes/modules/srm_results.xsl"/>
 <xsl:import href="../includes/modules/white_last_srm.xsl"/>
 <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
 <xsl:import href="../includes/modules/coder_week2.xsl"/>
 <xsl:import href="../includes/modules/practice_room.xsl"/>
 <xsl:import href="../includes/modules/calendar.xsl"/>
 <xsl:import href="../includes/modules/top_room_wins.xsl"/>
 <xsl:import href="../includes/global_left.xsl"/>
 <xsl:import href="../includes/public_right_col.xsl"/>
 <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
 <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 194 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
 win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
 win.location.href = url;
 win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">

<!-- Left Column Begins -->
     <td width="170" bgcolor="#FFFFFF">
         <xsl:call-template name="global_left"/>
     </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
     <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
     <td class="bodyText" width="100%">
         <xsl:call-template name="BodyTop">
             <xsl:with-param name="image1">white</xsl:with-param>
             <xsl:with-param name="image">statisticsw</xsl:with-param>
             <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
         </xsl:call-template>

         <table border="0" cellspacing="10" cellpadding="0" width="100%">
         <tr valign="top">
                 <td class="bodyText" width="100%">

<!--body contextual links-->
                     <table width="100%" border="0" cellspacing="0" cellpadding="3">
                         <tr valign="middle">
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 194</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Saturday, May 15, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2> 
<p> 
Saturday competitions are slowly gaining acceptance and it is wonderful
to see that over 350 contestants turned up. For many international
competitors it is the perfect opportunity to gain some valuable TopCoder
experience.</p>
<p>Division 1 coders had little trouble completing their easy. Once this
was out of the way, coders faced a puzzling medium. The medium turned out 
to be easy to code once the solution became apparent. As often
<b>Antimatter</b> started the match in great style with fast submissions
on the first two problems. He was closely followed by a hungry pack of
reds. The challenge phase had its fair share of challenges. <b>jshute</b> 
picked up two successful challenges, which in the end, gave him his
second SRM win. <b>texel</b> continued his assault of the top by
finishing in a well deserved second place. The bronze went to
<b>Yarin</b> who gained his target back and became a record 10th member
of the elite group of "targeteers".</p>
<p>
Division 2 received a whole bag of incredibly fast submissions on the
easy problem. The medium was generally well answered too. Nearly one
third of coders attempted the hard, but only 6 were rewarded for their
efforts. <b>Icedawn</b> finished on top. He was followed by
<b>decypher</b> and <b>Joker</b> who were separated by less than a point. 
First timer <b>Zis</b> earned a respectable fourth and a healthy yellow rating.
</p> 

<p>
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=1650&amp;rd=5069">Soccer</a></b> 
</font> 
<A href="Javascript:openProblemRating(1650)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
182 / 187 (97.33%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Success Rate</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
181 / 182 (99.45%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>High Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
<b>Sleeve</b> for 249.68 points (1 mins 1 secs) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Average Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
237.52 (for 181 correct submissions) 
</td> 
</tr> 
</table></blockquote> 
<p>
There were a few records broken on this problem. Congratulations to
<b>Sleeve</b> for having the fastest solution for any problem ever! Just
as amazing was the fact that only one coder failed this problem! The
problem deals with the standard scoring system found in most soccer
leagues. Teams receive 3 points for each win and 1 point for each draw.
Thus the total score for team <i>i</i> becomes 3*wins[i]+ties[i]. The
rest of the problem is simply a matter of memorizing the highest total.
Here is the code:

<pre>
public int maxPoints(int[] wins, int[] ties)
{
   int max=-1;
   for (int i=0; i&lt;=wins.length-1; i++)
      max=Math.max(max,3*wins[i]+ties[i]);

   return max;
}
</pre>
</p> 
<font size="+2"> 
<b><a
href="/stat?c=problem_statement&amp;pm=2422&amp;rd=5069">ThirtyOne</a></b> 
</font> 
<A href="Javascript:openProblemRating(2422)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
152 / 187 (81.28%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Success Rate</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
94 / 152 (61.84%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>High Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
<b>therealmoose</b> for 465.37 points (7 mins 52 secs) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Average Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
301.06 (for 94 correct submissions) 
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
172 / 172 (100.00%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Success Rate</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
132 / 172 (76.74%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>High Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
<b>fiasco</b> for 246.20 points (3 mins 32 secs) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Average Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
197.69 (for 132 correct submissions) 
</td> 
</tr> 
</table></blockquote> 
<p>
In the game of Thirty One, players aim to collect a hand of 3 cards in a
way that maximizes the total value of the hand. The scoring system is
very similar to that of Blackjack, with the exception that 3 identical
cards produce a value of 30.5. A good way to start the problem is to
write a function that evaluates each card:
<pre>
public int card(String card)
{
   if (card.equals("A")) return 11;
   if (card.equals("J") || card.equals("Q") || card.equals("K")) return 10;
   return Integer.parseInt(card);
}</pre>

Note that we have assigned Ace to have a value of 11. The only time when
Ace should be 1 instead of 11 occurs when the hand exceeds 31. Thus if
our total is over 31 then we know that we have to subtract 10 to
accommodate this change. One other case that we need to consider is when
the total is 30.5. Many coders chose the safe path of having integer
total and doubling 30.5 to 61. In this problem however, it is just as
safe to use doubles.

<p>Geared with this knowledge, we can now go through the list of
<b>hands</b>, evaluate each hand and keep track of the hand with the
highest total:</p>
<pre>
public int findWinner(String[] hands)
{
   int pos=0;
   double max=-1;
   
   for (int i=0; i&lt;=hands.length-1; i++)
   {
      String[] cur=hands[i].split(" ");
      double total=0;

      for (int k=0; k&lt;=cur.length-1; k++)
         total+=card(cur[k]);

      if (cur[0].equals(cur[1]) &amp;&amp; cur[1].equals(cur[2])) total = 30.5;
         
      if (total&gt;31) total-=10;
         
      if (total&gt;max)
      {
         max=total;
         pos=i;
      }      
   }

   return pos;
}
</pre>

For the complete implementation of this have a look at <b>writer's</b>
solution in the practice rooms.
</p> 
<font size="+2"> 
<b><a
href="/stat?c=problem_statement&amp;pm=2387&amp;rd=5069">DiskScheduler</a></b> 
</font> 
<A href="Javascript:openProblemRating(2387)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
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
50 / 187 (26.74%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Success Rate</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
6 / 50 (12.00%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>High Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
<b>Zis</b> for 642.04 points (24 mins 16 secs) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Average Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
504.82 (for 6 correct submissions) 
</td> 
</tr> 
</table></blockquote> 
<p>
Many coders falsely mistook this problem as an easy 1000. However as
coders found out, initial looks can be deceiving. The problem cannot be
solved by simply rotating the disk clockwise or counter-clockwise until
all <b>sectors</b> have been serviced. The optimal solution can involve
rotating the disk in one direction and then rotating in the opposite
direction. Since this is a Division 2 problem after all, we can expect to 
be able to solve this without the need of complex algorithms. We begin
the solution by writing a function that returns the distance from sectorA 
to a sectorB depending on the proposed direction of traversal. Direction
will be 1 for clockwise and -1 for counter-clockwise:
<pre>
int dist(int sectorA, int sectorB, int dir) 
{
   int count=0;
   
   while (sectorA!=sectorB)
   {
      sectorA+=dir;
      count++;
      if (sectorA==101) sectorA=1;
      if (sectorA==0) sectorA=100;
   }

   return count;
}
</pre>

We proceed by showing that the optimal solution will at most have one
reversal of direction. Suppose there exists a path which is both optimal
and has two reversals of direction then clearly within that path will lie 
a smaller path. All that we need to do now is try all <b>sectors</b> that 
could be our reversal locations. Finally, we must try going both
clockwise and counter-clockwise to reach those locations. Our final
return is the minimum distance of all those combinations:
<pre>
public int optimize(int start, int[] sectors)
{
   Arrays.sort(sectors);
   int min=Integer.MAX_VALUE;
   
   for (int i=0; i&lt;=sectors.length-1; i++)
   {
      int previousSector=sectors[(i-1+sectors.length)%sectors.length];
      int nextSector=sectors[(i+1)%sectors.length];

      //go clockwise then counter-clockwise
      int dist1=dist(start,sectors[i],1);
      //check if reversal is required
      if (dist(start,nextSector,1)&gt;=dist1)
         dist1+=dist(sectors[i],nextSector,-1);

      //go counter-clockwise then clockwise
      int dist2=dist(start,sectors[i],-1);
      //check if reversal is required
      if (dist(start,previousSector,-1)&gt;=dist2)
         dist2+=dist(sectors[i],previousSector,1);

      min=Math.min(min,Math.min(dist1,dist2));
   }

   return min;
}
</pre>

For the complete implementation of this have a look at <b>writer's</b>
solution in the practice rooms.
</p> 
<font size="+2"> 
<b><a
href="/stat?c=problem_statement&amp;pm=2394&amp;rd=5069">OddsAndEvens</a></b> 
</font> 
<A href="Javascript:openProblemRating(2394)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
162 / 172 (94.19%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Success Rate</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
139 / 162 (85.80%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>High Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
<b>tomek</b> for 486.81 points (4 mins 42 secs) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Average Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
351.14 (for 139 correct submissions) 
</td> 
</tr> 
</table></blockquote> 
<p>
As <b>Windrider</b> exclaimed after the match: <i>It's a puzzle! It's not 
a math question, nor is it a "remember the algorithm" thing, it's a
puzzle!</i></p>
<p>There were quite a number of ways for solving this problem. However,
most solutions began with a loop that counts the number of odds and evens 
in both <b>sums</b> and <b>products</b>:
<pre>
for (int i=0; i&lt;=products.length-1; i++)
{   
   if (sums[i].equals("ODD")) oddsInSums++;
   else evensInSums++;

   if (products[i].equals("ODD")) oddsInProducts++;
   else evensInProducts++;
}
</pre>

The total number of integers used could be calculated like so:
<pre>
int total=0;
while (total*(total-1)/2 != sums.length) total++;
</pre>

We notice that the only way we can get an odd result in <b>products</b>
is by multiplying two odds. Thus the original number of odds must be some 
value x such that x*(x-1)/2 = oddsInProducts. We also notice that the
only way we can get an odd result in <b>sums</b> is by adding an odd and
an even. Thus the original number of evens must be some value y such that 
x*y = oddsInSums. We now try all possibilities of original number of odds 
(x) and evens (y). If no possibility works then we return "IMPOSSIBLE".
The final code looks like this:
<pre>
for (int x=0; x&lt;=total; x++)
{
   int y=total-x;

   if (x*(x-1)/2==oddsInProducts &amp;&amp; x*y==oddsInSums)
      return "EVEN "+y+" ODD "+x;
}

return "IMPOSSIBLE";
</pre>

For the complete implementation of this have a look at <b>writer's</b>
solution in the practice rooms.
</p> 
<font size="+2"> 
<b><a
href="/stat?c=problem_statement&amp;pm=2437&amp;rd=5069">IslandFerries</a></b> 
</font> 
<A href="Javascript:openProblemRating(2437)"><img hspace="10" border="0"
height="18" width="60" src="/i/rate_it.gif"/></A><br/>
By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br/><br/>
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
23 / 172 (13.37%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Success Rate</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
16 / 23 (69.57%) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>High Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
<b>jshute</b> for 748.96 points (17 mins 44 secs) 
</td> 
</tr> 
<tr> 
<td class="bodyText" style="background: #eee;"> 
<b>Average Score</b> 
</td> 
<td class="bodyText" style="background: #eee;"> 
531.96 (for 16 correct submissions) 
</td> 
</tr> 
</table></blockquote> 
<p>
This problem boils down to finding the shortest paths in a directed graph 
with weighted edges. The trick to solving it is to create the proper
graph, and then you can run a breadth first search, or Djikstra's
algorithm to find the shortest path from the start node to each of the
other nodes. From the problem, we see that we can be at any island, and
can be holding up to three tickets, none of which may be the same. From
this, we can construct the nodes in the graph: each node corresponds to
being at an island with a particular set of tickets. Hence, there are at
most 40 * choose(10,3) = 1200 nodes in our graph, a very manageable
number. Now, the next step is to construct all the edges in our graph. To 
get from one island to another, we have to use up a ticket. These edges
have weight 0, since using a ticket is free. The other edges in the graph 
are related to buying tickets. From each node, there is an outgoing edge
corresponding to each type of ticket not already held. That edge has a
weight equal to the purchase cost of the ticket. For example, we can
write down nodes as tuples whose first element is the island we are at,
and whose other elements are the tickets held, in order. For example
(7,0,1) indicates that we are at island 7 with tickets 0 and 1. If ticket 
3 costs 164 at island 7, then we add an edge from (7,0,1) to (7,0,1,3) of 
weight 164. If there is a leg from island 7 to island 4 on ferry 3, then
we add an edge from (7,0,1,3) to (4,0,1) of weight 0.<br/><br/> 
In the end, the elements of the return correspond to the cost of getting
to an island with no tickets (there is no reason to buy extra tickets).
To make things a bit simpler, we don't actually have to construct the
graph explicitly and then run a search algorithm on it. We can construct
the relevant portions of the graph as we go along. The simplest way to do 
this is with a breadth first search. We have a queue which contains all
of the nodes we've found and need to investigate, and then a table
holding the shortest paths to each node found so far:</p> 
<pre> 
initialize queue q 
initialize table best 
insert (0) into q 
while(q is not empty) 
   tuple t = q.removeFirst() 
   foreach (tuple t' which is reachable from t) 
      int cost = best(t) + weightFrom(t,t') 
      if(best does not contain t' or best(t') &gt;; cost) 
         q.insert(t') 
         best(t') = cost 
      end 
   end 
end 
</pre> 
<p>
The above code is pretty standard, and the trick is implementing it. The
queue can be implemented as a linked list, or just a really big array.
The table can be implemented in a number of different ways, depending on
your implementation of the tuples. If you are like me, and prefer to keep 
things primitive, you'll use a bitmask to represent your tuples. Hence,
being at island i, with tickets j, k, and l can be represented as a
single integer <tt>(i&lt;&lt;12) + (j&lt;&lt;8) + (k&lt;&lt;4) + l</tt>.
This allows us to implement the queue as a big array of integers, and
best as an array with 40&lt;&lt;12 = 163840 elements. <br/><br/> 
If you wanted to make things go a bit faster, you can use a heap to
maintain your queue. This will ensure that you always expand the cheapest 
node found so far, and give you a much better runtime. It turns out that
a straight BFS was sufficient in this problem, but in many cases it is
much slower. Another optimization you can make is to reduce the number of 
nodes by noticing that there is no reason to hold 3 tickets for very
long. If you ever have 3 tickets, you need to go to a different island
before you buy more. Hence, we can eliminate all of the nodes with 3
tickets, and just add edges that include both buying a ticket and moving
to an island in one step. This doesn't help much though - although it
reduces the number of nodes, it doesn't remove many edges, and it makes
it a little more expensive to calculate edges.
</p>


                     <p>
                     <img src="/i/m/dimkadimon_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=276230"><strong>dimkadimon</strong></a><br />
                     <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                     </p>
                 </td>
             </tr>
         </table>

         <p><br /></p>

     </td>
<!-- Center Column Ends -->

<!-- Gutter -->
     <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
     <td width="170">
         <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
         <xsl:call-template name="public_right_col"/>
     </td>
<!-- Right Column Ends -->

<!-- Gutter -->
     <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

 </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

 </xsl:template>
</xsl:stylesheet>
