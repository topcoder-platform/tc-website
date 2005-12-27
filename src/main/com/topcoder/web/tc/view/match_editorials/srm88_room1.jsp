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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505506" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 88</span><br>May 15, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>

<P>
Since the 300 and 500 were pretty easy, almost everyone got both of
those correct.  The only exception was <A HREF="/tc?module=MemberProfile&amp;cr=113178" CLASS="bodyGeneric">po</A>, whose 300 point problem failed 
systests.  Of the three hundreds, 
<A HREF="/tc?module=MemberProfile&amp;cr=120816" CLASS="bodyGeneric">malpt</A>
 was the quickest, submitted in
4 minutes for 293.94 points.  <A HREF="/tc?module=MemberProfile&amp;cr=155275" CLASS="bodyGeneric">DjinnKahn</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=129672" CLASS="bodyGeneric">doeth</A>
 were right behind him,
with 293.22 and 292.77 points, repsectively.  The 500 point submissions 
were all very fast, and all in about the same amount of time, with a 
range of only 32 points.  <A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A> manage to come out on top, 
beating <B>DjinnKahn</B> by about 5 points.  However, <B>DjinnKahn</B> was faster on 
the 300, and managed to beat <B>John Dethridge</B>
 by less than a point.  So, 
after about 20 minutes, most people were done with the 300 and 500 and 
had moved on to stare at the 1100.  
</P>

<P>
For the next 50 minutes or so 5 of 
the room 1 coders worked to figure out the trick to prevent the problem 
from timing out, to no avail.  With about five minutes left, 
<B>po</B> and <A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="bodyGeneric">evd</A>
both finally submitted solution.  <B>DjinnKahn</B> did slightly better, 
submitting with a little over 10 minutes left.  But, in the end the 
winner, hands down, was <B>dmwright</B>, whose 1100 point problem took a little
over 20 minutes.  In the end only 4 of the coders had submitted
solutions to all three problems.  Of these only two would pass systests, as <B>po</B>'s
300 and 1100 failed, while <B>DjinnKahn</B>'s 1100 failed.  Thus, when are had been 
said and done, <B>dmwright</B> cleaned up, beating second place <B>evd</B> by over 300
points and taking the division by over 100 points.  Due to the low 
deviation in the scores, most of the room 1 coders kept much the 
same rating.  The top 3 all moved up about 60 points, while <B>po</B> ended up 
taking a big hit and dropping 105 points.
</P>

<TABLE ALIGN="center" CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#CCCCCC" ALIGN="left" CLASS="bodyText" WIDTH="16%"><B>&#160;Problem<BR/>&#160;</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="right" CLASS="bodyText" WIDTH="16%"><B>Points<BR/>&#160;</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="right" CLASS="bodyText" WIDTH="16%"><B>Submission Rate</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="right" CLASS="bodyText" WIDTH="16%"><B>Submission Succ.</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="right" CLASS="bodyText" WIDTH="16%"><B>Avg. Pts.<BR/>&#160;</B></TD>
    <TD BGCOLOR="#CCCCCC" ALIGN="center" CLASS="bodyText" WIDTH="16%"><B>High Score<BR/>&#160;</B></TD>
  </TR>
  <TR>
    <TD BGCOLOR="#FFFFFF" COLSPAN="6"><IMG BORDER="0" HEIGHT="5" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText" COLSPAN="6">Division I</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 1<BR/>Patterns</TD>
    <TD ALIGN="right" CLASS="bodyText">300</TD>
    <TD ALIGN="right" CLASS="bodyText">86.78%</TD>
    <TD ALIGN="right" CLASS="bodyText">69.60%</TD>
    <TD ALIGN="right" CLASS="bodyText">232.42</TD>
    <TD ALIGN="center" CLASS="bodyText">malpt<BR/>293.94</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 2<BR/>Farmers</TD>
    <TD ALIGN="right" CLASS="bodyText">500</TD>
    <TD ALIGN="right" CLASS="bodyText">82.38%</TD>
    <TD ALIGN="right" CLASS="bodyText">66.96%</TD>
    <TD ALIGN="right" CLASS="bodyText">347.94</TD>
    <TD ALIGN="center" CLASS="bodyText">venco<BR/>461.67</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 3<BR/>SlideGame</TD>
    <TD ALIGN="right" CLASS="bodyText">1100</TD>
    <TD ALIGN="right" CLASS="bodyText">11.01%</TD>
    <TD ALIGN="right" CLASS="bodyText">3.08%</TD>
    <TD ALIGN="right" CLASS="bodyText">594.14</TD>
    <TD ALIGN="center" CLASS="bodyText">dmwright<BR/>771.97</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD BGCOLOR="#FFFFFF" COLSPAN="6"><IMG BORDER="0" HEIGHT="20" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText" COLSPAN="6">Division-II</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 1<BR/>BadSpanish</TD>
    <TD ALIGN="right" CLASS="bodyText">300</TD>
    <TD ALIGN="right" CLASS="bodyText">66.49%</TD>
    <TD ALIGN="right" CLASS="bodyText">23.27%</TD>
    <TD ALIGN="right" CLASS="bodyText">195.55</TD>
    <TD ALIGN="center" CLASS="bodyText">mthreat<BR/>281.41</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
    <TD ALIGN="left" CLASS="bodyText">Level 2<BR/>Divisors</TD>
    <TD ALIGN="right" CLASS="bodyText">500</TD>
    <TD ALIGN="right" CLASS="bodyText">54.48%</TD>
    <TD ALIGN="right" CLASS="bodyText">15.60%</TD>
    <TD ALIGN="right" CLASS="bodyText">365.51</TD>
    <TD ALIGN="center" CLASS="bodyText">FlySkippy1<BR/>479.62</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
  <TR>
   <TD ALIGN="left" CLASS="bodyText">Level 3<BR/>Farmers</TD>
   <TD ALIGN="right" CLASS="bodyText">1000</TD>
   <TD ALIGN="right" CLASS="bodyText">21.23%</TD>
   <TD ALIGN="right" CLASS="bodyText">9.72%</TD>
   <TD ALIGN="right" CLASS="bodyText">576.13</TD>
   <TD ALIGN="center" CLASS="bodyText">b0b0b0b<BR/>853.39</TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000000" COLSPAN="6"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/clear.gif"/></TD>
  </TR>
</TABLE>
<P><BR/></P>

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
