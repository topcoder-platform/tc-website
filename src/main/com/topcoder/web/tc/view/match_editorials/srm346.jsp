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
    <A href="/stat?c=round_overview&er=5&rd=10670">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506236" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 346</span><br>Tuesday, April 24, 2007
<br><br>



<h2>Match summary</h2> 

<p>
Tuesday's night coding was no easy task for coders of either division. They faced problem sets with especially tricky medium problems, causing many solutions
to fail and making the challenge phase particularly active.
<br />
<br />

Division 1 started with many coders breezing through the easy and medium, although
with several flawed submissions on both that led to a couple of resubmissions and
lots of failures due to challenges or system tests. The hard problem required some
thought and also a lot of work. At the end, it all came down to challenges for the
several coders that could solve all 3 problems with good times.
<tc-webtag:handle coderId="22635428" context="algorithm"/> managed to win the match
and regain his target status thanks to his 2 succesful challenges.
<tc-webtag:handle coderId="10574855" context="algorithm"/>, on the other hand, was
pretty steady during challenge phase, with no attempt at all, but his speed in all
problems let him get home with a second place anyway. Last but not least,
<tc-webtag:handle coderId="10157606" context="algorithm"/> came in third, with
+75 in the challenge phase to secure his place by a little over 100 points of the fourth-place finisher.
<br /><br />

Division 2 was a different story, with many coders getting trapped for several minutes
in the tricky medium. In the end, solving problems proved to be the way to go, and the
only three coders that were able to solve all problems got the entire podium.
<tc-webtag:handle coderId="22672637" context="algorithm"/> was first,
<tc-webtag:handle coderId="22678784" context="algorithm"/> followed him in second place
and <tc-webtag:handle coderId="22678487" context="algorithm"/> got third. All three earned a place in Division 1 for the next match.
<br />
<br />
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7681&amp;rd=10670" name="7681">DiamondHunt</a></b> </font> <A href="Javascript:openProblemRating(7681)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506236" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      413 / 449 (91.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      341 / 413 (82.57%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tstan436</b> for 249.65 points (1 mins 4 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      213.83 (for 341 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem was rather easy and many coders were able to solve it pretty quickly. There were two approaches to it:
<br />
<br />

1. Do exactly as it says: Find any diamond, remove it, increment the result and keep doing that until no more
diamonds can be found. A good knowledge of the string functionality of your language was really useful here,
specially to increase the speed (and the score!), but also because less code means less bugs.
<br /><br />

You can see an implementation of this idea in
<tc-webtag:handle coderId="22635428" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=22635428&rd=10670&pm=7681">solution</a>.
<br /><br />

2. Count the number of properly matched angle brackets. This was a little trickier to think but
much faster to code, because the whole problem could be solved with this simple C++ line:

<pre>
int i,o=0,r=0;
for(i=0;i&lt;mine.size();++i) if (mine[i]=='&lt;') o++; else if (o&gt;0) { o--; r++; }
return r;
</pre>

