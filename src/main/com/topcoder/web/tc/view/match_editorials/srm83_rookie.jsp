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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm83_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm83_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505501" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm83" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR> -->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 83</span><br>April 27, 2002
<br /><br />

<span class="bigTitle">Rookie Review</span>

<P>The rookie rooms started off with an impressive series of scores, with <A HREF="/stat?c=last_match" CLASS="bodyGeneric">herrerar</A> 
achieving 1504 points exactly, followed by <A HREF="/stat?c=last_match" CLASS="bodyGeneric">sillyg00se</A> with 1326.70 points, 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">radeye</A> with 1193.80 points, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">currane</A> 
with 1124.25 points, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">dacurran</A> with 1032.81 points, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">alexguev</A> 
with 1031.95 points, and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">eurasian_69</A> with 1021.76 points, each one submitting all three problems. 
Unfortunately, only <B>radeye</B>, <B>currane</B>, and <B>dacurran</B> made it through challenge phase unscatched, though <B>herrerar</B> made an enormous blitz 
of no less than ten challenges, precisely half of which were successful. System tests produced further carnage, wiping out the Level Three submissions of all three 
as well as <B>dacurran's</B> Level One solution.</P>

<P>The final room leaders were <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Rojer</A> in room 50 with his Level One solution (though trailed by only slightly more than a point by hjdorn), 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">NathanJava</A> in room 51 with a Level Two solution and a net gain of 50 points from challenge phase, <B>dacurran</B> in room 52 with a Level 
Two solution, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">zeze</A> in room 53 with a Level One solution, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">val</A> in room 55 with a Level Two solution, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Marvin</A> 
in room 56 with a Level One solution and 50 challenge points, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">astramer</A> in room 57 with a Level Two solution and 50 challenge points, and 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">granty</A> in room 58 with a Level Two solution and two successful challenges.</P>

<P>However, the clear winner of the rookie rooms was <B>radeye</B> from room 54, finishing with 653.18 points from both a Level One and Level Two solution as well as a successful challenge. 
<B>radeye</B> was one of only two rookie coders to complete more than one problem, the other being <B>currane</B> with 549.71 points, which would have gotten him leader in any other rookie 
room by a substantial margin.</P>

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

