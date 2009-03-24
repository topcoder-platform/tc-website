<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
		<jsp:param name="node" value="algo_match_editorials"/>
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

<span class="bigTitle">Room 1 Review</span>

<P>
Room 1 started with nearly simultaneous openings of the Level One problem by 
<A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=274023" CLASS="bodyGeneric">venco</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=158333" CLASS="bodyGeneric">dvickrey</A>, 
and <A HREF="/tc?module=MemberProfile&amp;cr=157974" CLASS="bodyGeneric">bigg_nate</A>. 
<A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=114443" CLASS="bodyGeneric">jonmac</A>, and
<A HREF="/tc?module=MemberProfile&amp;cr=262935" CLASS="bodyGeneric">derkuci</A>
 all opened the same problem within twenty seconds, while 
 <A HREF="/tc?module=MemberProfile&amp;cr=156592" CLASS="bodyGeneric">benetin</A>
 waited almost a minute, and <A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A> for some reason 
taking well over four minutes to start - an inauspicious beginning.
</P>

<P>
Meanwhile, <B>ZorbaTHut</B> submitted the Level One after three minutes flat for 247.22 (not the best score in the competition - 
<A HREF="/tc?module=MemberProfile&amp;cr=154754" CLASS="bodyGeneric">kv</A> 
in Room Two beat him by exactly half a minute). He was quickly followed by <B>derkuci</B> and <B>venco</B> at twenty-second intervals, 
for 246.62 and 245.98 points respectively.
<B>bigg_nate</B> submitted at the 4.5 minute mark for 243.71, while <B>jonmac</B> and
<B>John Dethridge</B> submitted at 5:45 and 5:55, both getting about 240 points.
<B>dvickrey</B> spent 8 minutes on a 231.52 point solution, and <B>benetin</B> spent nearly 11 minutes on a solution to give him only 219.13 
points. Despite <B>dmwright's</B> late start, he completed his code in five and a half minutes for almost 241 points.
</P>

<P>
Each coder proceeded to the Level Two problem in turn, except <B>benetin</B> and
<B>dmwright</B>, who each went straight to the Level Three problem. <B>ZorbaTHut</B> was once again the fastest submitter in 
Room 1, getting 402.33 points for less than 15 minutes of work. Yet again though, his score was topped in a 
different room (<A HREF="/tc?module=MemberProfile&amp;cr=269554" CLASS="bodyGeneric">Yarin</A>
 in room 24, getting 426.46 points). This time it was <B>bigg_nate</B> who had the second fastest submission, 
taking a minute longer for 391.97 points. <B>John Dethridge</B>, <B>dvickrey</B>, <B>derkuci</B>, and <B>jonmac</B> spent between seventeen and a half 
minutes to over 20 minutes on their Level Two submissions. <B>venco</B> unfortunately couldn't repeat his performance on the Level 
One, and spent over 24 minutes, getting only 321.83 points. All the coders proceeded in turn to the Level Three, joining 
<B>dmwright</B> and <B>benetin</B>.
</P>

<P>
<B>dmwright</B> was the first to submit the Level Three, partially due to his eight-minute head start over <B>ZorbaTHut</B>. 
<B>dmwright</B> spent 45 minutes and earned 451.78 points. He then went back to do the Level Two. Three minutes later <B>ZorbaTHut</B> submitted, taking less than 41 
minutes for 477.34 points. <B>ZorbaTHut</B> was the first to finish all three problems, earning 1126.89 points in slightly less 
than 59 minutes. However, unfortunately for him, <B>bigg_nate</B> submitted his Level Three thirty seconds later, actually taking 
two minutes less to code it and earning 492.67 points, bringing his total a mere point and a half above <B>ZorbaTHut</B>'s. 
The next submitter of the Level Three was <B>benetin</B>, finishing up a solution that took him 54 minutes to write, earning 
413.02 points. <B>benetin</B> had skipped to the Level Three directly, and apparently decided not to attempt the Level Two in 
the eight minutes he had remaining.
</P>

<P>
The last minute of the match produced a flurry of submissions, <B>jonmac</B> submitting with only 50 seconds remaining on the 
clock, <B>derkuci</B> waiting until 23 seconds before the end of the round, <B>John Dethridge</B> submitting with a mere 12 seconds 
remaining, and <B>dmwright</B> squeezing in his Level Two with literally two seconds until closing. The standing were <B>ZorbaTHut</B> 
and <B>bigg_nate</B> separated by a point and a half, with <B>John Dethridge</B>, <B>jonmac</B>, <B>derkuci</B>, and <B>dmwright</B> within 23 points of 
each other. <B>dmwright</B> (the highest of them, and currently 3rd place) was 70 points away from <B>ZorbaTHut</B>. <B>venco</B> and 
<B>dvickrey</B> failed to submit a Level Three, while <B>benetin</B> didn't submit a Level Two.
</P>

<P>
During challenge phase, <B>ZorbaTHut</B> went looking at <B>dmwright's</B> last-minute submission, finding a bug and successfully 
challenging. This pushed him above <B>bigg_nate</B>, taking the lead, and knocking <B>dmwright</B> behind the pack. <B>dvickrey</B> 
attempted a challenge on <B>John Dethridge</B>'s Level Two but failed, quickly mirrored by <B>venco</B>'s likewise-unsuccessful 
challenge on <B>dvickrey</B>'s Level Two.
</P>

<P>
System tests destroyed the Level Three solutions over the entire competition, leaving only <B>ZorbaTHut</B> and 
<B>John Dethridge</B>'s submissions unscathed. In addition, <B>dvickrey's</B> Level Two submission failed.
</P>

<P>
<B>ZorbaTHut</B> finished in first place with 1176.89 points, the highest score in the entire competition. 
<B>John Dethridge</B> took second highest with 1051.96 points. <B>bigg_nate</B> got third place with his 635.68 points. 
<B>dvickrey</B> got last in the room, with only a surviving Level One solution and a bad challenge. <B>benetin</B> took second-last,
 and <B>dmwright</B> got a surprising third-last.
</P>

<P>
<B>ZorbaTHut</B> picked up 117 rating points, boosting him all the way up to #5 from #10. <B>John Dethridge</B> gained 64, and <B>bigg_nate</B> 
got 38 points. Everyone else in the room lost rating, from <B>derkuci</B> who lost only a single point to <B>dvickrey</B> who dropped 
by 184 points, the maximum he could drop in one round. The only other person to drop his maximum was <B>dmwright</B>, 
losing 166 points and plummeting from his 1st-place position all the way to 4th-place, <B>ZorbaTHut</B> now only 
64 points behind him, from 347 points a day ago.
</P>
<div class="authorPhoto">
    <img src="/i/m/ZorbaTHut_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="152347" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
      
 