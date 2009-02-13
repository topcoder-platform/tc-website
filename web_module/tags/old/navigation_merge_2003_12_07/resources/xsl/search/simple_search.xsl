<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/scroll.xsl"/>
  <xsl:import href="../includes/modules/rating.xsl"/>  
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
  <xsl:with-param name="title">&#160;Member Search Results</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
        <FORM name="searchForm" METHOD="get">
          <INPUT TYPE="hidden" NAME="t" VALUE="search"/>
          <INPUT TYPE="hidden" NAME="c" VALUE="simple_search"/>
          <INPUT TYPE="hidden" NAME="Next" VALUE=""/>
        </FORM>
      <xsl:if test="/TC/MEMBER_SEARCH/MemberSearch/IsResult='true'">
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <xsl:variable name="row">
            <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/Row"/>
          </xsl:variable>
          <xsl:variable name="returns">
            <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/Returns"/>
          </xsl:variable>
          <xsl:variable name="size">
            <xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/Size"/>
          </xsl:variable>
          <TR>
            <TD BACKGROUND="/i/steel_gray_bg.gif" COLSPAN="7" CLASS="statTextBig" VALIGN="middle" HEIGHT="18">&#160;Search Results:
              <xsl:choose>
              <xsl:when test="number($size)>0">
                &#160;&#160;<xsl:value-of select="$row"/>
                to
                <xsl:choose>
                  <xsl:when test="number($row)+number($returns)>number($size)">
                    <xsl:value-of select="$size"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="number($row)+number($returns)-1"/>
                  </xsl:otherwise>
                </xsl:choose>
                of
                <xsl:value-of select="$size"/>
               </xsl:when>
               <xsl:otherwise>0</xsl:otherwise>
               </xsl:choose>
            </TD>
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="7" ALIGN="center">
              <xsl:if test="number($size)>0">
                <xsl:call-template name="ScrollLinks">
                  <xsl:with-param name="ShowPrev"><xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/AllowPrevious"/></xsl:with-param>
                  <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/AllowNext"/></xsl:with-param>
                  <xsl:with-param name="PrevLink">javascript:document.searchForm.Next.value='false';javascript:document.searchForm.submit()</xsl:with-param>
                  <xsl:with-param name="NextLink">javascript:document.searchForm.Next.value='true';javascript:document.searchForm.submit()</xsl:with-param>
                </xsl:call-template>
              </xsl:if>
            </TD>
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="18" WIDTH="20%">&#160;Handle</TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10%">Rating</TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="5%">State</TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="30%"># of Rated Events</TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="40%">Last Date Competed</TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
          </TR>
          <xsl:for-each select="/TC/MEMBER_SEARCH/MemberSearch/CoderList/SearchResult">
            <TR>
              <TD CLASS="statText" VALIGN="middle" HEIGHT="13">
                <A>
                  <xsl:attribute name="HREF">?t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="CoderId"/></xsl:attribute>
                  <xsl:attribute name="CLASS">statText</xsl:attribute>
                  <FONT>
                    <xsl:attribute name="color">
                      <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="Rating"/></xsl:with-param></xsl:call-template>
                    </xsl:attribute>
                    <xsl:value-of select="Handle"/>
                  </FONT>
                </A>
              </TD>
              <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="Rating"/></TD>
              <TD CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
              <TD CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="State"/></TD>
              <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="NumRatings"/></TD>
              <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="LastCompDate"/></TD>
              <TD CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>       
          </xsl:for-each>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
          </TR>
          <TR>
          <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="7" ALIGN="center">
            <xsl:if test="number($size)>0">
              <xsl:call-template name="ScrollLinks">
                <xsl:with-param name="ShowPrev"><xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/AllowPrevious"/></xsl:with-param>
                <xsl:with-param name="ShowNext"><xsl:value-of select="/TC/MEMBER_SEARCH/MemberSearch/Scroll/AllowNext"/></xsl:with-param>
                <xsl:with-param name="PrevLink">javascript:document.searchForm.Next.value='false';javascript:document.searchForm.submit()</xsl:with-param>
                <xsl:with-param name="NextLink">javascript:document.searchForm.Next.value='true';javascript:document.searchForm.submit()</xsl:with-param>
              </xsl:call-template>
            </xsl:if>
          </TD>
        </TR>    
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"/></TD>
        </TR>    
      </TABLE>  
    </xsl:if>
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

