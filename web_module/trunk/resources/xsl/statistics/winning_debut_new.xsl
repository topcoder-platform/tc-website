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
		<TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<SPAN CLASS="header">Statistics</SPAN><BR/>
<SPAN CLASS="bodySubhead">[ <font color="#333333">Winning Debuts</font> ] </SPAN>

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
This chart represents those members who won their room in their first Single Round Match (through January 9, 2002).
</P>
    <!-- Stats Intro Begins -->
        <xsl:call-template name="stats_intro"/>
	<!-- Stats Intro Ends -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="5" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&#160;Winning Debuts</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="statText" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="20%" HEIGHT="18">Handle</TD>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="10%">SRM</TD>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Date</TD>
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Point Total</TD>		
		<TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%" HEIGHT="18">Rating</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>	
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=128962" CLASS="coderTextGreen">DmitriBrown</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.08.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1502.22</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1671</TD>		
	</TR>
	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.08.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">902.44</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1383</TD>		
	</TR>	
	<TR>	
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.15.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1376.77</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1860</TD>		
	</TR>
	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133846" CLASS="coderTextYellow">stanf</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.15.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1351.05</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1787</TD>		
	</TR>	
	<TR>	
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=104693" CLASS="coderTextYellow">splag</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1393.11</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1658</TD>		
	</TR>
	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=135178" CLASS="coderTextYellow">Firewind</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1222.66</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1540</TD>		
	</TR>	
	<TR>	
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133344" CLASS="coderTextYellow">JonathanAldrich</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1151.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1500</TD>		
	</TR>
	<TR>	
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133860" CLASS="coderTextBlue">Serpent</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">4</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.31.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1023.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1588</TD>		
	</TR>
	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141448" CLASS="coderTextYellow">claw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">5</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">325.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1501</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=147102" CLASS="coderTextRed">pl31415</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.18.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">908.05</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1939</TD>		
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

