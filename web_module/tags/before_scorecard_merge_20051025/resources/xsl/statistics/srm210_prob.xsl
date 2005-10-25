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

<title>Single Round Match 210 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 210</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Wednesday, September 1, 2004</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p>
The problems of this match contained a variety of traditional programming contest topics, but they shared a common theme of relevance to "real world" concerns in software development.
Besides enhancing the validity of TopCoder competitions as an indicator of on-the-job performance, real world problems also net the problem writer a handsome bonus payment.
Unfortunately, these problems have a somewhat tarnished reputation since they frequently involve tedious simulations of complex but uninteresting systems.
Therefore, my goal was to create a problem set that was both relevant in the real world and fun to solve.
</p>
<p>
In Division 1, <b>snewman</b> struck early and quickly, turning in the fastest times on both the easy and medium problems.
However, <b>venco</b> pulled into first place at the end of the coding phase with a blistering time of just under fifteen minutes on the hard problem.
The standings continued to reshuffle during a lively challenge phase, as <b>snewman</b> gained 100 points from successful challenges while <b>venco</b> lost 50 points from an unsuccessful attempt.
Impressively, <b>sjelkjd</b> managed to take down four solutions to the medium problem for 200 points, the most of any coder in this challenge phase.
These feats were insufficient to stave off defending champion <b>tomek</b>, who came from behind with 100 points from three successful and one failed challenge to win the match.
This places him in an exact tie with <b>SnapDragon</b> for the highest rating and sets the stage for the 2004 TopCoder Open.
</p>
<p>
In Division 2, <b>Cmonkey</b>, newcomer <b>Sumudu</b>, and <b>bugloaf</b> turned in the top three scores with solid performances during the coding phase.
In all, twenty-two coders advanced to Division 1.
</p>
<p>
The writer's solution to all six problems are posted in the practice rooms.
</p>
<p>
<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2988&amp;rd=5856" name="2988">TitleString</a></b>
</font>
<A href="Javascript:openProblemRating(2988)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      197 / 216 (91.20%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      177 / 197 (89.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>eleusive</b> for 248.65 points (2 mins 6 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      214.67 (for 177 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This may have been the easiest problem, but consider this: every modern word processing application has a feature that does the same thing, and chances are that every desktop computer you see has some sort of word processor software installed.
Therefore, if you can solve this problem, you too can write code that is used by millions of people on a daily basis!
This is the sort of thinking that was responsible for the dot-com bubble.
</p>
<p>
In the context of this problem, if a character is a letter, and if it is positioned after a space character or at the beginning of the string, it is the first character of a word and should be capitalized.
The previous sentence describes a correct solution in its entirety, and can quickly be translated into code.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2936&amp;rd=5856" name="2936">DrivingDirections</a></b>
</font>
<A href="Javascript:openProblemRating(2936)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      167 / 216 (77.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      113 / 167 (67.66%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>therealmoose</b> for 475.48 points (6 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      314.47 (for 113 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Anybody who has used driving directions to find a house party in a complicated neighborhood should be familiar with this task.
The key is to realize that left turns become right turns and vice-versa when traversing the path in the opposite direction.
Therefore, if there are <i>n</i> directions, element <i>i</i> of the result (assuming array indices are zero-based) is the street name in element <i>n - 1 - i</i> of the original directions concatenated onto the reversed turn instruction of element <i>n - i</i>, or "Start on " if <i>i</i> is 0.
Of course, in the real world, the situation gets more complicated with one-way streets, roads that change names, and the difficulty of typing in computer programs while driving a car.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2932&amp;rd=5856" name="2932">TopographicalImage</a></b>
</font>
<A href="Javascript:openProblemRating(2932)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      32 / 216 (14.81%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      28 / 32 (87.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Minilek</b> for 676.02 points (22 mins 1 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      514.34 (for 28 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem manifests itself in many image analysis applications.
For example, the task of counting bacteria in a microscope image could be formulated similarly to this problem.
</p>
<p>
A solution can be implemented directly from the definitions given in the problem statement.
Let <i>visited</i> be a boolean array that tracks whether point has been assigned to a peak.
The highest unvisited point <i>M</i><sub>i</sub> can be found by looping over all the points in the landscape, disregarding the visited points and keeping track of the highest one.
The peak <i>P</i><sub>i</sub> can then be found with a recursive function that floods outward from <i>M</i><sub>i</sub>, stopping when it encounters a visited point or an uphill path.
The pseudocode of this function follows:
</p>
<p><pre>
int countPeakPoints(Point startPoint)
   mark startPoint as visited
   area = 1
   for each neighbor n of startPoint
      if n has not been visited and the path from startPoint goes downhill
         area = area + countPeakPoints(n)
