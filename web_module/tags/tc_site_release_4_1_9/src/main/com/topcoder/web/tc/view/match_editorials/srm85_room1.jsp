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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505503" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 85</span><br>May 1, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>

<P>Room 1 (and Division 1 as a whole) was dominated by <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">derkuci</A>, who finished the night with 1586.05 points, almost 200 points above the 
score of the next highest coder in Division 1. <B>derkuci</B> began his dominance early, spending only 40 minutes to complete the three problems during the Coding Phase for a total of 1436.05 points. 
This score by itself would have been sufficient to achieve top score of the night, although at this point he was closely followed by <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">SnapDragon</A> 
(1420.51 points), <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">malpt</A> (1404.20 points), and <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">John Dethridge</A> (1391.89).</P>

<P><B>derkuci</B> proceeded to pad his initially tiny lead by wreaking havoc among 250 point submissions during the Challenge Phase.  By identifying a similar mistake in the 250 point submissions of <B>SnapDragon</B>,
<B>malpt</B>, and <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">anr</A>, <B>derkuci</B> managed to boost his score by 150 points while at the same time decreasing the scores of his two closest 
competitors by over 200 points each.</P>

<P><B>John Dethridge</B> and <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">reid</A> each managed to put in solid performances. <B>John Dethridge</B> obtained 1391.89 in the Coding Phase, which 
earned him second place in Room 1 and across Division 1. <B>reid</B> earned 1260.93 points in the Coding Phase, which was sufficient for third place in Room 1.</P>

<P>There were some lackluster performances as well.</P>
<P><A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">ambrose</A> mistakenly submitted as his solution for the 450 point problem code which overrided its input with a hard-coded test case.  After alerting 
the others of the existence of such a mistake during the Intermission, the challenge of his submission was snapped up by <B>SnapDragon</B>. <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">ZorbaTHut</A> 
and <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">NDBronson</A> both failed to submit a solution for the 1000 point problem, earning them the last two places in the room. <B>NDBronson</B>, in an 
uncharacteristically poor performance, lost his 450 point submission during the System Test Phase, due to a minor mistake.  As a result he also lost top ranking among all coders, a title now held by 
<A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A> (who did not compete tonight).</P>

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
