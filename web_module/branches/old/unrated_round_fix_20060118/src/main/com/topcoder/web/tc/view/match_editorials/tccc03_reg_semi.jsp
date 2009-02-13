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
<tc-webtag:forumLink forumID="505567" message="Discuss this match" /></div>
<span class="bodySubtitle">2003 TopCoder Collegiate Challenge <br> Regional SemiFinals</span><BR/>Wednesday, March 5, 2003
<br><br>

<span class="bigTitle">Summary</span>

                                        <p>
                                            The regional semifinals caused some huge upsets when top seeded <b>John Dethridge</b> was knocked out,
                                            together with other high ranked coders such as <b>reid</b> and <b>malpt</b> (<b>reid</b> did not show
                                            up at all). The cutoffs for the different regions differed quite a lot; <b>John Dethridge</b> would
                                            for instance have qualified had he competed in any other region. Top scorers were <b>bigg_nate</b>
                                            and <b>Yarin</b>. The problem set was arguably one of the better in this CC, with a mix of math,
                                            dynamic programming and geometry.
                                        </p>

<H1> The Problems </H1> 

                                        <font size="+2"><b>Ordered</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505567" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                        Used as: Level 1:

                                        <blockquote>
                                        <table cellspacing="2">
                                        <tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">200</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">127 / 129  (98.45%) </td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">111 / 127  (87.40%)</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>bigg_nate</b> for 193.50 points</td></tr>
                                        </table>
                                        </blockquote>

                                        <p>Reference implementation: <b>Yarin</b> <i>(room 2)</i></p>

                                        <h4>Implementation</h4>

                                        <p>
                                            I suspect an easy (200 pts) first problem was selected just to make sure all regional finals would have
                                            10 competitors... Still, the problem had some pitfalls, the major one being <b>spelling errors</b>, even
                                            though the notes warned about that.
                                        </p>

                                        <p>
                                            Given a sequence of numbers, we should deduce if it's strictly increasing, strictly decreasing, non-decreasing
                                            or non-increasing (which I believe are the proper terms). To check the first two cases, just make sure every
                                            value is greater (smaller) than the previous value. If this is not the case, set a flag. We do the same for
                                            the other two cases, but instead check that every value is greater-or-equal (smaller-or-equal) to the
                                            previous value.
                                        </p>

                                        <p>
                                            Depending on the results, we should either append the mean of the values (reduced fraction, so we need to
                                            use GCD) to the result string or the frequency of the most common element. It could also be that none of
                                            the four types of sequences applied, in which case we simply returned "NOTHING".
                                        </p>

                                        <font size="+2"><b>GreedyChange</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505567" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                        Used as: Level 2:

                                        <blockquote>
                                        <table cellspacing="2">
                                        <tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">500</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">73 / 129  (56.59%) </td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">46 / 73  (63.01%)</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>bigg_nate</b> for 444.78 points</td></tr>
                                        </table>
                                        </blockquote>

                                        <p>Reference implementation: <b>bigg_nate</b> <i>(room 13)</i></p>

                                        <h4>Implementation</h4>

                                        <p>
                                            This is a typical DP (dynamic programming) problem. It consists of two parts - first we calculate the
                                            optimal way of handing back coins for all values up to a limit. Then for each such value we compare
                                            with the greedy method. If the greedy method is worse than the optimal, we return this value. Otherwise
                                            we keep going until we hit the limit (see below), and once we hit it, we return -1.
                                        </p>

                                        <p>
                                            To calculate the optimal way of handing back coins, we use induction. Assume we know the fewest coins
                                            possible for all integers <i>x</i>&lt;<i>k</i> (this value is stored in a big array, opt[], where
                                            opt[<i>x</i>] = the fewest coins possible when the value is <i>x</i>). Now we should calculate the
                                            fewest coins possible when the value is <i>k</i>. The idea is that for any value <i>k</i>&gt;0, we
                                            must first give back one coin. After that, the remaining value is less than <i>k</i>, and for that
                                            value we already know the fewest coins possible (by induction). So, we loop through all
                                            denominations (call them d[<i>i</i>]), check opt[<i>k</i>-d[<i>i</i>]], and pick the minimum of
                                            these values. Thus,
                                        </p>

                                        <pre>opt[k]: for all denominations d[i]: min(opt[k-d[i]])+1</pre>

                                        <p>
                                            For the greedy approach, we can use induction again. Assume we know that the greedy method equals the
                                            optimal method for all integers <i>x</i>&lt;<i>k</i>. That is, opt[<i>x</i>]==greedy[<i>x</i>]. Now,
                                            in order for greedy to work on the value <i>k</i>, opt[<i>k</i>-<i>d_max</i>]+1 must equal opt[<i>k</i>],
                                            where <i>d_max</i> is the highest denomination less than or equal to <i>k</i>. The reason for this is
                                            that this is the coin we will hand back first; after that we know by induction that greedy works for
                                            the value <i>k</i>-<i>d_max</i>, so the number of coins that we hand back by this method is
                                            opt[<i>k</i>-<i>d_max</i>]+1.
                                        </p>

                                        <p>
                                            In order for the program to run in time, we need a quick way to find out the largest coin less than or
                                            equal to the current value. This can be solved nicely by first sorting the coins, and then as we loop
                                            through the values, we keep updating which coin is currently the largest less than or equal to the
                                            value - the reference implementation handles this nicely.
                                        </p>

                                        <p>
                                            This is all fairly standard stuff. What maybe made this problem slightly harder is to figure out how
                                            long you should search before deducting that greedy works on all values. I believe most people
                                            simply guessed (I know I did), with the hint from the last example case, that if greedy worked
                                            for all values up to 2<i>N</i> (where <i>N</i> was the largest denomination), it worked for all
                                            values. Below follows a proof that this is actually the case:
                                        </p>

                                        <ul>
                                        <p>
                                            Assume greedy works for all numbers less than <i>k</i>, <i>k</i>&gt;2<i>N</i>, where <i>N</i> is the
                                            largest coin. We will now prove that greedy works for <i>k</i> as well. By assumption, we have
                                            the true recurrence that opt[<i>k</i>]=min(opt[<i>k</i>-<i>j</i>]+1) where j is the value of some
                                            coin.  Now, we know that the greedy solution works for opt[<i>k</i>-<i>j</i>] and also that
                                            <i>k</i>-j&gt;<i>N</i>.  Thus, opt[<i>k</i>-<i>j</i>]=opt[<i>k</i>-<i>j</i>-<i>N</i>]+1. So, we can
                                            rewrite this as:
                                        </p>

                                        <pre>
                                        opt[<i>k</i>]=min(opt[<i>k</i>-N-j]+1)+1
                                        </pre>

                                        <p>
                                            since the greedy solution for <i>k</i>-<i>j</i> involves using a coin valued at <i>N</i>
                                            (<i>k</i>-<i>j</i>&gt;<i>N</i>). Now, we can rewrite min(opt[<i>k</i>-<i>N</i>-<i>j</i>]+1) as
                                            opt[<i>k</i>-<i>N</i>], from our original recurrence, and thus we get:
                                        </p>

                                        <pre>
                                        opt[k]=opt[k-N]+1
                                        </pre>
                                        <p>which is what the greedy solution gives. QED <i>(proof by <b>lbackstrom</b>)</i></p>
                                        </ul>


                                        <font size="+2"><b>SolidArea</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505567" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                        Used as: Level 3:

                                        <blockquote>
                                        <table cellspacing="2">
                                        <tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1000</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">49 / 129  (37.98%) </td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">39 / 49  (79.59%)</td></tr>
                                        <tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>Yarin </b> for 824.44 points</td></tr>
                                        </table>
                                        </blockquote>

                                        <p>Reference implementation: <b>Yarin</b> <i>(room 2)</i></p>

                                        <h4>Implementation</h4>

                                        <p>
                                            <img align="right" src="/contest/problem/SolidArea/cc3.gif"></img>Given a polygon on the xy-plane, the polygon is moved "up" along
                                            the z-axis while being enlarged. This creates a solid, see picture below. The problem is to calculate
                                            the area of all the surfaces of this solid.
                                        </p>

                                        <p>
                                            The solid has two kinds of surfaces: the two polygonal surfaces (top &amp; bottom),
                                            and the <i>n</i> faces. The problem constraint guarantees that the solid will be
                                            "nice", no crossing surfaces or any such (in fact, I don't think such
                                            a figure would be called a solid!).
                                        </p>

                                        <p>
                                            The area of the two polygonal surfaces can be calculated with a formula that, if you don't know it,
                                            you should learn!
                                        </p>

                                        <p>
                                        P<sub>AREA</sub> =
                                        ((x<sub>1</sub>*y<sub>2</sub>-x<sub>2</sub>*y<sub>1</sub>) +
                                        (x<sub>2</sub>*y<sub>3</sub>-x<sub>3</sub>*y<sub>2</sub>) +
                                        .... +
                                        (x<sub>n</sub>*y<sub>1</sub>-x<sub>1</sub>*y<sub>n</sub>))
                                        /2
                                        </p>

                                        <p>where the polygon points are (x<sub>1</sub>,y<sub>1</sub>), (x<sub>2</sub>,y<sub>2</sub>), ... ,
                                            (x<sub>n</sub>,y<sub>n</sub>). Depending on whether or not the polygon points are clockwise or counter
                                            clockwise, you may have to negate the value above.
                                        </p>

                                        <p>
                                            It remains to calculate the area of the <i>n</i> sides. Each side is
                                            a trapezoid with coordinates in 3D. The coordinates for the trapezoid are
                                            (x<sub>i</sub>,y<sub>i</sub>,0),(x<sub>i+1</sub>,y<sub>i+1</sub>,0),(x<sub>i</sub>*f,y<sub>i</sub>*f,s),(x<sub>i+1</sub>*f,y<sub>i+1</sub>*f,s)
                                            where x<sub>i</sub>,y<sub>i</sub> are the original coordinates for the polygon,
                                            f is the enlargement factor and s is the shift value (how much the polygon is moved up along the z-axis).
                                        </p>

                                        <p>
                                            <img align="left" src="/contest/problem/SolidArea/cc3_2.gif"></img>Now, calculating the area of a trapezoid is fairly simple - multiply the average base length with the height.  The problem here is that the trapezoid is in 3D
                                            and calculating the height requires some elementary knowledge in linear algebra. Instead I went
                                            for a different approach: I divided the trapezoid into two triangles and calculated the area
                                            of those using Herons formula:
                                        </p>

                                        <p>T<sub>AREA</sub> = sqrt(<i>p</i>*(<i>p</i>-<i>a</i>)*(<i>p</i>-<i>b</i>)*(<i>p</i>-<i>c</i>))</p>

                                        <p>
                                            where <i>a</i>, <i>b</i>, <i>c</i> are the sides of the triangle (calculated from the coordinates
                                            using Pythagoras formula) and <i>p</i> is half the perimeter, (<i>a</i>+<i>b</i>+<i>c</i>)/2.
                                        </p>

                                        <p>
                                            That's basically it. The answer is sum of all these areas, rounded down. Check the reference
                                            implementation for details.
                                        </p>


<p>
<img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="269554" context="algorithm"/><br />
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
