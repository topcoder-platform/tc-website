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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm90_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm90_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505508" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm90" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <!--<TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 90</span><br>May 21, 2002
<br /><br />

<span class="bigTitle">Rookie Review</span>

<P>
In the Rookie Rooms, the coding phase ended with several surprisingly high final scores. 
<A HREF="/tc?module=MemberProfile&amp;cr=285012" CLASS="bodyGeneric">zhaozhong</A>
 led the pack with 1294.74 points, followed by 
 <A HREF="/tc?module=MemberProfile&amp;cr=285176" CLASS="bodyGeneric">shaq1214</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=282574" CLASS="bodyGeneric">maikuru</A> with 1232.23 
and 1231.99 points, and <A HREF="/tc?module=MemberProfile&amp;cr=283374" CLASS="bodyGeneric">indigo9</A> 
with 1191.44 points. Other room leaders were
<A HREF="/tc?module=MemberProfile&amp;cr=284751" CLASS="bodyGeneric">dspetty</A> 
with 1097.23 points, <A HREF="/tc?module=MemberProfile&amp;cr=284788" CLASS="bodyGeneric">tahir</A>
 with 1153.44 points, and <A HREF="/tc?module=MemberProfile&amp;cr=276453" CLASS="bodyGeneric">aduzik</A>
 with 1085.22 points.
</P>

<P>
Usually in the Rookie Rooms, a high coding score doesn't hold up - it's usually indicative 
of a rookie who's going too fast and not checking their work. Today, however, <B>indigo9</B> 
survived two challenges, and <B>zhaozhong</B> didn't even get challenged. <B>maikuru</B> used the round 
to gain another 50 points, <B>zhaozhong</B> paralleling that with a successful challenge of his own, 
but <B>indigo9</B> shot past both of them with an impressive series of five challenges, all 
successful. <A HREF="/tc?module=MemberProfile&amp;cr=281085" CLASS="bodyGeneric">Yrth</A>
 in room 64 gained 50 points off a challenge for a total of 1161.78, while 
 <A HREF="/tc?module=MemberProfile&amp;cr=276525" CLASS="bodyGeneric">yfu</A>,
who was in the same room, brought his score to 1232.81 with two successful challenges.
</P>

<P>
<B>zhaozhong</B> won Room 61 with 1344.74 points. 
<A HREF="/tc?module=MemberProfile&amp;cr=285282" CLASS="bodyGeneric">nissha4</A> 
won Room 62 with 562.66 points, and <A HREF="/tc?module=MemberProfile&amp;cr=282562" CLASS="bodyGeneric">redleaf</A>
 won Room 63 with 1009.88 points 
(followed by <B>maikuru</B>, left with only 698.98 points). <B>Yrth</B> was the leader of Room 64, 
holding on to 1161.78 points, closely followed by <A HREF="/tc?module=MemberProfile&amp;cr=285224" CLASS="bodyGeneric">ifndef</A>
 with 1028.49 points. <A HREF="/tc?module=MemberProfile&amp;cr=156816" CLASS="bodyGeneric">onlycubsfan</A> 
won Room 66 with 596.42 points, making one successful and two unsuccessful challenges to 
bring him within reach of <A HREF="/tc?module=MemberProfile&amp;cr=282466" CLASS="bodyGeneric">doog</A>, 
with 564.67 points including two successful challenges. 
Unfortunately for <B>doog</B>, that's as far as it went.
</P>

<P>
The overall leader of the Rookie Rooms was <B>indigo9</B>, who earned 1191.44 points in the Coding Phase 
and supplemented that with the aforementioned five challenges, for a grand total of 1391.44 points.
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
      
 