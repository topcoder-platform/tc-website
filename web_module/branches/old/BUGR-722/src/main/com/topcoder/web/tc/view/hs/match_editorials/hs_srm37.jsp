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
    <A href="/tc?module=HSRoundOverview&rd=10776&snid=2&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="516563" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 37</span><br>Tuesday, August 7, 2007
<br><br>

<h2>Match summary</h2> 

<p> 
The TCHS SRM 37 attracted 75 coders, 17 of them newcomers.
Due to system problems, the challenge phase was nullified, so only the coding and system test phases decided the results. 
Submission rates were pretty high and there were 24 coders who submited all three problems, and many of these were done in half the available time. It was the third problem that defined the match winners.
A lot of hards went down during system tests -- at the end, only 6 coders remained who had all three solutions.


<tc-webtag:handle coderId="21185521" context="hs_algorithm"/>
won the match. Close behind was
<tc-webtag:handle coderId="22663117" context="hs_algorithm"/>
followed by
<tc-webtag:handle coderId="22660173" context="hs_algorithm"/>.
</p> 

 

<h1>

The Problems

</h1>

<p></p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7850&amp;rd=10776" name="7850">BestHotel</a></b>

</font>

<a href="javascript:openProblemRating(7850)"><img src="/i/rate_it.gif" alt="rate it" border="0" hspace="10"></a>

<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=516563" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"></a>

<br>

