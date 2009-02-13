<%@ page language="java" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Statistics</title>

    <jsp:include page="../../script.jsp"/>
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180" id="onLeft">
    <jsp:include page="../../includes/global_left.jsp">
        <jsp:param name="node" value="hs_match_editorials"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="high_school"/>
    <jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>

    <tc-webtag:forumLink forumID="506029" message="Discuss this match"/></div>
<span class="bodySubtitle">TCHS SRM 7</span><br>Monday, July 17, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>One hundred thirty coders participated in the TopCoder High
    School SRM 7. <tc-webtag:handle coderId="11972352"
                                    context="hs_algorithm"/> put on an impressive performance, getting
    the fastest times on all three problems,
    and leading the contest
    from start to finish. <tc-webtag:handle coderId="22375930"
                                            context="hs_algorithm"/> was a close second, followed by
    twelve other coders who solved all three problems correctly.
    Congratulations to all of the participants.</p>

<p>The first two problems turned out to be relatively
    straightforward, with the majority of the coders
    solving both. The third problem was a little trickier and
    required some thought as to how to make the program run within
    the time limits.</p>

<h1>The Problems </h1>

<p><a href="/stat?c=problem_statement&amp;pm=6002&amp;rd=10059"
      name="6002"><font size="5"><b>TextProcessor</b></font></a><font
        size="5"></font><a href="Javascript:openProblemRating(6002)"><img
        src="/i/rate_it.gif" alt="rate it" border="0" hspace="10"/></a> <a
        href="http://forums.topcoder.com/?module=ThreadList&forumID=506029"
        class="statText"><img src="/i/interface/btn_discuss_it.gif"
                              alt="discuss it" border="0"/></a> <br>
    Used as: Division One - Level One: </p>

<blockquote>
    <table border="0">
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Value</b>
            </td>
            <td class="bodyText" style="background: #eee;">250 </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Submission
                Rate</b></td>
            <td class="bodyText" style="background: #eee;">124 /
                130 (95.38%) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Success
                Rate</b></td>
            <td class="bodyText" style="background: #eee;">119 /
                124 (95.97%) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>High
                Score</b></td>
            <td class="bodyText" style="background: #eee;"><b>Zuza</b>
                for 249.63 points (1 mins 5 secs) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Average
                Score</b></td>
            <td class="bodyText" style="background: #eee;">226.04
                (for 119 correct submissions) </td>
        </tr>
    </table>
</blockquote>

<p>This problem asks you to take a String and<br>
    1. Remove all of the non-letter characters (i.e., digits and
    spaces)<br>
    2. Convert the letters to lowercase<br>
    3. Sort the letters<br>
    <br>
    Here is <tc-webtag:handle coderId="12005484"
                              context="hs_algorithm"/>'s code (C++), which is nice and short:</p>

<pre>
    string ret;
    for( int i=0; i &lt; (int)text.size(); ++i )
    if( isalpha( text[i] ) )
    ret += tolower( text[i] );
    sort( ret.begin(), ret.end() );
    return ret;
</pre>

<p>An alternative to calling a sorting routine is to keep track
    of the frequency of each letter (after converting the String to
    lowercase) and then loop from 'a' to 'z', printing each letter
    however many times it appears in the input. See <a
        href="/tc?module=HSProblemSolution&amp;cr=22627711&amp;rd=10059&amp;pm=6002">duachuotbeo's
    solution</a> for this approach.</p>

<p>&nbsp;</p>

<p><a href="/stat?c=problem_statement&amp;pm=5997&amp;rd=10059"
      name="5997"><font size="5"><b>StraightArray</b></font></a><font
        size="5"></font><a href="Javascript:openProblemRating(5997)"><img
        src="/i/rate_it.gif" alt="rate it" border="0" hspace="10"/></a> <a
        href="http://forums.topcoder.com/?module=ThreadList&forumID=506029"
        class="statText"><img src="/i/interface/btn_discuss_it.gif"
                              alt="discuss it" border="0"/></a> <br>
    Used as: Division One - Level Two: </p>

<blockquote>
    <table border="0">
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Value</b>
            </td>
            <td class="bodyText" style="background: #eee;">500 </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Submission
                Rate</b></td>
            <td class="bodyText" style="background: #eee;">110 /
                130 (84.62%) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Success
                Rate</b></td>
            <td class="bodyText" style="background: #eee;">95 /
                110 (86.36%) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>High
                Score</b></td>
            <td class="bodyText" style="background: #eee;"><b>Zuza</b>
                for 497.65 points (1 mins 57 secs) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Average
                Score</b></td>
            <td class="bodyText" style="background: #eee;">391.64
                (for 95 correct submissions) </td>
        </tr>
    </table>
</blockquote>

