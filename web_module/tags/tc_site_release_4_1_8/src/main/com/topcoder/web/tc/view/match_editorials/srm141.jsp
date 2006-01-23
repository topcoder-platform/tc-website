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
<tc-webtag:forumLink forumID="505578" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 141</span><br>Thursday, April 10, 2003
<br><br>

<span class="bigTitle">Match summary</span>

                        <p>
                        SnapDragon brought his A game to this match, beating everyone by over 200 points. Most people were 
                        able to get the first two problems, but dynamic programming is always a little tricky, and after 
                        solving the first two problems, few people had time to finish the third. sjelkjd also showed why 
                        he made it to the CC finals, taking second overall, helped largely by his 4 successful challenges. 
                        Over in Division 2, first timer dary also won by over 200 points, with three fast submissions, and 
                        a challenge.</p>

<H1> The Problems </H1> 

                        <font size="+2"><b>StatementCounter</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505578" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division II - Level 1:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">250</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">212/227  (93.39%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">195/212  (91.98%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>Ceranith</b> for 249.20 points</td>
                        </tr>
                        </table></blockquote>
                        <p>
                        <b>Implementation</b><br />
                        Once your realize what the problem is asking for, it is pretty trivial. All you have to 
                        do is count the number of semicolons in a String[] (vector &lt;string>). So, its just two nested 
                        loops, and then a check to see if a character is a semicolon.
                        </p>
                        
                        
                        <font size="+2"><b>PrioritySort</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505578" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division II - Level 2:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">500</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">108/227  (47.58%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">47/108  (43.52%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>Sabu</b> for 464.99 points</td>
                        </tr>
                        </table></blockquote>
                        <p>
                        <b>Implementation</b><br />
                        This problem was a little bit tricky if you didn't know the sorting functions in your language of 
                        choice. The simplest way to do it was to write a comparator function and then use Arrays.sort() 
                        in Java or stable_sort() in C++. Your comparator method can be made pretty simple, since all of 
                        the numbers are exactly one character. This causes the ith number in the string to be character 2*i. 
                        So, you could just loop through all the elements of priorities, and compare the appropriate 
                        characters - no tokenizing required. 
                        </p>
                        
                        <FONT size="+2"><B>Widget</B></FONT>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505578" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division-II, Level 3: 
                        <BLOCKQUOTE>
                    <TABLE cellspacing="2" cellpadding="2">
                     <TR>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>Value</B></TD>
                     <TD style="BACKGROUND: #eee" class="bodyText">1000</TD>
                     </TR>
                   <TR>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>Submission Rate</B></TD>
                     <TD style="BACKGROUND: #eee" class="bodyText">37 / 227 (16.30%) </TD>
                     </TR>
                   <TR>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>Success Rate</B></TD>
                     <TD style="BACKGROUND: #eee" class="bodyText">28 / 37 (75.68%)</TD>
                     </TR>
                     <TR>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>High Score</B></TD>
                     <TD style="BACKGROUND: #eee" class="bodyText"><B>dary</B> for 782.05 points</TD>
                     </TR>
                     </TABLE>
                     </BLOCKQUOTE>
                     <BR />
                     Used as: Division-I, Level 2: 
                  <BLOCKQUOTE>
                   <TABLE cellspacing="2" cellpadding="2">
                   <TR>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>Value</B></TD>
                     <TD class="bodyText" style="BACKGROUND: #eee">500</TD>
                     </TR>
                   <TR>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>Submission Rate</B></TD>
                     <TD class="bodyText" style="BACKGROUND: #eee">93 / 127 (73.23%) </TD>
                     </TR>
                   <TR>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>Success Rate</B></TD>
                     <TD class="bodyText" style="BACKGROUND: #eee">79 / 93 (84.95%)</TD>
                     </TR>
                   <TR>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>High Score</B></TD>
                     <TD class="bodyText" style="BACKGROUND: #eee"><B>ZorbaTHut</B> for 468.58 points</TD>
                     </TR>
                     </TABLE>
                     </BLOCKQUOTE>
<p>
<b>Implementation</b><br />
Widget layout can be a pretty complicated problem, especially when you have 
widths that are percentages, and you want all of the coordinates to be relative 
to the window size. However, this problem simplified widget layout be forcing 
all of the lines to be either in absolute positions, or else offset an absolute 
amount from another line. Also, since there were no dependency loops, a straight 
recursive approach allowed you to easily find the coordinates of the edges in 
question. If the edge is relative to another edge, then recursively find the 
position of that edge, and then add the offset, to get the position for the edge 
you want. If the position of an edge is not relative to any other edge, then you 
are done, and can just return the position. Using this approach, you can easily 
find the location of any edge. The last thing you have to do is a little error 
checking. First, go through all vertical and horizontal edges, and make sure 
they are not at negative positions. Last, find the coordinates of the widget, 
and make sure that the right is to the right of left, and the top is above 
bottom. If everything checks out, just return the location of the widget. 
</p>

                  <font size="+2"><b>Bounce</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505578" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division I - Level 1:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">250</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">118/127  (92.91%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">103/118  (87.29%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>Yarin</b> for 236.85 points</td>
                        </tr>
                        </table></blockquote>
                        <p>
                        <b>Implementation</b><br />
                        This problem required you to do a little bit of physics, and to determine at what integral speed a 
                        bouncing ball would be above a certain height after traveling a certain distance. The obvious thing 
                        to do is to loop through every speed, starting at 1. You then have to determine the amount of time 
                        the ball will take to reach the other building, at each speed (time = distance / velocity). 
                        If the time is less than 5, there is no way that the ball will bounce before getting to the 
                        other building, and you should return -1. Next, since the ball first bounces after 5 seconds, 
                        subtract 5 from the time. Now, the ball bounces every 10 seconds, so take the remaining time 
                        modulo 10. This gives us the amount of time the ball has been in the air after the last bounce. 
                        We then plug this into the formula given in the problem statement (Y = 50*b +g*b*b/2), and if Y 
                        is greater than height, return the current speed. 
                        </p>
                        
                        <font size="+2"><b>LazyGuitar</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505578" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

                        Used as: Division I - Level 3:
                        <blockquote>
                        <table cellspacing="2" cellpadding="2">
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Value</b></td>
                        <td style="background: #eee;" class="bodyText">1000</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td>
                        <td style="background: #eee;" class="bodyText">19/127  (14.96%) </td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>Success Rate</b></td>
                        <td style="background: #eee;" class="bodyText">10/19  (52.63%)</td>
                        </tr>
                        <tr>
                        <td style="background: #eee;" class="bodyText"><b>High Score</b></td>
                        <td style="background: #eee;" class="bodyText"><b>SnapDragon</b> for 715.61 points</td>
                        </tr>
                        </table></blockquote>
                        <p>
                        <b>Implementation</b><br />
                        SnapDragon showed why he is the highest rated TopCoder by destroying the competition on this problem. 
                        The first thing that should always pop into your mind when you see a problem like this is Dynamic 
                        Programming. We clearly can't try all possible sequences of positions, so we must come up with some 
                        recurrence about how the cumulative cost after playing a chord in a particular position depends on 
                        the costs of the previous chord. If you are experienced with dynamic programming, you shouldn't have 
                        too much trouble seeing that:</p><pre>

if(chord i can be played in position j)
  cost(i,j) = min over k(cost(i-1,k)+abs(j-k)+(1 if j!=k))
else
  cost(i,j) = infinity

</pre>
                  <p>Where cost(i,j) represents the cost of playing i+1 chords, and ending up in position j. Since we can 
                  start in any position, when i = 0, we have cost(0,j) = 0 if chord 0 is playable in position j, and cost
                  (0,j) = infinity otherwise. The recurrence is pretty easy to implement, and all that we have left to 
                  do is write a function to determine if a chord can be played in a given position. At first glance, 
                  it seems that a greedy approach to assigning notes would work, but then you have the open notes, 
                  which make things tricky. Since there are only 6 strings, the simplest way to determine if a chord 
                  is playable is probably just to try all possible assignments of notes to strings. 6! is pretty small, 
                  so timeout shouldn't be an issue. Then, all you have to do is figure out what to return. Since you can 
                  end in any position, you want to return the minimum cost for any position to have played all chords. 
                  If this value is infinity, return -1.<br />
                  One noteworthy thing to watch for is that there are only 24 frets. So, if position is 23, you can 
                  only use frets 23 and 24. It turns out that there is no reason to ever be in a position above 21. 
                        </p>

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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

