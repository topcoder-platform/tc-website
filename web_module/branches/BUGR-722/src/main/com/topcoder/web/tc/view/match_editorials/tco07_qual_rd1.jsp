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
    <A href="/stat?c=round_overview&er=5&rd=10730">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514899" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open <br> Qualification Round 1 </span><br>Thursday, March 29, 2007
<br><br>


<h2>Match summary</h2> 

<p>
The TopCoder Open 2007 started for Algorithm competitors with Qualification Round 1. 
This round -- the first of three chances to qualify for Online Round 1 -- attracted several very high-rated competitors who were ineligible for a bye.
Thanks to a great challenge phase, 
<tc-webtag:handle coderId="22645831" context="algorithm"/> won this tough competition.
<tc-webtag:handle coderId="7227699" context="algorithm"/>, thanks to the fastest hard problem, finished second.
<tc-webtag:handle coderId="309982" context="algorithm"/>, TopCoder Open 2006 finalist, finished third, followed by 
<tc-webtag:handle coderId="9964455" context="algorithm"/> and TopCoder veteran
<tc-webtag:handle coderId="262936" context="algorithm"/>, who rounded out the top five.

<br />
<br />
</p> 
 
<H1>
The Problems
</H1>
</p> 

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7634&amp;rd=10730" name="7634">Snaky</a></b> </font> <A href="Javascript:openProblemRating(7634)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level One: <blockquote><table cellspacing="2">
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
      996 / 1058 (94.14%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      753 / 996 (75.60%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>anikov</b> for 248.50 points (2 mins 12 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      215.54 (for 753 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
Since the segments are horizontal or vertical and not adjacent to other segments, the fact that the drawing shows one connected snake may be nice for the snake but is no help in finding the longest segment. We just need to find the longest horizontal or vertical sequence of 'x's.
<br /><br />

One brute force approach is to consider every position in the picture as a possible starting point of the longest segment (leftmost or topmost) and count in that direction until the edge of  the picture is reached or a '.' is encountered. Then return the maximum among all those counts.
<br /><br />

Another approach is to check each row for consecutive sequences of 'x'. Do the same thing for each column and report the biggest result. Here is pseudocode for checking each row that handles all horizontal segments (whether or not they start/end at the boundary).
      
<pre>
max=0
for each row r
         count = 0
         for each column c
             if snake[r][c] is '.'
                 count=0
             else
                 count++
                 max = maximum(max,count)

</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7619&amp;rd=10730" name="7619">Bigital</a></b> </font> <A href="Javascript:openProblemRating(7619)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Two: <blockquote><table cellspacing="2">
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
      807 / 1058 (76.28%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      727 / 807 (90.09%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>murphydog</b> for 474.12 points (6 mins 42 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      331.15 (for 727 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
I really do have a friend with this clock, but power usage is not really much of an issue.  
<br /><br />

This problem is easiest to do by simply walking through each time from tStart to tEnd. For each time we count the number of bulbs that are on and keep track of the sum.
<br /><br />

To walk through all the times we can keep track of hour, minute, and second in variables. To advance to the next time just add one to second. If that results in 60, set second to 0 and add one to minute. If that results in 60, set minute to 0 and add 1 to hour. If that results in 13 set hour to 1.
<br /><br />

int[] bulb = {0,1,1,2,1,2,2,3,1,2}  captures all the information needed to count the bulbs for any digit.  At each time increase the sum by bulb[hour%10]+bulb[hour/10]+ ...  Stop when hour, minute and second match tEnd. Finally, multiply the sum by the appropriate conversion factor ( 1.0 / 3,600,000 ).

<br /><br />
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=7479&amp;rd=10730" name="7479">Alarmed</a></b> </font> <A href="Javascript:openProblemRating(7479)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A> <br> Used as: Division One - Level Three: <blockquote><table cellspacing="2">
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
      133 / 1058 (12.57%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      35 / 133 (26.32%) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>bjoeris</b> for 681.25 points (21 mins 41 secs) 
    </td>
  </tr>
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      461.57 (for 35 correct submissions) 
    </td>
  </tr>
</table></blockquote>
<p>
For any noise level A, each sensor has a circular region into which the intruder cannot go. There is a path from the entrance to the exit if and only if there is NO chain of overlapping circles that goes from the east side of the room (including the southeast and northeast) to the west side of the room.
<br /><br />

Since the bigger A is the bigger of the circles, we can do the problem by bisection. The critical value of A must lie between 0 and 100*100*10,000 based on the constraints.  When a value for A has circles big enough to form a chain that value becomes the upper limit; otherwise it becomes the lower limit for the critical value of A.
<br />
<br />

So we just need to solve the sub-problem of finding whether there is a chain of circles from east to west for a given value of A.  For each of the n sensors the radius of detection is square_root(A/ threshold[i]). We can solve this with a breadth-first search. First find all the sensors whose circles overlap the east/northeast/southeast wall and mark them. Then mark all circles that overlap a marked circle. Continue until no more progress is made.  If any of the marked circles overlap the west/northwest/southwest wall then there IS a chain. 

<br />
<br />
</p>



<div class="authorPhoto">
    <!-- <img src="/i/m/lbackstrom_big.jpg" alt="Author" /> -->
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="159544" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
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
