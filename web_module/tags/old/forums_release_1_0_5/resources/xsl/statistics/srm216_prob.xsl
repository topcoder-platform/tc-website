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

<title>Single Round Match 216 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 216</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Saturday, October 18, 2004</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->


<h2>Match summary</h2>

<p>
It was not an easy night for Division 1 participants as all three problems proved both
unusual and challenging, each in their own way. Many strong competitors were thrown off by
this and ended up with scores of 0, which makes <b>tomek</b>'s intimidating 1641.97 points all 
the more impressive - congratulations! He was followed by fellow Pole <b>Eryx</b> in second, and 
<b>kalinov</b> in third. It was also nice to see a new face among the top scorers with
<b>ivan_metelsky</b> finishing in fourth place in his fourth TopCoder competition.
</p>

<p>
There were many more submissions in Division 2, but the system tests were anything but easy.
It was a tight race near the top as <b>AnonnymousT</b> took first place with three successful
challenges, followed by newcomers <b>zjq</b> and <b>tesh11</b>.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2983&amp;rd=5862" name="2983">CultureShock</a></b>
</font>
<A href="Javascript:openProblemRating(2983)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      188 / 210 (89.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      127 / 188 (67.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Sleeve</b> for 249.19 points (1 mins 37 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      214.81 (for 127 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The most natural approach to this problem is to split the given text into an array of words, and to then check if each word is "ZEE". You can then reconstruct the string by concatenating the
words, adding spaces as necessary. In C++, this can be done as follows: 
<pre>
string result, temp;
istringstream in(text);
while (in &gt;&gt; temp) {
    if (temp == "ZEE")
        result += " ZED";
    else
        result += " " + temp;
}
return temp.substr(1);
</pre>
In Java, you can use StringTokenizers, following <b>Sleeve</b>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&amp;rm=151567&amp;rd=5862&amp;pm=2983&amp;cr=266705">
solution</a>, or you can use the very handy <a href="http://java.sun.com/j2se/1.4.2/docs/api/java/lang/String.html#split(java.lang.String)">split</a> function. If you do not use built-in parsing tools, you have to be careful that you only replace complete words, an oversight that accounted for many of
the incorrect submissions for this problem.
</p>

