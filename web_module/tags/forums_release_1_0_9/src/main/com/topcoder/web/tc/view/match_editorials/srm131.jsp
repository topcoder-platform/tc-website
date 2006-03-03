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
<tc-webtag:forumLink forumID="505557" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 131</span><br>Thursday, January 30, 2003
<br><br>

<span class="bigTitle">Match summary</span>

                                        <P>
                                            With the Collegiate Championship only a few weeks down the road,
                                            competition attendance is growing steadily.  Over 400 coders registered
                                            for SRM 131 including top ranked competitors Yarin, John Dethridge,
                                            SnapDragon, and ZorbaTHut.  Competition was fierce, with the top scoring
                                            spot changing hands multiple times in the coding, challenge, and system
                                            test phases.  In the end, Yarin prevailed with SnapDragon and John Dethridge
                                            close behind.
                                            <BR/>
                                            <BR/>
                                            As a departure from the standard types of problems used, this competition
                                            featured an assorted set of algorithmic solutions unlike those seen in
                                            previous competitions.  It is very exciting to see competitors struggle with
                                            problems that challenge their minds, forcing them to develop innovative
                                            techniques with little time to think.  For example, the division 1 hard
                                            problem required the efficient generation of minimum weight Steiner trees,
                                            a topic none of the top ranked coders seemed to have experience with.  It was
                                            this problem that ended up deciding who won SRM 131.
                                            <BR/>
                                        </P>

