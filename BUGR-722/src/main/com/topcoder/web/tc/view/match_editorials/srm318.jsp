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
<tc-webtag:forumLink forumID="505993" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 318</span><br>Tuesday, August 29, 2006
<br><br>

<h2>Match summary</h2> 

<p>
This SRM was the last chance to test coding skills before the TCCC. In a tight contest,  first place in Division 1 went to <tc-webtag:handle coderId="8547850" context="algorithm"/> with the very high score of 1622.05 points. Second and third went to <tc-webtag:handle coderId="156592" context="algorithm"/> and <tc-webtag:handle coderId="260835" context="algorithm"/> respectively.
</p>
<p>
The Division 2 winner was <tc-webtag:handle coderId="10509376" context="algorithm"/> followed by <tc-webtag:handle coderId="22641658" context="algorithm"/> and <tc-webtag:handle coderId="21475659" context="algorithm"/>.
</p>
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6677&amp;rd=9998" name="6677">BiggestRectangleEasy</a></b>
</font>
<A href="Javascript:openProblemRating(6677)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505993" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      411 / 434 (94.70%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      395 / 411 (96.11%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>stupidcoder</b> for 249.62 points (1 mins 7 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      219.10 (for 395 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
If one of the sides of the rectangle is known and equal to X, the other side can be easily 
found by the formula (<b>N</b> - 2 * X) / 2, which gives the biggest size of the side is possible 
to achieve using remaining sticks. The problem constraints allow you to iterate through all possible sizes of the one side. Using the formula above it is possible to calculate the size of another side and area of the rectangle. The answer is the biggest area we have.
</p>
<p>
However, it is possible to find the answer without iterating. 
If one of the sides of the optimal rectangle is <b>N</b> / 4, the other can be found using the 
formula above. This follows from the fact that sizes of the sides should be as close 
as possible.  Let's consider a rectangle with sides X and Y where X &le; Y. 
Let's consider another rectangle with the same perimeter and sizes X-1 and Y+1. 
Its area is (X-1)*(Y+1) = X*Y - (Y - X) - 1. The resulting area is smaller than 
the area of the original rectangle X*Y since "Y - X" is a non-negative number. 
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6684&amp;rd=9998" name="6684">ReturnToHome</a></b> </font> <A href="Javascript:openProblemRating(6684)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505993" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      216 / 434 (49.77%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      86 / 216 (39.81%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>v18h0r</b> for 495.47 points (2 mins 43 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      289.06 (for 86 correct submissions) 
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
      356 / 417 (85.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      292 / 356 (82.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>reid</b> for 247.98 points (2 mins 34 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      182.63 (for 292 correct submissions) 
    </td>
  </tr>
</table></blockquote>

<p>
This problem can be solved by trying all possible ways to get home and choosing the optimal. There are two principle cases: when the starting point is in the radius of one jump from home and when it is not. 
</p>
<p>
In the first case there are three variants to get home:
</p>
<ul>
<li>Walk directly to home (like in example 3).</li>
<li>Make one jump in the direction of home and make the walk back (like in the example 1).</li>
<li>Make two jumps (like in example 5).</li>
</ul>
<p>
In the second case there are also three variants:
</p>
<ul>
<li>Walk directly to the home (the case when <b>D</b> &gt; <b>T</b>).</li>
<li>Make several jumps in the direction of home while the remaining distance will be less than <b>D</b> and walk the remaining distance (like in the examples 0 and 4).</li>
<li>Make one jump more than in the previous variant. The covered distance will be greater than the distance from the starting point to the home and it is possible to get home using this number of jumps by moving by some arc (like in the example 2).</li>
</ul>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6685&amp;rd=9998" name="6685">SimplifiedDarts</a></b>
</font>
<A href="Javascript:openProblemRating(6685)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505993" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      52 / 434 (11.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      23 / 52 (44.23%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gozman</b> for 867.66 points (11 mins 27 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      626.76 (for 23 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Let A(N, W) be the probability to win if N throws remained and it is required to get W points.
To calculate A(N, W) it is necessary to choose the distance to throw the dart. 
Throwing from the short distance will give P1*A(N - 1, W - 2) + (1 - P1)*A(N - 1, W) probability to win. Throwing from the long distance will give P2*A(N - 1, W - 3) + (1 - P2)*A(N - 1, W) probability to win. A(N, W) is the maximum of the probability for the short and the long distance.
</p>
<p>Here is the sample solution by <tc-webtag:handle coderId="22641658" context="algorithm"/>.</p>

<pre>
public class SimplifiedDarts {
  double[][] x;
  
  private double get(int i, int j) {
    if (j &lt; 0)
      return x[i][0];
    else
      return x[i][j];
  }

  public double tryToWin(int W, int N, int P1, int P2) {
    x = new double[N+1][W+1];
    double p1 = 0.01 * P1;
    double p2 = 0.01 * P2;
    
    for (int i=0; i&lt;=N; i++)
      x[i][0] = 1;
    for (int i=1; i&lt;=W; i++)
      x[0][i] = 0;
    for (int i=1; i&lt;=N; i++)
      for (int j=1; j&lt;=W; j++) {
        x[i][j] = Math.max(p1*get(i-1,j-2) + (1-p1)*get(i-1,j),
                  p2*get(i-1,j-3) + (1-p2)*get(i-1,j));
      }
    
    return x[N][W]*100;
  }
}
</pre>

</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6216&amp;rd=9998" name="6216">CyclicGame</a></b> </font> <A href="Javascript:openProblemRating(6216)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505993" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      135 / 417 (32.37%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      103 / 135 (76.30%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 585.48 points (4 mins 29 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      414.17 (for 103 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The simplest way to solve the problem is to simulate the process. Let A(N, i) be the expectation of the bank if the current position is cell i and not more than N throws of the dice is left. To calculate A(N, i) it is necessary to take the best of two ways: to end the game or to throw the dice. In the first case A(N, i) is equal to zero. In the second case A(N, i) can be calculated using the following formula: 1/6 * (cells[i+1] + A[N-1, i+1]) + : + 1/6 * (cells[i + 6] + A[N-1, i + 6]).
</p>
<p>
There is another more accurate -- but more difficult in implementation --way to solve this problem. If the current position is i, the decision to end the game or throw the dice does not depend on the bank. Let's call the cells where the game should be ended as final cells. Let's iterate through all possible values of the set of final cells. If the set of final cells is fixed, it is possible to write an equation for all non-final cells using other cells as variables. The resulting linear equations set can be solved using the <a href="http://en.wikipedia.org/wiki/Gaussian_elimination">Gaussian elimination method</a>.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6678&amp;rd=9998" name="6678">BiggestRectangleHard</a></b>
</font>
<A href="Javascript:openProblemRating(6678)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505993" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      104 / 417 (24.94%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      67 / 104 (64.42%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>marek.cygan</b> for 824.14 points (8 mins 47 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      532.85 (for 67 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
This task can be solved using  dynamic programming.
Let A(i, l1, l2, l3, l4) be true if using first i elements of <b>lengths</b> is possible to create four segments with lengths l1, l2, l3, l4 correspondingly. A(i, l1, l2, l3, l4) can be calculated using the following formula: A(i, l1, l2, l3, l4) = A(i-1, l1, l2, l3, l4) or A(i-1, l1 - lengths[i], l2, l3, l4) or A(i-1, l1, l2- lengths[i], l3, l4) or A(i-1, l1, l2, l3 - lengths[i], l4) or A(i-1, l1, l2, l3, l4- lengths[i]). The answer is the biggest l1*l3 among all the positive values of A for which l1=l2 and l3=l4. 
</p>
<p>
Clearly if the one side of the resulting rectangle is more than 40, the other side is less than 40. This fact allows to reduce the amount of memory required to solve the problem.
</p>
<p>
Here is the sample solution by <b>Vitaliy</b>:
</p>

<pre>
public class BiggestRectangleHard{
  public int findArea(int[] ll){
    int s = 0;
    for(int i = 0; i&lt;ll.length;i++)
      s+=ll[i];
    int t = s/2;
    int t1= t/2;
    int t2=t-1;
    int n =ll.length;
    boolean[][][][] res = new boolean[t1+1][t1+1][t2+1][t2+1];
    res[0][0][0][0]=true;
    for(int nn = 0;nn&lt;n;nn++)
    for(int i = t1;i&gt;=0;i--)
      for(int j= t1; j&gt;=0;j--)
        for(int k=t2;k&gt;=0;k--)
          for(int l=t2;l&gt;=0;l--)
            if (res[i][j][k][l]){
              if (i+ll[nn]&lt;=t1) res[i+ll[nn]][j][k][l] = true;
              if (j+ll[nn]&lt;=t1) res[i][j+ll[nn]][k][l] = true;
              if (k+ll[nn]&lt;=t2) res[i][j][k+ll[nn]][l] = true;
              if (l+ll[nn]&lt;=t2) res[i][j][k][l+ll[nn]] = true;
            }
    int best = -1;
    for(int i = 1;i&lt;=t1;i++) for(int j=1;j&lt;=t-i;j++){
      if (res[i][i][j][j]){
        int k = i*(j);
        if (k&gt;best)
          best = k;
      }
    }
    return best;
  }
}
</pre>
</p><div class="authorPhoto">
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
