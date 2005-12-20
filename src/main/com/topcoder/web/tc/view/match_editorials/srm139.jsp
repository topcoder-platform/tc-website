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
<tc-webtag:forumLink forumID="505571" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 139</span><br>Tuesday, March 18, 2003
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This SRM featured a set of unique problems that gave many coders a hard time.  The division 
1 medium, a numerical analysis problem, had a few tricks that caught many competitors.  
The division 1 hard asked coders to embed a path on the surface of a rectangular solid.  
At first glance, the problem seems trivial, but rectangular solids aren't as simple as they look.  
As a result, few coders solved all of the problems correctly.  Once the challenge phase was over, 
antimatter led the pack with SnapDragon close behind.  In division 2, a newcomer by the name of 
aneubeck beat all competitors with an impressive 1673.43. 
</p>
                                 
<H1> The Problems </H1> 

                              <font size="+2"><b>Serpentine</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505571" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                              Used as: Division 2 - Level 1:
                              <blockquote>
                              <table cellspacing="2">
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                    <td style="background: #eee;" class="bodyText">350</td></tr><tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                    <td style="background: #eee;" class="bodyText">137 / 175  (78.29%) </td>
                                 </tr>
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                    <td style="background: #eee;" class="bodyText">87 / 137  (63.50%)</td>
                                 </tr>
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                    <td style="background: #eee;" class="bodyText"><b>aneubeck</b> for 336.53 points</td>
                                 </tr>
                              </table>
                              </blockquote>
                              
                              <p>
                              To solve this problem we have to keep track of the position in the current row, and which direction 
                              the row is going.  Using these two pieces of information we can calculate our column and thus 
                              produce the returned string.  Code such as this will do the trick:
                              </p>
                              <pre>
String column(String s, int width, int index) {
   String ret = "";
   for (int pos = 0, col = 0, dir = 1; pos &lt; s.length(); col+=dir) {
      if (col&lt;0 || col &gt;= width) dir = -dir;
      else {
         if (col == index) ret+=s.charAt(pos);
         pos++;
      }
   } return ret;
}
                              </pre>
                              

                              <font size="+2"><b>HalfRange</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505571" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                              Used as: Division 2 - Level 2:
                              <blockquote>
                              <table cellspacing="2">
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                    <td style="background: #eee;" class="bodyText">500</td>
                                 </tr>
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                    <td style="background: #eee;" class="bodyText">99 / 175  (56.57%) </td>
                                 </tr>
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                    <td style="background: #eee;" class="bodyText">60 / 175  (60.61%)</td>
                                 </tr>
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                    <td style="background: #eee;" class="bodyText"><b>MPhk</b> for 482.69 points</td>
                                 </tr>
                              </table>
                              </blockquote>
                              
                              <p>
                              Here we are trying to find the smallest range that contains at least half of the numbers.  I
                              t is useful to realize that the bounds of the range must be numbers in the list.  Using 
                              this information, we first sort the list.  Then, we loop through checking values that enclose 
                              half the list.  The closest pair becomes our range.  This concept is shown in the following code:
                              </p>
                              <pre>
