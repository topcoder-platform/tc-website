<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/> 
  <xsl:import href="../includes/modules/scroll.xsl"/>  
  <xsl:import href="../includes/modules/rating.xsl"/>  
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
  <xsl:with-param name="title">&#160;Coder Rankings</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <FORM name="coderRankForm" METHOD="get">
    <INPUT TYPE="hidden" NAME="t" VALUE="statistics"/>
    <INPUT TYPE="hidden" NAME="c" VALUE="rankings"/>
    <INPUT TYPE="hidden" NAME="Range" VALUE=""/>
    <INPUT TYPE="hidden" NAME="Next" VALUE=""/>
  <xsl:variable name="row">
    <xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/Row"/>
  </xsl:variable>
  <xsl:variable name="returns">
    <xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/Returns"/>
  </xsl:variable>
  <xsl:variable name="size">
    <xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/Size"/>
  </xsl:variable>

  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
  </TR>  

  <TR>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
      View
      <A HREF="Javascript:document.coderRankForm.Range.value='20';Javascript:document.coderRankForm.submit()"><xsl:attribute name="CLASS">statText</xsl:attribute>&#160; 20 </A>
      |
      <A HREF="Javascript:document.coderRankForm.Range.value='40';Javascript:document.coderRankForm.submit()"><xsl:attribute name="CLASS">statText</xsl:attribute>&#160; 40 </A>
      |
      <A HREF="Javascript:document.coderRankForm.Range.value='60';Javascript:document.coderRankForm.submit()"><xsl:attribute name="CLASS">statText</xsl:attribute>&#160; 60 </A>
      |
      <A HREF="Javascript:document.coderRankForm.Range.value='80';Javascript:document.coderRankForm.submit()"><xsl:attribute name="CLASS">statText</xsl:attribute>&#160; 80 </A>
      |
      <A HREF="Javascript:document.coderRankForm.Range.value='100';Javascript:document.coderRankForm.submit()"><xsl:attribute name="CLASS">statText</xsl:attribute>&#160; 100 </A>
      |
      <A HREF="Javascript:document.coderRankForm.Range.value='200';Javascript:document.coderRankForm.submit()"><xsl:attribute name="CLASS">statText</xsl:attribute>&#160; 200 </A>
      at a time.
    </TD>
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR> 
  <TR>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
      <xsl:if test="number($size)>0">
        <xsl:call-template name="ScrollLinks">
          <xsl:with-param name="ShowPrev"><SPAN CLASS="statText"><xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/AllowPrevious"/></SPAN></xsl:with-param>
          <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/AllowNext"/></xsl:with-param>
          <xsl:with-param name="PrevLink">javascript:document.coderRankForm.Next.value='false';javascript:document.coderRankForm.submit()</xsl:with-param>
          <xsl:with-param name="NextLink">javascript:document.coderRankForm.Next.value='true';javascript:document.coderRankForm.submit()</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </TD>
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Rank</TD>  
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="48%">Handle</TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">Rating</TD>  
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <xsl:for-each select="/TC/STATLISTS/TopRankedCoders/TopRankedCoder">
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" HEIGHT="13"><xsl:value-of select="Rank"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left">
        <A>
          <xsl:attribute name="HREF">index?t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="CoderId"/></xsl:attribute>
          <xsl:attribute name="CLASS">statText</xsl:attribute>
          <FONT>
            <xsl:attribute name="color">
              <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="Rating"/></xsl:with-param></xsl:call-template>
            </xsl:attribute>
            <xsl:value-of select="Handle"/>
          </FONT>
        </A>
      </TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="Rating"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
    </TR>    
  </xsl:for-each>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
      <xsl:if test="number($size)>0">
        <xsl:call-template name="ScrollLinks">
          <xsl:with-param name="ShowPrev"><xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/AllowPrevious"/></xsl:with-param>
          <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Scroll/AllowNext"/></xsl:with-param>
          <xsl:with-param name="PrevLink">javascript:document.coderRankForm.Next.value='false';javascript:document.coderRankForm.submit()</xsl:with-param>
          <xsl:with-param name="NextLink">javascript:document.coderRankForm.Next.value='true';javascript:document.coderRankForm.submit()</xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </TD>
  </TR> 
  <TR>
    <TD COLSPAN="5" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>   
  <TR>
    <TD COLSPAN="5" ALIGN="center" CLASS="statText">
        Viewing coders ranked&#160;
        <INPUT TYPE="text" NAME="First" MAXLENGTH="4" SIZE="4">
          <xsl:attribute name="value">
            <xsl:value-of select="/TC/STATLISTS/TopRankedCoders/First"/>
          </xsl:attribute>
        </INPUT>
        &#160;to&#160;
        <INPUT TYPE="text" NAME="Last" MAXLENGTH="4" VALIGN="center" SIZE="4">
          <xsl:attribute name="value">
            <xsl:value-of select="/TC/STATLISTS/TopRankedCoders/Last"/>
          </xsl:attribute>
        </INPUT>
        <A HREF="Javascript:document.coderRankForm.submit()"><xsl:attribute name="CLASS">statText</xsl:attribute>&#160;[ submit ]</A>
    </TD>
  </TR>
  <TR>
    <TD COLSPAN="5" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR> 
  </FORM>
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

