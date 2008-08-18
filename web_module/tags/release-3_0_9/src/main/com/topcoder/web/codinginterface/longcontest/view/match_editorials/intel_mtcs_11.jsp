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
<tc-webtag:forumLink forumID="506179" message="Discuss this match" />
</div>

<span class="bodySubtitle">Intel&#174; Multi-Threading Competition 11</span><br>11.15.2006 - 11.30.2006
<br><br>

<img src="/i/m/battyone_big.jpg" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/><br>
By&#160;<tc-webtag:handle coderId="7504863" /><br>
<span class="smallText"><em>TopCoder Member</em></span>

<br><br><br>
<span class="title"><A href="/longcontest/?module=ViewProblemStatement&compid=6221&rd=10649">GroupSkills</A></span>
<br><br>
<h3>Introduction</h3>
<br>
Optimization problems usually get
harder the larger the data set is. In this problem it is the
opposite, as the thousands of members provide a large and well
balanced supply of different skill sets, which allows matching the
vast majority of them almost optimally.<br>
<br>
<h3>Theoretical analysis</h3>
<p>Let's assume for now the population is
large enough that we'll always be able to choose the ideal teammates,
and consider how each member can be used to its full potential in
this scenario. The two problems to solve are:<br>
</p>
<ul>
  <li>which skills of a member matter, and should be used as the top
skills of a group<br>
  </li>
  <li>which members to associate with for
the remaining skills</li>
</ul>
<p>We start by examining the second
question because the solution to the first depends on it.</p>
<h4>How to form groups once useful
skills are identified</h4>
<p>The configuration that maximizes the
sum of the products is associating the largest multipliers together.
Assuming skills are evenly distributed, this groups
members
by identical values of their useful skills. For members that only
contribute one skill, or multiple skills at the same level, this is
straightforward and results in groups with all values at level 99,
groups with all values at 98, etc. Members that contribute multiple
skills at different levels are equivalent to, as radeye put it,
members contributing multiple skills at the same level, that new
level being the geometric mean of the original levels (since only the
final product matters). Therefore such members should be grouped with
other members contributing the remaining skills at that mean
level. For example in 4 dimensions a member with skill 1 = 99 and
skill 2 = 96 (mean = 97.49) could be grouped with a member with skill
3 = 96 and skill 4 = 99. Since the skills are integer values this is
not always possible, so in general closest matches should be used.
For example in 3 dimensions if a member's useful skills are skill 1 =
90 and skill 2 = 80 (mean = 84.85) then its optimal match would be a
member with sole useful skill 3 = 85.</p>
<h4>What are the useful skills<br>
</h4>
<p>Clearly the useful skills of a member
are the k skills with the highest values, for some value of k. Remember
from the previous paragraph
that, whatever top k skills we choose, we can expect a member to end up
grouped
with
other members having useful skills with the same (geometric) mean value
as these k skills. Together they will form a group with a volume equal
to that mean value
raised to the power d (the number of dimensions). Since the member
contributes k skills out of the d needed for the complete group, we can
attribute the fraction k / d of the group's volume to the member. It
is fair because at the macroscopic level, we can expect to form k / d
times as many groups as there are members used this way. Thus under
our assumptions the optimal k is the one that maximizes k *
geometric_mean_value_of_top_k_skills ^ d.</p>
<p>Let us see how that works in the case of d = 5 and a
member with skill values 68, 13, 94, 70 and 37:<br>
<br>
</p>
<table border="1" bordercolor="#000000" cellpadding="4" cellspacing="0"
 width="100%">
  <thead><tr valign="top">
    <th width="4%">
    <p align="center">k</p>
    </th>
    <th width="22%">
    <p align="right">Used skill values</p>
    </th>
    <th width="21%">
    <p align="right">Geometric mean</p>
    </th>
    <th width="31%">
    <p align="right">Volume of completed group</p>
    </th>
    <th width="22%">
    <p align="right">Contributed volume</p>
    </th>
  </tr>
  </thead> <tbody>
    <tr valign="top">
      <td width="4%">
      <p align="center">1</p>
      </td>
      <td width="22%">
      <p align="right">94</p>
      </td>
      <td width="21%">
      <p align="right">94</p>
      </td>
      <td width="31%">
      <p align="right">7339 M</p>
      </td>
      <td width="22%">
      <p align="right">1468 M</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="4%">
      <p align="center">2</p>
      </td>
      <td width="22%">
      <p align="right">94, 70</p>
      </td>
      <td width="21%">
      <p align="right">81.12</p>
      </td>
      <td width="31%">
      <p align="right">3512 M</p>
      </td>
      <td width="22%">
      <p align="right">1405 M</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="4%">
      <p align="center">3</p>
      </td>
      <td width="22%">
      <p align="right">94, 70, 68</p>
      </td>
      <td width="21%">
      <p align="right">76.49</p>
      </td>
      <td width="31%">
      <p align="right">2618 M</p>
      </td>
      <td width="22%">
      <p align="right"><b>1571 M</b></p>
      </td>
    </tr>
    <tr valign="top">
      <td width="4%">
      <p align="center">4</p>
      </td>
      <td width="22%">
      <p align="right">94, 70, 68, 37</p>
      </td>
      <td width="21%">
      <p align="right">63.79</p>
      </td>
      <td width="31%">
      <p align="right">1056 M</p>
      </td>
      <td width="22%">
      <p align="right">845 M</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="4%">
      <p align="center">5</p>
      </td>
      <td width="22%">
      <p align="right">94, 70, 68, 37, 13</p>
      </td>
      <td width="21%">
      <p align="right">46.41</p>
      </td>
      <td width="31%">
      <p align="right">215 M</p>
      </td>
      <td width="22%">
      <p align="right">215 M</p>
      </td>
    </tr>
  </tbody>
