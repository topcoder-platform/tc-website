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

<title>Single Round Match 193 Statistics at TopCoder</title>

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
                             <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 193</font></td>
                             <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                         </tr>

                         <tr valign="middle">
                             <td class="bodyText">Wednesday, May 5, 2004</td>
                             <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                         </tr>
                     </table>
<!--end contextual links-->

<h2>Match summary</h2>
<p> 
Coders in both divisions finished the first two problems in record
time.  At first glance it appeared this competition would be over
before the 30-minute mark.  These thoughts were quickly dismissed as
players' read their respective hards.  Div 1 coders faced a complex
problem in automata theory that was both difficult conceptually,
and tricky to implement.  Div 2 coders faced a deceptively easy
simulation, whose nuances claimed most solutions.  As Div 1 coders
raced to complete the set, SnapDragon and dgarthur traded compile and
test cycles.  SnapDragon's solution was plagued with a bug he
couldn't find in time.  dgarthur submitted earlier than everyone, but
found himself resubmitting later.  Seven coders marched into the
challenge round with their level 3 problems intact.  Only dgarthur's
remained when the dust cleared.  Division 2 had a similarly deadly
challenge phase/systest phase.  In the end Flyboy216 emerged
victorious, with DAle close behind.
</p> 
 
<p>
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=682&amp;rd=5068">SwimmingPool</a></b> 
</font> 
<A href="Javascript:openProblemRating(682)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      168 / 178 (94.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      166 / 168 (98.81%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NeverMore</b> for 249.28 points (1 mins 31 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      230.21 (for 166 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
We first compute the total water volume by looping through
the array and summing the durations[i]*rates[i] values (same operation
as dot-product).  The result is the total water volume, so we divide
by the given height to get the answer.  Java code follows:
<pre>
    public int area(int[] rates, int[] durations, int height) {
	int water = 0;
	for (int i = 0; i &lt; rates.length; i++) water +=rates[i]*durations[i];
	return water/height;
    }
</pre>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2830&amp;rd=5068">CRTFun</a></b> 
</font> 
<A href="Javascript:openProblemRating(2830)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      158 / 178 (88.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      67 / 158 (42.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>unclejed</b> for 542.95 points (3 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      424.73 (for 67 correct submissions) 
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
      177 / 177 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      135 / 177 (76.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>antimatter</b> for 249.53 points (1 mins 14 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      229.99 (for 135 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
CRTFun is based on the Chinese Remainder Theorem (CRT) used in modular
arithmetic.  Given a system of congruences (equations) that satisfy
certain constraints, the CRT tells us there will be a unique solution
within certain bounds.  Coders were required to find that solution.
Luckily additional artificial bounds were guaranteed by the
constraints, so a brute force method would be applicable.  Simply loop
up to 100000, testing each value along the way.  If one satisfies all
given congruences, you have the solution.  Java code follows:
<pre>
    public int findSolution(int[] mods, int[] vals) {
	outer:	for (int i = 0; ;i++) {
	    for (int j = 0; j &lt; vals.length; j++) 
		if ( i % mods[j] != vals[j] ) continue outer;
	    return i;
	}  
    }
</pre>
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2832&amp;rd=5068">ConquerMap</a></b> 
</font> 
<A href="Javascript:openProblemRating(2832)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      21 / 178 (11.80%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 21 (28.57%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Chicken1</b> for 475.97 points (40 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      426.87 (for 6 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Not much can be said about ConquerMap.  Basically a pure simulation
problem.  You have an initially blank board, and a rule that allows it
to mutate from one turn to another.  Mutations include the
introduction of new numerals, or the movement of old numerals.  An
outer loop iterates through time, while inner loops generate a new
board from the old one.  A bit of care is required to make sure the
correct spaces are considered during potential conflict situations.  
Other potential issues include the handling of boundary
cases, and properly computing which numeral wins each conflict.
Pitfalls such as these claimed numerous submissions.
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=2834&amp;rd=5068">ShortBooleanExp</a></b> 
</font> 
<A href="Javascript:openProblemRating(2834)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
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
      151 / 177 (85.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      68 / 151 (45.03%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dgarthur</b> for 435.02 points (11 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      265.21 (for 68 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
ShortBooleanExp brings back memories of junior high school, when math
amounted to filling in a truth table.  One way to solve this problem
involved enumerating all possible strings until you found one that
agreed with the given expression.  To see if two expressions agree,
simply try all possible truth combinations for a and b.  This is akin
to checking if their columns on a truth table would match up.
A faster way involves filling an
array with precalculated solutions.  Simply search this array to find
the correct answer instead of the slower enumeration process.  One
way or another, many coders zipped through this problem.  Those taking
the latter path often zipped into a successful challenge.  All things
considered though, this problem was more careless error-prone than
difficult.  If only the next was as easy...
</p>
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=1893&amp;rd=5068">DungeonBuilder</a></b> 
</font> 
<A href="Javascript:openProblemRating(1893)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1050 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 177 (3.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 7 (14.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>dgarthur</b> for 317.97 points (57 mins 9 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      317.97 (for 1 correct submission) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
DungeonBuilder erases all memories of junior high school, and reminds
me why college can be evil.  This problem comes right out of automata
theory.  The input sequences used by the players, are really just
strings of digits.  The dungeons are really just Deterministic Finite
Automata (DFA), where each room is a state.  
If there was no R value, this problem would come down
to implementing the standard DFA minimization algorithm.  Effectively the
minimization algorithm marks off which states could be merged
together in order to make a simpler, smaller machine.  As a base
case, any pair of states such that one is a winning position, and the
other isn't can be eliminated from merging consideration.  For the
inductive case, assume you knew two states p and q could not be
merged.  If you have two other states r and s such that r can reach p
on some letter c, and s can reach q on c, then r and s cannot be
merged either.  Dynamic programming is a popular way to implement this
process, but it has a worst case runtime of O(n^3).  A DFS/BFS based
solution (depth-first/breadth-first) will run O(n^2).  Luckily, based
on the constraints, the DP method ran in time.<br/>
<br/>
Now to handle R.  The basic idea is to turn the given DFA into another
DFA that satisfies the conditions placed on N (pass through exactly R
winning positions).  To do this we make R copies of the DFA, which
could be interpreted as levels.  We also add a state D to account for
sequences that take paths out of a room that do not exist, or paths
that enter more than R winning positions.  Each level works as the
original map did except, if you enter a winning position, all exiting paths
will lead down to the next level.  Using this construction we can
move all winning positions down to the Rth level, and have a new DFA
that satisfies the required constraints.  At this point we run the
minimization algorithm and have our result.  An easy-to-miss step at
this point is the removal of unreachable states.  If you cannot reach
a room in map N there is no reason to include it in a minimal
dungeon.  The combination of a complicated algorithm, and many tricky twists
claimed all but dgarthur's resubmitted solution.
</p>


                     <p>
                     <img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                     By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251317"><strong>brett1479</strong></a><br />
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
