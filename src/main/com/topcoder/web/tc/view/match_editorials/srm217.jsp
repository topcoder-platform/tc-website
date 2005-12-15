<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505689" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 217</span><br>Wednesday, October 27, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>
SRM 217 was pretty easy on division 2, with many coders solving the first two
problems.  haipt81 ended up winning without any challenges by less than 3
points.  Esi was a close second, followed by nihilista, almost 80 points behind.
<br/><br/>
In division 1, however, the problems were anything but easy.  Though most
coders made short work of the 250 point problem, they had a hard time with the
600.  Many of them submitted some code, but the majority were doomed to failure.
The 900 point problem also proved difficult for most, though it had a much
higher success rate.  When the dust finally settled, SnapDragon and tomek were
the only ones to solve all three problems, and SnapDragon ended up with the win.
In second place, TAG challenged all 14 medium problems in his room successfully.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2980&amp;rd=5863" name="2980">FuelConsumption</a></b>
</font>
<A href="Javascript:openProblemRating(2980)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505689" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      186 / 201 (92.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      178 / 186 (95.70%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>hsaniva</b> for 246.40 points (3 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      201.83 (for 178 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was pretty straightforward.  If your car is going at <tt>x</tt>
kilometers per hour, and uses <tt>y</tt> liters of fuel per hour, then at can go
<tt>x</tt> kilometers on <tt>y</tt> liters of fuel.  Therefore, if you have
<tt>fuel</tt> liters of fuel, you can go <tt>x*fuel/y</tt> kilometers.  You
should calculate this value for each potential speed, and return the maximum.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3002&amp;rd=5863" name="3002">PlayGame</a></b>
</font>
<A href="Javascript:openProblemRating(3002)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505689" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      142 / 201 (70.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      120 / 142 (84.51%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>petra.b1</b> for 571.08 points (6 mins 27 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      417.47 (for 120 correct submissions)
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
      177 / 186 (95.16%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      173 / 177 (97.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 247.27 points (2 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      214.60 (for 173 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The first thing you should do in this problem is sort each input.  Next,
consider your strongest unit.  You should put this unit up against the strongest
unit that it can defeat.  That way, your unit wins, and it defeats a strong unit
of the computer.  You then move on to the next strongest unit, and so on.
<br/><br/>

If you were to assign the strongest unit to a weaker computer unit than the one
this algorithm suggests, you could do no better because you would have to put
some other unit against the stronger unit that you passed over.  Furthermore, if
you assigned your strongest unit to a computer unit that defeated it, you would
clearly do better by  assigning a weaker unit to the computer's unit.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3042&amp;rd=5863" name="3042">Crossroads</a></b>
</font>
<A href="Javascript:openProblemRating(3042)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505689" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      50 / 201 (24.88%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      38 / 50 (76.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Esi</b> for 779.35 points (16 mins 5 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      561.89 (for 38 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Consider a pair of cars, a and b, with a starting to the left of b.  If the
angle of a is less than the angle of b, their paths will eventually intersect.
But, which of the two cars will get their first?  The car with the angle closer
to 90 degrees will always get to the intersection first.  What happens if a or b
is blocked before it gets to the intersection.  It turns out that it doesn't
matter because if a would block b, and another car c would block a, then c will
also block b.  The only exception to these rules is the case where there are
ties.  If two cars reach the intersection at the same point because there angles
are equidistant from 90, then the one with the lower index wins.

<pre>
    public int[] getOut(int[] angles){
        int[] r = new int[50];
        int ptr = 0;
        loop:for(int i = 0; i&lt;angles.length; i++){
            for(int j = 0; j&lt;angles.length; j++){
                if(j&lt;i &amp;&amp; angles[j] &lt; angles[i] &amp;&amp;
                        Math.abs(angles[j]-90) &lt;= Math.abs(angles[i]-90))
                    continue loop;
                if(j&gt;i &amp;&amp; angles[j] &gt; angles[i] &amp;&amp; 
                        Math.abs(angles[j]-90) &lt; Math.abs(angles[i]-90))
                    continue loop;
            }
            r[ptr++] = i;
        }
        int[] ret = new int[ptr];
        System.arraycopy(r,0,ret,0,ptr);
        return ret;
    }
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2929&amp;rd=5863" name="2929">Crossings</a></b>
</font>
<A href="Javascript:openProblemRating(2929)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505689" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      126 / 186 (67.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      20 / 126 (15.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jshute</b> for 419.57 points (20 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      266.85 (for 20 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was very similar to the division 2 hard.  The difference was that
the positions of the cars were part of the input.  As in the division 2 hard,
only the order mattered, but because of the way ties are broken (by index),
there were a couple of tricky cases that cause most solutions to fail.  The
trickiest one was something like:<br/><tt>positions = {1,0,2}</tt><br/><tt>angles
    = {135,45,135}</tt><br/>
In this case, cars 0 and 1 collide first, and car 0 blocks car 1.  Therefore,
cars 0 and 2 both pass all intersections.  Many solutions only looked at pairs
of cars, and saw that cars 1 and 2 would collide, and since 1 has a lower index,
they incorrectly marked car 2 as blocked.  There are a number of ways to deal
with this case.  One way is to look at all triples of cars, and check for this
case explicitly.  Another way to do it is to look at cars closer together first.
The closer cars are together, the earlier they will collide.  Therefore, you can
look at the adjacent cars first, then the cars with one car between them and so
on.  You only examine pairs of cars that haven't already been blocked.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3004&amp;rd=5863" name="3004">TeleportAndLoader</a></b>
</font>
<A href="Javascript:openProblemRating(3004)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505689" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      56 / 186 (30.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      16 / 56 (28.57%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>SnapDragon</b> for 808.93 points (9 mins 45 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      566.22 (for 16 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Dynamic programming is always tough, and this problem was no exception.  First
off, you should notice that there is no reason to teleport any boxes to a floor
that none of them are going to.  If you did, and <tt>x</tt> boxes had to be
moved up, and <tt>y</tt> boxes had to be moved down, and <tt>x</tt> &gt;
<tt>y</tt>, then by teleporting the boxes one floor higher, your cost would be
lower.  Similarly, if <tt>y</tt> &gt; <tt>x</tt>, then it would be better to
teleport one floor lower, while if they are equal, we can teleport one floor
lower or one floor higher, and the cost is the same.  From here there are a
number of different ways to proceed.  I used dynamic programming to find the
cost of a solution, <tt>cost[i]</tt>, where the highest floor to which boxes
were teleported was <tt>i</tt>, for each <tt>i</tt>.  Given 
<tt>cost[j]</tt>, with <tt>j&lt;i</tt>, we can calculate the cost of
the solution whose two highest teleports are <tt>i</tt> and <tt>j</tt>.  The
boxes going to floors below <tt>j</tt> are still teleported to the same place,
as it would never make sense to teleport them to <tt>i</tt> over <tt>j</tt>.
Each of the boxes above <tt>j</tt> was teleported to <tt>j</tt> in the
solution giving <tt>cost[j]</tt> and from <tt>j</tt> they were moved up,
so we know exactly how much it cost to move each of those boxes.  Therefore, we
can subtract thoses costs from <tt>cost[j]</tt>.  This gives us the cost of
transferring all the boxes going to <tt>j</tt> or below.  Finally, we
teleport each of the boxes going to floors above <tt>j</tt> to either <tt>j</tt>
or <tt>i</tt>, whichever is closer, and add up the cost.  This gives us the
minimum cost of a solution whose two highest teleports are <tt>i</tt> and
<tt>j</tt>.  Minimizing this over all <tt>j</tt>, we get <tt>cost[i]</tt>.
Finally, we return the minimum <tt>cost[i]</tt> over all <tt>i</tt>.<br/><br/>
There are a couple of things to watch for.  First, you have to be careful of the
case where the best solution requires no teleporting.  Second, you have to be
careful of overflow - snewman got a lot of challenge points on solutions that
overflow.

<pre>
    public int cheapTransportation(int[] boxes, int tc, int lc){
        Arrays.sort(boxes);
        long[] cost = new long[boxes.length+1];
        for(int j = 0; j&lt;boxes.length; j++){
            cost[0]+=boxes[j]*lc;
        }
        <font color="blue">//cost[0] is the cost with no teleporting</font>
        long ret = cost[0];
        for(int i = 1; i&lt;cost.length; i++){
            long min = 1000000000000000000L;
            for(int j = 0; j&lt;i; j++){
                <font color="blue">//add tc to cost[j] to account for 
                //the teleportation to i</font>
                long tmp = cost[j]+tc;
                for(int k = 0; k&lt;boxes.length ;k++){
                    <font color="blue">//d1*lc is the cost for box k if we teleport
                    //it to j, while d2*lc corresponds to sending k to i</font>
                    long d1 = boxes[k] - (j==0?0:boxes[j-1]);
                    long d2 = Math.abs(boxes[k] - boxes[i-1]);
                    tmp -= d1*lc;
                    tmp += Math.min(d1,d2)*lc;
                }
                <font color="blue">//tmp is the cost where i and j are 
                //the two highest teleports</font>
                min = Math.min(min,tmp);
            }
            ret = Math.min(ret,min);
            cost[i] = min;
        }
        return (int)ret;
    }
</pre>
</p>


<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
