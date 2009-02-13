<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/coder_week_pulldown.xsl"/>    
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
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
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
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Coder of the Week</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
   <TR>
      <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
      <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->            
        <xsl:call-template name="coder_week_pulldown"/>
   <!-- Coder of the Week Pulldown Ends -->               
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>               
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;January 14 - January 20, 2002</TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>                                                   
                  <TR>
                     <TD VALIGN="top" COLSPAN="3" CLASS="statText">
                                    
<IMG SRC="/i/m/benny/benny_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<B>Handle:</B> <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A><BR/>
<B>Rating:</B> 1012<BR/>
<B>Member Since:</B> December 1, 2001<BR/>
<B>Total Competitions:</B> 11<BR/>
</P>

<P>
TopCoder, Inc announced today that <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A> has been 
named the "Coder of the Week" for Single Round Matches 57 and 58, which took place between January 14 - 20, 2002.  
</P>

<P>
IN SRM's 57 and 58, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A> was a perfect three-for-three in his submissions and one-for-one in his challenges, in route to winning his first two rooms ever.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A> began the week with a rating of 699, which ranked him 1,243rd among TopCoder members.  He gained 219 rating points in SRM 57 and 94 in SRM 58 (313 points total) for a new rating of 1012.  Those rating points improved his overall ranking to 614th, an impressive 629-place gain in two matches!!!  
</P>

<P>
When asked about his impressive week, the humble <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A> remarked, "Even a blind squirrel finds a nut once in a while," and when further asked about his consecutive wins he replied, "I guess in my case, a blind squirrel can even get hit TWICE by nuts on the head just walking down the street."
</P>

<P>
A TopCoder member since December 1, 2001, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A> has competed 11 times and has won a total of $400.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A> is a year 2000 graduate of the University of Maryland with a Bachelor's Degree in Computer Science and Electrical Engineering.  He is currently resides in Maryland, and is employed as a Software Engineer.  
</P>

<P>
"I love the contests!" added <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A>.  "I don't win much, and I always seem to make some stupid mistakes that drop me to the bottom of the room.  But most of the time, I have a blast solving the problems.  It's such a refreshing change from the daily work to be coding something fun and short.  Having a chance to walk away with a prize is such an added bonus as well." 
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153650" CLASS="coderTextYellow">polgara</A>, who won her room in SRM's 57 and 58, her third consecutive win; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251276" CLASS="coderTextYellow">duongsaa</A>, whose 286-point rating gain in SRM 58 was the fifth highest ever in Division I; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262048" CLASS="coderTextYellow">edreisbach</A>, who became the 85th member to win their room in their SRM debut, and whose 1752 rating was the 20th highest rating debut ever; and <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A>, whose 333-point rating gain in SRM 57 was the highest ever in Division I.
</P>

                     </TD>                  
                  </TR>                  
               </TABLE>
               <P><BR/></P>
      </TD>
      <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
   </TR>
   <TR>
      <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
   </TR>      
   <TR>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
   </TR>   
   <TR>
      <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
   </TR>
</TABLE>
      </TD>
   <!-- Center Column Ends -->
<!-- Body Area Ends -->

   <!-- Gutter -->
      <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
   <!-- Right Column Ends -->
   <!-- Gutter -->
      <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


