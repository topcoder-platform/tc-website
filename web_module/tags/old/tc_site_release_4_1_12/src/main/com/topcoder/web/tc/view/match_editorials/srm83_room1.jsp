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

<span class="bigTitle">Room 1 Review</span>

<P>Room 1 started with everyone opening the Level One problem, except <A HREF="/stat?c=last_match" CLASS="bodyGeneric">dmwright</A> 
who skipped to the Level Two and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">reid</A> who did start with the Level One, but 
for some reason started five minutes late. Meanwhile, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">ZorbaTHut</A> had finished 
and submitted the Level One problem in only seconds more than three and a half minutes, getting 196.90 points. 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">SnapDragon</A> and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">doeth</A> 
submitted theirs in four and a half minutes for 195.07 and 195.15 points respectively, followed by the rest of Room One 
(except <B>dmwright</B>), each coder proceeding to the Level Two problem.</P>

<P><B>doeth</B> submitted the Level Two problem both fast and best, getting 418.77 points for 17 minutes of work, while <B>dmwright</B> 
finished his solution, taking almost 27 minutes for 333.96 points and going back to the Level One problem, finishing it in 6 minutes 
for 192.60 points.</P>

<P>In a surprise move, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">benetin</A> apparently gave up on the Level Two problem, moving 
on to the Level Three problem after almost 18 minutes of work. Meanwhile, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Joe</A>, 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">John Dethridge</A>, <B>reid</B>, and finally <B>ZorbaTHut</B> submitted their Level Two 
solutions within ten minutes, <B>Joe</B> getting 340.62 points due to a late start and <B>ZorbaTHut</B> bringing up the end with only 278.27 points, taking
him 37 minutes.</P>

<P>Aside from <A HREF="/stat?c=last_match" CLASS="bodyGeneric">derkuci's</A> late Level Two submission, only half a minute before the 
end of coding phase, getting 206.07 points for almost 70 minutes of work, all that was left were the Level Three submissions. <B>reid</B> 
scored dramatically higher than anyone else, submitting in under 16 minutes and getting 787.79 points. <B>dmwright</B> took half an hour and 
got 552.89 points, while <B>doeth</B> spent 48 minutes for 429.12 points.</P>

<P>At the end of coding phase, <B>reid</B> was comfortably in the lead by almost 250 points, followed by <B>dmwright</B> and <B>doeth</B> 
seperated by a mere 20 points, but <B>Snapdragon</B>, <B>Joe</B>, and <B>John Dethridge</B> 
behind them by over 500.</P>

<P>Challenge phase started with the only Level Three challenge attempted, <B>doeth's</B> unsuccessful challenge on <B>dmwright</B>. All 
the other challenges were on the Level Two problem, with <B>Joe</B>, <B>doeth</B>, and <B>dmwright's</B> solutions falling to <B>John Dethridge</B>, 
<B>benetin</B>, and <B>SnapDragon</B> respectively. <B>SnapDragon</B> also challenged <B>doeth's</B> Level Two unsuccessfully, and <B>benetin</B> 
attacked <B>SnapDragon</B> and <B>ZorbaTHut's</B> solutions unsuccessfully.</P>

<P>Despite <B>dmwright</B> and <B>doeth</B> losing their Level Two submission, both of them were still in the same positions after challenge phase. 
Systest produced no changes, only shuffling around 5th through 7th place, as <B>ZorbaTHut</B>, <B>SnapDragon</B>, and <B>derkuci's</B> Level Two 
solutions all failed. <B>ZorbaTHut</B> ended up in 5th place on the strength of his Level One solution with <B>benetin</B> picking up last due to 
a very slow submission (over 9 minutes, for 180.71 points.)</P>

<P><B>reid</B>, the only coder in Room One with all three submissions still intact, won by a margin of over 570 points, boosting his rating by 137 
points. <B>dmwright</B> and <B>doeth</B> picked up second and third place, <B>doeth</B> increasing by 32 points and <B>dmwright</B>, due to his 
exceedingly high rating after the collegiate and the exceptional performance by <B>reid</B>, actually dropping by 8 rating points.</P>

<P><B>benetin</B> picked up last, his Level One submission combined with a net loss of 50 points in challenge phase only giving him 130.71 points, 
losing him 183 rating points.</P>

<P><B>John Dethridge</B> was 4th by only 22 points despite a successful challenge by him and an unsuccessful by <B>doeth</B>.</P>

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

