<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="180" VALIGN="top">
              <!-- Left Column Include Begins -->  
              <!-- Global Seconday Nav Begins -->  
              <xsl:call-template name="global_left"/>
              <!-- Global Seconday Nav Ends -->      
              <!-- Left Column Include Ends -->          
            </TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">tournaments_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->				
        <xsl:call-template name="tournament_links"/>
	<!-- Coder of the Week Pulldown Ends -->
	<BR/><BR/>
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                    <TR>
                      <TD COLSPAN="2" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Regional Championship Seeding</TD>
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/index?t=tournaments&amp;c=tourny_regions_se32" CLASS="statTextBig">View Semifinal Seeding</A><BR/><A HREF="/index?t=tournaments&amp;c=tourny_regions_se128" CLASS="statTextBig">View Quarter-Final Seeding</A></TD>
                    </TR>
						<TR>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourny_regions_ne" CLASS="statTextBig">Northeast</A></TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">Southeast</TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourny_regions_w" CLASS="statTextBig">West</A></TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourny_regions_mw" CLASS="statTextBig">Midwest</A></TD>
						</TR>
                    </TABLE>
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="0" ALIGN="center">
						<TR>
							<TD WIDTH="60%" ALIGN="left" VALIGN="middle" HEIGHT="18" CLASS="statText" BGCOLOR="#000000">School</TD>
							<TD WIDTH="20%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Member</TD>
							<TD WIDTH="10%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Seed</TD>
							<TD WIDTH="10%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Rating</TD>
						</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=153505" CLASS="coderTextRed">ambrose</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2500</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Duke University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262936" CLASS="coderTextRed">dgarthur</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2673</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=135178" CLASS="coderTextYellow">Firewind</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">4</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1910</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Clemson University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=157628" CLASS="coderTextYellow">ShakeSpace</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1706</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Florida State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265334" CLASS="coderTextYellow">levantri</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">7</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1539</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Georgia Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=111202" CLASS="coderTextYellow">ColinMacLeod</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">8</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1835</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251989" CLASS="coderTextYellow">AdamSelene</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">12</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1707</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Central Florida</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251289" CLASS="coderTextBlue">EtherMage</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">99</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1484</TD>
</TR>
						</TABLE><BR/>
				    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                        <TR><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;<A HREF="#top" CLASS="statText">Back to top</A></TD></TR>
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
    <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

