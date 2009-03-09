<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: SRM 429 Problem Set &amp; Analysis</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<script language="JavaScript" src="/js/print.js"></script>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=MatchDetails&rd=13520">Match Overview</a><br />
    <tc-webtag:forumLink forumID="524921" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 429</span><br />
Thursday, December 11, 2008
<br /><br />

<h2>Match summary</h2> 



<p> 

This SRM win came to <tc-webtag:handle coderId="10574855" context="algorithm"/> during the challenge phase - he was <i>only</i> third after the coding and 

needed 75 points to win it all. Needless to say, he got the W.

Two leaders after the coding phase - <tc-webtag:handle coderId="20812309" context="algorithm"/> and

<tc-webtag:handle coderId="19849563" context="algorithm"/> - came second and fourth, respectively, 

with 

<tc-webtag:handle coderId="22504795" context="algorithm"/> making the top-3 after a tremendous challenge phase.

</p> 

<p> 

Division 2 problems were tougher than usual.

<tc-webtag:handle coderId="15290970" context="algorithm"/>  and <tc-webtag:handle coderId="22744380" context="algorithm"/> 

were leading the pack after the coding 

with a moderate 1280 and 1240 points respectively.

Unfortunately, challenges and system tests weren't easy for them - 

<tc-webtag:handle coderId="15290970" context="algorithm"/>'s hard failed to pass systests, 

<tc-webtag:handle coderId="22744380" context="algorithm"/> was overtaken by 

<tc-webtag:handle coderId="22663842" context="algorithm"/>, whose 175 challenge points were enough for a win.





</p> 









 

<H1> 

The Problems 

</H1>

</p> 



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10251&amp;rd=13520" name="10251">LinearPolyominoCovering</a></b> 

</font> 

