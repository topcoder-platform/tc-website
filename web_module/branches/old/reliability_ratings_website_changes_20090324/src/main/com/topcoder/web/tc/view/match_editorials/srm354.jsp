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
    <A href="/stat?c=round_overview&er=5&rd=10711">Match Overview</A><br>
    <tc-webtag:forumLink forumID="516051" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 354</span><br>Thursday, June 14, 2007
<br><br>



<h2>Match summary</h2> 

<p>
Unlike the previous SRM, the Division I problem set wasn't very hard. The difficulty of the "above average" Easy problem was compensated by the rather easy Hard, which gave more than 50 coders the chance to solve all three problems. 
<br /><br />

The top of the Division Summary after the Coding Phase was very narrow and the Challenge Phase significantly changed the coders' order. <tc-webtag:handle coderId="10574855" context="algorithm"/> won the match thanks to a last minute blind challenge and continued his majestic conquest of the TopCoder rating: 3753 - another new record! <tc-webtag:handle coderId="19849563" context="algorithm"/>  finished in second and  <tc-webtag:handle coderId="251074" context="algorithm"/>  held on to the third position. 

<br />
<br />

Unexpectedly, a lot of coders in Division II solved a rather difficult Hard problem while the greedy Medium turned out to be a bit tougher. <tc-webtag:handle coderId="22680345" context="algorithm"/> wins, the newcomer <tc-webtag:handle coderId="22685725" context="algorithm"/>  finished second, and <tc-webtag:handle coderId="22675473" context="algorithm"/> took third.

