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
	
	 
	<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
      <TR>
        <TD COLSPAN="2" NOWRAP="0"><DIV ALIGN="center"><A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournament/sun_network_logo.gif" ALT="" WIDTH="284" HEIGHT="80" BORDER="0"/><IMG SRC="/i/tournament/sun_challenge_logo.gif" ALT="" WIDTH="174" HEIGHT="65" BORDER="0"/></A></DIV></TD>
      </TR>    
      <TR>
        <TD COLSPAN="2" ALIGN="center" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160; FEATURES</TD>
      </TR>                    						
	  <TR>
		<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">		
		<A HREF="http://sunnetwork.sun.com" TARGET="_blank" CLASS="statTextBig">Conference Info</A></TD>
		<TD WIDTH="50%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='2002sun_sched'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_about'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_scoring'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_conditions'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_prizes'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_onsite'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_structure'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>	
		<A HREF="/index?t=tournaments&amp;c=2002sun_sched" CLASS="statTextBig">Round Updates/Schedule</A></TD>
	  </TR>
    </TABLE>

  <BR/><BR/>
                    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">                  
                    
                    <TR>
                      <TD COLSPAN="2" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Schedule</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" WIDTH="30%" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Qualification Round
                      </TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="70%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=2002sun_qual" CLASS="statTextBig">Updates/Advancers</A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                                                               
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD VALIGN="middle" CLASS="statText">Wed. Sept. 18th, 11:30AM - 7:30PM</TD>
                    </TR>
                                                          
                    <TR>
                      <TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" WIDTH="30%" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Quaterfinal Round
                      </TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="35%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=2002sun_quart" CLASS="statTextBig">Updates/Advancers</A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                                                               
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD VALIGN="middle" CLASS="statText">Thurs. Sept. 19th, 11:30AM</TD>
                    </TR>
                    
                    <TR>
                      <TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" WIDTH="30%" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Semifinal Round
                      </TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="35%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=2002sun_semi" CLASS="statTextBig">Updates/Advancers</A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                                                               
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD VALIGN="middle" CLASS="statText">Thurs. Sept. 19th, 1:30PM</TD>
                    </TR>                    
                    
                    <TR>
                      <TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" WIDTH="30%" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Championship Round
                      </TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="35%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=tournaments&amp;c=2002sun_champ" CLASS="statTextBig">Updates/Advancers</A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                                                               
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD VALIGN="middle" CLASS="statText">Thurs. Sept. 19th, 4:00PM</TD>
                    </TR>                    
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