<H1> 
The Problems 
</H1> 
<font size="+2"><b>CSCourse</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505557" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-II, Level 1:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">250</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">252
                                                            /
                                                            264
                                                            (95.45%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">138
                                                            /
                                                            252
                                                            (54.76%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>stingant</b> for
                                                            245.21 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            In this problem, coders were asked to determine the final letter grade a
                                            student should receive given their exam scores, and the number of TopCoder
                                            competitions they competed in.  The intelligent Professor M. forces his
                                            students to compete in at least 3 competitions per semester.  Their final
                                            grade will fall a single letter if they compete in less than 3 competitions.
                                            To solve this problem one must add up the given scores and then account for
                                            the number of competitions.
                                        </p>

                                        <font size="+2"><b>SpellCheck</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505557" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-II, Level 2:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">500</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">196
                                                            /
                                                            264
                                                            (74.24%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">96
                                                            /
                                                            196
                                                            (48.98%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Karshikinpa</b> for
                                                            474.04 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            Here coders needed to implement the spelling rule: I before E except after C.
                                            To make things slightly more complicated, the I's, E's, and C's can be either
                                            capital or lowercase.  In addition, the rule must be continually applied until
                                            every place where E comes before I is removed unless after C.  For example,
                                            after a single application of this rule to the string "eeei" we end up with
                                            "eeie".  There is still an I before an E so we must apply the rule again
                                            producing "eiee".  Applying the rule a final time produces the string "ieee"
                                            and we are done.  Code to solve this problem basically consisted of swapping i's
                                            and e's until no more swaps could be made, is in the practice room under brett1479.
                                        </p>
                                        
                                        <font size="+2"><b> FloorTile</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505557" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-III, Level 3:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">1000</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">119
                                                            /
                                                            264
                                                            (45.08%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">103
                                                            /
                                                            119
                                                            (86.58%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>vipernky</b> for
                                                            996.22 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                            Used as: Division-I, Level 1:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">300</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">126
                                                            /
                                                            136
                                                            (92.65%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">109
                                                            /
                                                            126
                                                            (86.51%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Yi Zhang</b> for
                                                            298.28 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            Given a 2^k by 2^k square floor, you have been asked to lay down tiling
                                            covering the entire area incurring the smallest cost.  The two types of
                                            tiles at your disposal are: a 1 by 1 square tile, and a 2 by 2 tile with a
                                            1 by 1 square removed from one of its corners (an L-shaped tile).  The
                                            L-shaped tile may be flipped or rotated in any fashion.  In addition, both
                                            the small square shaped tiles, and the L-shaped tiles cost $1 to lay down.
                                            To solve this problem, one could theoretically try to brute-force every
                                            possible arrangement of tiles, but a simpler method is possible.  Consider
                                            the solution to the 2 by 2 square floor below.  Using a single L-shaped piece
                                            with a square piece costs a total of $2.  The key insight here is to realize
                                            that the 4x4 case can be produced by placing four of the 2x2 cases next to
                                            each other.  We can align the single squares in each of the four 2x2 components
                                            so that they lie in the middle of the resulting 4x4 block thus giving us the
                                            opportunity to use another L-shaped block.  In other words, when four of the
                                            2x2 diagrams are used to produce the 4x4 diagram 1, we aligned the B's to all
                                            occur in the middle.  In 4x4 diagram 2, three of these B's are replaced by the
                                            L-shaped E block.  Different letters have been used to illustrate the different
                                            blocks.  Furthermore, we can align four 4x4 blocks to produce a 16x16 block.
                                            4x4 diagram 3 shows how I have slightly changed the organization of diagram 2
                                            to place the single leftover square 'F' in the lower righthand corner allowing
                                            four diagram 3 blocks to be connected to form a 16x16 block analogously to how
                                            we generated the 4x4 block.
                                        </p>
                                        <pre>

2x2      4x4 (diagram 1)   4x4 (diagram 2)     4x4 (diagram 3)
 --        ----               ----                ----
|AB|      |AAAA|             |AABB|              |AABB|
|AA|      |ABBA|             |AEEB|              |AEEB|
 --       |ABBA|             |DEFC|              |DECC|
          |AAAA|             |DDCC|              |DDCF|
           ----               ----                ----
                                        </pre>
                                        <p>
                                            The moral of this story is, you never need to use more than a single square in
                                            any of the problem sizes.  Thus the answer can be calculated by finding the
                                            total area, dividing by 3, and then adding 1 for the remaining square block.
                                        </p>
                                        <font size="+2"><b>RedChart</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505557" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-I, Level 2:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">500</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">121
                                                            /
                                                            136
                                                            (88.97%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">73
                                                            /
                                                            121
                                                            (60.33%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>SnapDragon</b> for
                                                            480.25 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            In this problem, coders were asked to find the minimum size chart containing
                                            rating information for a bunch of "red" ranked TopCoder competitors.  If a
                                            coder is red for a period of time, the chart must contain a contiguous bar
                                            from the column designating the start of this period, to the column designating
                                            the end.  Since no overlap may occur, if multiple competitors are red
                                            simultaneously, multiple rows must be used.  Arranging these bars such that the
                                            fewest number of rows is used solves the problem.  To accomplish this, we sort
                                            the ranges by starting competition numbers and loop through them in ascending
                                            order.  When processing each item, if one of the rows we have already used is
                                            free we can place the bar in that row.  Otherwise we must allocate a new row.
                                        </p>
                                        <font size="+2"><b>ChipWire</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505557" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                            Used as: Division-I, Level 3:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">1000</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">24
                                                            /
                                                            136
                                                            (17.65%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">8
                                                            /
                                                            24
                                                            (33.33%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Yarin</b> for
                                                            777.13 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        <P> Reference Solution: brett1479 in the practice room</P>
                                        <h4>Implementation</h4>
                                        <p>
                                            In computer chips, wires usually must travel only horizontally and vertically
                                            between two points.  When trying to build a chip such that all parts on it are
                                            connected, many wires must often be used.  These parts and wires are often
                                            modeled by vertices and edges in a graph.  In order to produce a more efficient
                                            wiring scheme extra vertices, called Steiner points, may be added allowing for
                                            cheaper solutions.  To solve this problem, we realize that the only points that
                                            need be considered share x and y coordinates with the given points.  For example,
                                            if the points given are (5,5), (0,0) and (10,0) the x-coordinate of added points
                                            must be 0, 5, or 10, where as the y-coordinate must be 0 or 5.  Since the maximum
                                            number of input points is 5, the largest number of added points we have to consider
                                            is 25.  In addition, we will never need more than 5 added points to solve this
                                            problem, so we can check all subsets of these 25 elements up to 5 elements
                                            determining which set of added points produces the best answer.  Each time we
                                            want to check, we can run a minimum spanning tree algorithm such as Prim's
                                            algorithm.
                                        </p>

<p>
<img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
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
