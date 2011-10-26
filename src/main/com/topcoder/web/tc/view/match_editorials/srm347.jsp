<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
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
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10671">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506237" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 347</span><br>Tuesday, May 1, 2007
<br><br>



<h2>Match summary</h2> 

<p>
This transport-themed SRM attracted a good turnout of 1153 competitors.  Both divisions were characterized by some low success rates, and an approachable but challenging hard (involving bitmasks in both cases) which only had two successful submissions.
<br />
<br />

Division 2 was topped by the two coders who managed to crack the hard problem.  Long-time member <tc-webtag:handle coderId="10003664" context="algorithm"/> won the division, followed by <tc-webtag:handle coderId="13319772" context="algorithm"/>.  First-timer <tc-webtag:handle coderId="22680722" context="algorithm"/> had a very impressive debut with good times on the easy, medium and even a couple of challenges - an excellent achievement for a first contest!
<br /><br />

In Division 1, <tc-webtag:handle coderId="310333" context="algorithm"/> and <tc-webtag:handle coderId="7390224" context="algorithm"/> managed to solve the hard, but a failed medium and a lack of challenges surprisingly left <tc-webtag:handle coderId="7390224" context="algorithm"/> in 9th place.  <tc-webtag:handle coderId="310333" context="algorithm"/> won the SRM by supplementing his 3 solved problems with 6 successful challenges.  He had a very comfortable lead on <tc-webtag:handle coderId="2058177" context="algorithm"/> and <tc-webtag:handle coderId="10574855" context="algorithm"/>, each of whom solved the easy, medium and had 5 successful challenges.
<br /><br />
</p>
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7652&amp;rd=10671" name="7652">CarBuyer</a></b> </font> <A href="Javascript:openProblemRating(7652)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506237" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      515 / 570 (90.35%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      416 / 515 (80.78%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>circuit</b> for 248.45 points (2 mins 14 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      193.49 (for 416 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
You were asked to find the most economical car over <b>years</b> years.  The formula for the total cost of a car over that many years is simply:<br />
<b>fuelPrice</b> * <b>annualDistance</b> * <b>years</b> / <b>fuelEfficiency</b> <i>(fuel cost)</i><br />
+ <b>tax</b> * <b>years</b> <i>(tax cost)</i><br />
+ <b>purchaseCost</b> <i>(purchase cost)</i><br />
Iterate through all the cars, work out the total cost using the formula, and return the minimum.