return area
</pre></p>

<p>
In the parlance of graph theory, this is known as a depth first traversal.  The steps of finding the highest point and calling countPeakPoints on it should be repeated until all points have been visited.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2937&amp;rd=5856" name="2937">IPConverter</a></b>
</font>
<A href="Javascript:openProblemRating(2937)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      216 / 235 (91.91%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      179 / 216 (82.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>snewman</b> for 241.62 points (5 mins 19 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      190.51 (for 179 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
Who hasn't needed to dial their IP address into a telephone at some point?
I certainly haven't.
However, with the gradual convergence of the telephone system with the internet, it is conceivable that you'll have to punch in your IP address for some reason, and you'll want some way to disambiguate it.
</p>
<p>
Most correct solutions of this problem fell into two similar categories.
Some coders wrote three nested loops to try all the positions of the periods, performing the validity checks on the numbers within the innermost loop.
Others wrote a function that checked the first one, two, and three digits, then recursed on the remaining digit string.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2930&amp;rd=5856" name="2930">HierarchicalTree</a></b>
</font>
<A href="Javascript:openProblemRating(2930)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      163 / 235 (69.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      67 / 163 (41.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>snewman</b> for 409.76 points (13 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      268.91 (for 67 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This problem was inspired by some code I wrote for TopCoder's very own website a couple years ago.
If you look at the <a href="http://software.topcoder.com/catalog/c_showroom.jsp">component catalog</a> at <a href="http://software.topcoder.com">TopCoder Software</a>, you'll see a list of components organized into categories and subcategories.
A category might have any number of subcategories, but each subcategory has exactly one parent, so it is easier to store the catalog as a table of category-parent pairs in a database.
The backend has to pull the pairs off a database, solve exactly this problem, and pass the category tree to the web server for you to peruse.
</p>
<p>
This problem was not conceptually difficult, but implementing it and covering all the corner cases required close attention.
A solid command of your language's class libraries was very helpful.
An effective approach is to process the node-parent pairs one by one, building up a tree.
As each pair is processed, ensure that root is not specified as the child of another node, and that a node does not acquire two different parents.
This catches cycles within the root component, but separate disconnected components may still exist after all the pairs are processed.
After performing the recursive traversal starting at the root node to determine the descendant counts, compare the number of descendants of root with the total number of nodes seen.
If there are more nodes than descendants of root, some nodes must be disconnected, and the tree is invalid.
See the writer solution for an concise implementation in Java.
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2946&amp;rd=5856" name="2946">NegativePhotoresist</a></b>
</font>
<A href="Javascript:openProblemRating(2946)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      37 / 235 (15.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      36 / 37 (97.30%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>venco</b> for 800.21 points (14 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      597.44 (for 36 correct submissions)
    </td>
  </tr>
</table></blockquote>
<p>
This probably wouldn't be a viable method of manufacturing a circuit board, but the ability to cope with last-minute design changes is an unfortunate necessity in software development.
In any case, this problem was a good excuse to perform a binary search on Floyd-Warshall.
Many experienced coders begin salivating as soon as they see the words "all pairs shortest path" in close proximity because the well-known Floyd-Warshall algorithm efficiently calculates the length of the shortest path between all pairs of vertices in a graph and is refreshingly easy to implement.
See these <a href="http://www.cs.ust.hk/faculty/golin/COMP271Sp03/Notes/MyL15.pdf">lecture notes</a> for an in-depth discussion of how Floyd-Warshall works.
</p>
<p>
Tilting the mask by an angle <i>theta</i> has the effect of multiplying the y-coordinate of each pinhole by cos(<i>theta</i>).
By computing the adjacency matrix (being careful to avoid overflowing a 32-bit integer by squaring 100000) with these transformed y-coordinates and then running Floyd-Warshall, the total shortest path length between all pairs of pinholes as a function of <i>theta</i> can be calculated.
As <i>theta</i> increases from 0 to Pi / 2, the length of a connection between two pinholes never increases.
Therefore, except for the degenerate case where all the connections are parallel to the x-axis (which was implicitly forbidden by the problem constraints), the sum of the shortest path lengths is a monotonically decreasing function of <i>theta</i>.
This immediately suggests the use of a binary search to find the minimum value of <i>theta</i> for which the sum of the shortest path lengths is less than the limit.
</p> 

                <p>
                <img src="/i/m/the_one_smiley_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=156485"><strong>the_one_smiley</strong></a><br />
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
