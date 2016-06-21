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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10792&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516569" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 43</span><br />Tuesday, October 23, 2007
<br><br>


<h2>Match summary</h2>

<p>

This match gathered 81 coders, 15 of them were newcomers.
The contestants faced a fairly straightforward easy problem, although its success rate rather far from 100%.
The medium and hard problems were somewhat harder and as an effect of this, the most of submissions of them were successfully challenged or failed system tests.
<br /><br />
<tc-webtag:handle coderId="11972352" context="algorithm"/> took the lead due to his very solid performance on all the problems and 6 successful challenges. <tc-webtag:handle coderId="20812309" context="algorithm"/> got the second place with all three problems solved and being boosted up by 5 successful challenges. Having "only" 3 successful and 2 unsuccessful challenges, the would-be winner <tc-webtag:handle coderId="22663117" context="algorithm"/> finished third.


</p>

 

<H1>

The Problems

</H1>

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=6692&amp;rd=10792" name="6692">TransformArray</a></b>

</font>

<A href="Javascript:openProblemRating(6692)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516569" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      61 / 73 (83.56%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      47 / 61 (77.05%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mirosuaf</b> for 249.06 points (1 mins 45 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      195.36 (for 47 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Because of the rather low constraints, this problem can be solved using brute force. Just do what the problem statement asks you to do. Please, check <a href="/tc?module=HSProblemSolution&cr=22378820&rd=10792&pm=6692">this solution</a> of <tc-webtag:handle coderId="22378820" context="algorithm"/> for a clean implementation.

One interesting thing about this problem is during each step of the transformation process, you can safely choose <b>any</b> pair with the minimal difference and result will never differ from the one where you always choose the pair with the minimal sum. I won't go deeper into the details saying that this can be proved by induction.


</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8260&amp;rd=10792" name="8260">TraditionalMarriage</a></b>

</font>

<A href="Javascript:openProblemRating(8260)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516569" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      48 / 73 (65.75%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      19 / 48 (39.58%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>fpavetic</b> for 487.02 points (4 mins 39 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      384.56 (for 19 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

Let's notice that we never need to take more than four items. So, if we have <b>n</b> items then the total number of variants we need to consider in the worst case is <b>C(n,1) + C(n,2) + C(n,3) + C(n,4)</b>. Which is only 251175 for n = 50. Here <b>C(n.k)</b> is a binomial coefficient (n choose k). So, we can iterate through all these variants and choose the best weight. For a reference, see <tc-webtag:handle coderId="11972352" context="algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=11972352&rd=10792&pm=8260">solution</a>.

</p>

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8221&amp;rd=10792" name="8221">ArithmeticalMean</a></b>

</font>

<A href="Javascript:openProblemRating(8221)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516569" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      16 / 73 (21.92%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      6 / 16 (37.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>neal_wu</b> for 797.10 points (15 mins 9 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      670.70 (for 6 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

In this problem you were given a set of integers {a<sub>1</sub>, a<sub>2</sub>, … , a<sub>n</sub>} and two numbers <b>L</b> and <b>H</b>. The problem was to find a number of subsets which arithmetic mean is between <b>L</b> and <b>H</b>, inclusive.
<br /><br />
Since the total number of subsets in the worst case is 2^36 = 68719476736, simple iterating through all of them will easily timeout. But we can use a well-known technique to speed up this approach.
<br /><br />
Let's partition our set into two subsets A1 = { a<sub>1</sub>,…, a<sub>n/2</sub>} and A2 = { a<sub>n/2+1</sub>,…, a<sub>n</sub>}. Now each subset contains not more than 2^18 = 262144 elements. Iterate through all subsets of A1 and for each subset calculate two values: a number of its elements <b>k</b> and a sum of its elements <b>s</b>. Add each <b>s</b> to the list <b>halfSums[k]</b>. After that, sort all lists <b>halfSums[i]</b>, for all i from 0 to n/2.
<br /><br />
Why have we done that? Because now, if someone asks us how many subsets in A1 with exactly <b>k</b> elements have sum less than or equal to <b>s</b>, we can easily answer in O(log(2^(n/2))) = O(n) time, using binary search. Let's denote this query as <b>count(k,s)</b>.
<br /><br />
All pre-calculations are done, and we can move straight to the getting the answer to the main problem.
<br /><br />
Iterate through all subsets of A2 just like we did with A1. For each subset with <b>k</b> elements and sum <b>s</b> we iterate through the number of elements in subset in A1 <b>t</b> and add the value of <b>count(t,H*(t+k) - s) - count(t,L*(t+k) – s-1) </b> to the answer. All of the correct submissions are based on the similar idea. See <tc-webtag:handle coderId="22663117" context="algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=22663117&rd=10792&pm=8221">solution</a> as an example of very clean implementation. It's really amazing that it's also the fastest submission of the hard problem.


</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/it4DOTkp_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20635869" context="algorithm"/><br />    <em>TopCoder Member</em>
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
