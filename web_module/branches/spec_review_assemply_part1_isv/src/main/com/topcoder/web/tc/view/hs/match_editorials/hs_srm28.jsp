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
    <A href="/tc?module=HSRoundOverview&rd=10652&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506244" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 28</span><br>Monday, January 15, 2007
<br><br>

<h2>Match summary</h2> 
 
High school competitions are enjoying a steady level of popularity and, with an attendance of 159 participants, this match was no exception. The problems were not easy but, thanks to the many examples offered, most of the people who were able to submit a solution were rewarded with points. <tc-webtag:handle coderId="22268848" context="algorithm"/> took top honors with an impressive score of 1493.00 points. He was followed close behind by <tc-webtag:handle coderId="15117368" context="algorithm"/> with 1427.68 points, <tc-webtag:handle coderId="22663763" context="algorithm"/> with 1426.54 points and <tc-webtag:handle coderId="22662539" context="algorithm"/> with 1423.72 points. Rounding the top five, was <tc-webtag:handle coderId="22641901" context="algorithm"/> with a score of 1394.43 points. 
<br />
<br />
The problems in this match also, somehow, revived some of the less discussed aspects of TopCoder experience. While being able to solve problems correctly is and should remain the main focus, there are other elements that may affect a coder's performance. Many of these fall in the 
cateogry of controlling the "uncontrollables" and require an inspired assessment of the situation.
<br />
<br />
For the first problem in the set, SwappingMarbles, <tc-webtag:handle coderId="22269902" context="algorithm"/> quickly sent in a solution that was so simple, so neat and so wrong ... "return 0". While he didn't get too close to solving the problem, he was at least inspired in choosing the  most universal value that a TopCoder problem could return. <tc-webtag:handle coderId="22054923" context="algorithm"/> saw in it the potential for a challenge, so he chose example 2 in the problem statement, the only one that returned a 0. A lesson that many of us can learn from this is that no matter how heated the challenge phase may become, it is important to keep our composure and throw at least a one-second look on what's on the screen. This strategy pays off in the long run. While not all the wrong solutions are "return 0", quite a few of them present a particular area of interest for the challenger, and one quick look can make a big improvement in accuracy. Another thing to keep in mind is that attempting to challenge with an example test is usually a very bad idea. It is quite easy to preapare a fairly difficult test and copy it in the clipboard. 

<br />
<br />
The second problem, ProbCalc, allowed for quite a lot of different solving methods. <tc-webtag:handle coderId="20246344" context="algorithm"/>'s approach was quite an ingenious one, as he  used the random() function. His code managed to survive to 6 challenges and through most of the system tests. To <tc-webtag:handle coderId="22663143" context="algorithm"/>'s disappointment, his unsuccessful challenge was the very test for which <tc-webtag:handle coderId="20246344" context="algorithm"/>'s problem failed the system tests. In <tc-webtag:handle coderId="22663143" context="algorithm"/>'s case a few odd milliseconds may have made the difference between -25 and +50 points. As for <tc-webtag:handle coderId="20246344" context="algorithm"/>, he was probably hoping for a system test rerun. This was actually the first time I heard about such a scenario. For more details, you can look on the final paragraphs of the <a href="http://www.topcoder.com/tc?module=Static&d1=tutorials&d2=probabilities"> Understanding Probabilities</a> article, which briefly discuss the advantages of using Randomized Algorithms and the prospect of challenging them.

