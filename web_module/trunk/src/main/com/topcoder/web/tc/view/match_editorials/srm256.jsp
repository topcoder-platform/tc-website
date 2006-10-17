<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
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
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
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
<tc-webtag:forumLink forumID="505746" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 256</span><br>Tuesday, August 2, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
As SRM 256 started everyone was wondering the same thing: will the system crash
because 256 won't fit in a single byte, or will the 666 registrants bring bad
luck?  However, like Y2K, the alarm proved to be mostly unfounded, and the match
came off without a hitch.  In division 1, a number of coders were able to polish
off all three problems in less than half an hour.  However, with so many
submissions, there were lots of challenges to be had, and kalinov took
advantage, moving up 200 points, and taking first by a wide margin.
ivan_metelsky tried to get some, but in the end he netted 0 for the challenge
phase, and had to settle for second, followed closely by marek.cygan, who had no
challenges.  In division 2, coders had similarly high scores, as embe beat out
two new comes in second and third place: zig2 and Rounder.
</p>

<H1>The Problems</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4688&amp;rd=7992" name="4688">GridGenerator</a></b>
</font>

<A href="Javascript:openProblemRating(4688)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505746" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      348 / 377 (92.31%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      342 / 348 (98.28%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antiw</b> for 249.35 points (1 mins 27 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      208.45 (for 342 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

With the grid as small as it was, you just needed to follow the
instructions.  Initialize a 2-D integer array with the appropriate initial
values for the first row and column.  Then, you can just iterate over all other rows
and columns.  Of course, you have to calculate all the values in row i before
you calculate the values in row i+1, but the order of iteration that most coders
naturally use takes care of that.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4698&amp;rd=7992" name="4698">MagicCube</a></b>
</font>
<A href="Javascript:openProblemRating(4698)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505746" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      149 / 375 (39.73%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      121 / 149 (81.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>embe</b> for 527.05 points (5 mins 58 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      334.00 (for 121 correct submissions)
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
      232 / 256 (90.62%)
    </td>
  </tr>

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      207 / 232 (89.22%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>lovro</b> for 246.05 points (3 mins 36 secs)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      202.83 (for 207 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>

In all, there are 27 rows, columns and pillars -- 9 of each.  Each of them has
constant values for two of its coordinates, and the third coordinate varies from
0 to 2, inclusive.  So, a simple way to calculate the sums of all 27 is with two
nested loops:
<pre>
ptr = 0;
for(int i = 0; i&lt;3; i++){
    for(int j = 0; j&lt;3; j++){
        r[ptr++] = n[i][j][0]+n[i][j][1]+n[i][j][2];
        r[ptr++] = n[i][0][j]+n[i][1][j]+n[i][2][j];
        r[ptr++] = n[0][i][j]+n[1][i][j]+n[2][i][j];
    }
}
</pre>

That will give us all the sums, and we can easily find the difference between
the minimum sum and the maximum sum.  Next, we just need to consider swapping
some pair of elements.  This can be accomplished by just trying all pairs.
However, it would take a lot of ugly loops to do it after the input has been
converted to a 3D array.  Instead, it is easier to swap elements in the input, a
1D array, and then convert it to 3D to compute the sums as above.  

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4690&amp;rd=7992" name="4690">GraphLabel</a></b>
</font>
<A href="Javascript:openProblemRating(4690)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505746" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">

  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      950
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      83 / 377 (22.02%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      75 / 83 (90.36%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antiw</b> for 940.99 points (2 mins 47 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      639.13 (for 75 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
With at most 9 vertices, there are at most 9! = 362,880 different ways to assign
the labels to the vertices.  Once the labels are assigned, we need to find the
differences between the adjacent vertices, which takes N*(N-1)/2=36 operations.
Multiplying 9!*9*8/2 gives you 13,063,680, which is well within the limits of
what you can do in 2 seconds.  Now, convinced that a simple brute force solution
will not timeout, we just have to implement it.  One of the simplest ways to do
this is with a recursive function:
<pre>
    void recurse(bool[] used, int[] assigned, int cur){
        if(cur == N){
            <font color="blue">//I'm all done assigning</font>

            check(assigned);
        }else{
            for(int i = 0; i&lt;N; i++){
                if(!used[i]){
                    used[i] = true;
                    assigned[cur] = i+1;
                    recurse(used,assigned,cur+1);
                    used[i] = false;
                }
            }
        }
    }
</pre>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4687&amp;rd=7992" name="4687">CliqueCount</a></b>
</font>
<A href="Javascript:openProblemRating(4687)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505746" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      146 / 256 (57.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      107 / 146 (73.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>marek.cygan</b> for 425.37 points (6 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      296.27 (for 107 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
With at most 20 vertices, we can consider each of the 2<sup>20</sup> subsets of
them, and check if each one is a maximal clique.  There are a lot of different
ways to do this, but my favorite one uses no additional memory and is very fast,
as far as exponential algorithms go.  For each subset, it examines all of the
vertices.  If a vertex is in the subset, but it doesn't connect to all of the
other vertices in the subset, then the subset is not a clique (the first
<tt>continue out</tt> condition below).  If a vertex is not in the subset, but it
connects to all of the vertices in the subset, then the subset is not maximal
(the second <tt>continue out</tt> condition))

<pre>
    <font color="blue">//code written by brett1479</font>
    int N = graph.length, ne[] = new int[N], ret = 0;
    for (int i = 0; i &lt; N; i++) 
        for (int j = 0; j &lt; N; j++) 
            if (graph[i].charAt(j) == '1') ne[i] |= 1&lt;&lt;j;
out:    for (int i = 0; i &lt; (1&lt;&lt;N); i++) {
            for (int j = 0; j &lt; N; j++) {
                if ((i &amp; (1&lt;&lt;j)) != 0 &amp;&amp; (i &amp; ne[j]) != (i^(1&lt;&lt;j))) continue out;
                if ((i &amp; (1&lt;&lt;j)) == 0 &amp;&amp; (i &amp; ne[j]) == i) continue out;
            }
            ret++;
        } 
    return ret;

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4692&amp;rd=7992" name="4692">ImageRepeat</a></b>
</font>
<A href="Javascript:openProblemRating(4692)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505746" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      108 / 256 (42.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      42 / 108 (38.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ivan_metelsky</b> for 834.84 points (13 mins 11 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      606.01 (for 42 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
A naive solution to this problem would try all possible square sizes, and for
each size, it would compare all possible squares of that size between the two
images.  This would take roughly 8 billion operations though, in the worst case,
and would not run nearly in time.  As is often the case, you need to use dynamic
programming to make this problem run in time.<br/><br/>
Lets say you want to find the size of the largest repeated square subimage that
starts at position <tt>(i,j)</tt> of <b>imageA</b> and <tt>(i',j')</tt> of
<b>imageB</b>.  If the size of this is k, that means that there is a repeated
square subimage of at least size <tt>k-1</tt> starting at position <tt>(i+1,j+1)</tt> of

<b>imageA</b> and position <tt>(i'+1,j'+1)</tt> of <b>imageB</b>.  Similarly,
there are repeated square subimages at <tt>(i,j+1)</tt> and <tt>(i',j'+1)</tt>,
as well as <tt>(i+1,j)</tt> and <tt>(i'+1,j')</tt>.  In other words, the three
squares of size <tt>k-1</tt> that are in the square of size <tt>k</tt> and don't include the
corner at <tt>(i,j)</tt> and <tt>(i',j')</tt> are also repeated.<br/><br/>

From this observation, we can work the other way.  If there are repeated squares
of size <tt>k-1</tt> at <tt>(i+1,j)</tt> and <tt>(i'+1,j')</tt>, <tt>(i,j+1)</tt> and
<tt>(i',j'+1)</tt>, and <tt>(i+1,j+1)</tt> and <tt>(i'+1,j'+1)</tt>, and

<tt><b>imageA[i][j]</b> == <b>imageB[i'][j']</b></tt>, then there must be a
repeated square of size <tt>k</tt> between <tt>(i,j)</tt> and <tt>(i',j')</tt>.
Hence we can use dynamic programming to find the size of the largest repeated
square subimage for each quadruple: <tt>(i,j,i',j')</tt>.  The return is just
the maximum over all quadruples.  See warmingup's code for a clean, concise implementation of
this (bmerry's implementation is actually a bit simpler, but it has a fatal copy
paste error in it).<br/><br/>
There are a lot of other ways to solve this problem, and since the naive
approach is not that far beyond the limits of what is possible in 2 seconds,
many simple optimizations and prunings could make a variant of the naive solution run in time.

</p>

<div class="authorPhoto">
    <img src="/i/m/lbackstrom_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
