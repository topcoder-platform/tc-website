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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505518" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 101</span><br>June 26, 2002
<br/><br/>

<span class="bigTitle">Room 1 Review</span><br/><br/>

<b>Coding Phase</b>
<p>
        SRM 101 was a unique match for Room 1, as each coder turned in a perfect performance.
        Eight of the nine coders submitted solutions to the Level 1 problem at the four or five minute mark
        (<b>doeth</b>, the ninth, did not start until 13 minutes into the contest).
        Of these first eight submissions, <b>SnapDragon</b>'s was fastest, scoring him 221.60 points.
        However, this did not give him all that great of a lead, as the slowest submissiom from <b>dmwright</b>
        was worth just five points less.
    </p>
<p>
        <b>bigg_nate</b> and <b>SnapDragon</b> then raced to be the first to complete the Level 2 problem.
        <b>bigg_nate</b> came in first with 414.26 points for his submission, and this was followed seconds later
        by <b>SnapDragon</b> for 410.56 points.  At this point <b>bigg_nate</b> lead <b>SnapDragon</b>
        by a mere 0.16 points.  <b>radeye</b> and <b>Yarin</b> were next, and their submissions were
        followed by <b>doeth</b>'s first submission of the night (which was very nearly as fast as <b>SnapDragon</b>'s
        first submission).  <b>malpt</b> and <b>ZorbaTHut</b> were next to submit their Level 2 solutions.
    </p>
<p>
        <b>SnapDragon</b> then completed the problem set only two minutes after <b>ZorbaTHut</b> submitted his
        second solution, scoring an incredible 848.20 points on the Level 3 problem.  This gave him an impressive total of 1480.36,
        nearly impossible for any other coder to obtain at this point.  <b>John Dethridge</b> and <b>doeth</b>'s
        Level 2 solutions shortly followed, with <b>doeth</b> getting the highest score on the Level 2 problem, putting him
        in second place for the moment.  Only <b>dmwright</b> remained to complete the Level 2 problem, having started on
        the Level 3 problem after the Level 1 problem instead.
    </p>
<p>
        <b>Yarin</b> was second to complete the problem set, scoring an amazing 837.83 points on the Level 3 problem.
        This was not enough to take the lead, as <b>SnapDragon</b> scored more points than <b>Yarin</b> on
        each of the three problems, but it put him not far behind at 1439.88 points.
        <b>bigg_nate</b> and <b>dmwright</b> followed with their Level 3 submissions, for far fewer points.
        As <b>bigg_nate</b> was third to complete the problem set, this temporarily gave him third place.
    </p>
<p>
        Things were quiet for about 10 minutes until <b>Yarin</b> was forced to resubmit his Level 1 solution.
        This devastated his score, dropping him to 1210.45 points and third place.  <b>radeye</b> and
        <b>bigg_nate</b> then submitted their Level 3 solutions.  <b>bigg_nate</b> scored
        675.44 points for his solution, giving him third place and pushing <b>Yarin</b> down to fourth.
        <b>John Dethridge</b> closely followed with his Level 3 solution.
    </p>
<p>
        Next was <b>dmwright</b>'s Level 2 submission, putting him less than three points ahead of <b>John Dethridge</b>.
        <b>malpt</b> and <b>ZorbaTHut</b> struggled on the Level 3 problem, and were the last two to finish
        (<b>ZorbaTHut</b> finishing with less than two minutes remaining in the Coding Phase).  All nine
        coders completed the problem set.
    </p>
<p>
        As there were no challenges at all during the Challenge Phase, and every submission passed all the system tests, the scores at
        the end of the Coding Phase were the final scores.  A bizzarely impressive and intense performance from Room 1.
    </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ol>
  <li>
    <b>SnapDragon</b>
            - 1480.36</li>
  <li>
    <b>bigg_nate</b>
            - 1307.76</li>
  <li>
    <b>doeth</b>
            - 1217.35</li>
  <li>
    <b>Yarin</b>
            - 1210.45</li>
  <li>
    <b>radeye</b>
            - 1128.19</li>
  <li>
    <b>dmwright</b>
            - 1105.73</li>
  <li>
    <b>John Dethridge</b>
            - 1102.80</li>
  <li>
    <b>malpt</b>
            - 1075.53</li>
  <li>
    <b>ZorbaTHut</b>
            - 974.77</li>
</ol>


<P><BR/></P>

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

