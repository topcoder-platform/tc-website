<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_room_wins">    
    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
        <TR>
          <TD COLSPAN="5"><IMG HEIGHT="3" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <xsl:choose>
            <xsl:when test="number($division)=2">
              <TD CLASS="smallFoot" COLSPAN="5">Here is a view of the Top-10 room winners with the highest points from <xsl:value-of select="/TC/HOME/Div2RoomWinners/RoomWinner/contest_name"/> <xsl:value-of select="/TC/HOME/Div2RoomWinners/RoomWinner/round_name"/></TD>
            </xsl:when>
            <xsl:otherwise>
              <TD CLASS="smallFoot" COLSPAN="5">Here is a view of the Top-10 room winners with the highest points from <xsl:value-of select="/TC/HOME/Div1RoomWinners/RoomWinner/contest_name"/> <xsl:value-of select="/TC/HOME/Div1RoomWinners/RoomWinner/round_name"/></TD>
            </xsl:otherwise>
          </xsl:choose>     
        </TR>
        <TR>
          <TD COLSPAN="5"><IMG HEIGHT="5" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>                  
        <TR>
          <TD WIDTH="55" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" HEIGHT="18"><IMG HEIGHT="1" WIDTH="55" SRC="/i/clear.gif"/></TD>
          <TD WIDTH="50%" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statTextBig">Handle</TD>
          <TD WIDTH="3" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG WIDTH="3" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" BGCOLOR="#093158" WIDTH="50%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statTextBig">&#160;Final Points</TD>
          <TD WIDTH="10" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <xsl:choose>
          <xsl:when test="number($division)=2">
            <xsl:for-each select="/TC/HOME/Div2RoomWinners/RoomWinner">
              <TR>
                <TD BGCOLOR="#093158" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="smallFoot">&#160;&#160;&#160;<xsl:value-of select="room_name"/></TD>
              </TR>
              <TR>
                <TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
              </TR>
              <TR>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD align="left" CLASS="statText">
                  <A>
                    <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                    <xsl:attribute name="CLASS">statText</xsl:attribute>
                    <FONT>
                      <xsl:attribute name="color">
                        <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                      </xsl:attribute>
                      <xsl:value-of select="handle"/>
                    </FONT>
                  </A>
                </TD>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD ALIGN="right" CLASS="statText"><xsl:value-of select="final_points"/></TD>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              </TR>
            </xsl:for-each>
          </xsl:when>
          <xsl:otherwise>
            <xsl:for-each select="/TC/HOME/Div1RoomWinners/RoomWinner">
              <TR>
                <TD BGCOLOR="#093158" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="5" HEIGHT="11" VALIGN="middle" CLASS="smallFoot">&#160;<xsl:value-of select="room_name"/></TD>
              </TR>
              <TR>
                <TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
              </TR>
              <TR>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD align="left" CLASS="statText">
                  <A>
                    <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                    <xsl:attribute name="CLASS">statText</xsl:attribute>
                    <FONT>
                      <xsl:attribute name="color">
                        <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                      </xsl:attribute>
                      <xsl:value-of select="handle"/>
                    </FONT>
                  </A>
                </TD>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD ALIGN="right" CLASS="statText"><xsl:value-of select="final_points"/></TD>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              </TR>
            </xsl:for-each>
          </xsl:otherwise>
        </xsl:choose>     
      <TR>
        <TD COLSPAN="5" BACKGROUND="/i/steel_blue_bg.gif" ALIGN="right" CLASS="statText" HEIGHT="13"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/><A HREF="/stat?c=round_stats" CLASS="statText">all last match results</A>&#160;&#160;</TD>
      </TR>
      <TR>
        <TD COLSPAN="5" WIDTH="1"><IMG HEIGHT="10" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>  
    </TABLE>  
  </xsl:template>
</xsl:stylesheet>