</table>
<p>
</p>
<p><br>
For this member the table shows that
the best option is to use skill values 94, 70 and 68 and form a group
with total volume 2618 million units, in which the member's 3/5
contribution will be 1571M. Next best are k = 1 and 2 in which the
benefit from more skilled colleagues doesn't quite compensate for the
additional dilution of the volume. Finally k = 4 and 5 are much worse,
wasting the high value skills by associating with low value ones.
Thus this member has three useful skills with a mean value of 76.49
and just needs to find a partner with the two remaining useful skills
at the same mean level, for example 78 and 75.<br>
</p>
<p>Note that the sum of all the members' ideal contributed volumes is
an upper bound on the total volume and total score that can be
achieved by any arrangement. This is because any disparate matching
has a volume smaller than the combined contributed volumes of the
members
if they had been perfectly matched. A proof for d = 2 is: <span
 style="font-weight: bold;">x<sup>2</sup> + y<sup>2</sup> - 2yx = (x -
y)<sup>2</sup>&nbsp;
&#8805; 0&nbsp; &#8658;&nbsp; xy &#8804; x<sup>2</sup>/2 + y<sup>2</sup>/2</span>.<br>
<br>
</p>
<h3>Algorithm</h3>
<p>Since in practice we are dealing with a finite
population in which skills don't have the ideal distribution assumed
in the theory, it is not possible to find a perfect matching for all
members and some heuristics are also needed. Our algorithm greedily
approximates optimal matchings for as many members as possible, and
finishes with hill climbing.</p>
<h4>Phase 1 - Bulk processing</h4>
<ol>
  <li>For each member, calculate its ideal
useful skill set, and the geometric mean level of these useful
skills. Special case: if d = 3, in general there are more members
with two useful skills than with one, but we need at least as many
single skills as pairs to form groups of three, so when the possible
skill sets of a member are close in value we favor singles over
triples over pairs to repair that unbalance.
    <p> </p>
  </li>
  <li>Sort all the members by decreasing
mean value of useful skills. Since members with more useful skills
are harder to match, we add .01 times the number of skills to the
mean skill value while sorting so that these members appear earlier
in the list for a given mean value.
    <p> </p>
  </li>
  <li>Form groups:</li>
  <p> </p>
  <ul>
    <li>Traverse the sorted list and form a
group using the first unassigned members that have non-overlapping
skills, or members that can replace already assigned members plus
contribute additional skills. The skill sets matched this way don't
necessarily have the
same mean value, especially when the population is small, but are
still likely to be the best possible matches since by proceeding from
highest to lowest mean we normally group the highest available values
together.
      <p> </p>
    </li>
    <li>When the group is complete, look for
