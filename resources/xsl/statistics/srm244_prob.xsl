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

<title>Single Round Match 244 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 244</font></td>
                     <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Monday, May 23, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
In Division 1, the not-too-hard but subtle problem set made the match quite exciting and unpredictable until the dust settled after the system test. Congratulations to <b>misof</b> for his victory with a wide margin, followed by <b>Zis</b> and <b>Eryx</b>. Partway through the match, <b>Eryx</b> made a stunning blitz of submitting all the problems in 25 minutes, but pitifully losing his lead by a resubmission of the 900-point problem 25 minutes later. During the stirring challenge phase, the ranking list permutated frantically. Special mention goes to <b>HardCoder</b> in room 3 who raked in 300 points by 6 successful challenges on the ConnectFour problem.
</p>
<p>
Division 2 was less eventful. Many coders finished the entire set well before the coding phase ended. The newcomer <b>vlad89</b> took the first place, with <b>abhiman</b> and <b>Seiz3r</b> coming in a close second and third.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4588&amp;rd=7219" 
name="4588">Grader</a></b>
</font>
<A href="Javascript:openProblemRating(4588)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
       212 / 235 (90.21%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       197 / 212 (92.92%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>Fabi</b> for 248.95 points (1 mins 50 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       205.49 (for 197 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
The problem is fairly straightforward. First, we count the bias of each prediction in a single loop:
<pre>
	vector&lt;int&gt; result(7);
	for(int i = 0; i &lt; predictedGrades.size(); ++i)
		++result[abs(predictedGrades[i] - actualGrades[i])]; </pre> Then we convert the result into percentages and return it:
<pre>
	for(int i = 0; i &lt; 7; ++i)
		result[i] = result[i] * 100 / predictedGrades.size();
	return result;
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4464&amp;rd=7219" 
name="4464">PhonePad</a></b>
</font>
<A href="Javascript:openProblemRating(4464)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Value</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       400
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Submission Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       196 / 235 (83.40%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       175 / 196 (89.29%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>teminator</b> for 389.33 points (4 mins 43 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       277.51 (for 175 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
Some coders hard-coded the distance matrix or the coordinates of keys for calculation, which is a doable approach. However, in a fast-paced SRM, it is usually better to save some typing by computing them at run-time:
<pre>
	string pad = "123456789*0#";
	int result = 0, x = 1, y = 1;
	for(int i = 0; i &lt; phoneNumber.size(); ++i){
		int index = pad.find(phoneNumber[i]);
		int row = index / 3;
		int col = index % 3;
		result += abs(x - col) + abs(y - row);
		y = row;
		x = col;	
	}	
	return result;
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4507&amp;rd=7219" 
name="4507">CircleDance</a></b>
</font>
<A href="Javascript:openProblemRating(4507)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Value</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       900
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Submission Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       82 / 235 (34.89%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       59 / 82 (71.95%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>limun1</b> for 833.31 points (8 mins 10 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       603.38 (for 59 correct submissions)
     </td>
   </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Value</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       300
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Submission Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       170 / 207 (82.13%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       135 / 170 (79.41%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>kats</b> for 295.44 points (3 mins 32 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       226.85 (for 135 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
It's quite obvious that trying out all the permutations of arrangement is infeasible. After playing around with small instances of this problem, you may soon discover the strategy that always gives the best result: first sort the array <b>heights</b>. Starting from any point on the circumference, line up all the dancers with odd indices of <b>heights</b> on one side, and the rest on the other side. For example:
</p>
<pre>
         [5]  [7]
     [3]           [9]

  [1]                [11]

[0]                  [13]

  [2]                [12]

     [4]          [10]
         [6]  [8]
</pre>
<p>
Why is this simple solution optimal for any number of dancers? Well, we may prove it using mathematical induction. Assume the array <b>heights</b> is already sorted in ascending order, and the greedy solution is optimal for the first <i>k</i> dancers with the minimum of maximum height difference <i>f(k)</i>, and the <i>k</i>th and <i>(k-1)</i>th dancers are adjacent. Now we add the <i>(k+1)</i>th dancer whose is taller than or as tall as any one among the first <i>k</i> previously considered. As this dancer must also have two neighbors in the circle, the lower bound of <i>f(k+1)</i> must be <i>max(f(k), heights[k]-heights[k-2])</i>, which can be achieved if we insert the <i>(k+1)</i>th between the <i>k</i>th and <i>(k-1)</i>th. Notice that the tallest and second tallest dancers(i.e. 
the <i>(k+1)</i>th and <i>k</i>th) are still adjacent. So the solution holds optimal for <i>(k+1)</i> people. The simplest case with three dancers can be trivially proved, therefore the greedy solution is truly valid for any case with more dancers.
</p>
<p>
Another compelling reason to convince yourself is that a SRM div 1 easy must be easy : ) Anyway, once you are convinced, the implementation can be really short:
</p>
<pre>
	sort(heights.begin(), heights.end());
	int result = 0;
	for(int i = 2; i &lt; heights.size(); ++i)
		result = max(result, heights[i] - heights[i-2]);
	return result;
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4509&amp;rd=7219" 
name="4509">Polyline</a></b>
</font>
<A href="Javascript:openProblemRating(4509)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Value</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       450
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Submission Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       103 / 207 (49.76%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       99 / 103 (96.12%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>Eryx</b> for 439.45 points (4 mins 25 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       349.18 (for 99 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
This problem is a bit tricky to figure out, but once you do, the coding is
trivial.  To figure out how to do it, imagine that you only had to hit one edge
of the box, and then travel to the other point.  It should be obvious that if we
reflect the second point over that edge, it will be the same distance from
whatever point on the edge we travel to first.  Now, we all know that the
shortest path between two points is a straight line, so it is best to draw a
straight line from the starting point to the reflected point, and wherever that
hits, that is where you should travel to on the edge.  Now, since there are four
edges, we just have to reflect the end point over all of them.  For each
parallel pair of edges, there are two ways to reflect the point (we can pick
either edge for the first reflection).  This gives us four possible positions
for the final 4-time reflected point.  We simply pick the shortest one, and
that's it.  If you work it out on paper a bit, you'll see that reflecting twice
either adds or subtracts twice the distance between the parallel edges, giving
us the following solution:
<pre>
	double ret = Double.POSITIVE_INFINITY;
    for (int i = -2; i &lt;= 2; i+=4) for (int j = -2; j &lt;= 2; j+=4) 
        ret = Math.min(ret,dist(x0,y0,x1+i*a,y1+j*b));
	return ret;
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4465&amp;rd=7219" 
name="4465">ConnectFour</a></b>
</font>
<A href="Javascript:openProblemRating(4465)"><img hspace="10" border="0" 
height="18" width="60" src="/i/rate_it.gif"/></A><br /> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Value</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       900
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Submission Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       58 / 207 (28.02%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Success Rate</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       7 / 58 (12.07%)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>High Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       <b>misof</b> for 483.30 points (33 mins 9 secs)
     </td>
   </tr>
   <tr>
     <td class="bodyText" style="background: #eee;">
       <b>Average Score</b>
     </td>
     <td class="bodyText" style="background: #eee;">
       415.38 (for 7 correct submissions)
     </td>
   </tr>
</table></blockquote>

<p>
The hard part of this problem is in determining if a game is valid or not.  If
we know its valid, its easy to figure out which of the other return values is
correct.  A lot of people tried to figure out if the game was valid by using
heuristics, but this is dangerous at best, and you are very likely to get it
wrong by doing this.<br/><br/>
A safer solution is to reconstruct a game that could give the input 
board state.  You can do this either forward or backwards, and neither is much
harder than the other.  Let's consider the forward approach.  We start with an
empty board, which we represent by {0,0,0,0,0,0,0}, the number of pieces in each
column.  Now, we check the board, and see which of the columns could have been
'X's first move.  Lets say that there is an 'X' in the bottom of the first and
third columns, then we recurse with {1,0,0,0,0,0,0} and {0,0,1,0,0,0,0}, the two
possibilities for the number of filled rows after one move.  We continue
branching like this on all possible moves, modifying the number of pieces in a
column by 1 such that the moves match the board we are given.  Eventually we
will either try all possibilities without success (in which case the board is
invalid), or else we will find a valid way to get to the given board position.
Of course, along the way, we have to be careful that we don't create four in a
row on a non-final move, but that's easy to do.  Finally, you have to memoize so
that you don't expand a board position more than once.  To do this, just cache
each board position as you expand them, and if you reach a position that has
already been expanded, just immediately return false.
<pre>
    boolean recurse(int[] columns, int turn){
        if(cache.contains(columns))return false;
        if(columns is end board)return true;
        if(columns contains connect four)return false;
        cache.add(columns);
        for(int i = 0; i&lt;7; i++){
            if(columns[i]!=6 &amp;&amp; board[i][5-columns[i]] == marker(turn)){
                columns[i]++;
                if(recurse(columns,1-turn))return true;
                columns[i]--;
            }
        }
        return false;
    }
</pre>
Since each column can have between 0 and 6 pieces in it, and there are 7
columns, the state space is 7<sup>7</sup> = 823543.  This is small enough that
it can be fully explored without much trouble.
</p>


                <p>
                By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=10487679"><strong>logged</strong></a><br />
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
