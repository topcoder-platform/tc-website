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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm100_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm100_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505517" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm100" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 100</span><br>June 24, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span><br/><br/>

<P>
Room One enjoyed several quickly-coded problems today. <B>bigg_nate</B> got the 250
faster than anybody, less than 4 minutes for 245.29 points. <B>SnapDragon</B>
barely squeezed in under 4 minutes as well, yielding 245.19 points.
<B>ZorbaTHut</B> took a close third, 20 seonds later for 244.33 points.
</P>

<P>
<B>SnapDragon</B> took first on the 500pt, 460.04 points in eight and a half
minutes. <B>ZorbaTHut</B> followed close behind him again, 458.49 points only ten
seconds later.
</P>

<P>
<B>John Dethridge</B> took the lead from <B>SnapDragon</B>, though, needing only 15 and a
half minutes for his Level Three for 790.81 points. And <B>ZorbaTHut</B> dropped
far in the room rankings, spending nearly an hour on a solution for only
396.94 points. The only unsubmitted problems were <B>bigg_nate</B>'s 1000 and
<B>jonmac</B>'s 500.
</P>

<P>
<B>doeth</B>, unfortunately, found a flaw in his 250pt solution, and was forced to
resubmit for only 76.57 points.
</P>

<P>
Challenge phase was uneventful, the only challenge being <B>jonmac</B>'s failed
attack on <B>dmwright</B>'s 500.
</P>

<P>
System test left few surprises as well. <B>John Dethridge</B> kept all his
submissions, as did <B>SnapDragon</B> and Yarin, placing them respectively 1st,
2nd, and 3rd. Ironically, <B>doeth</B> lost his 250 despite the resubmit, but
placed 4th anyway. <B>ZorbaTHut</B> and <B>dmwright</B> both lost their 1000pt
submissions. venco lost both his 500 and 1000, while <B>jonmac</B>'s failed 1000
and unsubmitted 500 pushed him down to a similar level.
</P>

<P>
<B>John Dethridge</B> passed <B>ZorbaTHut</B> in the rankings, placing him 40 points
behind <B>NDBronson</B>. <B>SnapDragon</B> boosted his rating to equal <B>reid</B>'s.
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

