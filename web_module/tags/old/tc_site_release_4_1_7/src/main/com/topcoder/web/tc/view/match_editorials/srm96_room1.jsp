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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm96_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm96_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505514" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm96" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
    <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 96</span><br>June 11, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>
<br/>

<b>Coding Phase</b>
<p>
            The contest began in a very competitive manner, when four coders submitted their solutions
            to the Level 1 problem all within a single minute.
            <B>kv</B>, <B>ZorbaTHut</B>, <B>venco</B>, and <B>SnapDragon</B>
            started out with scores with a range of only 2 points.
        </p>
<p>
            <B>ZorbaTHut</B> took over the lead at the 24 minute mark with his submission of
            the Level 2 problem for 396.86 points (for the best Level 2 score across division 1).
            After looking at the Level 2 problem for 15 minutes, <B>John Dethridge</B> gave up
            and attacked the Level 3 problem.  This resulted in his taking over the lead with his
            submission for 583.53 points (for the best Level 3 score across division 1).
        </p>
<p>
            However, it would be the coders that managed to complete all three problems that would rule the day.
            <B>ZorbaTHut</B> would be first to complete the entire set, submitting the Level 3 problem
            for 471.14 points with 15 minutes remaining in the Coding Phase.  This would later be trumped
            by <B>benetin</B>'s submission for 564.92 points, with 5 minutes remaining.
            <B>KurtSteinkraus</B> was the last coder to complete the entire set, submitting his
            Level 3 solution with only a minute remaining in the Coding Phase for 337.16 points.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ol>
  <li>
    <B>benetin</B>
            - 1138.47</li>
  <li>
    <B>ZorbaTHut</B>
            - 1137.03</li>
  <li>
    <B>KurtSteinkraus</B>
            - 968.17</li>
  <li>
    <B>John Dethridge</B>
            - 836.37</li>
  <li>
    <B>reid</B>
            - 611.04</li>
  <li>
    <B>Joe</B>
            - 550.54</li>
  <li>
    <B>SnapDragon</B>
            - 519.74</li>
  <li>
    <B>kv</B>
            - 510.56</li>
  <li>
    <B>venco</B>
            - 507.68</li>
</ol>
<b>Challenge Phase</b>
<p>
            Only one challenge occurred during the Challenge Phase.  <B>reid</B> challenged
            <B>KurtSteinkraus</B>'s Level 2 problem after noticing a fencepost error.
            This knocked <B>KurtSteinkraus</B> from third to fifth place and moved <B>reid</B>
            up to fourth.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ol>
  <li>
    <B>benetin</B>
            - 1138.47</li>
  <li>
    <B>ZorbaTHut</B>
            - 1137.03</li>
  <li>
    <B>John Dethridge</B>
            - 836.37</li>
  <li>
    <B>reid</B>
            - 661.04</li>
  <li>
    <B>KurtSteinkraus</B>
            - 596.61</li>
  <li>
    <B>Joe</B>
            - 550.54</li>
  <li>
    <B>SnapDragon</B>
            - 519.74</li>
  <li>
    <B>kv</B>
            - 510.56</li>
  <li>
    <B>venco</B>
            - 507.68</li>
</ol>
<b>System Test Phase</b>
<p>
            Only one submission failed the system tests.  <B>benetin</B>'s Level 3 problem failed,
            knocking him from first place to fifth place.  This left <B>ZorbaTHut</B> as the only
            coder in Room 1 to solve the entire problem set, consequently giving him the win for the night.
            <B>John Dethridge</B>'s impressive performance on the two problems he did complete
            gave him a strong second place finish, with <B>reid</B> coming in at third.
        </p>
<b>Final Results</b>
<ol>
  <li>
    <B>ZorbaTHut</B>
            - 1137.03</li>
  <li>
    <B>John Dethridge</B>
            - 836.37</li>
  <li>
    <B>reid</B>
            - 661.04</li>
  <li>
    <B>KurtSteinkraus</B>
            - 596.61</li>
  <li>
    <B>benetin</B>
            - 573.55</li>
  <li>
    <B>Joe</B>
            - 550.54</li>
  <li>
    <B>SnapDragon</B>
            - 519.74</li>
  <li>
    <B>kv</B>
            - 510.56</li>
  <li>
    <B>venco</B>
            - 507.68</li>
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

