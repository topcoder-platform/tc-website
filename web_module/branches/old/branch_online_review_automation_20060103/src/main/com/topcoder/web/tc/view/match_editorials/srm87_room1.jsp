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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505505" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 87</span><br>May 9, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>

<P>
I'm the winner of Room 1 (<A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A>), and it's finally pulling me out of a
 long slump (for now, at least), but since I'm the writer, it might be a
 little hard to avoid tooting my own horn, so to speak. Bear with me. I'll
 talk in the third person so it's not quite so unbearable.
</P>
 
<P>
 Room 1 started out with an extremely fast submission by <B>ZorbaTHut</B> on the
 Level One - 3:47, getting 294.77 points and securing the fastest Level One
 submission in Div-I. <A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A> submitted about a minute and a half
 later, getting 290.67 points, followed by <A HREF="/tc?module=MemberProfile&amp;cr=272072" CLASS="bodyGeneric">SnapDragon</A> a minute after that
 with 287.37 points, and <A HREF="/tc?module=MemberProfile&amp;cr=153505" CLASS="bodyGeneric">ambrose</A>
 twenty seconds later for 285.90 points.
 <A HREF="/tc?module=MemberProfile&amp;cr=120816" CLASS="bodyGeneric">malpt</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>
 submitted within five seconds of each other after almost
 eight minutes of coding, getting 279.03 and 279.37 points. <A HREF="/tc?module=MemberProfile&amp;cr=156592" CLASS="bodyGeneric">benetin</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="bodyGeneric">evd</A>
 brought up the end, <B>evd</B> spending eleven and a half minutes for 260.29
 points.
</P>
 
<P>
 A minute and a half after <B>evd</B>'s Level One submission, <B>ZorbaTHut</B> submitted
 his solution for the Level Two after nine and a quarter minutes of coding,
 getting the fastest Level Two submission as well as 499.02 points. Following
 him after slightly more than 3 minutes was, again, <B>Snapdragon</B>, spending ten
 and a half minutes coding the Level Two and getting 487.81 points for his
 work. This time <B>dmwright</B> tied with <B>evd</B>, both spending a little under
 thirteen and a half minutes, getting 456.36 and 457.92 points each. <B>malpt</B>
 and benetin finished last, taking 18:24 for 405.26pt and 22:30 for 367.54pt.
</P>
 
<P>
 Before benetin submitted his Level Two, however, <B>ZorbaTHut</B> finished up his
 Level Three in only fifteen and a half minutes, getting 712.42pt, finishing
 the entire set in only 28 and a half minutes for a grand total of over 1500
 points. <B>Snapdragon</B> finished approximately three minutes later, spending only
 15 extra seconds on the 900 but only getting 706.56 points for it (though
 also beating out benetin's 550.) <B>Snapdragon</B> finished with a grand total of
 1481.74 points, well within range of a single challenge.
</P>
 
<P>
 However, four minutes after <B>Snapdragon</B>'s completion, <B>John Dethridge</B>
 submitted his 900 as well, beating <B>ZorbaTHut</B>'s time by 30 seconds for 721.57
 points, a total of 1447.43, within one challenge of <B>Snapdragon</B>. And five
 minutes after that <B>malpt</B> beat <B>John Dethridge</B>'s time by almost a full minute,
 taking barely over 14 minutes of coding time to finish with 735.89 points
 for the Level Three (the best score in for this problem over the entire
 division), 1420.18 points total, within one challenge of <B>John Dethridge</B>.
</P>
 
<P>
 Unfortunately, the next person to complete all three problems - <B>dmwright</B> -
 placed him 56 points behind <B>malpt</B>. <B>dmwright</B> took 20:39 to earn 628.27
 points. Next was <B>ambrose</B>, a mere 28 points behind <B>dmwright</B>. It must have
 been very frustrating when <B>evd</B> beat <B>ambrose</B>'s time on the 900 by a minute,
 beating <B>ambrose</B>'s score by less than a single point despite spending almost
 three minutes more on all the problems together.
</P>
 
<P>
 By 47 minutes into the match everyone in Room One had submitted all three
 problems, with the exceptions of <A HREF="/tc?module=MemberProfile&amp;cr=156592" CLASS="bodyGeneric">benetin</A> and 
 <A HREF="/tc?module=MemberProfile&amp;cr=128924" CLASS="bodyGeneric">thekcc</A>. <B>benetin</B> was still
 working on his Level Three solution, which he eventually submitted just
 before the end of the match for 438.21 points, getting second-to-last with a
 total score of 1072.04. <B>thekcc</B>, on the other hand, had opened all three
 problems and left with no submissions, clearly an attempt to lower his
 rating to get out of Room One (and frankly, I can't blame him - Room One is
 brutal.)
</P>
 
<P>
 Challenge Phase could have been devastating, as the only person who couldn't
 raise their rank by a single challenge was <B>dmwright</B>. However, almost all the
 solutions were bugless. <B>ambrose</B> successfully challenged 
 <B>benetin</B>'s 900pt,
 dropping <B>benetin</B>'s 8th-place to a lower-scoring 8th-place but raising
 <B>ambrose</B> two ranks, but then unsuccessfully challenged <B>benetin</B>'s 550pt,
 dropping <B>ambrose</B> back to 7th again. benetin attempted to kill <B>ZorbaTHut</B>'s
 900 on a worst-case efficiency challenge, but failed. There were no other
 challenges, despite all the competitors looking for anything to use.
</P>
 
<P>
 System tests proved the quality of the submissions - every remaining problem
 passed all the tests, leaving the winners <B>ZorbaTHut</B>, <B>Snapdragon</B>, and <B>John Dethridge</B>. Despite the fastest Level Three in the division, <B>malpt</B> missed
 placing by 27 points.
</P>
 
<P>
 This round was good to the ratings in Room One. <B>ZorbaTHut</B> gained 148 rating
 points, <B>Snapdragon</B> 93, and <B>John Dethridge</B> 76. <B>malpt</B> gained the fewest,
 getting only 37. The only people to lose rating were <B>dmwright</B> (dropping 4
 points from his astronomical rating of 2932, now only leading 
 <A HREF="/tc?module=MemberProfile&amp;cr=152073" CLASS="bodyGeneric">NDBronson</A>
 by
 17 points), <B>benetin</B>
 (losing 68 points), and <B>thekcc</B>
, capping out his maximum
 drop in one round by diving 170 rating points, plummeting to rank 37 and
 barely going yellow.
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
