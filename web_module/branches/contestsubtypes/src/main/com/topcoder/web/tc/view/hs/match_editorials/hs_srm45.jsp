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
    <A href="/tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/tc?module=HSRoundOverview&rd=10799&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="516571" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 45</span><br />Tuesday, November 20, 2007
<br /><br />


<h2>Match summary</h2>

<p>

<p>
 Many students skipped their classes yesterday because of this match. And their lonely teachers said: "Thank god. I have time for today's SRM.".
</p>

<p>
 Just a joke. But really, many students participated in this match. They were faced with pretty easy problemset.
 40 contestants successfully finished all three problems. Some of them finished all in less than 15 minutes.  
 The difference in total points between successive contestants was very small (that's what easy match brings - you have to be fast).
</p>
 
<p>
 First place was taken by <tc-webtag:handle coderId="20812309" context="hs_algorithm"/> thanks to +75 in challenge phase, second by <tc-webtag:handle coderId="22285847" context="hs_algorithm"/> (congrats for color !) and third by <tc-webtag:handle coderId="22656813" context="hs_algorithm"/>.
 Fourth and fifth were <tc-webtag:handle coderId="14767863" context="hs_algorithm"/> and <tc-webtag:handle coderId="22697869" context="hs_algorithm"/>, respectively.
</p>


</p>



<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8141&amp;rd=10799" name="8141">SolvingEquation</a></b>

</font>

<A href="Javascript:openProblemRating(8141)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516571" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      107 / 117 (91.45%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      84 / 107 (78.50%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>exod40</b> for 248.98 points (1 mins 49 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      227.35 (for 84 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

As <b>A</b>, <b>B</b> and <b>C</b> are integers greater than or equal to 1, each corresponding factor can vary in relatively small interval. x can be between 0 and <b>W</b> / <b>A</b>, y between 0 and <b>W</b> / <b>B</b> and z between 0 and <b>W</b> / <b>C</b>, inclusive (all are integer divisions). If some factor exceed its upper limit, we get number greater than <b>W</b>, and we can't decrease it to <b>W</b> afterwards as negative factors are not allowed. As lengths of those intervals are at most 100, we can try all possible combinations of x, y and z. This give us O(<b>W</b>^3) complexity which is surely good enough. Here is simple solution in C++:

<pre>

<font color="blue">int</font> solve (<font color="blue">int</font> A, <font color="blue">int</font> B, <font color="blue">int</font> C, <font color="blue">int</font> W) {
    <font color="blue">int</font> res = 1000;
    <font color="blue">for</font> (<font color="blue">int</font> x = 0; x &lt;= 100; x++) 
        <font color="blue">for</font> (<font color="blue">int</font> y = 0; y &lt;= 100; ++y)
            <font color="blue">for</font> (<font color="blue">int</font> z = 0; z &lt;= 100; ++z)
                <font color="blue">if</font> (x*A + y*B + z*C == W)
                    res = min(res, x + y + z);
    <font color="blue">return</font> res == 1000 ? -1 : res;
}
</pre>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8096&amp;rd=10799" name="8096">DecreasingNumber</a></b>

</font>

<A href="Javascript:openProblemRating(8096)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516571" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      95 / 117 (81.20%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      75 / 95 (78.95%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>mirosuaf</b> for 498.83 points (1 mins 23 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      428.72 (for 75 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>
Simple greedy solution doesn't work here. Example is when we start from 10. If you do greedy, you'd give priority to division probably. So, you'd get 5, then 4, 2, and 1. And that's 4 operations. It can be better - decerease it by one and divide by 3 twice.
</p>

<p>
So, the most intuitive solution is dynamic programming. For each number, try all possible operations on it and take one which minimizes total number of operations to achieve 1. Here is the solution in C++:
</p>

<pre>
<font color="blue">int</font> dp[1000001];
<font color="blue">int</font> numberOfOperations(<font color="blue">int</font> n) {
        dp[1] = 0;
        <font color="blue">for</font> (<font color="blue">int</font> i = 2; i &lt;= n; ++i) {
                dp[i] = dp[i - 1] + 1;
                            
                <font color="blue">if</font> (i % 2 == 0)
                    dp[i] = min(dp[i], 1 + dp[i / 2]);
                                
                <font color="blue">if</font> (i % 3 == 0)
                    dp[i] = min(dp[i], 1 + dp[i / 3]);
        }
    
        <font color="blue">return</font> dp[n];
}
</pre>
<p>
Note that, originally, constraints were much higher. Better complexity can be achieved with BFS and hashing/mapping.
</p>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=8088&amp;rd=10799" name="8088">PaperUnfolding</a></b>

</font>

<A href="Javascript:openProblemRating(8088)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516571" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      71 / 117 (60.68%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      45 / 71 (63.38%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>ahyangyi</b> for 970.72 points (4 mins 57 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      645.16 (for 45 correct submissions)

    </td>

  </tr>

</table></blockquote>

<p>

<p>
Logically the easiest solution is to generate all possible sequences of foldings and then check if one in the input exists in generated set. It would have worked fine as we can perform at most 11 folding operations - that is O(2^lg(N) * N) = O(N^2) complexity. But, that solution is not so easy to implement as the one that follows.
</p>

<p>
Let's assume that our input paper, described by code, is valid (i.e. we got it by unfolding some folded paper). Then we can surely go backwards and fold it again to state from which it's gotten without any conflict. "Without any conflict" means that each time we are performing some folding operation, every mark on the left side of the paper, with index i, corresponds to the mark on the right side of paper with index  L - i - 1. (indexed from 0. L is the number of marks on the paper we are considering). We exclude middle mark as it's not important at all (it doesn't have its mark-pair).
</p>

<p>
So, when we are checking validity of some paper described by marks, we first check if there are no conflicts. If it's false, we determine that paper is not valid product of unfolding. If it's true, then we fold paper in half (bring right part over/under left) and again check validity of new paper recursively. Terminating case is when there is at most one mark, and we surely know solution for it.
</p>

<p>
Here is simple recursive algorithm in C++:
</p>

<pre>
<font color="blue">bool</font> isValid(<font color="blue">string</font> s) {
    if (s.size() == 0)
        <font color="blue">return</font> true;
    <font color="blue">for</font> (<font color="blue">int</font> i = 0; i &lt; s.size() / 2; ++i)
        if (s[i] == s[s.size() - i - 1])
            <font color="blue">return</font> <font color="blue">false</font>;
    <font color="blue">return</font> isValid(s.substr(0, s.size() / 2));
}

<font color="blue">string</font> isValidUnfolding(vector<<font color="blue">string</font>> code) {
    <font color="blue">string</font> s;
    for (int i = 0; i &lt; code.size(); ++i)
        s += code[i];
    <font color="blue">string</font> isValid(s) ? <font color="blue">"YES"</font> : <font color="blue">"NO"</font>;
}
</pre>

</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/Relja_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="20641244" context="algorithm"/><br />    <em>TopCoder Member</em>
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
