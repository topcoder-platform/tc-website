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

<span class="bigTitle">Room 1 Review</span>
<br/>

<P>
Room One started with the normal flurry of Level One openings, 
<A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>
ignoring his usual Level Two start to join the rest of the pack. 
<A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A>,
<A HREF="/tc?module=MemberProfile&amp;cr=157974" CLASS="bodyGeneric">bigg_nate</A>, 
and <A HREF="/tc?module=MemberProfile&amp;cr=120816" CLASS="bodyGeneric">malpt</A>
 raced to be the first, all opening in under five
seconds. <A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="bodyGeneric">evd</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>
 both opened after about thirty seconds, while <A HREF="/tc?module=MemberProfile&amp;cr=154754" CLASS="bodyGeneric">kv</A>
waited more than seventy seconds and <A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A>
 taking nearly four
minutes just to open the first problem.
</P>

<P>
Only five minutes after the start of the match <B>ZorbaTHut</B> submitted his 300pt
solution, for 290.73 points, the highest in the room. <B>evd</B> followed a minute
later, earning 287.79 points, closely followed by <B>bigg_nate</B>. <B>kv</B> spent seven
minutes on the solution for 283.75 points, followed soon after by <B>malpt</B>.
<B>John Dethridge</B> and <B>dmwright</B> submitted at the nine-and-a-half-minute mark,
<B>dmwright</B> taking over nine minutes to earn 272.52 points. However, due to his
late start, <B>John Dethridge</B> got the second highest score in the room on the
Level One problem, spending only 5:45 for 288.32 points.
</P>

<P>
Each coder moved on to the Level Two in sequence, joining <B>ZorbaTHut</B>, who
submitted after only seven minutes of work, earning 353.68 points, the
highest score in the room for the 375pt as well. <B>bigg_nate</B> submitted second,
getting 328.12 points for eleven minutes of work, followed seconds after by
<B>kv</B>, only taking nine and a half minutes due to his late start and slightly
slower 300pt. <B>John Dethridge</B> took second in the room on the Level Two as
well, finishing after 8:16 for 346.53 points. <B>dmwright</B> spent over twenty
minutes on the problem, amd <B>evd</B> took almost 25 minutes, for only 237.95
points.
</P>

<P>
It became clear very quickly who knew how to solve the 1100. <B>kv</B> submitted
first after less than 20 minutes of work, getting a whopping 782.64 points,
beaten a minute later by <B>John Dethridge</B>'s 16-minute submission for 857.85
points. <B>malpt</B> took 18 minutes, and <B>dmwright</B> spent almost 29 minutes, but
despite <B>ZorbaTHut</B> opening it with more than an hour left, it took him over
50 minutes to finally figure out the solution, submitting for only 460.58
points, in fifth place.
</P>

<P>
However, looking over his problems, <B>malpt</B> found a bug in his 375pt solution,
and was forced to resubmit. At this point the problem had been open for over
47 minutes, and combined with the resubmission penalty, this brought his
score down to 127.82 points for that problem. This was followed soon after
by another bug, in his 300pt this time, and the open-time of almost an hour
combined with the penalty downed his score to a devastating 90 points flat,
dropping him behind <B>ZorbaTHut</B>.
</P>

<P>
At the end of the coding phase <B>John Dethridge</B> was leading with 1492.70
points, followed by <B>kv</B> with 1405.30 points, <B>dmwright</B> with 1177.11 points,
ZorbaHut trailing with 1104.89 points, and <B>malpt</B> taking <B>ZorbaTHut</B>'s old
place with only 1035.56 points. <B>bigg_nate</B> and <B>evd</B> didn't submit solutions to
the Level Three, and were left with 613.83 and 525.73 points respectively.
</P>

<P>
Challenge phase, unlike usual in Room One, produced quite a few changes.
<B>dmwright</B> challenged <B>kv</B>'s Level Two submission successfully, dropping <B>kv</B> down
between <B>malpt</B> and <B>ZorbaTHut</B>. <B>John Dethridge</B> took out <B>evd</B>'s Level One
problem, which served no purpose other than to increase <B>John Dethridge</B>'s now
enormous lead even more and to drop <B>evd</B>'s last place even further down.
<B>malpt</B>, now in 5th place, attempted to challenge <B>ZorbaTHut</B>'s Level Three
problem. If successful, <B>malpt</B> would have vaulted over <B>kv</B>, and combined with
<B>ZorbaTHut</B>'s drop, would have landed him in 3rd place. However, the challenge
was a failure, and <B>malpt</B> dropped back further.
</P>

<P>
After challenge phase <B>John Dethridge</B> was far in the lead of anyone else,
<B>dmwright</B> over 300 points behind, with <B>ZorbaTHut</B> clinging to third place 400
points behind, less than 50 points ahead of <B>kv</B>.
</P>

<P>
System test kept this positioning - every problem left after challenge phase
passed perfectly.
</P>

<P>
<B>John Dethridge</B> gained 98 rating points from his impressive showing.
<B>dmwright</B>, the highest-ranked coder registered for SRM 95, increased his
rating by 46. <B>ZorbaTHut</B>, the second highest-ranked coder, only gained 17.
<B>malpt</B> did exactly as expected and his rating remained the same, while
<B>bigg_nate</B>'s only dropped by 4 points. <B>evd</B>, unfortunately, lost 143 points
with only a surviving 375pt submission.
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