<br />
<br />
The hard problem, ForestGarbage, gave a bit of headache to the experienced <tc-webtag:handle coderId="14886245" context="algorithm"/>. A few minutes before the coding phase ended, he was in the top position. But he noticed a bug that, although hard to find with a bunch of random tests, could had easily been exploited by a challenge. The most conservative decision was to resubmit, and he probably did the right thing in doing so. Resubmitting whenever you find a bug in your code is almost always the best thing to do.
 
 
<H1> 
The Problems 
</H1>
</p> 
<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6882&amp;rd=10652" name="6882">SwappingMarbles</a></b> 
</font> 
<A href="Javascript:openProblemRating(6882)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506244" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      132 / 159 (83.02%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      128 / 132 (96.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Weiqi</b> for 247.48 points (2 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      202.71 (for 128 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

The straightforward way to solve this problem is to check for every possible pair of marbles that can be swapped. As we choose one of these pairs, we consider the two marbles in the pair to be the middle points of the 3-marble groups formed together with their left and right neighbors. The Java code below shows the comparisons that need to be made:

<pre>
public int swaptions(String colors1, String colors2) {
    int nsol = 0;
    for(int i = 1; i < colors1.length() - 1; i++) 
      for(int j = 1; j < colors2.length() - 1; j++) 
    if(colors1.charAt(i-1) == colors2.charAt(j) && colors2.charAt(j) == colors1.charAt(i+1) &&
         colors2.charAt(j-1) == colors1.charAt(i) && colors1.charAt(i) == colors2.charAt(j+1)) nsol++;
    return nsol;
  }
</pre>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7318&amp;rd=10652" name="7318">ProdCalc</a></b> 
</font> 
<A href="Javascript:openProblemRating(7318)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506244" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      65 / 159 (40.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      45 / 65 (69.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomekkulczynski</b> for 482.52 points (5 mins 26 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      357.63 (for 45 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Because of the small constraints, there were quite a lot of ways to approach this problem. The quickest way around was to use a recursive algorithm such as the one below:

<pre>
long test = 1;
long solve(int digit, int n, int ops, long val) {
    if (digit > 9 || val >= test) return -1;
    if (ops == 0) return val;
    long ret = solve(digit,n,ops-1,val*digit);
    return Math.max(ret,solve(digit+1,n,ops,val));
}
public long highest(int d, int op) { 
    for (int a = 0; a < d; a++) test *= 10;
    return solve(2,d,op,1); 
}
}
</pre>

Thinking of something a bit different, one could notice for example that multiplying by 9 is the same as multiplying by 3 two times. Thus, it is enough to only generate the prime factors up to 9. As every number has a unique prime factor decomposition: 2 ^ m2 + 3 ^ m3 + 5 ^ m5 + 7 ^ m7, we can just assign values to these factors and work our way out from there. There is a little wrinkle, however -- we also need to know if such a number can be obtained by applying exactly <b> op </b> operations. For a given 4-uple (m2, m3, m5, m7) we can do the following:
<pre>
       maxop = m2 + m3 + m5 + m7;
       minop = m5 + m7 + m2 / 3 + m3 / 2;
       if(m2 % 3 == 2 && m3 % 2 == 1) minop += 2;     
           else if(m2 % 3 > 0 || m3 % 2 > 0 ) minop += 1;
</pre>
We finally need to check whether <b> op </b> is between minop and maxop, inclusive. 

<br /><br />
While the method above is quite efficient, there are also less sophisticated methods available. With just about 200 possible test cases, one could simply compute all the values with a much slower algorithm, and then just select the proper result from a list. This is a good trick to keep in mind.
<br /><br />
As for using random algorithms to treat degenerate cases, or even figure out the multipliers, it is quite possible to make them work for a problem such as this - but since there are many cleaner solutions available, they should only be used as a last resort.
<br /><br />


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6883&amp;rd=10652" name="6883">ForestGarbage</a></b> 
</font> 
<A href="Javascript:openProblemRating(6883)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506244" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
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
      31 / 159 (19.50%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      25 / 31 (80.65%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>nima.ahmadi</b> for 765.89 points (16 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      606.34 (for 25 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

To solve this problem, we first need to correctly represent our search space. One method that comes to mind is to assign different costs to different paths we might take. There are three options available to us: walking in a free empty cell for a cost of 0 (note that we do not need to minimize the length of our path), walking in a cell that neighbors a garbage cell (for a cost of 1) and walking right into a garbage cell. We must ensure that the cost of walking through a garbage cell is greater than all the other potential costs combined. It can happen (as <tc-webtag:handle coderId="14886245" context="algorithm"/> later noticed) that we may even need to visit about half the total number of cells instead of choosing a path with only 2 or 3 cells, out of which one is filled with garbage. Considering this, we can safely assign to a garbage cell a cost of 10000 (we should also be careful not to put too high a number, in order to avoid overflow).
<br /><br />
After having all the costs represented, we can retain for every cell the minimal cost needed to reach it from the starting cell. As the constraints are not so large, one could solve this problem by computing all these costs step by step (after 1 step, after 2 steps, and so on ...) until we are sure no more changes are being made. Java code follows:

<pre>
public int[] bestWay(String[] forest) {
    int a[][] = new int[51][51];
    int b[][] = new int[51][51];
    int c[][] = new int[51][51];
    int sol[] = new int[2];

    int n = forest.length;
    int m = forest[0].length();
    int MAX = 10000 * 10000;
    int fx = -1, fy = -1;

    for(int i = 0; i < n; i++)
      for(int j = 0; j < m; j++) {
    a[i][j] = MAX;
    if(forest[i].charAt(j) == 'S') { 
          a[i][j] = 0; c[i][j] = 0;
        }
    if(forest[i].charAt(j) == 'F') {
      fx = i; fy = j; c[i][j] = 0;
    }
    if(forest[i].charAt(j) == 'g') c[i][j] = 10000;
    if(forest[i].charAt(j) == '.') {
      c[i][j] = 0;
      if(i>0 && forest[i-1].charAt(j) == 'g') c[i][j] = 1;
      if(i<n-1 && forest[i+1].charAt(j) == 'g') c[i][j] = 1;
      if(j>0 && forest[i].charAt(j-1) == 'g') c[i][j] = 1;
      if(j<m-1 && forest[i].charAt(j+1) == 'g') c[i][j] = 1;
    }
    }

    for(int k = 0; k <= n * m; k++)
    {
    for(int i = 0; i < n; i++) 
          for (int j = 0; j < m; j++) b[i][j] = a[i][j];

    for(int i = 0; i < n; i++)
      for(int j = 0; j < m; j++)
      {
        if(i>0 && c[i][j] + a[i-1][j] < b[i][j]) b[i][j] = c[i][j] + a[i-1][j];    
        if(i<n-1 && c[i][j] + a[i+1][j] < b[i][j]) b[i][j] = c[i][j] + a[i+1][j];
        if(j>0 && c[i][j] + a[i][j-1] < b[i][j]) b[i][j] = c[i][j] + a[i][j-1];
        if(j<m-1 && c[i][j] + a[i][j+1] < b[i][j]) b[i][j] = c[i][j] + a[i][j+1];          
      }
    
    for(int i = 0; i < n; i++) 
      for(int j = 0; j < m; j++) a[i][j] = b[i][j];
    }
    
    sol[0] = a[fx][fy] / 10000;
    sol[1] = a[fx][fy] % 10000;
    return sol;
  }

</pre>


 

<div class="authorPhoto">
    <img src="/i/m/supernova_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7371063" context="algorithm"/><br />    <em>TopCoder Member</em>
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
