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

<span class="bigTitle">Rookie Review</span>
<br />

<P>
    <b>Coding Phase</b>
</P>

  <p>
            For the most part, each rookie room was dominated by a single coder.
            This was most prevalent during the Coding phase.
        </p>
  <p>
        At the end of the Coding Phase, the scores were:
    </p>
  
<UL>
   <LI>Room 65:</LI>
        <OL>
          <LI><B>hoover_jon</B> - 1084.01</LI>
         </OL>
   <LI>Room 66:</LI>
        <OL>
          <LI><B>kot</B> - 1440.85</LI>
         </OL>
   <LI>Room 67:</LI>
        <OL>
          <LI><B>along</B> - 1165.00</LI>
         </OL>
   <LI>Room 68:</LI>
        <OL>
          <LI><B>Mike2000</B> - 855.51</LI>
         </OL>
   <LI>Room 69:</LI>
        <OL>
          <LI><B>mandersen</B> - 548.03</LI>
           <LI><B>snaff12</B> - 424.05</LI>
         </OL>
</UL>

<P>
    <b>Challenge Phase</b>
</P>

  <p>
            In Room 66, <b>kot</b> had a busy Challenge Phase.
            First, <b>kot</b> lost his Level 3 problem to a challenge by <b>yatta5000</b>.
            The reason for this is that <b>kot</b>'s Level 3 submission was simply returned a random
            number.  <b>kot</b> then proceeded to submit 4 challenges of his own.
        </p>
  <p>
            The first, against <b>gdennis</b>'s flawed Level 1 submission, failed, losing <b>kot</b>
            an additional 50 points.  <b>gdennis</b>'s solution failed to compute the rounded mean properly,
            but <b>kot</b>'s test case failed to exploit that.  <b>kot</b>'s next challenge was
            against <b>Saeven</b>'s Level 2 problem, and was successful.  <b>Saevon</b> didn't bother
            to compute the mean at all.  <b>kot</b> also successfully challenged <b>yatta5000</b>'s
            Level 1 problem, perhaps in retaliation for <b>yatta5000</b>'s earlier challenge, but then
            unsuccessfully challenged <b>Saeven</b>'s Level 2 submission.
            All of <b>kot</b>'s challenges balanced out to 0 points for him, but the unsucessful defense of
            his Level 3 problem lost him 855.28 points.
        </p>
  <p>
            The most masterful rookie performance of the night was by <b>along</b> in Room 67,
            who accumulated three successful challenges.
            <b>along</b> successfully challenged <b>vietchau</b>'s Level 1 submission (incorrect mean calculation),
            <b>samosa</b>'s Level 1 submission (same mistake),
            and <b>kidprogram</b>'s Level 2 submission.
            This gave <b>along</b> 150 points and a commanding lead.
        </p>
  <p>
            In Room 68, <b>Mike2000</b> lost both of his submissions to challenges, giving the lead up to
            <b>diffusion_84</b>.  In Room 69, <b>manderson</b> gained 50 points from
            <b>tdrapeau</b>'s Level 1 problem (which returned a mean instead of a median).
        </p>
  <p>
        At the end of the Challenge Phase, the scores were:
    </p>
  <ul>
            Room 65:
            <ol>
      <li><b>hoover_jon</b> - 1084.01</li>
    </ol>
            Room 66:
            <ol>
      <li><b>kot</b> - 585.57</li>
    </ol>
            Room 67:
            <ol>
      <li><b>along</b> - 1315.00</li>
    </ol>
            Room 68:
            <ol>
      <li><b>jonderry</b> - 505.43</li>
      <li><b>Mike2000</b> - 427.85</li>
      <li><b>diffusion_84</b> - 423.34</li>
    </ol>
            Room 69:
            <ol>
      <li><b>mandersen</b> - 598.03</li>
      <li><b>snaff12</b> - 424.05</li>
    </ol>
  </ul>

<P>
    <b>System Test Phase</b>
</P>

  <p>
            The System Phase resulted in quite a lot of movement in rookie ranks.
            In Room 65, <b>hoover_jon</b> lost his Level 3 problem, but due to his other two submissions
            was barely able to hold onto the room lead.
            In Room 68, <b>jonderry</b> lost his Level 2 submission and <b>Mike2000</b> lost his Level 1 submission,
            giving the room lead to <b>diffusion_84</b> who had previously been in third place.
            In Room 69, <b>mandersen</b> and <b>snaff12</b> each lost his Level 2 problem, leaving them with the same rankings as before.
        </p>
  <b>Final Results</b>
  <ul>
            Room 65:
            <ol>
      <li><b>hoover_jon</b> - 546.66</li>
    </ol>
            Room 66:
            <ol>
      <li><b>kot</b> - 585.57</li>
    </ol>
            Room 67:
            <ol>
      <li><b>along</b> - 1315.00</li>
    </ol>
            Room 68:
            <ol>
      <li><b>diffusion_84</b> - 423.34</li>
    </ol>
            Room 69:
            <ol>
      <li><b>mandersen</b> - 369.71</li>
    </ol>
  </ul>
  <p>
                Congratulations to <b>along</b>, whose very impressive score dwarfed that of any of the other rookies.
                This gives <b>along</b> a nice yellow rating of 1832, the sixteenth highest debut ever.
                </p>

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
