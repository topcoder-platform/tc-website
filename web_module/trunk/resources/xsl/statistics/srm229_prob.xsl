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

<title>Single Round Match 229 Statistics at TopCoder</title>

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
                      <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 228</font></td>
                      <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                   </tr>

                   <tr valign="middle">
                      <td class="bodyText">Monday, January 31, 2005</td>
                      <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                   </tr>
                </table>
<!--end contextual links-->

<h2>Match summary</h2>

<p>
SRM 229 was quite a bit easier than 228, and in division 1, ten coders
solved all three problems successfully.  Top amongst them was
Jan_Kuipers, finishing in around 35 minutes.  Next in line was haha,
who finished just a few minutes later.  Rounding out the top 3 was
marian, over 100 points behind haha.<br/><br/>
In division 2, things were a little harder, as a tricky easy problem
caused many coders to stumble, and the hard problem was hard enough
that only 6 coders even submitted it.  entaroadun took top honors as
the only one to successfully submit all three problems.  Helped by 200
points in the challenge phase, nidonido took second in his first
competition, with succcessful submission on the medium and hard
problems.  Rounding out the top 3 was Philya, with solutions for the
easy and medium problems.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3539&amp;rd=6518" name="3539">Highscore</a></b>
</font>
<A href="Javascript:openProblemRating(3539)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      170 / 202 (84.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      46 / 170 (27.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>entaroadun</b> for 243.13 points (4 mins 48 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      177.73 (for 46 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem tripped a lot of people up, as evidenced by the low success rate.
In fact, it set a new record for the lowest success rate every by a division 2
easy - beating out the previous record holder by over 14%!  Of the
failed solutions I looked at, most of them ended up calculating the ranks of all the
scores in the table, and then trying to figure out the rank of the new score.
Some of them inserted the new score into the table, and then sorted the table,
finding the new ranks.  Both of these approaches are way more complicated than
is neccessary.

Instead, notice that the rank of a score is exactly equal to the number of
scores that beat it, plus 1.  So, if no one beats you, then you are in first, or
else tied for first.  If 3 people beat you, you are in fourth, or tied for
forth.  Hence, the rank of the new score can be calculated with a simple for
loop:
<pre>
    int place = 1;
    for(i = 0 to scores.length-1){
        if(newScore &lt; scores[i]){
            place ++;
        }
    }
</pre>
Now, if the place is greater than the number of spaces return -1.  Also, there
is the special case where the new score ties the bottom of the list, but the
list is already full.  Both of these are pretty simple to check for:
<pre>
    if(place == numPlaces+1)
        return -1;
    if(scores.length == numPlaces-1 &amp;&amp; scores[numPlaces-1] == score)
        return -1;
