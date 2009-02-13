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
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=11129">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520577" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 395</span><br />Wednesday, March 26, 2008
<br /><br />



<h2>Match summary</h2> 

<p> 
In division 1, coders were faced with an easy problem that required careful
case analysis, and DP-based medium and hard problems.
<tc-webtag:handle coderId="22629574" context="algorithm"/> made a charge to take
the lead with three successful challenges during the challenge phase, but
system tests took down his hard problem.
<tc-webtag:handle coderId="272072" context="algorithm"/> seeked out his 42nd
victory in a very close match.
<tc-webtag:handle coderId="15982182" context="algorithm"/> came in second,
only 10 points behind, followed by <tc-webtag:handle coderId="20286298" context="algorithm"/>
only 7 points behind him.
</p><p>
Division 2 coders faced a reasonably straightforward set. 
22 coders were able to successfully complete all three problems correctly,
with <tc-webtag:handle coderId="22670565" context="algorithm"/> taking home the SRM win.
<tc-webtag:handle coderId="21686077" context="algorithm"/> and 
<tc-webtag:handle coderId="21014227" context="algorithm"/> took home second and third
place, respectively.
</p> 
 
<H1> 
The Problems 
</H1>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8469&amp;rd=11129" name="8469">SquareDigitNumbers</a></b> 
</font> 
<A href="Javascript:openProblemRating(8469)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520577" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      428 / 496 (86.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      385 / 428 (89.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>KnightOfTheSun</b> for 248.43 points (2 mins 15 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      195.04 (for 385 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The constraints for this problem allow for a brute force solution to run in time. 
We start at k=0, and increment a counter when we find a number containing
only the digits 0, 1, 4, and 9.  When our counter is equal to N, we return
the value. 
See <tc-webtag:handle coderId="22670565" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269611&rd=11129&pm=8469&cr=22670565">code</a> for
a clean implementation of this.
</p><p>
An asymptotically faster solution instead relies on writing
the number in base 4 (just using the digits 0, 1, 4, and 9 instead of 0, 1, 2, and 3).
 See <tc-webtag:handle coderId="21509248" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269606&rd=11129&pm=8469&cr=21609248">code</a> for a very
nice implementation of this approach.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8464&amp;rd=11129" name="8464">StreetWalking</a></b> 
</font> 
<A href="Javascript:openProblemRating(8464)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520577" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      271 / 496 (54.64%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      182 / 271 (67.16%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>pawel001</b> for 454.38 points (9 mins 11 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      301.39 (for 182 correct submissions) 
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
      406 / 431 (94.20%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      352 / 406 (86.70%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>SkidanovAlex</b> for 247.06 points (3 mins 6 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      196.11 (for 352 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
It is clear from the constraints of the problem that we need an algorithm better than O(N) to successfully solve the problem.  To figure out how to solve this, let us begin by looking at the simplest solution, moving X times to the right and Y times up (without loss of generality, assume X >= Y).  We can do these moves in any order, so let us alternate X's and Y's and put any extra X's at the end; thus, the solution can be represented as "XYXY...XYXXX...X".  This solution arrives at the destination with no extra distance required.  If sneakTime &lt; 2*walkTime, then it is beneficial for us to replace all occurrences of "XY" in this string with sneaking ("S").  In this case, the string then becomes "SS....SSXX...X".  Furthermore, in cases where sneakTime &lt; walkTime, we can proceed to sneak twice (as seen in example 2) to replace two X's.  In this case, the solution becomes "SS.....S(X)", where the X in parentheses indicates that an X will be left over if the sum of X and Y is odd.  Thus, the solution can be written as follows:
</p>
<pre>
if(X &lt; Y) swap(X, Y);
if(sneakTime &gt; 2*walkTime) return (X+Y)*walkTime;
else if(sneakTime &gt; walkTime) return Y*sneakTime + (X-Y)*walkTime;
else if((X+Y)%2 == 0) return X*sneakTime;
else return (X-1)*sneakTime + walkTime;
</pre>
<p>
Of course in the above code, one must ensure that you use 64-bit variables to handle cases where overflow may happen.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8463&amp;rd=11129" name="8463">TriviaGame</a></b> 
</font> 
<A href="Javascript:openProblemRating(8463)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520577" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      71 / 496 (14.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      32 / 71 (45.07%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>nikkitousen</b> for 846.57 points (12 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      639.17 (for 32 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This is a classic example of dynamic programming.  I'll first
describe the solution using recursion with memoization.  Let your
current state be (cur, tokens), where cur is equal to the
current question that you are being asked, and tokens is the
number of tokens that you currently have.  We will also define dp(c, t) to
be the maximum number of points you can additionally score if currently at question
c with t tokens.  When you are asked the current question, you have two options.
If you get the question wrong, then you can score dp(cur+1, tokens) - points[cur].  If you
get the question right, then we have two more cases.  If tokens+1==<b>tokensNeeded</b>, then you can score dp(cur+1, 0) + points[cur] + bonuses[cur].
Otherwise, you can score dp(cur+1, tokens+1) + points[cur].  Once we know
the maximum score for both cases (answering correctly or incorrectly), we choose
the maximum value and return it.  Thus we have established our
DP relation, and need a base case, namely when cur==N (the number of questions).  In
this case, we can return 0 (there are no more questions to get right).  Thus, our
answer is simply dp(0, 0).
</p>
<pre>
int NEGINF = -10000000;    // a negative number we can't reach
int dp(int cur, int t)
{
    if(cur==N) // if we've answered all questions
        return 0;
    if(dptable[cur][t]&gt; NEGINF)    // if we've seen this before
        return dptable[cur][t];

    // possibility 1 = get the question wrong
    int answerwrong = dp(cur+1, t) - points[cur];

    int answerright;
    if(t+1==tN)    // if we earn the bonus answering the question
        answerright = dp(cur+1, 0) + points[cur] + bonuses[cur];
    else     // no bonus
        answerright = dp(cur+1, t+1) + points[cur];

    // pick the choice that earns the most points
    return dptable[cur][t] = Math.max(answerwrong, answerright);
}
</pre><p>
This problem is a very good place to practice dynamic programming from the top down.  See <tc-webtag:handle coderId="21686077" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269618&rd=11129&pm=8463&cr=21686077">solution</a> for a clean version of this code.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8582&amp;rd=11129" name="8582">Skyscrapers</a></b> 
</font> 
<A href="Javascript:openProblemRating(8582)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520577" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      196 / 431 (45.48%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      139 / 196 (70.92%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Gumx</b> for 484.94 points (5 mins 2 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      316.39 (for 139 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
There were some complicated ways to solve this problem using combinations, but there was a much simpler solution.  Assume we have <b>N</b> buildings left to place, requiring <b>L</b> visible buildings on the left and <b>R</b> visible on the right.  We now can decide where to place the smallest building.  If we place it in the leftmost location, then it is visible from the left (but not the right).  Thus, we can pretend that that building doesn't exist, and solve the simpler problem (N-1, L-1, R).  Similarly, if we place the building on the right, we can move to the new problem (N-1, L, R-1).  In the remaining N-2 cases to place the building, we can't see this building, and so move to (N-1, L, R).  Our base case occurs when N=1; if L=1 and R=1 then we return 1, otherwise we return 0.  Java code for the recursion:
</p>
<pre>
int dp(int N, int L, int R)
{
    if(N==1) return (L==1 &amp;&amp; R==1) ? 1 : 0;
    if(L &lt; 1 || R &lt; 1) return 0;
    if(dptable[N][L][R] &gt; -1) return dptable[N][L][R];

    dptable[N][L][R] = (int)(((long)dp(N-1, L-1, R) 
                                  + (long)dp(N-1, L, R-1)
                                  + (long)(N-2)*(long)dp(N-1, L, R))
                             % 1000000007);
    return dptable[N][L][R];
}
</pre><p>
Using combinations, it is actually possible to solve the problem in O(N<sup>2</sup>) time.  See <tc-webtag:handle coderId="15117368" context="algorithm"/> and <tc-webtag:handle coderId="22663117" context="algorithm"/>'s code in the practice rooms for implementations of this.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8736&amp;rd=11129" name="8736">PubTrivia</a></b> 
</font> 
<A href="Javascript:openProblemRating(8736)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520577" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
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
      88 / 431 (20.42%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      23 / 88 (26.14%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>janos</b> for 685.13 points (17 mins 4 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      516.43 (for 23 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Due to the large constraints, we need an algorithm that runs faster than O(N<sup>2</sup>).  To explain the concept, we will create a 2-D array called dp.  dp[cur][0] represents the maximum score we can achieve after answering the cur-th question without receiving the bonus.  dp[cur][1] represents the maximum score we can achieve by receiving a bonus on the cur-th question.  The recurrence relation can then be seen as follows (ignoring out-of-bounds errors):
</p><ol>
<li>dp[cur][0] = points[cur] + max(dp[cur-1][0], dp[cur-1][1]);</li>
<li>dp[cur][1] = cumsum[cur] + bonuses[cur] + max(dp[cur-<b>tokensNeeded</b>][1], max(dp[cur-<b>tokensNeeded</b>-1][0], dp[cur-<b>tokensNeeded</b>-1][1])-points[i-<b>tokensNeeded</b>]);</li>
</ol>
<p>What the above code means is: if we don't want to have the bonus on that question, we take the maximum value (bonus or no bonus) from the previous question and add our score to it.  If we want the bonus, we can start having received a bonus exactly <b>tokensNeeded</b> questions ago (the dp[i-<b>tokensNeeded</b>][1] term), or we can get question (i-<b>tokensNeeded</b>) wrong (and thus take the best value from question (i-<b>tokensNeeded</b>-1) ).
</p>
<p>In equations above cumsum[cur] means the total number of points for consecutive
<b>tokensNeeded</b> questions between (cur-<b>tokensNeeded</b>+1)-th and cur-th, inclusive.
You can precalculate cumsum[cur] in O(N) time using the following code:</p>
<pre>
int[] cs = new int[N+1];
for(i=1; i&lt;=N; i++)
cs[i] = cs[i-1] + points[i];
int[] cumsum = new int[N+1];
for(int i=tokensNeeded, i&lt;=N; i++)
cumsum[i] = cs[i] - cs[i-tokensNeeded];
</pre>
<p>
The answer is then the maximum of dp[N][0] and dp[N][1].  One needs to be careful when solving this problem to avoid index out of bounds issues, for example when <b>tokensNeeded</b> is greater than <b>N</b> (or <b>tokensNeeded</b>==1).  See <tc-webtag:handle coderId="15982182" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269583&rd=11129&pm=8736&cr=15982182">solution</a> for this solution, or see <tc-webtag:handle coderId="272072" context="algorithm"/>'s <a href="/stat?c=problem_solution&rm=269580&rd=11129&pm=8736&cr=272072">code</a> for a solution using a single DP array (eliminating the need for the Nx2 array).
</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7296000" context="algorithm"/><br />
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
