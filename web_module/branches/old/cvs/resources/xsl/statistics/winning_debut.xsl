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
This chart represents those members who won their room in their first Single Round Match (through March 11, 2002).
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
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="20%" HEIGHT="18">&#160;Handle</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="10%">SRM</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Date</TD>
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%">Point Total</TD>		
		<TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%" HEIGHT="18">Rating</TD>		
	</TR>
	<TR>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>		
	</TR>
<xsl:choose>
<xsl:when test="/TC/LoggedIn='true'">
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=128962" CLASS="coderTextGreen">DmitriBrown</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.08.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1502.22</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1671</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.08.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">902.44</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1383</TD>		
	</TR>	
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.15.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1376.77</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1860</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133846" CLASS="coderTextYellow">stanf</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.15.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1351.05</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1787</TD>		
	</TR>	
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=104693" CLASS="coderTextGreen">splag</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1393.11</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1658</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=135178" CLASS="coderTextYellow">Firewind</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1222.66</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1540</TD>		
	</TR>	
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133344" CLASS="coderTextYellow">JonathanAldrich</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1151.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1500</TD>		
	</TR>
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133860" CLASS="coderTextBlue">Serpent</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">4</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.31.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1023.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1588</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141448" CLASS="coderTextYellow">claw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">5</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">325.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1501</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=147102" CLASS="coderTextRed">pl31415</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.18.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">908.05</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1939</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=142797" CLASS="coderTextBlue">art2k</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">8</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.26.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">646.50</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1429</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150424" CLASS="coderTextRed">RachaelLCook</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.28.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1077.63</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1633</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=108899" CLASS="coderTextBlue">mpauker</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.28.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">808.02</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1519</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=106390" CLASS="coderTextYellow">jatt_sandhu</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.28.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">438.29</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1484</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150758" CLASS="coderTextYellow">Psion</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.02.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1386.74</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1882</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150783" CLASS="coderTextGreen">alegra</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.02.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">677.67</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1496</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150528" CLASS="coderTextGreen">drapp</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.05.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">498.59</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1348</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150781" CLASS="coderTextBlue">hosehead</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.05.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">730.88</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1578</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150940" CLASS="coderTextYellow">orb</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.10.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">618.15</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1502</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=109990" CLASS="coderTextBlue">guruthrill</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.10.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">522.64</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1414</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=136232" CLASS="coderTextBlue">micje</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">14</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.16.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">422.28</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1452</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151418" CLASS="coderTextYellow">ChaiBot</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.18.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">561.10</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1467</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=107798" CLASS="coderTextBlue">jay_peg</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.18.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">715.69</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1697</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141312" CLASS="coderTextBlue">xylocore</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">17</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.26.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">694.09</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1707</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150565" CLASS="coderTextGreen">Durin</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">18</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.30.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">419.81</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1648</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150228" CLASS="coderTextGreen">Drgnlrds</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">18</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.30.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">337.99</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1554</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=113178" CLASS="coderTextYellow">po</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">19</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.01.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1214.40</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1774</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152437" CLASS="coderTextBlue">oneshinevn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1713.30</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2100</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152486" CLASS="coderTextBlue">starkiller</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.09.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">331.19</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1501</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152340" CLASS="coderTextYellow">jshute</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1366.59</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1518</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152476" CLASS="coderTextYellow">kalmes</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">840.59</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1843</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152053" CLASS="coderTextYellow">fuego</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">401.35</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1502</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153078" CLASS="coderTextBlue">Davros</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">274.76</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1371</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153515" CLASS="coderTextGray">anon</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">953.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1615</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">427.70</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1423</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152943" CLASS="coderTextYellow">wafflehead</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1256.44</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1778</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151041" CLASS="coderTextYellow">andyb</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">28</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.04.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">965.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1711</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154131" CLASS="coderTextBlue">bfhc</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">28</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.04.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1142.97</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1831</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153692" CLASS="coderTextYellow">pjj</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">29</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.06.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1015.26</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1370</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154754" CLASS="coderTextYellow">kv</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">546.63</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1463</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=139137" CLASS="coderTextBlue">natus</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">369.97</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1488</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">487.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1587</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155031" CLASS="coderTextBlue">e-Motion</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">346.39</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1481</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154752" CLASS="coderTextRed">cathay</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">588.13</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1772</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">32</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">347.86</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1602</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155761" CLASS="coderTextYellow">mp5f</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">32</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">676.58</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1878</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156216" CLASS="coderTextRed">daveagp</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">627.93</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1656</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156491" CLASS="coderTextYellow">chogyonim</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">489.03</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1515</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156454" CLASS="coderTextBlue">odilatinam</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">453.20</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1446</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156484" CLASS="coderTextYellow">nikolab</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">452.53</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1438</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156768" CLASS="coderTextYellow">Nok</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">35</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">615.83</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">-</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157638" CLASS="coderTextYellow">Porgery</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">39</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">445.55</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1660</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150527" CLASS="coderTextBlue">Penwiper</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">39</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1322</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155869" CLASS="coderTextBlue">Kniht</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">280.22</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1507</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157972" CLASS="coderTextYellow">obfuscator</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">547.28</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1705</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159152" CLASS="coderTextYellow">nonobaddog</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">259.32</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1586</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158922" CLASS="coderTextYellow">Revoklaw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">477.49</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1725</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158794" CLASS="coderTextGreen">chen79</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">348.10</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1652</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156429" CLASS="coderTextBlue">Jedsmeny</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">44</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.20.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">433.85</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1487</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159594" CLASS="coderTextYellow">Koroibos</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.28.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">572.07</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1835</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159367" CLASS="coderTextGreen">jholman</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">46</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">395.86</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1346</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251042" CLASS="coderTextYellow">cakoose</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">47</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.04.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">587.16</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1579</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251074" CLASS="coderTextRed">bmerry</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">47</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.04.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">692.38</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1760</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251067" CLASS="coderTextGreen">jtcromwell</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">48</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.09.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">709.31</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1691</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159543" CLASS="coderTextBlue">windcloud7</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">48</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.09.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">401.65</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1331</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251335" CLASS="coderTextYellow">Echo</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">570.61</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1803</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251322" CLASS="coderTextGreen">jjmoon</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">252.89</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1571</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251406" CLASS="coderTextBlue">pogsworth</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">162.38</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1369</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=252203" CLASS="coderTextYellow">cleverbb</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.19.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">289.56</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1465</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260185" CLASS="coderTextBlue">NeoTuri</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">401.37</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1533</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">424.98</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1557</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260102" CLASS="coderTextBlue">emf</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">398.34</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1522</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=128968" CLASS="coderTextYellow">asimma</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">422.46</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1551</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260147" CLASS="coderTextYellow">iviemarie</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">528.52</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1512</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251545" CLASS="coderTextBlue">ABCDII</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">528.30</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1507</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260619" CLASS="coderTextBlue">vmpstr</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">242.16</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1216</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1558.04</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2100</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260761" CLASS="coderTextBlue">toast</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">430.54</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1319</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260984" CLASS="coderTextGray">EnckePan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">468.40</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1348</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=261035" CLASS="coderTextBlue">Aeth</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">56</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.09.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">221.40</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1389</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260936" CLASS="coderTextGray">Chaos_Man</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">142.69</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1212</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=261567" CLASS="coderTextBlue">gilbert</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">214.82</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1406</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=261744" CLASS="coderTextBlue">sundae</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">57</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.15.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">217.14</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1422</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262048" CLASS="coderTextYellow">edreisbach</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">58</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.16.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1033.19</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1752</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260558" CLASS="coderTextGreen">axl</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">59</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.23.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">457.18</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1526</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152879" CLASS="coderTextGreen">D0SBoots</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">59</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.23.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">354.77</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1430</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262265" CLASS="coderTextBlue">Lacker</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">59</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.23.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">664.45</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1708</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260800" CLASS="coderTextYellow">mitkid</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">59</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.23.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1066.67</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1910</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=262709" CLASS="coderTextGray">delman16</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">60</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.26.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">437.42</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1249</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=263580" CLASS="coderTextYellow">enderx</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">61</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.30.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">439.09</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1636</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157016" CLASS="coderTextBlue">richter</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">61</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.30.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">433.91</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1623</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264175" CLASS="coderTextBlue">piZZa</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">62</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.31.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">348.34</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1322</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264079" CLASS="coderTextBlue">unformed</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">62</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.31.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">477.90</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1416</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264869" CLASS="coderTextYellow">ante</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">63</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.04.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">243.46</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1374</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264862" CLASS="coderTextBlue">nave</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">63</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.04.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">603.08</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1829</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265453" CLASS="coderTextYellow">gutenphrack</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">64</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.06.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">411.24</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1575</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265031" CLASS="coderTextYellow">Gyrefalcon</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">64</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.06.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">412.37</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1585</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265531" CLASS="coderTextYellow">langer</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">64</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.06.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">307.12</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1520</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251109" CLASS="coderTextYellow">valeria</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">64</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.06.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">345.99</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1528</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265736" CLASS="coderTextYellow">Ken Alverson</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">65</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.12.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">377.91</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1767</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265800" CLASS="coderTextGreen">kolc</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">65</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.12.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">265.13</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1613</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265522" CLASS="coderTextBlue">veredox</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">65</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.12.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">230.29</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1506</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=264158" CLASS="coderTextBlue">palenica</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">66</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.13.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">236.39</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1422</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=265045" CLASS="coderTextBlue">vladim</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">66</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.13.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">275.24</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1484</TD>		
	</TR>
   	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=267248" CLASS="coderTextBlue">Baldrick</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1311.99</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1436</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=267685" CLASS="coderTextGreen">bengle</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">486.37</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1040</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=268212" CLASS="coderTextYellow">dukeola</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1572.81</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1696</TD>		
	</TR>	
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=267834" CLASS="coderTextBlue">halflife</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1099.53</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1335</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=261499" CLASS="coderTextBlue">krave</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1222.60</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1374</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=267925" CLASS="coderTextBlue">skavoovie</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">918.45</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1250</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=266803" CLASS="coderTextBlue">WCVampire</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1023.74</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1293</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=267844" CLASS="coderTextBlue">wyv</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">67</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.20.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">903.77</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1246</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1616.76</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1783</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268898" CLASS="coderTextYellow">chrislipa</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2091.89</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1930</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268851" CLASS="coderTextYellow">gladius</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1512.21</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1639</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269058" CLASS="coderTextYellow">jasonw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1583.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1749</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268008" CLASS="coderTextYellow">Moloch</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1559.03</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1701</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268533" CLASS="coderTextGreen">nasmanke</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">364.85</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1149</TD>		
	</TR>	
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267831" CLASS="coderTextBlue">nrogers</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1027.33</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1383</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269088" CLASS="coderTextYellow">pan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1440.07</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1616</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155794" CLASS="coderTextYellow">unclejimbo</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">68</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.27.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1248.83</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1505</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266571" CLASS="coderTextYellow">jburnim</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">69</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.28.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1112.03</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1537</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266690" CLASS="coderTextYellow">Jlyer</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">69</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.28.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1072.76</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1503</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268662" CLASS="coderTextYellow">nano</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">69</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.28.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1182.64</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1643</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269539" CLASS="coderTextBlue">tperry</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">69</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">02.28.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">942.41</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1399</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159165" CLASS="coderTextBlue">frobenius</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1144.49</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1315</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270398" CLASS="coderTextBlue">Gator637</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1112.33</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1296</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268537" CLASS="coderTextBlue">Gold Rider</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1126.82</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1309</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1672.80</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1908</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269788" CLASS="coderTextBlue">Maris</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1253.17</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1385</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267482" CLASS="coderTextGreen">mercury</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">750.19</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1197</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269515" CLASS="coderTextBlue">valeriy</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">70</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1402.38</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1476</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=261672" CLASS="coderTextBlue">alamothe</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.11.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">602.36</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1385</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270750" CLASS="coderTextGreen">bouteille</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.11.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">395.11</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1178</TD>		
	</TR>	
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270605" CLASS="coderTextBlue">Cobalt</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.11.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">635.98</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1399</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=271250" CLASS="coderTextBlue">dingroach</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.11.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">771.97</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1471</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270887" CLASS="coderTextYellow">eduar09</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.11.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1061.54</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1579</TD>		
	</TR>		
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270257" CLASS="coderTextBlue">laughing_guitar</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.11.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">769.96</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1466</TD>		
	</TR>	
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=271159" CLASS="coderTextBlue">Shiro</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.11.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">528.35</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1262</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270060" CLASS="coderTextYellow">WMSplat</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">71</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">03.11.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1115.09</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1693</TD>		
	</TR>																																								
</xsl:when>
<xsl:otherwise>		
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=128962" CLASS="coderTextGreen">DmitriBrown</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.08.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1502.22</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1671</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=112902" CLASS="coderTextYellow">Logan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.08.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">902.44</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1383</TD>		
	</TR>	
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=111057" CLASS="coderTextBlue">bm999</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.15.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1376.77</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1860</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133846" CLASS="coderTextYellow">stanf</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.15.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1351.05</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1787</TD>		
	</TR>	
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=104693" CLASS="coderTextGreen">splag</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1393.11</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1658</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=135178" CLASS="coderTextYellow">Firewind</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1222.66</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1540</TD>		
	</TR>	
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133344" CLASS="coderTextYellow">JonathanAldrich</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">3</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.23.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1151.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1500</TD>		
	</TR>
	<TR>	
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=133860" CLASS="coderTextBlue">Serpent</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">4</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.31.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1023.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1588</TD>		
	</TR>
	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141448" CLASS="coderTextYellow">claw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">5</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">05.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">325.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1501</TD>		
	</TR>
 	<TR>
		<TD CLASS="statText" VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=147102" CLASS="coderTextRed">pl31415</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">6</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.18.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">908.05</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1939</TD>		
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

