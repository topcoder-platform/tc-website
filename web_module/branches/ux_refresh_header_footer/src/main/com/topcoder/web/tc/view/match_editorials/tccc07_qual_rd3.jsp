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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=10889">Match Overview</A><br />
    <tc-webtag:forumLink forumID="517187" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Collegiate Challenge<br />Qualification Round 3</span><br />Thursday, August 23, 2007
<br /><br />



<p>
In Qualification Round 3 of TCCC07 there were only 455 participants. As this was less than
the 550 available spots, any positive score was enough to advance. Thanks to the very
solvable easy problem, 445 coders were able to solve it and to advance to the next round.
First place was taken by Chinese coder
<tc-webtag:handle coderId="21288270" context="algorithm"/>, while
<tc-webtag:handle coderId="10611351" context="algorithm"/> and
<tc-webtag:handle coderId="22660294" context="algorithm"/> from Viet Nam
took the second and third spots. All of them (as well as 31 other coders) correctly
solved all three problems.
</p>

<p>
In total, 1695 coders advanced to Online Round 1. Congratulations to them all, and good
luck in the next rounds!
</p>

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8114&amp;rd=10889" name="8114">ComplementaryDNAChains</a></b>

</font>

<A href="Javascript:openProblemRating(8114)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>

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

      447 / 455 (98.24%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      445 / 447 (99.55%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>BlueriF</b> for 249.24 points (1 mins 34 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      230.56 (for 445 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
In order to solve the problem, we iterate over all positions i of characters in input strings.
If i-th character in <b>first</b> and i-th character in <b>second</b> correspond to complementary
proteins, then no replacements at position i are needed, otherwise we need 1 replacement
to make one of the proteins complementary to another. One of the simplest ways to check whether
two characters correspond to complementary proteins is to calculate the sum of their
positions in string "ACGT" and check whether this sum equal 3 or not.
</p>

<p>Java code follows:</p>

<pre>
public int minReplaces(String first, String second) {
    int res = 0;
    for (int i=0; i < first.length(); i++)
        if ("ACGT".indexOf(first.charAt(i)) +
            "ACGT".indexOf(second.charAt(i)) != 3)
            res++;
    return res;
}
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8099&amp;rd=10889" name="8099">ColorApproximation</a></b>

</font>

<A href="Javascript:openProblemRating(8099)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">

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

      152 / 455 (33.41%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      116 / 152 (76.32%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>marijnk</b> for 534.91 points (10 mins 9 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      325.07 (for 116 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
There are a total of 2<sup>24</sup> = 16,777,216 different colors, so if we find some
way to determine the distance between the given color and the given set of colors in constant
time then we'll be able to solve the problem by iterating through all possible
colors.
</p>

<p>
In order to calculate the distance in constant time, let's use the following observation.
If X<sub>1</sub>, X<sub>2</sub>, ..., X<sub>N</sub> are integers, m is min{X<sub>1</sub>,
X<sub>2</sub>, ..., X<sub>N</sub>} and M in max{X<sub>1</sub>, X<sub>2</sub>, ..., X<sub>N</sub>},
then the maximum among differences |x - X<sub>i</sub>| equals to either |x - m| or to
|x - M|. Therefore, if minR and maxR are the minimum and the maximum red quantity values among
all colors in the given set, minB and maxB are the minimum and the maximum blue quantity values,
and minG and maxG are the minimum and the maximum green quantity values, then the distance
between the color (R, G, B) and the given set of colors can be calculated as max{|R - minR|,
|R - maxR|, |G - minG|, |G - maxG|, |B - minB|, |B - maxB|}.
</p>

<p>Commented Java implementation of this approach follows:</p>

<pre>
// converts hexadecimal character to its decimal equivalent
public int toInt(char c) {
    return "0123456789ABCDEF".indexOf(c);
}

// converts decimal integer to hexadecimal character    
public String toHex(int x) {
    return "" + "0123456789ABCDEF".charAt(x);
}
    
public String bestApproximation(String[] colors) {
    int[] min = new int[] {256, 256, 256};
    int[] max = new int[] {-1, -1, -1};

    // parse the input and calculate minimum/maximum
    // red, green and blue quantities among all colors
    for (int i=0; i < colors.length; i++) {
        String[] S = colors[i].split(" ");
        for (int j=0; j < S.length; j++)
            for (int k=0; k < 3; k++) {
                int val = 16 * toInt(S[j].charAt(2*k)) + 
                               toInt(S[j].charAt(2*k+1));
                min[k] = Math.min(val, min[k]);
                max[k] = Math.max(val, max[k]);
            }
    }
        
    int bestDist = 256;
    int[] best = new int[] {-1, -1, -1};
    int[] cur = new int[3];

    // iterate through all possible answers
    for (cur[0]=0; cur[0]<256; cur[0]++)
        for (cur[1]=0; cur[1]<256; cur[1]++)
            for (cur[2]=0; cur[2]<256; cur[2]++) {
                int curDist = -1;
                for (int k=0; k<3; k++) {
                    curDist = Math.max(curDist, Math.abs(cur[k] - min[k]));
                    curDist = Math.max(curDist, Math.abs(cur[k] - max[k]));
                }
                if (curDist < bestDist) {
                    bestDist = curDist;
                    best = cur.clone();
                }
            }

    // format the result into String        
    String res = "";
    for (int k=0; k < 3; k++)
        res += toHex(best[k] / 16) + toHex(best[k] % 16);

    return res;
}
</pre>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8023&amp;rd=10889" name="8023">VectorMatching</a></b>

</font>

<A href="Javascript:openProblemRating(8023)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=517187" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

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

      63 / 455 (13.85%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      44 / 63 (69.84%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>_kiwi_</b> for 851.62 points (6 mins 50 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      632.82 (for 44 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
This problem can't be solved by generating all vector matchings for a given set
of points, as such a solution will easily exceed the time limit (for example, there
are 670,442,572,800 different vector matchings for a set of 20 points).
Therefore we need to find some property that will help us to prune
the search space.
</p>

<p>
Let's consider some vector matching, consisting of vectors (<b>x</b>[i<sub>1</sub>],
<b>y</b>[i<sub>1</sub>]) -> (<b>x</b>[j<sub>1</sub>],
<b>y</b>[j<sub>1</sub>]), (<b>x</b>[i<sub>2</sub>],
<b>y</b>[i<sub>2</sub>]) -> (<b>x</b>[j<sub>2</sub>],
<b>y</b>[j<sub>2</sub>]), ..., (<b>x</b>[i<sub>n</sub>],
<b>y</b>[i<sub>n</sub>]) -> (<b>x</b>[j<sub>n</sub>],
<b>y</b>[j<sub>n</sub>]). The vector sum of all vectors in the matching will
give us the vector ((<b>x</b>[i<sub>1</sub>] - <b>x</b>[j<sub>1</sub>]) + 
(<b>x</b>[i<sub>2</sub>] - <b>x</b>[j<sub>2</sub>]) + ... +
(<b>x</b>[i<sub>n</sub>] - <b>x</b>[j<sub>n</sub>]), (<b>y</b>[i<sub>1</sub>] - <b>y</b>[j<sub>1</sub>]) + 
(<b>y</b>[i<sub>2</sub>] - <b>y</b>[j<sub>2</sub>]) + ... +
(<b>y</b>[i<sub>n</sub>] - <b>y</b>[j<sub>n</sub>])) = ((<b>x</b>[i<sub>1</sub>] +
<b>x</b>[i<sub>2</sub>] +
... + <b>x</b>[i<sub>n</sub>]) - (<b>x</b>[j<sub>1</sub>] + <b>x</b>[j<sub>2</sub>] +
... + <b>x</b>[j<sub>n</sub>]), (<b>y</b>[i<sub>1</sub>] + <b>y</b>[i<sub>2</sub>] +
... + <b>y</b>[i<sub>n</sub>]) - (<b>y</b>[j<sub>1</sub>] + <b>y</b>[j<sub>2</sub>] +
... + <b>y</b>[j<sub>n</sub>])) (1).
</p>

<p>
From formula (1) we see that if we fix the points that will be the start points of vectors
in the matching, and which points will be end points, the vector sum of all vectors
in the matching will not depend on the way that was chosen to connect start and end points
by vectors. Therefore, we can solve the problem by generating all the subsets of start
points (in the worst case of 20 points, there will be just 184,756 such subsets).
All the vector matchings with fixed subsets of start points have the same vector
sum of their vectors, which can be determined by formula (1). To get the answer,
we choose the vector sum with the minimum length among all subsets of start points.
</p>

<p>
Java implementation below uses bitmasks to generate all the subsets of start points (1 bit
encodes start point, and 0 bit - end point). If you are not familiar with bitmasks,
please check this
<a href="/tc?module=Static&d1=tutorials&d2=bitManipulation">tutorial</a>.
</p>

<pre>
// calculates the count of 1 bits in the mask
public int bitCnt(int mask) {
    return (mask==0 ? 0 : bitCnt(mask & (mask - 1)) + 1);
}
    
public double minimumLength(int[] x, int[] y) {
    int N = x.length;
    double res = Double.MAX_VALUE;

    // iterate over all possible bitmasks with N bits
    for (int mask=0; mask < (1 << N); mask++) {
        // check that exactly half of bits are 1 bits
        if (bitCnt(mask) != N/2) continue;

        // calculate the vector sum using formula (1)
        long sumX = 0, sumY = 0;
        for (int i=0; i < N; i++) {
            int sign = ((mask & (1 << i)) > 0 ? 1 : -1);
            sumX += sign * x[i];
            sumY += sign * y[i];
        }

        // compare the length of the vector sum with the best one
        res = Math.min(res, Math.sqrt(sumX * sumX + sumY * sumY));
    }

    return res;
}
</pre>
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/ivan_metelsky_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10481120" context="algorithm"/><br />
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
