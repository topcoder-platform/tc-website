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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm92_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm92_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505510" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm92" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 92</span><br>May 29, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>

<P>
Room 1 started with <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">venco</A>, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">ambrose</A>, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">bigg_nate</A>, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">ZorbaTHut</A>, and 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">SnapDragon</A> opening the Level One within ten seconds, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">John Dethridge</A> arriving a minute
late but taking the same track. <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">dmwright</A> showed up 
two and a half minutes late, but started on the Level Two instead. <B>SnapDragon</B> finished the Level One after seven seconds 
flat, for 283.16 points, the highest in the room. Two minutes later <B>bigg_nate</B> completed his solution, followed seconds later 
by the late arrival of <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=1" CLASS="bodyGeneric">reid</A>, who immediately opened his own Level One
problem. <B>ambrose</B>, <B>ZorbaTHut</B>, and <B>venco</B> submitted their Level One solutions within fifteen seconds of each other, <B>ambrose</B> 
getting 261.34 points and <B>ZorbaTHut</B> beating out venco by two seconds for 260.41 points to <B>venco's</B> 260.18. <B>John Dethridge</B> 
spent 16 minutes on his solution, getting only 233.96 points.</P>
<P>
Meanwhile, <B>dmwright</B> completed his Level Two submission for 413.60 points in thirteen and a half minutes, followed after a mere two and a half minutes by
<B>SnapDragon</B>, racking out a Level Two solution in only eleven minutes for 437.27 points. <B>dmwright</B> continued on to the Level Three, as did <B>SnapDragon</B>. 
<B>ZorbaTHut</B>, <B>bigg_nate</B>, <B>venco</B>, and <B>John Dethridge</B> completed in anywhere from twelve minutes to eighteen minutes, the widely varying Level One 
submission times making unpredictable scores. <B>ZorbaTHut</B> moved on to the Level Three before anyone but <B>SnapDragon</B> and <B>dmwright</B>, though <B>John Dethridge</B>, 
finishing almost five minutes later, nevertheless got six points more, for 427.99 on the Level Two. <B>bigg_nate</B>, on the other hand, despite submitting a minute and a 
half sooner than <B>John Dethridge</B>, actually spent over 50% longer, getting only 369.46 points.</P>
<P>
<B>reid</B> showed up to the match over nine minutes late and spent almost twelve minutes on the Level One, getting 257.92 points and opening the Level Two 
after <B>SnapDragon</B> and <B>dmwright</B> had finished it and moved on. Nevertheless, he finished the Level Two faster than anyone else, shaving 20 seconds off 
<B>SnapDragon's</B> time and earning 439.97 points, moving on to the Level Three still five minutes behind even <B>John Dethridge</B>. <B>ambrose</B> continued struggling 
with his Level Two. He eventually finished it after nearly forty minutes of work for only 242.55 points.</P>
<P>
<B>SnapDragon</B> continued his unbelievable times, spending less than 16 minutes on the Level Three, netting a whopping 747.37 points and finishing the entire problem set 
in less than 35 minutes, for a grand total of 1467.80 points. <B>dmwright</B> finished the Level Three eight minutes later for 588.29 points after twenty-six minutes of work, 
going back to his unopened Level One. <B>John Dethridge</B> finished the problem set forty-six minutes into the match, spending almost exactly one minute more than <B>SnapDragon</B> 
on his Level Three for 730.17 points. <B>ZorbaTHut</B> finished four minutes later, taking 25 minutes on the Level Three for only 590.57 points. <B>reid</B> completing the set 
after 56 minutes, taking only 21 and a half for his Level Three for 648.48 points. <B>dmwright</B> and <B>bigg_nate</B> finished their sets within seconds of each other, <B>dmwright</B> 
burning 18 minutes on a 222.90point Level One submission and <B>bigg_nate</B> taking almost 33 minutes on a 513.08point Level Three. <B>venco</B> and <B>ambrose</B> did not submit a Level Three.</P>
<P>
At the end of coding phase, <B>SnapDragon</B> was easily in the lead with his amazing total of 1467.80 points. <B>John Dethridge</B> was 2nd with 1392.12 points, and <B>reid</B> 
third with 1346.37 points. <B>ZorbaTHut</B>, <B>dmwright</B>, and <B>bigg_nate</B> took the middle places, with <B>venco</B> and <B>ambrose</B> trailing far behind.</P>
<P>
Challenge phase was, as usual, quiet, the only event being <B>dmwright's</B> successful challenge of <B>ZorbaTHut's</B> Level One problem, dropping <B>ZorbaTHut</B> behind 
<B>bigg_nate</B> and pushing <B>dmwright</B> up to almost exactly ZorbaTHut's old score.</P>
<P>
Systests, however, produced some changes, with <B>ZorbaTHut's</B> Level Two failing as well as both submissions of <B>ambrose</B>. <B>bigg_nate</B> and <B>John Dethridge</B> 
both lost their Level Three, and <B>reid</B> lost his Level One. <B>venco</B> kept both his submissions, and both <B>SnapDragon</B> and <B>dmwright</B> kept all three, <B>SnapDragon</B> 
preserving his impressive score.</P>
<P>
<B>SnapDragon</B> finished as the room winner, <B>dmwright</B> getting 2nd place and <B>reid's</B> Level One loss knocking him from 2nd to 3rd, still in the running. 
<B>John Dethridge</B>, <B>bigg_nate</B>, and <B>venco</B> took up the middle. <B>ZorbaTHut's</B> multiple failures dropped him into the second-to-last place, only above 
<B>ambrose</B>, left with zero points.</P>
<P>
<B>SnapDragon</B> gained 112 rating points from his impressive work, sending him up several places. <B>dmwright</B> gained the second most, getting 62 points. <B>reid</B>, 
<B>bigg_nate</B>, and <B>venco</B> gained 32, 37, and 47 respectively. <B>John Dethridge</B> did almost as predicted, gaining eight points, as did <B>ZorbaTHut</B>, losing 
a mere six. <B>ambrose</B>, on the other hand, plummeted a full 169 points down the rankings, not quite his maximum for one round.</P>


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