It's a good excercise to try to understand why this code works, so I'll leave that to you.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7408&amp;rd=10670" name="7408">CommonMultiples</a></b>
</font>
<A href="Javascript:openProblemRating(7408)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506236" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      289 / 449 (64.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      73 / 289 (25.26%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>voidProject</b> for 454.07 points (9 mins 13 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      319.53 (for 73 correct submissions) 
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
      421 / 430 (97.91%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      312 / 421 (74.11%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 248.45 points (2 mins 15 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      212.83 (for 312 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem needed only some simple math skills to be solved -- but if you weren't careful enough,
an overflow could kill your entire problem at any step of the way.
<br />
<br />

As many coders noticed, to be a multiple of all members of <b>a</b> is equivalent to being a multiple
of the LCM (least common multiple) of all of them. To find it, you can find the LCM of the first two
members, then the LCM of the result with the third member and so on (this holds simply by the definition,
try to see it!). To calculate the LCM of two numbers, we can make use of the following result:
LCM(a,b)*GCD(a,b)=a*b. Here GCD stands for "greatest common divisor." Now, the LCM(a,b) can be calculated
as a/GCD(a,b)*b. Note that it's better to do the division first to avoid overflowing. GCD can easily be
calculated with Euclid's algorithm (you can find it along with the rest of the solution in
<tc-webtag:handle coderId="10574855" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=10574855&rd=10670&pm=7408">implementation</a>).
<br />
<br />

IMPORTANT: The LCM can be TOO big to fit in any integer type, but this has a simple solution: Whenever
the partial LCM goes over <b>upper</b>, we can simply return 0. You also needed to do your calculations with 64
bit integers, because upper can be too close to the limit of 32 bit, and the overflow may pass unnoticed
even when the check is made at every step.
<br /><br />

After all of this, all that's left is to count how many multiples of the LCM lie between <b>lower</b> and
<b>uppper</b>, and that's exactly <b>upper</b>/LCM-(<b>lower</b>-1)/LCM, which is the number up to
<b>upper</b> inclusive substracted with the number of multiples strictly less than <b>lower</b>.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7684&amp;rd=10670" name="7684">FastPostman</a></b> </font> <A href="Javascript:openProblemRating(7684)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506236" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      51 / 449 (11.36%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 51 (7.84%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>lvxianjie</b> for 670.15 points (22 mins 23 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      527.73 (for 4 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
As with many Division 2 hards, this problem was a classical exercise in dynammic programming, but only 4 coders
were able to solve it correctly.
<br />
<br />

First, notice that since delivery is instant, it is always best to deliver a letter the first time you pass
through the door of the corresponding house. Thinking in that direction, at every moment the set of houses
that have their deliveries made is an interval with the intitial position inside.
<br /><br />

You should also notice that you need to go through the houses one by one -- it's never useful to change direction
at any other point (because you are just losing time). So, we can define the state with 3 integers:

<ul>
<li>The beginning of the already delivered interval</li>
<li>The end of the already delivered interval</li>
<li>The current position</li>
</ul>

Each integer is an index of the addresses array (which result from adding the postman's initial position
to the addresses of the needed delivieries). At each state, you need to check whether it's best to expand
the interval to the right (i,j,k)->(i-1,j,i-1) or to the left (i,j,k)->(i,j,j+1). This leads to an
O(n<sup>3</sup>) algorithm, that is actually O(n<sup>2</sup>) if you see that at each moment your current
position (k) is equal to i or j, so you can represent it as a simple binary value.
<br />
<br />

See <tc-webtag:handle coderId="22672637" context="algorithm"/>'s
<a href="/stat?c=problem_solution&cr=22672637&rd=10670&pm=7684">code</a> for an iterative
implementation of this idea.
<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7682&amp;rd=10670" name="7682">HeightRound</a></b> </font> <A href="Javascript:openProblemRating(7682)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506236" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      317 / 430 (73.72%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      96 / 317 (30.28%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Egor</b> for 483.57 points (5 mins 16 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      298.30 (for 96 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Greedy problems seem to be in fashion lately for Division 1 mediums, and this one was no exception. Many
coders looked at it <b>too</b> greedily, however, and lost all their points in challenges or after the system testing.
<br />
<br />

The crucial observation is that the round is made of two intervals, one in increasing order and one in decreasing
order. See it this way: The shortest person (A) must be the first element of the return array (because the lexicographical
order says so, and there's always a rotation of a solution that makes him first). Suppose now that the tallest person (B)
is at position k. In any solution, you can sort the segment that goes from A to B and that would never increase the
maximum difference while actually having a lexicographically first solution. For the segment that goes from B to
the end, sorting that in decreasing order also never increases the maximum difference, but we might need to "move" some
people to the front (before B) to actually get the lexicographically first solution. I'll stop here because a formal
demonstration would be too long, but try to see that those moves always help you with the lexicographic thing (because
you can always insert those moved guys before a taller one and maintain the order).
<br />
<br />

The right greedy thing to do was actually not completely greedy. First, you need to fix the best difference (here there
were several options, like iterating over each one and returning the first that has a correct answer or binary
searching, or even doing a dynamic programming code that finds it like
<tc-webtag:handle coderId="272072" context="algorithm"/>
<a href="/stat?c=problem_solution&rm=264543&rd=10670&pm=7682&cr=272072">did</a>).
<br />
<br />

With a fixed maximum difference (let's call it D), we need to build a lexicographically short round that does not
go over D in any step. As mentioned above, we divide the sequence into 2 parts, first an increasing sequence from A
to B and then a decreasing sequence from B to the end.
<br /><br />

To build the last part, we can do it greedily (finally the greedy part!) by inserting each time the greater element
that does not violate D. First we start with A at the bottom. Find the greater element less than or equal to A+D and
make that element the last one (adjacent to A). After that, find the greater element less than or equal to C+D where C
is the new element and so on, until the difference of an added element and B is less than or equal to D. At that point, we
place all the remaining elements in the initial segment, in sorted increasing order. If the obtained order does not
violate D, it's a lexicographically first solution. If it does, no solution can be constructed with that D.
<br />
<br />

See the
<a href="/stat?c=problem_solution&rm=264527&rd=10670&pm=7682&cr=10157606">solution</a>
made by <tc-webtag:handle coderId="10157606" context="algorithm"/> for a clear implementation of the idea
of iterating over D.
<br />
<br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7683&amp;rd=10670" name="7683">Meteorites</a></b> </font> <A href="Javascript:openProblemRating(7683)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506236" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      53 / 430 (12.33%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      19 / 53 (35.85%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ying</b> for 919.97 points (8 mins 31 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      560.58 (for 19 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Geometry problems always require some geometrical subroutines, but in this case, seeing the problem
in the correct angle reduced the actual geometric part to a minimum.
<br /><br />

First, divide the perimeter into the perimeter that each circle has and is not "covered" by any
other circle. If you add up those, it will give you the perimeter of the union.
<br />
<br />

For each circle 2 steps are needed.
<ul>
<li>If it's contained in another circle, the uncovered perimeter is 0</li>
<li>Calculate how much of its perimeter is uncovered and add it to the result</li>
</ul>
Step 1 is simple but important to remember (as illustrated by the last example), but now that's done,
let's go to step 2.
<br /><br />

Let's call the current circle C and iterate over every other circle D.
For each D, we can see weither there is an intersection or not by comparing the sum of the radius
with the distance between the centers. If there is no intersection, we do nothing; if there is one, we want to
calculate the angle of the segment that goes from the center of C to each of the intersections (because the
length of the covered arc is proportional to that angle). We can easily find those angles by using the
cosine theorem and an atan2 function (you can find the actual equation in the code below).
<br />
<br />

Once we have the right pair of angles for each intersecting circle, we need to find the length of the
union of those and then take the complement and add 2PI*radius*ANGLE/2PI=radius*ANGLE to the result,
where ANGLE is the size of the complement of the covered interval. To do that, we can sort the initial
and ending points of each interval and iterate over both of them simultaneously in increasing order.
At each intial point, we add 1 to some
variable, and at each ending point, we substract 1. Each interval between 2 of those in which the variable
is in 0 is an uncovered interval so we add its length to ANGLE.
<br /><br />

Java code for this problem follows:

<pre>
long sqr(long x) {return x*x; }
double sqr(double x) {return x*x; }
long dist2(long x1, long y1, long x2, long y2) {return sqr(x1-x2)+sqr(y1-y2);}
void add(Map&lt;Double,Integer&gt; m, Double x, int v) {
    if (!m.containsKey(x)) m.put(x,0);
    m.put(x,m.get(x)+v);
}
void addInt(Map&lt;Double,Integer&gt; m, Double f, Double t) {
    add(m,f,1); add(m,t,-1);
}
public double perimeter(int[] x, int[] y, int[] r) {
    int n=x.length;
    double res=0.0;
    for(int i=0;i&lt;n;++i) {
        double rc=0.0;
        boolean ok=true; //check if current circle its inside another circle
        for(int j=0;j&lt;n;++j)if(sqr(r[j]-r[i])&gt;=dist2(x[i],y[i],x[j],y[j])
            && (r[j]&gt;r[i])) ok=false;
        if (!ok) continue;

        //calculate the intervals and store them into ints
        Map&lt;Double,Integer&gt; ints = new TreeMap&lt;Double,Integer&gt;();
        ints.put(0.0,0);
        ints.put(2.0*Math.PI,0);
        for(int j=0;j&lt;n;++j)if (i!=j) {
            long d2=dist2(x[i],y[i],x[j],y[j]);

            //check intersection with this circle
            if (d2&gt;=sqr(r[i]+r[j])||d2&lt;=sqr(r[i]-r[j])) continue;
            double alpha,beta,med,offset;
             //triangle sides
            double a=r[i];
            double b=Math.sqrt((double)dist2(x[i],y[i],x[j],y[j]));
            double c=r[j];
            //difference between the line that goes through
            //both centers and the intersections
            offset=Math.acos((sqr(a)+sqr(b)-sqr(c))/(2.0*a*b));

            //angle from the line that goes through both center with the axis
            med=Math.atan2(y[j]-y[i],x[j]-x[i])+2.0*Math.PI;
            if (med&gt;=2.0*Math.PI) med-=2.0*Math.PI;

            alpha=med-offset; if (alpha&lt;0) alpha+=2.0*Math.PI;
            beta=med+offset; if (beta&gt;2.0*Math.PI) beta-=2.0*Math.PI;

            if (alpha&gt;beta) //interval passes through 0, so we split it
                { addInt(ints,0.0,beta); addInt(ints,alpha,2.0*Math.PI); }
            else addInt(ints,alpha,beta);
        }

        //calculate the sum of uncovered angle intervals
        double tot=0.0,ant=0.0; int h=0;
        for(Map.Entry&lt;Double,Integer&gt; e : ints.entrySet()) {
            if (h==0 && e.getKey()&gt;0.0) tot+=e.getKey()-ant;
            h+=e.getValue();
            ant=e.getKey();
        }
        res+=tot*r[i];
    }

    return res;
}
</pre>
</p>



<div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="15231364" context="algorithm"/><br />
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
