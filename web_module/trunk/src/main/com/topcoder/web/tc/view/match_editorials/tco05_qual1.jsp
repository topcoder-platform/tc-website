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
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505749">Discuss this match</A></div>
<span class="bodySubtitle">TCO05 - Qualification 1</span><br>August 16-17, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
This set's easy problem required a simple conversion from filesize to bitrate.  On the contrary,
this room probably had the most difficult hard problem.   It didn't phase the top competitors, but
many div 1 coders were unable to submit it.  krijgertje, reid, and snewman, who all scored above 900, led the pack.
</p>

<H1>
The Problems
</H1>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4680&amp;rd=8020" name="4680">VideoEncode</a></b>
</font>
<A href="Javascript:openProblemRating(4680)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>

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
      322 / 350 (92.00%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      308 / 322 (95.65%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>PE</b> for 247.60 points (2 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      199.26 (for 308 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Here we convert a time to kilobits per second so that the total video becomes a particular size.
Using the supplied conversion rates, we convert the given size to bits.  Next, we parse the given
string to obtain the number of seconds required by the video.  The number of bits over the number of
seconds gives the required bits per second.  Dividing by 1000 gives kilobits per second.  Java code
follows:
<pre>

int S(String s) { return Integer.parseInt(s); }
public double bitrate(String length, int desiredSize) {
  String[] toks = length.split("[:]");
  long mbs = desiredSize*1048576L*8, 
       secs = S(toks[2]) + 60 * ( S(toks[1]) + 60 * S(toks[0]) );
  return mbs/1000.0/secs;
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4712&amp;rd=8020" name="4712">GridGame</a></b>
</font>
<A href="Javascript:openProblemRating(4712)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      188 / 350 (53.71%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      153 / 188 (81.38%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>krijgertje</b> for 705.02 points (5 mins 48 secs)
    </td>

  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      435.92 (for 153 correct submissions)
    </td>
  </tr>

</table></blockquote>

<p>
Here we must count how many winning moves we have.  This problem structure lends itself to a
recursive solution: after making a move, we have won if the opponent has no winning moves.  Thus, to
compute the number of winning moves, we loop over all valid moves, and then see if the opponent has
any winning moves from the updated position.  Java code follows:
<pre>
boolean canMove(boolean[][] mat, int r, int c) {
   if (mat[r][c]) return false;
   for (int x = -1; x <= 1; x++) for (int y = -1; y <= 1; y++) {
      if (x*y != 0 || x+y == 0) continue;
      if (r+y < 0 || r+y >= 4 || c+x < 0 || c+x >= 4) continue;
      if (mat[r+y][c+x]) return false;
   } return true;
}
int comp(boolean[][] mat, boolean first) {
   int wins = 0;
   for (int r = 0; r < 4; r++) for (int c = 0; c < 4; c++) {
      if (!canMove(mat,r,c)) continue;
      mat[r][c] = true;
      if (comp(mat,false) == 0) wins++;
      mat[r][c] = false;
   } 
   return wins;
}
public int winningMoves(String[] grid) {
   boolean[][] mat = new boolean[4][4];
   for (int r = 0; r < 4; r++) for (int c = 0; c < 4; c++) 
      if (grid[r].charAt(c) == 'X') mat[r][c] = true;
   return comp(mat,true);
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
