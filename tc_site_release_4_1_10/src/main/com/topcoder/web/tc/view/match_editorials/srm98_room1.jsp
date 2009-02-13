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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505516" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 98</span><br>June 19, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>
<br/>
<B>Coding Phase</B>
<p>
            The first six submissions came rather close together at around the eight minute mark.
            <B>derkuci</B>, <B>Yarin</B>, <B>John Dethridge</B>, <B>bigg_nate</B>,
            <B>SnapDragon</B>, and <B>DjinnKahn</B> all submitted a solution for the Level 1
            problem for approximately 180-190 points each.  <B>malpt</B> and <B>jonmac</B>
            followed not too far behind with their Level 1 submissions shortly thereafter.
        </p>
<p>
            Almost immediately after <B>jonmac</B>'s Level 1 submission, <B>Yarin</B> and
            <B>bigg_nate</B> each submitted a Level 2 submission, giving <B>Yarin</B> the lead.
            Four more submissions followed closely behind, within a span of thirty seconds:
            <B>malpt</B>, <B>derkuci</B>, <B>DjinnKahn</B>, and <B>SnapDragon</B>.
            Four minutes followed before <B>jonmac</B> submitted his Level 2 submission.
        </p>
<p>
            Things were quiet for the next eight minutes, until <B>John Dethridge</B> became the first
            to submit a solution for the Level 3 problem.  A minute later and <B>dmwright</B> finally submitted
            his first submission (he had not started until nearly 18 minutes into the contest, however).
            <B>SnapDragon</B> was next to finish the Level 3 problem, managing to get over 40 more points than <B>John Dethridge</B>
            on his Level 3 submission.  As <B>SnapDragon</B> was the first coder to complete all three problems, he immediately took
            over the lead.
            <B>John Dethridge</B> responded by quickly submitting a solution to the Level 2 problem faster than <B>SnapDragon</B>
            had earlier, but this was not sufficient to recover the lead.
        </p>
<p>
            Ten minutes followed before <B>bigg_nate</B>, the next coder to complete the problem set, submitted his
            solution to the Level 3 problem.  This was shortly followed by <B>dmwright</B>'s second submission of
            the match, which was also for the Level 3 problem.  At this point, <B>John Dethridge</B> found a mistake
            in his Level 3 submission, and was forced to resubmit it, knocking a devastating 441 points off of his score.
        </p>
<p>
            <B>malpt</B> was fourth to finish the problem set, followed by <B>Yarin</B> and <B>dmwright</B> five minutes later.
            However, <B>malpt</B> was unsatisfied with his solution to the Level 1 problem and resubmitted it,
            earning only 60 points for that problem.  At the end of the contest, <B>jonmac</B> was the only coder to not
            complete the entire problem set.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ol>
  <li>
    <B>SnapDragon</B>
            - 1398.97</li>
  <li>
    <B>dmwright</B>
            - 1285.84</li>
  <li>
    <B>bigg_nate</B>
            - 1204.10</li>
  <li>
    <B>Yarin</B>
            - 1056.25</li>
  <li>
    <B>DjinnKahn</B>
            - 1027.53</li>
  <li>
    <B>malpt</B>
            - 977.47</li>
  <li>
    <B>John Dethridge</B>
            - 973.70</li>
  <li>
    <B>derkuci</B>
            - 946.24</li>
  <li>
    <B>jonmac</B>
            - 599.39</li>
</ol>
<B>Challenge Phase</B>
<p>
            <B>malpt</B> challenged <B>SnapDragon</B>'s Level 1 submission approximately one minute into
            the Challenge Phase.  <B>SnapDragon</B> made the common mistake of simulating contestants challenging
            themselves.  <B>derkuci</B> challenged <B>jonmac</B>'s Level 1 submission approximately five minutes
            into the Challenge Phase, for the exact same mistake.  A few minutes later <B>SnapDragon</B> spotted the
            same error in <B>DjinnKahn</B>'s Level 1 submission, earning back some of the points he lost earlier.
        </p>
<p>
            The first challenge of a Level 3 submission came from <B>bigg_nate</B>, against <B>DjinnKahn</B>'s submission.
            <B>John Dethridge</B> was next, successfully challenging <B>Yarin</B>'s Level 3 submission.
            <B>bigg_nate</B> then attempted to challenge <B>derkuci</B>'s Level 3 submission to close the Challenge Phase,
            but was unsuccessful, thus losing the 50 points he had earned from the previous challenge.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ol>
  <li>
    <B>dmwright</B>
            - 1285.84</li>
  <li>
    <B>SnapDragon</B>
            - 1269.13</li>
  <li>
    <B>bigg_nate</B>
            - 1204.10</li>
  <li>
    <B>malpt</B>
            - 1027.47</li>
  <li>
    <B>John Dethridge</B>
            - 1023.70</li>
  <li>
    <B>derkuci</B>
            - 996.24</li>
  <li>
    <B>Yarin</B>
            - 621.58</li>
  <li>
    <B>DjinnKahn</B>
            - 428.39</li>
  <li>
    <B>jonmac</B>
            - 423.50</li>
</ol>
<B>System Test Phase</B>
<p>
            Who would win money in this match was still very much in question as the contest ended.
            <B>dmwright</B> lead with 1285.84 points, but was followed very closely by <B>SnapDragon</B> with 1269.13 points
            and <B>bigg_nate</B> with 1204.10 points.  <B>malpt</B> and <B>John Dethridge</B> each also had a chance,
            with scores of 1027.47 and 1023.70 respectively.  It would come down to who had made the fewest mistakes
            that had not been caught in the Challenge Phase.
        </p>
<p>
            <B>dmwright</B>, the apparent leader, was hit hardest by the system tests, failing the Level 3 problem which had made up
            the majority of his points.  <B>derkuci</B> lost two submissions, his Level 1 and Level 3, but still lost fewer points
            than <B>dmwright</B>.  <B>malpt</B> also lost his Level 3 submission, which made up nearly half his points.
            And <B>John Dethridge</B>, despite his care in resubmitting his solution to the Level 3 problem, still failed, losing
            a little over a third of his points.
        </p>
<p>
            After it was all over, <B>bigg_nate</B> remained the only coder in 
        Room 1 to get all three problems correct.
            However, his excellent performance was not sufficient to win first place.
            Because he was overall the fastest coder, and was able to successfully challenge a problem, <B>SnapDragon</B> was able
            to maintain a high enough score to win the room, despite losing his Level 1 submission.  This performance propelled
            <B>SnapDragon</B> beyond the 3000 point rating barrier.  <B>John Dethridge</B> came in a distant third, beating
            <B>Yarin</B> by a challenge and a 0.13 points.
        </p>
<B>Final Results</B>
<ol>
  <li>
    <B>SnapDragon</B>
            - 1269.13</li>
  <li>
    <B>bigg_nate</B>
            - 1204.10</li>
  <li>
    <B>John Dethridge</B>
            - 671.65</li>
  <li>
    <B>Yarin</B>
            - 621.58</li>
  <li>
    <B>dmwright</B>
            - 590.65</li>
  <li>
    <B>malpt</B>
            - 545.84</li>
  <li>
    <B>derkuci</B>
            - 468.63</li>
  <li>
    <B>DjinnKahn</B>
            - 428.39</li>
  <li>
    <B>jonmac</B>
            - 423.50</li>
</ol>


<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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

