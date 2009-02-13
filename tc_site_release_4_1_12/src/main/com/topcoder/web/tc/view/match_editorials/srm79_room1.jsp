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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm79_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm79_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505494" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm79" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
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

<span class="bodySubtitle">SRM 79</span><br>April 10, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>

<P>Room 1 started out rather normally, with <A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson</A> submitting the 300 first,
taking only seven and a half minutes for 281.73 points. Second was <A HREF="/stat?c=last_match" CLASS="bodyGeneric">John Dethridge</A>, 
spending eight minutes for 279.73 points, followed by the rest of the room. <A HREF="/stat?c=last_match" CLASS="bodyGeneric">dmwright</A> 
came in last with 252.79 points after sixteen and a half minutes, but due to a three-and-a-half-minute late start, this only adds up
to thirteen minutes of coding time.</P>

<P><A HREF="/stat?c=last_match" CLASS="bodyGeneric">ZorbaTHut</A> submitted the fastest 500 by quite a bit, completing the code in 
only 9 minutes.  <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Doeth</A> and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson</A> 
followed soon after, taking 11.5 and almost 15 minutes respectively. <A HREF="/stat?c=last_match" CLASS="bodyGeneric">dgarthur</A> submitted the slowest 500pt
solution, spending over 24 minutes on it. Only <A HREF="/stat?c=last_match" CLASS="bodyGeneric">evd</A> failed to submit the 500.</P>

<P><A HREF="/stat?c=last_match" CLASS="bodyGeneric">ZorbaTHut</A> submitted an amazingly fast 950pt solution, taking only slightly 
over 10 minutes to code it for 844.96 points and submitting even before most of the room had finished their 500s. <A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson</A> 
submitted a full 16 minutes later, spending about 21.5 minutes coding it for 648.72 points, but soon followed by 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">dmwright</A> making up for his slow 300 and 500 by submitting an 11-minute solution for 830.86 points. 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">doeth</A> had the slowest 950pt solution, spending almost 32 minutes on his code. 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">John Dethridge</A> and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">evd</A> failed to submit the 950pt.</P>

<P>Challenge round was amazingly boring, as absolutely nothing happened.</P>

<P>System tests produced a few upsets - <A HREF="/stat?c=last_match" CLASS="bodyGeneric">ZorbaTHut's</A> fast 950pt solution failed,
dropping him from 1st to 6th. The only other failures were dgarthur's 500pt and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">John Dethridge's</A> 500pt. 
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">dmwright</A> took the lead with his high-scoring 950pt and all three successful solutions, totaling 
1434.10 points, followed by <A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson</A> with 1332.36 points and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">malpt</A> 
with 1274.74 points, each with three working solutions. Last place was <A HREF="/stat?c=last_match" CLASS="bodyGeneric">evd</A> with 269.99 points, followed by
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">John Dethridge</A> with 269.73, each with only their 300pt solution remaining.
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">ZorbaTHut</A> was the only other coder with less than 1000 points in Room 1.</P>
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

