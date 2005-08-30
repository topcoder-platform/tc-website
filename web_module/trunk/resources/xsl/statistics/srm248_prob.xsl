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

<title>Single Round Match 248 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 248</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Tuesday, June 21, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>Turnout was high for SRM 248, as for the first time in a couple of years, there
was money up for grabs in a TopCoder SRM! This match broke the previous record of most
reds in an SRM. Tonight's final count, 44, exceeded the previous record of 32 from SRM
227. In the coding phase, <b>SnapDragon</b> came out of quasi-retirement and led a large group 
of Division 1 coders who solved all 3 problems. However, the challenge phase 
provided lots of activity with <b>tomek</b> picking up 5 successful challenges to pull ahead
and win Division 1. Rounding out the top 5 were <b>SnapDragon</b>, <b>krijgertje</b>, 
<b>antimatter</b> and <b>Yarin</b>. In Division 2, first-timer <b>yuhch123</b> took first place
honours followed by <b>nikola_borisof1</b>, <b>relic</b>, first-timer <b>hou</b> 
and <b>sorinelm</b>.</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3524&amp;rd=7223" name="3524">SyllableCounter</a></b>
</font>
<A href="Javascript:openProblemRating(3524)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      293 / 311 (94.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      254 / 293 (86.69%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>gachobg</b> for 248.27 points (2 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      218.62 (for 254 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>To determine the number of syllables in a word, we have to identify groups 
  of vowels. This is easy to do with a single loop over the letters in the word. 
  If you encounter a vowel, increment the count of syllables, and skip to the first 
  letter after this group that's not a vowel. In pseudocode: </p>
<pre>
for i:1 to length word 
  if word[i] is a vowel 
     increment numSyllables 
     while word[i] is a vowel &amp;&amp; i &#8804; length word i++
</pre>
<p>It is possible to solve this problem in one line of Java code. I'll leave someone
  to start a "Shortest SRM 248 Div 2 250" thread to deal with this issue.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3523&amp;rd=7223" name="3523">WordPattern</a></b>
