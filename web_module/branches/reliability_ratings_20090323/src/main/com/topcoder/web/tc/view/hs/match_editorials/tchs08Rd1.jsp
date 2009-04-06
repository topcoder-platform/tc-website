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
    <A href="/tc?module=HSRoundOverview&rd=11153&snid=2&er=5">Match Overview</A><br />

<tc-webtag:forumLink forumID="518887" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS08 Online Round 1</span><br />Saturday, January 12, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
The 2008 TCHS tournament started with Round 1 with 191 competitors. This giving all the posibility to advance with a positive score, 
which most of the competitors were able to do. For high rated highschoolers the first round was a warm up round.
With a pretty easy set of problems 77 of competitors sent solution to all 3 problems but only 51 ended up with corect
solution to all 3 problems. Only after 5 minutes solutions started to be submitted, and after 15 minutes some competitors
were done with all problems. After a succesful challenge <tc-webtag:handle coderId="22285847" context="hs_algorithm"/> managed to be 1st, fallowed by <tc-webtag:handle coderId="11972352" context="hs_algorithm"/> on second and <tc-webtag:handle coderId="10399429" context="hs_algorithm"/> on third. 

</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8195&amp;rd=11153" name="8195">StudentEnrollment</a></b> 
</font> 
<A href="Javascript:openProblemRating(8195)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518887" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      183 / 189 (96.83%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      178 / 183 (97.27%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>LittlePig</b> for 248.49 points (2 mins 13 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      229.94 (for 178 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
A pretty strightforward problem. Take each query in order, and check if the class is available in names, and check if there are any spaces left for that class left. Each time we 
find a class we decrement the number of spaces available for that class, so each element of spaces will still represent the number of free spaces left. 
An example of java solution follows:
<pre>
for (i = 0; i &lt; queries.length; ++i) {
    int available = -1;  // the number of spaces available in class queries[i]
    for (j = 0; j &lt; names.length; ++j)
        if (names[j].equals(queries[i])) {available = spaces[j]; break;} //we found the class
    if (available == -1) {ret[i] = "DOES NOT EXIST"; continue;}; //if available == -1 there is no class queries[i]
    if (available == 0) {ret[i] = "NOT GOOD"; continue;}; // if available == 0 there is no more room in that class
    spaces[j]--; //decrement the number of spaces available in class
    ret[i] = "GOOD";            
    };
return ret;    
</pre>
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8197&amp;rd=11153" name="8197">TaliluluCoffee</a></b> 
</font> 
<A href="Javascript:openProblemRating(8197)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518887" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      186 / 189 (98.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      177 / 186 (95.16%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>mosrecki</b> for 497.69 points (1 mins 56 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      443.20 (for 177 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Most of the coders used the intuitive greedy solution. 
It was pretty easy to see by intuition that if you serve the clients in tips orders, from the largest tip to the lowest one, you would get the right answer.
Let's prove this solution is really optimal.
Each second we pick a customer, take all coins from him, and our rival takes one coin from every other customer which is still present. 
If we minimize the number of coins our rival gets, we maximize the number of coins we get.

The number of coins our rival takes each turn is equal to the number of customers with at least one coin. 
If we always pick the customer with the maximal amount of coins available, 
we maximize the number of customers without money after each second. So, our rival gets the smallest possible amount, and we get the biggest.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8213&amp;rd=11153" name="8213">DecorationDay</a></b> 
</font> 
<A href="Javascript:openProblemRating(8213)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=518887" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      77 / 189 (40.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      51 / 77 (66.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Zuza</b> for 983.85 points (3 mins 39 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      686.43 (for 51 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
For some this problem was a classic one, but for others it was something new. For those who had trouble with it or never saw problems like this, I recommend to take a 
look on Dynamic Programming Tutorial from TopCoder and practice as much as they can, TCHS final will be soon. 
</p>
<p>
Consider the table DP[i][X] with i = 1, N and X = 0, 100000, where N is the number of groups from the problem. 
DP[i][X] has the meaning what is the number of subsets
that are made using only first i groups and such that the greatest common dividor (GCD) of each of those subsets is equal to X. 
Easy to see that the answer for the problem will be equal to DP[N][1].
If at some point we know DP[i][X], we can go further and count the number of subsets built using the (i + 1)-st group as well.
In details, since each subset built using first i groups can be also built using first i+1 groups, 
we need to add DP[i][X] to element DP[i + 1][X]. If we want to use the (i+1)-st element, the GCD of the new group will
be equal to GCD(X, groups[i + 1]), so we need to add DP[i][X] to DP[i + 1][GCD(X, groups[i + 1])] as well.
</p>
<p>
A simple java solution follows. The reference solution used longs instead of ints, and was taking the modulo at the very end.
<pre>
    long ret = 0;
    int n, i, j;
    n = groups.length;
    long [][] DP = new long[n+3][100002];
    for (i = 1; i &lt;= n; ++i) {
        DP[i][groups[i-1]]++;
        for (j = 1; j &lt;= 100000; ++j) if (DP[i-1][j] != 0) DP[i][gcd(j, groups[i-1])]+=DP[i-1][j];
        //plus add all
        for (j = 1; j &lt;= 100000; ++j) DP[i][j] += DP[i-1][j];
    };
    ret = DP[n][1];
    
return (int)(ret % 10000003);
</pre>
The memory can be optimized from N * 100000 to 2 * 100000, as some coders did.
As the last word, I wish good luck to all coders! 
</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/vlad_D_big5.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="13298470" context="algorithm"/><br />    <em>TopCoder Member</em>
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
