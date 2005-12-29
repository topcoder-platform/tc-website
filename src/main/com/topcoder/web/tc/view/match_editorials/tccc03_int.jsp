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
<tc-webtag:forumLink forumID="505564" message="Discuss this match" /></div>
<span class="bodySubtitle">2003 TopCoder Collegiate Challenge<br> Round 1 - International</span><br>Saturday, February 22, 2003
<br><br>

<span class="bigTitle">Summary</span>

<p>
            The most notable aspect of this round was the Level 2 problem, which was solved by only four coders.
            This lead to a lot of successful challenges by coders such as <b>John Dethridge</b>.  The
            The Level 1 and Level 3 problems had very high success rates among those that submitted the problems,
            but only 14 coders managed to submit a possible solution for the Level 3 problem.
</p>

<h1>The Problems</h1>

<a name="Pareto"></a><font size="+2"><b>Pareto</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505564" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Level 1
            :<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">250</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">84
    /
    102
    (82.35%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">78
    /
    84
    (92.86%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>lars</b> for
                    232.90 points
                </td>
</tr>
</table></blockquote>
<h4>Implementation</h4>
<p>
                This problem can be solved by iterating over all pairs of outcomes.  For each pair of outcomes <i>A</i> and <i>B</i>,
                one of the following will be true: <i>A</i> may be suboptimal to <i>B</i>; <i>B</i> may be suboptimal to <i>A</i>;
                or neither may be suboptimal to the other.  In the first two cases, we can eliminate one of the outcomes as a
                candidate for being a Pareto optimum.
            </p>
<p>
                We can do this with two nested loops.  The outer loop iterates over all outcomes.  The inner loop also iterates
                over all outcomes.  If the outer outcome is not suboptimal to any of the inner outcomes, we know that it is a
                Pareto optimum and increase a counter.  We return this counter after iterating over all pairs in this fashion.
            </p>
<p>&#160;</p>
<a name="Coherence"></a><font size="+2"><b>Coherence</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505564" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Level 2
            :<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">500</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">59
    /
    102
    (57.84%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">4
    /
    59
    (6.78%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>haha</b> for
                    406.84 points
                </td>
</tr>
</table></blockquote>
<h4>Implementation</h4>
<p>
                Very few people were able to get this problem, yet the solution is almost embarrassingly simple.  The first step
                should be to compare the number of foreground pixels to the number of background pixels.  We will get very bogus results
                if there are more foreground pixels than background pixels, and it is this sort of test case that broke a great many
                submissions.  The simple fix is to simply invert the colors if there are more foreground pixels than background pixels.
                This can be as simple as <tt>n &lt;?= w * h - n</tt> in C++.
            </p>
<p>
                There are three possible ways to optimally layout the pixels.  The first is to fill rows in the image with the
                foreground color, until there are not enough pixels left to fill a row (in which case you fill as much of the
                row as possible, aligned to the left).  The second is to fill columns in the exact same fashion.  The third is
                to fill in a rectangle that shares two sides with adjacent borders of the image (i.e., a corner).
            </p>
<p>
                For each of the first two methods, there is only one optimal count.  The number of boundaries will be the width (height)
                of the image, plus an additional boundary if we have an incompletely filled row (column).  For the third method, we
                need to iterate through all possible rectangle sizes.  For each rectangle, the number of boundaries will be at least the
                height of the rectangle plus its width.  This is true even for rectangles that cannot be completely filled.  Only
                rectangles where every column (row) except for one is filled will be optimal, and in such cases the boundary count works
                out the same as for the fully filled rectangle; for each pixel that is removed, two previously unexposed boundaries
                become exposed, while two previously exposed boundaries become internal to the background.
            </p>
<p>
                So to solve the problem, we compute the number of boundaries that we would get if we fill in each of the first two
                fashions, and remember only the minimum.  Then we iterate through every possible rectangle size that would fit in
                the image and be large enough to hold the number of pixels we need, and remember the minimum between our previous
                minimum and the sum of the dimensions of the rectangle.  After all this we return the minimum value.
            </p>
<p>&#160;</p>
<a name="Wireless"></a><font size="+2"><b>Wireless</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505564" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Level 2
            :<blockquote><table cellspacing="2">
<tr>
<td style="background: #eee;" class="bodyText"><b>Value</b></td>
<td style="background: #eee;" class="bodyText">1000</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
<td style="background: #eee;" class="bodyText">14
    /
    102
    (13.72%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
<td style="background: #eee;" class="bodyText">12
    /
    14
    (85.71%)
</td>
</tr>
<tr>
<td style="background: #eee;" class="bodyText"><b>High Score</b></td>
<td style="background: #eee;" class="bodyText">
<b>John Dethridge</b> for
                    837.02 points
                </td>
</tr>
</table></blockquote>
<h4>Implementation</h4>
<p>
                We start out with a 2048-element boolean array (initialized all to <tt>false</tt>) to indicate whether any particular
                angle is protected.  Next we need to define a function that translates an angle name (e.g. &quot;NENE&quot;) to an index into
                this array.
            </p>
<p>
                One way to do this is to precompute all the mappings between angle names and indices.  To do this we will define a
                function that takes an angle name, its index, the index of its nearest neighbors of the same name length, and recursively
                generates the indices for all angles that have that name as a suffix in their own names.
                We would call this function four times at the top level, once for each cardinal direction.  For instance, to generate
                all angle names that end with <tt>&quot;N&quot;</tt>, we will start with <tt>name = &quot;N&quot;</tt>, <tt>id = 512</tt>, <tt>prev = 0</tt>,
                and <tt>next = 1024</tt>.  In the definition of this function, we simply determine the two characters that we can add
                to the beginning of the angle name to make new valid angles and recurse on these new angles.  The two characters can
                be determined by looking at the index.  Indices in the range <tt>1-511</tt> can be modified by either <tt>N</tt>
                (an increase in angle) or <tt>E</tt> (a decrease).  Indices in the range <tt>513-1023</tt> are modified by either <tt>W</tt>
                (increase) or <tt>N</tt> (decrease).  Indices in the range <tt>1025-1535</tt> are modified by either <tt>S</tt> (increase)
                or <tt>W</tt> (decrease).  And indices in the range <tt>1537-2047</tt> are modified by either <tt>E</tt> (increase) or
                <tt>S</tt> (decrease).  The indices of <tt>0</tt>, <tt>512</tt>, <tt>1024</tt>, and <tt>1536</tt> -- corresponding
                to the four cardinal directions -- have their own modifiers, which are easy to determine.  We will need a two-way
                mapping for returning the angle name when we're done.
            </p>
<p>
                Once we've generated a mapping of angle name to index, the rest of the problem is easy.  For each wall description, we
                iterate from the index of the first angle to the index of the second angle (being careful to wrap around properly
                when necessary) and mark the angles covered by this range as protected (both endpoints being included).  Once we have
                done this for all walls, we then find the smallest index that is unprotected, and then return the name associated with
                that index.
            </p>
<p>&#160;</p>

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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
