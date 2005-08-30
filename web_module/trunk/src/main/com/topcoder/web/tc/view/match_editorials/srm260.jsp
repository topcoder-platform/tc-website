<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statisics</title>

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

<%--
<div align="right"><tc-webtag:forumLink forumID="505057" message="Discuss this editorial" /></div>
--%>

<span class="bigTitle">Match summary</span>

<p>
SRM 260 was the most popular single round match in TopCoder history. Coders were gearing up for round 3 of the TCO and round 1 of the Google Code Jam as there was a record setting 807 registrants. This shattered the previous best of 700 registrants in SRM 100, the end of the weekly money match era.
</p>
<p>
Division 1 coders were not upset to find a difficult 1100 point problem as they knew that it would help them stay in shape for the tournaments ahead. But the difficulty of the 1100 as well as a tricky 500 point problem left only two coders with three successful submissions, <b>Petr</b> with the win and <b>kalinov</b> close behind.
</p>
<p>
Division 2 was topped by two newcomers, <b>tywok</b> and <b>BukTop</b>, both of whom not only solved all three problems but also made at least one successful challenge. We will welcome them and the remaining ten coders who solved all three problems into division 1.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4746&amp;rd=7994" name="4746">IsingModel</a></b>
</font>
<A href="Javascript:openProblemRating(4746)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      393 / 426 (92.25%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      366 / 393 (93.13%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>agray</b> for 247.46 points (2 mins 53 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      208.16 (for 366 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Named after its discover, Dr. Ernst Ising, the Ising model has been successful at describing certain properties of ferromagnetism, including calculation of the <A Href="http://scienceworld.wolfram.com/physics/CurieTemperature.html">Curie temperature</A>. But even without knowing about magnetism this problem doesn't pose much of a threat to solve.
</p>
<p>
Simply loop through each of the elements in the grid and check it against its right and bottom neighbors to see if the pair adds or subtracts from the total energy. By checking against just these two neighbors you are sure that you don't count any neighbor pair twice, the only difficulty is making sure that you don't go off the edge of the grid.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4766&amp;rd=7994" name="4766">GridPointsOnCircle</a></b>
</font>
<A href="Javascript:openProblemRating(4766)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      344 / 426 (80.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      167 / 344 (48.55%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>arnstein</b> for 482.15 points (5 mins 30 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      347.35 (for 167 correct submissions)
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
      324 / 328 (98.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      287 / 324 (88.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>vip1711</b> for 247.99 points (2 mins 33 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      210.56 (for 287 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
At first this problem appears to be difficult, since <b>rSquare</b> can be up to 2,000,000,000, the radius of the circle can be as large as 44,721.  This is far too many to try all possible (x,y) pairs where x and y are both less than the radius. Thus we will have to use a more clever approach.
</p>
<p>
One trick that can be used on many geometrical problems is to use brute force on one dimension and then use mathematics to calculate for the other dimension. That method can be applied to this problem. Iterate from -radius to radius to find the x-coordinate of the points and then use the Pythagorean Theorem to figure out what the corresponding y value has to be. Doing this we get:
</p>
<div align="center">
<pre>
y<sup>2</sup> = r<sup>2</sup> - x<sup>2</sup>
</pre>
</div>
<p>
Now we need to know if y is an integer. One way to do this is to take the floating point square root of y<sup>2</sup> and cast it to the nearest integer. If this integer squares to the y<sup>2</sup> then we know that y is an integer and we can increment the count (twice if y<sup>2</sup> &gt; 0 because it has both a positive and negative root).
</p>
<p>
If you don't feel comfortable using floating points on such a problem, then an alternative is to keep a table of all the squares less than or equal to <b>rSquare</b> and then do a lookup to see if y<sup>2</sup> is in the table. The only catch is that the lookup has to be pretty fast, which can be done by using a binary search, a balanced tree, or hashing. But be sure to watch out for those nasty fencepost and overflow errors.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4749&amp;rd=7994" name="4749">RollingBlock</a></b>
</font>
<A href="Javascript:openProblemRating(4749)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      56 / 426 (13.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      14 / 56 (25.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>BukTop</b> for 640.47 points (24 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      494.81 (for 14 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Even though there may be many paths to get from the start to the target, there aren't that many intermediate configurations possible. The cubiod can be in only one of three positions: upright, lying horizontally, or lying vertically. And for each of these positions, the middle cube has to be over one of the chessboard squares. So we can represent the configuration as the triple (x,y,position) where (x,y) is the square the middle cube is above.
</p>
<p>
Since there are only 3*100*100 configurations, we can do a breadth first search to find the shortest path to the target. Begin in the start configuration and add each new configuration reachable in one move to a queue. Continue this process until you get to the target configuration or until the queue is depleted.
</p>

<p>
The difficult part is coding all of the moves. It turns out that there are twelve possible ways to move, in the four cardinal directions from each of the three different positions. Coding each of the twelve cases separately is tedious, but not much can be done to avoid it. Care must be taken that each movement is coded correctly, and that the block doesn't move outside of the boundary of the chessboard. The movements can be coded in arrays to make implementation particularly simple (but be warned that constructing the arrays took a considerable amount of time): 
</p>

<pre>
int dist[100][100][3];

int dx[3][4]=       {{2,-2,0,0},{1,-1,0,0},{0,0,2,-2}}, <font color="blue">//change in x-coordinate</font>
    dy[3][4]=       {{0,0,2,-2},{0,0,2,-2},{1,-1,0,0}}, <font color="blue">//change in y-coordinate</font>
    dposition[3][4]={ {2,2,1,1},{1,1,0,0},{2,2,0,0}};   <font color="blue">//replacement for position</font>

    <font color="blue">//code to move</font>
    for(int i=0;i&lt;4;i++){
      int next_x=x+dx[position][i],
          next_y=y+dy[position][i],
          next_position=dposition[position][i];
      if(is_a_valid_state(next_x,next_y,next_position) &amp;&amp; dist[next_x][next_y][next_position]==0){
        dist[next_x][next_y][next_position]=dist[x][y][position]+1;
        queue.push(configuration(next_x,next_y,next_position));
      }
    }
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4765&amp;rd=7994" name="4765">SlowDigitalClock</a></b>
</font>
<A href="Javascript:openProblemRating(4765)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
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
      197 / 328 (60.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      91 / 197 (46.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>vip1711</b> for 421.16 points (12 mins 47 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      259.93 (for 91 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This is the kind of problem that coders fear. Immediately they see that they have to manipulate times, the most confusing quantity. Problems involving times usually involve intricate conversions between base 60, base 24, and base 365, and sometimes even involve the number 12 somewhere to make them more complex. This problem, however, was rather unique among time problems.
</p>
<p>
The main idea behind solving this problem is a simple one. Just simulate what happens with the wall clock and a correct clock and find out when they agree. Each clock can be represented by either a triple (hours, minutes, seconds) or as just an integer of how many seconds have elapsed since midnight on that clock. To make the simulation faster, instead of incrementing the clock each second, we can calculate when the next <i>Event</i> will happen. Here an <i>Event</i> is when either one of the clocks changes it's minute display and each <i>Event</i> contains the time of both clocks. The next <i>Event</i> can be easily calculated if from the number of seconds each clock has used in the current minute, and by using <i>Events</i> increases the speed of the program by a factor of 60.

</p>
<p>
Determining if the display on the wall clock is the same as the correct clock isn't too difficult. Compare the first digit of the wall clock's hour to the last digit of the correct clock's minute. Here the comparison should be to test if flipping one over produces the other. Then do the comparison on the second digit of the wall clock's hour with the first digit of the correct clock's minute. Likewise compare the hour of the correct clock to the minutes on the wall clock.
</p>
<p>
The last part of the implementation is the most difficult. When do we give up looking for a match? Some iterated until right before the two seconds were up. Some chose a large number and iterated that many times. Both of these methods work, but how can we be more exact? To answer that we'll need to take a closer look at what is going on. A simple test to determine if we have simulated enough is on each <i>Event</i> determine if we have seen a previous <i>Event</i> with both clocks at the same time as the current <i>Event</i>. This alone is not enough because there can be simply too many <i>Events</i> to check against each of them, but luckily we don't have to. If we know one <i>Event</i> then we can, in theory, calculate the previous <i>Event</i> and it is unique. This means that if we ever simulate the same two <i>Events</i> then either we must have simulated both of the previous <i>Events</i> or else the first time we simulated the <i>Event</i> it had no previous <i>Event</i>. The only <i>Event</i> without a previous <i>Event</i> is when both clocks are in their original configuration, so we can stop whenever we come back to that configuration.
</p>

<p>
The above is all that is needed to solve the problem, but how can we be sure that it will still run in time? It turns out there is a simple line of reasoning to conclude that it will never take too long. Look at the clocks after exactly <b>secsPerMinute</b> days have passed in real time. Since an exact amount of days have passed, the first clock should be back at its original configuration. Since <b>secsPerMinute</b> days have passed in real time, exactly 60 days have passed according to the wall clock, so it should also be back in its original configuration. This means that there could have been at most 1000*24*60 <i>Events</i> triggered by the correct clock, which is few enough for the simulation to end in plenty of time.
</p>

<p>
Finally, of special note was <b>HardCoder</b>'s performance during the challenge phase. Although his solution failed the system tests, he was able to get 5 successful challenges. Of those 5 challenges, 4 were on the 500 point problem and, even more amazing, each with a different test case. With the 250 points he gained during the challenge phase, the first time red was able to hang onto his color.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4750&amp;rd=7994" name="4750">FrogAndFly</a></b>
</font>
<A href="Javascript:openProblemRating(4750)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br />
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1100
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      5 / 328 (1.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      3 / 5 (60.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kalinov</b> for 670.15 points (26 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      620.64 (for 3 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This frog is going to have to work hard to get its dinner tonight. Although the graphic in the statement looks confusing and that the fly's window can be a polygon seems to make it complex, this problem can be split up into three parts, each of which is doable. The only downside is that we have to use some calculus to get the right probability.
</p>
<div align="center"><img border="0" alt="" src="/i/srm/srm260_1.png" /><img border="0" alt="" src="/i/srm/srm260_2.png" /></div>
<p>
First lets consider a simplified problem. If we know exactly where the frog is, then what is the probability that it sees the fly? If you look at the sideways view, the wall only blocks part of the frog's vision. More precisely, the wall blocks everything below the light green line of sight. If the frog is at height y<sub>o</sub> and the lowest height that he can see on the far building is y, then using some high school algebra to find the equation of the light green line of sight and use that to determine y. Doing the computation yields:
</p>
<div align="center">
<pre>
y = y<sub>o</sub> + (y<sub>o</sub>-hwall)*(dfrog+dfly)/dfrog
</pre>
</div>
<p>
If we consider the frog's view, then the window will look something like figure (a) above. The visible portion of the window is light blue and the red wall is covering up everything beneath the horizontal line at y. The probability that the fly is visible is equal to the area of the visible portion of the window divided by the total area of the window. Notice how this probability does not depend on the x-coordinate of the frog, because the wall does not restrict vision sideways. This is why the input did not need to give the width of the frog's window. Also notice how the visible portion of the window is a convex polygon. This will always be the case if we consider the empty set to be a convex polygon. All that is needed to find the polygon is to keep points from the original window that are at or above the horizontal line and create new vertices where the sides of the original window intersect the line. Once this is done, the first part of the solution is complete.
</p>
<p>
The second part of the solution is actually finding the probability. This can be done with a fairly standard algorithm described in detail in TopCoder's <a href="/tc?module=Static&amp;d1=tutorials&amp;d2=geometry1#polygon_area">Educational Content</a>. I fully recommend spending some time reading through all of those articles; they can come in very handy during a match. This finds the probability that the frog sees the fly given that the frog is at a height of y.
</p>
<p>
The final piece of the puzzle is where the calculus comes in. Define the function: P(y) = the probability that the fly is visible if the frog is at a height of y. It's not a coincidence that the first two parts of the solution calculated exactly that. Now the final answer will be the integral of P(y) from <b>ylow</b> to <b>yhigh</b> divided by the height of the window. Why this integral actually gives the probability ultimately relies on the mean value theorem, but another way to see why it works closely follows a method to compute the integral: Riemann sums. Pretend that the frog's window was cut into many horizontal strips each one with the height &#948;y. Since the strip is small, if the frog is on the strip with the lower y-coordinate of y<sub>i</sub> then P(y) will be very close to P(y<sub>i</sub>); mathematicians would say this is because P is a continuous function. We know that the probability that the frog is on this particular strip is &#948;y/(<b>yhigh</b>-<b>ylow</b>) and the probability that the frog sees the fly is about P(y) for some y on the strip. Thus the total probability across all of the strips is about:
</p>
<div align="center">
<pre>
&#931; P(y) * &#948;y
</pre>
</div>
<p>
As the strips tend to a height of zero this expression becomes exactly the integral in question. But since there is a two second time limit to solve the problem we must be content with an approximation. Perhaps the most important part of making the approximation correct is what point y we choose for each strip. A decent choice is the midpoint, y<sub>i</sub>+&#948;y/2. This is enough to solve the problem but a few ways to improve upon this method are interesting to know. Choosing how best to do calculations like this is under the domain of numerical integration. Quite a few methods numerical integration methods are simple to understand: the trapezoid method averages P(y<sub>i</sub>) and P(y<sub>i</sub>+dy); and Simpson's rule takes a weighted average of P(y<sub>i</sub>), P(y<sub>i</sub>+dy/2), and P(y<sub>i</sub>+dy). Using Simpson's rule you only need to create about 10,000 strips.
</p>
<p>
Some coders noticed that there is a way to calculate the integral exactly, without using numerical integration. It turns out that the function P is piecewise quadratic with the pieces being split at critical points. In figure (b) these points are indicated visually by the light green horizontal lines which pass through some vertex. If each strip on the frog's window was defined as the interval where the frog sees the top of the wall laying between a fixed pair of these horizontal lines, then P will be a quadratic function of y. A formula for P in this interval can be calculated knowing the area of the window above the top horizontal line in the pair and using the fact that the area of the window under it is a trapezoid. This explicit formula can be used for the integration, or alternatively you can use Simpson's rule on this much larger strip, since Simpson's rule is exact for up to cubic polynomials.
</p>

<p>
<img src="/i/m/Ryan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="284007" context="algorithm"/><br />
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
