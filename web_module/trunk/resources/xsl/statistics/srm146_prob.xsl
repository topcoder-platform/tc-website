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

<title>TopCoder | Statistics</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
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
                <xsl:with-param name="title">&#160;TC Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" /><br />

<!--body contextual links-->
                        <table border="0" cellspacing="1" cellpadding="3" width="100%">
                            <tr valign="middle">
                                <td bgcolor="#43515E" class="moduleTitle" colspan="2">MATCH EDITORIAL LINKS:</td>
                            </tr>
                          
                            <tr valign="middle">
                                <td class="bodyText" align="center" bgcolor="#CCCCCC"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyGeneric">Archive</a></td>
                                <td class="bodyText" align="center" bgcolor="#CCCCCC"><a href="mailto:editorial@topcoder.com" class="bodyGeneric">Comments/Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
                   
                        <img src="/i/clear.gif" alt="" width="1" height="6" border="0" /><br />
                        <!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
                                        
                        <p><strong>Single Round Match 146</strong><br />
                        Wednesday, May 14, 2003</p>
                              
                        <h2>Match summary</h2>
                        
                        <p>I don't know when it happened the last time, but in this SRM the top-scorer
was not a "red", but a high ranked yellow, <b>along</b>, who scored <b>1285.02</b>.
Another unique thing in Division-I was the presence of a problem worth 800 points,
as well as the fact that the highest rating gainer in Division-I (<b>cnettel</b>) was the same as after the last SRM! In Division-II, first-timer <b>tomek</b> didn't give the other competitors
a chance by scoring <b>1597.39</b>, more than 300 points ahead of the runner-up. This shouldn't
come as a surprise though, as <b>tomek</b> was part of the team that won this years ACM ICPC in Hollywood!
</p>

<p><B>Problem Set Analysis &amp; Opinion</B></p>

<font size="+2"><b>Yahtzee</b></font><br />
Used as: Division-II, Level 1:

