<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
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
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10782&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516565" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 39</span><br>Tuesday, September 18, 2007
<br><br>

<h2>Match summary</h2>

<p>
This match was defined by a tough problemset for the competitors, with no solutions to the hard problem and only 12 coders solving the other two. However, there were few wrong submissions, thanks perhaps to the examples in the problems.
</p>

<p>
The winner of the match was <tc-webtag:handle coderId="20036294" context="hs_algorithm"/> with two problems and a fast submit in the medium, followed by <tc-webtag:handle coderId="22672311" context="hs_algorithm"/> and <tc-webtag:handle coderId="22661554" context="hs_algorithm"/> with two problems solved each. Congratulations to them for their great performance.
</p>
 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8121&amp;rd=10782" name="8121">WebBrowser</a></b>

</font>

<A href="Javascript:openProblemRating(8121)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516565" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      29 / 42 (69.05%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      26 / 29 (89.66%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>yuhch123</b> for 240.83 points (5 mins 35 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      169.03 (for 26 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
To make the browser simulation three structures are needed: a stack for the back pages, a stack for the forward pages and a vector to store the sequence of pages loaded. Then, we have to iterate each element in <b>actions</b> and execute it following what is descibed in the statement. Finally, just return the vector of pages loaded. For a straightforward solution, look at <tc-webtag:handle coderId="20036294" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=20036294&rd=10782&pm=8121">code</a>.
</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8187&amp;rd=10782" name="8187">LinearCity</a></b>

</font>

<A href="Javascript:openProblemRating(8187)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516565" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

Used as: Division One - Level Two: <blockquote><table cellspacing="2">

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

      20 / 42 (47.62%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      14 / 20 (70.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>exod40</b> for 465.93 points (7 mins 47 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      341.45 (for 14 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>
To solve this problem, some knowledge about graph theory might be very useful. To solve the problem, we have to recognize some properties about the references:
</p>

<ul>
<li>
If you have to walk to the left to go from place A to place B, then you have to walk to the right to go from place B to place A.
</li>

<li>
If you have to walk to the right to go from place A to place B and you have to walk to the right to go from place B to place C, then you have to walk to the right to go from place A to place C.
</li>
</ul>

<p>
Using the first property, we can change every reference that goes from A to B walking to the left to a reference that goes from B to A walking to the right, so all our references will go in a single direction - in this case, to the right.
</p>

<p>
Then, for each query asking for the direction from C to D, we will make two queries, one to check if to go from C to D you have to walk to the right and another to check if to go from D to C you have to walk to the right. If the first query returns true, you have to return <tt>"RIGHT"</tt>. If the second query returns true, you have to return <tt>"LEFT"</tt>. Finally, if both queries return false, you have to return <tt>"UNKNOWN"</tt>.
</p>

<p>
The only part left in the solution is to implement the queries. There are two basic algorithms to implement this:
</p>

<ul>
<li>
Before processing any query, create a graph using an adjacency matrix and find its Transitive Closure. Then, we can resolve a query looking to the requested position in the closure. <tc-webtag:handle coderId="22672311" context="hs_algorithm"/> used this approach to solve the problem, the code is <a href="/tc?module=HSProblemSolution&cr=22672311&rd=10782&pm=8187">here</a>.
</li>

<li>
Before processing any query, create a graph using your favorite representation (adjacency matrix, adjacency list or edge list). Then, we can resolve a query by making a DFS or BFS from the source to the destination. <tc-webtag:handle coderId="22693941" context="hs_algorithm"/> used this approach to solve the problem, the code is <a href="/tc?module=HSProblemSolution&cr=22693941&rd=10782&pm=8187">here</a>
</li>
</ul>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8120&amp;rd=10782" name="8120">RangeFixer</a></b>

</font>

<A href="Javascript:openProblemRating(8120)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516565" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      3 / 42 (7.14%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      0 / 3 (0.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>null</b> for null points (NONE)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      No correct submissions

    </td>

  </tr>

</table></blockquote>

<p>
The easiest way to solve this problem is to try each integer in the interval [<b>low</b>, <b>high</b>] and return the one with the lowest bit difference for each <b>values</b>[k]. However, this approach is too slow to pass system tests, because the interval can have up to 2<sup>30</sup> elements.
</p>

<p>
One way to solve this problem in time involves two recursive searchs. The first step is to split the binary representation of <b>low</b>, <b>high</b> and <b>values</b>[k] in two parts, one where the bits of <b>low</b> and <b>high</b> are the same, and the other where the <b>low</b> and <b>high</b> numbers start to differ (from the most significant bit to the lowest significant bit). For example:
</p>

<pre>
high      = (181)<sub>10</sub> = (10110101)<sub>2</sub> = (101 10101)<sub>2</sub>
low       = (173)<sub>10</sub> = (10101101)<sub>2</sub> = (101 01101)<sub>2</sub>
values[k] =  (38)<sub>10</sub> = (00101010)<sub>2</sub> = (001 00110)<sub>2</sub>
</pre>

<p>
To solve the first part we just have to change the first part of <b>values</b>[k] to the first part of <b>low</b>, because if we put a different value in the first part then the final result will be lower than <b>low</b> or higher than <b>high</b>. Now, we can ignore the first part and work only with the second part:
</p>

<pre>
high      = (10101)<sub>2</sub> = (21)<sub>10</sub>
low       = (01101)<sub>2</sub> = (13)<sub>10</sub>
values[k] = (00110)<sub>2</sub> = (6)<sub>10</sub>
</pre>

<p>
Then, the interval can be split in two parts, those where the most significant bit is 0 and and the most significant bit is 1:
</p>

<pre>
interval = [01101, 10101] = [01101, 01111] U [10000, 10101]
</pre>

<p>
Then, we could search the lowest different number in the both intervals separately and return the one with the lowest difference (or the lowest lexicografically if the difference is equal). To search the best number in the lower interval, we can search recursively from the most significant bit to the least significant bit, comparing the bits in low and value. Then, we have four cases (lowBit is the actual bit of <b>low</b> and valueBit is the actual bit of <b>values</b>[k]):
</p>

<ul>
<li>
<tt>lowBit == 0 && valueBit == 0</tt> : We have two choices: Change the value to 1 with cost 1, or leave the bit as is and process the remaining bits.
</li>

<li>
<tt>lowBit == 0 && valueBit == 1</tt> : The value bit is strictly higher than value bit, so we can leave the remaining bits equal.
</li>

<li>
<tt>lowBit == 1 && valueBit == 0</tt>: We have to make the value bit 1 and process the remaining bits.
</li>

<li>
<tt>lowBit == 1 && valueBit == 1</tt>: We can't change the value bit to 0, so the only thing we can do is process the remaining bits.
</li>
</ul>

<p>
Something similar can be done with the higher interval. The algorithm runs in O(N), where N is the number of different bits between low and high. The following commented code in Java implements this algorithms using bit manipulation:
</p>

<pre>
import java.math.*;
import java.util.*;

public class RangeFixer {
  // strucutre to store the algorithm results
  public class FixResult {
    public int value, cost;
    public FixResult(int value, int cost) {
      this.value = value; this.cost = cost;
    }
  }

  public int getEqualMask(int low, int high) {
    // return a mask with the longest most-significant consecutive block of ones
    // at the left
    int eqBits = ~(low ^ high), shift = 0;
    while ((eqBits & (eqBits + 1)) != 0) {
      eqBits &gt;&gt;= 1; ++shift;
    }
    return eqBits &lt;&lt; shift;
  }

  FixResult closestToLow(int low, int value, int bit) {
    // base case, all bits were processed
    if (bit == 0) return new FixResult(0, 0);

    // the actual bit in value is higher than the actual bit in low, so no
    // change to value is needed
    if ((low & bit) == 0 && (value & bit) != 0) return new FixResult(value, 0);

    // the actual bit in low is one, so the bit in value must be changed to one
    // if needed, and then the lowest bits must be adjusted
    if ((low & bit) != 0) {
      FixResult next = closestToLow(low & ~bit, value & ~bit, bit &gt;&gt; 1);
      next.value |= bit;
      if ((value & bit) == 0) ++next.cost;
      return next;
    }

    // both bits are zero, so we have two options, the first is to change the
    // actual bit in value to one and left the remaining bits equal, and the
    // second is to keep the bit in zero and adjust the remaining bits
    FixResult change = new FixResult(value | bit, 1);
    FixResult noChange = closestToLow(low & ~bit, value & ~bit, bit &gt;&gt; 1);
    return noChange.cost &lt;= change.cost ? noChange : change;
  }

  FixResult closestToHigh(int high, int value, int bit) {
    // base case, all bits were processed
    if (bit == 0) return new FixResult(0, 0);

    // the actual bit in value is lower than the actual bit in high, so no
    // change to value is needed
    if ((high & bit) != 0 && (value & bit) == 0) return new FixResult(value, 0);

    // the actual bit in high is zero, so the bit in value must be changed to
    // zero if needed, and then the lowest bits must be adjusted
    if ((high & bit) == 0) {
      FixResult next = closestToHigh(high & ~bit, value & ~bit, bit &gt;&gt; 1);
      if ((value & bit) != 0) ++next.cost;
      return next;
    }

    // both bits are one, so we have two options, the first is to change the
    // actual bit in value to zero and left the remaining bits equal, and the
    // second is to keep the bit in one and adjust the remaining bits
    FixResult change = new FixResult(value & ~bit, 1);
    FixResult noChange = closestToHigh(high & ~bit, value & ~bit, bit &gt;&gt; 1);
    noChange.value |= bit;
    return change.cost &lt;= noChange.cost ? change : noChange;
  }

  public int closestValue(int low, int high, int value) {
    // get the most-significant consecutive equal bits between low and high,
    // then truncate all the numbers to the non-equal part
    int eqMask = getEqualMask(low, high), eqPart = eqMask & low;
    low &= ~eqMask; high &= ~eqMask; value &= ~eqMask;

    // find the closest value the closest value higher than low with bit in 0
    int bit = (~eqMask + 1) &gt;&gt; 1;
    FixResult lowRes = closestToLow(low & ~bit, value & ~bit, bit &gt;&gt; 1);
    if (((low ^ value) & bit) != 0) ++lowRes.cost;

    // find the closest value lower than high with bit in 1
    FixResult highRes = closestToHigh(high & ~bit, value & ~bit, bit &gt;&gt; 1);
    highRes.value |= bit;
    if (((high ^ value) & bit) != 0) ++highRes.cost;

    // attach the result with the lowest cost to the equal part and return
    return eqPart | (lowRes.cost &lt;= highRes.cost ?
                     lowRes.value : highRes.value);
  }

  public int[] closestValue(int low, int high, int[] values) {
    // calculate the solution for each value and return
    int[] result = new int[values.length];
    for (int k = 0; k &lt; values.length; ++k)
      result[k] = closestValue(low, high, values[k]);
    return result;
  }
}
</pre>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/jbernadas_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="22653044" context="algorithm"/><br />    <em>TopCoder Member</em>
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
