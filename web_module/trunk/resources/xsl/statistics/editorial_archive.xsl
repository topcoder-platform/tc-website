<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
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
        <xsl:call-template name="public_stats_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Match Editorial Archive - 2002</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>May</B></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.22.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 91 - <A HREF="/index?t=statistics&amp;c=srm91_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm91_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm91_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.21.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 90 - <A HREF="/index?t=statistics&amp;c=srm90_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm90_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm90_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.18.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 89 - <A HREF="/index?t=statistics&amp;c=srm89_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm89_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm89_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A> | <A HREF="/index?t=statistics&amp;c=srm89_lessons" CLASS="bodyText">Lessons&#160;Learned</A></TD></TR>	
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.15.02</TD><TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;SRM 88 - <A HREF="/index?t=statistics&amp;c=srm88_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm88_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm88_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A> | <A HREF="/index?t=statistics&amp;c=srm88_lessons" CLASS="bodyText">Lessons&#160;Learned</A></TD></TR>	
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.09.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 87 - <A HREF="/index?t=statistics&amp;c=srm87_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm87_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm87_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A> | <A HREF="/index?t=statistics&amp;c=srm87_lessons" CLASS="bodyText">Lessons&#160;Learned</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.08.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 86 - <A HREF="/index?t=statistics&amp;c=srm86_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm86_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm86_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.01.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 85 - <A HREF="/index?t=statistics&amp;c=srm85_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm85_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm85_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A> | <A HREF="/index?t=statistics&amp;c=srm85_lessons" CLASS="bodyText">Lessons&#160;Learned</A></TD></TR>


		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">&#160;<B>April</B></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.30.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 84 - <A HREF="/index?t=statistics&amp;c=srm84_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm84_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm84_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.27.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 83 - <A HREF="/index?t=statistics&amp;c=srm83_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm83_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm83_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.24.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 82 - Coder Point of View editorials not available for this match.</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.22.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 81 - This match was rescheduled to Saturday, April 27th as SRM 83</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.15.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 80 - <A HREF="/index?t=statistics&amp;c=srm80_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm80_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm80_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.10.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 79 - <A HREF="/index?t=statistics&amp;c=srm79_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm79_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm79_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.09.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;SRM 78 - <A HREF="/index?t=statistics&amp;c=srm78_room1" CLASS="bodyText">Room 1</A> | <A HREF="/index?t=statistics&amp;c=srm78_rookie" CLASS="bodyText">Rookie Review</A> | <A HREF="/index?t=statistics&amp;c=srm78_prob" CLASS="bodyText">Problem Set Analysis &amp; Opinion</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
		<TR><TD COLSPAN="2" ALIGN="left" CLASS="bodyText"><BR/><BR/><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Are you a member interested in writing a review?</A></TD></TR>
            </TABLE>
          <P><BR/></P>					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
<!-- <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
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
