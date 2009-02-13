<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statisics</title>

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
<%--
<tc-webtag:forumLink forumID="505003" message="Discuss this match" /></div>
--%>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505013">Discuss this match</A></div>
<span class="bodySubtitle">TCO05 - Qualification 4</span><br>August 16-17, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This set may have been the easiest overall.  The easy, DayPlanner, required some simple string
parsing and time manipulation.  The hard, TheCoderMan, had a few tricky cases but no recursion.  As
expected, many people did well on this set.  14 coders were able to score over 900.  Yi_Zhang led
the room, with gladius and bladerunner close behind.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4637&amp;rd=8024" name="4637">DayPlanner</a></b>
</font>
<A href="Javascript:openProblemRating(4637)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>

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
      339 / 353 (96.03%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      299 / 339 (88.20%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>LunaticFringe</b> for 247.69 points (2 mins 12 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      206.75 (for 299 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Here we must determine which tasks occurred first and last.  For each element of the input, we parse
out the time and compute the number of minutes it represents.  Then we check if this time represents
the minimum or maximum found thus far.  Java code follows:
<pre>

public String getEnds(String[] tasks) {
  int m = 10000000, M = 0, mb = 0, Mb = 0;
  for (int i = 0; i < tasks.length; i++) {
    String curr[] = tasks[i].split("[ :]");
    int min = Integer.parseInt(curr[0])*60 + Integer.parseInt(curr[1]);
    if (min < m) {
      m = min;
      mb = i;
    }
    if (min > M) {
      M = min;
      Mb = i;
    }
  } 
  return tasks[mb].split("[ :]")[2]+"-"+tasks[Mb].split("[ :]")[2];
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4628&amp;rd=8024" name="4628">TheCoderMan</a></b>
</font>
<A href="Javascript:openProblemRating(4628)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      750
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>

    </td>
    <td class="bodyText" style="background: #eee;">
      297 / 353 (84.14%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      222 / 297 (74.75%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>Yi_Zhang</b> for 698.52 points (6 mins 15 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      494.02 (for 222 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Here we must look at each of our friends and determine if they are eligible to rate TheCoderMan.
We can throw out any friend that didn't rate TheCoderMan.
For the remaining friends, we compute their average deviation from our ratings.  This is done by
looping over their ratings, and see where they rated a movie we did.  For all viable friends, we
average their ratings of TheCoderMan and return this value.  Java code follows:
<pre>
double dev(String a, String b) {
  int ret = 0, cnt = 0;
  for (int i = 0; i < a.length(); i++) {
    if (a.charAt(i) == 'X' || b.charAt(i) == 'X') continue;
    cnt++;
    ret += Math.abs(a.charAt(i) - b.charAt(i));
  } return cnt == 0 ? 10 : ret*1.0/cnt;
}
public double evaluateMovie(String ys, String[] fs, int max) {
  double ret = 0;
  int cnt = 0;
  for (int i = 0; i < fs.length; i++) {
    double temp = dev(ys,fs[i]);
    char c = fs[i].charAt(fs[i].length() - 1);
    if (temp <= max && c != 'X') {
      ret += c-'0';
      cnt++;
    }
  } return cnt == 0 ? -1 : ret/cnt;
}
</pre>

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
