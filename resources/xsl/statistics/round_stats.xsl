<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/> 
  <xsl:import href="input.xsl"/>  
  <xsl:import href="../includes/modules/rating.xsl"/>
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
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
  <xsl:choose><xsl:when test="/TC/STATLISTS/LastMatch='true'">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Last Match Results</xsl:with-param>
</xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Round Statistics</xsl:with-param>
</xsl:call-template>
  </xsl:otherwise></xsl:choose> 


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">  
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>  
  <TR>
    <xsl:if test="/TC/STATLISTS/LastMatch!='true'">
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">
        <SPAN CLASS="statTextBig"><B>Please select a round:</B></SPAN><BR/>
        <xsl:call-template name="contestListRound"/>
      </TD>
    </xsl:if>
  </TR>
  <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
  </TR>      

  <xsl:choose><xsl:when test="/TC/STATLISTS/LastMatch='true'">
    <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Last_Match=true&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=1&amp;Sort=<xsl:value-of select="/TC/STATLISTS/Main/Sort"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>division-I</A>
        |  
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Last_Match=true&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=2&amp;Sort=<xsl:value-of select="/TC/STATLISTS/Main/Sort"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>division-II</A> 
      </TD>
    </TR>
  </xsl:when>
  <xsl:otherwise>
    <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=1&amp;Sort=<xsl:value-of select="/TC/STATLISTS/Main/Sort"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>division-I</A>
        |  
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=2&amp;Sort=<xsl:value-of select="/TC/STATLISTS/Main/Sort"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>division-II</A> 
      </TD>
    </TR>
  </xsl:otherwise></xsl:choose>
  <xsl:if test="number(/TC/STATLISTS/Main/RoundId)=4085"> 
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="16">
        <CENTER><A HREF="/i/mot_redir.html"><img src="/i/moto_banner.gif" ALT="" WIDTH="428" HEIGHT="84" BORDER="0"/></A></CENTER>
      </TD>
    </TR>
  </xsl:if>

  <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>
  </TR>      
</TABLE>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>
  <xsl:choose>
  <xsl:when test="count(/TC/STATLISTS/Main/GeneralRoom)='0'">
    <xsl:choose>
    <xsl:when test="count(/TC/STATLISTS/Main/RoomResult)='0'">
      <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statTextBig" COLSPAN="16" VALIGN="top" HEIGHT="50">
          There were no <xsl:value-of select="/TC/STATLISTS/DivisionDesc"/> coders in this round.
        </TD>
      </TR>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="TopStuff"/>
      <xsl:for-each select="/TC/STATLISTS/Main/RoomResult">
        <xsl:call-template name="CoderInfo"/>
      </xsl:for-each>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="TopStuff"/>
    <xsl:for-each select="/TC/STATLISTS/Main/GeneralRoom">
      <TR>
        <TD BACKGROUND="/i/steel_bluebv_bg.gif" COLSPAN="16" CLASS="statText" VALIGN="middle" HEIGHT="16"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3" ALIGN="left"/>
          <A>
            <xsl:attribute name="HREF">index?t=statistics&amp;c=room_stats&amp;Contest_Id=<xsl:value-of select="ContestId"/>&amp;Round_Id=<xsl:value-of select="RoundId"/>&amp;Room_Id=<xsl:value-of select="RoomId"/></xsl:attribute>
            <xsl:attribute name="CLASS">statText</xsl:attribute>
            &#160;<xsl:value-of select="RoomDesc"/>
          </A>
        </TD>
      </TR>
      <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
      </TR>        
      <xsl:for-each select="RoomResult">
        <xsl:call-template name="CoderInfo"/>
      </xsl:for-each>
    </xsl:for-each>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="16"><A HREF="#top" CLASS="statText">&#160;Back to Top</A></TD>
    </TR>         
  </xsl:otherwise>
  </xsl:choose>
</TABLE>

    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
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
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>