<A href="Javascript:openProblemRating(10251)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524921" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

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

      715 / 805 (88.82%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      586 / 715 (81.96%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>nitdgp</b> for 247.14 points (3 mins 4 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      183.74 (for 586 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 



<p>First, it is never advantageous to put two BB polyominoes next to each

other. Indeed, we can always replace "BBBB" with "AAAA" and thus get a

lexicographically smaller string.</p>



<p>Now, consider a group of 'X' cells (surrounded by dots or borders of the

region). Denote its length <i>L</i>.</p>



<ul>

<li/>If <i>L</i> is odd, there is no way to cover this group (the polyominoes have

even length), so the answer is "impossible".

<li/>If <i>L</i> is a multiple of 4, use <i>L</i>/4 AAAA polyominoes to cover this group.

<li/>If <i>L</i> is even but doesn't divide by 4, one BB polyomino has to be used.

To make the answer lexicographically smallest, it should be placed in

the end of the group, preceded by (<i>L</i>-2)/4 AAAA polyominoes.

</ul>



<p>Using patterns can make the code extremely short:</p>



<pre>

public String findCovering(String region) {

    region = region.replaceAll("XXXX", "AAAA").replaceAll("XX", "BB");

    return region.contains("X") ? "impossible" : region;

}

</pre>







<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=10246&amp;rd=13520" name="10246">SubrectanglesOfTable</a></b> 

</font> 

<A href="Javascript:openProblemRating(10246)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524921" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 

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

      178 / 805 (22.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      107 / 178 (60.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Start</b> for 477.67 points (6 mins 12 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      297.88 (for 107 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 



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

      547 / 624 (87.66%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      500 / 547 (91.41%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Abednego</b> for 246.57 points (3 mins 21 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      188.58 (for 500 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 



<p>Contestants were asked to count all letters in all subrectangles of

the given table.</p>



<p>The straight-forward algorithm looks like this: iterate over all

subrectangles and for each subrectangle, count the letters inside it.

Unfortunately, this algorithm takes

<i>O</i>((<i>h</i>&times;<i>w</i>)<sup>3</sup>) time

for a <i>h</i>&times;<i>w</i> table and

doesn't fit in 2 seconds for a 100&times;100 table.</p>



<p>The correct algorithm is to iterate over all cells of the table, and for

each cell, count the number of times it appears in subrectangles.</p>



<p>For a cell (<i>i</i>, <i>j</i>), the number of subrectangles that contain

this cell is equal to

(<i>i</i> + 1)(2<i>h</i> - <i>i</i>)(<i>j</i> + 1)(2<i>w</i> - <i>j</i>).</p>











<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8729&amp;rd=13520" name="8729">IngredientProportions</a></b> 

</font> 

<A href="Javascript:openProblemRating(8729)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524921" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 

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

      55 / 805 (6.83%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      20 / 55 (36.36%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>winsweet</b> for 631.11 points (25 mins 2 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      526.09 (for 20 correct submissions) 

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

      395 / 624 (63.30%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      261 / 395 (66.08%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Petr</b> for 489.26 points (4 mins 13 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      314.47 (for 261 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>

The solution can be split in 2 parts - first we find any masses which satisfy the given receipt, 

and then we change the solution to make the total mass as small as possible.

The latter part is easy - as soon as we have a solution (M1, ..., Mn), we compute the greatest common divisor 

of all Mi and divide each Mi by this divisor.

</p>

<p>

The former part - finding any vector of masses which satisfies the receipt - can be done in multiple ways.

Since the total number of ingredients is very low, we can forget about optimizations - it will be hard

to construct an algorithm which will NOT work in time.

</p>

<p>

The most natural approach is to find the proportion for all pairs of ingredients, 

set the mass of ingredient 1 to some value and compute the masses of all other ingredients using the

proportions. Computing the matrix of proportions is easy - parse all input proportions and run some kind of Floyd-Warshall

algorithm (so, if we know ingredients A and B are in proportion a:b and ingredients B and C are in proportion c:d, 

then we conclude A and C are in proportion (a * c):(b * d)). 

</p>

<p>

So, the only missing part of the solution is the selection of the mass of ingredient 1.  

This mass has to be selected in such way that the masses of all other ingredients will

be integer as well (for example, if ingredients 3 and 1 are in proportion 2 : 3, then mass 

of the first ingredient must be a multiple of 3).

In other words, if ingredient 1 and ingredient k are in proportion Ak : Bk, then the mass

of  the first ingredient must be divisible by Ak (for all k). Therefore, we can pick the 

least common multiple of all Ak's as the mass of the first ingredient.

</p>

<p>

And the algorithm altogether:

<ol>

<li>Parse all input proportions.</li>

<li>Compute the proportions between all pairs of ingredients.</li>

<li>Calculate the mass of the first ingredient using the LCM above.</li>

<li>Compute the masses of all other ingredients.</li>

<li>Minimize the total mass dividing all masses by their GCD.</li>

</ol>



</p>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=8560&amp;rd=13520" name="8560">SpecificPolyominoCovering</a></b> 

</font> 

<A href="Javascript:openProblemRating(8560)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=524921" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      172 / 624 (27.56%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      34 / 172 (19.77%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ahyangyi</b> for 897.65 points (9 mins 49 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      617.77 (for 34 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>The task was to cover a given region with polyominoes of two types:

<pre>

A  A

AAAA  and  BB

</pre></p>



<p>Moreover, the covering had to be the lexicographically smallest one.</p>



<p>Let's solve the second part first.</p>



<p>

Suppose that, given a region, we can determine whether it can be covered or

not. Now, here's the general approach that allows to find the lexicographically

smallest covering:

</p>



<pre>

Check whether the given region can be covered.

If not, return "impossible".

While the region is not covered, do the following:

    Find the first 'X' (the leftmost among the topmost Xs)

    Try to put an A-polyomino, so that its upper-left corner occupies this 'X'.

    If a) an A-polyomino fits there, and b) the rest of the region can be covered

        Fix an A-polyomino like this.

    Otherwise,

        Fix a BB polyomino at this 'X' and the 'X' on the right of it.

</pre>



<p>This algorithm always puts the lexicographically smallest valid symbol at

the position of the first 'X', so the result is optimal.</p>



<p>Now we are to solve the first part of the problem: given a region, check

whether it can be covered.</p>



<p><b>Definition</b> Let's call <i>embracing pattern</i> the following

rectangle:

<pre>

ABBA

AAAA

</pre></p>



<p><b>Lemma</b> If a region can be covered, then it can be covered without

embracing patterns.</p>



<p><b>Proof</b> While there are embracing patterns, continue demolishing them

with the following transformation:

<pre>

          ABBA          BBBB

replace   AAAA   with   BBBB

</pre>



<p>Each such replacement decreases the number of embracing patterns by 1, so

it will eventually reach 0. <b>End of proof</b></p>



<p>Thus, our question ("can this region be covered?") is equivalent to the

following one: can this region be covered if embracing patterns are

prohibited? Let's design an algorithm that answers this question.</p>



<p>Find the first 'X'. It can be either the upper-left corner of an A-polyomino,

or the left half of a BB polyomino.</p>



<p>Check whether the corresponding polyominoes fit into the region.<p>



<p>If none of them fits, the answer is "no" (the region can't be covered).</p>



<p>If exactly one of them fits, fix the one that fits (that's the only choice)

and continue applying the algorithm.</p>



<p>If both of them fit, we have the following situation:

<pre>

XXCX

XXXX

</pre>

(We're looking at the upper-left X, which can be part of either polyomino)</p>



<ul>

<li/>Case 1, cell C is empty ('.'). We can't put an A-polyomino: it would

leave one uncoverable cell. So, put a BB polyomino and continue.

<li/>Case 2, cell C is an 'X'. Suppose we put an A-polyomino. But such decision

leaves two cells inside this A-polyomino. These two cells must be covered with

a BB polyomino. And we get an embracing pattern which is prohibited.

Therefore, we had to put a BB polyomino in this case.

</ul>



<p>Thus, all cases being investigated, we have a linear-time algorithm that

checks whether a given region can be covered.</p>



<p>This algorithm can be simplified. Note that in all cases, if we

can place a BB polyomino in the X cell under consideration, we always do put

it. Therefore, the algorithm can be reformulated:</p>



<pre>

While the region is not covered, do the following:

    Find the first 'X'.

    If there is an 'X' on the right of it

        Put a BB polyomino there and continue.

    If it is possible to put an A-polyomino with its upper-left corner at this 'X'

        Put such A-polyomino and continue.

    Return "impossible".

</pre>




<div class="authorPhoto">
    <img src="/i/m/darnley_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21971539" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>
</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
