<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="top_10_schools">
      <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" BGCOLOR="#001935">
                 <TR> 
                <TD BACKGROUND="/i/steel_gray_bg.gif"> 
                  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BACKGROUND="/i/steel_darkblue_bg.gif" BGCOLOR="#001935">
                      <TR BGCOLOR="#000033">
                        <TD BACKGROUND="/i/steel_darkblue_bg.gif" ROWSPAN="16" WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                        <TD BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="1"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="60%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="40%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif" ROWSPAN="16" WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
              </TR> 
              <TR>
                <TD CLASS="statTextBig" VALIGN="middle" ALIGN="center" COLSPAN="3" HEIGHT="16">&#160;Schools</TD>                    
              </TR>                           
              <TR>
                <TD CLASS="statTextBig" VALIGN="middle" HEIGHT="13" ALIGN="right">Rank&#160;&#160;</TD>  
                <TD CLASS="statTextBig" VALIGN="middle">&#160;&#160;Name</TD>
                <TD CLASS="statTextBig" VALIGN="middle" ALIGN="right">Rating&#160;&#160;</TD>                  
              </TR>              
              <TR>
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
              </TR>                             
              <xsl:for-each select="/TC/HOME/TopRankedSchools/School">
                <TR>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right" HEIGHT="12"><xsl:value-of select="rank"/>.&#160;&#160;</TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">&#160;<xsl:value-of select="name"/></TD>
                  <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><xsl:value-of select="avg_rating"/>&#160;&#160;</TD>               
                </TR>             
              </xsl:for-each>                     
              <TR> 
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
              </TR>              
          </TABLE>
          
                  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BACKGROUND="/i/steel_darkblue_bg.gif" BGCOLOR="#001935">
                      <TR BGCOLOR="#000033">
                        <TD BACKGROUND="/i/steel_darkblue_bg.gif" ROWSPAN="16" WIDTH="8"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                        <TD BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="60%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="40%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                                <TD BACKGROUND="/i/steel_darkblue_bg.gif" ROWSPAN="16" WIDTH="15"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
              </TR> 
              <TR> 
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
              </TR>                       
              <TR> 
                <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
              </TR>              
          </TABLE>          
        </TD>
    </TR>
  </TABLE>
  </xsl:template>
</xsl:stylesheet>
