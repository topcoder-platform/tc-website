<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Press Room</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
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
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Upcoming/Past Features</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
            <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1" BGCOLOR="#FFFFFF">
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Upcoming Features</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3" BGCOLOR="#CCCCCC">Database security</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3">The ACE library - Adaptive Communication  Environment</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3" BGCOLOR="#CCCCCC">Authoring for an advanced morphing software (C++)</TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3">Massive-scale simulator to test an instant messaging server (C++)</TD></TR>		
	    <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3" BGCOLOR="#CCCCCC">Tools for debugging memory leaks</TD></TR>
	    <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3">Smart pointers in C++</TD></TR>	
	    <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3" BGCOLOR="#CCCCCC">Explaining dynamic Programming</TD></TR>
	    <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3">Genetic algorithms/programming</TD></TR>	    	
	    <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3" BGCOLOR="#CCCCCC">Reverse engineering the MSN Messenger protocol</TD></TR>	
	    <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3">XML-based UI description language that allows dynamic building and switching of UI screens at runtime</TD></TR>
	    <TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3"><A HREF="/index?t=news_events&amp;c=feat_topics" CLASS="bodyGeneric">Want to write?</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>		
				
		<TR><TD VALIGN="middle" BGCOLOR="#CCCCCC" HEIGHT="18" WIDTH="12%" CLASS="bodyText">&#160;&#160;<B>Date</B></TD><TD WIDTH="25%" VALIGN="middle" BGCOLOR="#CCCCCC" CLASS="bodyText">&#160;&#160;<B>Author</B></TD><TD WIDTH="63%" VALIGN="middle" BGCOLOR="#CCCCCC" CLASS="bodyText">&#160;&#160;<B>Feature</B></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;October</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.09.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;Penwiper</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_100902" CLASS="bodyGeneric">Graphics Programming for Motion Capture</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.02.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;pearl</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_100202" CLASS="bodyGeneric">Finding a Job is a Job</A></TD></TR>

		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;September</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.11.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;KaiEl</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_091102" CLASS="bodyGeneric">...A Problem is Born</A></TD></TR>

		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>				
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;August</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.21.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;polgara</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_082102" CLASS="bodyGeneric">Wireless Woes and Winners</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.07.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;KaiEl</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_080702" CLASS="bodyGeneric">Match Strategy</A></TD></TR>
		
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;July</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.24.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;polgara</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_072402" CLASS="bodyGeneric">Attack of the Moans: Building Applications for Users</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.10.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;bitbucket43</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_071002" CLASS="bodyGeneric">From the Field - Avoid Overloading!</A></TD></TR>

		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;June</TD></TR> 
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.26.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;kpsmith</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_062602" CLASS="bodyGeneric">From the Field</A></TD></TR>		
<!--		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.19.02</TD><TD VALIGN="middle" CLASS="bodyText">TopCoder Staff</TD><TD VALIGN="middle" CLASS="bodyText">Rapid Rise</TD></TR> -->
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.12.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;polgara</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_061202" CLASS="bodyGeneric">To in-house or to out-source, that is the question</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.05.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;TopCoder Staff</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_060502" CLASS="bodyGeneric">Where Has The Time Gone?</A></TD></TR>

		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;May</TD></TR> 
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.29.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;TopCoder Staff</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_052902" CLASS="bodyGeneric">The Outsiders</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.22.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;KaiEl</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_052202" CLASS="bodyGeneric">Obfu-What?</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.15.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;TopCoder Staff</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_051502" CLASS="bodyGeneric">First Time Phenomenal</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.08.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;TopCoder Staff</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_050802" CLASS="bodyGeneric">Working Their Way Up</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.01.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;TopCoder Staff</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=feat_050102" CLASS="bodyGeneric">The Women of TopCoder</A></TD></TR>

		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="3" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;April</TD></TR> 
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.24.02</TD><TD VALIGN="middle" CLASS="bodyText">&#160;&#160;TopCoder Staff</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=2002tccc_feature" CLASS="bodyGeneric">A Matter of Time</A></TD></TR>
            </TABLE>
<P>
<A HREF="/index?t=news_events&amp;c=feat_topics" CLASS="bodyGeneric">Want to write?</A>
</P>
            
<P><BR/></P>
					</TD>
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="pr_right_col"/>       
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