</pre>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3080&amp;rd=6518" name="3080">Cafeteria</a></b>
</font>
<A href="Javascript:openProblemRating(3080)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      88 / 202 (43.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      48 / 88 (54.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>{rustam}</b> for 439.82 points (10 mins 48 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      297.05 (for 48 correct submissions)
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
      202 / 217 (93.09%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      171 / 202 (84.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jshute</b> for 242.61 points (4 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      188.24 (for 171 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Coders had better luck with this problem and there are a couple of different ways
to go about it.  I think that the most straightforward and intuitive
method is to work backwards from
2:30PM. First calculate the latest a bus could leave the bus stop and still arrive at
2:30PM. Then calculate the last time before or equal to that when the bus would
actually leave, given its offset. Finally, calculate the time you would have to
leave to get to the bus stop.  Of all the bus stops, find the minimum time at
which you would have to leave.  If you represent all of your times as minutes
past midnight (<tt>2:30PM = 14*60+30 = 870</tt>) it will make things relatively
simple:
<pre>
    int time = 14*60+30;
    time -= drivingtime[i];
    time -=(time-offset[i])%10;
    time -= walkingtime[i];
</pre>
The only part that you have to think about a little is the one that deals with the offset, and there are
other ways to do it, though they require more typing (a loop, for
instance).<br/><br/>
At the end, you just had to convert the time into a string, being careful to get
the leading zeros in the right place, and making sure you do all the hours
correctly (the 12 in particular).
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3521&amp;rd=6518" name="3521">SnowClearing</a></b>
</font>
<A href="Javascript:openProblemRating(3521)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      6 / 202 (2.97%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 6 (50.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nidonido</b> for 507.92 points (36 mins 29 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      460.50 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
A dead end is any intersection that is only touched by a single street.  There are also
intersections that only lead to dead ends.  We can define these recursively by
saying that an intersection only leads to dead ends if following any of
the outgoing edges except for one of them from that intersection either goes directly to a dead end, or
else goes to an intersection that only leads to dead ends.  There is one
exception to this - the intersection associated with the garage may not be a
dead end, nor an intersection that leads only to dead ends.  This suggests
something like the following algorithm:
<pre>
    for each dead end at (row,column)
        set isDead(row,column) = true
    do
        look for an intersection at (row,column) != theGarage
                such that for exactly one intersection (row',column') 
                connected to (row,column), isDead(row',column') == false
        if (an intersection is found)
            set isDead(row',column') = true
    while(an intersection (row',column') is found)
</pre>
Now, there are a lot of different ways to actually implement this approach.  One
way, which I am fond of, is to create a large two-dimensional boolean array for
isDead, and then just loop over all intersections as long as the while condition
above is true.  At the end, just count the number of locations for which isDead
is set to true.  This approach runs rather slowly, but its fast enough for this
problem.  Here is an approach that is much faster:
<pre>
    int[][] adjNonDeadCount = new int[rows][columns]
    int[][] queue = new int[1000][2];
    int head = 0, tail = 0;
    for each intersection in the input at (row,column){
        if((row,column) == theGarage){
            adjNonDeadCount[row][column] = 0;
        }else if((row,column) is a deadEnd){
            adjNonDeadCount[row][column] = 1;
            queue[tail][0] = row;
            queue[tail][1] = column;
            tail++;
        }else{
            adjNonDeadCount[row][column] = numberOfOutgoingEdgesFrom(row,column);
        }
    }
    int[] dr = {0,1,0,-1};
    int[] dc = {1,0,-1,0};
    while(head &lt; tail){
        row = queue[head][0];
        column = queue[head][1];
        for(i = 0 to 3){
            row' = row + dr[i];
            column' = column + dc[i];
            if((row',column') and (row,column) are connected &amp;&amp;
                    adjNonDeadCount[row'][column'] &gt; 1){
                    adjNonDeadCount[row'][column'] --;
                    if(adjNonDeadCount[row'][column'] == 1){
                        queue[tail][0] = row';
                        queue[tail][1] = column';
                        tail++;
                    }
                }
            }
        }
        head++;
    }
    return tail;
</pre>
The idea here is that we are keeping track of how many intersections 
adjacent to each location have not been marked as dead or as only
leading to dead ends (both states are represented by a 1 in adjNonDeadCount).
Then, we look at each intersection that is marked as dead and reduce the
adjNonDeadCount of its neighbors.  If any of them become dead, then we add that
location to the queue.  The runtime of this algorithm is O(row*columns), as we
must look at every location once in the worst case.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3078&amp;rd=6518" name="3078">BusinessPlan</a></b>
</font>
<A href="Javascript:openProblemRating(3078)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      176 / 217 (81.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      92 / 176 (52.27%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Jan_Kuipers</b> for 483.67 points (5 mins 15 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      358.24 (for 92 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem requires a bit of dynamic programming, though it is on the easy
side as far as dynamic programming problems go.  The first important bit of
information to glean from the problem statement is that the company can only
work on one product at a time.  So, all you need to do is maximize the total
amount of money the company can have, at each time, assuming it has just
finished a product.  Let's say I have <tt>X</tt> dollars at time
<tt>T</tt>.  If I make
product <tt>i</tt>, where <tt>expense[i] &#8804; X</tt>, then I can have
<tt>X+revenue[i]-expense[i]</tt> at
time <tt>T+ptime[i]</tt>.  Since I can't stop in the middle of making a product,
and there is no reason to delay starting a new product once one is done, all I
need to worry about is how much money I can have after just finishing a product.
This leads to some elegantly short code:
<pre>
        int[] maxMoney = new int[10000000];
        maxMoney[0] = C;
        for(int i = 0;i&lt;maxMoney.length ; i++){
            if(maxMoney[i] &gt;= D)return i;
            for(int j = 0; j&lt;expense.length; j++){
                if(maxMoney[i] &gt;= expense[j])
                    maxMoney[i+ptime[j]] = max(maxMoney[i+ptime[j]],
                                maxMoney[i]+revenue[j]-expense[j]);
            }
        }
        return -1;
</pre>
1,000,000 is always enough time, if it's possible, since no ptime is more than 10,
and if it is possible, you must profit at least 1.  Hence, if you are making a
profit, you are doing so at a rate of at least 0.1 per time unit, and (D-C)/0.1 =
10*(D-C) &lt; 1,000,000 when D-C &lt; 100,000.<br/><br/>
An alternative approach is to do dynamic programming to compute the earliest
time at which a particular amount of money could be achieved.  I think
it's a little bit harder to do it this way, but some people have an easier time with
it, and it does run faster in this case.
<pre>
        if (C&gt;=D)
            return 0;
        int [] bestTime = new int[D+1];
        for (int i=0; i&lt;bestTime.length; i++){
            bestTime[i] = INF;
        }
        bestTime[C] = 0;
        for (int i=C; i&lt;D; i++) {
            for (int j=0; j&lt;ptime.length; j++){
                if (expense[j]&gt;i)
                    continue;
                int money = min(D,i+revenue[j]-expense[j]);
                if (bestTime[money]&gt;bestTime[i]+ptime[j])
                    bestTime[money] = bestTime[i]+ptime[j];
            }
        }
        if(bestTime[D] == INF)return -1;
        return bestTime[D];
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3068&amp;rd=6518" name="3068">Hangman42</a></b>
</font>
<A href="Javascript:openProblemRating(3068)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      25 / 217 (11.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 25 (44.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Jan_Kuipers</b> for 682.83 points (21 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      538.46 (for 11 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This is a classic sort of game theory problem.  The basic approach used by most
people is always the same: recursion + memoization.  You have some game state,
and you want to know, what should the player whose turn it is do in that game
state.  As intuition suggests, he should consider all of his options, and
imagine what his opponent would do in each situation.  When imagining what his
opponent would do, he is applying recursion, because his opponent will have to
do essentially the same thing, although with a different game state.  So, in
pseudocode, we have something like:
<pre>
    <font color="blue">//returns the probability of winning from G</font>
    double winningProbability(gameState G){
        if(G is a 'game over' state){
            if(player whose turn it is won)
                return 1;
            else 
                return 0;
        }
        ret = 0
        foreach(move M from gameState G){
            tmp = 0, cnt = 0;
            foreach(hidden word W consistent with previous moves){
                gameState G' = G after move M where W is the hidden word
                double d;
                if(currentPlayer goes again)
                    d = winningProbability(G');
                else
                    d = 1-winningProbability(G');
                tmp += d;
                cnt ++;
            }
            ret = max(ret,tmp/cnt);
        }
        return ret;
    }
</pre>
So, when considering a move, M, there is some set of potential hidden words that
are consistent with the previous moves.  In practice, this set can be easily
implemented as a bitmask, and is all that is needed to know the game state.  The
moves in the game are guessing a letter and guessing a word.  So, what the
algorithm is doing is checking to see, if the current player makes a guess, M,
and the hidden word is really W, what is the probability that the current player
will win.  Of course, this is one minus the probability that the other player
will win.  After considering each possible hidden word, the overall probability
is computed for the move as a simple average of the probabilities for each
word.<br/><br/>
To avoid repeating the same calculations over and over again, and timing out, you should add the
standard memoization code to the beginning and end of your code:
<pre>
    if(dp[G] exists)return dp[G];
    
    ...
    
    dp[G] = ret;
    return ret;
</pre>
</p>



                <p>
                <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
                By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
