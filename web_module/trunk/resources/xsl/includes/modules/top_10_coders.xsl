<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_10_coders">
      <TABLE WIDTH="170" BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top">
                 <TR> 
                  <TD VALIGN="middle" BGCOLOR="#666666" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18" CLASS="moduleTitle"><IMG SRC="/i/module_labels_10_coders.gif" ALT="Top 10 Coders" WIDTH="166" HEIGHT="17" BORDER="0"/></TD>
                </TR>           
            <TR> 
                <TD BGCOLOR="#666666" BACKGROUND="/i/steel_gray_bg.gif"> 
                  <TABLE WIDTH="170" BORDER="0" CELLSPACING="0" CELLPADDING="0">
                      <TR BGCOLOR="#000033">
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" ROWSPAN="16" WIDTH="8"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
                        <TD BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif" ROWSPAN="16" WIDTH="8"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
              </TR>              
              <TR BGCOLOR="#000033">
                <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="10" HEIGHT="13">&#160;</TD>  
                <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle">Handle</TD>
                <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right">Rating&#160;&#160;&#160;</TD>  
              </TR>              
              <TR BGCOLOR="#000033">
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
              </TR>                             
              <xsl:for-each select="/TC/HOME/TopRankedCoders/TopRankedCoder">
                <TR BGCOLOR="#000033">
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right" HEIGHT="12"><xsl:value-of select="Rank"/>.&#160;</TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="coderTextRed">
                    <A CLASS="statText">
                      <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
                      <FONT>
                        <xsl:attribute name="color">
                          <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="Rating"/></xsl:with-param></xsl:call-template>
                        </xsl:attribute>
                        <xsl:value-of select="Handle"/>
                      </FONT>
                    </A>
                  </TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><xsl:value-of select="Rating"/>&#160;&#160;&#160;</TD>
                </TR>             
              </xsl:for-each>
              <TR BGCOLOR="#000033"> 
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
              </TR>                       
              <TR BGCOLOR="#000033"> 
                <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="3" HEIGHT="12" ALIGN="right"><IMG SRC="/i/mystats_icon.gif" ALT="" WIDTH="10" HEIGHT="10" BORDER="0" HSPACE="3"/>
                  <A CLASS="statText">
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>
                    all ranked coders
                  </A>&#160;&#160;</TD>
              </TR>                      
              <TR BGCOLOR="#000033"> 
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
              </TR>              
          </TABLE>
        </TD>
    </TR>
  </TABLE>
  </xsl:template>
</xsl:stylesheet>