<br /><br />
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7774&amp;rd=10711" name="7774">Thimbles</a></b> </font> 
<A href="Javascript:openProblemRating(7774)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516051" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      675 / 716 (94.27%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      650 / 675 (96.30%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ashwin_topcoder</b> for 249.10 points (1 mins 42 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219.75 (for 650 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The problem was pretty straightforward. To solve it you should process all the thimble swaps and calculate the ball position after each swap. Here is <tc-webtag:handle coderId="8522467" context="algorithm"/>'s solution, which clearly illustrates this idea:

<pre>
public int thimbleWithBall(string[] swp) { 
  int tp = 1; 
  foreach(string s in swp) { 
    int s1 = s[0] - '0'; 
    int s2 = s[2] - '0'; 
    if(s1 == tp) tp = s2; 
    else if(s2 == tp) tp = s1; 
  } 
  return tp; 
}

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7654&amp;rd=10711" name="7654">DateFormat</a></b> </font> 
<A href="Javascript:openProblemRating(7654)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516051" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      288 / 716 (40.22%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      86 / 288 (29.86%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>I-I</b> for 579.59 points (5 mins 22 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      292.15 (for 86 correct submissions) 
    </td>
  </tr>
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      499 / 574 (86.93%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      275 / 499 (55.11%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bmerry</b> for 285.71 points (6 mins 24 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187.72 (for 275 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem seemed more difficult than the usual Division 1 Easy or Division 2 Medium problem but, in fact, it didn't require a lot of effort to solve. The greedy works and the only nontrivial thing lies in the checking which valid dates can be obtained from the given date. 
<br /><br />

Let's consider the date "XX/YY" is given in the input. We should check "XX/YY" and "YY/XX" dates for it. The date "AA/BB" is a valid date in the US format if and only if AA is not greater than 12. This fact ensues from the constraint that each date in the input is a valid date in either US format or European format.
<br /><br />

The entire algorithm for the problem is as follows: Generate all possible dates from the first date and choose the smallest one. For each subsequent date generate all possible dates from it, and chose the smallest one that is greater than the preceding. You can use <tc-webtag:handle coderId="251074" context="algorithm"/>'s <a href="/stat?c=problem_solution&cr=251074&rd=10711&pm=7654">solution</a> as the reference.

<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4471&amp;rd=10711" name="4471">UnsealTheSafe</a></b> </font> 
<A href="Javascript:openProblemRating(4471)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516051" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      263 / 716 (36.73%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      236 / 263 (89.73%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>LiveInSeoul</b> for 969.97 points (5 mins 1 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      721.78 (for 236 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem was a classical illustration of dynamic programming problems. The last digit of the password depends on the preceding digit only. So we can accumulate all passwords of length N ending with a digit D into one object and work with such accumulated objects. 
<br /><br />

More formally, let A[N][D] be the number of passwords of length N with a digit D on the end. Then A[N][D] equals  the sum of such A[N-1][X] for whichever digits D and X are adjacent. 
<br /><br />

Here is <tc-webtag:handle coderId="22686261" context="algorithm"/>'s solution, which illustrates this idea:


<pre>
  long long countPasswords(int N){ 
    long long d[50][20]; 
    int i; 
    for(i=0; i&lt;=9; i++){ 
      d[1][i]=1; 
    } 
    for(i=2; i&lt;=N; i++){ 
      d[i][0]=d[i-1][7]; 
      d[i][1]=d[i-1][2]+d[i-1][4]; 
      d[i][2]=d[i-1][1]+d[i-1][3]+d[i-1][5]; 
      d[i][3]=d[i-1][2]+d[i-1][6]; 
      d[i][4]=d[i-1][1]+d[i-1][5]+d[i-1][7]; 
      d[i][5]=d[i-1][2]+d[i-1][4]+d[i-1][6]+d[i-1][8]; 
      d[i][6]=d[i-1][3]+d[i-1][5]+d[i-1][9]; 
      d[i][7]=d[i-1][4]+d[i-1][8]+d[i-1][0]; 
      d[i][8]=d[i-1][5]+d[i-1][7]+d[i-1][9]; 
      d[i][9]=d[i-1][6]+d[i-1][8]; 
      d[i][0]=d[i-1][7]; 
    } 
    long long ans=0; 
    for(i=0; i&lt;=9; i++){ 
      ans+=d[N][i]; 
    } 
    return ans; 
  }

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7248&amp;rd=10711" name="7248">RemissiveSwaps</a></b>
</font>
<A href="Javascript:openProblemRating(7248)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516051" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      464 / 574 (80.84%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      208 / 464 (44.83%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>kia</b> for 491.68 points (3 mins 42 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      396.73 (for 208 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
&quot;For every problem, there is a solution that is simple, neat, and wrong.&quot; - H. L. Mencken

<br /><br />
Initially this problem had a greater upper limit for <b>N</b>. But the "57246" test broke down all the author's approaches and he was forced to reduce limits. The correct answer for the "57246" test is "65410" because we can do the following sequence of swaps: 57246 -&gt; 57316 -&gt; 27416 -&gt; 61416 -&gt; 65410. How to obtain such a result using some 'clever' algorithm? I don't know, in spite of several days of thinking. If you have an idea, you are welcome to post it on TopCoder's <a href="http://forums.topcoder.com">forum</a>. 

<br /><br />
With the reduced constraints the problem can be solved with graph theory and any <a href="http://en.wikipedia.org/wiki/Graph_search_algorith">search algorithm</a>. Another possible solution is a brute force with any reasonable optimization. In this editorial we will describe the first approach. 

<br /><br />
Let's build a graph where vertexes are the numbers from 0 to 1,000,000. Let's create an edge from vertex A to vertex B if the number B can be obtained from the number A by the one swap operation. The answer is the maximal number that is reached from the vertex <b>N</b>. Here is the <tc-webtag:handle coderId="10574855" context="algorithm"/>'s solution that uses <a href=" http://en.wikipedia.org/wiki/Breadth-first_search">Breadth-first search</a> algorithm for the graph bypassing. 


<pre>
public int findMaximum(int N) { 
    bool[] reachable = new bool[12000000]; 
    List&lt;int&gt; queue = new List&lt;int&gt;(); 
    reachable[N] = true; 
    int res = N; 
    queue.Add(N); 
    while (queue.Count &gt; 0) 
    { 
      int cur = queue[queue.Count - 1]; 
      queue.RemoveAt(queue.Count - 1); 
      for (int p10 = 1; p10 &lt;= cur; p10 *= 10) 
        for (int q10 = 1; q10 &lt; p10; q10 *= 10) 
        { 
          int dp = (cur / p10) % 10; 
          int dq = (cur / q10) % 10; 
          if (dp &gt; 0 && dq &gt; 0) 
          { 
            int next = cur - dp * p10 - dq * q10 + (dp - 1) * q10 + (dq - 1) * p10; 
            if (!reachable[next]) 
            { 
              reachable[next] = true; 
              res = Math.Max(res, next); 
              queue.Add(next); 
            } 
          } 
        } 
    } 
    return res; 
  }

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7658&amp;rd=10711" name="7658">RooksPlacement</a></b>
</font>
<A href="Javascript:openProblemRating(7658)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=516051" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      131 / 574 (22.82%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      105 / 131 (80.15%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Petr</b> for 878.75 points (4 mins 26 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      556.53 (for 105 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This problem can be solved with dynamic programming. Let's have A[N][M][K] be the answer for the problem with N, M and K parameters. Let's consider the first row of the chessboard. There are four possibilities:
<ul>
<li>The first row contains no rooks. In this case the answer is A[N-1][M][K] (we can't put rooks on the first row).</li>
<li>The first row contains one rook that is not attacked by other rooks. In this case the answer is A[N-1][M-1][K-1] (we can't put other rooks on the first row and on the same column with the placed rook) multiplied by M (number of ways to put the rook on the first row).</li>
<li> The first row contains two rooks. In this case the answer is A[N-1][M-2][K-2] (we can't put other rooks on the first row and on the columns with the placed rooks) multiplied by M*(M-1)/2 (number of ways to put two rooks on the first row).</li>
<li>The first row contains one rook, which is attacked by other rook from the other row. In this case the answer is A[N-2][M-1][K-2] (we can't put other rooks on the rows and the column with the placed rooks) multiplied by M*(N-1) (number of ways to put the rook on the first row and select the second rook in the same column).</li>
</ul>
Finally, we get a formula: 



<pre>
A[N][M][K] = 
    A[N-1][M][K] +
    A[N-1][M-1][K-1] * M + 
    A[N-1][M-2][K-2] * M * (M-1) / 2 +
    A[N-2][M-1][K-2] * M * (N-1)

</pre>


Here is <tc-webtag:handle coderId="10574855" context="algorithm"/>'s solution, which uses the formula above.


<pre>
public class RooksPlacement { 
  bool[, ,] got; 
  long[, ,] res; 
  const long MODULO = 1000001; 
   
  public int countPlacements(int N, int M, int K) { 
    got = new bool[N + 1, M + 1, K + 1]; 
    res = new long[N + 1, M + 1, K + 1]; 
    return (int) get(N, M, K); 
  } 

  private long get(int n, int m, int k) 
  { 
    if (n &lt; 0 || m &lt; 0 || k &lt; 0) 
      return 0; 
    if (k == 0) 
      return 1; 
    if (n == 0 || m == 0) 
      return 0; 
    if (got[n, m, k]) 
      return res[n, m, k]; 
    long r = 
        (get(n - 1, m, k) + 
        m * (get(n - 1, m - 1, k - 1) + (n - 1) * get(n - 2, m - 1, k - 2)) + 
        m * (m - 1) / 2 * get(n - 1, m - 2, k - 2)) % MODULO; 
    got[n, m, k] = true; 
    res[n, m, k] = r; 
    return r; 
  } 


}

</pre>
</p>

<br /><br />






<div class="authorPhoto">
    <img src="/i/m/Andrew_Lazarev_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7485898" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
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