<xsl:if test="number(/TC/STATLISTS/Main/RoundId)>59 and number(/TC/STATLISTS/Main/RoundId)&lt;70">
<A HREF="/?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A>
</xsl:if>


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

  <xsl:template name="CoderInfo">
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="13" WIDTH="10">
            <A>
              <xsl:attribute name="HREF">index?t=statistics&amp;c=room_stats&amp;Contest_Id=<xsl:value-of select="ContestId"/>&amp;Round_Id=<xsl:value-of select="RoundId"/>&amp;Coder_Id=<xsl:value-of select="CoderId"/></xsl:attribute>
              <IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="4" BORDER="0"/>
            </A>
          </TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle"> 
            <A>
              <xsl:attribute name="HREF">index?t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="CoderId"/></xsl:attribute>
              <xsl:attribute name="CLASS">statText</xsl:attribute>
              <FONT>
                <xsl:attribute name="color">
                  <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="PostRoundRating"/></xsl:with-param></xsl:call-template>
                </xsl:attribute>
                <xsl:value-of select="Handle"/>
              </FONT>
            </A>
          </TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(CodingPoints, '0.00')"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(ChallengePoints, '0.00')"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(TestPoints, '0.00')"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(FinalPoints, '0.00')"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">
            <xsl:choose>
            <xsl:when test="Advanced='Y'">
              Yes
            </xsl:when>
            <xsl:otherwise> 
              No
            </xsl:otherwise>
            </xsl:choose>
          </TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">
            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PreRoundRating, '0')"/></xsl:with-param></xsl:call-template>
          </TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(RatingDifference, '0.00')"/></TD>    
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">
            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PostRoundRating, '0')"/></xsl:with-param></xsl:call-template>
          </TD>      
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
        </TR>
         <TR>
         <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
         </TR>        
  </xsl:template>


  <xsl:template name="TopStuff">
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="16">
        <xsl:call-template name="rating_key"/><br/><br/>
Click the <IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"/> icon to view problem information or Room # for Room details.</TD>    
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
    </TR>  
    <TR>
      <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="registerNav" COLSPAN="16" HEIGHT="18" NOWRAP="0">&#160;&#160;Statistics for
        <xsl:value-of select="/TC/STATLISTS/Main/ContestName"/> > <xsl:value-of select="/TC/STATLISTS/Main/RoundName"/> > <xsl:value-of select="/TC/STATLISTS/DivisionDesc"/>&#160;
      </TD>
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    </TR>  
    <TR>
      <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="15%" HEIGHT="32">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=<xsl:value-of select="/TC/STATLISTS/DivisionId"/>&amp;Sort=H</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Coders</A>
      </TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=<xsl:value-of select="/TC/STATLISTS/DivisionId"/>&amp;Sort=S</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Coding<br/>Phase</A>
      </TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">+</TD>    
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=<xsl:value-of select="/TC/STATLISTS/DivisionId"/>&amp;Sort=C</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Challenge<br/>Phase</A>
      </TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">+</TD>    
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=<xsl:value-of select="/TC/STATLISTS/DivisionId"/>&amp;Sort=T</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Testing<br/>Phase</A>
      </TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">=</TD>    
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=<xsl:value-of select="/TC/STATLISTS/DivisionId"/>&amp;Sort=F</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Final<br/>Points</A>
      </TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Adv.</TD>  
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=<xsl:value-of select="/TC/STATLISTS/DivisionId"/>&amp;Sort=O</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Old<br/>Rating</A>
      </TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">+</TD>    
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=<xsl:value-of select="/TC/STATLISTS/DivisionId"/>&amp;Sort=D</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Rating<br/>Change</A>
      </TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">=</TD>    
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">
        <A><xsl:attribute name="HREF">?t=statistics&amp;c=round_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Division_Id=<xsl:value-of select="/TC/STATLISTS/DivisionId"/>&amp;Sort=N</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>New<br/>Rating</A>
      </TD>
      <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    </TR>  
  </xsl:template>


</xsl:stylesheet>