<p>This problem was inspired by the game of poker, where a
    straight is five cards of sequential rank. For this problem, we
    want to find an integer N such that the five numbers (N, N+1,
    N+2, N+3, N+4) contains the most numbers from the input. From
    that, we would be able to figure out
    the minimum number of integers that we need to add
    to the given array to make it a straight. One observation is that
    we only need to consider integers N where N is from the input.
    The reason is that we can keep &quot;shifting&quot; the straight
    to the right (i.e., increase it by one) until the first number
    comes from the input, and we lose nothing by this process. Since
    the input is limited to fifty numbers, this approach is feasible.
    Nearly all of the coders went with this approach or something similar.
    Pseudocode follows:</p>

<pre>
    int best = 0;
    for each int x from the input
    int count = the number of ints from the input that appear in (x,
    x+1, x+2, x+3, x+4)
    if (count &gt; best) best = count;
    return 5-best;</pre>

<p>&nbsp;</p>

<p><a href="/stat?c=problem_statement&amp;pm=5995&amp;rd=10059"
      name="5995"><font size="5"><b>EnclosingRectangle</b></font></a><font
        size="5"></font><a href="Javascript:openProblemRating(5995)"><img
        src="/i/rate_it.gif" alt="rate it" border="0" hspace="10"/></a> <a
        href="http://forums.topcoder.com/?module=ThreadList&forumID=506029"
        class="statText"><img src="/i/interface/btn_discuss_it.gif"
                              alt="discuss it" border="0"/></a> <br>
    Used as: Division One - Level Three: </p>

<blockquote>
    <table border="0">
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Value</b>
            </td>
            <td class="bodyText" style="background: #eee;">1000 </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Submission
                Rate</b></td>
            <td class="bodyText" style="background: #eee;">36 /
                130 (27.69%) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Success
                Rate</b></td>
            <td class="bodyText" style="background: #eee;">14 /
                36 (38.89%) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>High
                Score</b></td>
            <td class="bodyText" style="background: #eee;"><b>Zuza</b>
                for 781.49 points (15 mins 59 secs) </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;"><b>Average
                Score</b></td>
            <td class="bodyText" style="background: #eee;">536.45
                (for 14 correct submissions) </td>
        </tr>
    </table>
</blockquote>

<p>This problem had an unconventional input format because we
    wanted to be able to have one hundred points in the input.
    (Apparently, you can only pass in up to fifty ints in a TopCoder
    problem.) So the first step is to convert the input from Strings
    to integer points. </p>

<p>A key observation is that we only need to consider certain
    coordinates for the corners of the rectangle. The x-coordinate of
    the left edge of the smallest rectangle must be one less than the
    x-coordinate of one of the given points. Why is that? If it was
    not the case, we could move the left edge of the rectangle to the
    right by one unit. The new rectangle would contain the same
    number of points but have less area, contradicting the claim that
    it was the smallest rectangle. Similarly, the x-coordinate of the
    right edge must be one more than the x-coordinate of one of the
    given points; the y-coordinate of the top edge must be one more
    than the y-coordinate of one of the given points (this assumes
    that the y-coordinate increases from bottom to top); and the
    y-coordinate of the bottom edge must be one less than the
    y-coordinate of one of the given points.</p>

<p>If we let N be the number of points in the input, then we see
    that there are up to N<sup>4</sup> rectangles to try out. For
    each rectangle, we count how many points lie in the interior. If
    that number is at least N/2, then we calculate the area of the
    rectangle, see if it is the smallest one we have seen so far, and
    update the smallest-area variable if necessary. A straightforward
    way to count the number of points inside a rectangle is to loop
    over all N points and compare the coordinates. This would yield
    an overall solution running in O(N<sup>5</sup>) time, which would
    time out for N=100. (It was our intention to not have O(N<sup>5</sup>)
    solutions pass, and force the coder to find an optimization.)


    <p>There are probably many ways to optimize this O(N<sup>5</sup>)
        solution, and let me describe one of them. The idea of this
        optimization belongs to <tc-webtag:handle coderId="251317"/>. First, sort the x-coordinates
        of the given points and call them
        x<sub>0</sub>, x<sub>1</sub>, ..., x<sub>m</sub>.
        Next, sort the y-coordinates of the given points and
        call them y<sub>0</sub>,
        y<sub>1</sub>, ..., y<sub>n</sub>. We keep a two-dimensional int
        array called cnts, where cnts[i][j] denotes the number of points
        on or inside the rectangle with corners at (0,0) and (x<sub>i</sub>,
        y<sub>j</sub>). This array can be computed in O(N<sup>3</sup>)
        time by brute force. Then the number of points on or inside the
        rectangle with corners (x<sub>a</sub>, y<sub>c</sub>) and (x<sub>b</sub>,
        y<sub>d</sub>), where a&lt;b and c&lt;d, is</p>

    <p>cnts[b][d] - cnts[b][c-1] - cnts[a-1][d] + cnts[a-1][c-1].</p>

    <p>This value can be computed
        in constant time, thanks to the O(N<sup>3</sup>)
        precomputation of cnts. Thus, we have reduced the running time of
        the solution to O(N<sup>4</sup>), which runs within the time
        limits when N=100.</p>

<%--
<div class="authorPhoto">
    <img src="/i/m/sql_lall_big.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="159100" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>

</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170" id="onRight">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="tchs"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
