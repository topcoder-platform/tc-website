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

<span class="bigTitle">Rookie Review</span>

 <P>
The Rookie Rooms started with mostly scores around the 300 or 400 area, but
 with a few interesting spikes. <A HREF="/tc?module=MemberProfile&amp;cr=281135" CLASS="bodyGeneric">Teagueboy</A>
 submitted 1236.00 points of
 solutions, <A HREF="/tc?module=MemberProfile&amp;cr=283323" CLASS="bodyGeneric">hunsaker</A>
 1436.28 points, and <A HREF="/tc?module=MemberProfile&amp;cr=282719" CLASS="bodyGeneric">Drache</A>
 a surprising 1646.61 points.
 Challenge phase, however, revealed that while <B>Teagueboy</B> and <B>hunsaker</B> had
 submitted serious solutions, <B>Drache</B>'s medium and hard solutions were simply
 stubs that returned an empty vector. Unfortunately, <B>hunsaker</B>'s easy and
 medium solutions folded to challenges, as did <B>Teagueboy</B>'s easy.
</P>
 
<P>
 The room favorite of 63, <A HREF="/tc?module=MemberProfile&amp;cr=278549" CLASS="bodyGeneric">itsouk</A>, 
 had submitted for 688.21 points, and
 managed to get another 200 points in challenge phase, succeeding on five
 challenges and failing on one. Meanwhile, 
 <A HREF="/tc?module=MemberProfile&amp;cr=282521" CLASS="bodyGeneric">jmayhew</A>
 in room 61 almost tripled
 his submission score of 121.31 with four successful challenges of his own.
</P>
 
<P>
 Challenges were quite thorough this round, as systests only wiped out one or
 two problems in most rooms, doing absolutely nothing in Room 61. However,
 Room 64 was hit quite hard by them, losing six submissions total.
</P>
 
<P>
 In Room 60, the room leader was <A HREF="/tc?module=MemberProfile&amp;cr=281014" CLASS="bodyGeneric">krogoth</A>, 
 getting 451.60 points for two
 working submissions and balancing one successful and one unsuccessful
 challenge. Room 61's winner was <A HREF="/tc?module=MemberProfile&amp;cr=280985" CLASS="bodyGeneric">yavinmoon</A>
 with 458.07 points, including 50
 points for a good challenge and barely beating out <B>krogoth</B> for the leader of
 all the Rookie Rooms. Room 62's leader was momth with 307.88 points, getting
 only a submitted solution for easy but an extra 100 points from challenge
 phase. Room 63's leader was <B>itsouk</B>, submitting an easy and a hard, losing
 the hard, but still coming through on 195 points from his working easy
 solution and more than doubling that with another 200 points from challenge
 phase, totaling 395.00. And room 64's leader was Impartial, getting a total
 of 442.92 points for two working solutions and unfortunately missing a
 challenge.
</P>
 
<P>
 Also of note are the aforementioned <B>jmayhew</B> in Room 61, finishing with
 321.31 points, the fourth highest in the rookie rooms, and <B>Teagueboy</B>,
 keeping a working Level Two submission for 308.11 points.
</P>
 
<P>
 In a mildly ironic note, it's worth pointing out that <B>Drache</B>'s
 obviously-broken Level Three problem still successfully defended itself
 against no less than four challenges. It simply returned an empty array -
 {} - and all four first people to challenge did so with cases where the
 correct answer was the empty array! It took <A HREF="/tc?module=MemberProfile&amp;cr=111888" CLASS="bodyGeneric">mverrey</A>
 to come up with a test
 case that did not result in a null set for the result.
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
