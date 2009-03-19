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
    <A href="/stat?c=round_overview&er=5&rd=10660">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506226" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 336</span><br>Thursday, January 25, 2007
<br><br>

<h2>Match summary</h2>

This match had an unusual and tough set of problems written by
<tc-webtag:handle coderId="159544" context="algorithm"/>
. Both medium problems were tricky, with many corner cases that led to an overall accuracy lower than we are used to. The hards were also no walk in the park, with both being solved by less than 5% of the
participants.<br />
<br />

In division 1, speed in the problems was the key. Of the top three,
<tc-webtag:handle coderId="7462740" context="algorithm"/> was the only one that took points
out of the challenge phase, but as it turned out he didn't even need them and would have won
without them. In second place was<tc-webtag:handle coderId="10574855" context="algorithm"/>,
who was pretty fast on the tricky medium, and third place went to <tc-webtag:handle coderId="263396" context="algorithm"/>.
<br />
<br />

Division 2 was a different story. While the champion of this round,
<tc-webtag:handle coderId="22658346" context="algorithm"/>, relied only on his speed in the problems,
second- and third-place finishers <tc-webtag:handle coderId="22646477" context="algorithm"/> and 
<tc-webtag:handle coderId="14927099" context="algorithm"/> both scored more than 100 points in
challenges to earn their spots on the podium.


