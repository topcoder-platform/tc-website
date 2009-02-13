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
<tc-webtag:forumLink forumID="505989" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 314</span><br>Thursday, August 3, 2006
<br><br>

<h2>Match summary</h2>

<p>This match was SRM number 314, which is the truncated decimal expansion of

pi to two decimal places, putting it quite exclusive company -- only SRM 3

(May 2001) and SRM 31 (September 2001) also start the decimal expansion of pi

, and these three will be the only ones until SRM 3141, projected to occur in

the year 2062 (assuming the current rate of about fifty SRMs per year).

For this momentous occasion, 744 competitors showed up, 349 in Division I and

395 in Division II.</p>



<p>In Division I,

<tc-webtag:handle coderId="10574855" context="algorithm"/>

opened up the match by solving all three problems in

about thirty minutes, but he quickly resubmitted his 1000 point problem twice. 

Taking the lead from him was

<tc-webtag:handle coderId="21111148" context="algorithm"/>

, with 1431.91 points.

After challenge phase, 

<tc-webtag:handle coderId="10574855" context="algorithm"/>

rose back

up to second place with four successful challenges.  All their solutions

passed, giving

<tc-webtag:handle coderId="21111148" context="algorithm"/>

his first SRM win.  Rounding out the top five were

<tc-webtag:handle coderId="10428762" context="algorithm"/>,

<tc-webtag:handle coderId="308453" context="algorithm"/>,

and

<tc-webtag:handle coderId="11829284" context="algorithm"/>.</p>



<p>In Division II, 

<tc-webtag:handle coderId="20283608" context="algorithm"/>

won the division handily with 1496.09 points, beating

newcomers

<tc-webtag:handle coderId="22630204" context="algorithm"/> and

<tc-webtag:handle coderId="22630033" context="algorithm"/>

by over 100 points, despite

<tc-webtag:handle coderId="22630033" context="algorithm"/>

having the fastest submissions for both the easy and medium.  Rounding out

the top five were

<tc-webtag:handle coderId="22509580" context="algorithm"/> and

<tc-webtag:handle coderId="22098667" context="algorithm"/>.</p>



<H1>



The Problems



</H1>



</p>







<font size="+2">



<b><a href="/stat?c=problem_statement&amp;pm=6463&amp;rd=9994"

name="6463">MooingCows</a></b>



</font>



<a href="Javascript:openProblemRating(6463)"><img src="/i/rate_it.gif"

hspace="10" border="0" alt="rate it" /></a>



<a HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505989"

CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"

border="0" /></a>



