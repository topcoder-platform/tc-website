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
    <A href="/tc?module=HSRoundOverview&rd=10774&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516562" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 36</span><br>Wednesday, August 1, 2007
<br><br>

<h2>Match summary</h2> 

<p> 
Although TCHS SRM 36 attracted only 44 coders, it featured a very interesting competition.
As the easy problem was a bit tougher than usual this time, half of the participants
ended up with 0 or even a negative score. The medium was rather straightforward, but one
had to be very careful with implementation, while the hard proved to be quite standard
with an 81.82% success rate (though only 11 coders managed to submit it).</p>
<p>
<tc-webtag:handle coderId="22663117" context="hs_algorithm"/> won the match due to the 4 successful
challenges (despite failing 2 others). Close behind was <tc-webtag:handle coderId="22664055" context="hs_algorithm"/>
(who was on top after the coding phase), followed by <tc-webtag:handle coderId="22686287" context="hs_algorithm"/>,
who was one of the 2 lucky guys that had their brute force medium solution passed.
</p> 

 

<H1> 

The Problems 

</H1>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8059&amp;rd=10774" name="8059">VegetableField</a></b> 

</font> 

<A href="Javascript:openProblemRating(8059)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516562" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      26 / 44 (59.09%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      22 / 26 (84.62%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>LittlePig</b> for 247.46 points (2 mins 53 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      215.01 (for 22 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Here, the constraints were low enough to just brute force over all possible
plots and check to see if each meets our requirements or not. From those that
met the requirements we will simply choose the biggest. We just need to
count the different kinds of vegetables that grow on each plot we generate.
See <tc-webtag:handle coderId="22631114" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&cr=22631114&rd=10774&pm=8059" alt="LittlePig's fastest submission">fastest submission</a> for reference.

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8064&amp;rd=10774" name="8064">CrazySequence</a></b> 

</font> 

<A href="Javascript:openProblemRating(8064)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516562" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      31 / 44 (70.45%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      13 / 31 (4194%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>neal_wu</b> for 490.93 points (3 mins 52 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      371.96 (for 13 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

It is easy to see that the <b>n</b>-th number in the sequence is equal to <i>k</i> if and only if:

<pre>
  k * (k – 1) / 2 < <b>n</b> <= k * (k + 1) / 2  .
</pre>

The reason for this is that there are <i>k</i> * (<i>k</i> – 1) / 2 numbers less than <i>k</i> in the sequence and
<i>k</i> * (<i>k</i> + 1) / 2 numbers less than or equal to <i>k</i> (if you don't understand why, see Wikipedia's article on <a href="http://en.wikipedia.org/wiki/Arithmetic_sequence">Arithmetic progression</a>). We need to find the smallest <i>k</i> such that
<b>n</b> <= <i>k</i> * (<i>k</i> + 1) / 2. This is enough to solve the problem using binary search:

<pre>
  public int nthNumber (String N) {
    long n = Long.parseLong(N), lo = 1, hi = 2000000000;
    while (lo < hi) {
        long mid = (lo + hi) / 2;
        if (mid * (mid + 1) / 2 >= n)
            hi = mid;
        else
            lo = mid + 1;
    }
    return (int)lo;
  }
</pre>

After playing a bit with our initial condition we can find out that the n-th number in the
sequence is equal to floor( sqrt( 2n ) + 0.5 ). So we can solve the problem in a constant
time (assuming that we can compute a square root in a constant time). This is also a reason
why the brute force approach runs in O( sqrt(<b>n</b>) ) time. During the match it
turned out that if this approach is written carefully it can pass all the system tests
(and it did in two cases). Both these solutions make exactly 1414213562 iterations under 2 seconds.
It’s amazing, isn’t it?


</p>

<p>
<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7994&amp;rd=10774" name="7994">CoolNumber</a></b> 

</font> 

<A href="Javascript:openProblemRating(7994)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516562" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      11 / 44 (25.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      9 / 11 (81.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>v3ctor</b> for 841.63 points (12 mins 49 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      666.42 (for 9 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

How can we check if a given number is cool? We have to check if there exists a subset
of digits that sum up to the half of the sum of all the digits. The most obvious way is
to check all the possible subsets of digits with recursion. For a number <i>n</i>, there
are 2<sup>log<sub>10</sub><i>n</i></sup> possible subsets that are equal to O( cubeRoot(<i>n</i>) ).
So, if we would like to check all the numbers between <b>A</b> and <b>B</b> using this
approach, we would end up with a solution of  O( (<b>B</b> – <b>A</b>) * cubeRoot(<b>B</b>) )
time complexity. That doesn’t satisfy us for sure, so we have to think of a different method.</p>
<p>This different method is dynamic programming. Let <i>A</i>[<i>i</i>][<i>j</i>]
  be true if out of <i>i</i> first digits of <i>n</i> we can choose a subset that sum up to <i>j</i> and false otherwise. It’s now obvious that <i>A</i>[<i>i</i> + 1][<i>j</i>] = <i>A</i>[<i>i</i>][<i>j</i> –
  digit[<i>i</i> + 1]] &nbsp;<i>OR</i>&nbsp; <i>A</i>[<i>i</i>][<i>j</i>] , where digit[<i>i</i>] is
  the <i>i</i>-th digit of <i>n</i>. Both <i>i</i> and <i>j</i> will be at most O(log<sub>10</sub><i>n</i>), so this
  approach has O(log<sup>2</sup><i>n</i>) complexity. Now, we can solve our problem in
  O( (<b>B</b> – <b>A</b>) * log<sup>2</sup><b>B</b> ) time, which is more than enough.
  See <tc-webtag:handle coderId="22664055" context="hs_algorithm"/>'s solution for a clean implementation.
  You can also check the very inventive memoization of the naive approach in <tc-webtag:handle coderId="20330696" context="hs_algorithm"/>'s
  solution. </p>

 

<div class="authorPhoto">
    <img src="/i/m/mateuszek_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="11801002" context="algorithm"/><br />    <em>TopCoder Member</em>
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
