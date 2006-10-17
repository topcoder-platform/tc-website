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

        <tc-webtag:forumLink forumID="506028" message="Discuss this match"/></div>
    <span class="bodySubtitle">TCHS SRM 6</span><br>Monday, July 10, 2006
    <br><br>

    <span class="bigTitle">Match summary</span>

    <p>

        The High Schools matches are heating up, with quite a lot of registrants and yet another match with a reasonably
        hard medium. It gave the choice for some competitors to skip the 600 to strike the hard.
    </p>

    <p>
        <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> started off strong -- with two quick submits on
        the easy and the medium, while he raced to finish the hard -- but when his medium failed the contest went to
        <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>. <tc-webtag:handle coderId="22375930"

                                                                                         context="hs_algorithm"/> ended
        second and <tc-webtag:handle coderId="21468741" context="hs_algorithm"/> came in third. The 600 and the 900
        point problems were brutal, and most coders ended up with fairly low success

        rates.
    </p>

    <H1>

        The Problems

    </H1>

</p>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6492&amp;rd=10058" name="6492">DigitalDisplay</a></b>

</font>

<A href="Javascript:openProblemRating(6492)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF=" http://forums.topcoder.com/?module=ThreadList&forumID=506028" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Level One: <blockquote>
    <table cellspacing="2">

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

                113 / 117 (96.58%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                77 / 113 (68.14%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>Zuza</b> for 247.10 points (3 mins 5 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                212.87 (for 77 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>
    For this problem, it was enough to generate all 6 permutations and check if the numbers were within the range
    specified by the question. Many lost a lot of time trying to rely upon the next_permutation to do

    this, without noting that it doesn't repeat identical permutations. Eventually they struggled to get it patched and
    working. <br>
    <pre>
        Alternatively a much simple approach exists:
        - If some was greater than 59, just return 0.
        - Count the number of numbers that fit within the 1-12 range. </pre>
</p>

<p>
    The answer was just twice this count, because the minutes and the seconds place were identical in bounds. So if a
    number could fit into minute's place, it could fit second's place as well. Hence counting how

    many numbers fit into hours would suffice, and the answer is just twice this.
    See <a href=" /tc?module=HSProblemSolution&amp;cr=11972352&amp;rd=10058&amp;pm=6492">
    <tc-webtag:handle coderId="11972352" context="hs_algorithm"/></a>'s solution for a clear implementation

    of this.
</p>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6495&amp;rd=10058" name="6495">WildCardMatch</a></b>

</font>

<A href="Javascript:openProblemRating(6495)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF=" http://forums.topcoder.com/?module=ThreadList&forumID=506028" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Level Two: <blockquote>
    <table cellspacing="2">

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Value</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                600

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Submission Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                69 / 117 (58.97%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                27 / 69 (39.13%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>jerzy.kozera</b> for 588.88 points (3 mins 55 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                457.09 (for 27 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>

    This problem involves dynamic programming. A closely related algorithm is
    <a href="http://en.wikipedia.org/wiki/Edit_distance">Edit Distance</a>, though the knowledge of that problem was not
    required here.

    <br>
    <pre>
        Let P be the pattern string and F be the file string.
        Let M(a,b) := minimal modifications of P[a... end] to match F[b ... end]

        if P[a] matches F[b] ( means P[a] can equal F[b] (or) F[b] is a '?' )
        then M(a,b) := M(a+1, b+1)
        otherwise
        M(a,b) := minimal of the following three:
        - Add a character which equals F[b], (one cost for adding the character)
        1 + M(a,b+1)
        - Remove the P[a]'th character, so that we look only into P[a+1 ... end] now.
        1 + M(a+1,b)
        - Modify P[a] to equal F[b], now we look only in P[a+1 .. end] and F[a+1 ... end]
        1 + M(a+1,b+1) </pre>
    See <a href=" /tc?module=HSProblemSolution&amp;cr=15600321&amp;rd=10058&amp;pm=6495">
    <tc-webtag:handle coderId="15600321" context="hs_algorithm"/></a>'s solution for a similar approach, but

    in reverse order. <br>

</p>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6490&amp;rd=10058" name="6490">BracketMaze</a></b>

</font>

<A href="Javascript:openProblemRating(6490)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF=" http://forums.topcoder.com/?module=ThreadList&forumID=506028" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Level Three: <blockquote>
    <table cellspacing="2">

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

                48 / 117 (41.03%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                17 / 48 (35.42%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>Burunduk3</b> for 776.65 points (11 mins 42 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                523.29 (for 17 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>
    Again this one involved dynamic programming. In such problems we aim to minimise the total number of states that
    come into picture. Suppose you are given a string, how will you find if its a valid paranthesized expression? <br>
    <br>
    Let x be the number of pending open parantheses, as you scan left to right through the string. When you encounter a
    '(', you increment x and when you see a ')', you decrement it.
    Expression is only valid if x is non-negative at every stage, and x was zero at the end. </p>

<p>
    Now let us move through the cube-space freely along the given directions. A cube point contains three parameters:
    (i,j,k). As we move we generate a string that needs to be valid. As noted above, adding one more parameter (x) is
    enough to assert this. So now the state-space becomes (i,j,k,x)<br>
    <br>
    The following pseudo-code describes the recurrence involved.</p>

<pre>
    P(i,j,k,x) // is the number of paths from co-ord (i,j,k) to (N,N,N). There are currently x opening paranthesis
    pending to be closed.
    {
    if( (i,j,k) out of grid ) return 0;

    if( (i,j,k) equals (N,N,N) ) {
    if( x == 0 ) return 1;
    else return 0;
    }

    // Process the current character
    if( Maze(i,j,k) == '(' ) ++x;
    if( Maze(i,j,k) == ')' ) --x;

    // has it gone invalid ?
    if( x <0 ) return 0;

    // take all three directions.
    return P(i+1,j,k,x) + P(i,j+1,k,x) + P(i,j,k+1,x);
    }
</pre>
All solutions used this approach. Once we got the recurrence we store it in a table, to make sure the same (i,j,k,x)
state is never calculated twice. See <a href="/tc?module=HSProblemSolution&amp;cr=21468741&amp;rd=10058&amp;pm=6490">
    <tc-webtag:handle coderId="21468741" context="hs_algorithm"/></a>'s solution for an implementation of this.
</p>

<div class="authorPhoto">
    <img src="/i/m/myprasanna_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="13366203" context="algorithm"/><br />
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
