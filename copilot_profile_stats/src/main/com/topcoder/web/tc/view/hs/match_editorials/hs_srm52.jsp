<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics: TCHS SRM 52 Problem Set &amp; Analysis</title>

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
    <a href="/tc?module=Static&amp;d1=hs&amp;d2=match_editorials&amp;d3=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <a href="/tc?module=HSRoundOverview&amp;rd=13485&amp;snid=3&amp;er=5">Match Overview</a><br />

<tc-webtag:forumLink forumID="521927" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 52</span><br />Tuesday, July 1, 2008
<br /><br />


<h2>Match summary</h2> 

<p> 
The third match of the third TCHS season was an exciting match for the 67 young competitors.  After an exciting challenge phase in which the lead changed hands several times, <tc-webtag:handle coderId="22664055" context="hs_algorithm"/> was victorious after solving all problems and gaining seven successful challenges.  <tc-webtag:handle coderId="22663117" context="hs_algorithm"/> took second place with eight challenges, and <tc-webtag:handle coderId="22263204" context="hs_algorithm"/> rounded out the top three.
</p> 
 
<H1> 
The Problems 
</H1>
</p> 

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9822&amp;rd=13485" name="9822">TournamentJudging</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9822)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&forumID=521927" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      51 / 53 (96.23%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      49 / 51 (96.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>xiaowuc1</strong> for 249.24 points (1 mins 34 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      231.36 (for 49 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem has a reasonably straightforward solution.  In order to round each quotient to the nearest integer, several paths are available.  Some competitors used pre-built libraries, while others simply added 0.5 to the raw score after division and before rounding.  As some people worry about double imprecision when doing this, one can instead use only integers by adding conversionFactor/2 to the raw score prior to division; this guarantees that the result will round correctly.

<pre>
public int getPoints(int[] rawScore, int[] cF)
{

int ret = 0;
for(int i=0; i &lt; cF.length; i++)
    ret += (rawScore[i] + cF[i]/2)/cF[i];
return ret;
}
</pre>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9730&amp;rd=13485" name="9730">RRSchedule</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9730)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&forumID=521927" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      43 / 53 (81.13%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 43 (48.84%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Token</strong> for 471.36 points (7 mins 5 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      348.74 (for 21 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
A simple approach to this problem is to simulate the problem as the statement describes.  If we let T be the maximum value in tasks, and N be the number of elements in tasks, this leads to a O(NT) solution.  However, T can be up to 20,000,000, which would lead to 1,000,000,000 steps in the worst case.  This is too large, so we must optimize the problem further.
</p><p>
The run time can be reduced by looping through the array and finding the minimum nonzero value M.  If there are P processors still active, then we can simulate the next P*(M-1) time steps by subtracting M-1 from each active processor.  This reduces the runtime to O(N<sup>2</sup>), which is more than sufficient for this problem.
<pre>
public int[] terminalTimes(int[] tasks)
{
int N = tasks.length;
int[] ret = new int[N];
int curTime = 0;
int P = N;

while(P &gt; 0)
{    int M = 1000000000;
    for(int i=0; i &lt; N; i++)    // Get M
        if(tasks[i] &gt; 0) M = Math.min(tasks[i], M);
    
    curTime += (M-1)*P;
    for(int i=0; i &lt; N; i++) 
        if(tasks[i] &gt; 0) tasks[i] -= M-1;
        
            // now simulate the next steps
    for(int i=0; i &lt; N; i++)
    {
        if(tasks[i] == 0) continue;
        curTime++;
        tasks[i]--;
        if(tasks[i] == 0)
        {    ret[i] = curTime;
            P--;
        }
    }
}

return ret;

}
</pre>

</p>

<font size="+2"> 
<strong><a href="/stat?c=problem_statement&amp;pm=9754&amp;rd=13485" name="9754">MarblesInABag</a></strong> 
</font> 
<a href="Javascript:openProblemRating(9754)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></a> 
<a href="http://forums.topcoder.com/?module=ThreadList&forumID=521927" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></a>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Value</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Submission Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      21 / 53 (39.62%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Success Rate</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      11 / 21 (52.38%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>High Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>tourist</strong> for 880.54 points (10 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <strong>Average Score</strong> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      641.75 (for 11 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Assume that we currently have <strong>b</strong> blue marbles and <strong>r</strong> red marbles, and that it is our turn.  You may draw a red marble from the bag; this will happen with probability <strong>r</strong>/(<strong>r</strong>+<strong>b</strong>), and after Sid's turn will leave you at the state (<strong>r-1</strong>, <strong>b-1</strong>).  Similarly, if you instead draw a blue marble, you will move to the state (<strong>r</strong>, <strong>b-2</strong>), with probability <strong>b</strong>/(<strong>b</strong>+<strong>r</strong>).  This sets up a nice DP relation that normally would work well, but for the fact that the table will take up too much room in memory.  Thus, we need to find a way to conserve memory.  
</p><p>
In the above recursion, you can see that there will always be <strong>b</strong>+<strong>r</strong>-2 marbles after Sid's next turn.  Thus, we can change the state to (total_marbles, red_marbles).  We win if we reach any state (n, 0), and lose if we get to a state of (n, n); this is our base case.  Since all calculations of n marbles are based only on the calculations from states involving n-2 marbles, we can use O(n) memory by keeping two arrays; one containing the answers from the n-2 marble state, and another where we build our answers for the n marble state.  After building each row, we can swap the arrays, and compute the following step.  Thus, our answer will be (<strong>b</strong>+<strong>r</strong>, <strong>r</strong>).  See <tc-webtag:handle coderId="22263204" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&amp;cr=22263204&amp;rd=13485&amp;pm=9754">solution</a> for a clean implementation of this approach.
</p><p>
For those who enjoy code optimization, <tc-webtag:handle coderId="22663117" context="hs_algorithm"/>'s <a href="/tc?module=HSProblemSolution&amp;cr=22663117&amp;rd=13485&amp;pm=9754">solution</a> actually uses O(N<sup>2</sup>) memory.  Since the sum of red and blue marbles must be odd on your turn, we can store the table in a 2D array as (red, blue/2); the integer division cuts the size of the table in 2, making it just small enough to fit into memory.

</p>
 

<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="7296000" context="algorithm" /><br />    <em>TopCoder Member</em>
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
