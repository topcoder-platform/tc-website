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
<xsl:choose>
<xsl:when test="/TC/LoggedIn='true'">
<P CLASS="statText">
This chart represents the Top-25 highest point totals earned in a Division II Single Round Match (through March 11, 2002).
</P>
<P CLASS="statText">
See Highest Totals for <A HREF="/index?t=statistics&amp;c=high_total_div1" CLASS="statTextBig">Division I</A>
</P>
</xsl:when>
<xsl:otherwise>
<P CLASS="statText">
This chart represents the Top-10 highest point totals earned in a Division II Single Round Match (through March 11, 2002).
</P>
<P CLASS="statText">
See Highest Totals for <A HREF="/index?t=statistics&amp;c=high_total_div1" CLASS="statTextBig">Division I</A>
</P>
</xsl:otherwise>
</xsl:choose>

    <!-- Stats Intro Begins -->
        <xsl:call-template name="stats_intro"/>
	<!-- Stats Intro Ends -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="5" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&#160;Highest Totals - Division II</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>	
	<TR>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="18">&#160;</TD>	
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="25%">Handle</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Points</TD>	
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">SRM</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Date</TD>			
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>
<xsl:choose>
<xsl:when test="/TC/LoggedIn='true'">
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1898.64</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">2.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260619" CLASS="coderTextBlue">vmpstr</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1720.23</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152437" CLASS="coderTextBlue">oneshinevn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1713.30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">4.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1672.80</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">5.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155869" CLASS="coderTextBlue">Kniht</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1663.14</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">6.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151418" CLASS="coderTextYellow">ChaiBot</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1627.79</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextBlue">EtherMage</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1621.15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">8.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1616.76</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">9.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=263379" CLASS="coderTextBlue">pochmann</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1614.45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">10.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=266162" CLASS="coderTextBlue">rashok</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1611.54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>	    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">11.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156896" CLASS="coderTextGreen">iamyou</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1606.35</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">12.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=264085" CLASS="coderTextGreen">mozhiyan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1600.04</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">13.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141187" CLASS="coderTextBlue">gsh</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1598.36</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">14.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260987" CLASS="coderTextBlue">skyice</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1590.43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>	
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">15.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269058" CLASS="coderTextYellow">jasonw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1583.78</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">16.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">DjinnKahn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1583.45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">36</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.19.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">17.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267834" CLASS="coderTextBlue">halflife</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1580.18</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>	
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">18.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=268212" CLASS="coderTextYellow">dukeola</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1572.81</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">19.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266082" CLASS="coderTextBlue">tyf</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1566.12</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>		    
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">20.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155737" CLASS="coderTextGreen">forgothowtocode</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1565.85</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">21.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133860" CLASS="coderTextBlue">Serpent</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1564.37</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">29</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.06.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">22.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268008" CLASS="coderTextYellow">Moloch</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1559.03</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">23.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1558.04</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">24.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158823" CLASS="coderTextGreen">Banzif_VT</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1553.00</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">25.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262038" CLASS="coderTextBlue">Boing</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1542.35</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
</xsl:when>
<xsl:otherwise>		
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">1.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1898.64</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">2.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260619" CLASS="coderTextBlue">vmpstr</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1720.23</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">3.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152437" CLASS="coderTextBlue">oneshinevn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1713.30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">4.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1672.80</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">5.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155869" CLASS="coderTextBlue">Kniht</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1663.14</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">6.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151418" CLASS="coderTextYellow">ChaiBot</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1627.79</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.13.01</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">7.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextBlue">EtherMage</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1621.15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">8.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1616.76</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">9.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=263379" CLASS="coderTextBlue">pochmann</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1614.45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>		
	</TR>
	<TR>
		<TD CLASS="smallFoot" ALIGN="right" HEIGHT="13">10.&#160;</TD>
		<TD VALIGN="middle"><A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=266162" CLASS="coderTextBlue">rashok</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1611.54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>		
	</TR>
</xsl:otherwise>
</xsl:choose>	
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

