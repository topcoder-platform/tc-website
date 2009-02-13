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
  <xsl:with-param name="title">&#160;Quick Stats</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P CLASS="statText">
Top-25 Overall (Through March 11, 2002)
</P>
<P CLASS="statText">
This chart represents the members who have made the most impressive debuts in a Single Round Match.
</P>
    <!-- Stats Intro Begins -->
        <xsl:call-template name="stats_intro"/>
	<!-- Stats Intro Ends -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="5" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&#160;Impressive Rating Point Debuts</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="18">&#160;</TD>	
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="25%">Handle</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Rating Points</TD>	
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">SRM</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Date</TD>			
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152437" CLASS="coderTextBlue">oneshinevn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2100</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07.01</TD>		
	</TR>
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">T1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2100</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112630" CLASS="coderTextYellow">Aleksey</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2000</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2001 CC Round 1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">04.07.01</TD>		
	</TR>    
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">4.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=147102" CLASS="coderTextRed">pl31415</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1939</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.18.01</TD>		
	</TR>
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">5.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1910</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">59</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.23.02</TD>		
	</TR>
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">6.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1908</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>	
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150758" CLASS="coderTextYellow">Psion</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1882</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.02.01</TD>		
	</TR>     
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">8.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155761" CLASS="coderTextYellow">mp5f</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1878</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">32</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.29.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">9.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=109933" CLASS="coderTextYellow">falcon</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1875</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2001 CC Round 1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">04.07.01</TD>		
	</TR>    
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">10.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1860</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.15.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">11.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152476" CLASS="coderTextYellow">kalmes</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1843</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21.01</TD>		
	</TR>    
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159594" CLASS="coderTextYellow">Koroibos</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1835</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.28.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">13.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154131" CLASS="coderTextBlue">bfhc</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1831</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">28</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.04.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264682" CLASS="coderTextYellow">nave</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1829</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">63</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.04.02</TD>		
	</TR>	    
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">15.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=110013" CLASS="coderTextBlue">Soli</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1811</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2001 CC Round 1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">04.07.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">16.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251335" CLASS="coderTextYellow">Echo</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1803</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12.01</TD>		
	</TR>     
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">17.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133846" CLASS="coderTextYellow">stanf</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1787</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.15.01</TD>		
	</TR>
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">18.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1783</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>		
	</TR>	
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">19.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152943" CLASS="coderTextYellow">wafflehead</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1778</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27.01</TD>		
	</TR>    
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">20.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=113178" CLASS="coderTextYellow">po</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1774</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">19</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.01.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">21.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154752" CLASS="coderTextRed">cathay</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1772</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>		
	</TR>   
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">22.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265736" CLASS="coderTextYellow">Ken Alverson</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1767</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">65</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.12.02</TD>		
	</TR>
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111359" CLASS="coderTextYellow">Spam_vt</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1765</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2001 CC Round 1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">04.07.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">24.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251074" CLASS="coderTextRed">bmerry</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1760</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">47</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.04.01</TD>		
	</TR>    
	<TR>	
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">25.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262048" CLASS="coderTextYellow">edreisbach</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1752</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.16.02</TD>		
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

