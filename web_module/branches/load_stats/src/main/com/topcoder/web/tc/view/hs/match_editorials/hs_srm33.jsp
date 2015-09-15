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
    <A href="/tc?module=HSRoundOverview&rd=10767&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516559" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 33</span><br>Thursday, July 12, 2007
<br><br>

<h2>Match summary</h2> 

<p> 

HS SRM 33 was the first match in new season, so many high rated competitors that
aren't eligible to compete anymore did not participate. Moreover, HS SRMs are
now in parallel with regular SRMs, so many people just chose SRM, which was
sponsored this time. Nevertheless, 63 participants made together a great
competition. With quite standard easy and hard, they had to face tricky medium
which led to very exciting challenge phase (with 35 out of 51 solutions challenged).
<br /><br />
Thanks to the fastest submission on the hard,
<tc-webtag:handle coderId="22663468" context="hs_algorithm"/> won the match,
despite he failed medium. <tc-webtag:handle coderId="22663117" context="hs_algorithm"/>,
the only one who solved all 3 problems correctly, unluckily finished second because of
resubmissions on medium and hard. <tc-webtag:handle coderId="13401907" context="hs_algorithm"/>
rounded up the top three with correct easy and hard, while other coders were far away as
they had no more than one correct submission (although
<tc-webtag:handle coderId="10205233" context="hs_algorithm"/> managed to submit correct
solution for the hard).

</p> 

 

<H1> 

The Problems 

</H1>

</p> 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8017&amp;rd=10767" name="8017">CastleGuards</a></b> 

</font> 

<A href="Javascript:openProblemRating(8017)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516559" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      53 / 63 (84.13%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      44 / 53 (83.02%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>neal_wu</b> for 248.78 points (1 mins 59 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      201.10 (for 44 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The classical version of this problem has a restriction that we can’t place guards in
some fields, which makes the problem a way harder (it can be solved via bipartite matching).
In our problem we can place our guards wherever we like. Let’s consider empty rows and
empty columns. We must place at least one guard in each. It’s obvious that we can place
a guard in particular empty row such that he’s placed in some empty column, and vice
versa. So, placing guards one by one, we’re choosing some empty row and empty column
(or if one of those doesn’t exist we’re choosing it randomly) and place him there,
until all rows and all columns are guarded. Now, it’s easy to see that the answer is
the number of empty rows or the number of empty columns, whichever is greater.

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7968&amp;rd=10767" name="7968">DogAndRabbit</a></b> 

</font> 

<A href="Javascript:openProblemRating(7968)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516559" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      51 / 63 (80.95%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      1 / 51 (1.96%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>neal_wu</b> for 331.98 points (16 mins 55 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      331.98 (for 1 correct submission) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
This problem also looks very easy at the first sight. But, in fact, it’s not so simple.
All we need to check is if the dog will catch the rabbit in time smaller than or equal
to overall time the rabbit runs to his home. This overall time is <b>distanceToHome</b> 
/ <b>rabbitSpeed</b>. Let’s denote it with <i>t</i>. The distance that dog would run in
that time is (<b>dogAcceleration</b> * <i>t</i><sup>2</sup>) / 2. All we want to check
is if that distance is greater then or equal to <b>distanceToRabbit</b> +
<b>distanceToHome</b>. If it is, dog will surely catch the rabbit, and it won’t catch
it otherwise. Ok.. so it looks like just a simple inequality and that’s it. But things
are not so simple, because if we used floating point arithmetic we would surely fail.
But rearranging our original inequality a bit gives us:

<pre>
  <b>dogAcceleration</b> * <b>distanceToHome</b><sup>2</sup> 
      >= 2 * <b>rabbitSpeed</b><sup>2</sup> * (<b>distanceToRabbit</b> + <b>distanceToHome</b>) .
</pre>

We can check this condition using only integers, but even here we should be careful and
use 64-bit types. Another thing about this problem are corner cases, when some of input
parameters are equal to 0 – but this can be simply handled before checking above inequality.
Sample solution follows:

<pre>
  public String willCatch (int dTR, int dTH, int rS, int dA) {
      if (dTR == 0) return "YES";
      if (dA == 0) return "NO";
      if ((long)dA * dTH * dTH >= (long)2 * rS * rS * (dTR + dTH))
          return "YES";
      return "NO";
  }
</pre>

</p>

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7867&amp;rd=10767" name="7867">AlmostPrime</a></b> 

</font> 

<A href="Javascript:openProblemRating(7867)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516559" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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

      15 / 63 (23.81%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      4 / 15 (26.67%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>klopyrev</b> for 931.82 points (7 mins 47 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      680.57 (for 4 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

Due to the fact that almost prime number is a prime raised at least to a second power,
it’s obvious that all almost prime integers less than or equal to <b>B</b> are powers
of primes less then or equal to sqrt(<b>B</b>). We can find all these primes with sieve
and then iterate over all of them raising each to all integer powers with exponent
greater than 1, until the power is not greater than our upper bound. Time complexity of
this solution is O( <i>pi</i>(sqrt(<b>B</b>)) * log(<b>B</b>) ), where <b>B</b> is
given upper bound and <i>pi</i>(n) denotes how many primes that are not greater than n
exist. There are exactly 664579 primes not greater than 10<sup>7</sup> so it’s fine.
But we should be very careful computing consecutive powers of each prime. It’s obvious
that 32-bit types would overflow, but it’s not so obvious that 64-bit types can overflow
as well. We should be aware of that, though many competitors were not. See
<tc-webtag:handle coderId="22663468" context="hs_algorithm"/>'s solution for reference.

</p>

 

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
