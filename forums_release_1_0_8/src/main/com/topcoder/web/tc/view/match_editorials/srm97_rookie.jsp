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

<span class="bigTitle">Rookie Review</span>
<br/>

<P>
Today yielded four rookie rooms, and I think I'm going to stop mentioning
how high rookie coding-phase scores usually collapse, because lately they
haven't been. After coding phase, <A HREF="/tc?module=MemberProfile&amp;cr=288170" CLASS="bodyGeneric">qwj</A>
 was leading the rooms with 1597.35
points, followed by <A HREF="/tc?module=MemberProfile&amp;cr=283534" CLASS="bodyGeneric">HrtRulzMind</A>
 with 1222.10, <A HREF="/tc?module=MemberProfile&amp;cr=286113" CLASS="bodyGeneric">mlev</A>
 with 1203.06, <A HREF="/tc?module=MemberProfile&amp;cr=288428" CLASS="bodyGeneric">boydp</A> with
1202.51, <A HREF="/tc?module=MemberProfile&amp;cr=289000" CLASS="bodyGeneric">silicon</A>
 with 1109.89, <A HREF="/tc?module=MemberProfile&amp;cr=289006" CLASS="bodyGeneric">snx</A>
 with 1072.96, and <A HREF="/tc?module=MemberProfile&amp;cr=288787" CLASS="bodyGeneric">lympanda</A>
 with 1025.22,
after which scores dropped almost 200 points.
</P>

<P>
Challenges saw little action today - one succeeded challenge in room 64 by
<A HREF="/tc?module=MemberProfile&amp;cr=288822" CLASS="bodyGeneric">banizar</A>, 
one in room 67 by <A HREF="/tc?module=MemberProfile&amp;cr=288965" CLASS="bodyGeneric">LuSiD</A>, 
as well as successful challenges by <B>snx</B>
and <B>qwj</B>. Unfortunately, every other successful challenge - of which there
were few - were invariably followed by one or more unsuccessful. Even <B>snx</B>
and <B>qwj</B>'s successes were bittersweet, as both coders lost their Level One
submissions due to challenges.
</P>

<P>
System tests, unfortuately, blitzed all the rooms very badly, leaving only
the top scorers in each room with positive scores. qwj from room 66 finished
in the lead overall, keeping 1360.55 points from his two remaining
submissions and successful challenge. <B>HrtRulzMind</B>, in room 64, took second,
preserving 1222.10 points directly from coding phase. <B>boydp</B>, room 67, took
third, duplicating the feat with a mere 20 fewer points. Despite a Level
Three failure, <A HREF="/tc?module=MemberProfile&amp;cr=286113" CLASS="bodyGeneric">mlev</A>
 took fourth, winning Room 65 with 627.12 points.
</P>

<P>
<B>qwj</B> exited the rookie rooms with a rating of 1721.
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
