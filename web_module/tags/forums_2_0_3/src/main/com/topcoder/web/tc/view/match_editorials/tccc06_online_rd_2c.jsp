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
<style type="text/css">
.code
{
   width: 500;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 12px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
}

</style>
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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10113">Match Overview</A><br>
    <tc-webtag:forumLink forumID="506112" message="Discuss this match" />
</div>
<span class="bodySubtitle">2006 TopCoder Collegiate Challenge<br>Online Round 2C</span><br>October 11, 2006
<br><br>


<h2>Match summary</h2> 

<p>
Now we know all 150 coders who will fight for the final 48 spots in TCCC Round 3 on Saturday. 
A lot of red coders performed below their level today -- and some of them got eliminated -- but not <tc-webtag:handle coderId="156216" context="algorithm"/>.
The finalist at the 2005  TCO won this round with a solid 1345 points, more than 75 points ahead of <tc-webtag:handle coderId="10676764" context="algorithm"/> and <tc-webtag:handle coderId="9906197" context="algorithm"/>.
</p>
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6761&amp;rd=10113" name="6761">ConstitutiveNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(6761)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506112" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      114 / 133 (85.71%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      107 / 114 (93.86%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>eleusive</b> for 248.10 points (2 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      201.86 (for 107 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem required only an ability to calculate the <a href="http://en.wikipedia.org/wiki/Arithmetic_progression">sum of arithmetic sequence</a>. 
Consider a consitutive number C -- by definition, it can be split into a sum of k positive numbers:
<pre>
C = a + (a + 1) + (a + 2) + ... + (a + k - 1)
</pre>
Transforming this equation, we get the following:
<pre>
C = a + (a + 1) + (a + 2) + ... + (a + k - 1) 
= a + a + ... + a + 0 + 1 + 2 + ... + (k - 1) 
= k * a + k * (k - 1) / 2.
</pre>
As you can see from this formula, the number C is a sum of k consequtive numbers if the difference (C - k * (k - 1) / 2) is positive and is divisible by k.
</p>
<p>
This gives us the idea for the solution. For each number C between A and B, and for each possible value of k (such that k * (k - 1) / 2 is less than C) check if the number C can be split into the sum of k consequtive numbers. Implementation of the algorithm follows:
<pre>
    public int count(int A, int B) {
        int ans = 0;
        for (int i = A; i &lt;= B; i++)
            for (int k = 3; k * (k - 1) / 2 &lt; i; k++)
                if (((i - k * (k - 1) / 2) % k) == 0) {
                    ans ++;
                    break;
                }
        return ans;
    }
</pre>
</p>
<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6760&amp;rd=10113" name="6760">MatrixPainting</a></b>
</font>
<A href="Javascript:openProblemRating(6760)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506112" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      90 / 133 (67.67%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      66 / 90 (73.33%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 493.47 points (9 mins 50 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      367.86 (for 66 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>


Let's iterate through all possible sets of rows and columns to be painted. 
The total number of variants is not more than 2<sup>18</sup>. 
We need to determine for a given set of rows and columns if it is possible to 
paint the corresponding rows and columns in some order. It is possible to 
do so by iterating several times through rows and columns from the set and 
painting all rows and columns in which the number of black cells is more than 4. 
The given set of rows and columns is called valid if it is possible to paint 
all the rows and columns from the set and there are no white cells in the 
matrix remains after that. Accordingly, from all the valid sets of rows and columns 
we need to choose the smallest one.


</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6762&amp;rd=10113" name="6762">DominoesFalling</a></b>
</font>
<A href="Javascript:openProblemRating(6762)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506112" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      15 / 133 (11.28%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      7 / 15 (46.67%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ying</b> for 839.39 points (12 mins 57 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      630.33 (for 7 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
Let F(i) be equal to 0 if the i-th place is occupied by a tile in the initial arrangement and be equal to 1 in the opposite case. So, F(i) is the number of moves required to place the domino tile on the i-th position. 
Let A(i, n) be the number of tiles to be moved to make such position with the domino effect, that the i-th place is occupied and there is exactly n - 1 dominoes to the left from the i-th place.
</p>
<p>
Clearly, A(i, 1) = F(i). A(i, n) can be calculated using following formula:
<pre>
A(i, n) = Min(A(i - k - 1, n - 1) + F(i)), 
</pre>
where k is the number of empty cells immediately before the i-th position, 1 &le; k &le; 4. 
</p>
<p>
We can start calculation of A(i, n) from the first element of the given cells because we can always put the tile on the right side instead of putting it to the left of the initial segment.
</p>

<div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br>
    <em>TopCoder Member</em>
</div>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