<p>
If you a real guru, you can actually solve the problem in a single line. Here is one such solution:
<pre>
return (" "+text+" ").replaceAll(" ZEE ","  ZEE  ").replaceAll(" ZEE "," ZED ").replaceAll("  "," ").trim();
</pre>
Spaces are added at the beginning and end of text as advised <a href = "http://www.topcoder.com/index?t=features&amp;c=feat_090104">here</a>. I leave it as a little puzzle to figure out why the first and third <code>replaceAll</code> calls are needed. By the way, for
those wondering who Bob and Doug are, I refer you to Google.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2984&amp;rd=5862" name="2984">RockStar</a></b>
</font>
<A href="Javascript:openProblemRating(2984)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      112 / 210 (53.33%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      56 / 112 (50.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ged</b> for 470.75 points (7 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      309.92 (for 56 correct submissions)
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
      141 / 165 (85.45%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      96 / 141 (68.09%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 247.02 points (3 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      196.71 (for 96 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem is as much about logic as it as about coding, a fact that threw off many competitors. For such a problem, the first thing you need to do is just organize your thoughts. In this case,
a few observations turn out to be key:
<ul>
  <li>
    If you can ever play a song that starts fast, you might as well immediately play all ff
    songs that start fast and end fast. This is because playing one of these songs does not in
    any way affect what you can do in the future.
  </li>
  <li>
    Similarly, if you can ever play a song that starts slow, you might as well immediately play
    all ss songs that start slow and end slow.
  </li>
  <li>
    After this, you essentially have no choices. If you have a song that starts fast and ends
    slow, you must play it first. You can only follow this with a song that starts slow and
    ends fast, which can only be followed by a song that starts fast and ends slow, etc.
  </li>
</ul>
Based on these observations, you can break the problem into several cases, each of which can be
dealt with easily:
<pre>
if (fs+ff &gt; 0) {
    if (fs == 0) return ff;
    else if (sf &gt;= fs) return ff + ss + 2*fs;
    else return ff + ss + 2*sf+1;    
} else
    return ss + min(sf, 1);
</pre>
Of course, it is easy to make a mistake on one or more of these cases, even with the fairly broad
range of examples. I did not really see any pattern in the mistakes here - you just had to be 
careful.
</p>

<p>
Although it is probably not very helpful for solving the problem, the scenario can also be related
to the question of <a href="http://mathworld.wolfram.com/EulerianTrail.html">Eulerian paths</a>
on a multi-graph with two vertices (fast and slow), where each song corresponds to a directed edge. Using this insight, you can actually efficiently solve a more general version of the problem where there are more than two possible song speeds.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2985&amp;rd=5862" name="2985">TournamentRanker</a></b>
</font>
<A href="Javascript:openProblemRating(2985)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      46 / 210 (21.90%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      26 / 46 (56.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kmd-10</b> for 784.06 points (15 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      570.62 (for 26 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Not surprisingly, the key to solving this problem is being able to determine which of two
competitors should be ranked higher. There are a couple ways of approaching this, but I think the
cleanest is to follow the problem directions precisely as given. First of all, make sure you know the number of wins that each competitor has, and to whom each competitor lost. Then, you can translate the ranking description almost directly into a recursive function. In C++, for example, it might look like this:
<pre>
map&lt;string, int&gt; wins;
map&lt;string, string&gt; lostTo;
bool isRankedHigher(const string &amp;s1, const string &amp;s2) {
    if (wins[s1] != wins[s2])
        return wins[s1] &gt; wins[s2];
    else
        return isRankedHigher(lostTo[s1], lostTo[s2]);
}
</pre>
You could then sort the competitors in one line: <code>sort(names.begin(), names.end(), isRankedHigher)</code>. This can also be done in Java, although the syntax is a little more
cumbersome. See, for example, <b>Rakot</b>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&amp;rm=151561&amp;rd=5862&amp;pm=2985&amp;cr=263468">
solution</a>.
</p>

<p>
If you are not comfortable with recursion, one other approach is to build the sorted list one
competitor at a time. You only consider adding competitors with a maximal number of wins, and then the competitors they lost to will have already been sorted, so they can be compared directly without recursion. See <b>theMadhouse</b>'s <a href = "http://www.topcoder.com/stat?c=problem_solution&amp;rm=151566&amp;rd=5862&amp;pm=2985&amp;cr=10366320">
solution</a> for a variation on this method.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2986&amp;rd=5862" name="2986">Refactoring</a></b>
</font>
<A href="Javascript:openProblemRating(2986)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      36 / 165 (21.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      29 / 36 (80.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>battyone</b> for 483.19 points (5 mins 20 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      351.68 (for 29 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
It only takes one quick look at the statistics to see that this was an unusual problem. With
only 29 correct solutions, it was clearly not easy. On the other hand, <b>battyone</b> solved it
really fast. So how do you do it?
</p>

<p>
I think there are three things you have to realize. First of all, you have to see that this is a level 2 problem, not a level 3 problem. You are not going to need crazy math, so you should not even be trying that.
</p>

<p>
The next thing you should realize is that factorizations and recursion go very well together.
Specifically, if <i>n = a * m</i>, then <i>a * m</i> is a factorization of <i>n</i>, as is <i>a</i> multiplied by any factorization of <i>m</i>. Indeed, we can find all factorizations of
<i>n</i> by iterating over all of its divisors <i>a</i>, and  then recursively finding all factorizations of <i>n/a</i>. Unfortunately, this will find certain factorizations more than
once. For example, 2*3*4 and 4*3*2 might both be counted, even though they are the same factorization. To solve this, it suffices to generate the factors in non-decreasing order. This 
can be done as follows:
<pre>
int count(int n, int lastFactor) {
    int result = 0;
    for (int a = lastFactor; a*a &lt;= n; a++) 
    if (n % a == 0) 
        result += count(n/a, a) + 1;
    return result;
}
</pre>
So what is the final thing you have to realize? Just that this solution is already fast enough!
This is not at all obvious, but the examples give you the worst case, so you can easily check. Indeed, written in Java, this code never takes more than about 4.5 seconds.
</p>

<p>
If, for some reason, your program is not quite fast enough, there are still a couple optimizations
you can try. If you precompute the factors of n, and then use 
<a href = "http://www.topcoder.com/index?t=features&amp;c=feat_040104">memoization</a> with a hash table, for example, you can make everything run in under a second.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2987&amp;rd=5862" name="2987">Roxor
</a></b>
</font>
<A href="Javascript:openProblemRating(2987)"><img hspace="10" border="0" height=
"18" width="60" src="/i/rate_it.gif"/></A><br/>
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
      8 / 165 (4.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      6 / 8 (75.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>tomek</b> for 827.08 points (13 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      662.01 (for 6 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
I was not sure if anybody would solve this problem, and if I saw a way to make it easier, I gladly would have taken it. Although one competitor confided that "I can do little more than cry in the face of this problem", it actually ended up being a little easier than I expected.
</p>

<p>
For two-player games like this, it is helpful to think in terms of winning and losing <i>positions</i>. Specifically, if two perfect players are playing, then either the first player wins or he loses. If he wins, call the starting position <i>winning</i>; otherwise call it <i>losing</i>. It is then easy to check that (a) all moves from a losing position change the game to a winning position, and (b) winning moves are precisely those moves that change the game from a winning position to a losing position.
</p>

<p>
Thus, it is helpful here to find winning and losing positions, and to worry about winning
moves from there. So how do you do that? It turns out that example 1 is a big, big hint, and the
key is reducing modulo 2 the number of stones in each pile. Specifically, given a position <i>P</i>, we let <i>P'</i> denote the same position with the number of stones in each
pile reduced modulo 2 to either 0 or 1. Then, call <i>P</i> <i>bad</i> if <i>P'</i> is a losing position. We claim that if player 1 is in a bad position <i>P</i>, then player 2 can ensure that 
player 1 will always be in a bad position. To see this, consider any move that player 1 could make:
</p>

<p>
<i>Case 1:</i> Suppose he does not remove the last stone from a pile. Then, player 2 can simply copy his move to get to a new position <i>Q</i> that also reduces to <i>P'</i>. Since <i>P'</i> is a losing position, <i>Q</i> is a bad position, and player 1 is still stuck.<br/>
<i>Case 2:</i> Suppose he removes the last stone from some pile to get to position <i>Q</i>. Then,
that pile must have had exactly one stone in it, so he could have done the same move from position
<i>P'</i> to get to position <i>Q'</i>. Now, we assumed <i>P'</i> was a losing position, so 
<i>Q'</i> must be a winning position, and thus there must exist a move from there that takes the
board to a losing position, <i>R'</i>. Finally, this same move can always be done from position
<i>Q</i> to get to position <i>R</i>. Since <i>R'</i> is a losing position, <i>R</i> is a bad
position, and again, player 1 is still stuck.
</p>

<p>
In particular, note that player 2 always has a legal move after any of player 1's moves, so
player 1 cannot possibly make the last move, and thus, cannot win. It follows that every bad
position is, in fact, a losing position. From here, it is easy to see that, in fact, <i>P</i> is
a winning position if and only if <i>P'</i> is a winning position!
</p>

<p>
This turns out to be a very important observation, as it reduces the game to just 2<sup>15</sup> states (since there are 2 meaningful possibilities for the number of stones in each pile). At this point, one can just do a complete search over all positions using memoization. If we represent each state as a 15-bit integer, for example, we could check if a position is a winnable like this:
<pre>
map&lt;int,bool&gt; isWinnable;
boolean getIsWinnable(int pos, int n) {
    if (isWinnable.count(pos))
        return isWinnable[pos];

    boolean result = false;
    for (int i = 0; i &lt; n; i++)
    if ( (pos &amp; (1&lt;&lt;i)) != 0)
    for (int j = i+1; j &lt; n; j++)
    for (int k = j; k &lt; n; k++)
        result |= !getIsWinnable(pos ^ (1&lt;&lt;i) ^ (1&lt;&lt;j) ^ (1&lt;&lt;k), n);

    isWinnable[pos] = result;
    return result;
}
</pre>
Finding the appropriate winning move with this information is fairly straightforward. See
<b>kalinov</b>'s 
<a href="http://www.topcoder.com/stat?c=problem_solution&amp;rm=151552&amp;rd=5862&amp;pm=2987&amp;cr=310333">
solution</a> for a very clean implementation.
</p>

<p>
As a random caveat, I did not have a fully mathematical solution to this problem (ie without the
memoized search at the end), and I did not really expect there to be one. Although five of the six correct solutions to the problem used the method described here, it looks like <b>ivan_metelsky</b>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&amp;rm=151556&amp;rd=5862&amp;pm=2987&amp;cr=10481120">
solution</a> is purely mathematical. I have not had a chance to look at it yet, but
it should give another interesting approach.
</p>


                <p>
                <img src="/i/m/dgarthur_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=262936"><strong>dgarthur</strong></a><br />
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