<pre>
<font color="blue">double</font> dRet = <font color="blue">double</font>.MaxValue;
<font color="blue">for</font> (<font color="blue">int</font> i = 0; i < cars.Length; i++) {
    <font color="blue">string</font>[] s = cars[i].Split(' ');
    dRet = Math.Min(dRet, 
        fuelPrice * annualDistance * years / <font color="blue">double</font>.Parse(s[2])
      + <font color="blue">int</font>.Parse(s[1]) * years
      + <font color="blue">int</font>.Parse(s[0]));
}
<font color="blue">return</font> dRet;</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7741&amp;rd=10671" name="7741">Aircraft</a></b> </font> <A href="Javascript:openProblemRating(7741)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506237" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      251 / 570 (44.04%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      29 / 251 (11.55%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>MIPT_Alex</b> for 358.82 points (19 mins 30 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      241.91 (for 29 correct submissions) 
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
      455 / 527 (86.34%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      152 / 455 (33.41%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>sluga</b> for 236.55 points (6 mins 51 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      165.53 (for 152 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
There were several approaches to this problem, but all of them benefited from some basic transformations which simplified the problem significantly.
<ul><li>Move the position of the first aircraft to the origin by subtracting <b>p1</b> from both positions.</li>
<li>Consider only the velocities relative to the first aircraft by subtracting <b>v1</b> from both velocity vectors.</li></ul>
We have now simplified the problem to consider how close an aircraft at <b>p2</b> moving with velocity <b>v2</b> will pass to the origin.  Since we are only dealing with a single position and velocity from this point, I will merely refer to them as <b>v</b> and <b>p</b>.
<br /><br />

I've seen 3 basic approaches to solving this, which I'll outline here:<br /><br />

<b>Search for the closest point by using a ternary search</b><br />

The distance between the two aircraft is <a href="http://en.wikipedia.org/wiki/Unimodal_function">unimodal</a> over time, so it makes the problem a prime candidate for a ternary search.  A ternary search is a great way to find a minimum or maximum of a function that has only one turning point.
<br />
<br />

Start with a full range of potential times that the aircraft would be nearest (Minimum 0, maximum 10<sup>9</sup> seem like good values).  Iterate a suitable number of times to find the time <b>x</b> at which the aircraft were closest.  Now we're basically done, right?
<br /><br />

Wrong.  You'll have to calculate the resulting distance at time <b>x</b> using imprecise doubles, and you'll be working with a small error.  Considering that there are test cases where the aircraft fly to within 1e-11 of the "near-miss" threshold, working with doubles was very unreliable and could easily have failed on cases tailored to catch out this approach.  Thankfully for contestants who used this method (including myself), some of the real killer cases were absent in the system tests and some technically incorrect solutions ended up passing.
<br />
<br />

<b>Solve it using algebra</b><br />

The distance (squared) between the aircraft at time <b>x</b> is (<b>p</b>[0]+<b>x</b>*<b>v</b>[0])<sup><b>2</b></sup> + (<b>p</b>[1]+<b>x</b>*<b>v</b>[1])<sup><b>2</b></sup> + (<b>p</b>[2]+<b>x</b>*<b>v</b>[2])<sup><b>2</b></sup>.<br />
We want to know if this expression is ever less than or equal to <b>R</b><sup>2</sup>.<br />
Expressing this inequality in the form <b>Ax</b><sup>2</sup> + <b>Bx</b> + <b>C</b> &le; 0 gives us:<br />
<b>A</b>=<b>v</b>[0]<sup>2</sup> + <b>v</b>[1]<sup>2</sup> + <b>v</b>[2]<sup>2</sup><br />
<b>B</b>=<b>2</b>*(<b>p</b>[0]*<b>v</b>[0] + <b>p</b>[1]*<b>v</b>[1] + <b>p</b>[2]*<b>v</b>[2])<br />
<b>C</b>=<b>p</b>[0]<sup>2</sup> + <b>p</b>[1]<sup>2</sup> + <b>p</b>[2]<sup>2</sup>
<br /><br />

At this point you will need to know the properties of quadratic graphs to evaluate if there are any non-negative real roots.  As <a href="http://www.topcoder.com/stat?c=problem_solution&rm=264593&rd=10671&pm=7741&cr=8357090">misof's solution</a> very neatly checked with the following 4 lines:

<pre>
    if (C <= R*R) return "YES";
    if (A == 0) return "NO";
    if (B >= 0) return "NO";
    if (4*A*C - B*B <= R*R*4*A) return "YES";
</pre>

This approach avoided the precision errors introduced by doubles, but care had to be taken to avoid overflows.  In the most extreme cases, <b>B</b> could exceed 2.4 billion, requiring a 64-bit data type or unsigned 32-bit data type to store it.
<br /><br />

<b>Solve it using vector geometry</b><br />

Googling for "<a href="http://www.google.com/search?q=line+point+distance+topcoder" target="_blank">line point distance topcoder</a>" gave <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=geometry1">this</a> excellent tutorial by <tc-webtag:handle coderId="159052" context="algorithm"/> as the first hit.  Halfway down the article you'll find the exact code required to evaluate the minimum distance from a vector segment to a point in space.  It would be cheating to use this code, and it is only in two dimensional space, but rewriting that code and adapting it to three dimensions would work perfectly to solve the problem quickly and easily (with the same overflow proviso as the algebra method above).
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7633&amp;rd=10671" name="7633">TaxiManager</a></b> </font> <A href="Javascript:openProblemRating(7633)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506237" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      9 / 570 (1.58%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 9 (22.22%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>leiz</b> for 588.16 points (28 mins 21 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      549.70 (for 2 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This excellent problem tested a wide range of algorithms and abilities.  Shortest-path, bitmasks, recursion with memoization or DP.  It was really a collection of fairly straightforward subproblems, making it approachable but challenging.
<br /><br />

Here are the subproblems you needed to solve:
<ul><li>What is the shortest point between locations <b>i</b> and <b>j</b>?</li>
<li>How long will it take to deliver a given subset of customers, starting from <b>i</b> and ending at <b>0</b>?</li>
<li>What is the best way to distribute the load between two cars?</li></ul>

If you have any ambition of doing well in programming contests, make the Floyd-Warshall algorithm second nature.  If you've got a weighted graph with a small number (less than 100) of nodes and you want to store a matrix of shortest paths between any pair of points, Floyd-Warshall is your friend for ease of implementation.  Set all non-existent paths to a very large integer, and run the following line of code:

<pre>
    <font color="blue">for</font> (<font color="blue">int</font> i=0;i&lt;N;i++) <font color="blue">for</font> (<font color="blue">int</font> j=0;j&lt;N;j++) <font color="blue">for</font> (<font color="blue">int</font> k=0;k&lt;N;k++) {
        dis[j,k]=<font color="blue">min</font>(dis[j,k],dis[j,i]+dis[i,k]);
    }
</pre>

I'm simplifying <i>slightly</i> --  in other problems you'll have to handle missing paths and negative weight paths differently in the inner loop --but for most "roads-between-points" problems like this it's really that easy.
<br />
<br />

A look at the problem constraints (max 12 customers) suggests that we can use an approach where we represent a set of customers as a <i>bitmask</i>, basically an integer where each binary digit corresponds to a customer.  If you haven't used bitmasks, there's an excellent Topcoder tutorial on them <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=bitManipulation">here</a>.  Using a bitmask <b>customers</b> to represent which customers must still be dropped off, we can define the following recursive relationship (the actual implementation will need memoization to avoid timing out):

<pre>
    <font color="blue">int</font> HowLong(<font color="blue">int</font> customers, <font color="blue">int</font> loc) {
        <font color="green">// Put in memoization, if we've solved this before, return that value</font>
        <font color="blue">if</font> customers==0 <font color="blue">return</font> dis[loc,0]; <font color="green">// We're done, go home</font>
        <font color="blue">int</font> best=INF;
        <font color="blue">for</font> each customer in customers {
            best=min(best,
                dis[loc,customer.pickup]
               +dis[customer.pickup,customer.dropoff]
               +HowLong(customers-customer,customer.dropoff));
        }
        <font color="green">// Memoize this result</font>
        <font color="blue">return</font> best;
    }
</pre>

We're almost done!  As an added twist, the problem required you to split the load between 2 cars.  Now that we're using bitmasks to represent subsets of customers, this is now easy for us to do.  Just iterate through every possible set of customers that car A can carry, assign the rest to car B, and the total time taken will be the slower of the 2 cars.

<pre>
    <font color="blue">int</font> N = customers.Count;
    <font color="blue">int</font> NN=1&lt;&lt;N;
    <font color="blue">int</font> ret=INF;
    <font color="blue">for</font> (<font color="blue">int</font> i=0;i&lt;NN;i++) {
        <font color="green">// Car A is carrying customer set i.</font>
        <font color="green">// Car B is carrying customer set NN-1-i.</font>
        ret=min(ret,max(HowLong(i,0),HowLong(NN-1-i,0)));
    }
    <font color="blue">return</font> ret;
</pre>

That's all there is to it.  With these 3 really simple steps, you've solved the entire problem.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7584&amp;rd=10671" name="7584">FlightScheduler</a></b>
</font>
<A href="Javascript:openProblemRating(7584)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506237" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      307 / 527 (58.25%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      109 / 307 (35.50%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>abikbaev</b> for 430.67 points (6 mins 4 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      249.83 (for 109 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
We are asked to find the least fuel that can cover a distance of <b>distance</b>, and this consists of several steps:
<ul><li>Change the form of the Breguet range equation to express fuel in terms of distance</li>
<li>Work out an optimal strategy of how to space <b>N</b> stops</li>
<li>Work out  the optimal number of stops</li>
</ul>

Step 1 requires some algebra.  Note that <b>takeoffMass</b>=<b>emptyMass</b>+<b>flightFuel</b>.  Changing the terms around we get:<br />
<b>flightFuel</b>=<b>emptyMass</b>*(e<sup><b>R</b>/<b>K</b></sup>-1)
<br /><br />

Step 2 is interesting.  Most contestants who passed this problem followed their gut feel that the stops must be evenly spaced in order to use fuel most efficiently.  For those who are interested, here is an explanation as to <i>why</i> this is the optimal strategy.<br />
Consider two consecutive flights covering a total distance of <b>d</b>.  The flights have distances of <b>x</b> and <b>d-x</b>.<br />
<b>totalFuel</b>=<b>2</b>*<b>takeoffFuel</b> + <b>emptyMass</b>*(e<sup><b>x/K</b></sup>+e<sup><b>(d-x)/K</b></sup>)<br />
Our aim is to minimize this function, so we remove constants which won't alter its shape:<br />
<b>totalFuel</b>=e<sup><b>x</b></sup>+e<sup><b>d-x</b></sup><br />
To minimize this we need to set its derivative to 0.<br />
e<sup><b>x</b></sup>+(-1)*e<sup><b>d-x</b></sup>=0<br />
e<sup><b>x</b></sup>=e<sup><b>d-x</b></sup><br />
<b>x</b>=<b>d-x</b><br />
<b>2x</b>=<b>d</b><br />
<b>x</b>=<b>d/2</b>
<br /><br />

Therefore we can minimize the fuel on any two consecutive flights by planning a stop dividing the flight distance exactly in half.  We can use this fact to show that any flight plan with unequal flights can be improved by making all the flights the same length.
<br /><br />

Step 3 is where the majority of the submitted solutions failed.  How many stops are required to minimize fuel use?  The vast majority of solutions searched from 0 stops up to as many stops as they could calculate in the given 2 second time limit, which seemed to be between 10 and 20 million, depending on implementation.  However, there was a test case which required in the region of 63 million stops to use a minimal amount of fuel (200000,1,200000,1), and all of those solutions didn't check high enough, and failed accordingly.  Astute contestants who noticed this extreme case cashed in with plenty of challenges, with <tc-webtag:handle coderId="20314940" context="algorithm"/> leading the pack with 9 successful challenges.
<br /><br />

Various optimizations could alter algorithms to search high enough, but the safest and most reliable was a ternary search from 0 stops to some sufficiently high number of stops.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7541&amp;rd=10671" name="7541">MetroNetwork</a></b> </font> <A href="Javascript:openProblemRating(7541)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506237" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      8 / 527 (1.52%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      2 / 8 (25.00%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gawry</b> for 453.43 points (44 mins 46 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      441.51 (for 2 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem was inspired by a particularly bad day's travel on the London Underground.  In fact, residents of London who study example 4 closely may notice that they are mapped on real travel times around Central London, from Gloucester Road to Kings Cross St Pancras in particular!
<br /><br />

There were several challenges to overcome in solving this problem.  The layout of the input data structured into lines and times made for some interesting parsing code.  Additionally, the state at any given time was hard to define clearly.  You had a position, you had certain <i>knowledge</i> about the lines (a bitmask seemed suitable), and then there was also the <i>condition</i> of the known lines (another bitmask?).
<br /><br />

The relationship between the states was also very unclear.  Different states had different types of relationships.  If I travelled from position <b>a</b> to position <b>b</b> without gaining any knowledge about the lines, and my travel time was <b>traveltime</b>[a,b], how do I express that as a relationship between those two states?
<br /><br />

Well, it's difficult to define problems like this, which makes me love recursion.  Build a recursive relationship, ensure that it will never call the same state twice, and we're done.  We'll need an important helper function, but we'll get to that afterwards.
<br />
<br />

<i>(In the next function, <b>known</b> and <b>delayed</b> are bitmasks)</i><br />
If we're at position <b>pos</b>, we know the state of <b>known</b> lines, and <b>delayed</b> lines are known to be delayed, our estimated time can be defined by the following recursive relationships:
<br /><br />

<b>Pos is destination</b><br />
If <b>pos</b> is <b>destination</b>, we have arrived and can return 0.
<br /><br />

<b>Pos is on a line that is not part of known</b><br />
There are two options.  Either <b>line</b> is delayed, or it is not.  The probabilities of these two options are <b>0.01*p</b> and <b>0.01*(100-p)</b> respectively, so we return the weighted average of the estimated times from those two states.<br />
Return the sum of:
<ul><li>0.01*p*estTime(pos,known+line,delayed+line)</li>
<li>0.01*(100-p)*estTime(pos,known+line,delayed)</li></ul>

<b>All the lines at pos are in known</b><br />
From this point, we have the option to travel to any other point on the rail network that is connected to this position with lines that are in <b>known</b>.  However, we only want to consider <i>useful</i> trips.  A trip is <i>useful</i> to us if it does one of 2 things:
<ul><li>Gets us to our destination</li>
<li>Takes us to a line which was previously unknown</li></ul>
We return the minimum of all the estimated times of the <i>useful</i> states we can move to.
<pre>
double best=INF;
for (each i in positions) {
    if (i is connected to pos via known) {
        if (i is destination, or i is on an unknown line) {
            best=min(best,travelTime(pos,i,delayed & ~known)+estTime(i,known,delayed));
        }
    }
}
return best;</pre>

We simply return the minimum estimated time of all <i>useful</i> and connected destinations.
<br /><br />

You'll have noticed the <b>travelTime</b> helper function I referred to earlier.  It is important to pre-calculate all travel times between points based on different states of delay.  This is very easy to do by iterating over every <b>delayed</b> bitmask, generating the path lengths along each line, and then using Floyd-Warshall to fill in the shortest paths.  Checking every combination of <b>delayed</b> and <b>known</b> generates too many sets of data, and it's unnecessary.  By calling the <b>travelTime</b> function with <b>delayed & ~known</b> we simple ensure that all unknown lines are counted as delayed, and we get a worst-case for the travel time between two points.
<br /><br />

Calling <b>estTime(start,0,0)</b> returns us the final answer.  It almost seems like cheating, considering the complexity of the question.
<br /><br />
</p>



<div class="authorPhoto">
    <img src="/i/m/HiltonLange_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10428762" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
