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
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
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
  <xsl:with-param name="title">&#160;Quick Stats</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<P CLASS="statTextBig">
This chart represents the longest consecutive room win streaks in Division II Single Round Matches (through January 16, 2002).  Note: * denotes that there wasn't a SRM 23.
</P>

    <!-- Stats Intro Begins -->
        <xsl:call-template name="stats_intro"/>
	<!-- Stats Intro Ends -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="5" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&#160;Consecutive Wins</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="18">&#160;</TD>	
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="25%">Handle</TD>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Consecutive Wins</TD>	
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">SRM Duration</TD>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Start/End Date</TD>			
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156768" CLASS="coderTextYellow">Nok</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">4</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41-44</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.08.01 - 11.20.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158922" CLASS="coderTextYellow">Revoklaw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">4</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">52-55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.19.01 - 01.07.02</TD>		
	</TR>    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150419" CLASS="coderTextYellow">RoaminUmp</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">14-16</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.16 - 07.24.01</TD>		
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150796" CLASS="coderTextBlue">paisa</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">28-30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.04 - 09.13.01</TD>		
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156592" CLASS="coderTextRed">benetin</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">35-37</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.17 - 10.23.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154375" CLASS="coderTextBlue">bbecker</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">35-37</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.17 - 10.23.01</TD>		
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153939" CLASS="coderTextYellow">eug</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41-43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.08 - 11.14.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155031" CLASS="coderTextBlue">e-Motion</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50-52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12 - 12.19.01</TD>		
	</TR>    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251247" CLASS="coderTextBlue">NickW</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">52-54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.19.01 - 01.03.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158837" CLASS="coderTextYellow">axch</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54-56</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03 - 01.09.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143330" CLASS="coderTextBlue">BitConductor</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54-56</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03 - 01.09.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158306" CLASS="coderTextYellow">SlayerK</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54-56</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03 - 01.09.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153650" CLASS="coderTextYellow">polgara</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">56-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.09 - 01.16.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133237" CLASS="coderTextGreen">lineOfCode</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3-4</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23 - 05.30.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3-4</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23 - 05.30.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">4-5</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.31 - 06.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=129196" CLASS="coderTextYellow">alexcchan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">5-6</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.13 - 06.18.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141448" CLASS="coderTextYellow">claw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">5-6</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.13 - 06.18.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=139080" CLASS="coderTextYellow">bbeck13</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6-7</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.18 - 06.24.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7-8</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.24 - 06.26.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7-8</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.24 - 06.26.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=128924" CLASS="coderTextYellow">thekcc</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7-8</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.24 - 06.26.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143330" CLASS="coderTextBlue">BitConductor</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12-13</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.10 - 07.12.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=129063" CLASS="coderTextBlue">mktong</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12-13</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.10 - 07.12.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15-16</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.18 - 07.24.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151418" CLASS="coderTextYellow">ChaiBot</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15-16</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.18 - 07.24.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150424" CLASS="coderTextRed">RachaelLCook</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">16-17</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.18 - 07.24.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=138663" CLASS="coderTextYellow">Sord</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">16-17</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.18 - 07.24.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=139080" CLASS="coderTextYellow">bbeck13</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20-21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07 - 08.09.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141448" CLASS="coderTextYellow">claw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20-21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07 - 08.09.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=119676" CLASS="coderTextYellow">Pops</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20-21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07 - 08.09.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150852" CLASS="coderTextYellow">sundberg</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20-21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07 - 08.09.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=106771" CLASS="coderTextBlue">eattrig</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">21-22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.09 - 08.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152155" CLASS="coderTextBlue">Quikeel</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22-24*</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.13 - 08.21.01</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150292" CLASS="coderTextYellow">fattom</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24-25</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21 - 08.23.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24-25</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21 - 08.23.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152499" CLASS="coderTextBlue">Tammuz</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">25-26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.23 - 08.27.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26-27</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27 - 08.29.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=113178" CLASS="coderTextYellow">po</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26-27</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27 - 08.29.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150257" CLASS="coderTextYellow">qiui</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">27-28</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.29 - 09.04.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153364" CLASS="coderTextYellow">astone</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">28-29</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.04 - 09.06.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152605" CLASS="coderTextYellow">georgepf</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">29-30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.06 - 09.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154754" CLASS="coderTextBlue">greyhound</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">30-31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.13 - 09.17.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154754" CLASS="coderTextYellow">kv</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">30-31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.13 - 09.17.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152342" CLASS="coderTextBlue">kyky</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">33-34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.01 - 10.11.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">33-34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.01 - 10.11.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=128924" CLASS="coderTextYellow">thekcc</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7-8</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.24 - 06.26.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=110013" CLASS="coderTextBlue">Soli</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34-35</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11 - 10.17.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155275" CLASS="coderTextRed">DjinnKahn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">35-36</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.17 - 10.19.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152920" CLASS="coderTextGray">PiGuy</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">37-38</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.23 - 10.24.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=119676" CLASS="coderTextYellow">Pops</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">39-40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.29 - 11.07.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156491" CLASS="coderTextYellow">chogyonim</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40-41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07 - 11.08.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=113491" CLASS="coderTextBlue">hilgart</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40-41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07 - 11.08.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157814" CLASS="coderTextYellow">sethamin</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40-41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07 - 11.08.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150498" CLASS="coderTextYellow">ThinMan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40-41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07 - 11.08.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40-41</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07 - 11.08.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111302" CLASS="coderTextYellow">dminn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41-42</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.08 - 11.12.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154364" CLASS="coderTextYellow">schrockn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41-42</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.08 - 11.12.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41-42</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.08 - 11.12.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152614" CLASS="coderTextYellow">stkaway</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">41-42</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.08 - 11.12.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156484" CLASS="coderTextYellow">nikolab</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">42-43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.12 - 11.14.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155793" CLASS="coderTextYellow">Quest171</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">42-43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.12 - 11.14.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">42-43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.12 - 11.14.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156888" CLASS="coderTextBlue">bob</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43-44</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14 - 11.20.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158201" CLASS="coderTextBlue">mecraw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43-44</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14 - 11.20.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=109527" CLASS="coderTextBlue">patsup</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43-44</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14 - 11.20.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151524" CLASS="coderTextBlue">cmpterman2</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">44-45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.20 - 11.28.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=147031" CLASS="coderTextBlue">gaav</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">44-45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.20 - 11.28.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154579" CLASS="coderTextYellow">Altrag</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45-46</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.28 - 11.29.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151360" CLASS="coderTextYellow">buddh4sack</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45-46</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.28 - 11.29.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141187" CLASS="coderTextBlue">gsh</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45-46</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.28 - 11.29.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143456" CLASS="coderTextBlue">khaladan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45-46</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.28 - 11.29.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157638" CLASS="coderTextBlue">Porgery</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">46-47</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.29 - 12.04.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158819" CLASS="coderTextGreen">tdavis34</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">46-47</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.29 - 12.04.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158333" CLASS="coderTextYellow">dvickrey</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">47-48</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.04 - 12.09.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153724" CLASS="coderTextBlue">Vaduz</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">47-48</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.04 - 12.09.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156445" CLASS="coderTextYellow">eventually</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">48-49</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.09 - 12.12.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159543" CLASS="coderTextBlue">windcloud7</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">48-49</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.09 - 12.12.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158423" CLASS="coderTextBlue">callajd</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49-50</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12 - 12.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158258" CLASS="coderTextYellow">jerm</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49-50</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12 - 12.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150336" CLASS="coderTextBlue">trieuvan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49-50</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12 - 12.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157974" CLASS="coderTextRed">bigg_nate</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50-51</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.13 - 12.17.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154619" CLASS="coderTextGreen">cothevacothe</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50-51</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.13 - 12.17.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158149" CLASS="coderTextBlue">adrian</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51-52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.17 - 12.19.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158095" CLASS="coderTextBlue">ajm</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51-52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.17 - 12.19.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159544" CLASS="coderTextYellow">dgoodman</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51-52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.17 - 12.19.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=104810" CLASS="coderTextYellow">marmaros</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">51-52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.17 - 12.19.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156485" CLASS="coderTextBlue">Smiley=)</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">52-53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.19 - 12.27.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158259" CLASS="coderTextYellow">flyland</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53-54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01 - 01.03.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153140" CLASS="coderTextBlue">harv</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53-54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01 - 01.03.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54-55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03 - 01.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159618" CLASS="coderTextGreen">George_Smiley</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54-55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03 - 01.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157638" CLASS="coderTextBlue">Porgery</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54-55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03 - 01.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158601" CLASS="coderTextBlue">rodent_xu</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54-55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03 - 01.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=252203" CLASS="coderTextYellow">cleverbb</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55-56</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07 - 01.09.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251457" CLASS="coderTextYellow">etolson</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55-56</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07 - 01.09.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=142986" CLASS="coderTextGreen">dcros</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">56-57</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.09 - 01.15.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158258" CLASS="coderTextYellow">jerm</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">56-57</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.09 - 01.15.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260590" CLASS="coderTextBlue">kaos0xff</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">56-57</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.09 - 01.15.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156990" CLASS="coderTextYellow">lanenal</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">56-57</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.09 - 01.15.02</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251068" CLASS="coderTextBlue">benny</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15 - 01.16.02</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151360" CLASS="coderTextYellow">buddh4sack</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15 - 01.16.02</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159544" CLASS="coderTextYellow">dgoodman</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15 - 01.16.02</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159605" CLASS="coderTextYellow">donghui</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15 - 01.16.02</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260984" CLASS="coderTextBlue">EnckePan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15 - 01.16.02</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=109527" CLASS="coderTextBlue">patsup</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15 - 01.16.02</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=132948" CLASS="coderTextBlue">sdyoung</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15 - 01.16.02</TD>		
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=107835" CLASS="coderTextYellow">sjelkjd</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57-58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15 - 01.16.02</TD>		
	</TR>
 <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"/></TD>
    </TR>    
</TABLE>  
		</TD>
		<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left_blue_home.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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

