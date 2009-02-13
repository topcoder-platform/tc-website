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
This chart represents those members who won their room in their first Single Round Match (through January 15, 2002).
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
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=142797" CLASS="coderTextBlue">art2k</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">8</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.26.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">646.50</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1429</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150424" CLASS="coderTextRed">RachaelLCook</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.28.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1077.63</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1633</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=108899" CLASS="coderTextBlue">mpauker</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.28.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">808.02</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1519</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=106390" CLASS="coderTextYellow">jatt_sandhu</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">9</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">06.28.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">438.29</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1484</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150758" CLASS="coderTextYellow">Psion</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.02.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1386.74</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1882</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150783" CLASS="coderTextGreen">alegra</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.02.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">677.67</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1496</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150528" CLASS="coderTextGreen">drapp</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.05.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">498.59</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1348</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150781" CLASS="coderTextBlue">hosehead</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.05.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">730.88</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1578</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150940" CLASS="coderTextYellow">orb</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.10.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">618.15</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1502</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=109990" CLASS="coderTextBlue">guruthrill</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.10.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">522.64</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1414</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=136232" CLASS="coderTextBlue">micje</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">14</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.16.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">422.28</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1452</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151418" CLASS="coderTextYellow">ChaiBot</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.18.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">561.10</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1467</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=107798" CLASS="coderTextYellow">jay_peg</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">15</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.18.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">715.69</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1697</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=141312" CLASS="coderTextBlue">xylocore</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">17</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.26.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">694.09</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1707</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150565" CLASS="coderTextGreen">Durin</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">18</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.30.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">419.81</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1648</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150228" CLASS="coderTextGreen">Drgnlrds</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">18</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">07.30.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">337.99</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1554</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=113178" CLASS="coderTextYellow">po</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">19</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.01.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1214.40</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1774</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152437" CLASS="coderTextBlue">oneshinevn</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">20</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.07.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1713.30</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2100</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152486" CLASS="coderTextBlue">starkiller</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">21</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.09.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">331.19</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1501</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152340" CLASS="coderTextYellow">jshute</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">22</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1366.59</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1518</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152476" CLASS="coderTextYellow">kalmes</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">840.59</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1843</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152053" CLASS="coderTextYellow">fuego</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">401.35</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1502</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153078" CLASS="coderTextBlue">Davros</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">24</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.21.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">274.76</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1371</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153515" CLASS="coderTextGray">anon</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">953.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1615</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">427.70</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1423</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=152943" CLASS="coderTextYellow">wafflehead</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">08.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1256.44</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1778</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=151041" CLASS="coderTextYellow">andyb</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">28</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.04.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">965.78</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1711</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154131" CLASS="coderTextBlue">bfhc</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">28</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.04.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1142.97</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1831</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153692" CLASS="coderTextYellow">pjj</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">29</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.06.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1015.26</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1370</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154754" CLASS="coderTextYellow">kv</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">30</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">546.63</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1463</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=139137" CLASS="coderTextBlue">natus</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">369.97</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1488</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=153479" CLASS="coderTextYellow">petch</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">487.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1587</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155031" CLASS="coderTextBlue">e-Motion</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">346.39</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1481</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=154752" CLASS="coderTextRed">cathay</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">31</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">588.13</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1772</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextGreen">chi</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">32</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">347.86</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1602</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155761" CLASS="coderTextYellow">mp5f</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">32</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">09.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">676.58</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1878</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156216" CLASS="coderTextRed">daveagp</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">627.93</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1656</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156491" CLASS="coderTextYellow">chogyonim</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">489.03</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1515</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156454" CLASS="coderTextBlue">odilatinam</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">453.20</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1446</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156484" CLASS="coderTextYellow">nikolab</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">34</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.11.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">452.53</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1438</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156768" CLASS="coderTextYellow">Nok</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">35</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.17.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">615.83</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">-</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157638" CLASS="coderTextBlue">Porgery</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">39</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">445.55</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1660</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=150527" CLASS="coderTextBlue">Penwiper</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">39</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">10.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50.00</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1322</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=155869" CLASS="coderTextGreen">Kniht</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">280.22</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1507</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=157972" CLASS="coderTextYellow">obfuscator</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">40</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.07.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">547.28</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1705</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159152" CLASS="coderTextYellow">nonobaddog</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">259.32</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1586</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158922" CLASS="coderTextYellow">Revoklaw</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">477.49</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1725</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=158794" CLASS="coderTextGreen">chen79</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">43</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.14.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">348.10</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1652</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=156429" CLASS="coderTextBlue">Jedsmeny</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">44</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.20.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">433.85</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1487</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159594" CLASS="coderTextYellow">Koroibos</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">45</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.28.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">572.07</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1835</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159367" CLASS="coderTextGreen">jholman</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">46</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">11.29.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">395.86</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1346</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251042" CLASS="coderTextYellow">cakoose</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">47</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.04.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">587.16</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1579</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251074" CLASS="coderTextRed">bmerry</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">47</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.04.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">692.38</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1760</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251067" CLASS="coderTextBlue">jtcromwell</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">48</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.09.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">709.31</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1691</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=159543" CLASS="coderTextBlue">windcloud7</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">48</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.09.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">401.65</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1331</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251335" CLASS="coderTextYellow">Echo</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">570.61</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1803</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251322" CLASS="coderTextGreen">jjmoon</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">49</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.12.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">252.89</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1571</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251406" CLASS="coderTextBlue">pogsworth</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">50</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.13.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">162.38</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1369</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=252203" CLASS="coderTextYellow">cleverbb</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">52</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.19.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">289.56</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1465</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260185" CLASS="coderTextBlue">NeoTuri</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">401.37</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1533</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">424.98</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1557</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260102" CLASS="coderTextBlue">emf</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">398.34</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1522</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=128968" CLASS="coderTextYellow">asimma</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">53</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">12.27.01</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">422.46</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1551</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260147" CLASS="coderTextYellow">iviemarie</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">528.52</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1512</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=251545" CLASS="coderTextBlue">ABCDII</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">528.30</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1507</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260619" CLASS="coderTextGreen">vmpstr</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">54</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.03.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">242.16</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1216</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1558.04</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">2100</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260761" CLASS="coderTextBlue">toast</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">430.54</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1319</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=260984" CLASS="coderTextBlue">EnckePan</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">55</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.07.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">468.40</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1348</TD>		
	</TR>
 	<TR>
		<TD VALIGN="middle" HEIGHT="13">&#160;&#160;<A HREF="/index?t=statistics&amp;c=member_profile&amp;Coder_Id=261035" CLASS="coderTextBlue">Aeth</A></TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">56</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">01.09.02</TD>
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">221.40</TD>		
		<TD CLASS="statText" VALIGN="middle" ALIGN="center">1389</TD>		
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

