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
<%--
<tc-webtag:forumLink forumID="505003" message="Discuss this match" /></div>
--%>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505003">Discuss this match</A></div>
<span class="bodySubtitle">TCO05 - Online Round 3</span><br>Wednesday, August 31, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The competition heated up in round 3 of the TCO.  Coders had little
trouble with the easy problem, and many of them submitted the medium
shortly thereafter.  However, a rash of resubmissions should have
clued everyone in that there was something a bit tricky about the
medium, and many of the submissions ended up failing on a few tricky
cases.  At the end of the round, it was snewman who had the most
points.  tomek was not too far behind, followed by overwise.  Good
luck to everyone who advanced.
</p>

<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4731&amp;rd=8016" name="4731">PlayingCubes</a></b>
</font>
<A href="Javascript:openProblemRating(4731)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>

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
      187 / 191 (97.91%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      164 / 187 (87.70%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>RalphFurmaniak</b> for 247.44 points (2 mins 53 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      215.50 (for 164 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

Naturally, we'll process the words one at a time, independently.  For
a given word, create a vertex in a graph for each letter in the word.
Then, for each cube, we create another vertex in the graph.  Finally,
we draw edges from each vertex corresponding to a cube to each vertex
corresponding to a letter where that letter is on the cube.  This
gives us a bipartite graph where one part is the vertices
corresponding to the letters in the word, and the other half is the
vertices corresponding to the cubes.  Then just run bipartite
matching, and if the size of the matching is equal to the length of
the word, the word can be formed.  That's one way to solve the problem
anyway...


<br/><br/>
Most coders, however, opted for the simpler solution made possible by
the fact that there were at most 8 cubes (always read the
constraints!).  In this solution, a brute force recursive function is
written.  It takes a word, a position in the word, and an array of
booleans stating which cubes have already been used.  We need to find
a cube that contains the letter at the given position in the word, so
we just check every cube:

<pre>
boolean recurse(word, position, used)
    if(position == word.length) return true
    for(i = 0; i&lt;numcubes; i++)
        if(!used[i] &amp;&amp; cube[i].containsLetter(word[position])
            used[i] = true
            if(recurse(word,position+1,used)return true
            used[i] = false
    return false
</pre>
In the worst case, there are 8 cubes that match the first letter, 7
that match the second and so on down to 1 cube for the last letter.
So there are 8! different execution paths our program could take
before getting to the last letter of the word.  The containsLetter
method adds another factor of 6, since you might have to look at all 6
letters on each cube.  Finally, there are 50 words, which gives us a
rough approximation of 12,096,000 operations: a big enough number that
you wouldn't want to have to count that many marbles, but not so big
that a computer can't do it in under 2 seconds pretty easily.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4013&amp;rd=8016" name="4013">OptimalTax</a></b>
</font>
<A href="Javascript:openProblemRating(4013)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>
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
      182 / 191 (95.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      60 / 182 (32.97%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>snewman</b> for 473.23 points (6 mins 50 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      314.16 (for 60 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
There are a few different ways to solve this problem.  The most
obvious one (to me anyway) is to consider some range for which the
tax specified by <b>index</b> is optimal, which starts out very large: from 0 to
infinity.  As we consider other taxes the
range for which the specified tax is optimal shrinks.<br/><br/>

One good way to visualize this is to consider each tax as a line in the Cartesian
plane where the x axis represents income, and the y axis represents
tax.  In this view, elements of <b>fixedBase</b> form the y-intercepts of the lines
and elements of <b>percent</b> form the slopes.  A tax is optimal at a
particular income (x value) if the line representing it is below all
the other lines at that point.  With this view, it should be clear
that the ends of the range for which tax <b>index</b> is optimal are
two points where the lines for that tax cross the lines for some
other taxes.  To the right of the optimal region is a tax with a
lower percentage, while to the left of the optimal region is a tax
with a higher percentage.<br/><br/>
Hence, we can iterate through all of the other taxes and find the
intercepts between those taxes and tax <b>index</b>.  Using these
intercepts and the percentages of the other taxes, we can adjust
either the left or right end of the range as is appropriate.  Finally,
we have to be sure to handle the special cases where two percentages of
two taxes are equal, as well as the cases where the optimal range
shrinks.
<pre>
    lo = 0;
    hi = infinity;
    for(int i = 0; i&lt;percent.length; i++){
        if(i == index)continue;
        if (percent[i] == percent[index] &amp;&amp; base[i] &lt;= base[index])
            return -1;
		else if(percent[i] == percent[index])continue;
        double x = 100.0*(base[i]-base[index])/(percent[index]-percent[i]);
        <font color="blue">x is the point where tax i and tax index
        //result in the same payment</font>

		if(percent[i] &lt;= percent[index]){
			hi = Math.min(hi,x);
		}else{
			lo = Math.max(lo,x);
		}
	}
    if(lo &lt; hi)return lo;
    else return -1;
</pre>
Since you are dealing with simple fractions (no addition or
subtraction after the division), you don't have to worry about doubles
not being precise enough.  If hi and lo should really be equal, then
they will be, and if they should really be different, then they will
be also.  Finally, the problem can also be solved with a binary
search, which may be a bit easier for those who don't like
manipulating equations.

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4769&amp;rd=8016" name="4769">Springs</a></b>
</font>
<A href="Javascript:openProblemRating(4769)"><img hspace="10" border="0" height="
18" width="60" src="/i/rate_it.gif"/></A><br>
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
      22 / 191 (11.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      7 / 22 (31.82%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 600.34 points (27 mins 22 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      465.11 (for 7 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>


Most coders are familiar with the idea of a binary search.  In this
problem, you had to take binary search to the next level, and nest it
within itself.  In the outer binary search, you are looking for the
compression at the left end of the rod.  At the inner binary search,
you try to find the value for the right end of the rod, assuming that
you've already got the value for the left end fixed from the outer
search.  Once you have the compressions for the left and right ends,
the rest of them follow.  So, the basic algorithm looks something like
this:
<pre>
    initialize lo1, hi1
    while(!done1){
        mid1 = (lo1+hi1)/2
        initialize lo2, hi2
        while(!done2){
            mid2 = (lo2+hi2)/2
            if(toohigh2(mid1,mid2))
                hi2 = mid2
            else
                lo2 = mid2
        }
        if(toohigh1(mid1,mid2))
            hi1 = mid1
        else
            lo1 = mid1
    }
</pre>

Obviously, a lot of details were left out. In particular, the
toohigh1() and toohigh2() functions.  But the idea is that toohigh1()
returns true if mid1 should be lower, and toohigh2() return true if
mid2 should be lower.  But, how exactly do we calculate them?  Lets
start with toohigh2(), we are going to have this function return true
if the total upwards force is greater than the weight of the rod, and
false otherwise.
Therefore, when our inner binary search terminates, we will have found
a value for mid2 such that the total upwards force generated by using
mid1 and mid2 is equal to the weight of the rod.  However, this only
fulfills one of our conditions.  The other one is that the torque must
be 0 at all the attachments to the springs.  Before we tackle this
part of the problem, I want to show that we don't actually have to
calculate the torque everywhere, just at one point.  If its 0 there,
its 0 everywhere.<br/><br/>
Lets say that the length of the rod is N, and the torque is 0 at some
point K from the left.  Furthermore, there is a force of M being
exerted by the springs to the left of K, and hence N-M by the springs
to the right of K.  Now, let's say that we increase K by 1
and let's look at what happens to the four components of the
torque:
<pre>
                   Change In
    Force Due to | Torque (Clockwise)
    -------------+-------------+
    Weight to R  | (N-K-1)<sup>2</sup>/2 - (N-K)<sup>2</sup>/2 = (K-N)+1/2
    Weight to L  | K<sup>2</sup>/2 - (K+1)<sup>2</sup>/2 = -K-1/2
    Springs to R | N-M
    Springs to L | M
</pre>
Note that we don't actually know or care how much torque the springs
to the left and right cause.  But, we do know that the torque will go
up by M if all the distances from the point of rotation goes up by 1,
and the total force is M.  So, if we add all the changes in torques up
we get:
<pre>

    ((K-N)+1/2) + (-K-1/2) + (N-M) + M = 0
</pre>
You may worry about the possibility of a springs switching from the
left to right when we move K by 1, but this case works out just as
well.  So, with that out of the way, let's just worry about the torque
around the left most spring.  Given a particular mid1 and mid2 we can
calculate this easily and then compare it to the torque from the
weight of the rod: len*len/2.  If the torque from the springs is too
great, it means that there is too much force in the springs to the
right.  The only way to reduce the torque is to shift some of the
force to the left (the sum of all the force must remain the same).
So, if there is too much torque, then it turns out that mid1 is too
low.  Similarly, if there is too little torque then mid1 is too high.
Either way, we keep refining our bounds, lo1 and hi1 until the torque
is just right.  Once both the torque and the total force are correct
(or as close to it as we can get with doubles), we are all done, and
we just compute the compressions of all the springs.
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
