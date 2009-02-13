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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505511" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 93</span><br>May 30, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>
<br />

    <b>Coding Phase</b>
  <p>
            The Coding Phase begain as usual, with everybody starting on the Level 1 problem
            except for <b>dmwright</b>, who began with his regular strategy of starting
            on the Level 2 problem.  <b>doeth</b>, <b>John Dehtridge</b>,
            and <b>reid</b> did not start until over five minutes into the contest.
        </p>
  <p>
            Twenty seconds after <b>reid</b> opened the Level 1 problem,
            <b>SnapDragon</b> made the first submission, for 286.08 points.
            <b>ZorbaTHut</b> followed close behind with 281.42 points
            Next in line for Level 1 submissions were (in order of scores rather
            than chronology):
            <b>John Dethridge</b> (283.46 points);
            <b>malpt</b>;
            <b>doeth</b>;
            <b>venco</b>;
            and <b>ambrose</b>.
            At this point in time, this left <b>dmwright</b> and <b>reid</b> without
            any submissions yet.
        </p>
  <p>
            <b>SnapDragon</b> also made the first submission of the Level 2 problem,
            submitting his solution at the 18 minute mark for 437.76 points.  This was
            shortly followed by <b>reid</b>'s relatively poor showing of 252.74 points for
            the Level 1 problem.  Next in line for Level 2 submissions were (in order of score again):
            <b>malpt</b>;
            <b>reid</b>;
            <b>ambrose</b>;
            <b>doeth</b>;
            <b>John Dethridge</b>;
            <b>ZorbaTHut</b>;
            <b>venco</b>;
            <b>and far behind, dmwright, for a mere 260.05 points</b>.
            At this point everyone had solutions for the Level 1 and Level 2 problems except for <b>dmwright</b>.
        </p>
  <p>
            The Level 3 problem proved especially difficult.  <b>ZorbaTHut</b> had the quickest time,
            spending 35 minutes on the problem for 521.33 points.  <b>SnapDragon</b> had the next
            submission, for 435.33.
            With three minutes remaining, <b>reid</b> submitted his Level 3 solution for 481.55 points,
            and <b>dmwright</b> submitted his Level 1 solution for 260.05 points.
        </p>
  <p>
        At the end of the Coding Phase, the scores were:
    </p>
  <ol>
    <li>
      <b>ZorbaTHut</b>
            - 1161.94</li>
    <li>
      <b>reid</b>
            - 1160.36</li>
    <li>
      <b>SnapDragon</b>
            - 1159.17</li>
    <li>
      <b>malpt</b>
            - 706.80</li>
    <li>
      <b>John Dethridge</b>
            - 667.77</li>
    <li>
      <b>doeth</b>
            - 659.65</li>
    <li>
      <b>ambrose</b>
            - 652.55</li>
    <li>
      <b>venco</b>
            - 568.59</li>
    <li>
      <b>dmwright</b>
            - 557.80</li>
  </ol>

    <b>Challenge Phase</b>
  <p>
        The first challenge of the night came from <b>dmwright</b> against
        <b>SnapDragon</b>.  <b>dmwright</b> successfully challenged <b>SnapDragon</b>'s
        Level 1 problem with a test case with repeated values for the purchased tickets.
        <b>SnapDragon</b> obviously did not test his solution on all the sample cases, else he would have
        caught this simple mistake.  <b>dmwright</b> then lost the 50 points he had just gained by
        unsuccessfully challenging <b>ambrose</b>'s Level 1 problem with a similar test case.
        Unfortunately <b>dmwright</b> made a minor mistake in constructing his test case, accidentally
        building a case for which <b>ambrose</b>'s flawed solution actually succeeds.
        </p>
  <p>
        <b>venco</b> was next to pick on <b>ambrose</b>, attacking his Level 2 problem.
        Perhaps <b>venco</b> actually spotted <b>ambrose</b>'s mistake, but if so, he failed
        to form a good test case to exploit it, because his challenge failed.
        The last challenge came from <b>John Dethridge</b>, who succeeded against <b>ambrose</b>'s
        Level 1 problem where <b>dmwright</b> had failed.
        </p>
  <p>
        At the end of the Challenge Phase, the scores were:
    </p>
  <ol>
    <li>
      <b>ZorbaTHut</b>
            - 1161.94</li>
    <li>
      <b>reid</b>
            - 1160.36</li>
    <li>
      <b>SnapDragon</b>
            - 873.09</li>
    <li>
      <b>John Dethridge</b>
            - 717.77</li>
    <li>
      <b>malpt</b>
            - 706.80</li>
    <li>
      <b>doeth</b>
            - 659.65</li>
    <li>
      <b>dmwright</b>
            - 557.80</li>
    <li>
      <b>venco</b>
            - 518.59</li>
    <li>
      <b>ambrose</b>
            - 393.00</li>
  </ol>

    <b>System Test Phase</b>
  <p>Three submissions failed to pass all of the system tests.  As alluded to before, <b>ambrose</b>'s
        Level 2 submission was flawed, due to a mistake in <b>ambrose</b>'s treatment of aces.
        <b>dmwright</b>'s Level 1 problem, like <b>SnapDragon</b>'s and <b>ambrose</b>'s,
        failed to address duplicate purchases properly (which perhaps explains why he was first to spot the same
        mistake in the submissions of others).
        Finally, <b>ZorbaTHut</b>'s Level 2 submission failed due to a very obscure fence-post error.
        </p>
  <b>Final Results</b>
  <ol>
    <li>
      <b>reid</b>
            - 1160.36</li>
    <li>
      <b>SnapDragon</b>
            - 873.09</li>
    <li>
      <b>ZorbaTHut</b>
            - 802.75</li>
    <li>
      <b>John Dethridge</b>
            - 717.77</li>
    <li>
      <b>malpt</b>
            - 706.80</li>
    <li>
      <b>doeth</b>
            - 659.65</li>
    <li>
      <b>venco</b>
            - 518.59</li>
    <li>
      <b>dmwright</b>
            - 297.75</li>
    <li>
      <b>ambrose</b>
            - 0.00</li>
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
