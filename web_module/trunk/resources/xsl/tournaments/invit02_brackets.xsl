<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_invit02_links.xsl"/>  
  <xsl:import href="../includes/modules/invit02_rule_links.xsl"/> 
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
        <xsl:call-template name="tournament_invit02_links"/>
  <!-- Coder of the Week Pulldown Ends -->
  <BR/><BR/>
  <CENTER><P CLASS="statText">Tournament Advancement Board. <A HREF="/index?t=schedule&amp;c=tourney_advancers&amp;rds=4355" CLASS="statText">Back to Advancers</A></P></CENTER>
 <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" ALIGN="center">
    <TR>
        <TD VALIGN="top"><IMG SRC="/i/tournament/invit02/invit02_rooms.gif" WIDTH="507" HEIGHT="312" USEMAP="#invit02_rooms" BORDER="0"/></TD>
    </TR>
   </TABLE>
<MAP NAME="invit02_rooms">
<AREA SHAPE="rect" ALT="" COORDS="392,262,498,282" HREF="/stat?c=member_profile&amp;cr=287266" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,235,498,256" HREF="/stat?c=member_profile&amp;cr=155275" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="393,208,498,228" HREF="/stat?c=member_profile&amp;cr=152347" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,181,498,201" HREF="/stat?c=member_profile&amp;cr=270505" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="391,108,499,126" HREF="/stat?c=member_profile&amp;cr=287105" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="392,81,499,102" HREF="/stat?c=member_profile&amp;cr=262936" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,52,498,75" HREF="/stat?c=member_profile&amp;cr=114853" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="392,27,500,46" HREF="/stat?c=member_profile&amp;cr=260835" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="10,261,116,282" HREF="/stat?c=member_profile&amp;cr=264949" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,235,116,257" HREF="/stat?c=member_profile&amp;cr=157972" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,208,117,229" HREF="/stat?c=member_profile&amp;cr=277659" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="9,182,117,201" HREF="/stat?c=member_profile&amp;cr=152073" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,107,116,128" HREF="/stat?c=member_profile&amp;cr=152342" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="9,80,115,101" HREF="/stat?c=member_profile&amp;cr=153505" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,53,117,74" HREF="/stat?c=member_profile&amp;cr=120816" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="9,25,117,48" HREF="/stat?c=member_profile&amp;cr=272072" CLASS="coderTextRed"/>
</MAP>   
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


