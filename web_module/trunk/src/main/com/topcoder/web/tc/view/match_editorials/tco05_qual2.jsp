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
<%--
<tc-webtag:forumLink forumID="505003" message="Discuss this match" /></div>
--%>
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505750">Discuss this match</A></div>
<span class="bodySubtitle">TCO05 - Qualification 2</span><br>August 16-17, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
The easy, VariableAddition, required coders to simulate a simple calculator.  The hard,
CheapestFlights, was a recursive shortest path problem.  Most coders received credit for the easy, 
but many div 2 coders were stumped by the hard.  Snail and Im2Good took the top 2 spots with
scores over 900.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4723&amp;rd=8021" name="4723">VariableAddition</a></b>
</font>
<A href="Javascript:openProblemRating(4723)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>

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
      314 / 347 (90.49%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      293 / 314 (93.31%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>antimatter</b> for 248.25 points (1 mins 54 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      194.67 (for 293 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Here we must add a string of values, some of which may be variables.  First we use the '+' symbols
to split the string into tokens.  Then we process each token.  Integers are parsed and accumulated.
Non-integers cause us to perform a lookup in the list of variables.  Java code follows:
<pre>

public int add(String eq, String[] vars) {
  String[] toks = eq.split("[+]");
  int ret = 0;
  for (int i = 0; i < toks.length; i++) {
    if (Character.isDigit(toks[i].charAt(0))) {
      ret += Integer.parseInt(toks[i]);
    } else {
      for (int j = 0; j < vars.length; j++) 
	if (vars[j].split(" ")[0].equals(toks[i]))
	  ret += Integer.parseInt(vars[j].split(" ")[1]);
    }
  } 
  return ret;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4753&amp;rd=8021" name="4753">CheapestFlights</a></b>
</font>
<A href="Javascript:openProblemRating(4753)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      204 / 347 (58.79%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      135 / 204 (66.18%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>Snail</b> for 698.73 points (6 mins 15 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      435.63 (for 135 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This is a classic recursion problem.  We have a cost matrix, a current
location, a final location and N, the number of steps that must be
taken.  If N = 0, the problem is trivial.  If we are at the final
location we have a cost of 0.  Otherwise, we return a very large value
denoting something wrong has occurred.  If N > 0, we
can try all possible flights.  Each flight leaves us with an updated
cost matrix, a new current location, and N-1 remaining steps.  A
recursive call solves the N-1 case.  Adding to this the cost of the initial
flight, we get the total cost.  Taking the minimum of all possible
total costs (1 for each flight choice) gives the result.  Java code
follows:
<pre>
public double getLowest(String[] prices, int start, int end, int num) {
  double[][] mat = new double[prices.length][prices.length];
  for (int r = 0; r < prices.length; r++) 
    for (int c = 0; c < prices.length; c++) 
      mat[r][c] = prices[r].charAt(c)-'0';
  return getLowest(mat,start,end,num);
}
public double getLowest(double[][] prices, int start, int end, int num) {
  if (num == 0) return end == start ? 0 : 1000;
  double ret = 1000;
  for (int i = 0; i < prices.length; i++) {
    if (i == start) continue;
    double cost = prices[start][i];
    for (int j = 0; j < prices.length; j++) prices[j][i] /= 2;
    ret = Math.min( ret, cost + getLowest(prices,i,end,num-1));
    for (int j = 0; j < prices.length; j++) prices[j][i] *= 2;
  } 
  return ret;
}
</pre>

As an optimization, we can store the number of flights that arrive at a location in an integer
array, and then compute the cost of a particular flight as needed.  This saves us from recomputing
the entire cost matrix.
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
