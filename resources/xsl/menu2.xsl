<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="TopMenu">
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
      <TR>
        <!-- <TD CLASS="registerNav" WIDTH="15" HEIGHT="21" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="middle"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
        <TD CLASS="registerNav" WIDTH="120" HEIGHT="21" BACKGROUND="/i/steel_gray_bg.gif" VALIGN="middle" ALIGN="center">
          <IMG SRC="/i/clear.gif" WIDTH="120" HEIGHT="1" BORDER="0"/><BR/>
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'"><A HREF="/reg/index.jsp" CLASS="registerNav" TARGET="_parent">Update your Profile</A>&#160;&#160;&#160;&#160;</xsl:when>
                  <xsl:otherwise><A CLASS="registerNav" HREF="/reg/index.jsp" TARGET="_parent">REGISTRATION</A>&#160;&#160;&#160;&#160;</xsl:otherwise>
                </xsl:choose>
        </TD>
        <TD WIDTH="5" HEIGHT="21" BACKGROUND="/i/steel_gray_bg.gif" ALIGN="right">
          <IMG SRC="/i/top_bar_left.gif" WIDTH="21" HEIGHT="21" BORDER="0"/>
        </TD> -->
        <TD CLASS="globalNav" WIDTH="100%" HEIGHT="21" BACKGROUND="/i/top_bar_bg.gif" BGCOLOR="#CC0000" VALIGN="middle" NOWRAP="">
          <!-- <IMG SRC="/i/clear.gif" WIDTH="500" HEIGHT="1" BORDER="0"/><BR/> -->
          <IMG SRC="/i/clear.gif" WIDTH="30" HEIGHT="1" BORDER="0"/>
          <!-- <A HREF="/index?t=about_tc&amp;c=index" onMouseOver="changeImages('image1', 'image1on')" onMouseOut="changeImages('image1', 'image1off')" TARGET="_parent">
            <IMG NAME="image1" SRC="/i/nav_about_off.gif" ALT="About TopCoder" WIDTH="104" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/nav_about_<xsl:choose><xsl:when test="/TC/Task='about_tc'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>
          <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/>
          <A HREF="/index?t=news_events&amp;c=index" onMouseOver="changeImages('image2', 'image2on')" onMouseOut="changeImages('image2', 'image2off')" TARGET="_parent">
            <IMG NAME="image2" SRC="/i/nav_news_off.gif" ALT="News &amp; Events" WIDTH="82" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/nav_news_<xsl:choose><xsl:when test="/TC/Task='news_events'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A> -->
          <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/>
          <A HREF="/rtables/index.jsp" onMouseOver="changeImages('image3', 'image3on')" onMouseOut="changeImages('image3', 'image3off')" TARGET="_parent">
            <IMG NAME="image3" SRC="/i/nav_roundtables_off.gif" ALT="Round Tables" WIDTH="86" HEIGHT="21" BORDER="0"/>
          </A>
          <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/>
          <A HREF="/?t=statistics&amp;c=index" onMouseOver="changeImages('image4', 'image4on')" onMouseOut="changeImages('image4', 'image4off')" TARGET="_parent">
            <IMG NAME="image4" ALT="Statistics" WIDTH="65" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/nav_stats_<xsl:choose><xsl:when test="/TC/Task='statistics'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>
          <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/>
          <A HREF="/index?t=schedule&amp;c=index" onMouseOver="changeImages('image5', 'image5on')" onMouseOut="changeImages('image5', 'image5off')" TARGET="_parent">
            <IMG NAME="image5" ALT="Schedule" WIDTH="65" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/nav_schedule_<xsl:choose><xsl:when test="/TC/Task='schedule'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            </IMG>
          </A>
          <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="21" BORDER="0"/>
          <A HREF="/index?t=support&amp;c=index" onMouseOver="changeImages('image6', 'image6on')" onMouseOut="changeImages('image6', 'image6off')" TARGET="_parent">
            <IMG NAME="image6" ALT="Support/FAQs" WIDTH="99" HEIGHT="21" BORDER="0">
              <xsl:attribute name="SRC">/i/nav_support_<xsl:choose><xsl:when test="/TC/Task='support'">on</xsl:when><xsl:otherwise>off</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
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