<blockquote>
<table cellspacing="2" cellpadding="3">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">250</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">178 / 190  (93.68%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">157 / 178  (88.20%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Sleeve</b> for 248.84 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>This one is pretty straightforward. We can test selecting all
values between 1 and 6 on the dice, and then see how much this
would score. We then select the maximum of these scores. This
can be done with two nested for-loops, like this:</p>

<pre>
int max=0;
for(int value=1;value&lt;=6;value++) {
    int sum=0;
    for(int i=0;i&lt;5;i++)
        if (toss[i]==value)
          sum=sum+value;
    if (sum>max) max=sum;
}
</pre>


<font size="+2"><b>RectangularGrid</b></font><br />
Used as: Division-II, Level 2:

<blockquote>
<table cellspacing="2"  cellpadding="3">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">500</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">91 / 190  (47.89%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">72 / 91  (79.12%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>tomek</b> for 487.33 points</td></tr>
</table>
</blockquote>

Used as: Division-I, Level 1:

<blockquote>
<table cellspacing="2"  cellpadding="3">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">300</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">97 / 106  (91.51%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">93 / 97  (95.88%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yarin</b> for 298.92 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>There are several ways one can solve this problem; the difference between the solutions is basically the number of nested for-loops you have! You can write solutions with either 
4, 3, 2, 1 or no for-loops at all! Having 4 or 3 for-loops will be too slow though, as explained below.</p>

<p>
The most common solution is the one with 2 for loops, and it's probably the easiest to code as well. We loop over all possible sizes of the rectangles:
</p>

<pre>
for(int rect_width=1;rect_width&lt;=width;rect_width++)
    for(int rect_height=1;rect_height&lt;=height;rect_height++) {
        if (rect_width==rect_height) continue; // Don't count squares!
</pre>

<p>
If rect_width equals rect_height, this is a square, and we don't want to count those, so make sure we skip to the next step in the iteration (using the instruction continue for instance).
Now, we want to count how many rectangles of this size there are. One could do this by looping through all valid positions of one of the corners. For each such position, we have one rectangle:
</p>
<pre>
        for(int left=0;left&lt;=width-rect_width;left++)
            for(int top=0;top&lt;=height-rect_height;top++)
                count++;
</pre>            
<p>But this is just too slow (four nested for-loops), as we have to count each rectangle one by one, and as could be seen from the examples, there can be <i>many</i> rectangles, so we 
have to do it in a smarter way. The first observation is that the innermost loop (top) will iterate exactly height-rect_height+1 times, and each time we will increase count by one. 
So we can replace the last two lines above with
</p>
<pre>
        for(int left=0;left&lt;=width-rect_width;left++)
            count+=(height-rect_height+1);
</pre>
<p>
Now we have a total of three nested for-loops, which almost works. So let us
try to get rid of the left for-loop: This one iterates width-rect_width+1 times, each time increasing count with the same amount. Again, we can replace the last two lines with:
</p>
<pre>
        count+=(width-rect_width+1)*(height-rect_height+1);
</pre>
<p>
This is enough to get the program fast enough. But we can do it even faster!
We can't easily continue in the same way though, because of the if statement
and that the increase of count is dependent on the for-loop variable. The
version with one for-loop works like this: we count the number of rectangles (<i>including</i> squares) and then subtract the number of squares (using a for-loop for the latter). 
If we take the same four for-loops above (and ignore the square check)
and reorder them like this</p>

<pre>
for(int rect_width=1;rect_width&lt;=width;rect_width++)
    for(int left=0;left&lt;=width-rect_width;left++)
        for(int rect_height=1;rect_height&lt;=height;rect_height++)
            for(int top=0;top&lt;=height-rect_height;top++)
                count++;
</pre>

<p>
we can, by some careful inspection, see that the left loop will iterate
first 1 time (when rect_width is 1), then 2 times, then 3 times, etc up till
width. That is, the left loop will iterate 1+2+3+...+width = width*(width+1)/2 times (well known math formula). The third and fourth loop are the same, so the number 
of times the count++ will be executed is (width*(width+1)/2)*(height*(height+1)/2). Thus we have:
</p>

<pre>
rects = width*(width+1)*height*(height+1)/4; // Number of rectangles including squares
</pre>

<p>
Now we just have to subtract from this number, the number of squares. We can loop
through all sizes of the squares (from 1 to the minimum value of width and height) and
check how many places they can be on:
</p>
<pre>
for(int size=1;size&lt;=min(width,height);size++)
    squares+=(width-size+1)*(height-size+1);
</pre>
<p>
So we're now down to only one for-loop. We can get rid of that one as well
by using some more math formulas, which I won't explain though. The number
of squares can be calculated with this formula:
</p>
<pre>
min=min_of(width,height);
dif=max_of(width,height)-min;
squares=dif*min*(min+1)/2+min*(min+1)*(2*min+1)/6;
</pre>
<p>Check out the solution by <b>lars2520</b> in the practice room for
a really short implementation of this...</p>
     
<font size="+2"><b>BridgeCrossing</b></font><br />
Used as: Division-II, Level 3:

<blockquote>
<table cellspacing="2"  cellpadding="3">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1000</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">48 / 190  (25.26%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">9 / 48  (18.75%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>tomek</b> for 763.03 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>This is a problem which appears in many problem solving books, where you're
supposed to solve a specific case "manually" (ie, not with a computer program).
Writing a computer program so solve the general case if of course harder for
most people. Still, there are several different approaches that will work,
because the constraints (the maximum number of people) is so small, at most 6.</p>

<p>The hint in the problem tells us that the best solution will be for two
people two cross the bridge, one walk back, two cross, one walk back etc,
until everyone has crossed. One thing that should always be remembered is
that when the input is so low (always check the size of the input before you
start trying to solve the problem!), always consider whether the most simple
brute force solution would work. In this problem, I would consider this the
most naive of all brute force solutions, which uses the hint:
</p>

<pre>
Select any two people still on the start side, and make them cross.
Select any one people on the other side, and make him go back.
Repeat this procedure until everyone has crossed (using recursion)
</pre>

<p>
Before we start to code this, we should make a quick check if this will
be fast enough. We only check the worst case, ie when we have 6 people.
Selecting any two people among 6 can be done in 15 ways (since order doesn't
matter). Then we have two people on the other side, one of them (2 choices
possible) go back. Now we have 5 people on the start side. We repeat
the procedure: 2 of 5 cross (10 ways), 1 back (3 ways, since we have three
people on the other side), 2 of 4 cross (6 ways), 1 back (4 ways),
2 of 3 cross (3 ways), 1 back (5 ways), 2 of 2 cross (1 way) - and now everyone
will have crossed the bridge! To get the total number of ways we have
to check, we use the multiplication principle in combinatorics:
15*2*10*3*6*4*3*5*1 = 324,000, which is a small number for a computer.
The implementation can look like this: (note, we need a special case
if there is only one people to cross the bridge!)
</p>

<pre>
int best,n,side[6]; // side[x]=0 if on the start side, =1 if on the other side
vector&lt;int&gt; time;

void go(int tm, int left)
{
  for(int i=0;i&lt;n;i++)
    for(int j=i+1;j&lt;n;j++)
      if (side[i]==0 &amp;&amp; side[j]==0) {
        // i and j will cross
        side[i]=side[j]=1;
        int new_tm=tm+max_of(time[i],time[j]);
        if (left==2) {
          if (new_tm&amp;lt;best) best=new_tm;
        } else {
          for(int k=0;k&amp;lt;n;k++)
            // k will go back
            if (side[k]==1) {
              side[k]=0;
              go(new_tm+time[k],left-1);
              side[k]=1;
            }
        }
        side[i]=side[j]=0;
      }
}
</pre>

<p>
One way to improve this solution is to apply memoization. That is,
we solve the problem from each given <i>state</i> (ie, which side of the bridge everyone is one). The total number of states are 2<sup><i>n</i></sup> where <i>n</i> is the
number of people (one could argue that it's 2 times because you also need
to keep track on which side the flashlight currently is - but this is not
necessarily so, if you consider crossing and going back as one move). See
<b>tomeks</b> solution in the SRM for a nice implementation of this
using bitmasks. I will not elaborate on this any more because there is
another superior solution:
</p>

<p>It's obvious that we want the slowest people to cross the bridge
as little as possible, since that will affect the total time a lot.
It makes sense to let to two slowest (call them Y and Z) cross the bridge
at the same time. To do so, we need help by the two fastest (call them
A and B): Let A and B cross, make A go back, let Y and Z cross, make B go back.
We have then managed to get the two slowest over the bridge, and now
have two less to worry about. Actually, using this method alone
would work on all example cases (and is probably one reason that so
many failed system tests)!
However, assume that A is much faster than B (and thus everyone else, since
B is the second fastest). Then
it would make more sense to use A all the time. That is, A and Z cross,
A go back, A and Y cross, A go back etc. This is needed for the case {1,98,99,100}
for instance.</p>

<p>So do we just compare how well these two methods do and select the best? Not quite.
Consider the case {1,25,26,98,99,100}. Using method one will take 325 minutes,
and using method two will take 352 minutes. But the best solution takes only
302 minutes [(1,25) cross, 1 go back, (99,100) cross, 25 go back, (1,98) cross,
1 go back, (1,26) cross, 1 go back, (1,25) cross]! Here we mix the two methods
above, so we need to be more clever. What we do is to consider "How do we
get the two slowest people left across the bridge?" We try both methods,
and select the fastest method. Now we got two people less. We repeat
the check with the two now slowest people etc.
</p>

<p>The only thing that's missing now is when there are three or less
people left. We need a special case for since that won't require 4
crossing (both methods above use 4 crossings to get 2 people less
on the original side), but at most 3. These three cases can easily
be handled separately:</p>

<ul>
<li>1 or 2 people - just make them cross</li>
<li>3 people - let A and B cross, A go back, A and C cross.</li>
</ul>

<p>See my solution in the practice room for a short implementation
of this solution. Notice that this solution is very fast. The bottleneck
in the solution is the sorting of times in order (so we can find
who is fastest and slowest instantly), and as we all know, we can
sort pretty fast.</p>

<font size="+2"><b>Masterbrain</b></font><br />
Used as: Division-I, Level 2:

<blockquote>
<table cellspacing="2"  cellpadding="3">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">600</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">54 / 106  (50.94%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">51 / 54  (94.44%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>radeye</b> for 579.33 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>This problem is basically just Mastermind, except that the one who
makes the secret combination is allowed to lie with his response exactly
once. This sure makes the task of breaking the code harder for a human, but luckily
it doesn't really make solving the problem with a computer any harder!</p>

<p>
We begin by looping through all possible codes
(only 7<sup>4</sup> = 2401) - for instance using for nested for-loops
from 1 to 7 - and for each such code check if it's a possible code.
How do we know if the code can possibly be the secret code? <i>If</i>
it would be the correct code, the <i>correct</i> response from the codemaker
(ie if he does not lie) on the guesses we have made would match with
the responses we got in all except exactly one case. So, for each code,
we loop through all guesses, check what the proper reply from
the codemaker (if he does not lie) would be for this guess on the
code we're currently checking. If this match with the response
we got in all cases except one, this could be the secret code, so
then we increase a counter.
</p>

<p>To check the proper reply of a guess, we should count how many
digits are in the correct position (black pegs) and the incorrect
position (white pegs). Checking the number of black pegs is easy, loop through
all 4 positions and check if it's the same digit in both the code
and the guess. If this is not the case, we update how many unmatched
digits we have of each digit 1 to 7. For instance, if the code is
2432 and the guess is 4222, we have one black peg (the rightmost 2) and
one unmatched 2, 3 and 4 in the code and two unmatched 2:s and one
unmatched 4 in the guess. By summing the minimum of these unmatched
values for the result and the code, we get the number of white pegs:
that is min(0,0)+min(1,2)+min(1,0)+min(1,1)+min(0,0)+min(0,0)+min(0,0) = 2 white pegs.
</p>

<p>A more common method to check white pegs is probably to loop
over all pair of positions and check if they match. This requires
that positions that have been matched are marked (so we don't count
them more than once), plus it's slower since we have two nested loops.</p>


<font size="+2"><b>Roundabout</b></font><br />
Used as: Division-I, Level 3:

<blockquote>
<table cellspacing="2"  cellpadding="3">
<tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">800</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">23 / 106  (21.70%) </td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">6 / 23  (26.09%)</td></tr>
<tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>cnettel</b> for 460.63 points</td></tr>
</table>
</blockquote>

<p>Reference implementation: <b>Yarin</b> <i>(practice room)</i></p>

<h4>Implementation</h4>

<p>This is the first time in a SRM I've seen a Divison-I, Level 3 problem worth only 800 points. The low
score was quite misleading though, as can seen by the submission and acceptance rate
as well as the highest score. The reason the problem was only worth 800 points
was most likely because of the nature of the problem: simulation. Or, if you want, do what the problem states <i>exactly</i>, don't try to be clever. I've said it before. Sadly, 
I didn't listen to my own advice this time. Or maybe it was just that the problem was harder to interpret than most other simulation problems on TopCoder.</p>

<p>The first thing we need to do is to find a suitable datastructure to represent
the state of the roundabout at a given time. We don't need to keep track of
which car is which once it's in the roundabout; we only need to know where it's heading
and it's location. Thus a string of 4 characters can describe the actual roundabout.
Also belonging to the state is the queue of cars at each direction, waiting to enter the roundabout. One can use a proper queue datastructure for each direction, but it's probably
easier to just use an array of strings, one element in the array for each direction, and the first character in each string the car which is in the front of that queue.</p>

<p>Next is the matter of how long we should simulate. Obviously until no car is left, but when is that? We can't just check that the roundabout is empty and that no car is waiting, 
because maybe some car will enter the queues (and thus the roundabout) later! One easy way is to first count the total number of cars that we should simulate (the total number 
of letters in north, east, south, west) and for every car that leaves the roundabout we decrease this number. Once it's zero, we're done. Even easier is to simulate sufficiently 
many steps, but only update the return value once something actually happens (ie a car leaves the roundabout). During challenge phase, I saw some really horrendous 
while-loop termination condition, involving disjunctions of 8 or more expressions, and some of the solutions that failed was due to incorrect terminating conditions in the while-loop.</p>

<p>Now to the actual simulation: At the beginning of each time step, we check in the four directions whether or not a new car arrives. If so, we add this car to the end of the queue 
for this direction. We then check if there are cars waiting from all four directions at the same time. As mentioned in the problem statement, this is a special case and must be considered below.</p>

<p>
Before updating the positions of the cars in the roundabout, we should make a
backup copy of the state. This is crucial, as all cars act on how the situation
was in the previous second. If we start writing to state variable at the
same time as we read it, some car (because of the circular structure) will
inevitably act on the cars position in <i>this</i> second instead of the previous one.
</p>

<p>For each position in the roundabout, we should now determine which car, if any, should occupy the position. If there was a car the previous second in the previous position (that is, if the current position is east, the previous is south etc) in the roundabout, that car will always occupy the current position (a car never stops in the roundabout!) <i>unless</i> it exited the roundabout in the previous position - in that case it's simply removed. Otherwise this position is free to be occupied by the first car in the
corresponding queue <i>if</i> no car is about to the enter the roundabout from the previous position (here, as always, we should check the backup state, not the one we're writing to). Here we have the special case - if cars try to enter from all four directions at once, the car that comes from the north will have precedence.
</p>

<p>And that's basically it. The error that I, and several others, made was that
if a car was about to exit the roundabout, a car that was trying to enter the
roundabout in the next position was allowed to do so, even though this is not allowed.
</p>

                            
                        
                      

                        <img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" />
                        By&#160;<a href="/tc?module=MemberProfile&amp;cr=269554"><strong>Yarin</strong></a><br />
                        <div class="smallText"><em>TopCoder Member</em></div><br clear="all" />
                        

                    </td>
                </tr>
            </table>
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
