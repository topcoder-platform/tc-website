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
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;March 4 - March 10, 2002</TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>                                                   
                  <TR>
                     <TD VALIGN="top" COLSPAN="3" CLASS="statText">
                                    
<IMG SRC="/i/m/EtherMage/EtherMage_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<b>Handle: </b><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextYellow">EtherMage</A><br/>
<b>Rating: </b>1512<br/>
<b>Member Since: </b>December&#160;10,&#160;2001<br/>
<b>Total Competitions: </b>10<br/>
</P>


<P>
TopCoder, Inc announced today that <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextYellow">EtherMage</A> has been named the "Coder of the Week" for the Regional Semifinals of the Collegiate Challenge and Single Round Match 70, which took place between March 4 and March 10, 2002.  
</P>

<P>
In the Regional Semifinals of the Collegiate Challenge, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextYellow">EtherMage</A>, the 99th seed in the Southeast, became the lowest seed to advance to the Regional Championships.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextYellow">EtherMage</A> coded the Easy and Medium problems for 432.66 points and a second place finish behind the region's top seed, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A>, in Room 9. 
</P>

<P>
"In the two rounds I've been through so far, I've coded very carefully," said <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextYellow">EtherMage</A>.  "Not one of the problems that I've submitted even got challenged, and they all passed the system tests."  
</P>

<P>
A TopCoder member since December 10, 2001, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextYellow">EtherMage</A> has competed 10 times and has won a total of $218.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextYellow">EtherMage</A> is a sophomore at the University of Central Florida majoring in Computer Science. 
</P>

<P>
When asked what about what it feels like to be the long shot, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextYellow">EtherMage</A> responded, "It feels great!  It's going to be an incredible challenge going up against all the best coders in the region, and I'm going to be practicing a lot over the next few days to prepare.  I love a challenge and work best under pressure, so these contests are, psychologically, an ideal situation for me."
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A>, who earned 1672.80 points in SRM 70, the fourth highest Division-II total ever, and who had the sixth highest debut rating ever (1908); <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=263379" CLASS="coderTextBlue">pochmann</A>, whose 377 Rating Point Gain in SRM 70 is 12th highest ever in Division-II, and whose 1614.45 points in SRM 70 are the ninth highest Division-II total; and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=261008" CLASS="coderTextGreen">mthed</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262456" CLASS="coderTextGray">Shadowfax</A>, who were the only consecutive room winners in SRM 70.
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

