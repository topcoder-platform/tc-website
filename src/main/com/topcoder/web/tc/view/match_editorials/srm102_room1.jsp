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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm102_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm102_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505519" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm102" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
       <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
         <TD VALIGN="top" CLASS="bodyText">&#160;</TD>
      </TR> -->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 102</span><br>Monday, July 1, 2002
<br/><br/>

<span class="bigTitle">Room 1 Review</span>

<P>
SRM 102 was the first TopCoder match without cash prizes, although many of the Room One regulars, along with 350 other coders
competed anyways.  Hopefully this strong interest in single-round matches among the top members (and indeed among all members) will
continue in the upcoming weeks and months.
</P>

<P>
The coding pace in room one is usually fast and furious, and SRM 102 was no exception.  <B>John Dethridge</B> and <B>ZorbaTHut</B> both pulled out
to an early lead by solving the Level 1 problem in about 4 minutes for scores of 245.17 and 245.86 respectively out of a possible
250.  <B>radeye</B> and <B>Yarin</B> followed a minute later for 243.34 and 241.38 points.  <B>jonmac</B> was the last person to finish this first
problem, but it only took him 10 minutes, and he still had a very respectable 221.74 points for his effort.
</P>

<P>
Everyone then moved on to the Level 2 problem.  <B>radeye</B> moved into the lead at 19 minutes into the competition with his Level 2
submission which earned him 414.35 out of a possible 500 points, and 657.69 points in total.  <B>Yarin</B> was the next to submit (4
minutes later), giving him 615.76 total points. <B>ZorbaTHut</B>, <B>benetin</B>, and <B>SnapDragon</B> were in a close battle for third after their
Level 2 submissions with 568.94, 564.90, and 559.66 points respectively. malpt opened the level 2 problem, but decided to move on to
(and solve) the level 3 problem first for 584.27 points before returning to finish and then submit (and re-submit) the level 2
problem for 150 points.  <B>John Dethridge</B> used dynamic programming (instead of brute force) to solve the level 2 problem, and this may
have cost him some time, as he required 45 minutes to complete it and only received 223.15 points.
</P>

<P>
<B>radeye</B> was able to preserve his lead with a very fast level 3 solution at 34 minutes into the competition, for 793.13 out of a
possible 1000 points.  This gave him an astounding 1450.82 out of 1750 possible points.  <B>ZorbaTHut</B> completed a level 3 solution in
slightly less time, for 800.85 points, but his combined score after the coding phase was 1369.79 putting him in second place.
<B>SnapDragon</B> was in third after coding with 1330.99 points, and <B>benetin</B> was fourth with 1251.67 points.  <B>John Dethridge</B> gained ground
on the final problem, finishing the coding phase in fifth with 1122.89 points.  Both <B>dmwright</B> and <B>jonmac</B> were unable to complete the
level 3 problem.
</P>

<P>
Only one challenge resulted in the coding phase, coming from <B>John Dethridge</B> on <B>jonmac</B>'s level 2 solution.  <B>ZorbaTHut</B> was not able to
pass the system test for his level 2 solution, nor was <B>SnapDragon</B> for his level 3 solution. This allowed <B>benetin</B> to move into second
place, and <B>John Dethridge</B> to move into third, while <B>radeye</B> was able to hang on to first place, receiving an impressive rating gain
of 134 points.
</P>


<p>
<img src="/i/m/Penwiper_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="150527" context="algorithm"/><br />
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

