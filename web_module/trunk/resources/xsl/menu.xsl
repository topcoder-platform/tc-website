<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="TopMenu">
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
      <TR>
        <!-- <TD CLASS="registerNav" WIDTH="15" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD> -->
        <TD CLASS="registerNav" WIDTH="114" HEIGHT="21" BACKGROUND="/i/steel_gray_bg.gif">
          <xsl:choose>
            <xsl:when test="/TC/LoggedIn='true'">
              <A CLASS="registerNav" TARGET="_parent">
                <xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp?&amp;<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                <IMG SRC="/i/menu_profile_on.gif" ALT="Update Profile" WIDTH="114" HEIGHT="21" BORDER="0"/>
              </A>
            </xsl:when>
            <xsl:otherwise>
              <A CLASS="registerNav" TARGET="_parent">
                <xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>
                <IMG SRC="/i/menu_reg_off.gif" ALT="Register" WIDTH="114" HEIGHT="21" BORDER="0"/>
              </A>
            </xsl:otherwise>
          </xsl:choose>
        </TD>
        <!-- <TD WIDTH="5" HEIGHT="21" BACKGROUND="/i/steel_gray_bg.gif" ALIGN="right">
          <IMG SRC="/i/top_bar_left.gif" WIDTH="21" HEIGHT="21" BORDER="0"/>
        </TD> -->
        <TD CLASS="globalNav" WIDTH="100%" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000" NOWRAP="0">
          <A onMouseOver="changeImages('image2', 'image2on')" onMouseOut="changeImages('image2', 'image2off')" TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>
            <IMG NAME="image2" ALT="Schedule" WIDTH="69" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/menu_sched_<xsl:choose><xsl:when test="/TC/Task='schedule'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>
          <A onMouseOver="changeImages('image3', 'image3on')" onMouseOut="changeImages('image3', 'image3off')" TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute>
            <IMG NAME="image3" ALT="Teams" WIDTH="49" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/menu_teams_<xsl:choose><xsl:when test="/TC/Task='about_tc'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>          
          <A onMouseOver="changeImages('image4', 'image4on')" onMouseOut="changeImages('image4', 'image4off')" TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=index</xsl:attribute>
            <IMG NAME="image4" ALT="Statistics" WIDTH="69" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/menu_stats_<xsl:choose><xsl:when test="/TC/Task='statistics'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>
          <A onMouseOver="changeImages('image5', 'image5on')" onMouseOut="changeImages('image5', 'image5off')" TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/index.jsp</xsl:attribute>
            <IMG NAME="image5" SRC="/i/menu_rounds_off.gif" ALT="Round Tables" WIDTH="90" HEIGHT="21" BORDER="0"/>
          </A>          
          <A onMouseOver="changeImages('image6', 'image6on')" onMouseOut="changeImages('image6', 'image6off')" TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>
            <IMG NAME="image6" ALT="Development" WIDTH="88" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/menu_dev_<xsl:choose><xsl:when test="/TC/Task='dev'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>          
          <A onMouseOver="changeImages('image7', 'image7on')" onMouseOut="changeImages('image7', 'image7off')" TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=jobs&amp;c=index</xsl:attribute>
            <IMG NAME="image7" ALT="Jobs" WIDTH="40" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/menu_jobs_<xsl:choose><xsl:when test="/TC/Task='jobs'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>                              
          <A onMouseOver="changeImages('image8', 'image8on')" onMouseOut="changeImages('image8', 'image8off')" TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>
            <IMG NAME="image8" ALT="News &amp; Events" WIDTH="82" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/menu_press_<xsl:choose><xsl:when test="/TC/Task='news_events'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>                  
          <A onMouseOver="changeImages('image9', 'image9on')" onMouseOut="changeImages('image9', 'image9off')" TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>
            <IMG NAME="image9" ALT="Support/FAQs" WIDTH="90" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/menu_support_<xsl:choose><xsl:when test="/TC/Task='support'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>
        </TD>
        <!-- <TD WIDTH="5" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000" ALIGN="right">
          <IMG SRC="/i/top_bar_right.gif" WIDTH="5" HEIGHT="21" BORDER="0"/>
        </TD>
        <TD WIDTH="10" HEIGHT="21" BGCOLOR="#990000"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
      </TR>
    </TABLE>
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
      <TR>
        <TD WIDTH="100%" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="top" ALIGN="right"><IMG SRC="/i/clear.gif" WIDTH="510" HEIGHT="1" BORDER="0"/></TD>
        <TD WIDTH="8" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="top" ALIGN="right"><IMG SRC="/i/top_gray_right.gif" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
        <TD WIDTH="210" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="210" HEIGHT="1" BORDER="0"/></TD>
      </TR>
    </TABLE>
  </xsl:template>
</xsl:stylesheet>
