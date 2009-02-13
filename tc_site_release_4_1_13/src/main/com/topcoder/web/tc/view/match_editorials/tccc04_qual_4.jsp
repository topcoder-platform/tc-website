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
<tc-webtag:forumLink forumID="505637" message="Discuss this match" /></div>
<span class="bodySubtitle">2004 TopCoder Collegiate Challenge <br> Qualification Problem Set 4</span><BR/>February 23-24, 2004
<br><br>

<span class="bigTitle">Summary</span>

<p> 
In only 12 minutes, <b>ante</b> joined 99 other coders in securing his spot in
the Collegiate Challenge.  Although the easy problem was cake for most coders,
only 23 were able to solve a mildly difficult level two problem.  Most everyone
who solved the level two did it through brute force, but there turns out to be
a quick polynomial time algorithm to solve it.  Since there isn't much to tell
in a play by play, I'll get right to the problems.
</p> 
  
<H1> 
The Problems 
</H1> 

<font size="+2"> 
<b>TurretDefense</b> 
</font> 
<A href="_Javascript:openProblemRating(2323)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505637" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      124 / 132 (93.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      107 / 124 (86.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>cnettel</b> for 245.73 points (3 mins 0 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      203.97 (for 107 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
In this problem, you are to aim a large gun at incoming targets, which can only
be destroyed at specific coordinates at specific times.  Your job is to shoot
them down in order, returning the first target that you are not able to shoot
down.  Of course, you can't skip any of them either.
</p> 

<p>
The distance between two coordinates is what is called the "manhattan
distance", and seems to be a regular theme in recent problems.  This is the sum
of the distance between the x coordinate and the distance between the y
coordinate, similar to the distance required to travel between two
intersections in a large city laid out on a grid.  In any case, the best method
to solve this problem is to keep track of the current time and x/y coordinates
of the turret, check to see if it can be moved to the next target.  If the
target cannot be reached, return that target's index.  If the target can be
reached, move the turret to those coordinates, and wait there until the target
arrives.  This amounts to setting the turret coordinates and the current time
to the target's parameters.
</p>

<font size="+2"> 
<b>BorelSets</b> 
</font> 
<A href="_Javascript:openProblemRating(2322)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505637" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      52 / 132 (39.39%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      23 / 52 (44.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ante</b> for 495.34 points (7 mins 43 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      302.29 (for 23 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
In this problem, we are given sets of numbers, which we must use with union and
complement operations to form as many sets as possible.  The limits in this
problem give us a saving grace -- there are only 10 possible elements in a set.
If we treat the presence of any element in U as a bit in an integer, we have at
most 2<sup>10</sup>, or 1024 sets.  Therefore, we can process each set in the
order it was added to see if more sets can be added.
</p> 

<p>
The first stage of the code is to process the input parameters.  Use your
favorite tokenizing function (strtok, istringstream, StringTokenizer, etc.) and
split each element into individual numbers.  Each set can be represented by an
integer, where bit N is set if the value N+1 is present in the set.  It is
important to subtract one from the values, because we want all the lower order
bits to be used.  After this, we add all the input sets to a queue.
</p>

<p>
The second stage is processing the queue, and using a BFS to find all the sets.
For each value that is in the queue, we try its complement first.  Then we try
a union between it and every element that was in the queue before it.  This
way, we only will process O(2<sup>2n</sup>) iterations.  For n = 10, this is
about a million iterations.  For each union and the complement, we check if the
new set has been seen before, and if it hasn't, mark it as seen and add it at
the end of the queue.  Another method is to repeatedly process all sets
currently in the field, taking the union against all other sets in the field,
stopping when no new sets can be formed.  This has a much larger run time, but
still works because of the low constraint size.  See <b>ante</b>'s solution for
an example.
</p>

<p>
The above algorithm works for a small number of sets, but there is also an
algorithm which can solve the problem in O(n*m) time, where n is the number of
values, and m is the number of input sets.  First, we can observe that with ANY
set input, we can always acheive the empty set.  If we have set A, we know U =
A union ~A (where ~ denotes complement).  We can acheive the empty set with ~U.
</p>

<p>
We also can prove that the intersection of two sets A and B (the set of
elements which are in both A and B) is acheivable through only union and
complement operations using De Morgan's law:<br/>
A intersect B = ~(~A union ~B)<br/>
</p>

<p>
Now, we will define the minimal subset of i to be the smallest set of values
for which i ALWAYS appears with in any of the input sets.  This could be simply
i by itself, or it could have other elements.  For each element in the input,
if the input contains the element i, we use it, otherwise we use the
complement.  Using these sets, we can repeatedly intersect all of them together
until we get the minimal subset.  This set of minimal subsets have no elements
in common, because if they did, there would be a case where some of the
original input elements intersected together formed a smaller minimal set.  In
addition, we have a minimal subset for every single value in U.  Using these
minimal subsets, we can form all the original input sets, and using the
original input sets, we can form all of the minimal subsets, making it
equivalent to substitute the minimal sets as the input.  Using the minimal
sets, it is possible to use the method above to form the empty set.  Then, if
we treat each set as a bit in a bit-field, we can form 2<sup>n</sup> sets using
the union operation, were n is the number of minimal subsets.  Using complement
doesn't matter because the complement of one set of minimal sets is the same as
using union for all the minimal sets that weren't used.  Therefore, there are
exactly 2<sup>n</sup> sets that can be formed from these minimal sets using
only union and complement.  Therefore, the answer to the problem at hand is
2<sup>n</sup>.  We can determine the minimal subsets in O(n*m) time (n is the
size of U, and m is the number of input sets), and then determine the answer in
constant time.
</p>

<p>
Thanks to <b>Ryan</b> for help on writing this proof
</p>

<p>
<img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273217" context="algorithm"/><br />
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
