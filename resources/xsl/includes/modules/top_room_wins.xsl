<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_room_wins">    
    <xsl:param name="division"></xsl:param>
    <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
        <TR>
          <TD COLSPAN="6"><IMG SRC="/i/label_room_winners.gif" HEIGHT="17" WIDTH="166" BORDER="0"/></TD>
        </TR>        
        <TR>
          <TD BGCOLOR="#FFFFFF" COLSPAN="6" WIDTH="100%"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>        
        <TR>
          <TD COLSPAN="6"><IMG HEIGHT="5" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <xsl:choose>
            <xsl:when test="number($division)=2">
              <TD WIDTH="10"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>            
              <TD CLASS="smallFoot" COLSPAN="4">Here is a view of the Top-10 room winners with the highest points from <xsl:value-of select="/TC/HOME/Div2RoomWinners/RoomWinner/contest_name"/>&#160;<xsl:value-of select="/TC/HOME/Div2RoomWinners/RoomWinner/round_name"/></TD>
              <TD WIDTH="10"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </xsl:when>
            <xsl:otherwise>
              <TD WIDTH="10"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>            
              <TD CLASS="smallFoot" COLSPAN="4">Here is a view of the Top-10 room winners with the highest points from <xsl:value-of select="/TC/HOME/Div1RoomWinners/RoomWinner/contest_name"/>&#160;<xsl:value-of select="/TC/HOME/Div1RoomWinners/RoomWinner/round_name"/></TD>
              <TD WIDTH="10"><IMG WIDTH="10" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>            
            </xsl:otherwise>
          </xsl:choose>     
        </TR>  
        <TR>
          <TD COLSPAN="6"><IMG HEIGHT="5" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>                  
        <TR>
          <TD WIDTH="10" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"/></TD>        
          <TD WIDTH="45" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" HEIGHT="18"><IMG HEIGHT="1" WIDTH="45" SRC="/i/clear.gif"/></TD>
          <TD WIDTH="50%" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statTextBig">Handle</TD>
          <TD WIDTH="3" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG WIDTH="3" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
          <TD ALIGN="right" BGCOLOR="#093158" WIDTH="50%" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" CLASS="statTextBig">&#160;Final Points</TD>
          <TD WIDTH="10" BGCOLOR="#093158" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle"><IMG HEIGHT="1" WIDTH="10" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="6" WIDTH="1"><IMG HEIGHT="1" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <xsl:choose>
          <xsl:when test="number($division)=2">
            <xsl:for-each select="/TC/HOME/Div2RoomWinners/RoomWinner">
              <TR>
                <TD BGCOLOR="#093158" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="6" HEIGHT="11" VALIGN="middle" CLASS="smallFoot">&#160;&#160;&#160;<xsl:value-of select="room_name"/></TD>
              </TR>
              <TR>
                <TD COLSPAN="6" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
              </TR>
              <TR>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD align="left" CLASS="statText">
                  <A>
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                      <xsl:attribute name="class">
                        <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                      </xsl:attribute>
                      <xsl:value-of select="handle"/>
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
                <TD BGCOLOR="#093158" BACKGROUND="/i/steel_blue_bg.gif" align="left" COLSPAN="6" HEIGHT="11" VALIGN="middle" CLASS="smallFoot">&#160;&#160;&#160;<xsl:value-of select="room_name"/></TD>
              </TR>
              <TR>
                <TD COLSPAN="6" WIDTH="1"><IMG HEIGHT="2" WIDTH="1" SRC="/i/clear.gif"/></TD>
              </TR>
              <TR>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD><IMG WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
                <TD align="left" CLASS="statText">
                  <A>
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                      <xsl:attribute name="class">
                        <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                      </xsl:attribute>
                      <xsl:value-of select="handle"/>
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
        <TD COLSPAN="6" ALIGN="right" CLASS="statText" HEIGHT="13">
          <IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/>
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_stats</xsl:attribute>
            all last match results
          </A>&#160;&#160;
        </TD>
      </TR>
      <TR>
        <TD COLSPAN="6" WIDTH="1"><IMG HEIGHT="10" WIDTH="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>  
    </TABLE>  
  </xsl:template>

  <xsl:template name="top_3_room_wins">    
      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
        <TR>
          <TD COLSPAN="4" WIDTH="1"><IMG HEIGHT="3" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="registerNav" COLSPAN="4" VALIGN="middle" HEIGHT="14">&#160;&#160;Top-3 room winners from Division-I</TD>
        </TR>        
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR>                
        <TR>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="13">&#160;&#160;Place&#160;&#160;&#160;</TD>  
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" WIDTH="32%">Handle</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Room</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Points</TD>  
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR> 
        <xsl:for-each select="/TC/Div1RoomWinners/RoomWinner">
          <TR>
            <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">&#160;&#160;&#160;<xsl:value-of select="rank"/>&#160;&#160;&#160;</TD>
            <TD CLASS="statText" VALIGN="middle">
              <A>
                <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                  <xsl:attribute name="class">
                    <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                  </xsl:attribute>
                  <xsl:value-of select="handle"/>
              </A>
            </TD>
            <TD CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="room_name"/></TD>
            <TD CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="final_points"/></TD>  
          </TR>    
        </xsl:for-each>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"/></TD>
        </TR>                          
      </TABLE>

     <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
        <TR>
          <TD COLSPAN="4" WIDTH="1"><IMG HEIGHT="3" WIDTH="1" SRC="/i/clear.gif"/></TD>
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="registerNav" COLSPAN="4" VALIGN="middle" HEIGHT="14">&#160;&#160;Top-3 room winners from Division-II</TD>
        </TR>        
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR>      
        <TR>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="13">&#160;&#160;Place&#160;&#160;&#160;</TD>  
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" WIDTH="32%">Handle</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Room</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Points</TD>  
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR>        
        <xsl:for-each select="/TC/Div2RoomWinners/RoomWinner">
          <TR>
            <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">&#160;&#160;&#160;<xsl:value-of select="rank"/>&#160;&#160;&#160;</TD>
            <TD CLASS="statText" VALIGN="middle">
              <A>
                <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                  <xsl:attribute name="class">
                    <xsl:call-template name="GetRatingClass"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                  </xsl:attribute>
                  <xsl:value-of select="handle"/>
              </A>
            </TD>
            <TD CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="room_name"/></TD>
            <TD CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="final_points"/></TD>  
          </TR>    
        </xsl:for-each>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
        </TR>          
      </TABLE> 



  </xsl:template>
</xsl:stylesheet>