any useless members (with no skill value strictly greater than all
its peers) and remove them. This is useful for example when a member
wasn't planning on contributing a skill because it would have brought
down the ideal completed group's volume more than the extra skill was
worth, but it turned out there wasn't an available member that could
contribute that skill at the right level.
      <p> </p>
    </li>
    <li>Compare the group's productivity
(volume) to the potential value of its members if matched optimally.
If the actual productivity is lower than 90% of the theoretical,
break up the group and set aside the members for phase 2. This can
happen for example when a skill is in shortage and we have to resort
to lower values for that skill, and the low multiplier wastes the
value of the other skills.
      <p> </p>
    </li>
    <li>Continue forming groups for as long as
it is possible.</li>
  </ul>
</ol>
<h4>Phase 2 - Hill climbing</h4>
<p>At this point, all the groups formed in
phase 1, except for the last 40, are final and are
removed from the pool with their members. We keep the last 40 groups
for two reasons:</p>
<ul>
<li>They are usually the worst compared
to the theoretical total value of their members, since they were formed
at the end of the list after global imbalances in useful skills have
accumulated. </li>
<li>
<p>The leeway from more members helps form well balanced
groups in this
phase, while still keeping the data set small enough for the processing
to be fast. </p>
</li>
</ul>
<p>We complete the initial configuration by putting the
unassigned
members
each in
their own groups. Then we optimize that configuration in two ways:</p>
<ol>
<li> For each member, calculate the
difference in total volume if reassigning the member to 10
random
groups. If the best difference is positive, reassign the member to
that group. Otherwise, if the member is useless in its current group,
put it by itself in a new group. </li>
<li><p> For each member, consider 50 random
other members assigned to different groups and check if swapping the
2 members increases the total volume. Swap them if so. </li>
</ol>
<p>Note that in high dimensionality
volumes exceed the precision of doubles, and values used in
comparisons depend on whether they come from a 64bit memory location
or a 80bit register. So we add a relative epsilon to old volumes when
comparing them to new ones, to avoid false positives that would
result in useless or even negative-value reassignments.</p>
<p>After each optimization round, we
calculate the new score including the time penalty, and continue as
long as that score increases. When it starts decreasing, we return the
current
configuration.</p>
<p><br>
</p>
<h3><b>Maximum possible score</b></h3>
<p>The table below shows for each value of
d,
assuming optimal matchings for 100 million randomly generated members:
the average
number of useful skills per member, the geometric mean of useful
skills, and the resulting score. As d grows, maximizing the
score requires members to become more specialized, ending up
using only 1 skill out of 8 on average for d = 20. </p>
<p><br>
</p>
<table border="1" bordercolor="#000000" cellpadding="4" cellspacing="0"
 width="100%">
  <col width="45*"> <col width="73*"> <col width="75*"> <col
 width="63*"> <thead> <tr valign="top">
    <th width="17%">
    <p align="right">dimensions</p>
    </th>
    <th width="29%">
    <p align="right">useful skills per member</p>
    </th>
    <th width="29%">
    <p align="right">mean useful skill value</p>
    </th>
    <th width="25%">
    <p align="right">perfect matching score</p>
    </th>
  </tr>
  </thead> <tbody>
    <tr valign="top">
      <td width="17%">
      <p align="right">3</p>
      </td>
      <td width="29%">
      <p align="right">1.767</p>
      </td>
      <td width="29%">
      <p align="right">64.491</p>
      </td>
      <td width="25%">
      <p align="right">60.607</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">4</p>
      </td>
      <td width="29%">
      <p align="right">1.936</p>
      </td>
      <td width="29%">
      <p align="right">70.952</p>
      </td>
      <td width="25%">
      <p align="right">64.580</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">5</p>
      </td>
      <td width="29%">
      <p align="right">2.052</p>
      </td>
      <td width="29%">
      <p align="right">75.408</p>
      </td>
      <td width="25%">
      <p align="right">67.722</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">6</p>
      </td>
      <td width="29%">
      <p align="right">2.136</p>
      </td>
      <td width="29%">
      <p align="right">78.668</p>
      </td>
      <td width="25%">
      <p align="right">70.274</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">7</p>
      </td>
      <td width="29%">
      <p align="right">2.200</p>
      </td>
      <td width="29%">
      <p align="right">81.148</p>
      </td>
      <td width="25%">
      <p align="right">72.390</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">8</p>
      </td>
      <td width="29%">
      <p align="right">2.250</p>
      </td>
      <td width="29%">
      <p align="right">83.101</p>
      </td>
      <td width="25%">
      <p align="right">74.178</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">9</p>
      </td>
      <td width="29%">
      <p align="right">2.289</p>
      </td>
      <td width="29%">
      <p align="right">84.686</p>
      </td>
      <td width="25%">
      <p align="right">75.712</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">10</p>
      </td>
      <td width="29%">
      <p align="right">2.323</p>
      </td>
      <td width="29%">
      <p align="right">85.985</p>
      </td>
      <td width="25%">
      <p align="right">77.045</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">11</p>
      </td>
      <td width="29%">
      <p align="right">2.351</p>
      </td>
      <td width="29%">
      <p align="right">87.077</p>
      </td>
      <td width="25%">
      <p align="right">78.217</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">12</p>
      </td>
      <td width="29%">
      <p align="right">2.374</p>
      </td>
      <td width="29%">
      <p align="right">88.004</p>
      </td>
      <td width="25%">
      <p align="right">79.255</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">13</p>
      </td>
      <td width="29%">
      <p align="right">2.395</p>
      </td>
      <td width="29%">
      <p align="right">88.807</p>
      </td>
      <td width="25%">
      <p align="right">80.183</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">14</p>
      </td>
      <td width="29%">
      <p align="right">2.413</p>
      </td>
      <td width="29%">
      <p align="right">89.502</p>
      </td>
      <td width="25%">
      <p align="right">81.018</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">15</p>
      </td>
      <td width="29%">
      <p align="right">2.428</p>
      </td>
      <td width="29%">
      <p align="right">90.110</p>
      </td>
      <td width="25%">
      <p align="right">81.774</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">16</p>
      </td>
      <td width="29%">
      <p align="right">2.443</p>
      </td>
      <td width="29%">
      <p align="right">90.655</p>
      </td>
      <td width="25%">
      <p align="right">82.463</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">17</p>
      </td>
      <td width="29%">
      <p align="right">2.454</p>
      </td>
      <td width="29%">
      <p align="right">91.132</p>
      </td>
      <td width="25%">
      <p align="right">83.093</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">18</p>
      </td>
      <td width="29%">
      <p align="right">2.467</p>
      </td>
      <td width="29%">
      <p align="right">91.565</p>
      </td>
      <td width="25%">
      <p align="right">83.672</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">19</p>
      </td>
      <td width="29%">
      <p align="right">2.467</p>
      </td>
      <td width="29%">
      <p align="right">91.960</p>
      </td>
      <td width="25%">
      <p align="right">84.206</p>
      </td>
    </tr>
    <tr valign="top">
      <td width="17%">
      <p align="right">20</p>
      </td>
      <td width="29%">
      <p align="right">2.485</p>
      </td>
      <td width="29%">
      <p align="right">92.302</p>
      </td>
      <td width="25%">
      <p align="right">84.701</p>
      </td>
    </tr>
  </tbody>
</table>
<p><br>
</p>
<p>It turns out our algorithm can get very
close to perfect matching scores for test cases with a reasonably large
population, so these theoretical scores are good estimates for the
expected maximum possible score for each d. Slightly higher scores are
of course possible when the random skill generation is luckier than
average.<br>
<br>
</p>
<h3>Conclusion</h3>
<p>Since this was my last
active participation in the Intel multi-threading competition, I would
like
to thank the Intel Software Network, TopCoder and the problem writers
for bringing us such interesting problems that have kept many of
us working late after-hours figuring out new algorithms and
improving our code. I think I speak for all of us by
saying this has been incredibly fun, challenging and educational.<br>
</p>
<p>Multi-threading made these contests even
more interesting. Although I had been using threads for
many years for my job at Sun, I still got the chance to learn first
hand about topics I was not familiar with, such as lockless
synchronization, cache optimization techniques or SSE. In a few of
the problems, including this one, it turned out there existed
algorithms that were so fast that threads weren't worth the cost, and
though this was probably unintended by the problems writers it was
also a valuable lesson in threading: more processors aren't a
substitute for good algorithms. In the other problems, leveraging
all the power of the 8 core servers was a challenge of its own.
Thank you for the opportunity.</p>



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