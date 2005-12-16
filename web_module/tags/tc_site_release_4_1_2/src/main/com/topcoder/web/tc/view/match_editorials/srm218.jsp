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
<tc-webtag:forumLink forumID="505690" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 218</span><br>Thursday, November 4, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>SRM 218 turned out to be full of interesting surprises in both divisions.
The medium and hard problems in Division 1 turned out to be major stumbling blocks
for many coders, and many of the successful solutions took considerable lengths of time.
The Division 1 easy problem, which was also the Division 2 medium, held at least one
quirk that led to a high challenge and failure rate.</p>

<p>In Division 1, <b>gepa</b> turned in a superior performance to earn his first SRM victory.
An extra measure of congratulations is deserved for his offering up the lone successful
solution to the hard problem.  Hats off to a truly awesome round.
<b>nicka81</b> and <b>Vedensky</b> were 2nd and 3rd, but by a considerable margin.</p> 

<p>In Division 2, <b>pako</b> took first place honors by more than 100 points, followed by
<b>Javaholic</b> and <b>quake</b>, with several others not far behind.  Several competitors
served up solutions to all three problems, but many of them had one or more fail.</p>

<p>A special pat on the back should go to <b>glguy</b>, finishing 6th, as the only newcomer
to successfully solve all three problems (and one of nine overall)!  Likewise to <b>katiej76</b>,
finishing 11th, also as a newcomer, but dishing out a commanding <i>six</i> successful challenges
on the 500 point problem.  Wow!  Though not newcomers, <b>modenl</b> and <b>Vishwesh86</b> both
also deserve commendation for eight and six successful challenges, respectively.</p>

