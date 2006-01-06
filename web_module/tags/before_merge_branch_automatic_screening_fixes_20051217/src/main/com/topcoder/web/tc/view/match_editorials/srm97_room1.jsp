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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505515" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 97</span><br>June 12, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>
<br/>

<P>
Room One today saw the usual quick start by most of the room on the Level
One problem. <B>ZorbaTHut</B>, <B>SnapDragon</B>, <B>Yarin</B>, <B>dgarthur</B>, <B>malpt</B>, and <B>DjinnKahn</B>
opened the Level One within seconds of the round's start. <B>John Dethridge</B> and
<B>reid</B> started late, both opening at approximately the three-minute mark.
<B>venco</B> broke with tradition and opened the Level Three first.
</P>

<P>
First submission went to <B>Yarin</B>, turning in his Level One in a little over
nine minutes for 317.70 points. <B>Yarin</B> was quickly followed by <B>SnapDragon</B>,
then <B>ZorbaTHut</B>, the last earning 314.79 points. As usual, the late starts
messed things up a little. Despite submitting a minute and a half later,
<B>John Dethridge</B> got the fastest submission in the room, earning 325.37 points
for slightly under eight minutes of work, <B>reid</B> spending only twenty seconds
more for 323.70 points. Curiously enough, while almost all the programmers
finished in less than ten and a half minutes of work, <B>malpt</B>, <B>dgarthur</B>, and
<B>DjinnKahn</B> spent over thirteen and a half minutes each, yet came within
twenty seconds of each other, earning under 290 points.  Each coder
proceeded to the Level Two except <B>John Dethridge</B>, who skipped ahead to the
Level Three.
</P>

<P>
And speaking of the Level Three, <B>venco</B> finished up his Level Three
submission after only 21:39, earning 750.13 points then dropping back to
start the Level One. <B>John Dethridge</B> finished his Level Three before any
coder finished the grueling Level Two problem, 768.56 points on 20 minutes
of work, and dropped to the Level Two after a short break.
</P>

<P>
First submission on the Level Two came from <B>Yarin</B> as well, spending 22:43
for 299.21 points, but once again his score was beaten by a late started.
<B>reid</B> took the high score on the Level Two, barely more than 19 minutes of
work yielding 325.62 points. Most of the coders finished less than 30
minutes after starting, <B>DjinnKahn</B> coming within 30 seconds of the border,
earning from 289 points to 259 points on the low end. <B>dgarthur</B> apparently
ran into some trouble, taking more than ten minutes longer than <B>DjinnKahn</B>,
only earning 218.17 points. Each coder proceeded on to the Level Three.
</P>

<P>
<B>reid</B> was the first to complete the problem set, spending under 16 minutes on
the Level Three, getting 861.66 points for his solution. <B>SnapDragon</B> finished
second, needing 17:38 for 825.82 points. <B>DjinnKahn</B> spent pver 22 minutes for
737.13 points and was quickly topped by <B>dgarthur</B>'s 883.14 point solution,
coded in under 15 minutes. <B>malpt</B> took 28 minutes, submitting 4 minutes
before the end of the match for 650.12 points, followed by <B>ZorbaTHut</B>'s
solution, ten minutes longer and 110 points weaker. <B>venco</B>, meanwhile,
finished up his Level Two solution, only earning 221.86 points on it. <B>Yarin</B>
was the only one to not submit all three problems.
</P>

<P>
After coding phase, <B>reid</B> had a clear lead with 1510.98 points, <B>SnapDragon</B>
falling behind by almost 100 points, followed rapidly by <B>dgarthur</B> and <B>John Dethridge</B>, either of them in a position to take 2nd place by a single
challenge. <B>ZorbaTHut</B> took the lowest place among the coders who had
completed the set, <B>Yarin</B> taking last overall.
</P>

<P>
Challenge phase would bring its set of changes, though. <B>venco</B> rapidly
challenged <B>dgarthur</B>'s Level One solution, pushing him two places up - one
place from <B>dgarthur</B>'s fall, and one place for passing <B>DjinnKahn</B>, who was
literally a single point ahead beforehand. Unfortunately for <B>dgarthur</B>, his
Level Two was flawed as well, which <B>Yarin</B> used to increase his score.
Unfortunately for <B>Yarin</B>, <B>dgarthur</B>'s Level Three alone was worth more than
both of <B>Yarin</B>'s submissions, even with the challenge included.
</P>

<P>
An unusually interesting challenge round was followed by unusually damaging
system tests. Four problems failed overall. <B>dgarthur</B>'s Level Three turned
out to be flawed as well, dropping <B>dgarthur</B> to a devastating zero total
points. <B>malpt</B>'s Level Three had a bug, known to <B>malpt</B> even before challenge
phase, as he admitted afterwards. <B>ZorbaTHut</B> and <B>DjinnKahn</B> both lost their
Level Two submissions as well.
</P>

<P>
<B>reid</B>, on the other hand, kept all his submissions, gaining 89 rating points
to become the third coder to break 3000. <B>SnapDragon</B>'s submissions survived
as well, propelling him to within 12 points of the 3000 barrier. <B>John Dethridge</B> took third, increasing his rating to 2905, while <B>venco</B>'s rating
increased 94 points, the most in the room. <B>venco</B>'s final score of 1333.20,
including his challenge, would have been sufficient to easily win any other
room.
</P>

<P>
<B>DjinnKahn</B> only finished with 1024.95 points, and while his final score was
beaten by <B>radeye</B> in room 2, he would have won any room from 3rd on. His
rating increased by 86. <B>ZorbaTHut</B>'s near-first and near-3000 dropped by 15
points, still well within reach of 3000, though not within reach of <B>reid</B>.
<B>Yarin</B> lost 20 points, and <B>malpt</B> 29. <B>dgarthur</B>, not surprisingly, lost his
maximum in one round, a painful 191 rating points.
</P>


<p>
<img src="/i/m/ZorbaTHut_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="152347" context="algorithm"/><br />
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

