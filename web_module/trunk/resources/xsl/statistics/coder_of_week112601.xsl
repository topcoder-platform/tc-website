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
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;November 26 - December 2, 2001</TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>                                                   
                  <TR>
                     <TD VALIGN="top" COLSPAN="3" CLASS="statText">
                                    
<IMG SRC="/i/m/Altrag/Altrag_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<B>Handle:</B> <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A><BR/>
<B>Rating:</B> 1726<BR/>
<B>Member Since:</B> September 7, 2001<BR/>
<B>Total Competitions:</B> 14<BR/>
</P>

<P>
TopCoder, Inc. announced today that <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A> has been named the "Coder of the Week" for Single Round Matches 45 and 46, which took place between November 26 and December 2, 2001.
</P>

<P>
After the "Coding Phase" of Room 11 in SRM 46, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158095" CLASS="coderTextBlue">ajm</A> had a 57.05 (1136.56 to 1079.51) point lead over <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A>.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A> was able to successfully challenge three of his opponents codes for 150 extra points, and ended up winning the room by 42.95 (1229.51 - 1186.56) over <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158095" CLASS="coderTextBlue">ajm</A> who was only able to complete one successful challenge for 50 points.  
</P>

<P>
"I noticed after the challenge phase that I was less than 100 points behind <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158095" CLASS="coderTextBlue">ajm</A>, so I'd need two challenges to win the room," said <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A>.  "I was successful in my two challenges, but noticed that he had been successful in a challenge of his own, and I was still 10 points behind.  I managed to find another problem to challenge, and squeezed by him again for the win."</P>

<P>
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A> narrowly edged <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A>, who won Room 10 and had five successful challenges, for the weekly honor.  The deciding factor was that <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A> was leading his room heading into the challenge phase, while <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A> used the challenge phase to move from second place to first.
</P>

<P>
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A> gained 240 rating points for his performance, increasing his overall TopCoder rating from 1480 to 1720, and making him eligible to compete in Division I matches.
</P>

<P>
A TopCoder member since September 7, 2001, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A> has competed 14 times and has won a total of $750.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A> won his first Division II room during SRM 42 and also won a room in SRM 45, which coupled with his award winning room win in SRM 46, make this the first time he has won consecutive rooms.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A> is a native of Calgary, Alberta, Canada, and is a junior Computer Science major at the University of Calgary. 
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158080" CLASS="coderTextGray">SlackmasterQ</A>, who set the record for the biggest Rating Point Gain ever in Division II, 524, in SRM 45; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141187" CLASS="coderTextBlue">gsh</A>, whose 1354.66 final points in SRM 46 places him 22nd in Highest Point Total in Division II; and <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158137" CLASS="coderTextYellow">olted</A>, who had three successful challenges and gained 374 rating points, tying him for 11th in Rating Point Gain in Division II.
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

