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
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;February 18 - February 24, 2002</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>																	
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">
												
<IMG SRC="/i/m/chi/chi_big.jpg" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/>
<P CLASS="statText">
<b>Handle: </b><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A><br/>
<b>Rating: </b>1395<br/>
<b>Member Since: </b>September&#160;15,&#160;2001<br/>
<b>Total Competitions: </b>26<br/>
</P>

<P>
TopCoder, Inc announced today that <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A> has been named the "Coder of the Week" for Single Round Match 67, which took place between February 18 and February 24, 2002.  
</P>

<P>
In Single Round Match 67, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A> produced 1898.64 final points to break the record for Division II Highest Point Total.  The previous record was 1713.30, which was earned by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152437" CLASS="coderTextBlue">oneshinevn</A> in SRM 20.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A> led Room 24 after the "Coding Phase" by earning 247.87 points on the 250-point problem, 492.61 on the 500-point problem and 908.16 on the 1000-pointer, for a total of 1648.64.  That total alone would have been the second highest total ever in Division II, however, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A> then gained 250 additional points in the "Challenge Phase" (six successful challenges for, and one challenge against) and broke the record.  
</P>

<P>
"My success in SRM 67 can be attributed to both luck and my experience in prior TopCoder competitions," said <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A>.  "Those things allowed me to see and implement the solutions to the problems relatively quickly.  They also allowed me to see a special case (N&#60;3) in the 500-point problem that might be easily missed by other programmers.  By utilizing this special case, I was quickly able to challenge four 500-point solutions."
</P>

<P>
A TopCoder member since September 15, 2001, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A> has competed 26 times and has won a total of $1375.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A> is a senior at the University of Calgary majoring in Computer Science. 
</P>

<P>
"It feels great to be the new Division II record holder," added <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A>.  "I am very happy with TopCoder.  Participating in TopCoder has resulted in substantial improvements to my programming abilities.  By looking at other people's solutions, I am able to learn new algorithms that I otherwise would not have experience with."
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextGreen">EtherMage</A>
, who as the 99th seed in the Southeast region, won Room 20 in the First Round of the 2002 Sun and TopCoder Collegiate Challenge to advance to the Second Round; <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156804" CLASS="coderTextYellow">Zaen</A>, who as the 125th seed in the Northeast Region, won Room 3 in the First Round of the 2002 Sun and TopCoder Collegiate Challenge to advance to the Second Round; and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=264869" CLASS="coderTextYellow">ante</A>, who had a 275 rating point gain in SRM 67, to tie <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153902" CLASS="coderTextRed">evd</A> for the eighth highest gain in Division I.  
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

