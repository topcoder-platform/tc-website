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
    <A href="/tc?module=HSRoundOverview&rd=10706&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514493" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 1 Delta</span><br>Tuesday, March 6, 2007
<br><br>

<h2>Match summary</h2> 

 

<p> 
The early rounds of the TCHS Tournament have two distinct characteristics.  The first is that many coders
carefully test their submissions to the easy problem to make sure they obtain seats in the next
round.  The second characteristic is that the top competitors strut their stuff, to show they mean
business in later rounds.  As a result, there was a 96.15% success rate on the easy, and ahyangyi
took first place by over 300 points.  Problem solutions follow.
</p> 

 

<H1> 

The Problems 

</H1>

</p> 

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=4697&amp;rd=10706" name="4697">ProductSet</a></b> 

</font> 

<A href="Javascript:openProblemRating(4697)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      26 / 26 (100.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      25 / 26 (96.15%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>hupo001</b> for 248.13 points (2 mins 28 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      232.02 (for 25 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
Using three for-loops we can quickly generate all elements of the described set.  The only issue is
accounting for duplicates, and this can be done by marking an array, or by using some kind of set
data structure.  Java code follows:
<pre>
    public int howMany(int[] lows, int[] highs) {
    HashSet&lt;Integer&gt; hs = new HashSet();
    for (int a = lows[0]; a <= highs[0]; a++) 
        for (int b = lows[1]; b <= highs[1]; b++) 
        for (int c = lows[2]; c <= highs[2]; c++) 
            hs.add(a*b*c);
    return hs.size();
    }
</pre>
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7518&amp;rd=10706" name="7518">DigitMask</a></b> 

</font> 

<A href="Javascript:openProblemRating(7518)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      23 / 26 (88.46%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      14 / 23 (60.87%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ahyangyi</b> for 469.45 points (7 mins 20 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      370.51 (for 14 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
In this problem we must determine if the given patterns are consistent, and if so, return the number of
matching strings.  Since the required string length L is given, we can initialize a character array
to contain L question-marks.  Each pattern we encounter will lead to one of the following:
<ul>
<li> The length of the pattern doesn't agree with L, so we return 0.</li>
<li> The pattern forces some positions of the array to be particular digits.</li>
<li> The pattern gives no information. </li>
</ul>
If two patterns force different digits in a given position, then we can immediately return 0.
Otherwise, we process all the patterns, and count how many question-marks remain.  Each contributes
a factor of 10 to the return value.
</p>

 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7495&amp;rd=10706" name="7495">WordConnect</a></b> 

</font> 

<A href="Javascript:openProblemRating(7495)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514493" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      13 / 26 (50.00%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      5 / 13 (38.46%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>ahyangyi</b> for 767.39 points (16 mins 44 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      600.47 (for 5 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

<p>
In this problem, a fairly quick precomputation can make most of the work go away.  We construct two
arrays of booleans, fromStart and fromEnd, which have one entry per table character.  fromStart will
mark all positions that can be reached by spelling out a prefix of the given word ending on that
position.  fromEnd will mark all positions that can be reached by spelling out a prefix of the
reverse of the given word ending on that position.  Both of these arrays can be populated using
dynamic programming: mark all positions where the first letter of the word occurs, then all second
letters adjacent to first letters, and so forth.
</p>
<p>
Having these two arrays will allow us to solve the problem with a simple flood-fill.  We loop over
the entire table of characters.  If we find the first letter of the given word and it is marked in
fromStart, then we flood-fill, coloring all connected positions.  This is possible, since at each
position we know whether it can be used to start or finish a word, and whether each neighbor can be
used to start or finish a word.  Having colored each component with a different color, a final loop
over the table can determine the number of components.
</p>

<br />
<br />



<div class="authorPhoto">
    <img src="/i/m/brett1479_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />    <em>TopCoder Member</em>
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
