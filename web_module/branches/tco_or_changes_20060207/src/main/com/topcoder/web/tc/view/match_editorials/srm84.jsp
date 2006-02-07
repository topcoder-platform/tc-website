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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm84_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm84_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505502" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm84" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
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

<span class="bodySubtitle">SRM 84</span><br>April 30, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<P>Div 1 - 250 - ChatParser<BR/>
There was nothing tricky about this problem.  All you had to do was scan the string, and remove the patterns as necessary. There were a few approaches to this. 
The most common was probably to scan the string from left to right, and if an eye is found, then check the next characters to see they match a face. 
If they do, then just remove it and check again from the same position.  The highest scoring approach was that of <A HREF="/stat?&amp;c=last_match" CLASS="bodyGeneric">SnapDragon</A>.</P>

<P>Div 1 - 600 - VirtualMachine<BR/>
This problem was pretty simple, in that it didn't require knowledge of any particular algorithms. However, it was a bit of code, and there were some opportunities to make mistakes. 
The basic approach is simple, you just have a loop that increments your PC at each iteration and in the loop you have a bunch of else-if statements to perform all of the various 
operations.  There were a couple special cases that you have to handle - overflow and memory access out of bounds - but these were simple to check.  All in all it was a pretty 
easy problem, and all that it took was care and time.  See <A HREF="/stat?&amp;c=last_match" CLASS="bodyGeneric">NDBronson's</A> solution for the fastest submission of this problem.</P>

<P>Div 1 - 900 - FillRate<BR/>
If the image is valid (the return is not -1) then it is very simple to find the minimum number of pixels required. For each color that is in the picture, you find the smallest 
rectangle such that all of the pixels of that color are within the rectangle (the bounding rectangle for that color).  The minimum number of pixels is then simply the sum of the 
areas of all these rectangles.</P>

<P>In order to determine if a rectangle is valid, you need to check two things.  The first is that there are no empty ('.') pixels within any of the bounding rectangles. 
The second is that there are no sets of colors where A is on top of B is on top of C is on top of A.  Determining this is exactly analogous to finding loops in a graph. 
Directed edges in the graph are constructed from every color to every other color that it must be on top of (have at least one pixel within a particular color's bounding rectangle). 
Once all of the edges are constructed, there are a number of ways to find loops.  The fastest to code is probably the a variant of the Floyd-Warshall algorithm 
(see <A HREF="/stat?&amp;c=last_match" CLASS="bodyGeneric">John Dethridge's</A> solution for an example).  If a path is found from a pixel to itself, then there is a loop in the 
graph, and hence the picture is not valid.</P>
<P><BR/><DIV ALIGN="center"><TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="center">
<TR>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="left" BGCOLOR="#CCCCCC"><B>&#160;Problem<BR/>&#160;</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Points<BR/>&#160;</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Submission Rate</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Submission Succ.</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Avg. Pts.<BR/>&#160;</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><B>High Score<BR/>&#160;</B></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
<TR><TD COLSPAN="6" CLASS="bodyText" ALIGN="left">Division I</TD></TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 1<BR/>ChatParser</TD>
   <TD CLASS="bodyText" ALIGN="right">250</TD>
   <TD CLASS="bodyText" ALIGN="right">58.44%</TD>
   <TD CLASS="bodyText" ALIGN="right">96.28%</TD>
   <TD CLASS="bodyText" ALIGN="right">212.39</TD>
   <TD CLASS="bodyText" ALIGN="center">SnapDragon<BR/>243.74</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 2<BR/>Virtual Machine</TD>
   <TD CLASS="bodyText" ALIGN="right">600</TD>
   <TD CLASS="bodyText" ALIGN="right">52.67%</TD>
   <TD CLASS="bodyText" ALIGN="right">21.81%</TD>
   <TD CLASS="bodyText" ALIGN="right">270.34</TD>
   <TD CLASS="bodyText" ALIGN="center">NDBronson<BR/>372.67</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 3<BR/>FillRate</TD>
   <TD CLASS="bodyText" ALIGN="right">900</TD>
   <TD CLASS="bodyText" ALIGN="right">36.21%</TD>
   <TD CLASS="bodyText" ALIGN="right">25.93%</TD>
   <TD CLASS="bodyText" ALIGN="right">541.14</TD>
   <TD CLASS="bodyText" ALIGN="center">John Dethridge<BR/>769.06</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

<TR><TD COLSPAN="6" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
<TR><TD COLSPAN="6" CLASS="bodyText" ALIGN="left">Division II</TD></TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 1<BR/>LitLCD</TD>
   <TD CLASS="bodyText" ALIGN="right">250</TD>
   <TD CLASS="bodyText" ALIGN="right">92.56%</TD>
   <TD CLASS="bodyText" ALIGN="right">72.33%</TD>
   <TD CLASS="bodyText" ALIGN="right">207.37</TD>
   <TD CLASS="bodyText" ALIGN="center">androm<BR/>247.02</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 2<BR/>ColorMatch</TD>
   <TD CLASS="bodyText" ALIGN="right">600</TD>
   <TD CLASS="bodyText" ALIGN="right">76.51%</TD>
   <TD CLASS="bodyText" ALIGN="right">54.41%</TD>
   <TD CLASS="bodyText" ALIGN="right">379.10</TD>
   <TD CLASS="bodyText" ALIGN="center">GroZZler<BR/>556.91</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 3<BR/>ChatParser</TD>
   <TD CLASS="bodyText" ALIGN="right">900</TD>
   <TD CLASS="bodyText" ALIGN="right">65.58%</TD>
   <TD CLASS="bodyText" ALIGN="right">26.05%</TD>
   <TD CLASS="bodyText" ALIGN="right">619.11</TD>
   <TD CLASS="bodyText" ALIGN="center">LehooZeher<BR/>851.45</TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
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