<br>



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



      321 / 395 (81.27%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Success Rate</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      242 / 321 (75.39%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>High Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      <b>Jonick</b> for 248.00 points (2 mins 33 secs)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Average Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      191.67 (for 242 correct submissions)



    </td>



  </tr>



</table></blockquote>



<p>

Here we have a farm with some very loud cows, who are happiest when they hear

each other.  However, only one of the cows is allowed to moo here, and you

have to determine which one, and what the total amount of dissatisfaction is

when that cow moos.

</p>



<p>

If you look at the formula for the total dissatisfaction (the number you

needed to find), the total dissatisfaction when one given cow moos is the sum

of the dissatisfactions between it and all other cows.  This suggests a simple

solution: loop through all cows and simulate what would happen if that cow

mooed, and take the minimum of all of those.

At most the farmland can be 50 x 50 squares large, which means that

there can be at most 2500 cows on the land.  This means that 2500 x 2499

distance calculations need to be done, which will run in plenty of time.

</p>



<p>

For a clean implementation, have a look at

<tc-webtag:handle coderId="22630033" context="algorithm"/>'s

implementation

<a href="/stat?c=problem_solution&cr=22630033&rd=9994&pm=6463">here</a>.  Note that

in his solution, the dissatisfaction between a cow and itself is also added to the sum, but this does not

change the answer, because that dissatisfaction is always zero!

</p>



<p>

The majority of submissions that failed unfortunately set their &quot;infinity&quot;

value to be smaller than the maximum possible return value, and thus failed on the largest

possible test case: a 50 x 50 grid, each square containing a cow.

</p>





<font size="+2">



<b><a href="/stat?c=problem_statement&amp;pm=6631&amp;rd=9994"

name="6631">StandInLine</a></b>



</font>



<a href="Javascript:openProblemRating(6631)"><img src="/i/rate_it.gif"

hspace="10" border="0" alt="rate it" /></a>



<a HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505989"

CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"

border="0" /></a>



<br>



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



      213 / 395 (53.92%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Success Rate</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      187 / 213 (87.79%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>High Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      <b>Jonick</b> for 486.14 points (4 mins 49 secs)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Average Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      334.99 (for 187 correct submissions)



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



      341 / 349 (97.71%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Success Rate</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      333 / 341 (97.65%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>High Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      <b>Petr</b> for 248.19 points (2 mins 26 secs)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Average Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      207.56 (for 333 correct submissions)



    </td>



  </tr>



</table></blockquote>



<p>

At least a few coders (myself included) read the problem, then looked at the

input constraints, which specified that there would be at most ten soldiers,

and immediately thought, "next_permutation!"  In fact, that was probably the

quickest way to code up a solution: try all possible orderings for the

soldiers and check each to see if it is consistent with the input.

Since you were guaranteed by the problem statement that there would

be exactly one solution, this procedure would find it.  This solution runs in

O(N! * N^2).  This is admittedly borderline for N = 10, but should run in

time if you make sure to break out of the check early if it has already failed.

</p>



<p>

The much more elegant solution is to actually construct the soldiers' ordering

using some logic.  We will loop from the tallest soldier to the

shortest and insert each in the correct spot (to the right of the correct

number of taller soldiers) as we go.  Note that this

means two things.  First, when we reach a certain soldier, all of the soldiers

he possibly could have noticed to his left have already been placed.  Second,

the soldiers placed afterwards can be placed anywhere without affecting the

correctness of the previous soldiers' placements.

A very concise implementation of this approach

can be found in <tc-webtag:handle coderId="7581406" context="algorithm"/>'s

solution <a href="/stat?c=problem_solution&cr=7581406&rd=9994&pm=6631">here</a>.

</p>





<font size="+2">



<b><a href="/stat?c=problem_statement&amp;pm=6467&amp;rd=9994"

name="6467">GrasslandFencer</a></b>



</font>



<a href="Javascript:openProblemRating(6467)"><img src="/i/rate_it.gif"

hspace="10" border="0" alt="rate it" /></a>



<a HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505989"

CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"

border="0" /></a>



<br>



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



      57 / 395 (14.43%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Success Rate</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      18 / 57 (31.58%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>High Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      <b>jfguo</b> for 792.10 points (15 mins 25 secs)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Average Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      536.73 (for 18 correct submissions)



    </td>



  </tr>



</table></blockquote>







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



      248 / 349 (71.06%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Success Rate</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      170 / 248 (68.55%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>High Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      <b>Burunduk2</b> for 477.63 points (6 mins 12 secs)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Average Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      359.31 (for 170 correct submissions)



    </td>



  </tr>



</table></blockquote>



<p>

TC veterans read this problem, looked at the input constraints,

and decided that it had to be a <a href="/tc?module=Static&d1=features&d2=040104">DP</a>

 problem with 2<sup>16</sup> states.  And,

indeed, it was.

In this problem, let a state be a bitmask with 16 bits.  Bit <i>i</i> of the

number will be 1 if fence <i>i</i> has been used, and 0 otherwise.  Our

DP storage consists of keeping the greatest area that has been built with a

given subset of fences.  Note that for a given subset of fences, there are

multiple ways that they can be broken into valid triangles: consider, for

example, {2, 2, 2, 3, 3, 3}.  This can be broken down into two equilateral

triangles, or as a {2, 2, 3} triangle and a {2, 3, 3} triangle.  However, the

former arrangement is much better.

</p>



<p>

Now that we have our state representation, we need to come up with a relation

between different states.  Well, if you have used some subset of the fences,

then to get to another valid state, pick three unused fences and make a

triangle out of them, if you can.

This was made much easier because the

Notes section of the problem statement (you do read those, don't you?) gave

the conditions under which a triangle was valid, as well as Heron's formula

for the area of a triangle given its three side lengths.

</p>



<p>

So, the recurrence relation expressed in pseudocode:

</p>



<pre>

  N = number of fences

  biggest_area(used_fences) {

    double best = 0;

    for i = 0 to (N - 1) {

      for j = (i + 1) to (N - 1) {

        for k = (j + 1) to (N - 1) {

          if used_fences contains {i, j, k} AND the three form a valid triangle {

            best = max(best, area(i,j,k) + recurrence[used_fences minus {i, j, k}])

          }

        }

      }

    }

    return best

  }

</pre>



<p>Note that this will automatically handle the base case, which is zero area

for no fences used.</p>



<p>

The last step of this puzzle is to save previously calculated results, or the

solution will time out.  It's probably easiest in this case to use memoization

on the above recurrence simply by adding two lines: one to save the value of

best at the end of the

function, and one at the beginning of the function to check if the best

value for the given used_fences set has already been calculated.

</p>



<font size="+2">



<b><a href="/stat?c=problem_statement&amp;pm=6464&amp;rd=9994"

name="6464">MonthlyPayment</a></b>



</font>



<a href="Javascript:openProblemRating(6464)"><img src="/i/rate_it.gif"

hspace="10" border="0" alt="rate it" /></a>



<a HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505989"

CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it"

border="0" /></a>



<br>



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



      76 / 349 (21.78%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Success Rate</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      20 / 76 (26.32%)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>High Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      <b>Burunduk2</b> for 754.99 points (17 mins 24 secs)



    </td>



  </tr>



  <tr>



    <td class="bodyText" style="background: #eee;">



      <b>Average Score</b>



    </td>



    <td class="bodyText" style="background: #eee;">



      474.40 (for 20 correct submissions)



    </td>



  </tr>



</table></blockquote>



<p>

Boy, someone really sends a lot of SMS messages -- up to 10<sup>12</sup> of

them per month!  Picking the right set of plans could really save some money.

But how?

</p>



<p>

Let's consider a simplification of the problem first.  What if only one

SMS package deal were available?  If the deal costs at least ten cents per SMS,

then it's not worth it to use the deal at all, so the optimal cost is then

ten cents times the number of messages.  Otherwise, the package deal is

cheaper, so there are two possibilities.  Let M be the number of messages you

want to send, P the number of messages in the package, and C be the cost of

the package.  Then you either want to buy <tt>floor(M / P)</tt> packages, or

<tt>floor(M / P) + 1</tt>.  In the first case, you need to make up the

difference, if any, by buying individual messages, and in the second case, you

buy more messages than necessary.  (Exercise for the reader: Why don't we

have to consider any other cases?)  These two cases can be checked in constant

time to see which one costs less.

So now we're done with our simplified problem, and can apply that to solving

the harder version.

</p>



<p>

Now say we've selected a quantity N1 of package 1 to buy.  This means that

there are <tt>M - (N1 * P1)</tt> messages left to assign between package 2

and the default pricing.  But this is exactly the problem we just solved!

So all we have to do is loop through all possible quantities N1, from 0 to

<tt>floor(N1 / P1) + 1</tt>, and for each, solve the easier version of the

problem.  Okay, great, we've got a solution!  Code it up and it'll pass

all the examples, and submit!

</p>



<p>Wait a second.  What were those input constraints again?</p>



<p>In the worst case here, there are 10<sup>12</sup> messages to send, and

both packages can contain one message apiece.  This won't run in time.  Okay,

back to the drawing board.</p>



<p>

The thing to notice is that all but &quot;a few&quot; of the packages you buy

will be of one type, and the rest will be divided between the other package

and the standard per-message deal.  

So, try both packages as the one you buy &quot;a few&quot; of,

and loop through all possible quantities of that package, up to a certain

limit.  Then, for each quantity of the package you buy, find the optimal

solution using our previous procedure.

</p>



<p>

Combing through solutions that used this approach and that

passed system testing, it seems that the smallest limit that worked was

one million.

For a clear implementation of this approach, see

<tc-webtag:handle coderId="8583798" context="algorithm"/>'s

<a href="/stat?c=problem_solution&rm=249321&rd=9994&pm=6464&cr=8583798">solution</a>.

</p>



<p>

Other coders picked interesting ways to cut down on the search space: 

<tc-webtag:handle coderId="10574855" context="algorithm"/>

(<a href="/stat?c=problem_solution&rm=249318&rd=9994&pm=6464&cr=10574855">solution</a>) simply bought a large number of the cheaper

package before doing the exhaustive search, and

<tc-webtag:handle coderId="10428762" context="algorithm"/>

(<a href="/stat?c=problem_solution&rm=249325&rd=9994&pm=6464&cr=10428762">solution</a>) used ternary search to reduce the search space

to a more manageable level before iterating through all possible values.

(Note that ternary search does not work by itself.  Since the

number of packages bought must be integers, the function that you are

trying to minimize is not actually unimodal.)

</p>



<p>

In fact, this problem is an example of an <b>integer programming</b> problem,

which is to optimize a cost function given some constraints, with all variable

values required to be integers.  In general, integer programming problems are

undecidable, although in most situations they are &quot;merely&quot; NP-hard.

This means that unless the problem has some special structure (which this

does not) there is no way to avoid some amount of exhaustive search, although

there are ways to remove sections of the search space that could not possibly

contain the optimal result.  This is a programming technique known as

<b>pruning</b>, and is extremely useful when attempting to optimize brute force

solutions -- it may even allow you to create a brute force solution to a

problem which was not intended to have one!

</p><div class="authorPhoto">
    <img src="/i/m/antimatter_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="275071" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
