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
							<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4031&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 60</A></TD>						
							<TD VALIGN="middle" CLASS="statText">Saturday, January 26</TD>
							<TD VALIGN="middle" CLASS="statText">2:00pm EST</TD>
						</TR>						
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: MATCH 59 - January 23, 2002</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>												
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division I</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
						</TR>											
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statTextBig">
												
<P>
Nine of the ten room winners [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] (Room 1), [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156592" CLASS="coderTextRed">benetin</A>&#160;] (Room 2),  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A>&#160;] (Room 3), [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=128924" CLASS="coderTextYellow">thekcc</A>&#160;] (Room 4), 
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A>&#160;] (Room 5), [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111359" CLASS="coderTextYellow">Spam_vt</A>&#160;] (Room 6), [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156491" CLASS="coderTextYellow">chogyonim</A>&#160;] (Room 7), [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=129762" CLASS="coderTextRed">doeth</A>&#160;] (Room 8), and [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153733" CLASS="coderTextRed">dsp</A>&#160;] (Room 9) 
were perfect on all three problems.  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">qubits</A>&#160;] was able to code them the quickest, as his 1173.09 "Coding Phase" score will attest.  Coupled with his successful challenge, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">qubits</A>&#160;] led all coders with 1223.09 final points.  
</P>

<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">qubits</A>&#160;] victory in Room 3 was his third consecutive, tying him with 12 others for the sixth longest room win streak.  This current streak is the longest of his SRM career.  He previously had put together three two-win streaks from SRM 29-30, SRM 51-52, and SRM 54-55.
</P>

<P>
The win by [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] in Room 1 was his 36th Division I win and the fourth in six matches in 2002 
(<A HREF="/index?t=statistics&amp;c=srm_wins" CLASS="statText">View the list of Overall Wins</A>).  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>&#160;] completely dominated his room, as his nearest competitor 
was 787.76 points behind.
</P>

					</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
						</TR>				
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division II</TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
						</TR>						
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statTextBig">						
<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A>&#160;] 
earned his 11th overall room win, tying
 [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A>&#160;] and 
 [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141448" CLASS="coderTextYellow">claw</A>&#160;] for the most in 
Division II 
(<A HREF="/index?t=statistics&amp;c=srm_wins_div2" CLASS="statText">View the list of Division II wins</A>).  Those 11 wins tie 
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141448" CLASS="coderTextYellow">claw</A>&#160;] and [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A>&#160;] for 12th in overall
 wins (the combination of Division I and II wins).
</P>

<P>
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A>&#160;] won Room 11 by successfully coding the 250 and 500-point problems, 
and successfully challenging the 250-point submission of [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=261706" CLASS="coderTextGray">stillflame</A>&#160;].  He gained 93 
rating points, and now has a total of 1523, which makes him eligible for Division I matches.
</P>

<P>
In Room 31, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153650" CLASS="coderTextYellow">polgara</A>&#160;] 
won her room for the fourth consecutive time, tying her 
with [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156758" CLASS="coderTextGreen">Nok</A>&#160;] 
and [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158922" CLASS="coderTextYellow">Revoklaw</A>&#160;] 
for the most consecutive wins in Division II (<A HREF="/index?t=statistics&amp;c=consec_wins_div2" CLASS="statText">View the 
list of Division II Consecutive Wins</A>).  The consecutive win streak of 
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156758" CLASS="coderTextGreen">Nok</A>&#160;] lasted 
from SRM 41-44, while 
[&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150419" CLASS="coderTextYellow">RoaminUmp</A>&#160;] 
triumphed in his room from SRM 52-55.  
</P>

<P>
Coders who now have consecutive room win streaks of two due to their room wins in SRM
 59 include: [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159166" CLASS="coderTextBlue">redman</A>&#160;], 
 [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A>&#160;], 
 [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153183" CLASS="coderTextBlue">gmenhorn</A>&#160;], 
 [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159825" CLASS="coderTextGreen">redblue</A>&#160;], and 
 [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=104810" CLASS="coderTextYellow">marmaros</A>&#160;]. 
</P>

<P>
In Room 42, [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A>&#160;] won his debut match with 1066.67 final points after 
successfully coding all three problems, and successfully challenging the 500-point code 
of [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262579" CLASS="coderTextGray">codehappykid</A>&#160;].  He earned a 1910 debut rating which is the fifth 
highest debut ranking ever.   [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262265" CLASS="coderTextBlue">Lacker</A>&#160;],  [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152879" CLASS="coderTextGreen">D0Sboots</A>&#160;] 
and [&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260558" CLASS="coderTextGreen">axl</A>&#160;]
 also won their rooms in their debut (<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>).
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

