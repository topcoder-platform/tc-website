<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
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
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>
						<TR><TD VALIGN="middle" CLASS="smallText" COLSPAN="2" HEIGHT="18">&#160;<!--<A HREF="/index?t=news_events&amp;c=index" CLASS="smallText">&#160;Press Release 2002</A>--></TD></TR>
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BGCOLOR="#333333" HEIGHT="18">&#160;LATEST NEWS</TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
						<TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;02.27.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_infoweek3" CLASS="bodyText">Cultivating Next-Generation IT Talent</A></TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>
						
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Press Releases <!--Archive--> - 2002</TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
						<TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;02.19.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_02_19_02" CLASS="bodyText">TopCoder Announces Field for the 2002 Sun Microsystems and TopCoder Collegiate Challenge Programming Tournament</A></TD></TR>          
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;01.28.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_01_28_02" CLASS="bodyText">TopCoder Adds the United Kingdom To Its Developer Community</A></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>
						
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Press Releases <!--Archive--> - 2001</TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.10.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_12_10_01" CLASS="bodyText">Sun Sponsoring 2002 Collegiate Challenge</A></TD></TR>           
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.06.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_11_06_01" CLASS="bodyText">Houston Native Jon McAlister Wins $250,000 TopCoder Invitational</A></TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.15.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_10_15_01" CLASS="bodyText">TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament</A></TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.28.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_09_28_01" CLASS="bodyText">Member Referal Program Extended</A></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.24.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_09_24_01" CLASS="bodyText">Foxwoods to Host $250,000 TopCoder Invitational Tournament</A></TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.21.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_09_21_01" CLASS="bodyText">Updated 2001 Invitational Schedule</A></TD></TR>                
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.29.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_08_29_01" CLASS="bodyText">Applet Source Code Released</A></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.01.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_08_01_01" CLASS="bodyText">Rating System Updated</A></TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.07.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_06_07_01" CLASS="bodyText">Jason Woolever Wins 2001 TopCoder Collegiate Challenge</A></TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.29.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_05_29_01" CLASS="bodyText">TopCoder Addresses Demand for Elite Programmers with Coding Competitions</A></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.22.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_05_22_01" CLASS="bodyText">Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title</A></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.24.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_04_24_01" CLASS="bodyText">TopCoder Names Jack Hughes Chairman of the Board</A></TD></TR>                                                      
						<TR><TD COLSPAN="2" CLASS="bodyText"><BR/><BR/>Please direct media related questions to:<BR/><A HREF="mailto:gherchen@topcoder.com" CLASS="bodyText">George Herchenroether, VP of Marketing</A></TD></TR>
					</TABLE>
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
