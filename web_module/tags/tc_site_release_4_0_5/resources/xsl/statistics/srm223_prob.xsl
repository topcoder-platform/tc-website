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

<title>Single Round Match 223 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 223</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Saturday, December 18, 2004</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
Coder <b>marian</b> finished in first place in Division One, with the fastest time on the 1000-point problem.
In the final seconds of the challenge round, <b>Yarin</b> was within 50 points of the top spot.
But a successful defense by <b>Jan_Kuipers</b> knocked <b>Yarin</b> down to third, and <b>Jan_Kuipers</b> finished second.
</p>

<p>
The fastest time on the 1000-point problem combined with a successful challenge was enough to earn <b>herbert_deuarte</b> Division Two's top spot in his third SRM.
Coder <b>tc-chung</b> finished closely behind in second place, with <b>ibonaci</b> in third.
All three of these coders moved up to Division One.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1774&amp;rd=5869"
name="1774">MostProfitable</a></b>
</font>
<A href="Javascript:openProblemRating(1774)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />

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
       190 / 199 (95.48%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       166 / 190 (87.37%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>Fabi</b> for 247.73 points (2 mins 43 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       215.81 (for 166 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
For each item you are given the cost, the price, and the number of sales.
The total profit for each item is:
</p>
<blockquote>
(price - cost) * sales
</blockquote>
<p>
To find the most profitable, you simply loop over all the items, compute the profit (using the formula above), and keep track of the index of the item with the highest positive profit.
At the end of your method, you return the element of items with the index of the most profitable item, or the empty string if no items were profitable.
</p>
<p>
Two things you must watch out for are to ignore any items with zero or negative profit, and if there is a tie for the most profitable item you are to return the item with the lowest index.
Tiebreaking rules such as this are common in TopCoder problems, in order to guarantee that a problem has a well-defined unique answer.
</p>
<p>
See <b>tc-chung</b>'s solution for a clear, straightforward implementation.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3457&amp;rd=5869"
name="3457">BlackAndRed</a></b>
</font>
<A href="Javascript:openProblemRating(3457)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />

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
       184 / 199 (92.46%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       171 / 184 (92.93%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>ahri</b> for 489.65 points (4 mins 8 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       388.06 (for 171 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
The simplest way to solve this problem is to try cutting the deck in every possible location, and then simulate the game for each one to see if you win.
If you start your search with a cut of zero, and work your way up to N-1, you can return the size of the cut as soon as you find one where you win the game.
This solution has a running time of O(N^2), which is perfectly fine since N is at most 50.
</p>

<p>
However, an O(N) solution exists.  This solution also makes it clear why you can always find a place to cut the cards so that you win.  (You may have noticed that the problem did not tell you what to do if no such cut could be found.) </p> <p> To visualize the O(N) solution, make a graph where the value at position <i>x</i> is the number of black cards in the first <i>x</i> cards, minus the number of red cards in the first <i>x</i> cards.
<i>x</i> increases as each new card is turned over, and the graph goes up one unit if it is black, and down one unit if it is red.
</p>

<p>
Here is graph for the "RBBRRRRBBBRBBRRBRBBRRRRBBBBBRRRB":
</p>

<pre>
                                /\
       /\        /\    /\      /  \
     \/  \    /\/  \/\/  \    /    \/
          \  /            \  /
           \/              \/
</pre>

<p>
Notice that this graph ends up at the same level at which it starts, because there are an equal number of red and black cards.
If the value ever dips below the starting value (as it does in this graph), that means you lose the game.
Cutting the deck is equivalent to moving the same number of line segments from the front of the graph to the end.
So finding the right place to cut the deck is equivalent to finding the right place to cut the graph such that the value never dips below the starting value.
This point is, obviously, at the minimum of the graph.
If there are more than one, you select the left-most minimum (corresponding to the cut with the fewest cards.) In this example, that point is seven units from the left, so the answer is 7.
</p>

<p>
Here is the graph of the cut deck "BBBRBBRRBRBBRRRRBBBBBRRRBRBBRRRR":
</p>

<pre>
                         /\
          /\    /\      /  \    /\
       /\/  \/\/  \    /    \/\/  \
      /            \  /            \
     /              \/              \
</pre>

<p>
See <b>writer</b>'s solution in the practice room for a simple implementation of this algorithm.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3458&amp;rd=5869"
name="3458">PrimeAnagrams</a></b>
</font>
<A href="Javascript:openProblemRating(3458)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />

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
       34 / 199 (17.09%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       11 / 34 (32.35%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>herbert_duarte</b> for 622.61 points (25 mins 39 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       482.14 (for 11 correct submissions)
     </td>
   </tr>
</table></blockquote>


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
       132 / 182 (72.53%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       87 / 132 (65.91%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>overwise</b> for 455.64 points (9 mins 2 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       295.40 (for 87 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
There are 8 factorial (40320) ways to rearrange the order of 8 digits.
There are 7 choose 2 (21) ways to break each of those up into 3 groups of digits.
That gives only 846720 sets of primes to test, and that even overcounts by a factor of 6 because it tests each set in all 6 orders.
So this problem can easily be solved by brute force.
</p>

<p>
The first step is to loop over all permutations of the input order.
See <b>marian</b>'s solution for an example of how to do this using STL in C++, or my solution (<b>writer</b>'s, in the practice room) for an example of how to do this with a recursive function.
For each of these permutations, you can separate them into all possible groups of 3 numbers, as demonstrated by the following pseudocode:
</p>

<pre>
     <i>given: p (one permutation of the input string)</i>

     for i = 1 to len(p)-3
         for j = i+1 to len(p)-2
         {
             // 1st number is digits 0 through i-1
             // 2nd number is digits i through j-1
             // 3rd number is digits j through len(p)-1
         }
</pre>

<p>
Then, for each group of 3 numbers, you test that none of them have a leading zero, and then test if all three are prime.
Many coders generated a list of prime numbers with up to 6 digits at the beginning of their method for use in this step, most likely drawing from their library of pre-written code.
</p>

<p>
Once you find a set of 3 prime numbers, you compare their product to the product of the primes in the best set you have found so far.
No further tiebreaker is necessary,
because every number has a unique prime factorization, and therefore no two sets of prime numbers can have the same product.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2989&amp;rd=5869"
name="2989">QuizShow</a></b>
</font>
<A href="Javascript:openProblemRating(2989)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />

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
       174 / 182 (95.60%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       121 / 174 (69.54%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>antimatter</b> for 247.53 points (2 mins 50 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       207.01 (for 121 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
This problem may have seemed like a daunting probability problem at first, but it doesn't take long to realize that you can simply test each possible wager, and compute your probability of winning.
Computing this probability is straightforward, as there are only
8 possible outcomes (you and your two opponents can each independently win or lose, each with a probability of 50%).
</p>

<p>
See <b>writer's</b> solution in the practice room for an simple, commented solution to this problem.
</p>

<p>
If this were a real quiz show, the situation would be much more difficult, as you would probably not know your opponents' wagers at the time you had to make your own, nor would you be able to have such a simple estimate of each person's chance of answering the question correctly.
</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3064&amp;rd=5869"
name="3064">RevolvingDoors</a></b>
</font>
<A href="Javascript:openProblemRating(3064)"><img hspace="10"
border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />

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
       22 / 182 (12.09%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       10 / 22 (45.45%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>marian</b> for 600.14 points (27 mins 23 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       497.32 (for 10 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
RevolvingDoors is a breadth-first search problem.
The state-space you are searching over is the space of all positions on the map (up to 50x50, minus the space taken up by door centers and any walls), times each of the possible orientations of all of the doors (up to 2^10).
From any state, you can either move into an adjacent space (which does not increase your distance), or you can toggle the orientation of a door you are standing next to (which increments your distance by one).
Once the search is complete, the answer is the minimum of the distances of all 2^N states corresponding to the end square.  (The final orientations of the doors do not matter.) </p>

<p>
The main difficulty of this problem turned out to be coding an efficient implementation.
Several solutions failed due to challenges or the system tests on a 50x50 map that had all 10 doors serving no purpose in the middle, and the end square completely blocked off by walls.
This foiled several inefficient solutions by forcing them to explore the maximum number of states.
One common optimization used by coders to reduce the number of states was to only consider the "interesting" positions of the map: the start square, the end square, and the four squares from which you can interact with the doors.
</p>

<p>
In a post-contest discussion, it was hypothesized that the highest possible number of turns necessary for a map with N doors is 2^(N+1)-1.
For example, here are maps with 1 and 2 doors, that requires 3 and 7 turns,
respectively:
</p>

<pre>
                        ######
     #####              #S | #
     #   ###            #  O #
     #-O- E#           ## #| #
     #  ####          ## |# ##
     #S##             #E O  #
     ###              ###|  #
                        #####
</pre>

<p>
<b>SnapDragon</b> came up with this astonishing example of a map with 10 doors that require 2047 total turns:
</p>

<pre>
     ####################################################
     ###   ##   ##   ##   ##   ##   ##   ##   ##   ##   #
     ## |# # |# # |# # |# # |# # |# # |# # |# # |# # |# #
     #E O    O    O    O    O    O    O    O    O    O  #
     ###| ###| ###| ###| ###| ###| ###| ###| ###| ###|  #
     #   ##   ##   ##   ##   ##   ##   ##   ##   ##   # #
     #                                                 S#
     ####################################################
</pre>

<p>
The door on the far right must be turned 1025 times!
The sequence of door turns in the shortest path through this map is reminiscent of the Chinese Rings puzzle and the Towers of Hanoi.
</p>

                <p>
                <img src="/i/m/legakis_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=287269"><strong>legakis</strong></a><br />
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
