<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/2002tccc_seminav.xsl"/>    
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
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;The&#160;2002&#160;Sun/TopCoder&#160;Collegiate&#160;Challenge</xsl:with-param>
</xsl:call-template>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<DIV ALIGN="center"><IMG SRC="/i/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" BORDER="0"/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%" ALIGN="right">
 	<TR>
        <!-- <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText" ALIGN="center"><IMG SRC="/i/02tccc_logow_sm.gif" ALT="" WIDTH="96" HEIGHT="74" ALIGN="left" HSPACE="5" VSPACE="15" BORDER="0"/></TD> 	
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
        <TD COLSPAN="3" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="3" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="70%" BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">TOURNAMENT LINKS:</TD> 
		
		<TD WIDTH="30%" BGCOLOR="#FFFFFF" VALIGN="middle" ALIGN="right" CLASS="moduleTitle"><A HREF="/index?t=tournament&amp;c=2002tccc_breakdown" CLASS="bodyText">-&#160;Brackets</A>&#160;&#160;</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="3" VALIGN="top" BGCOLOR="#999999" WIDTH="100%" NOWRAP="0">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
		<TR>					
			<TD VALIGN="top" CLASS="bodyText" NOWRAP="0">&#160;&#160;<B>Championship:</B><BR/>
			 &#160;<A HREF="/index?t=tournament&amp;c=2002tccc_chmp" CLASS="bodyText">Summary</A> | 
			 <A HREF="/index?t=tournament&amp;c=2002tccc_chmpprob" CLASS="bodyText">Problems</A> | 			
			 <A HREF="/index?t=tournament&amp;c=2002tccc_chmpprob#log" CLASS="bodyText">Chrono Log</A> | 
			 <A HREF="/index?t=tournament&amp;c=2002tccc_chmp#photo" CLASS="bodyText">Photos</A> | 
 			 <A CLASS="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Register Today!</A> |
			 <A HREF="/index" CLASS="bodyText">TopCoder Home</A>
			</TD>									
        </TR>
		<TR><TD VALIGN="top" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>              
</TABLE></DIV> 
<BR CLEAR="all"/>           
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">         
            <TR>
              <TD VALIGN="top" COLSPAN="2" CLASS="bodyText"><IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" ALIGN="left" HSPACE="5" VSPACE="3" BORDER="0"/>Problems statements and solutions are available for download.</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                         
            <TR>
              <TD VALIGN="middle" HEIGHT="18" WIDTH="50%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Problems (.pdf)</TD>
              <TD VALIGN="middle" HEIGHT="18" WIDTH="50%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">Solutions (.pdf)</TD>              
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                                                                         
            <TR>
              <TD VALIGN="top" CLASS="bodyText">             
Level One (250) - <A HREF="/i/2002tccc/MuseumGuard_250.pdf" CLASS="bodyText">MuseumGuard</A> by jay_peg</TD>
              <TD VALIGN="top" CLASS="bodyText">
              <A HREF="/i/2002tccc/dmwright_level1.pdf" CLASS="bodyText">dmwright</A> | 
              <A HREF="/i/2002tccc/derkuci_level1.pdf" CLASS="bodyText">derkuci</A> | 
              <A HREF="/i/2002tccc/malpt_level1.pdf" CLASS="bodyText">malpt</A> | 
              <A HREF="/i/2002tccc/Joe_level1.pdf" CLASS="bodyText">Joe</A>
              </TD>
            </TR>                                             
            <TR>              
              <TD VALIGN="top" CLASS="bodyText">
Level Two (500) - <A HREF="/i/2002tccc/NumList_500.pdf" CLASS="bodyText">NumList</A> | <A HREF="/i/2002tccc/NumList_Anly.pdf" CLASS="bodyText">NumList Analysis</A> by alexcchan</TD>
              <TD VALIGN="top" CLASS="bodyText">
              <A HREF="/i/2002tccc/dmwright_level2.pdf" CLASS="bodyText">dmwright</A> | 
              <A HREF="/i/2002tccc/derkuci_level2.pdf" CLASS="bodyText">derkuci</A> | 
              <A HREF="/i/2002tccc/malpt_level2.pdf" CLASS="bodyText">malpt</A> | 
              <A HREF="/i/2002tccc/Joe_level2.pdf" CLASS="bodyText">Joe</A>
              </TD>
            </TR>                                             
            <TR>              
              <TD VALIGN="top" CLASS="bodyText">              
Level Three (1000) - <A HREF="/i/2002tccc/PlanetX_1000.pdf" CLASS="bodyText">PlanetX</A> | <A HREF="/i/2002tccc/PlanetX_Anly.pdf" CLASS="bodyText">PlanetX Analysis</A> by NDBronson</TD>
              <TD VALIGN="top" CLASS="bodyText">
              <A HREF="/i/2002tccc/dmwright_level3.pdf" CLASS="bodyText">dmwright</A> | 
              <A HREF="/i/2002tccc/derkuci_level3.pdf" CLASS="bodyText">derkuci</A> | 
              <A HREF="/i/2002tccc/malpt_level3.pdf" CLASS="bodyText">malpt</A> 
              </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="2"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="2" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText" COLSPAN="2">
1:00:02 PM - derkuci opens the Level One problem <BR/>
1:00:03 PM - Joe opens the Level One problem <BR/>
1:00:04 PM - malpt opens the Level One problem <BR/>
1:00:20 PM - dmwright opens the Level Two problem <BR/>
1:08:54 PM - derkuci submits the Level One problem for 228.56 points <BR/>
1:09:01 PM - derkuci opens the Level Two problem <BR/>
1:09:04 PM - malpt submits the Level One problem for 227.96 points <BR/>
1:09:43 PM - malpt opens the Level Two problem <BR/>
1:10:09 PM - Joe submits the Level One problem for 223.09 points <BR/>
1:10:17 PM - Joe opens the Level Two problem <BR/>
1:27:53 PM - derkuci opens the Level Three problem <BR/>
1:32:19 PM - dmwright submits the Level Two problem for 274.20 points <BR/>
1:32:34 PM - dmwright opens the Level Three problem <BR/>
1:38:16 PM - malpt opens the Level Three problem <BR/>
1:50:15 PM - dmwright opens the Level One problem <BR/>
2:01:14 PM - dmwright submits the Level One problem for 219.05 points <BR/>
2:03:13 PM - Joe opens the Level Three problem <BR/><BR/>

<B>Challenges</B><BR/>
2:28:11 PM - derkuci challenges Joe on the Level One problem successfully<BR/> 

          </TD>
            </TR>            
                                   
          </TABLE>
          <P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>   	
  <TR>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
<!-- <A HREF="/index?t=tournament&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
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


