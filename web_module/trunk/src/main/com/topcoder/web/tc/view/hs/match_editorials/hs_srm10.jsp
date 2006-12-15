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

        <tc-webtag:forumLink forumID="506032" message="Discuss this match"/></div>
    <span class="bodySubtitle">TCHS SRM 10</span><br>Monday, August 7, 2006
    <br><br>

    <h2>Match summary</h2>


    <p>
        One more match has passed under the banner "burunduk's the best."
        Burunduk is the Russian word for chipmunk,
        so one could say it was a regular "chipmunk day" on TopCoder.
        <tc-webtag:handle coderId="21468741" context="hs_algorithm"/> won the match
        thank to amazing 990.01 points for the hard problem.
        <tc-webtag:handle coderId="10256411" context="hs_algorithm"/>
        finished second only due to a frustrating mistake &ndash;
        now he surely knows that submitting the same code twice can cost a victory.
        <tc-webtag:handle coderId="14886245" context="hs_algorithm"/>
        rounded out the top three.
    </p>


    <H1>

        The Problems

    </H1>

</p>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6552&amp;rd=10062" name="6552">Fractile</a></b>

</font>

<A href="Javascript:openProblemRating(6552)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506032" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Division One - Level One: <blockquote>
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

                120 / 125 (96.00%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                96 / 120 (80.00%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>Zuza</b> for 248.97 points (1 mins 50 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                221.23 (for 96 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>

    This problem is an example of a usual Div2Easy problem with
    a straightforward solution. First useful thing to do is to sort
    the given array. Now assuming the elements of the array are indexed 0-based,
    the index of the desired element can be calculated using the following
    formula: <i>z = n * p / 100</i>, where <i>n</i> is the number of elements in
    the given array. There are two corner cases here:

    <ol>

        <li>if <i>n * p / 100</i> has no real part, then <i>z</i> must be decreased by one;</li>

        <li>if <i>p</i> is zero, then <i>z</i> is zero.</li>

    </ol>

    Second rule takes a priority over the first rule.

</p>

Java code follows:

<pre>
    public int fractile(int[] x, int p) {
    int n, z;
    Arrays.sort(x);
    n = x.length;
    z = n * p / 100;
    if (n * p % 100 == 0 && z > 0) z--;
    return x[z];
    }
</pre>

<p>

    This approach probably is not the best to use during the contest, because
    of the mentioned corner cases. Many coders used the various iterative
    algorithms in order to get as much points as possible.

</p>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=6589&amp;rd=10062" name="6589">Cannons</a></b>

</font>

<A href="Javascript:openProblemRating(6589)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506032" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Division One - Level Two: <blockquote>
    <table cellspacing="2">

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

                105 / 125 (84.00%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                96 / 105 (91.43%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>thoconracroi</b> for 486.95 points (4 mins 40 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                394.71 (for 96 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>

    Direction of any particular cannon exerts no influence to any
    of the other cannons, so this problem can be solved greedy.
    For each cannon try directions in the alphabetical order of their
    abbreviations until an allowed direction is reached. If there is no
    allowed direction for at least one cannon, return the empty string.

</p>

Java code follows:

<pre>
    static public String getDirections(int[] x, int[] y) {
    int n, i, j;
    String ret;
    n = x.length;
    ret = "";
    for (i = 0; i <n; i++) {
    // try down ('D')
    for (j = 0; j <n; j++) if (j != i) if (x[j] == x[i] && y[j] <y[i]) break;
    if (j >= n) { ret += "D"; continue; }
    // try left ('L')
    for (j = 0; j <n; j++) if (j != i) if (y[j] == y[i] && x[j] <x[i]) break;
    if (j >= n) { ret += "L"; continue; }
    // try right ('R')
    for (j = 0; j <n; j++) if (j != i) if (y[j] == y[i] && x[j] > x[i]) break;
    if (j >= n) { ret += "R"; continue; }
    // try up ('U')
    for (j = 0; j <n; j++) if (j != i) if (x[j] == x[i] && y[j] > y[i]) break;
    if (j >= n) { ret += "U"; continue; }
    // no solution
    return "";
    }
    return ret;
    }
</pre>


<font size="+2">

    <b><a href="/stat?c=problem_statement&amp;pm=5991&amp;rd=10062" name="5991">SwitchingBits</a></b>

</font>

<A href="Javascript:openProblemRating(5991)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it"/></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506032" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"/></A>

<br>

Used as: Division One - Level Three: <blockquote>
    <table cellspacing="2">

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

                96 / 125 (76.80%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Success Rate</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                84 / 96 (87.50%)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>High Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                <b>Burunduk3</b> for 990.01 points (2 mins 51 secs)

            </td>

        </tr>

        <tr>

            <td class="bodyText" style="background: #eee;">

                <b>Average Score</b>

            </td>

            <td class="bodyText" style="background: #eee;">

                856.35 (for 84 correct submissions)

            </td>

        </tr>

    </table>
</blockquote>

<p>

    There is no reason to invert two intersecting substrings because
    it is always possible to invert only the parts, which are located outside
    of the intersection instead, in no more than two operations.

</p>

<p align=center>
    <img src="/i/srm/tchs_srm_10.gif" alt="" border="0"/>
</p>

<p>

    There is also no reason to change one to zero trying to obtain the all-ones
    string and no reason to change zero to one trying to obtain the all-zeroes string.
    So you just need to calculate the number of the groups of the consequent zeroes
    and the number of the groups of the consequent ones.
    Then return the smallest of this numbers.
    <tc-webtag:handle coderId="21468741" context="hs_algorithm"/>'s
    <a href="/tc?module=HSProblemSolution&amp;cr=21468741&amp;rd=10062&amp;pm=5991">
        solution</a> is not only the fastest, but also probably the most elegant.
</p>


<div class="authorPhoto">
    <img src="/i/m/gevak_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7340263" context="algorithm"/><br />
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
