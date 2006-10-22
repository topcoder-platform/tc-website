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
<tc-webtag:forumLink forumID="505982" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 307</span><br>Wednesday, June 14, 2006
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The overall level of the problem set this time was a bit higher than usual. It led to an interesting challenge phase and unexpected results after system test. This SRM had the most average value of challenges during the last half of the year. <b>Egor</b> was the first in Division 1 who submitted all problems on the 45th minute. But the division winner was <b>marek.cygan</b>, the only competitor who passed all three problems. Second place went to <b>misof</b>, and third to <b>krijgertje</b>.
</p>
<p>
The division 2 leaders are <b> SpaceFlyer</b>, <b>DaTval</b> and <b>taruntheone</b>. The only person who solved the hard problem is <b>abi20sg</b>.
</p>
 
<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6081&amp;rd=9987"
name="6081">BootsExchange</a></b>
</font>
<A href="Javascript:openProblemRating(6081)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505982"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      279 / 295 (94.58%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      187 / 279 (67.03%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>vlad_D</b> for 248.77 points (2 mins 0 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      206.84 (for 187 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The answer for this problem is the total number of pairs <b>N</b> subtracted by the number of already matched pairs. Clearly, if you remove all already matched pairs, all the remaining boots will be of different size. So  either all left or all right shoes should be replaced.
</p>
<p>Here is the sample code:</p>
<pre>

public class BootsExchange {
    static final int MAX_SIZE = 1000;

    public int leastAmount(int[] left, int[] right) {
        int n = left.length;
        int[] leftCount = new int[MAX_SIZE];
        int[] rightCount = new int[MAX_SIZE];
        for (int i = 0; i &lt; n; i++) {
            leftCount[left[i] - 1]++;
            rightCount[right[i] - 1]++;
        }
        int same = 0;
        for (int i = 0; i &lt; MAX_SIZE; i++)
            same += Math.min(leftCount[i], rightCount[i]);
        return n - same;
    }
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6447&amp;rd=9987"
name="6447">PartSorting</a></b>
</font>
<A href="Javascript:openProblemRating(6447)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505982"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
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
      207 / 295 (70.17%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 207 (14.98%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>DaTval</b> for 468.51 points (7 mins 27 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      304.26 (for 31 correct submissions) 
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
      278 / 293 (94.88%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      131 / 278 (47.12%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 246.92 points (3 mins 10 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      188.15 (for 131 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
The solution of this problem is pretty straightforward and based on the greedy approach. First we need to put at the first place the greatest number we can. To do this we need to choose the greatest element with index no more than <b>nSwaps</b> and move it to the first place using arbitrary amount of swaps. Decreasing <b>nSwaps</b> by the corresponding number of moves, repeat the process unless <b>nSwaps</b> will be zero or all the positions in the array will be processed. 
</p>

<p>
Natural implementation of the described algorithm has the time complexity <i>O</i>(n<sup>2</sup>), where n is the size of the given array.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6083&amp;rd=9987"
name="6083">PreprimeNumbers</a></b>
</font>
<A href="Javascript:openProblemRating(6083)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505982"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
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
      54 / 295 (18.31%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1 / 54 (1.85%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>abi20sg</b> for 461.10 points (43 mins 23 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      461.10 (for 1 correct submission) 
    </td>
  </tr>
</table></blockquote>
<p>
Let integer number i have the canonical decomposition p1<sup>a1</sup>p2<sup>a2</sup> ... pk<sup>ak</sup>, where p1 &lt; p2 &lt; ... &lt; pk are prime numbers and a1, a2, ..., ak are greater than zero. Let divs[i]  be the sum of a1, ..., ak for the number i, in case of k=1 divs[i] should be decreased by one.
</p>

<p>
Obviously the number is prerime if and only if it is equal to the product of two distinct primes or to some prime raised to the third power. Therefore number i is prerime if and only if divs[i] is equal to 2. 
</p>

<p>

Let's iterate through all numbers from 2, assuming the value of divs[i] is already calculated before i-th iteration -- hence if divs[i] is zero, the number i is prime. In this case increase divs[j] by corresponding value for all j divisible by i.
</p>

<p>
For clarification see the sample code below:
</p>

<pre>
public class PreprimeNumbers {
    public static int MAX_VALUE = 6000000;
    public int nthNumber(int n) {
        int cnt = 0, i;
        int[] divs = new int[MAX_VALUE];
        for (i = 2; cnt &lt; n; i++) {
            if (divs[i] == 0) {
                for (int j = 2 * i; j &lt; MAX_VALUE; j += i) {
                    int t = j;
                    while (t % i == 0) {
                        divs[j]++;
                        t /= i;
                    }
                    if (t == 1) {
                        divs[j]--;
                    }
                }
            }
            if (divs[i] == 2) {
                cnt++;
            }
        }
        return i - 1;
    }
}
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6448&amp;rd=9987"
name="6448">TrainRobber</a></b>
</font>
<A href="Javascript:openProblemRating(6448)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505982"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      104 / 293 (35.49%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      10 / 104 (9.62%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>misof</b> for 349.94 points (20 mins 33 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      244.13 (for 10 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>

To solve this problem it is necessary to have a way to get bridges in order of appearance. Let's put first bridge from each sequence to the priority queue. The top bridge in the queue is the current one. After the retrieving of the current bridge from the queue, let's put the next bridge from the corresponding sequence to the queue. The position of the next bridge can be easily found by increasing the current position by the corresponding period.

Knowing the current position of the robber on the train and his absolute position, it is easy to find the number of carriages he will be able to pass while the next bridge will be above him. Here is the sample java code doing this:

<pre>
double carriagePassTime = (1.0 * length) / robberSpeed;
double timeAdd = (nearestBridge - posAbsolute) / (trainSpeed + robberSpeed);
int carriagesAdd = (int)Math.floor(timeAdd / carriagePassTime + EPS);
</pre>

The next robber position on the train is equal to the sum of his current position and <pre style="display:inline;">carriagesAdd * length</pre>. The next absolute position of the robber is equal to the position of the next bridge.<br>
<br>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=6449&amp;rd=9987"
name="6449">SplitAndMergeGame</a></b>
</font>
<A href="Javascript:openProblemRating(6449)"><img src="/i/rate_it.gif"
hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=505982"
CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      44 / 293 (15.02%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      6 / 44 (13.64%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>marek.cygan</b> for 724.12 points (19 mins 8 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      561.12 (for 6 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Among all the shortest sequences of the moves exists at least 
one in which all operations of the merge precedes the operations of 
the split. Let's consider the sequence of the moves where some split 
stands before merge. We can't swap them if and only if the operation 
of the merge uses one of the resulting piles of the split operation. 
Among such pairs of split and merge operations let's choose one 
in which the distance between the merge and the split is the least. 
Let's denote the pile was split with a, the resulting piles with a1 
and a2. Let pile b be merged with pile a1 and c is the result 
of this operation. So in two moves from the piles a and b we got the piles a2 and c. 
The same result can be achieved by merging piles a and b and then splitting 
the resulting pile to a2 and c. So we showed that it is possible to swap the split 
and merge operations without increasing the number of the moves.
</p>

<p>
Use so-called "meet-in-the-middle" technique 
to find the shortest sequence where all merges precedes the splits. 
With a brute force algorithm 
,let's build a list of all states which can be reached from <b>startState</b> 
using only merge operations, and  build a similar list of the states reachable 
from <b>finishState</b>. Find the common elements from both lists, state 
which has the maximal size, and call it greatestCommonState. 
Therefore the answer for the problem is 
<pre>size(startState) + size(finishState) - 2 * size (greatestCommonState)</pre>
</p>

<p>
This problem has another solution based on DP.
</p><div class="authorPhoto">
    <img src="/i/m/Mike-Mirzayanov_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="308953" context="algorithm"/><br />
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
