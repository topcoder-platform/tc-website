<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
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
		<TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Last Match Summary</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
						</TR>					
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;The next TopCoder competition:</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>						
						<TR>
							<TD VALIGN="middle" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="40%">&#160;Match</TD>						
							<TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="40%">&#160;Date</TD>
							<TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="20%">&#160;Time</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>												
						<TR>
							<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4055&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 65</A></TD>						
							<TD VALIGN="middle" CLASS="statText">Tuesday, February 12</TD>
							<TD VALIGN="middle" CLASS="statText">10:00pm EST</TD>
						</TR>						
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: MATCH 64 - February 6, 2002</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>												
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-I</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
						</TR>											
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>
<A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statText">View the list of Division-I Wins</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div2" CLASS="statText">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A> -->

<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>&#160;] was the winner in Room 5 after successfully submitting code for all three problems and successfully challenging the 250-point submission of [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157638" CLASS="coderTextBlue">Porgery</A>&#160;].  The win by [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>&#160;] was his third consecutive, which ties him with 13 others for the seventh longest streak (<A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>).
</P>

<P>
Like [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>&#160;], [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A>&#160;] submitted the correct code for all three problems and was successful in his challenge to win his room (Room 7).  That win was the second consecutive for [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A>&#160;].  
</P>

<P>
In Room 11, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A>&#160;] took advantage of the "Challenge Phase" to secure the win.  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A>&#160;] led the room with 1255.72 points after submitting code for all three problems during the "Coding Phase".  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A>&#160;] added 300 additional points to his total after seven of his eight challenges were successful.  Those challenges turned out to be very important, as the 250 and 500-point codes submitted by [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A>&#160;] ended up failing the system test, which cost [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A>&#160;] the 548.18 points that were earned on those problems.
</P>

					</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
						</TR>				
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
						</TR>						
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">						
<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264869" CLASS="coderTextYellow">ante</A>&#160;] was the winner in Room 49.  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264869" CLASS="coderTextYellow">ante</A>&#160;] submitted the correct code for all three problems and had a successful challenge for 1002.06 final points, the highest total in Division II.  The win was the second consecutive for [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264869" CLASS="coderTextYellow">ante</A>&#160;] in just the second match [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264869" CLASS="coderTextYellow">ante</A>&#160;] has ever competed in (<A HREF="/index?t=statistics&amp;c=consec_wins_div2" CLASS="statText">View the list of Division-II Consecutive Wins</A>.  The 372-point rating gain attained by [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264869" CLASS="coderTextYellow">ante</A>&#160;] ranks as the 16th largest increase ever (<A HREF="/index?t=statistics&amp;c=rate_gain_div2" CLASS="statText">View the list of Division-II Rating Point Gain</A>).
</P>

<P>
Two significant events took place in Room 26.  First off, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264175" CLASS="coderTextBlue">piZZa</A>&#160;] won for the third consecutive time, which ties [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264175" CLASS="coderTextBlue">piZZa</A>&#160;] with 17 others for the fourth longest streak.  This streak is very impressive since these were the first three matches [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264175" CLASS="coderTextBlue">piZZa</A>&#160;] has competed in.  The second place finisher in the room was [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264745" CLASS="coderTextGreen">nleseul</A>&#160;], whose 345 rating point gain was the 20th largest increase ever.  
</P>

<P>
Debut winners in SRM 64 included [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265453" CLASS="coderTextYellow">gutenphrack</A>&#160;], [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265031" CLASS="coderTextYellow">Gyrefalcon</A>&#160;], [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265531" CLASS="coderTextYellow">langer</A>&#160;], and [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251109" CLASS="coderTextYellow">valeria</A>&#160;] (<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>).
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

