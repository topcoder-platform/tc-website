<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">
        <HTML>
            <HEAD>
                <xsl:call-template name="Preload"/>
                <TITLE>TopCoder :: Statistics</TITLE>
                <xsl:call-template name="CSS"/>
                <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
                <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
                <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
                <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
            </HEAD>
            <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
                <xsl:call-template name="Top"/>
                <!-- Body Begins -->
                <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
                    <TR>
                        <!-- Left Column Begins -->
                        <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
                            <!-- Left Column Include Begins -->
                            <!-- Global Seconday Nav Begins -->
                            <xsl:call-template name="global_left"/>
                            <!-- Global Seconday Nav Ends -->
                            <!-- Left Column Include Ends -->
                        </TD>
                        <!-- Left Column Ends -->
                        <!-- Gutter Begins -->
                        <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top">
                            <IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->

                        <!-- Body Area -->
                        <!-- Center Column Begins -->
                        <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
                            <xsl:call-template name="BodyTop">
                                <xsl:with-param name="image1">white</xsl:with-param>
                                <xsl:with-param name="image">statisticsw</xsl:with-param>
                                <xsl:with-param name="title">&#160;TC Last Match Editorials</xsl:with-param>
                            </xsl:call-template>
                            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
                                <TR>
                                    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
                                        <BR/>
                                        <!--body contextual links-->
                                        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
                                            <TR>
                                                <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top">
                                                    <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top">
                                                    <IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
                                                <TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
                                            </TR>
                                            <TR>
                                                <TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
                                                    <TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
                                                        <TR>
                                                            <!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC">
                                                                <A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyGeneric">&#160;Archive&#160;</A>
                                                            </TD>
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC">
                                                                <A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A>
                                                            </TD>
                                                        </TR>
                                                    </TABLE>
                                                </TD>
                                            </TR>
                                        </TABLE>
                                        <!--end contextual links-->
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/>
                                        <BR/>
                                        <!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
                                        <B>Single Round Match 131</B>
                                        <BR/>
                                        Thursday, January 30, 2003
                                        <P>
                                            <B>Problem Set Analysis &amp; Opinion</B>
                                        </P>
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
                                            <BR/>
                                            The writer for this SRM, pmadden, is a Professor of Computer Science at
                                            Binghamton University.  In addition to making TopCoder competitions mandatory
                                            homework for his undergraduate algorithms course, he has created a TopCoder
                                            independent study program allowing students to discuss their problem solutions
                                            in an open forum.  Professor Madden maintains that TopCoder both sharpens his
                                            students' coding abilities, and lets them know who they are going up against in
                                            the real world.
                                        </P>
                                        <a name="CSCourse"></a>
                                        <font size="+2">
                                            <b>CSCourse</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
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
                                        </font>
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

                                        <p>&#160;</p>
                                        <a name="SpellCheck"></a>
                                        <font size="+2">
                                            <b>SpellCheck</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
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
                                        </font>
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
                                        <p>&#160;</p>
                                        <a name=" FloorTile"></a>
                                        <font size="+2">
                                            <b> FloorTile</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
                                            Used as: Division-II, Level 3:
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
                                        </font>
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
                                               2x2      4x4 (diagram 1)   4x4 (diagram 2)     4x4 (diagram 3)
                                                --        ----               ----                ----
                                               |AB|      |AAAA|             |AABB|              |AABB|
                                               |AA|      |ABBA|             |AEEB|              |AEEB|
                                                --       |ABBA|             |DEFC|              |DECC|
                                                         |AAAA|             |DDCC|              |DDCF|
                                                          ----               ----                ----
                                            The moral of this story is, you never need to use more than a single square in
                                            any of the problem sizes.  Thus the answer can be calculated by finding the
                                            total area, dividing by 3, and then adding 1 for the remaining square block.
                                        </p>
                                        <p>&#160;</p>
                                        <font size="-1">
                                            Used as: Division-I, Level 1:
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
                                                        <td style="background: #eee;" class="bodyText">82
                                                            /
                                                            89
                                                            (92.13%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">73
                                                            /
                                                            82
                                                            (89.02%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>John Dethridge</b> for
                                                            244.78 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <h4>Implementation</h4>
                                        <p>
                                            The first step is to precompute all of the relevant primes.  The largest prime that will be useful will be the
                                            largest prime that is smaller than the upper bound of our input, which is
                                            <tt>2000</tt>.  A simple algorithm
                                            for computing primes is
                                            <tt>O(n
                                                <sup>2</sup>)
                                            </tt>, which is sufficient for computing primes in the range of
                                            <tt>2..2000</tt>.  One such method, which is very easy to implement, is known as the
                                            <a href="http://planetmath.org/encyclopedia/SieveOfEratosthenes.html" class="bodyText" target="_blank">sieve of Eratosthenes</a>.  See the
                                            preceding link for a description of this method.
                                        </p>
                                        <p>
                                            Once the primes are known, we can then iterate through all pairs of primes whose sum is less than the input value.
                                            Whenever we have selected two primes, we can check if the difference between the input value and the sum of the two primes
                                            is also prime.  If so, we have a possible solution.  We compare this to our best solution so far by looking at the product
                                            of the three primes, and if it is better we save it.
                                        </p>
                                        <p>&#160;</p>
                                        <a name="Proleolytic"></a>
                                        <font size="+2">
                                            <b>Proleolytic</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
                                            Used as: Division-I, Level 2:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">450</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">58
                                                            /
                                                            89
                                                            (65.17%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">42
                                                            /
                                                            58
                                                            (72.41%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>vorthys</b> for
                                                            411.34 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <h4>Implementation</h4>
                                        <p>
                                            The solution to this problem is a depth-first traversal of all the ways in which the protein can be
                                            split up by the available enzymes.  Thus a typical implementation will define a recursive function
                                            that takes a portion of the protein, applies every possible enzyme and,
                                            for each enzyme, recursively calls itself on each of the fragments of protein that result from the
                                            splitting.
                                        </p>
                                        <p>
                                            The splitting can be done by walking the string.  Initialize a variable
                                            <tt>begin</tt> to 0, representing
                                            the index
                                            <i>after</i> the last character of the previous split.  Thus, the first character of the next
                                            protein fragment will always be at index
                                            <tt>begin</tt>.  Then iterate through the protein.  For each
                                            character we encounter that is in the enzyme we are applying, we split the string.  We get a protein
                                            fragment by taking the substring from
                                            <tt>begin</tt> to the current index (not including the character
                                            at the current index).  We add this fragment to the set of fragments we've generated, then recursively
                                            split it up with all possible enzymes as well.  Then we move on to the next index, setting
                                            <tt>begin</tt> to the
                                            value of that index.
                                        </p>
                                        <p>
                                            For each recursive call to the splitting function, we do the above for each enzyme.  When the top-level
                                            call to this recursive function finally returns, we will have built a set containing all the possible
                                            protein fragments that could be generated with the given enzymes, and return its size.  Note that if
                                            you maintain this set in such a way that the original protein gets added, you should subtract one from
                                            the size.
                                        </p>
                                        <p>&#160;</p>
                                        <a name="GPS"></a>
                                        <font size="+2">
                                            <b>GPS</b>
                                        </font>
                                        <br/>
                                        <font size="-1">
                                            Used as: Division-I, Level 3:
                                            <blockquote>
                                                <table cellspacing="2">
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Value</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">1050</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Submission Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">17
                                                            /
                                                            89
                                                            (19.1%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>Success Rate</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">7
                                                            /
                                                            17
                                                            (41.18%)
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>High Score</b>
                                                        </td>
                                                        <td style="background: #eee;" class="bodyText">
                                                            <b>John Dethridge</b> for
                                                            751.92 points
                                                        </td>
                                                    </tr>
                                                </table>
                                            </blockquote>
                                        </font>
                                        <h4>Implementation</h4>
                                        <p>
                                            This problem can be reduced to finding the shortest path between a vertex and a set of vertices
                                            in a graph.  In this graph, the intersections, the location of the caller, and the locations of
                                            ambulances are vertices.  Each of these vertices can be represented as the road(s) they are on
                                            and their location along these roads.  From this information the edges can be derived, as any
                                            vertices that share a road are directly connected, and the weight of this edge can be determined
                                            by the difference between their locations on the common road and the speed limit on that road.
                                        </p>
                                        <p>
                                            Once we build this graph, we can approach the shortest path problem in several ways.  This particular
                                            problem is known as the single source shortest paths (SSSP) problem, because it is solved by finding the
                                            shortest paths to all vertices from a single source vertex (contrast this with the all pairs
                                            shortest paths problem, which comes up more often in these contests).  A very well-known algorithm
                                            for solving the SSSP problem is
                                            <a href="http://ciips.ee.uwa.edu.au/~morris/Year2/PLDS210/dijkstra.html" class="bodyText" target="_blank">Dijkstra's algorithm</a>,
                                            explained in the preceding link.
                                        </p>
                                        <p>
                                            Clearly the hardest part to this problem is building the graph from the input.  The rest has been solved
                                            by most programmers many times before.  To find road intersections, we iterate through all pairs of roads.
                                            For each pair, we can only have an intersection if one road is horizontal and the other is vertical.  If
                                            the pair meets this requirement, we look at the horizontal road and see if the
                                            <i>y</i> component of its
                                            two endpoints lies between the
                                            <i>y</i> components of the vertical road's endpoints.  If this is the case,
                                            we then look at the vertical road and see if the
                                            <i>x</i> component of its two endpoints lies between the
                                            <i>x</i> components of the horizontal road's endpoints.  If these conditions are met, then these roads intersect
                                            at the
                                            <i>x</i> component of the vertical road and the
                                            <i>y</i> component of the horizontal road.
                                        </p>
                                        <p>
                                            After we find all intersections, we have to deal with the ambulances.  Some are located at intersections; for these
                                            we don't have to build a new vertex, but can simply mark an existing intersection vertex as a target.  Ambulances
                                            not located at intersections require a new vertex to be built using the road the ambulance is on and its location
                                            along that road.  In either case we have to iterate through all the roads to find the one or two roads that the
                                            ambulance is on.  This requires math similar to that used to determine if roads intersect (you could think of an ambulance
                                            as both a horizontal and vertical road of zero length).
                                        </p>
                                        <p>&#160;</p>

                                        <IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;Logan
                                        <BR/>
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR/>
                                            <A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A>
                                        </DIV>
                                        <BR CLEAR="all"/>
                                        <P>
                                            <BR/>
                                        </P>
                                    </TD>
                                    <TD VALIGN="top" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" WIDTH="75">
                                        <IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14">
                                        <IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                            </TABLE>
                        </TD>
                        <!-- Center Column Ends -->
                        <!-- Body Area Ends -->

                        <!-- Gutter -->
                        <TD WIDTH="4" BGCOLOR="#FFFFFF">
                            <IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->
                        <!-- Right Column Begins -->
                        <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top">
                            <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/>
                            <BR/>
                            <!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
                            <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
                            <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
                            <!-- Right Column Include Begins -->
                            <xsl:call-template name="public_right_col"/>
                            <!-- Right Column Include Ends -->
                        </TD>
                        <!-- Right Column Ends -->
                        <!-- Gutter -->
                        <TD WIDTH="10" BGCOLOR="#FFFFFF">
                            <IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->
                    </TR>
                </TABLE>
                <!-- Body Ends -->
                <xsl:call-template name="Foot"/>
            </BODY>
        </HTML>
    </xsl:template>
</xsl:stylesheet>
