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
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="16" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;December 10 - December 16, 2001</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>																	
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">
												
<A HREF="mailto:rlovelace@topcoder.com?subject=Member photo for [ handle goes here ]"><IMG SRC="/i/m/nophoto_big.gif" ALT="Coder of the Week" WIDTH="126" HEIGHT="140" ALIGN="left" HSPACE="10" VSPACE="10" BORDER="0"/></A>
<P CLASS="statText">
<B>Handle:</B> <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251140" CLASS="coderTextYellow">ekogan37</A><BR/>
<B>Rating:</B> 1460<BR/>
<B>Member Since:</B> December 4, 2001<BR/>
<B>Total Competitions:</B> 8<BR/>
</P>

<P>
TopCoder, Inc announced today that <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251140" CLASS="coderTextYellow">ekogan37</A> has been 
named the "Coder of the Week" for Single Round Matches 49 and 50, which took place between December 10 - 16, 2001.
</P>

<P>
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251140" CLASS="coderTextYellow">ekogan37</A> entered SRM 49 with a rating of 709, which 
ranked him 1026 out of TopCoder's 1143 rated members.  After finishing second in Room 21 of that match, however, he gained 312 rating points, the 21st biggest rating 
point gain in Division II, and increased his rating to 1021.  Then, in SRM 50, 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251140" CLASS="coderTextYellow">ekogan37</A> won Room 15, his first ever TopCoder room 
win, and increased his rating by 320 points to 1341.  That mark tied him for 19th in Rating Point Gain with 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153107" CLASS="coderTextBlue">amontgomery8</A>, who added 320 points to his rating in SRM 26.
</P>

<P>
With a rating of 1341, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251140" CLASS="coderTextYellow">ekogan37</A> currently ranked 
201st, increasing his ranking by an amazing 825 spots in two matches.
</P>

<P>
A TopCoder member since December 8, 2001, <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251140" CLASS="coderTextYellow">ekogan37</A> 
has competed 4 times and has won a total of $450.  He is a student at MIT, pursuing a Masters Degree in Computer Science.
</P>

<P>
"I think that Topcoder competitions are a tremendous amount of fun - the interface is pretty slick and the problems are difficult but solvable," added 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251140" CLASS="coderTextYellow">ekogan37</A>.
</P>

<P>
Other members nominated for "Coder of the Week" were: <A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251335" CLASS="coderTextYellow">Echo</A>, who had the 12th highest debut rating (1803), and won his room; 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=160127" CLASS="coderTextGray">duckboy</A>, whose rating point gain of 319 in SRM 49 ranks him 20th in Division II; 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158658" CLASS="coderTextYellow">razorback</A>, who won his first Division I room, and whose 248 point rating gain places him tied for seventh; and 
<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156484" CLASS="coderTextYellow">nikolab</A>, who also won his first Division I room, and whose rating gain of 206 places him 24th.
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