<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3100&amp;rd=5864" name="3100">AccessLevel</a></b> 
</font> 
<A href="Javascript:openProblemRating(3100)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505690" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      162 / 170 (95.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      156 / 162 (96.30%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>csd98412</b> for 249.39 points (1 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      237.77 (for 156 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>This problem was about a straightforward as it gets, with really no surprises.
The most common basic approach was start with an empty string, loop through the
input array, and append characters to the string one at a time.  The only problems
with solutions seemed to stem from mishandling an empty array by not properly initializing
the empty string, or by using &gt; for the permission comparison instead of &gt;=.</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3102&amp;rd=5864" name="3102">FolderSize</a></b> 
</font> 
<A href="Javascript:openProblemRating(3102)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505690" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      152 / 170 (89.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      64 / 152 (42.11%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>pako</b> for 476.21 points (6 mins 24 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      389.12 (for 64 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      200
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      116 / 120 (96.67%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      89 / 116 (76.72%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Im2Good</b> for 198.12 points (2 mins 46 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      183.64 (for 89 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>This problem was a plentiful source of either joy or frustration, depending
on which side of the challenge you sat.  The basic algorithm was to initialize your
array based upon <b>folderCount</b>, then loop through the files, and add the wasted
space of each to the appropriate folder.</p> 

<p>The trick is to make sure the wasted space of each file is properly calculated, and
herein lied the subtle mistake of so many coders.  In nearly every case that failed,
there was something like:
<pre>waste = clustersize - filesize % clustersize</pre>
BUT... this makes a critical error in handling the case when a file exactly fills
all of it's clusters.  Likewise, a size 0 file will not use any clusters at all, and will
have no waste.  That being said, once you handle that special case properly, the rest is
trivial.</p>

<p>Nonetheless, the lesson to learn is two-fold.  No matter how easy a problem seems, it
pays to think it through before hitting the [Submit] button.  That there was no example
case to illustrate this case only reinforces the importance of thoughtful testing.</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3093&amp;rd=5864" name="3093">PermissionTree</a></b> 
</font> 
<A href="Javascript:openProblemRating(3093)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505690" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      38 / 170 (22.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      20 / 38 (52.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>alena</b> for 641.58 points (24 mins 18 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      458.93 (for 20 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>This problem, more than the others, demanded some measure of creativity in finding
a good solution, but still worked out nicely under a number of different approaches.</p> 

<p>One method is to search the tree and test each folder as being a possible home folder,
and from there continue to go deeper until no child folders would be valid.  While this is
certainly a legitimate approach, it is probably not the most efficient.</p>

<p>Another method is to find all folders that a given user can access.  Then, travelling the
tree back up to the root, we simply look for the first common ancestor of all such accessible
folders.  A simple implementation is to first assume the home folder will be -1.  Then, search
for a folder the user can access, and set that to the temporary home folder.  Then, continuing to
search the remaining folders, for each one the user can access, set the temporary home folder
to the common ancestor of itself and the newest found folder.  Continue for all remaining folders,
and your result is the home folder for that user.</p>

<p>Some common mistakes that caught coders by surprise were returning a home folder that was not
as deep as possible, and not properly determining if a user was in the user list for a folder.
Also, some coders had trouble properly handling the parent-child relationship of the root node, 
which was defined as it's own parent (so that the input would look consistent).</p>

<p>As of this writeup, the practice room already contained over a dozen good, varied solutions to
this problem.</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3057&amp;rd=5864" name="3057">Reconstruct</a></b> 
</font> 
<A href="Javascript:openProblemRating(3057)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505690" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      650 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      52 / 121 (42.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      24 / 52 (46.15%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>nicka81</b> for 531.93 points (14 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      335.33 (for 24 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p>In this problem, we sought to reconstruct an original set of Euclidian points in 3-space,
given a complete set of information about their Euclidian distances from each other.  We are
given that the first point is (0, 0, 0) and the second is well-enough defined that we can
return a unique set of points.</p> 

<p>The trick to this problem is use brute force to find possible locations of the second point,
then recurse for the next point, and so on.  The reason brute force is possible in time here is 
that with each successive point found, there are an increasing number of constraints (because there
are more other points to measure from) on what points are valid.  As such, the recursion avoids
ballooning, even with the brute force searching.</p>

<p>The failure condition in which no set can be reconstructed from the given data is determined
when all possible points have been tried to no avail, or at any point along the way when the
squared distance between two points is not a sum of three squares.</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=3069&amp;rd=5864" name="3069">WinningProbability</a></b> 
</font> 
<A href="Javascript:openProblemRating(3069)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505690" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      750 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 121 (6.61%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 8 (12.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gepa</b> for 281.82 points (68 mins 5 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      281.82 (for 1 correct submission) 
    </td> 
  </tr> 
</table></blockquote> 

<p>When only a single solution passes, that is usually an indication that a low-point-value problem
must be more difficult than meets the eye.  Ultimately, the biggest difficulty here was simply just
understanding what was required.  However, the first example did wonders to help clear this up.
In particular, a weighted average over all possible values of p is what we are after.</p> 

<p>So, how do we do that?  If you caught the scent and think this problem has an odor of calculus
about it, you are absolutely correct.  But, what do we want to integrate?  Well, actually we want
two integrals... the first is of:<br />
(Probability previous games turned out as they did) * (Probability of winning required games)<br />
And the second is just (Probability previous games turned out as they did)</p>

<p>Now, since each of these two calculated probabilities can [in theory, at least] be represented by a
polynomial (in particular, we'll need to employ binomial probability polynomials here) in p.  So, it
seems like computing the definite integral should be possible, and should guarantee an accurate result.
But, when we examine the constraints, and see that <b>prevWins</b> and <b>prevLosses</b> may each be
up to 100, we should immediately realize the magnitude of the binary polynomial coefficients we would
need to calculate.</p>

<p>Instead, a numerical approach may make more sense, and is arguably simpler to code.  To do this,
we simply divide the interval from 0 to 1 into many very small intervals, and approximate the integral
for each.  This is where things get troublesome once more, though, as we are constrained by accuracy.
In particular, integration by the trapezoid rule often fails due to precision errors, so instead
Simpson's rule should be used.</p>

<p>Once we calculate the two integrals, we simply divide to obtain our weighted average, and we thus have
our final result.</p>


<p>
<img src="/i/m/timmac_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="10407399" context="algorithm"/><br />
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
