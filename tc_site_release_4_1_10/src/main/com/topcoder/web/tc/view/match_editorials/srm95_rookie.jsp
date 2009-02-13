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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505513" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 95</span><br>June 5, 2002
<br /><br />

<span class="bigTitle">Rookie Review</span>
<br/>

<P>
Rookie Room was oddly small today, only filling 4 rooms with a total of 32
people, and also surprisingly predictable, therefore this writeup is going
to be rather small also. Coding phase ended with five scores above 1000.
<A HREF="/tc?module=MemberProfile&amp;cr=287266" CLASS="bodyGeneric">jms137</A>
 took the lead with 1306.38 points, followed by 
 <A HREF="/tc?module=MemberProfile&amp;cr=287805" CLASS="bodyGeneric">good</A>
 with 1263.67
points, <A HREF="/tc?module=MemberProfile&amp;cr=269495" CLASS="bodyGeneric">Ricin</A>
 with 1130.37 points, and <A HREF="/tc?module=MemberProfile&amp;cr=273421" CLASS="bodyGeneric">Poobslag</A>
with 1123.37 points.
</P>

<P>
Normally the highest scores in the Rookie Rooms fold quite quickly in
challenge - often people code very quickly without testing well. Today,
however, was an exception. Out of all those five, only <B>Ricin</B> lost a
problem - two, in fact, both the Level One and the Level Three. However,
<B>Ricin</B>'s two successful challenges were enough to regain first place in Room
68 by a comfortable margin, as the second-place competitor lost their Level
Three as well.
</P>

<P>
As for the other coders, <B>good</B> was the only other one to lose points, making
a pair of unsuccessful challenges. <B>Poobslag</B>, in the same room, got two
successful challenge to push his score sixty points ahead of <B>good</B>, then lost
a challenge to drop down to ten points above.
</P>

<P>
System test yielded even fewer changes. Only eight solutions failed over the
entire Rookie Rooms. One of these was <B>good</B>'s, but the simultaneous failure
of the third-place competitor in that room kept <B>good</B> in second place.
</P>

<P>
<B>Ricin</B> kept lead in Room 68, finishing with 541.18 points. <B>jms137</B> kept
1306.38 points straight from coding phase, leading room 67. <B>Poobslag</B> took
first in Room 65 with 1123.37 points from coding phase and 50 challenge
points. <B>jms137</B>, became one of
only two coders to go yellow straight from the Rookie Rooms after this
match.
</P>

<P>
Also of note is <B>good</B>, keeping a Level One and Level Two for 593.37 points
despite two failed challenges, and <A HREF="/tc?module=MemberProfile&amp;cr=287588" CLASS="bodyGeneric">Descent</A>
, holding on to 590.37 points in
Room 66. <A HREF="/tc?module=MemberProfile&amp;cr=287944" CLASS="bodyGeneric">omarr</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=287554" CLASS="bodyGeneric">chandan</A>
 both finished with 535 points and change.
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

