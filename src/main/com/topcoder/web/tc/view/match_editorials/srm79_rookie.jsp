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

<span class="bigTitle">Rookie Review</span>

<P>In the rookie rooms, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Frostilicus</A> in Room 65 submitted the 
fastest problem set, netting 1138.10 points for all three solutions. Only he and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Niller</A>
broke 1100, though <A HREF="/stat?c=last_match" CLASS="bodyGeneric">MadMax, Arachnid, JackAttack, weirfreak, KingTark, Silence, fenrir28, 
and v3risimilitud3</A> all achieved more than 1000 points.</P>

<P>Challenge phase produced more than one reversal, with many of the people over 1000 losing most or even all of their solutions, some offsetting this
with one or more successful challenges. Most notably is <A HREF="/stat?c=last_match" CLASS="bodyGeneric">mmsa</A> in room 61 getting four successful 
challenges on <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Arachnid, MadMax, Xalles, and kris,</A> though an unsuccessful challenge on a different 
solution of Arachnid's meant only a net gain of 150 points. <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Silence</A> in room 64 added 50 points to their
score with a successful challenge of <A HREF="/stat?c=last_match" CLASS="bodyGeneric">TaeShadow</A>, bringing it up to 1123.45.</P>

<P>System test was drastic in some rooms and ineffective in others. Room 61 with an amazing 12 successful challenges overall only lost a single
solution, while Room 64 with only a single successful challenge lost a total of nine solutions. <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Frostilicus's</A> 
450 failed the system test, as did <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Silence's</A> 1000 and <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Niller's</A> 
300. However, in each case their two remaining submissions kept them in first place, <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Frostilicus</A> having the 
only working 1000pt solution in the rookie rooms. <A HREF="/stat?c=last_match" CLASS="bodyGeneric">pearl</A> won Room 62 with a successful 300pt and a successful 450pt.</P>

<P>The grand winner of the rookie rooms, however, was <A HREF="/stat?c=last_match" CLASS="bodyGeneric">mmsa</A>, submitting a rapid 
300 and 450 and then gaining another 150 points during challenge phase, for a grand total of 824.11 and a debut rating of 1485.</P>    
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

