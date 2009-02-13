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
    <A href="/tc?module=HSRoundOverview&rd=10075&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506045" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 23</span><br>Monday, December 11, 2006
<br><br>

<h2>Match summary</h2> 

<p> 
In total, 188 members made 358 submissions for HS SRM 23. 
This set of problems turned out to be rather difficult. While more than 70 competitors submitted all three problems,
only 11 of them successfully solved all three, and 43 members didn't solve any of the problems. 
<tc-webtag:handle coderId="15600321" context="hs_algorithm"/> earned 225 points during the challenge phase,  
which put him over the top and won him the match with 1639.81 points. <tc-webtag:handle coderId="22641901" context="hs_algorithm"/> took second place with 1556.68 points, 
and <tc-webtag:handle coderId="22655506" context="hs_algorithm"/> was third with 1509.76 points.</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7278&amp;rd=10075" name="7278">GoodExhibition</a></b> 
</font> 
<A href="Javascript:openProblemRating(7278)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506045" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      154 / 176 (87.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      143 / 154 (92.86%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomekkulczynski</b> for 249.21 points (1 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      216.40 (for 143 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
To solve this problem, competitors  needed to perform the required operations in the most naive way.
The shortest way to solve it was to use HashMap&lt;String, Integer&gt;.

<pre>
public int numberOfPictures(String[] labels, int K) {
    int ans = 0;
    HashMap&lt;String, Integer&gt; NUM = new HashMap&lt;String, Integer&gt;();
    for (String s : labels) {
        int now = 0;
        if (NUM.containsKey(s)) now = NUM.get(s);
        NUM.put(s, now + 1);
    }
    for (Integer x : NUM.values()) {
        ans += Math.min(x, K - 1);
    }
    return ans;
}
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6740&amp;rd=10075" name="6740">Apportionment</a></b> 
</font> 
<A href="Javascript:openProblemRating(6740)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506045" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      99 / 176 (56.25%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      54 / 99 (54.55%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomekkulczynski</b> for 487.40 points (4 mins 35 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      341.94 (for 54 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem is fairly simple.
Let's assume that a side of the original square is <b>(N * M)</b> units in length. If so, the sides of the required squares must be divisible by <b>N</b> and by <b>M</b>.
There are exactly <b>(N - i + 1) * (M - i * M / N + 1)</b> different squares with <b>i * M</b> side length.
Looking over all the possible side lengths, we can calculate result as a sum of those  products.
<br />

Code follows:
<pre>
public long numberOfSquares(int N, int M) { 
    long ans = 1; 
    for (long i = 1; i &lt; N; i++) { 
        if (i * M % N == 0) { 
            ans += (long)(N - i + 1) * (long)(M - i * M / N + 1); 
        } 
    } 
    return ans; 
} 
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6734&amp;rd=10075" name="6734">Collector</a></b> 
</font> 
<A href="Javascript:openProblemRating(6734)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506045" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      103 / 176 (58.52%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      13 / 103 (12.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>otinn</b> for 901.57 points (9 mins 36 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      650.60 (for 13 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
There were a large number of challenges on this problem. Most contestants supposed that the answer would be -1 
if the value of one coin is divisible by the value of another coin. But this hypothesis is wrong, and 
test {3, 5, 8} shows it.
<br /><br />
Let <b>sum</b> be the sum of all elements in <b>coins</b>.
Actually, result will be -1 if and only if there is more than one way for the cash machine to return <b>sum</b>.
If there is exactly one way, then the result will be <b>sum</b> (because cash mashine will
give each coin once). Now we need to calculate the number of ways to present <b>sum</b>.
It is a Dynamic Programming problem. <b>num[j]</b> is the number of ways to present <b>j</b> using some set of coins.
<br /><br />
My solution is shown below:
<pre>
int ans = 0; 
for(int i = 0; i &lt; coins.length; ++i) 
    ans += coins[i]; 
int[] num = new int[ans + 1]; 
num[0] = 1; 
for(int i = 0; i &lt; coins.length; ++i) { 
    for(int j = 0; j &lt;= ans - coins[i]; ++j) { 
        num[j + coins[i]] = Math.min(num[j + coins[i]] + num[j], 2); 
    } 
} 
if (num[ans] &gt; 1) ans = -1; 
return ans; 
</pre>
</p>

<div class="authorPhoto">
    <img src="/i/m/VitalyGoldstein_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="19721111" context="algorithm"/><br />    <em>TopCoder Member</em>
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
