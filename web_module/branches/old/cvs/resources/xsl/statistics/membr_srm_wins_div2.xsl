<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
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
		<TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<SPAN CLASS="header">Statistics</SPAN><BR/>
<SPAN CLASS="bodySubhead">[ <font color="#333333">All-Time Wins</font> ] </SPAN>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>
		<TD VALIGN="top" WIDTH="75" ALIGN="left" BGCOLOR="#CCCCCC"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
		<TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>&#160;&#160;&#160;&#160;&#160;</TD>
		<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10" ALIGN="right" HEIGHT="13"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<P CLASS="statTextBig">
This chart ranks the Top-25 in Room Wins while competing in Division II (through January 16, 2002).
</P>
<P CLASS="statTextBig">
See All-Time Wins for <A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statTextBig">Division I</A>
</P>
    <!-- Stats Intro Begins -->
        <xsl:call-template name="stats_intro"/>
	<!-- Stats Intro Ends -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="3" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&#160;All-Time Wins - Division II</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="18">&#160;</TD>	
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="50%">Handle</TD>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="50%">Wins</TD>	
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11</TD>
	</TR>    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141448" CLASS="coderTextYellow">claw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141187" CLASS="coderTextBlue">gsh</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
	</TR>    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=109527" CLASS="coderTextBlue">patsup</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143845" CLASS="coderTextYellow">skazzytl</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152614" CLASS="coderTextYellow">stkaway</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
	</TR>    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=139080" CLASS="coderTextYellow">bbeck13</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
	</TR>    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=113491" CLASS="coderTextBlue">hilgart</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
	</TR>    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=119676" CLASS="coderTextYellow">Pops</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
	</TR>    
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T10.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=142986" CLASS="coderTextGreen">dcros</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">8</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T10.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154074" CLASS="coderTextBlue">dimer0</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">8</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156640" CLASS="coderTextBlue">Arremoon</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=143330" CLASS="coderTextBlue">BitConductor</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151360" CLASS="coderTextYellow">buddh4sack</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155031" CLASS="coderTextBlue">e-Motion</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153939" CLASS="coderTextYellow">eug</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
  <TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=113176" CLASS="coderTextGreen">Holgrave</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=138158" CLASS="coderTextBlue">leelin</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=126379" CLASS="coderTextBlue">magicfat</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=104810" CLASS="coderTextYellow">marmaros</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=129063" CLASS="coderTextBlue">mktong</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156768" CLASS="coderTextYellow">Nok</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">7</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151418" CLASS="coderTextYellow">ChaiBot</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156017" CLASS="coderTextBlue">czth</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153140" CLASS="coderTextBlue">harv</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151059" CLASS="coderTextBlue">jthomas</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152342" CLASS="coderTextBlue">kyky</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156603" CLASS="coderTextYellow">LinkII</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111435" CLASS="coderTextBlue">overflow</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150796" CLASS="coderTextBlue">paisa</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157638" CLASS="coderTextBlue">Porgery</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158922" CLASS="coderTextYellow">Revoklaw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=110013" CLASS="coderTextBlue">Soli</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
 	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=124856" CLASS="coderTextBlue">wyzmo</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
	</TR>
  <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"/></TD>
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

