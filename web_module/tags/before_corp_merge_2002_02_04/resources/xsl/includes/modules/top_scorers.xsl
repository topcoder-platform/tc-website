<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_scorers">    
    <xsl:param name="division"></xsl:param>
    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
       <!-- <TR>
          <TD COLSPAN="8"><IMG SRC="/i/label_room_winners.gif" HEIGHT="17" WIDTH="166" BORDER="0"/></TD>
          <TD COLSPAN="8"><IMG SRC="/i/clear.gif" HEIGHT="17" WIDTH="166" BORDER="0"/></TD>
        </TR>        
        <TR>
          <TD BGCOLOR="#FFFFFF" COLSPAN="8" WIDTH="100%"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR> -->       
        <TR>
          <TD COLSPAN="8"><IMG HEIGHT="17" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <xsl:choose>
            <xsl:when test="number($division)=2">
              <TD WIDTH="10"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>            
              <TD CLASS="smallFoot" COLSPAN="4">Here is a view of the Top-10 Division II scorers from <xsl:value-of select="/TC/HOME/Div2TopScorers/Coder/contest_name"/>&#160;<xsl:value-of select="/TC/HOME/Div2TopScorers/Coder/round_name"/></TD>
              <TD WIDTH="10"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </xsl:when>
            <xsl:otherwise>
              <TD WIDTH="10"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>            
              <TD CLASS="smallFoot" COLSPAN="4">Here is a view of the Top-10 Division I scorers from <xsl:value-of select="/TC/HOME/Div1TopScorers/Coder/contest_name"/>&#160;<xsl:value-of select="/TC/HOME/Div1Scorers/Coder/round_name"/></TD>
              <TD WIDTH="10"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>            
            </xsl:otherwise>
          </xsl:choose>     
        </TR>  
        <TR>
          <TD COLSPAN="8"><IMG HEIGHT="5" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>                  
        <TR>
          <TD WIDTH="10" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"/></TD>
          <TD WIDTH="10%" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statTextBig">Rank</TD>        
          <TD WIDTH="10" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"/></TD>
          <TD WIDTH="30%" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" HEIGHT="18"><IMG HEIGHT="1" WIDTH="45" SRC="/i/clear.gif"/></TD>
          <TD WIDTH="40%" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statTextBig">Handle</TD>
          <TD WIDTH="3%" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG WIDTH="3" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" BGCOLOR="#093158" WIDTH="10%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statTextBig">&#160;Final Points</TD>
          <TD WIDTH="10" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="8" WIDTH="1"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <xsl:choose>
          <xsl:when test="number($division)=2">
            <xsl:for-each select="/TC/HOME/Div2TopScorers/Coder">
              <TR>
              </TR>
              <TR>
                <TD COLSPAN="8" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
              </TR>
              <TR>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD ALIGN="left" CLASS="statText"><xsl:value-of select="rank"/></TD>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD ALIGN="left" CLASS="statText">
                  <A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_room_stats&amp;cr=<xsl:value-of select="coder_id"/>&amp;rd=<xsl:value-of select="round_id"/>&amp;rm=<xsl:value-of select="room_id"/></xsl:attribute><xsl:value-of select="room_name"/></A>
                </TD>
                <TD align="left" CLASS="statText">
                  <A CLASS="statText">
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
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
            <xsl:for-each select="/TC/HOME/Div1TopScorers/Coder">
              <TR>
              </TR>
              <TR>
                <TD COLSPAN="8" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
              </TR>
              <TR>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD ALIGN="left" CLASS="statText"><xsl:value-of select="rank"/></TD>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD ALIGN="left" CLASS="statText">
                  <A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_room_stats&amp;cr=<xsl:value-of select="coder_id"/>&amp;rd=<xsl:value-of select="round_id"/>&amp;rm=<xsl:value-of select="room_id"/></xsl:attribute><xsl:value-of select="room_name"/></A>
                </TD>
                <TD align="left" CLASS="statText">
                  <A CLASS="statText">
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
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
        <TD COLSPAN="8" ALIGN="right" CLASS="statText" HEIGHT="13">
          <IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/>
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_stats</xsl:attribute>
            all last match results
          </A>&#160;&#160;
        </TD>
      </TR>
      <TR>
        <TD COLSPAN="8" WIDTH="1"><IMG HEIGHT="10" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>  
    </TABLE>  
  </xsl:template>
</xsl:stylesheet>


