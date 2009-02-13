<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../foot.xsl"/>  
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
		<TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<SPAN CLASS="header">Statistics</SPAN><BR/>
<SPAN CLASS="bodySubhead">[ <font color="#333333">Last Match Results</font> ] </SPAN>
<BR/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif">
	<TR>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right" HEIGHT="13"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="75" ALIGN="left"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
		<TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>&#160;&#160;&#160;&#160;&#160;DECEMBER 5, 2001</TD>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10" ALIGN="right" HEIGHT="13"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
			<TABLE BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" BORDER="0" CELLSPACING="0" CELLPADDING="2" WIDTH="100%">
				<TR>
					<TD CLASS="statText"><BR/>More statistics are available to registered members. <a href="/registration/index.shtml" CLASS="statText">Click here if you have not yet registered &gt;&gt;</a></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="12" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
			</TABLE>
			<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
				<TR>
					<TD COLSPAN="2" CLASS="statText">[ <SPAN CLASS="coderTexTRed">2500+</SPAN> | 
					<SPAN CLASS="coderTextYellow">2499 - 2000</SPAN> | 
					<SPAN CLASS="coderTextBlue">1999 - 1500</SPAN> | 
					<SPAN CLASS="coderTextGreen">1499 - 1000</SPAN> | 
					<SPAN CLASS="coderTextGray">0999 - 0000</SPAN> ]
					</TD>
				</TR>
				<TR>
					<TD COLSPAN="2"><IMG HEIGHT="8" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
			</TABLE>

			<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="100%">
				<TR>
					<TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="19" CLASS="statTextBig" HEIGHT="18">Statistics for Single Round Match 53 &gt; Round 1 [Sorted by Room / Final Points]</TD>
				</TR>				
				<TR>
					<TD COLSPAN="19"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif">
					<TD WIDTH="32" BACKGROUND="/i/steel_blue_bg.gif"><IMG HEIGHT="1" WIDTH="32" SRC="/i/clear.gif"/></TD>
					<TD WIDTH="14%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Coder<BR/>Handle</TD>
					<TD WIDTH="10" BACKGROUND="/i/steel_blue_bg.gif"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" WIDTH="11%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Coding<BR/>Phase</TD>
					<TD ALIGN="right" WIDTH="10" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/><BR/>+</TD>
					<TD ALIGN="right" WIDTH="14%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Challenge<BR/>Phase</TD>
					<TD ALIGN="right" WIDTH="10" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/><BR/>+</TD>
					<TD ALIGN="right" WIDTH="11%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Testing<BR/>Phase</TD>
					<TD ALIGN="right" WIDTH="10" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/><BR/>=</TD>
					<TD ALIGN="right" WIDTH="11%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Final<BR/>Points</TD>
					<TD WIDTH="14" BACKGROUND="/i/steel_blue_bg.gif"><IMG HEIGHT="1" WIDTH="14" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" WIDTH="5%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Adv.</TD>
					<TD WIDTH="8" BACKGROUND="/i/steel_blue_bg.gif"><IMG HEIGHT="1" WIDTH="8" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" WIDTH="10%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Old<BR/>Rating</TD>
					<TD ALIGN="right" WIDTH="10" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/><BR/>+</TD>
					<TD ALIGN="right" WIDTH="12%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">Rating<BR/>&#160;Change</TD>
					<TD ALIGN="right" WIDTH="10" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/><BR/>=</TD>
					<TD ALIGN="right" WIDTH="12%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText">New<BR/>&#160;Rating</TD>
					<TD WIDTH="12" BACKGROUND="/i/steel_blue_bg.gif"><IMG HEIGHT="1" WIDTH="12" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" COLSPAN="19" WIDTH="1"><IMG HEIGHT="5" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="19" CLASS="statText" HEIGHT="13">&#160;<b>Room 1</b></TD>
				</TR>
				<TR>
					<TD COLSPAN="19"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTRed">NDBronson</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTBlue">bigg_nate</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTBlue">paisa</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTYellow">kyotov</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTYellow">kyotov</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTYellow">Garzahd</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTBlue">overflow</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTBlue">thekcc</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				
				<TR>
					<TD BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="19" CLASS="statText" HEIGHT="13">&#160;<b>Room 2</b></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTRed">NDBronson</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTBlue">bigg_nate</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTBlue">paisa</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTYellow">kyotov</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTYellow">kyotov</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTYellow">Garzahd</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTBlue">overflow</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>				
				<TR>
					<TD><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD><TD align="left" CLASS="coderTexTBlue">thekcc</TD>
					<TD CLASS="statText"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">0.00</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">1302.61</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD align="middle" CLASS="statText">No</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2986</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
					<TD ALIGN="right" CLASS="statText">2988</TD>
					<TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="19" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
				</TR>																
			</TABLE> 
		</TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" WIDTH="60%" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="60%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/clear.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="60%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
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