<H1>
The Problems
</H1>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6090&amp;rd=10660" name="6090">VowelLatin</a></b>
</font>
<A href="Javascript:openProblemRating(6090)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506226" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      431 / 453 (95.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      414 / 431 (96.06%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ebd</b> for 249.64 points (1 mins 4 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      223.63 (for 414 correct submissions)
    </td>
  </tr>
</table></blockquote>

This problem was pretty straightforward -- you only needed to follow the rules carefully. The best way to do it is to
take two passes over the input string: In the first pass collect all non-vowels and go appending them at the end of
the result; on the second pass do the same with the vowels. With this approach you mantain the original order of both groups.
<br />
<br />

A similar approach was to do only one pass but have two accumulated results and return their concatenation.
For details of this method see <tc-webtag:handle coderId="14927099" context="algorithm"/>'s
<a href=http://www.topcoder.com/stat?c=problem_solution&cr=14927099&rd=10660&pm=6090>fastest solution</a>.
<br />
<br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7350&amp;rd=10660" name="7350">MostLikely</a></b>
</font>
<A href="Javascript:openProblemRating(7350)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506226" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division Two - Level Three: 
<blockquote><table cellspacing="2">
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
      144 / 453 (31.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      22 / 144 (15.28%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lewha0</b> for 744.35 points (13 mins 35 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      471.74 (for 22 correct submissions)
    </td>
  </tr>
</table></blockquote>

<a name="div2hard">This problem was a simpler version of the
<a href="http://www.topcoder.com/stat?c=problem_statement&pm=7351&rd=10660">division 1 medium</a>, so if you liked it, go try that one in the practice room for a more challenging version.
<br /><br />

The basic idea was to calculate, for each possible rank, the number of your possible scores that would achieve that
spot, take the greatest of those, and remember whether it is repeated or not. A tricky thing to notice is that
if there are n other players then there are n+1 possible ranks for you.
<br />
<br />

The best approach for implementing this is to add a strong player that always beats you and a weak player whom you
always beat. That way your rank will surely be situated between two other players. Then, sort the other players by
greatest score and, at each place, count how many scores within your range will give you a spot between them (or tied
with the low one of them, is the same for you). This can be done with simple math, illustrated in the C++ code that
follows:

<pre>
int likelyRank(vector &lt;int&gt; sc, int low, int high) {
	int best=0,r=-1,n=sc.size()+1;
	sc.push_back(-1); sc.push_back(high+1); sort(sc.begin(),sc.end()); reverse(sc.begin(),sc.end());
	for(int i=0;i&lt;n;++i) {
		int mn=max(sc[i+1],low),mx=min(high,sc[i]-1);
		if (mn&gt;mx) continue;
		int t=mx-mn+1;
		if (t&gt;best) { r=i+1; best=t; }
		else if (t==best) r=-1;
	}
	return r;
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7313&amp;rd=10660" name="7313">ServiceNames</a></b>
</font>
<A href="Javascript:openProblemRating(7313)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506226" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      258 / 453 (56.95%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      142 / 258 (55.04%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>mrinaldotnet</b> for 462.90 points (8 mins 10 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      302.91 (for 142 correct submissions)
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
      337 / 349 (96.56%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      257 / 337 (76.26%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>cypressx</b> for 246.25 points (3 mins 31 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      196.37 (for 257 correct submissions)
    </td>
  </tr>
</table></blockquote>

Good knowledge of your language played a major role in this problem, as <a href="http://www.topcoder.com/stat?c=problem_solution&cr=8471704&rd=10660&pm=7313">the C++ short program</a> by
<tc-webtag:handle coderId="8471704" context="algorithm"/> shows. Follow the instructions carefully and you'll be
on your way. <b>Really</b> carefully. I mean it.
<br />
<br />

The most important parts of this problem were before and after coding: Good reading of the problem statement so you didn't miss any detail, and good testing since the provided examples didn't test everything you needed. In this case, the
problem for many coders was that they forgot to sort the services within each KindOfInput and the examples didn't cover
that case. A good practice if you like to submit fast is to test a little more after submitting -- it's better to have a
corner case fix resubmitted 2 or 3 minutes later than 45 or 50, with much more elapsed time and much less points.
<br />
<br />

Getting to the solution, the basic idea was to simulate what the problem asked:

<ul>
<li>Parse each string and accumulate in a <a href=http://www.nist.gov/dads/HTML/dictionary.html>dictionary</a> a
list of the services associated to each KindOfInput</li>
<li>Sort the lists</li>
<li>Sort the dictionary</li>
<li>Iterate the dictionary and format the output</li>
</ul>

For coders that solved this slowly -- or failed to solve it -- I'd recommend that you take a look at the <a href="http://www.topcoder.com/tc?module=ProblemDetail&rd=10660&pm=7313">fastest solutions</a>
in your favorite language for a good lesson on using embedded libraries.
<br />
<br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7351&amp;rd=10660" name="7351">LikelyWord</a></b>
</font>
<A href="Javascript:openProblemRating(7351)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506226" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
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
      262 / 349 (75.07%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      59 / 262 (22.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>liympanda</b> for 432.71 points (11 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      285.84 (for 59 correct submissions)
    </td>
  </tr>
</table></blockquote>

As mentioned <a href="#div2hard">above</a>, this problem is a trickier version of the
<a href="http://www.topcoder.com/stat?c=problem_statement&pm=7350&rd=10660">division 2 hard</a>;
if you liked it, go try that one in the practice room for a more relaxing version.
<br />
<br />

The idea in this case was the same as the division 2 version, but
the math for this case is more difficult. To add some first and last words, you can add the empty
one (it beats everything) and a string consisting of m&gt;k zs.
<br />
<br />

At each space between two words, you can treat the boundaries of the spot as if they were base-26 numbers
(completing with a's or shortening both strings appropiately) and then the number of strings between them is simply
the difference between those numbers. After doing that, see if you need to add the string that is equal
to each of them in this spot (if the string wasn't actually of length k originally, you may want to include the prefix or
extension of length k of each of them). For details on this and a good implementation see
<tc-webtag:handle coderId="10574855" context="algorithm"/>'s nice, short and clear
<a href="http://www.topcoder.com/stat?c=problem_solution&cr=10574855&rd=10660&pm=7351">code</a>.
<br />
<br />

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7336&amp;rd=10660" name="7336">Shadow</a></b>
</font>
<A href="Javascript:openProblemRating(7336)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506226" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      54 / 349 (15.47%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      15 / 54 (27.78%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 709.91 points (19 mins 57 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      514.19 (for 15 correct submissions)
    </td>
  </tr>
</table></blockquote>

This was a tricky problem with many corner cases, so it had to be programmed carefully, though the main point
was not very difficult. I'll outline the steps based on
<tc-webtag:handle coderId="263396" context="algorithm"/>'s
<a href="http://www.topcoder.com/stat?c=problem_solution&rm=263371&rd=10660&pm=7336&cr=263396">approach</a>.
<br /><br />

First, we'll detect infinite and zero cases, and then find the solution for the rest. If the tree is just one
point or a line, it's clear we must return zero. If the light is inside the tree, it's clear we must return infinite
(-1). Both those cases can easily be checked.
<br />
<br />

If the tree is just a rectangle, we must check if its coplanar with the light. This is easy because the tree
is aligned with the axis, so the plane is either x=A, y=A or z=A, where A is the value of the tree in the
particular coordinate for which both its points are the same. The check, then, is done by seeing if the light also
shares this plane, comparing the light's own value for that same coordinate. If both are the same, then the light is coplanar
and the shadow will be a line, so we return 0. Otherwise, we continue as if the tree was a solid with positive volume.
<br />
<br />

Finally, if the light is below the tree, we must return 0 because there will be no shadow. If the light is over the
lower level of the tree but below the higher level, and it does not fall in the previously described categories, then
the shadow will be infinite, so we return -1.<br />
<br />

For non-infinite non-zero cases, we must find the vertices of the polygon that the shadow covers. These are some of the
projections on the plane Y=0 of the lines that pass through each of the eight vertices of the tree and the light. To
find such points, the best way is to express the lines as L*(P1-P2)+P2, in which P1 and P2 are the two points and L is a
variable (the line consists of all points that result of given a real value to L). Finding the point with Z=0 is
then easy by setting L=-z2/(z1-z2). For more detail about this, see <tt>its</tt> function on the above quoted code.
<br />
<br />

To find out which vertices are part of the polygon, run a convex hull on all projections (after playing for a while with
the possibilities you'll convince yourself that the shadow is always convex). Then, since after the convex hull the points
are already sorted in clockwise or counter-clockwise order, you can calculate the surface as the sum of the areas of a
triangulation based on any point (see the code for details on this).
<br />
<br /> 

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