Used as: Division One - Level One: <blockquote><table cellspacing="2">

  <tbody><tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      250

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      57 / 64 (89.06%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      43 / 57 (75.44%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>gstsclq</b> for 248.33 points (2 mins 20 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      210.07 (for 43 correct submissions)

    </td>

  </tr>

</tbody></table></blockquote>




<p>



The one task that is needed to do is implement a function to determine whether an <i>x</i>-th hotel is disadvantageous or not. It can be done straightforwardly by following the definition from the problem statement.

<pre>public boolean isDisadvantageous(int x){
   for(int y = 0; y &lt; n; y++) 
      if (price[x] &gt;= price[y] &amp;&amp; quality[x] &lt;= quality[y])
         if (price[x] &gt; price[y] || quality[x] &lt; quality[y]) 
            return true;
   return false;
}</pre>
   
<p>Clearly, we'll get the result for our problem by calling this function for each hotel.
  The time complexity of this solution is O(<i>n<sup>2</sup></i>), where <i>n</i> is the number of hotels. 
Here, the constraints were low enough so the time complexity doesn't matter. Notice, though, that this problem can be also solved in O(<i>n</i> * log <i>n</i>) as well.</p>
<p></p>
    

    

    
 
    
<font size="+2">
    
<b><a href="/stat?c=problem_statement&amp;pm=7602&amp;rd=10776" name="7602">BooksNumbering</a></b>
    
</font>
    
<a href="javascript:openProblemRating(7602)"><img src="/i/rate_it.gif" alt="rate it" border="0" hspace="10"></a>
    
<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=516563" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"></a>
    
<br>
  Used as: Division One - Level Two: </p>
<blockquote><table cellspacing="2">

  <tbody><tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      500

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      45 / 64 (70.31%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      42 / 45 (93.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>miroslavb</b> for 484.33 points (5 mins 8 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      362.79 (for 42 correct submissions)

    </td>

  </tr>

</tbody></table></blockquote>



<p>
Denote <i>b</i> as the number of books in the library.
The naive soluion would be based on a linear search of the value <i>b</i>. 
Due to the constraints from the problem's statement, such a solution may be not fast enough.
There are two general methods that can be used to improve such a linear search.
The first is to use binary search for the value <i>b</i>. In this case, the only thing we need to do is implement a function to determine the number of used digits in the labeling 1,2,...,<i>b</i>.
The second method, which was chosen by a majority of coders, uses sequentional search for the number of digits of <i>b</i>. 
The total number of one-digit numbers is 9, of two-digit numbers is 90, of three-digit numbers is 900, etc. This counting will be stopped when the total number of digits is enough. 
See <tc-webtag:handle coderId="22065595" context="hs_algorithm"/>'s fastest 
<a href="/tc?module=HSProblemSolution&cr=22065595&rd=10776&pm=7602">solution</a>
for a clear implementation of this.

</p>






 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7660&amp;rd=10776" name="7660">SumoTournament</a></b>

</font>

<a href="javascript:openProblemRating(7660)"><img src="/i/rate_it.gif" alt="rate it" border="0" hspace="10"></a>

<a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=516563" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0"></a>

<br>

Used as: Division One - Level Three: <blockquote><table cellspacing="2">

  <tbody><tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Value</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      1000

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Submission Rate</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      25 / 64 (39.06%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      6 / 25 (24.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>neal_wu</b> for 791.58 points (15 mins 27 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: rgb(238, 238, 238) none repeat scroll 0%; -moz-background-clip: -moz-initial; -moz-background-origin: -moz-initial; -moz-background-inline-policy: -moz-initial;">

      617.66 (for 6 correct submissions)

    </td>

  </tr>

</tbody></table></blockquote>

<p>

Let <i>n</i> denote the number of wrestlers. Clearly, the total number of all registrations is 2<sup><i>n</i></sup>, 
because each wrestler can be registered in or not. Any of these registrations (maybe all of them) can satisfy the constraint about average weight. Due to the time limit, a solution cannot be based on checking all registrations.
<p>
First, the idea of sorting weights in non-decreasing order seems to be useful for a start. 
To make our solution fast enough we need to use dynamic programming. 
Let <tt>A[i][j][w]</tt> be true if, out of the first <i>i</i> wrestlers you can select <i>j</i> of them with a total sum of weight <i>w</i>. 
It is now obvious that 
<tt>A[i][j][w]</tt> =
<tt>A[i-1][j][w]</tt> <tt>OR</tt>
<tt>A[i-1][j-1][w-weight<sub>i-1</sub>]</tt>. 
Moreover, if the second theorem is satisfied, the <i>i</i>-th wrestler can be used, and will be the weightiest.

This idea will bring us a solution with a time complexity O(maxWeight * <i>n</i><sup>3</sup>), 
which is close to the time limit.
</p>

<p>
A trick to improve it is based on a different use of the average weight. Let's
subtract the value of <b>averageWeight</b> from each item of <b>weight</b>. 
For instance, from weights {80,90,100,110} and averageWeight=95 we obtain values {-15,-5,+5,+15}. Clearly, a zero sum of any such subtracted values represents a selection of wrestlers with the target average weight. 
So, the last task is to balance a zero weight from such modified values by using as big a weight as possible. 
According to this, we can erase the third index in the previous solution.
Let <tt>B[i][w]</tt> be true if, out of first <i>i</i> values, we can  balance the weight <i>w</i>. It is now obvious that
<tt>B[i][w]</tt> =
<tt>B[i-1][w]</tt> <tt>OR</tt>
<tt>B[i-1][w-weight<sub>i-1</sub>]</tt>. 
Moreover, the <i>i</i>-th wrestler can be used in balancing as the weightiest if the value <tt>B[i][0]</tt> is also satisfied by the second term from the previous formula.

This idea brings us a solution with a time complexity O(maxWeight * <i>n</i><sup>2</sup>). 
The following code is an implementation of that.

<pre>public int maxWeight(int[] weight, int averageWeight){

    Arrays.sort(weight);
    for(int i=0; i &lt; weight.length; i++) weight[i] -= averageWeight;
    
    final int MAX = 50*200*2 + 5;
    boolean B[][] = new boolean[51][MAX];
    final int ZERO = MAX/2;
    Arrays.fill(B[0],false);
    B[0][ZERO] = true;

    int ret=-1;
    for(int i = 1; i &lt;= weight.length; i++)
       for(int w = Math.max(0,weight[i-1]); w &lt; Math.min(MAX,MAX+weight[i-1]); w++){
           B[i][w] = B[i-1][w];
           if (B[i-1][w-weight[i-1]]) {
              B[i][w] = true;
              if(w == ZERO) ret=Math.max(ret,weight[i-1] + averageWeight);
           }
       }
    return ret;
}</pre>

A lot of coders used an integer structure, where the values directly correspond to the answer - the maximal possible weight of any wrestler.
Moreover, the space complexity in both solutions described above can be improved. 
See 
<tc-webtag:handle coderId="22660173" context="hs_algorithm"/>'s 
<a href="/tc?module=HSProblemSolution&cr=22660173&rd=10776&pm=7660">solution</a>
for a clear implementation.



</p>
<p>&nbsp;</p>
 

<div class="authorPhoto">
    <img src="/i/m/Janq_big.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="10389461" context="algorithm"/><br />    <em>TopCoder Member</em>
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
