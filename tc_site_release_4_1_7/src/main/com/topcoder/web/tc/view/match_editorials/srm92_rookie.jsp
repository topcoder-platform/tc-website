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
Due to the harder-than-average problems in Division II, rookie room scores were comparatively lower. Coding Phase yielded only 4 >1000 scores - 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">dingodebs</A>, <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">trixzster</A>, 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">mbarb</A>, and <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">BanjoBill</A>, 
from 1091.88 to 1041.94 points. <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">krowa</A> and <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">acs</A> 
held on to high-900 scores, while the next highest score belonged to <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">dabudah</A> with 777.63, dropping from there to 
611.86 on <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">Adebisi</A> and continuing on down.</P>
<P>
As is so often proven with the rookie rooms, high scores don't always hold. <B>acs</B> and <B>BanjoBill</B> each gained 50 points in challenge, and <B>Adebisi</B> pulled in a full hundred, 
but every single other one of the people mentioned lost at least one problem in challenge phase, sometimes all three. This brought windfalls for some people - 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">mercury_m</A> increased a score of 182.44 with two successful challenges, for example - but most in the round lost rather than 
gained. Some, however, managed to lose less than others. <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">Schmyflatt</A> partially offset a Level Two successful challenge with 
a pair of successful challenges of his own, pulling what would have been a 5th-place finish into a 3rd-place.</P>
<P>
System test did its share of damage as well, knocking out <B>BanjoBill's</B> Level Three and many other submissions. Room 64 was hit the worst, losing five solutions total, while Rooms 65 and 68 
were completely untouched.</P>
<P>
Despite his Level Three loss, <B>BanjoBill</B> kept the lead in Room 64 as well as the third highest score in the Rookie Rooms. <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">Dienda</A> 
rode functional Level One and Two solutions to a win in Room 65. <B>Adebisi</B> did the same, but supplemented it with 100 points in challenge phase, getting the second highest score. 
<A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">AI</A> won Room 67 with a Level One. <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">WordMuncher</A> took Room 68 by 
a hair-thin margin of less than a quarter-point, finishing with 178.08 points. <A HREF="stat?c=round_stats&amp;rd=4180&amp;dn=2" CLASS="bodyGeneric">bfields</A> ended coding phase with a score of 145.08, but 
jumped three places after a successful challenge, winning Room 69.</P>
<P>
<B>acs</B> was the only coder to keep all three solutions, and with a challenge was also the only Rookie Room coder to break 1000 points. <B>acs</B> finished the round with 1020.89 points 
and $100 of prize money.</P>


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

