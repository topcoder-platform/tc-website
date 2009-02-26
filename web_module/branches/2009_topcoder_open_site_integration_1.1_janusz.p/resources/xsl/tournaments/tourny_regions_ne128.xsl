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
	<BR/><BR/>
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                    <TR>
                      <TD COLSPAN="2" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Regional Quarter-Final Seeding</TD>
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/index?t=tournaments&amp;c=tourny_regions_ne" CLASS="statTextBig">View Championship Seeding</A><BR/><A HREF="/index?t=tournaments&amp;c=tourny_regions_ne32" CLASS="statTextBig">View Semifinal Seeding</A></TD>
                    </TR>
						<TR>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">Northeast</TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourny_regions_se" CLASS="statTextBig">Southeast</A></TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourny_regions_w" CLASS="statTextBig">West</A></TD>
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourny_regions_mw" CLASS="statTextBig">Midwest</A></TD>
						</TR>
                    </TABLE>
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="0" ALIGN="center">
						<TR>
							<TD WIDTH="60%" ALIGN="left" VALIGN="middle" HEIGHT="18" CLASS="statText" BGCOLOR="#000000">School</TD>
							<TD WIDTH="20%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Member</TD>
							<TD WIDTH="10%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Seed</TD>
							<TD WIDTH="10%" ALIGN="right" VALIGN="middle" CLASS="statText" BGCOLOR="#000000">Rating</TD>
						</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=147102" CLASS="coderTextRed">pl31415</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2604</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Oberlin College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=152347" CLASS="coderTextRed">ZorbaTHut</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2560</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156216" CLASS="coderTextRed">daveagp</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">3</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2367</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rutgers University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156592" CLASS="coderTextRed">benetin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">4</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2350</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260835" CLASS="coderTextRed">reid</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">5</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2330</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154089" CLASS="coderTextRed">milhouse</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">6</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2241</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158067" CLASS="coderTextRed">KurtSteinkraus</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">7</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2213</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=115147" CLASS="coderTextYellow">kyotov</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">8</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2189</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=112902" CLASS="coderTextYellow">Logan</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">9</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2178</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251457" CLASS="coderTextYellow">etolson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">10</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2129</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=133846" CLASS="coderTextYellow">stanf</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">11</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2115</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260800" CLASS="coderTextYellow">mitkid</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">12</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2060</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159052" CLASS="coderTextYellow">lbackstrom</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">13</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2046</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=155621" CLASS="coderTextYellow">Garzahd</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">14</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">2010</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154139" CLASS="coderTextYellow">dc1847</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">15</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1965</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265031" CLASS="coderTextYellow">Gyrefalcon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">16</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1959</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158922" CLASS="coderTextYellow">Revoklaw</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">17</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1948</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=150852" CLASS="coderTextYellow">sundberg</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">18</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1944</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154135" CLASS="coderTextYellow">tck</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">19</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1887</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156603" CLASS="coderTextYellow">LinkII</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">20</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1870</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Princeton University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=157972" CLASS="coderTextYellow">obfuscator</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">21</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1850</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Pennsylvania State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156768" CLASS="coderTextYellow">Nok</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">22</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1832</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=150257" CLASS="coderTextYellow">qiui</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">23</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1798</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Case Western Reserve University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265736" CLASS="coderTextYellow">Ken Alverson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">24</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1767</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159177" CLASS="coderTextYellow">wybili</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">25</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1764</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">New York University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=252281" CLASS="coderTextYellow">turian</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">26</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1738</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=153091" CLASS="coderTextYellow">dziegler</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">27</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1727</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Northeastern University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158137" CLASS="coderTextYellow">olted</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">28</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1721</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Syracuse University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158110" CLASS="coderTextYellow">maxx</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">29</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1708</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263580" CLASS="coderTextYellow">enderx</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">30</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1701</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251140" CLASS="coderTextYellow">ekogan37</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">31</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1638</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Maryland College Park</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264961" CLASS="coderTextYellow">henchq</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">32</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1636</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rensselaer Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159818" CLASS="coderTextYellow">kvin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">33</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1627</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Harvard University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265800" CLASS="coderTextYellow">kolc</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">34</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1613</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158567" CLASS="coderTextYellow">mic</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">35</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1611</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rutgers University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=252203" CLASS="coderTextYellow">cleverbb</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">36</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1606</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Princeton University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=128971" CLASS="coderTextYellow">seanmac02</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">37</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1593</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Harvard University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264835" CLASS="coderTextYellow">magicacid</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">38</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1581</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=152605" CLASS="coderTextYellow">georgepf</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">39</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1576</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265531" CLASS="coderTextYellow">langer</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">40</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1571</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">College of William and Mary</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156990" CLASS="coderTextYellow">lanenal</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">41</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1566</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of New Hampshire</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=107798" CLASS="coderTextYellow">jay_peg</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">42</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1562</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=153479" CLASS="coderTextYellow">petch</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">43</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1557</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rutgers University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=112630" CLASS="coderTextYellow">Aleksey</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">44</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1547</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Messiah College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260170" CLASS="coderTextYellow">Alonzo1980</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">45</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1543</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=141448" CLASS="coderTextYellow">claw</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">46</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1529</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Connecticut</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=113433" CLASS="coderTextYellow">ConleyVI</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">47</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1522</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158837" CLASS="coderTextYellow">axch</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">48</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1522</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Johns Hopkins University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158259" CLASS="coderTextYellow">flyland</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">49</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1521</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154282" CLASS="coderTextYellow">johngu</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">50</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1513</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rensselaer Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=110176" CLASS="coderTextYellow">Orbus</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">51</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1510</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264913" CLASS="coderTextYellow">sanctity</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">52</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1504</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Brown University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260572" CLASS="coderTextYellow">jcl</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">53</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1504</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=143845" CLASS="coderTextYellow">skazzytl</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">54</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1503</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=133058" CLASS="coderTextBlue">Joel</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">55</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1497</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156615" CLASS="coderTextBlue">nikesp23</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">56</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1490</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=152378" CLASS="coderTextBlue">vlakasux</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">57</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1489</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=150796" CLASS="coderTextBlue">paisa</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">58</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1489</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=147031" CLASS="coderTextBlue">gaav</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">59</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1487</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Princeton University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264949" CLASS="coderTextBlue">moira</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">60</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1455</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Harvard University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=133298" CLASS="coderTextBlue">otraub</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">61</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1450</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Boston University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=139153" CLASS="coderTextBlue">johnm4</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">62</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1439</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=138158" CLASS="coderTextBlue">leelin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">63</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1433</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156272" CLASS="coderTextBlue">imirkin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">64</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1433</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158149" CLASS="coderTextBlue">adrian</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">65</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1425</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264158" CLASS="coderTextBlue">palenica</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">66</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1422</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Maryland College Park</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=128621" CLASS="coderTextBlue">sticky</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">67</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1416</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Virginia</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=157582" CLASS="coderTextBlue">msuhocki</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">68</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1406</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Binghamton University SUNY</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265545" CLASS="coderTextBlue">insomnia</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">69</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1398</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Amherst College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=264803" CLASS="coderTextBlue">zimmy</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">70</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1392</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Worcester Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=115699" CLASS="coderTextBlue">agmarut</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">71</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1384</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Maryland College Park</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=261035" CLASS="coderTextBlue">Aeth</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">72</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1383</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Princeton University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156791" CLASS="coderTextBlue">jblatz</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">73</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1370</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=155438" CLASS="coderTextBlue">cly</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">74</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1363</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251683" CLASS="coderTextBlue">Maomoondog</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">75</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1351</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Princeton University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156640" CLASS="coderTextBlue">Arremoon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">76</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1351</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Maryland College Park</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265308" CLASS="coderTextBlue">prettycool</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">77</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1343</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Geneseo SUNY</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=112870" CLASS="coderTextBlue">CelestialReject</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">78</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1342</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=155489" CLASS="coderTextBlue">bliant</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">79</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1341</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Boston College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=153503" CLASS="coderTextBlue">try17</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">80</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1333</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251134" CLASS="coderTextBlue">plan571</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">81</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1333</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Dartmouth College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266191" CLASS="coderTextBlue">pervy</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">82</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1329</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=151524" CLASS="coderTextBlue">cmpterman2</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">83</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1320</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156602" CLASS="coderTextBlue">ioiars</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">84</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1301</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159166" CLASS="coderTextBlue">redman</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">85</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1301</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rensselaer Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=141330" CLASS="coderTextBlue">mSWAE</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">86</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1297</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=150086" CLASS="coderTextBlue">jsilber</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">87</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1286</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University at Buffalo SUNY</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=151886" CLASS="coderTextBlue">kdby</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">88</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1272</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156541" CLASS="coderTextBlue">SteveStern</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">89</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1254</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Binghamton University SUNY</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251317" CLASS="coderTextBlue">brett1479</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">90</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1249</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266658" CLASS="coderTextBlue">mbolin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">91</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1241</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266685" CLASS="coderTextBlue">flozell</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">92</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1241</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Case Western Reserve University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265960" CLASS="coderTextBlue">m-doggg</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">93</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1230</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=128876" CLASS="coderTextBlue">esyu</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">94</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1224</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Oberlin College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159947" CLASS="coderTextBlue">Rainbow</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">95</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1213</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=132911" CLASS="coderTextBlue">graycu02</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">96</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1206</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Maryland College Park</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=124980" CLASS="coderTextBlue">pkirlin</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">97</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1204</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Maryland College Park</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251944" CLASS="coderTextBlue">the_lark</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">98</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1201</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Worcester Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266781" CLASS="coderTextGreen">jar</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">99</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1194</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265855" CLASS="coderTextGreen">jmarks</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">100</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1194</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Pace University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=146723" CLASS="coderTextGreen">Demolisher</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">101</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1192</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=152511" CLASS="coderTextGreen">zamboni</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">102</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1186</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rensselaer Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=110323" CLASS="coderTextGreen">DeVoT3DGrL</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">103</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1181</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159927" CLASS="coderTextGreen">Kramer</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">104</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1177</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cleveland State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=104348" CLASS="coderTextGreen">weasal</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">105</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1171</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Worcester Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=265504" CLASS="coderTextGreen">coderlemming</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">106</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1160</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Lafayette College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159789" CLASS="coderTextGreen">tavib</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">107</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1158</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Harvard University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=158245" CLASS="coderTextGreen">somyos</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">108</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1136</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Pittsburgh</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266084" CLASS="coderTextGreen">stimpil</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">109</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1134</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Carnegie Mellon University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251462" CLASS="coderTextGreen">hiatus</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">110</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1134</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Rochester</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263480" CLASS="coderTextGreen">quicsilvar</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">111</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1131</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">New York University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251429" CLASS="coderTextGreen">ByteMe95</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">112</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1130</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Boston University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266763" CLASS="coderTextGreen">drummer</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">113</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1127</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=154661" CLASS="coderTextGreen">progbuc</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">114</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1123</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Yale University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251322" CLASS="coderTextGreen">jjmoon</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">115</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1112</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=159351" CLASS="coderTextGreen">theorizer</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">116</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1109</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Pace University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=263468" CLASS="coderTextGreen">Rakot</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">117</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1106</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Strayer University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=260897" CLASS="coderTextGreen">svemir</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">118</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1103</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Virginia Polytechnic Institute State University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=262038" CLASS="coderTextGreen">Boing</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">119</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1097</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=150094" CLASS="coderTextGreen">drcheng</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">120</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1092</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">University of Massachusetts Amherst</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266162" CLASS="coderTextGreen">rashok</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">121</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1076</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Rensselaer Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=110078" CLASS="coderTextGreen">laprej</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">122</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1069</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=266097" CLASS="coderTextGreen">alexn</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">123</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1069</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Worcester Polytechnic Institute</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251440" CLASS="coderTextGreen">mmelson</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">124</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1053</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Case Western Reserve University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=156804" CLASS="coderTextGreen">Zaen</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">125</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1051</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Dartmouth College</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=113926" CLASS="coderTextGreen">maxence</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">126</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1047</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Cornell University</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=251173" CLASS="coderTextGreen">dberner9</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">127</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1047</TD>
</TR>
<TR>
  <TD ALIGN="left" VALIGN="middle" HEIGHT="13" CLASS="statText">Massachusetts Institute of Technology</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/stat?&amp;c=member_profile&amp;cr=152640" CLASS="coderTextGreen">randomfactor</A></TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">128</TD>
  <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText">1046</TD>
</TR>
						</TABLE><BR/>
				    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                        <TR><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;<A HREF="#top" CLASS="statText">Back to top</A></TD></TR>
                    </TABLE>					
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

