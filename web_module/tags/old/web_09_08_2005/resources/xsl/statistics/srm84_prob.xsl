<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm84_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm84_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm84_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 84</B><BR/>
April 30, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>
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
    <IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;lbackstrom<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159052" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>   
          <P><BR/></P>               </TD>
               <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
               <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>      
            <TR>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>   
            <TR>
               <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
         </TABLE>
      </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

   <!-- Gutter -->
      <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
   <!-- Right Column Ends -->
   <!-- Gutter -->
      <TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


