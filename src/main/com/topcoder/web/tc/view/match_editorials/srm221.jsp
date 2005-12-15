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
<tc-webtag:forumLink forumID="505698" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 221</span><br>Wednesday, December 1, 2004
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Before writing the match summary, I often go from room to room listening to what the competitors
thought of the round.  The Division 2 coders seemed to have reached a consensus.  This was one of
the most difficult SRMs in recent history.  Both the medium and hard problems had only 2 successful
submissions.  Mysteriously, each of these 4 submissions belonged to different coders.  BeanSweany,
owner of the fastest hard submission, took home the Division 2 crown.  The Division 1 results were
far less dismal.  Eryx finished the entire set in under 22 minutes.  Ploh, only slightly behind Eryx
after the coding phase, took the lead with a successful challenge.  We congratulate him on his first SRM win.
</p>

<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3446&amp;rd=5867" name="3446">EqualSubstrings</a></b>
</font>
<A href="Javascript:openProblemRating(3446)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505698" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      145 / 181 (80.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      78 / 145 (53.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>kclancy</b> for 242.34 points (5 mins 5 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      179.53 (for 78 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
When the coding phase began, I expected someone to ask what should be returned if the string could
not be adequately split.  To my surprise, the question was never posed.  This is probably a
testament to the skill of the competitors, since such a split is always possible.  To solve this
problem, simply try all possible prefixes, and keep the largest one that works.  Java code
follows:<pre>
int count(char c, String s) {
    int ret = 0;
    for (int i = 0; i &lt; s.length(); i++) 
        if (s.charAt(i) == c) ret++;
    return ret;
}
public String[] getSubstrings(String str) {
    for (int i = str.length() ;; i--) {
   String x = str.substring(0,i), y = str.substring(i);
   if (count('a',x) == count('b',y)) return new String[]{x,y};
    } 
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=3447&amp;rd=5867" name="3447">PointLifeGame</a></b>
</font>
<A href="Javascript:openProblemRating(3447)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505698" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      650
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      13 / 181 (7.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 13 (15.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>fractaled</b> for 379.42 points (28 mins 44 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      321.21 (for 2 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem proved extremely difficult for Division 2 coders.  In my opinion, there are 3 very
distinct issues that need to be handled:
<ol>
  <li> The number of points can become unwieldly if not dealt with properly. </li>
  <li> Points have to be compared, in order to find the best one. </li>
  <li> The resulting point must be output in a particular format. </li>
</ol>
Let's get issue 3 out of the way first.  If you have the coordinate stored in a double, the following
Java code changes that double into the correct format:<pre>
String make(double d) {
    int di = (int)(d*10000); //get an extra 4 digits
    String whole = di/10000+"", frac = di%10000+"";
    while(whole.length() &lt; 4) whole = "0"+whole; //add zeros if needed
    while(frac.length() &lt; 4) frac = "0"+frac;
    return whole+"."+frac;
}
</pre>
As for issue 2, some sort of comparison function should be written that compares points as
described in the problem.  This function can be given to an ordered set container, which will also
serve the purpose of removing duplicates.  To deal with issue 1, observe that the best k points after
round n are a subset of the points generated by the best k+1 points before round n (why?).  This means we
will never need more than 11 points since the maximum number of rounds is 10.  Thus, after each
round, the total set of points can be pruned such that only the best few remain.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2970&amp;rd=5867" name="2970">NumberChanger</a></b>
</font>
<A href="Javascript:openProblemRating(2970)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505698" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1100
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      9 / 181 (4.97%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      2 / 9 (22.22%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>BeanSweany</b> for 659.37 points (27 mins 26 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      532.50 (for 2 correct submissions)
    </td>
  </tr>
</table></blockquote>


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
      143 / 194 (73.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      73 / 143 (51.05%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>athenachu71</b> for 485.33 points (4 mins 58 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      352.98 (for 73 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
There are numerous ways to solve this problem.  One of the faster methods computes a minimum cost 
bipartite matching.  Such an algorithm is overkill here since the constraints are quite
restrictive.  Many of the C++ submissions I read used next_permutation to step through all possible
orderings of the numbers.  For each permutation, the number of swaps and the number of
increments/decrements must be computed.  My Java solution utilizes breadth first search.  Using the
start string as my initial node, I explore outward one swap at a time.  After exhausting all
possible permutations, the best score is returned.  This technique has the added benefit of counting
the number of swaps for you.  If you want to optimize this method, use
integers (instead of strings) to store the intermediate values.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1924&amp;rd=5867" name="1924">TerribleEncryption</a></b>
</font>
<A href="Javascript:openProblemRating(1924)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505698" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      194 / 194 (100.00%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      184 / 194 (94.85%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>nicka81</b> for 248.38 points (2 mins 17 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      224.56 (for 184 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
The easiest way to solve this problem is to loop through data, and try all possible k-values
until one works.  When I originally wrote the problem, the constraints made this type of brute force
solution impossible.  A faster method utilizes Euclid's algorithm for computing the greatest common
divisor (GCD).  Given positive integers a and b, Euclid's algorithm will find integer coefficients x and y such
that xa + yb = g, where g is the GCD of a and b.  Letting a = data[i] and b = keys[i], the algorithm
will give us x and y such that<pre>
     x*data[i] + y*keys[i] = 1
</pre>  The 1 is guaranteed by the constraints.  Since we are working mod keys[i], the y*keys[i]
term can be ignored.  Thus x is practically the k value we are looking for.  k is actually the
smallest positive integer congruent to x mod keys[i].
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2332&amp;rd=5867" name="2332">PresentationComp</a></b>
</font>
<A href="Javascript:openProblemRating(2332)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A>
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505698" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      57 / 194 (29.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      22 / 57 (38.60%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Eryx</b> for 752.53 points (13 mins 7 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      482.74 (for 22 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem has many more nuances than you might expect.  For those who are familiar with group
theory, the set described here closely resembles the 48-element non-abelian group Z<sub>6</sub> 
semidirect Z<sub>8</sub>.  Another interesting feature is that the constants 5, 6, and 8 that occur
in the problem were not chosen randomly, but picked with care.  The following proof will not work if
those numbers do not agree.<br/>
<br/>
The method I advocate relies on 2 facts:
<ol>
  <li> The returned string will never contain more than 12 characters. </li>
  <li> Given two strings A and B, equivalence can be determined quickly. </li>
</ol>
Based on these facts, simply enumerate all possible strings of length 12 or less.  Return the best one
that is equivalent to the given expression.  These facts must now be proven.<br/>
<br/>
The key concept is that any string of x's and y's can be converted into a canonical form where y's
occur before x's.  To notice this, observe that the rule xy -> yyyyyx shows how to move a y across
an x.  Continuously applying this rule to the leftmost occurrence of xy, 
we eventually arrive at a string that has y's before x's.  Once in this form,
we remove x's 8 at a time, and y's 6 at a time until we can no longer do so.  The resulting string
is what I call the canonical form.  Let c(A) denote the canonical form of expression A.
Clearly c(A) will never have more than 12 characters since it can have at most 5 y's and 7 x's.<br/>
<br/>
The problem states that 2 strings A and B are "equivalent" if there is a string C such that A can be
reduced to C and B can be reduced to C.  Let A~B denote A and B are equivalent.  What we will now
prove is that A~B if and only if c(A)=c(B).<br/>
<br/>
<i>Proof.</i> First observe that if c(A)=c(B) then A can be reduced to c(A) and B can be reduced to c(A)
(converting a string to canonical form constitutes a reduction).  Thus
A~B.  Conversely, we will assume that A~B.  This implies there is a string D such that A can be
reduced to D and B can be reduced to D.  We will show that c(A)=c(D)=c(B).  To do this, we will
prove that if string G reduces to string H in one step, then c(G)=c(H).  This will establish the
above triple equality via induction on the number of reduction steps.<br/>
<br/>
There are 3 possible ways to turn G into H:
<ol>
 <li> We apply the rule that deletes x's.  Thus G has the form pxxxxxxxxq and H is pq, where p and q
 are strings.  If we compare the workings of c(G) and c(H) we see that y's making their way leftward
 from the right side of the string must cross 8 more x's in G than in H.  This begs the question,
 does crossing 8 x's alter the y?  Observe that each time a y crosses an x we get 5 copies of the
 y.  Thus, when a y crosses 8 x's, we get 5<sup>8</sup> y's.  Since 5 is congruent to -1 mod 6, we
 see that 5<sup>8</sup> is congruent to 1 mod 6, 
 so in the grand scheme of things, y is unscathed during its journey over the sea of 8 x's. Thus
 c(G)=c(H).</li>
 <li> We apply the rule that deletes y's.  Thus G has the form pyyyyyyq and H is pq, where p and q
 are strings.  Again comparing how c(G) and c(H) are computed, we can see that once these 6 y's make
 their way to the left side of the string, their numbers will still be a multiple of 6.  More
 precisely, these 6 y's will contribute 6*5<sup>k</sup> y's to the y-count (before the final y
 removal), where k is the number of x's crossed in p.  Since 6*5<sup>k</sup> is congruent to 0 mod 6,
 these y's can be safely deleted.  Thus c(G)=c(H).</li>
 <li> We apply the rule that replaces xy with yyyyyx.  Thus G has the form pxyq and H is pyyyyyxq,
 where p and q are strings.  This turns out to be the easiest case since c(G) will make this exact
 replacement once the occurrence of xy in question becomes leftmost.  Thus c(G)=c(H).</li>
</ol>
The above 3 cases are exhaustive, and thus complete our proof.  The reader is invited to replace the
third rule with xy -> yyyyx, and observe how the problem changes.
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
