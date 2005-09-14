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
<A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=ThreadList&forumID=505012">Discuss this match</A></div>
<span class="bodySubtitle">TCO05 - Qualification 3</span><br>August 16-17, 2005
<br><br>

<span class="bigTitle">Match summary</span>

<p>
Like some of the other qualification sets, this easy and hard followed the iterative/recursive pattern.  The
easy, CompanyName, was the most difficult level 1 problem in any of the sets.  The hard, Fuses, was
also no slouch.  Despite the difficulty, 13 coders managed to score over 900 points.  This room,
which contained many of the best coders on TC, was led by SnapDragon and marek.cygan.  Both scored
over 950.
</p>

<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4563&amp;rd=8023" name="4563">CompanyName</a></b>
</font>
<A href="Javascript:openProblemRating(4563)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>

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
      314 / 354 (88.70%)
    </td>
  </tr>
  <tr>

    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      214 / 314 (68.15%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>m00tz</b> for 240.29 points (4 mins 36 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      171.30 (for 214 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Here we must compute a score for each given string, and then take the one with the lowest score.
The vowel score is computed by counting the number of contiguous vowel groups.  To do this we
increment a counter for each vowel not preceded by a vowel.  We must also compute a consonant
score.  Each consonant contributes 2 points to the score, but each consonant group removes 1.  The
same technique used on the vowels applies here.  Java code follows:        
<pre>

boolean isVowel(char c) { return "AEIOUaeiou".indexOf(c) != -1; }
public String shortestProposal(String[] proposals) {
   int best = 100000, bestpos = 0;
   for (int i = 0; i < proposals.length; i++) {
      int vs = 0, cs = 0;
      for (int j = 0; j < proposals[i].length(); j++) {
         char c = proposals[i].charAt(j);
         if (isVowel(c)) {
            if (j == 0 || !isVowel(proposals[i].charAt(j-1))) vs++;
         } else {
            cs += 2;
            if (j == 0 || isVowel(proposals[i].charAt(j-1))) cs--;
         }
      }
      if (vs + cs < best) {
         best = vs + cs;
         bestpos = i;
      }
   } return proposals[bestpos];
}
</pre>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4725&amp;rd=8023" name="4725">Fuses</a></b>
</font>
<A href="Javascript:openProblemRating(4725)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      264 / 354 (74.58%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>

    <td class="bodyText" style="background: #eee;">
      136 / 264 (51.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      <b>SnapDragon</b> for 737.12 points (3 mins 1 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">

      527.94 (for 136 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Seeing as we aren't sure how many fuses we will need, we try each possible amount.  The constraints
guarantee we will never require more than 5.  When trying a particular number of fuses, we
recursively try to assign each device to one of the fuses.  If all devices can be assigned we are
done.  Java code follows:
<pre>
boolean solve(int[] amps, int[] fuses, int pos) {
   if (pos == amps.length) return true;
   boolean ret = false;
   for (int i = 0; i < fuses.length; i++) {
      if (amps[pos] + fuses[i] > 20) continue;
      fuses[i] += amps[pos];
      ret |= solve(amps,fuses,pos+1);
      fuses[i] -= amps[pos];
   }
   return ret;
}
public int minFuses(int[] amps) {
   for (int f = 1; ;f++) 
      if (solve(amps,new int[f],0)) return f;   
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
