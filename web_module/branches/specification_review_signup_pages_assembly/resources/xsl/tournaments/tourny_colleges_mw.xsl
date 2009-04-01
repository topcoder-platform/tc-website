<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="180" VALIGN="top">
              <!-- Left Column Include Begins -->  
              <!-- Global Seconday Nav Begins -->  
              <xsl:call-template name="global_left"/>
              <!-- Global Seconday Nav Ends -->      
              <!-- Left Column Include Ends -->          
            </TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">tournaments_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->				
        <xsl:call-template name="tournament_links"/>
	<!-- Coder of the Week Pulldown Ends -->
					<!--<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" WIDTH="100%" ALIGN="center">
						<TR><TD WIDTH="100%" ALIGN="center" HEIGHT="90" VALIGN="top"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" BORDER="0"/></TD></TR>-->
					</TABLE>
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="0" BACKGROUND="/i/steel_blue_bg.gif" ALIGN="center">
						<TR><TD COLSPAN="4" ALIGN="center" VALIGN="middle" HEIGHT="21" CLASS="statText" BGCOLOR="#666666">First Elimination Round Seeding</TD></TR>
						<TR>
							<TD WIDTH="60%" ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText" BGCOLOR="#000000">School</TD>
							<TD WIDTH="20%" ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText" BGCOLOR="#000000">Member</TD>
							<TD WIDTH="10%" ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText" BGCOLOR="#000000">Seed</TD>
							<TD WIDTH="10%" ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText" BGCOLOR="#000000">Rating</TD>
						</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=155275" CLASS="coderTextRed">DjinnKahn</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">1</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextRed">2502</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Michigan Technological University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=142795" CLASS="coderTextYellow">Joe</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">2075</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Purdue University System</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=112939" CLASS="coderTextYellow">zoidal</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">3</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">1983</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Minnesota Twin Cities</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=252076" CLASS="coderTextYellow">Wasteland</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">4</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">1872</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=151418" CLASS="coderTextYellow">ChaiBot</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">5</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">1839</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Iowa State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=109965" CLASS="coderTextYellow">vulture</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">1826</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Arkansas Fayetteville</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158658" CLASS="coderTextYellow">razorback</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">7</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">1608</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=112441" CLASS="coderTextYellow">seacow</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">8</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">1590</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154364" CLASS="coderTextYellow">schrockn</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">9</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">1564</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=113471" CLASS="coderTextYellow">jelos98</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">10</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextYellow">1538</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Rolla</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=261637" CLASS="coderTextBlue">awesjosh</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">11</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1490</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=109527" CLASS="coderTextBlue">patsup</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">12</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1485</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Wisconsin Marinette</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260906" CLASS="coderTextBlue">hnt</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">13</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1479</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Iowa State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=109933" CLASS="coderTextBlue">falcon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">14</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1457</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260761" CLASS="coderTextBlue">toast</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">15</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1446</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Southwest Missouri State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251742" CLASS="coderTextBlue">jason456</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">16</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1422</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Lincoln</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=152595" CLASS="coderTextBlue">ElPoojmar</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">17</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1399</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159400" CLASS="coderTextBlue">xzhangz</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">18</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1394</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Iowa State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156820" CLASS="coderTextBlue">aegis</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">19</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1386</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262956" CLASS="coderTextBlue">satur09</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">20</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1380</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Iowa State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156798" CLASS="coderTextBlue">BrettK</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">21</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1368</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Lincoln</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=152486" CLASS="coderTextBlue">starkiller</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">22</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1352</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262117" CLASS="coderTextBlue">Flyboy216</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">23</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1338</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262503" CLASS="coderTextBlue">Dandalf</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">24</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1322</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Trinity Christian College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260967" CLASS="coderTextBlue">codePony</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">25</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1319</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158362" CLASS="coderTextBlue">snurrie</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">26</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1316</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Saint Louis</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263759" CLASS="coderTextBlue">mkolker</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">27</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1309</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Lincoln</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266083" CLASS="coderTextBlue">Blackiston</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">28</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1305</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=152879" CLASS="coderTextBlue">D0SBoots</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">29</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1305</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Illinois Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158786" CLASS="coderTextBlue">nick_19</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">30</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1286</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Purdue University System</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=147380" CLASS="coderTextBlue">stevietodd</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">31</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1282</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Arkansas Little Rock</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264895" CLASS="coderTextBlue">insert_name</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">32</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1277</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=109535" CLASS="coderTextBlue">UMdrone</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">33</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1273</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265266" CLASS="coderTextBlue">Bipsterite</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">34</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1264</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=113583" CLASS="coderTextBlue">Binary_Man</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">35</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1246</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Arkansas Fayetteville</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154650" CLASS="coderTextBlue">hevilt</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">36</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1222</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Northern Michigan University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265522" CLASS="coderTextBlue">veredox</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">37</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1220</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Bradley University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158782" CLASS="coderTextBlue">BCSEiny</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">38</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1215</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Minnesota Twin Cities</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260056" CLASS="coderTextBlue">generator</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">39</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1214</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262074" CLASS="coderTextBlue">gblack</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">40</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextBlue">1205</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Western Illinois University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262271" CLASS="coderTextGreen">Mosher</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">41</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1197</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Minnesota Twin Cities</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262766" CLASS="coderTextGreen">jonmoon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">42</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1195</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Arkansas Fayetteville</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158638" CLASS="coderTextGreen">Jharkeld</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">43</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1191</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265007" CLASS="coderTextGreen">bbuda</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">44</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1189</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Michigan State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264832" CLASS="coderTextGreen">jignesh</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">45</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1186</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Wisconsin Madison</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251449" CLASS="coderTextGreen">matthew</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">46</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1183</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Arkansas Fayetteville</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251561" CLASS="coderTextGreen">Wolfgang</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">47</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1182</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Lincoln</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264085" CLASS="coderTextGreen">mozhiyan</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">48</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1176</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Minnesota Twin Cities</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260272" CLASS="coderTextGreen">rfu</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">49</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1135</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Purdue University System</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264692" CLASS="coderTextGreen">mwelsh</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">50</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1127</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Wisconsin Stevens Point</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=151075" CLASS="coderTextGreen">lrasm274</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">51</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1118</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=109592" CLASS="coderTextGreen">pgerzani</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">52</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1105</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Lincoln</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=261411" CLASS="coderTextGreen">dodgethis</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">53</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1092</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Purdue University System</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=157933" CLASS="coderTextGreen">redkylin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">54</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1092</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Columbia</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=143927" CLASS="coderTextGreen">Joat</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">55</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1089</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Wisconsin Parkside</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154619" CLASS="coderTextGreen">hilfiger</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">56</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1085</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Columbia</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158734" CLASS="coderTextGreen">WickedGrey</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">57</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1084</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264986" CLASS="coderTextGreen">pozdol</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">58</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1076</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=143098" CLASS="coderTextGreen">milo</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">59</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1072</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Indiana University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154725" CLASS="coderTextGreen">Aldus</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">60</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1070</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Truman State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264149" CLASS="coderTextGreen">Kynes</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">61</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1060</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Purdue University System</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154318" CLASS="coderTextGreen">DerKruker</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">62</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1057</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=108796" CLASS="coderTextGreen">wallenfe</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">63</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1053</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Indiana University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262257" CLASS="coderTextGreen">syhaas</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">64</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1052</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266664" CLASS="coderTextGreen">AssmDude</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">65</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1051</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Saint Cloud State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=155869" CLASS="coderTextGreen">Kniht</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">66</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1040</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Wisconsin Madison</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251145" CLASS="coderTextGreen">ck</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">67</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1035</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Iowa State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156876" CLASS="coderTextGreen">TheGreedyBuddha</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">68</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1033</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Northern Iowa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266056" CLASS="coderTextGreen">rdragan</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">69</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1014</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260793" CLASS="coderTextGreen">Summer</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">70</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">1011</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Grand Valley State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263804" CLASS="coderTextGreen">easlern</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">71</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">999</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Minnesota Twin Cities</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156779" CLASS="coderTextGreen">lujiwei</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">72</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">998</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159148" CLASS="coderTextGreen">honda89dude</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">73</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">997</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Purdue University System</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263770" CLASS="coderTextGreen">shadamer</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">74</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">983</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Northwestern University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264828" CLASS="coderTextGreen">yoon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">75</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">981</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Omaha</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=105880" CLASS="coderTextGreen">nuco_asdf</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">76</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">974</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Northwestern University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=267254" CLASS="coderTextGreen">AGAME</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">77</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=267231" CLASS="coderTextGreen">FutureViperOwnr</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">78</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Lincoln</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=267157" CLASS="coderTextGreen">Hyren</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">79</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Trinity Christian College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=261148" CLASS="coderTextGreen">TheChunga</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">80</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=267164" CLASS="coderTextGreen">aug</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">81</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Arkansas Fayetteville</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=267261" CLASS="coderTextGreen">bnvs123</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">82</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Rolla</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=267083" CLASS="coderTextGreen">burkes</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">83</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=267199" CLASS="coderTextGreen">honzik6</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">84</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264703" CLASS="coderTextGreen">whatisit</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">85</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">967</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Iowa State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156803" CLASS="coderTextGreen">orogon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">86</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">966</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Michigan State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263374" CLASS="coderTextGreen">handthom</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">87</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">966</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156896" CLASS="coderTextGreen">iamyou</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">88</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">963</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Lincoln</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154620" CLASS="coderTextGreen">Wanado</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">89</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">961</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154370" CLASS="coderTextGreen">altinsel</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">90</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">961</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Purdue University System</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=110284" CLASS="coderTextGreen">ggranum</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">91</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">956</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Purdue University System</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264746" CLASS="coderTextGreen">ausimity</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">92</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">943</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Central Michigan University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266595" CLASS="coderTextGreen">fedevela</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">93</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">943</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266381" CLASS="coderTextGreen">jeromemsoe</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">94</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">943</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Saint Josephs College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266095" CLASS="coderTextGreen">kshumard</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">95</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">943</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Iowa State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=157851" CLASS="coderTextGreen">josh</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">96</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">939</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Luther College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=157390" CLASS="coderTextGreen">FrodoB</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">97</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">926</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Northern Iowa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158755" CLASS="coderTextGreen">jamuraa</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">98</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">926</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=151518" CLASS="coderTextGreen">StrIkeR_MaN</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">99</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">921</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Minnesota Twin Cities</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=261393" CLASS="coderTextGreen">Symme7ry</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">100</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">914</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=115065" CLASS="coderTextGreen">purpleD</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">101</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">913</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Indiana University Purdue University Indianapolis</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262768" CLASS="coderTextGreen">sedition</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">102</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">910</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260106" CLASS="coderTextGreen">barwin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">103</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">909</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Rolla</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263876" CLASS="coderTextGreen">norton</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">104</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">906</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265190" CLASS="coderTextGreen">Vadar7</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">105</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">904</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265536" CLASS="coderTextGreen">mattt2000</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">106</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">904</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Milwaukee School of Engineering</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264617" CLASS="coderTextGreen">DedPupit</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">107</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGreen">900</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Rolla</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265518" CLASS="coderTextGray">pistol</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">108</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">893</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Saint Cloud State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265046" CLASS="coderTextGray">Tamenend</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">109</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">886</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Rolla</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263581" CLASS="coderTextGray">seren23</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">110</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">885</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262954" CLASS="coderTextGray">Radixsort</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">111</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">883</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=112483" CLASS="coderTextGray">tik1</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">112</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">876</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Urbana-Champaign</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266707" CLASS="coderTextGray">tolerant</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">113</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">874</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Western Michigan University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251211" CLASS="coderTextGray">ashoooo</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">114</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">871</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Oakland University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263493" CLASS="coderTextGray">jehudial</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">115</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">858</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Columbia</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266694" CLASS="coderTextGray">DarkCloun</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">116</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">846</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Nebraska Lincoln</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264073" CLASS="coderTextGray">bwwei</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">117</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">846</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Missouri Columbia</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266700" CLASS="coderTextGray">willy</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">118</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">846</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Saint Josephs College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=107108" CLASS="coderTextGray">Charlie</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">119</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">845</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=261407" CLASS="coderTextGray">sfcheng</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">120</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">821</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Iowa</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=261777" CLASS="coderTextGray">ivarneli</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">121</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">820</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263503" CLASS="coderTextGray">calypso</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">122</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">807</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Michigan State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265243" CLASS="coderTextGray">Coder_02</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">123</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">804</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Michigan Ann Arbor</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263079" CLASS="coderTextGray">mtconnol</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">124</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">785</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Arkansas Fayetteville</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156372" CLASS="coderTextGray">gopras_ram</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">125</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">769</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Illinois Chicago</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159819" CLASS="coderTextGray">coopex</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">126</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">739</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">University of Wisconsin Milwaukee</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=105914" CLASS="coderTextGray">dpuza</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">127</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">729</SPAN></TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="21" CLASS="statText">Northwestern University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=157578" CLASS="coderTextGray">Radgast</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText">128</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="21" CLASS="statText"><SPAN CLASS="coderTextGray">720</SPAN></TD>
</TR>
						</TABLE><BR/><BR/>
					<P><BR/></P>
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
    <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

