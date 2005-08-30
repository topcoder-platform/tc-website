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
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;January 28 - February 3, 2002</TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>                                                   
                  <TR>
                     <TD VALIGN="top" COLSPAN="3" CLASS="statText">
                                    
<IMG SRC="/i/m/TubaDave/TubaDave_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<b>Handle:</b> <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A><br/>
<b>Rating:</b> 1159<br/>
<b>Member Since:</b> January&#160;3,&#160;2002<br/>
<b>Total Competitions:</b> 2<br/>
</P>

<P>
TopCoder, Inc announced today that <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> has been named the "Coder of the Week" for Single Round Match's 61 and 62, which took place between January 28 and February 3, 2002.  
</P>

<P>
In SRM 62, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> was in sixth place in Room 32 with 351.89 points, after submitting code for the 250 and 500-point problems during the "Coding Phase".  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> was 206.86 points behind <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251944" CLASS="coderTextBlue">the_lark</A>, who was in third with 558.75, and 657.91 points behind room leader <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156896" CLASS="coderTextGreen">iamyou</A>, who had 1009.80.  During the "Challenge Phase", <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> was able to successfully challenge the 500-point submissions of four of the five coders ahead of him for 200 additional points.  This activity moved <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> into third place.  The 1000-point submissions of <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156896" CLASS="coderTextGreen">iamyou</A> and <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=261822" CLASS="coderTextGray">bodrius</A>, who was in second, then failed the system test, which caused them to lose 473.46 and 431.67 points, respectively, and gave <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> his first TopCoder room win.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> gained 301 rating points for his efforts in SRM 62, upping his rating from 858 to 1159, and increasing his TopCoder ranking from 1,033rd to 433rd, an unbelievable 700-place jump!!!  
</P>

<P>
When asked about his four successful challenges, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> responded, "It was the Lucky number problem.  All four programs handled the cases for shared digits and distance to the lucky number, but left out the case where both of those were a tie and just returned the first thing they came to.  So a simple test of {3000, 1000} 2000, which should have returned 1000 returned 3000."
</P>

<P>
A TopCoder member since January 3, 2002, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> has competed twice and has won a total of $150.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A> is a sophomore Computer Science major at the University of Alabama-Tuscaloosa. 
</P>

<P>
"TopCoder is great, added <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260752" CLASS="coderTextGreen">TubaDave</A>.  "It is wonderful to have a place to practice the gifts God has given me, and get paid for it as well." 
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262935" CLASS="coderTextYellow">derkuci</A>, whose 263-point rating gain in SRM 62 was the ninth highest ever in Division I; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152879" CLASS="coderTextBlue">D0SBoots</A>, whose 381-point rating gain in SRM 62 was the 11th highest ever in Division II; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>, who won his room both times during the week to extend his consecutive room win streak to four, which ties him for the third longest in Division I; and <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=263580" CLASS="coderTextYellow">enderx</A>, who earned a 1636 rating after SRM 61, which was the most impressive debut of the week.
</P>

                     </TD>                  
                  </TR>                  
               </TABLE>
               <P><br/></P>
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

