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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm84_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm84_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505502" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm84" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
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

<span class="bodySubtitle">SRM 84</span><br>April 30, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>

<P><A HREF="/stat?c=last_match" CLASS="bodyGeneric">doeth</A> submitted first for 243.67 out of 250, followed almost immediately by 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">ZorbaTHut</A>. <A HREF="/stat?c=last_match" CLASS="bodyGeneric">jonmac</A> and 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson</A> both submitted about a minute later. After fifteen minutes everyone but 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">dmwright</A>, who started with the 900 point problem, was done with the 250.  After twenty 
minutes <B>dmwright</B> finished the 900 point and moved back to the 250, which he finished nine minutes later. <A HREF="/stat?c=last_match" CLASS="bodyGeneric">derkuci</A>, 
who skipped the 600 in favor of the 900 was the first to finish two problems.</P>
<P>After 32 minutes, <B>NDBronson</B> finished the 600, for 372.67 points. <B>ZorbaTHut</B> was right behind him and finished his 600 a minute later. 
It was not until 53 minutes into the competition that the last person, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">reid</A>, submitted 
a second person.  However, this proved not to be a problem for <B>reid</B>, as he coded the 900 point problem in 14 minutes for 752.51 points, second 
only to <A HREF="/stat?c=last_match" CLASS="bodyGeneric">John Dethridge</A>.  At intermission <B>John Dethridge</B> stood on top with his 
division best 769.06 out of 900. <B>NDBronson</B> was 27.55 points behind him, and trailing by 69.5 in third was <B>reid</B>.  Challenging was pretty 
light, with only one successful challenge by <B>ZorbaTHut</B> of <B>dmwright's</B> 600 point problem.  Additionally <B>NDBronson</B> had an unsuccessful 
challenge of <B>ZorbaTHut</B> that dropped him from second into third, and moving <B>reid</B> up.   System testing caught more bugs and killed <B>John Dethridge's</B> 
600 which dropped him out of the running.  It also killed two of <B>derkuci's</B> solutions, which cost him 140 ratings points.  So, at the end of the night, <B>reid</B> 
had come from behind and beat out <B>NDBronson</B> by 8.05 points, who in turn beat third place <B>ZorbaTHut</B> by only 3.59 points.  As a result <B>reid's</B> 
rating went up 132 points.  On the other side of things, <B>derkuci</B> dropped 140 points, knocking him out of the top 10.</P>

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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