</font>
<A href="Javascript:openProblemRating(3523)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      147 / 311 (47.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      75 / 147 (51.02%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ctynan</b> for 492.14 points (3 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      294.09 (for 75 correct submissions)
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
      281 / 311 (90.35%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      201 / 281 (71.53%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Petr</b> for 244.26 points (4 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      178.23 (for 201 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>This problem provided the greatest challenge material, as a number of coders forgot 
  to handle the case when the input was only 1 character long in their closed-form 
  solutions. For those coders who chose to solve the problem using simple memoization or
  a BFS, this turned out to not be an issue.</p>
<p>As mentioned in the problem statement, the procedure to create the actual pattern
  was part of the problem. This isn't very difficult. The pattern is constructed as 
  follows:</p>
<pre>
write the word and it's reverse, overlapping the first character
word = word[2..length word]            // i.e. remove first character
for iter:1 to length word - 1
  write down word and it's reverse, overlapping the first character
  as the first and last row in the pattern
  word = word[2..length word]        // i.e. remove first character
</pre>
<p>Then, the number of ways to spell out the original word can be found by doing a very
  simple Breadth First Search (BFS). Starting at the center of the pattern, work outwards
  toward the fringe.  At each location, the number of ways of getting to
  that location is simply equal to the sum of the number of ways of
  getting to the one or two locations that could be predecessors.  For
  instance, in the upper right quadrant, the number of ways of getting to a
  location is equal to the sum of the number of ways of getting to the
  location to its left and the number of ways of getting to the location
  below it.  Finally, the return value is simply the number of ways of
  reaching all the fringe squares.</p>
<p>Many people discovered the closed-form solution to this problem. This is given by: </p>
<pre>
        if word.length &lt; 2 return 1 else return (1 &lt;&lt; (length word + 1)) - 4;
</pre>
<p>The proof is left as an exercise for the reader. :-)</p>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3545&amp;rd=7223" name="3545">BitStrings</a></b>
</font>
<A href="Javascript:openProblemRating(3545)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      117 / 311 (37.62%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      55 / 117 (47.01%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>palmcron</b> for 902.55 points (9 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      625.86 (for 55 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
<p>It may appear that this problem can be solved in a greedy manner. Two simple approaches
  come to mind. First, always attempt to form the shortest strings possible before attempting
  larger strings. However, this approach is flawed. Consider the case where 2 0s and 5 1s are 
  available, and we have to make strings from the set {00, 011, 0111}. Then, if we were to 
  greedily form the first string "00", we wouldn't have enough 0s to form any other strings,
  and our solution would return 1. Clearly, we can do better, by forming the second and third 
  strings.</p>
<p>Another greedy approach is to always attempt to form strings that consume the least number
  of the digit which are in shortest supply. That is to say, if you have less 0s than 1s, you
  would attempt to construct strings that use a minimum number of 0s and in case of ties, break
  by the number of 1s. This approach is also flawed. Consider the case where you have 5 0s and 4
  1 at your disposal, and the string list is {100000, 110, 110}. Noting that you have fewer 1s
  than 0s, you would construct the string "100000", since this consumes the least number of 1s.
  But now, you have no 0s left to construct the other strings.</p>
<p>The task can be solved with Dynamic Programming. First, we process the set of 
  strings given to us and for each string, we store the number of 0s and 1s that appear
  in that string. In pseudo code,</p>
<pre>
for i:1 to number of strings
  for j:1 to length string[i]
      if character j in string i = 0 C0s[i]++;
      if character j in string i = 1 C1s[i]++;
</pre>
<p>Then, consider an array A, with dimensions [MAX_ZEROES][MAX_ONES]. The <i>i,j </i>entry of
  A represents the number of bitstrings that can be formed using <i>i</i> 0s and <i>j</i> 1s. So
  our algorithm is as follows (Note that we need to use an auxilliary array, B):</p>

<pre>
Initialze A to all 0
for i:1 to number of strings
  Initialize B to all 0
  string s = strings[i]

  // Consider s alone
  if C0s[i] &#8804; numZeroes and C1s[i] &#8804; numOnes B[C0s[i]][C1s[i]] = 1

  // Now, try making string s from everywhere we have previously reached
  for n0:0 to numZeroes
      for n1:0 to numOnes
          if A[n0][n1] &gt; 0    // We can get here
             if n0 + C0s[i] &#8804; numZeroes and // We have enough 0s
                n1 + C1s[i] &#8804; numOnes and   // We have enough 1s
                A[n0][n1] + 1 &gt; A[n0 + C0s[i]][n1 + C1s[i]]
                    Update [n0 + C0s[i]][n1 + C1s[i]] in B
               
  Copy B into A
</pre>
<p>The idea is to attempt to form new strings from positions that we can already reach from 
  previous strings. So, if we can make X strings using <i>i</i> 0s and <i>j</i> 1s, and we're
  considering a string with <i>u</i> 0s and <i>v</i> 1s, it is obvious that we will reach the cell
  <i>i + u</i>, <i>j + v</i> in the array. Then, we only update the cell at that position if making
  this string actually improves the answer we already have stored there. The runtime of the above 
  algorithm is on the order of MAX_STRINGS*MAX_ZEROES*MAX_ONES.</p>

<p>Note that with the constraint of 20 strings, this problem could actually be solved using simple bruteforce, by
  using bitmasks and iterating from 0 to 2^(# of bitstrings), which is the approach taken by most
  coders who solved this problem.</p>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3525&amp;rd=7223" name="3525">ContractWork</a></b>
</font>
<A href="Javascript:openProblemRating(3525)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      230 / 311 (73.95%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      172 / 230 (74.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 490.21 points (4 mins 1 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      360.84 (for 172 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>Once again, it may appear that a greedy approach could work, but this is incorrect. 
  Consider a simple example of only 3 tasks and 2 companies, with the following cost table: 
  {"1 1 1", "10 10 100"}. If one attempts to perform each task greedily, i.e. choosing the cheapest 
  company for each task, then tasks 1 and 2 would be assigned to company 1, since it has a cost of 
  1 for each of those tasks, which is less than what company 2 will charge. But now, we are 
  FORCED to contract task 3 to company 2, since company 1 has already performed 2 consecutive tasks. 
  Thus, we incur a cost of 100, bringing our total cost to 102. It is obvious that the correct 
  minimum cost here is 12 (company 2 must be given either task 1 or 2, and the remaining tasks are 
  performed by company 1).</p>
<p>To solve this problem, we can use memoization. Create an array cache[NUM_TASKS][NUM_COMPANIES][NUM_COMPANIES]
  and used the following function:
</p>
<pre>
int getAnswer(int curTask, int beforePrev, int prev)

  if curTask == NUM_TASKS return 0
  if cache[curTask][beforePrev][prev] &gt; -1
     return cache[curTask][beforePrev][prev]  // Obviously, check range

  int best = INF
  for i:0 to NUM_COMPANIES
      if beforePrev == prev &amp;&amp; prev == i continue; // 3 in a row
         best = min(best, cost[i][curTask] + getAnswer(curTask + 1, prev, i)

  cache[curTask][beforePrev][prev] = best
</pre>
<p>The idea here is as follows: If you can discover a function to return the optimal cost of
  performing the current task, then it is easy to use the same function to determine the total cost.
  So we just try all the possibilities for performing the current task and recursively calculate the
  optimal answer for the remaining subproblem. Naturally, we use memoization to speed-up the
  process. This problem can also be solved using a DP approach, using straight iteration rather
  than a recursive formulation.</p>


<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4612&amp;rd=7223" name="4612">ClockManagement</a></b>
</font>
<A href="Javascript:openProblemRating(4612)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br />
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
      73 / 311 (23.47%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      45 / 73 (61.64%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 768.10 points (16 mins 42 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      549.94 (for 45 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
On the night of an exciting game 6 in the NBA finals, this problem asked us
to help two basketball teams manage the clock.  Luckily, the game was
grossly simplified with the removal of fouls, timeouts and three point
shots.  This left only 2 point baskets, and a rather standard mini-max type
of problem.  Like most problems in this class, it is best solved with
recursion, where the recursive function determines what to do for a
particular game state.  In this case, the game state consisted of who has
the ball, the score differential, and the amount of time left.  Note that
the absolute scores don't have any impact -- only the difference
matters.<br/><br/>
From a particular game state, a team has a number of different options of
what to do, corresponding to the numbers of seconds the team can take to
set up.  When it is team A's turn to decide, it should do so to maximize the
probability of winning down the road.  When it is team B's turn to decide,
it should do so to maximize its probability of winning or tying down the
road.  Here is the basic idea, where a team makes its decision of what to do by looking at each option and picking the best:
<pre>
double recurse(timeLeft, diff, curTeam){
  double ret = 0
  foreach(number of seconds to set up i){
      d = probability of curTeam winning (or tieing in the case of 
          team B) if curTeam shoots after i seconds
      ret = max(ret,d)
  }
  return ret
}
</pre>
As you can see, when it is A's turn to make a decision, A maximizes the
return.  When it is B's turn to make a decision, B minimizes the return.
However, this is only the beginning of a solution.  To make it work, we
have to figure out how to determine d, add the base case, and then make it
run fast.  Calculating d above requires 3 recursive calls, based on the
three possible outcomes of a shot: scoring, missing and getting a rebound,
missing and losing possession.  If we let a value of 0 represent team A,
and 1 represent team B, and put the probabilities in 2-D arrays p and r
(for percentage and rebound), then we can calculate d as follows:
<pre>
 <font color="blue">//in order, the calls correspond to scoring, missing, and missing and rebounding</font>
 d = (1-recurse(timeLeft-i,diff+(curTeam==A?2:-2),1-curTeam)) * p[curTeam][i-2]
 + (1-recurse(timeLeft-i,diff,1-curTeam)) * (1-p[curTeam][i-2]) * (1-r[curTeam][i-2])
 + recurse(timeLeft-i,diff,curTeam) * (1-p[curTeam][i-2]) * r[curTeam][i-2]
</pre>
Notice that the recursive function returns the probability of curTeam
coming out on top.  As a result, when the ball changes possession, you must
subtract the probability from the recursive call from 1.  For instance, the
first recursive call above correlates to curTeam scoring, and the recursive
call returns the probability that the other team will win (or tie for B).
To convert this to the probability that curTeam will win, simply subtract
it from 1.<br/><br/>
Next we have to add our base case.  This is simply a matter of returning 1
when the game has 0 or 1 seconds left and curTeam is going to win, and 0 if
curTeam is going to lose:
<pre>
if(timeLeft &lt;=1){
  if(diff &gt; 0 &amp;&amp; curTeam == A || 
     diff &#8804; 0 &amp;&amp; curTeam == B)return 1;
  else return 0;
}
</pre>
Finally, to make the solution run fast enough, we need to use memoization
to cache the results.  This amounts to saving the result of a recursive
call for a particular (timeLeft,diff,curTeam) triple after it has been
computed.  Then, if the recursive function is ever called again with the
same arguments, the results can be looked up in the table.  <br/><br/>
antimatter's solution follows the approach outlined here quite closely.
</p>
                <p>
                <img src="/i/m/NeverMore_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=287130"><strong>NeverMore</strong></a><br />
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
