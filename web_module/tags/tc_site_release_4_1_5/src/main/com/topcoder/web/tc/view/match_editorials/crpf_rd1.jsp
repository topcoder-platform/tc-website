<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
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

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505613" message="Discuss this match" /></div>
<span class="bodySubtitle">CRPF Charity Challenge <br>Round 1</span><BR/>Tuesday, November 11, 2003
<br><br>

<span class="bigTitle">Summary</span>

<p> 
I always love watching, and writing about tournaments, but tonight's competition was better than usual.  
The first round of the TopCoder Charity Challenge united coders to help a great cause.  Everyone was in 
high spirits, and it seemed to affect their performance.  Coders were in top form, with 23 people scoring 
over 1000.  In an unusual twist of events, yellow rated competitors dominated the score board, with only 
2 reds winning their rooms.  indigo9, a blue rated coder, surpassed 5 higher ranked coders, including 2 
reds, to win room 5.  It is clear that Monday's final competition for the 4 winning spots will be exciting.
</p> 
  
<H1> The Problems </H1> 

<font size="+2"> 
<b>AustrianLotto</b> 
</font> 
<A href="Javascript:openProblemRating(1934)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505613" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      75 / 75 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      75 / 75 (100.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>gladius</b> for 248.13 points (2 mins 28 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      232.03 (for 75 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This is a classic tallying problem:  "Given a set of events, count how many of each variety there are."  We first allocate an array, which will hold the counts of each type.  Then we process each event, and increment the correct counter.  Once done, our array is the solution.  Java code follows:<pre>
public int[] evaluate(String drawing, String[] picks) {
   int[] ret = new int[7];
      String[] dtoks = drawing.split(" "); //Split by spaces
      for (int i = 0; i &lt; picks.length; i++) {
         String[] currToks = picks[i].split(" "); //Split by spaces
            int cnt = 0;
            for (int x = 0; x &lt; currToks.length; x++) {
               for (int y = 0; y &lt; dtoks.length; y++) {
                  if (Integer.parseInt(dtoks[y])==Integer.parseInt(currToks[x])) cnt++;
               }
            }
      ret[cnt]++; //Increment counter
   }
   return ret;
}
</pre>
</p> 

<font size="+2"> 
<b>RoomSummary</b> 
</font> 
<A href="Javascript:openProblemRating(1935)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505613" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      65 / 75 (86.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 65 (47.69%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Maris</b> for 404.29 points (14 mins 33 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      307.75 (for 31 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
In this problem, coders were required to simulate a competition round and return the scores of each player.  Since the constraints verified the round would proceed normally, no input error checking was required.  First build a 2-dimensional array whose rows represent coders, and columns represent each problem.  Next loop through each submission, and record the scores in the array.  Similarly loop through each challenge, and then each systest, recording score changes in the array.  When all is done, final scores can be extracted from the table.  Using a hand coded sort or comparator, the coders can be arranged into proper order.  The final step is to output in the correct format.  To convert from doubles, simply multiply by 100, cast to an int, and then extract the required digits.
</p> 

<font size="+2"> 
<b>CongruenceLock</b> 
</font> 
<A href="Javascript:openProblemRating(1936)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A> 
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505613" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

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
      44 / 75 (58.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      25 / 44 (56.82%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>abiczo</b> for 953.74 points (6 mins 19 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      839.90 (for 25 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Two different solutions to this problem come to mind, both of which use an array to cache results in a dynamic programming fashion.  The first method loops over the different kinds of buttons.  Once the ith iteration is complete, the array will store the least possible number of presses required to produce any target, using the first i buttons.   Code for this method follows:<pre>
public int minPushes(int current, int target, int[] buttons) {
   int[] dp = new int[100000];
   Arrays.fill(dp,-1);
   dp[current] = 0;
   for (int i = 0; i &lt; buttons.length; i++) {
      for (int xx = 0; xx &lt; dp.length; xx++) {
         int x = xx;
         if (dp[x]==-1) continue;
         int next = (x+buttons[i])%100000;
         while (dp[next] ==-1 || dp[next] &gt; dp[x]+1) { //HERE
            dp[next] = dp[x]+1;
            x = next;
            next = (next+buttons[i])%100000;
         }
      }
   }
   return dp[target];   
}
</pre>
For a given button, to efficiently account for all reachable targets, we loop over each value.  Then, in the loop marked HERE, we continually push the button, as long as it continues to improve the scores for the targets we reach.  Another method used by many coders, was to implement a table-aided breadth-first-search.  Instead of looping over buttons, we loop over the number of button presses, stopping when we reach the target.  Since the table stores the targets already produced earlier in the search, we can avoid reexamining those values.
</p> 

<p>
<img src="/i/m/brett1479_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="251317" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
