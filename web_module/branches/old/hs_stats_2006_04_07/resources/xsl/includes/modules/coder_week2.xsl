<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- <xsl:import href="coder_week_pulldown.xsl"/> -->  
  <xsl:template name="coder_week">
          <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">
            <TR> 
                <TD COLSPAN="4" VALIGN="bottom">
                  <A>
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=coder_of_week</xsl:attribute>
                    <IMG SRC="/i/label_coderofweek.gif" ALT="Coder of the Week" WIDTH="180" HEIGHT="26" BORDER="0"/>
                  </A>
    <!-- Coder of the Week Pulldown Begins -->        
        <!-- <xsl:call-template name="coder_week_pulldown"/> --> 
  <!-- Coder of the Week Pulldown Ends -->                
                </TD>           
            </TR>
            <TR> 
                <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
                <TD WIDTH="73" ROWSPAN="4" VALIGN="top"><IMG SRC="/i/m/SnapDragon_mug.gif" ALT="Coder of the Week" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="3"/></TD>
                <TD WIDTH="100%" CLASS="bodyTextBold" HEIGHT="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR> 
                <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
                <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="registerNav" VALIGN="middle" HEIGHT="14">&#160;&#160;June 3 - 9, 2002</TD>
            <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR> 
                <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
                <TD HEIGHT="65" VALIGN="top" CLASS="statText">
                  <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="3" HEIGHT="40">
                      <TR> 
                        <TD VALIGN="top" CLASS="bodyText" HEIGHT="53" WIDTH="50%">
                  Handle:<BR/>
                  Rating:<BR/>
                  Member&#160;Since:<BR/>
                  Competitions:<BR/></TD>
                          <TD CLASS="bodyText" HEIGHT="53" WIDTH="50%" ALIGN="right" VALIGN="top" NOWRAP="">

                   SnapDragon<BR/>
                   3005<BR/>
                  March&#160;17,&#160;2002<BR/>
                  17<BR/></TD>
                      </TR>
            <TR> 
                <TD COLSPAN="2" CLASS="bodyText" VALIGN="top">
                  <A CLASS="bodyGeneric">
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=coder_of_week</xsl:attribute>
                    Click here
                  </A> to read about 
                  <A CLASS="bodyGeneric">
                    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=coder_of_week</xsl:attribute>
                    SnapDragon
                  </A>, who became just the second member to reach the 3000 rating point mark.          
               </TD>
            </TR>                                            
                  </TABLE>
                </TD>
                <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
            </TR>                       
             <TR> 
                <TD COLSPAN="4" HEIGHT="10"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
            </TR>
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="2" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>    
  </TR>            
          </TABLE>
  </xsl:template>
</xsl:stylesheet>
