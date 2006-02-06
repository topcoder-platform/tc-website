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
<tc-webtag:forumLink forumID="505562" message="Discuss this match" /></div>
<span class="bodySubtitle">2003 TopCoder Collegiate Challenge <br> Round 1 - NE and SE Regional</span><BR/>Tuesday, February 18, 2003
<br><br>

<span class="bigTitle">Summary</span>

<p>
    The first problem set of the collegiate challenge turned out to be a little bit trickier than previous first round
    problem sets have been, though still easier than the average division 1 problem set.  Only 191 people competed
    from the two regions, and of those only 113 ended up with positive points - 78 from the northeast, and 35 from the
    southeast.  dgarthur was able to complete all three of the problems in an impressive 35 minutes, and with 50 points
    from the challenge phase, he easily took first. In second, 160 points behind, is insomnia, with 4 successful
    challenges.  Good luck to everyone in the next round!
</p>

<H1> The Problems </H1> 

<a name="NameSort"></a><font size="+2"><b>NameSort</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505562" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Level 1:
    <blockquote>
        <table cellspacing="2">
            <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">250</td></tr>
            <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">160 / 191 (83.77%)</td></tr>
            <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">98 / 160 (61.25%)</td></tr>
            <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>ColinMacLeod</b> for 239.72 points</td></tr>
        </table>
    </blockquote>
<p>
    Sorting can be done in a variety of ways.  The simplest way to implement it in this case, where runtime is not an
    issue, is probably to simply use two loops:
<pre>
for i = 1 to n
    for j = 1 to i-1
        if(element i should come before element j)
            swap elements i and j
</pre>
To tell if one element should come before another, you simply have to tokenize each element, and compare the final
    tokens, ignoring case.  If there is a tie, you need to know the original index, so you should probably keep track
    of the indices and swap them along with the elements.

</p><a name="RoadWork"></a><font size="+2"><b>RoadWork</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505562" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Level 2:
    <blockquote>
        <table cellspacing="2">
            <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">500</td></tr>
            <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">89 / 191 (55.28%)</td></tr>
            <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">46 / 89 (51.69%)</td></tr>
            <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>niteneb</b> for 471.50 points</td></tr>
        </table>
    </blockquote>
<p>
    If the roads were shorter, it would be easy to iterate through each one foot section of road, and check to see if it
    is included in multiple contracts.  However, since the roads are up to 2 billions feet long, this is clearly not an
    option.  Instead, we should divide the roads into a number of segments, and then determine if each segment is
    contained within multiple contracts, and then add the length of the whole segment, if it is all covered by
    multiple contracts.  The trick is to pick the segments so that the whole segment is guaranteed to be covered
    by the same number of contracts.  One simple way to do this is to add all of the points in start and end into one
    array, and sort that array.  The segments of interest will now be defined as the region between adjacent elements
    in the array.  It should be clear that there is no way for only part of one of these segments to be covered by
    multiple contracts.  Now that way have defined our segments, it is simple to test each of the segments to see if
    it's covered:
<pre>
all = union(start,end)
sort(all)
ret = 0
for i = 0 to all.size-2
    count = 0
    for j = 0 to start.size-1
        if(start[j]&lt;=all[i] &amp;&amp; end[j] &gt;= all[i+1])
            count = count + 1
    if(count &gt; 1)ret = ret + all[i+1]-all[i]
</pre>

</p><a name="TupleLine"></a><font size="+2"><b>TupleLine</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505562" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Used as: Level 3:<blockquote>
    <table cellspacing="2">
        <tr><td style="background: #eee;" class="bodyText"><b>Value</b></td><td style="background: #eee;" class="bodyText">1000</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Submission Rate</b></td><td style="background: #eee;" class="bodyText">20 / 191 (10.47%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>Success Rate</b></td><td style="background: #eee;" class="bodyText">12 / 20 (60.00%)</td></tr>
        <tr><td style="background: #eee;" class="bodyText"><b>High Score</b></td><td style="background: #eee;" class="bodyText"><b>dgarthur</b> for 708.62 points</td></tr>
    </table></blockquote>
<p>
    Like any line, a line here is defined by two points.  As a result, the simplest way to do this is to pick two points,
    and examine the line defined by those two points.  The first thing to check is that the line is maximal.  This is
    probably the hardest part of the problem, but it is not very algorithmically difficult.  First, you should find the
    distance tuple between the two points.  Each non-zero element of distance tuple should have the same absolute value.
    If this is not the case, then the two points cannot lie along a maximal line.  For example, (0,0) and (1,2) cannot
    lie along a maximal line because the slope of the line is 2, and thus when the line traverses an n by n box, it
    will hit only n/2 cells.  Once you have done this, you still have to check that the length of the line is the same
    as the size of the box.  For example, if the size of the box is 3, and two points are (0,1) and (1,2), the line
    through them does not include 3 points, only 2.  One way to do this is to generate all of the points along the line,
    and count them.  There are other ways to do this too, but generating the points is probably a good way to do it,
    since this lets you count the total points easily.  Once you have generated the points along the line, you simply
    iterate through all of the points and count how many were given to you.  AdminBrett wrote the shortest solution I
    have seen, though it takes a minute to see how it works:
</p><pre>
public class TupleLine {
public int quickLine(int size, String[] chosen) {
    int ret = size-1;
    for (int i = 0; i &lt; chosen.length; i++) {
        for (int j = i+1; j &lt; chosen.length; j++) {
            int[] curri = new int[chosen[j].length()], currj = new int[curri.length], diff = new int[curri.length];
            int div = 1000, cntused = 0, cntunused = 0;
            for (int x = 0; x &lt; diff.length; x++) {
                curri[x] = chosen[i].charAt(x)-'0';
                currj[x] = chosen[j].charAt(x)-'0';
                diff[x] = curri[x]-currj[x];
                while (diff[x]%div!=0) div--;
            } for (int x = 0; x &lt; diff.length; x++) diff[x] /= div;
        outer:   for (int x = -10; x &lt;= 10; x++) {
                int[] temp = (int[])diff.clone();
                for (int y = 0; y &lt; temp.length; y++) {
                    temp[y] = curri[y]+x*temp[y];
                    if (temp[y] &gt;= size || temp[y] &lt; 0) continue outer;
                }
            outer2:   for (int y = 0; y &lt; chosen.length; y++) {
                    for (int k = 0; k &lt; temp.length; k++)
                        if (chosen[y].charAt(k)-'0'!=temp[k]) continue outer2;
                    cntused++;
                    continue outer;
                }
                cntunused++;
            }
            if (cntused+cntunused==size &amp;&amp; cntunused &lt; ret) ret = cntunused;
        }
    }
    return ret;
}
}
</pre>
  
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