int halfRange(int[] data) {
   java.util.Arrays.sort(data);
   int start = 0, end = (data.length-1)/2, score = data[end]-data[start];
   for (;end!=data.length;start++,end++) score = Math.min(score,data[end]-data[start]);
   return score;
}
                              </pre>
                              
                              
                              <font size="+2"><b>Tourney</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505571" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                              Used as: Division 2 - Level 3:
                              <blockquote>
                              <table cellspacing="2">
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                    <td style="background: #eee;" class="bodyText">1000</td>
                                 </tr>
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                    <td style="background: #eee;" class="bodyText">76 / 175  (43.43%) </td>
                                 </tr>
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                    <td style="background: #eee;" class="bodyText">52 / 76 (68.42%)</td>
                                 </tr>
                                 <tr>
                                    <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                    <td style="background: #eee;" class="bodyText"><b>vegeta</b> for 915.05 points</td>
                                 </tr>
                                 </table>
                                 </blockquote>
                                 
                                 Used as: Division 1 - Level 1:
                                 <blockquote>
                                 <table cellspacing="2">
                                    <tr>
                                       <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                       <td style="background: #eee;" class="bodyText">300</td>
                                    </tr>
                                    <tr>
                                       <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                       <td style="background: #eee;" class="bodyText">138 / 138  (100.00%) </td>
                                    </tr>
                                    <tr>
                                       <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                       <td style="background: #eee;" class="bodyText">125 / 138 (90.58%)</td>
                                    </tr>
                                    <tr>
                                       <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                       <td style="background: #eee;" class="bodyText"><b>sjelkjd</b> for 296.31 points</td>
                                    </tr>
                                 </table>
                                 </blockquote>
                                 
                                 <p>
                                 The most popular way to solve this involved using 2 lists: a current list, and a next list.  
                                 Looping through the current list 2 at a time you check for the word "bye".  If you find it, 
                                 the other team in the pair is added to the back of the next list.  If not, you determine which 
                                 of the pair to add based on the current element of the winnings parameter.  Once you have 
                                 exhausted the current list, you assign the next list to the current list, clear the next list, 
                                 and repeat the process.  The winner is the last team left.
                                 </p>
                                 
                                 <font size="+2"><b>Errors</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505571" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                 Used as: Division 1 - Level 2:
                                 <blockquote>
                                 <table cellspacing="2">
                                    <tr>
                                       <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                       <td style="background: #eee;" class="bodyText">500</td>
                                    </tr>
                                    <tr>
                                       <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                       <td style="background: #eee;" class="bodyText">118 / 138  (85.51%) </td>
                                    </tr>
                                    <tr>
                                       <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                       <td style="background: #eee;" class="bodyText">39 / 118 (33.05%)</td>
                                    </tr>
                                    <tr>
                                       <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                       <td style="background: #eee;" class="bodyText"><b>dgarthur</b> for 454.65 points</td>
                                    </tr>
                                    </table>
                                    </blockquote>
                                    
                                    <p>
                                    Given a particular operation to perform, you try every combination of adding or subtracting 
                                    the error from each operand.  Given all these results you can figure what the maximum and 
                                    mininum possible values are.  Subtracting the min from the max you arrive at the required 
                                    range size.  The only catch is the division operation.  If the denominator error 
                                    (parameter/1000) is greater than or equal to the measured denominator value, 
                                    the range may potentially be infinite, so return "INFINITY".  Otherwise return the 
                                    properly formatted result.
                                    </p>
                                    
                                    <font size="+2"><b>Skyscraper</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505571" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                                    Used as: Division 1 - Level 3:
                                    <blockquote>
                                    <table cellspacing="2">
                                       <tr>
                                          <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                                          <td style="background: #eee;" class="bodyText">900</td>
                                       </tr>
                                       <tr>
                                          <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                                          <td style="background: #eee;" class="bodyText">50 / 138  (36.23%) </td>
                                       </tr>
                                       <tr>
                                          <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                                          <td style="background: #eee;" class="bodyText">12 / 50 (24.00%)</td>
                                       </tr>
                                       <tr>
                                          <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                                          <td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 560.64 points</td>
                                       </tr>
                                       </table>
                                       </blockquote>
                                       
                                       <p>
                                       Many tricks lie beneath the surface of this problem even though the solution is very 
                                       easy to type.  The actual code can comfortably fit on 3 lines.  The basic trick is 
                                       realizing all possible ways to run the wire when calculating the distances.  The 
                                       following pictures may illuminate the topic: 
                                       </p>
                                       <pre>

Case 1:                      Case 2:                  Case 3:
    _______________          ________________         |     |      |
   |       |       |        |Top    |Right            |     |      |
   |Front  |Right  |        |_______|________         |Back |Right |
   |       |       |        |Front  |                 |_____|______|
   |       |       |        |       |                 |Top  |
   |       |       |        |       |                 |_____|
                                                      |Front|
                                                      |     |
                                                      |     | 

Case 4:                            Case 5:                      
__________                         
Right     |                        |      | 
__________|_______                 |      |
Back      |Top    |                |Right |         
__________|_______|_______         |______|
          |Left   |Front  |        |Top   |
          |       |       |        |______|______
          |       |       |        |Left  |Front |
          |       |       |        |      |      |
          |       |       |        |      |      |
                                   |      |      |
                                       
                                       </pre>                                        
                                       
                                       <p>
                                       Each picture above represents one of the cases that must be considered when measuring the 
                                       distance from a point on the front, to a point on the right.  In each picture above, 
                                       the rectangular solid has been taken apart and laid flat to illuminate the way to measure 
                                       the distance.  The following code handles all 5 of these cases:
                                       </p>
                                       <pre>
int dist(int x1, int y1, int x2, int y2) { return (int)Math.ceil(Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1)));}
int wire(int w, int x, int y, int xx, int yy) {
   return Math.min(dist(x,y,200+xx,yy),Math.min(dist(x,y,200+yy,-xx),
         Math.min(dist(x,y,200+w-xx,-w-yy),Math.min(dist(x,y,-xx,-200-yy),dist(x,y,-w-yy,-200-w+xx)))));
}
                                       </pre>
                                       

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

                                       