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
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->  
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->          
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">schedule_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;Tournaments</xsl:with-param>
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
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/index?t=schedule&amp;c=tourny_regions_ne32" CLASS="statTextBig">View Semifinal Seeding</A><BR/><A HREF="/index?t=schedule&amp;c=tourny_regions_ne128" CLASS="statTextBig">View Quarter-Final Seeding</A></TD>
                    </TR>
						<TR>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">Northeast</TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=tourny_regions_se" CLASS="statTextBig">Southeast</A></TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=tourny_regions_w" CLASS="statTextBig">West</A></TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=tourny_regions_mw" CLASS="statTextBig">Midwest</A></TD>
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
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=147102" CLASS="coderTextRed">pl31415</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2609</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Oberlin College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2701</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">5</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2643</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2354</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">9</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2120</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251457" CLASS="coderTextYellow">etolson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">10</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2131</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159052" CLASS="coderTextYellow">lbackstrom</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">13</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2125</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=263580" CLASS="coderTextYellow">enderx</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">30</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1814</TD>
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
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

