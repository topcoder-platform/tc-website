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
							<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?ContestId=4033&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 62</A></TD>						
							<TD VALIGN="middle" CLASS="statText">Thursday, January 31</TD>
							<TD VALIGN="middle" CLASS="statText">9:00pm EST</TD>
						</TR>						
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: MATCH 61 - January 30, 2002</TD>
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

<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] won his room for the third consecutive time (<A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>), and 38th time overall (<A HREF="/index?t=statistics&amp;c=srm_wins" CLASS="statText">View the list of Overall Wins</A>).  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] is now tied with 13 others for the sixth longest consecutive room win streak.  As a matter of fact, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] holds the record for the longest consecutive room win streak at six.  He won his room from SRM 51-56.  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] won Room 2 by coding the 250 and 1000-point problems successfully.  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] was also successful in his challenge of 1000-point submission of [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158333" CLASS="coderTextYellow">dvickrey</A>&#160;].  The code written by [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] for the 500-point problem failed the system test.  
</P>
 
<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A>&#160;] (Room 1), [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A>&#160;] (Room 3), and [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A>&#160;] (Room 4), were the only coders to successfully complete all three problems.  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A>&#160;] was the quickest to code the problems, earning 1251.43 points in the "Coding Phase".  He was the only one of the three to take advantage of the "Challenge Phase", as he earned an additional 50 points by successfully challenging the 1000-point submission of [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152476" CLASS="coderTextYellow">kalmes</A>&#160;], to finish with 1301.43 points.  With a rating of 3168, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A>&#160;] is TopCoder's top-rated coder.  
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
In Room 14, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153049" CLASS="coderTextBlue">kokon</A>&#160;] was in third place after coding the 250 and 500-point problems during the "Coding Phase".  During the "Challenge Phase", [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153049" CLASS="coderTextBlue">kokon</A>&#160;] successfully challenged the 500-point submission by [&#160;newellm&#160;].  [&#160;newellm&#160;] lost all points earned on that problem, and with the 50 additional points, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153049" CLASS="coderTextBlue">kokon</A>&#160;] won the room.  The [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153049" CLASS="coderTextBlue">kokon</A>&#160;] challenge was the only challenge of the room.   
</P>

<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=132980" CLASS="coderTextBlue">Hao</A>&#160;] had just about the same experience in Room 17.  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=132980" CLASS="coderTextBlue">Hao</A>&#160;] submitted code for the 250 and 500-point problems in the "Coding Phase", good enough for a second place standing.  During the "Challenge Phase", [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=132980" CLASS="coderTextBlue">Hao</A>&#160;] successfully challenged the 1000-point submission of room leader [&#160;quicsilvar&#160;], and like [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153049" CLASS="coderTextBlue">kokon</A>&#160;] used the 50 additional points to move into first place and win the room.  Just like Room 14, this was the only challenge of the room.  
</P>
 
<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A>&#160;] was the coder who used the "Challenge Phase" the most to their advantage in SRM 61, as [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A>&#160;] had three successful challenges for 150 additional points, which helped him win Room 40.
</P>

<P>
The room win by [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=261637" CLASS="coderTextBlue">awesjosh</A>&#160;] in Room 47 was the third consecutive, which ties him with 11 others for the forth longest consecutive room win streak (<A HREF="/index?t=statistics&amp;c=consec_wins_div2" CLASS="statText">View the list of Division-II Consecutive Wins</A>).  
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

