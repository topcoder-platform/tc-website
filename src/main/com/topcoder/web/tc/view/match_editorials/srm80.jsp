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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm80_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm80_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505495" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm80" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
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

<span class="bodySubtitle">SRM 80</span><br>April 15, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<P>
Division 1 easy - Sketch:<BR/>
Most of the easy problems are quite easy and SRM 80's
were no exception.  You just had to keep a 2D array of
the states of every grid location and move around as
the input says.  The only thing to watch for is bumping
into the edge, in which case you do nothing.  <A HREF="/stat?c=last_match" CLASS="bodyGeneric">See
ZorbaTHut's solution</A> of this for an example.
</P>

<P>
Division 1 medium - Integrate:<BR/>
This was one of the easier mediums, as far as they go.
After an easy parse, you simply integrate as
specified.  After integrating all terms, you have to
add them up, which is simple addition of fractions that
we learned in grade school.  If you didn't do this in a
way such that the sum stayed simplified, you could run
into overflow problems on ints.  Also, some solutions
put the negative sign on the denominator instead of the
numerator, but they were in good company, as <A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson</A>
made the same mistake.  <A HREF="/stat?c=last_match" CLASS="bodyGeneric">See Garzahd's solution</A> in Room
3 for a quick way to do this without a fraction class.
</P>

<P>
Division 1 hard - Simulate:<BR/>
This problem was a little bit tricky.  Simulating the
circuit was pretty straightforward.  You just
recursively get the outputs of each component for the
state at time t, and use this to compute the state at
time t+1.  However, in order to do this efficiently you
had to do 2 things.  First you had to cache the results
of each component at a given time step so that you
didn't end up evaluating it over and over.  If you
don't cache the results, then your solution will run in
time O(24^49) or so, worst case.  The other thing that
you have to notice is that the states loop.  Once you
get to a state that you have previously reached, you
know how many time steps it takes for the states to
loop, and then you can do some clever arithmetic to
figure out which state it ends up at.  For example, the
2 bit binary counter looped through the states 00, 01,
10, 11.  Thus its output at time t was t%4 in binary.
<A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson</A>'s solution to this problem was by far the
fastest, giving him well over a 100 points more than
the nearest competitor.
</P>
<P><BR/><DIV ALIGN="center"><TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="center">
<TR>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="left" BGCOLOR="#CCCCCC"><B>&#160;Problem<BR/>&#160;</B></TD>
   <TD WIDTH="10%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Points<BR/>&#160;</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Submission Rate</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Submission Succ.</B></TD>
   <TD WIDTH="15%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Avg. Pts.<BR/>&#160;</B></TD>
   <TD WIDTH="35%" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><B>High&#160;Score<BR/>&#160;</B></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
<TR><TD COLSPAN="6" CLASS="bodyText" ALIGN="left">Division I</TD></TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 1 - Sketch</TD>
   <TD CLASS="bodyText" ALIGN="right">250</TD>
   <TD CLASS="bodyText" ALIGN="right">95.27897%</TD>
   <TD CLASS="bodyText" ALIGN="right">80.25751%</TD>
   <TD CLASS="bodyText" ALIGN="right">185.33156</TD>
   <TD CLASS="bodyText" ALIGN="center">ZorbaTHut<BR/>239.67</TD> 
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 2 - Integrate</TD>
   <TD CLASS="bodyText" ALIGN="right">500</TD>
   <TD CLASS="bodyText" ALIGN="right">78.11159%</TD>
   <TD CLASS="bodyText" ALIGN="right">32.188843%</TD>
   <TD CLASS="bodyText" ALIGN="right">302.54666</TD>
   <TD CLASS="bodyText" ALIGN="center">Garzahd<BR/>446.88</TD> 
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 3 - Simulate</TD>
   <TD CLASS="bodyText" ALIGN="right">1100</TD>
   <TD CLASS="bodyText" ALIGN="right">16.738197%%</TD>
   <TD CLASS="bodyText" ALIGN="right">3.4334764%</TD>
   <TD CLASS="bodyText" ALIGN="right">540.5</TD>
   <TD CLASS="bodyText" ALIGN="center">NDBronson<BR/>748.43</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

<TR><TD COLSPAN="6" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
<TR><TD COLSPAN="6" CLASS="bodyText" ALIGN="left">Division II (check back for info)</TD></TR>
<!-- <TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 1 - Rain</TD>
   <TD CLASS="bodyText" ALIGN="right">250</TD>
   <TD CLASS="bodyText" ALIGN="right">97.65%</TD>
   <TD CLASS="bodyText" ALIGN="right">97.07%</TD>
   <TD CLASS="bodyText" ALIGN="right">240</TD>
   <TD CLASS="bodyText" ALIGN="center">kokon<BR/>249.16</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 2 - StringOps</TD>
   <TD CLASS="bodyText" ALIGN="right">600</TD>
   <TD CLASS="bodyText" ALIGN="right">91.79%</TD>
   <TD CLASS="bodyText" ALIGN="right">79.47%</TD>
   <TD CLASS="bodyText" ALIGN="right">372</TD>
   <TD CLASS="bodyText" ALIGN="center">WhiteShadow<BR/>478.40</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 3 - Sketch</TD>
   <TD CLASS="bodyText" ALIGN="right">900</TD>
   <TD CLASS="bodyText" ALIGN="right">47.80%</TD>
   <TD CLASS="bodyText" ALIGN="right">3.23%</TD>
   <TD CLASS="bodyText" ALIGN="right">601</TD>
   <TD CLASS="bodyText" ALIGN="center">antimatter<BR/>742.48</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR> -->
</TABLE></DIV></P>

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