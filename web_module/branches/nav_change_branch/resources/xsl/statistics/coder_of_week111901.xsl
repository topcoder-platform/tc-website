<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/coder_week_pulldown.xsl"/>    
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
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
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
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;November 19 - November 25, 2001</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>																	
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">
												
<A HREF="mailto:rlovelace@topcoder.com?subject=Member photo for [ handle goes here ]"><IMG SRC="/i/m/nophoto_big.gif" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/></A>
<P CLASS="statText">
<B>Handle:</B> <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A><BR/>
<B>Rating:</B> 1359<BR/>
<B>Member Since:</B> September 29, 2001<BR/>
<B>Total Competitions:</B> 18<BR/>
</P>

<P>
TopCoder, Inc. announced today that <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A> has been named the "Coder of the Week" for Single Round Match 44, which took place between November 19 and November 25, 2001.
</P>

<P>
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A> found himself in quite a hole after the "Coding Phase" in Room 27 of SRM 44.  Although he was in the $75 winning position of second place, he was 504.58 
points behind room leader <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158621" CLASS="coderTextGray">Larcener</A> who had 964.61 points and was the only member of the room to complete all three problems.  It was that fact that led <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A> 
to attack the source code of all three of the submissions by <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158621" CLASS="coderTextGray">Larcener</A> in the "Challenge Phase".
</P>

<P>
"I usually view the code of the highest scorers first," said <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A>.  "I especially choose to look at those that are so ridiculously high that there is a good chance 
that they have made mistakes."</P>

<P>
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A> was able to prove all three of the codes submitted by <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158621" CLASS="coderTextGray">Larcener</A> were wrong, and gained 150 extra points.  He was then successful in his challenge of the 
1000-point code of <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158660" CLASS="coderTextGray">Heos</A> for an additional 50 points, and ended up winning his room with 650.03 final points.
</P>

<P>
With the 205 rating points gained from his effort, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A> increased his rating from 1362 to 1567, which makes him eligible to compete in Division I matches.
</P>

<P>
A TopCoder member since September 29, 2001, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A> has competed 18 times and has won a total of $1,375.  He has been a TopCoder SRM room winner four times in 
Division II and once in Division I.  <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A> is a software developer (C++) for Acres Productive Technologies of Niagara Falls, Ontario, Canada.
</P>

<P>
"I like TopCoder, it's a good chance to stretch the mind a little, have some fun, and improve my skills, plus win some money - and a measure of fame if I 
do well enough, added <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A>.
</P>
  
<P>
Other members nominated for "Coder of the Week" were: <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A>, whose 1238.71 final points were the most of the match; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>, whose successful challenge 
of the 1000-point submission of <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158922" CLASS="coderTextYellow">Revoklaw</A> helped him win Room 1; <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=109527" CLASS="coderTextBlue">patsup</A>, whose three successful challenges, one of which was against room leader <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151360" CLASS="coderTextYellow">buddh4sack</A> 
allowed him to win Room 10; and <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157900" CLASS="coderTextGreen">mthreat</A>, who gained 302 rating points which ranks him 21st in Rating Point Gain in Division II.
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

