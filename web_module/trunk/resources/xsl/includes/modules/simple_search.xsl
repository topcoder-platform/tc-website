<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="simple_search">
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" WIDTH="170">
                <TR> 
                  <TD CLASS="moduleTitle" BGCOLOR="#990000" HEIGHT="17" VALIGN="middle"><IMG SRC="/i/label_login.gif" ALT="Member Search" WIDTH="170" HEIGHT="17" VSPACE="3" BORDER="0"/></TD>
                </TR>            
            <TR> 
                <TD BGCOLOR="#43515E" VALIGN="top"> 
                  <TABLE BGCOLOR="#990000" WIDTH="170" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                      <TR> 
                        <TD CLASS="data" BGCOLOR="#990000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="statText"  BGCOLOR="#990000" VALIGN="top">
                          <FORM NAME="searchForm" METHOD="post" > 
                            <xsl:attribute name="action">http://<xsl:value-of select="/TC/Host"/></xsl:attribute>
                            <INPUT TYPE="hidden" NAME="t" VALUE="search"/>
                            <INPUT TYPE="hidden" NAME="c" VALUE="simple_search"/>
                          <INPUT TYPE="text" NAME="SearchHandle" SIZE="15" MAXLENGTH="20" />
                          <A HREF="javascript:submitSearch()"><xsl:attribute name="CLASS">statText</xsl:attribute>&#160;[ submit ]</A>
                          </FORM>
                        </TD>
                        <TD CLASS="data" BGCOLOR="#990000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
                      </TR>
                      <TR> 
                        <TD BGCOLOR="#990000" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                      </TR>
                  </TABLE>
                </TD>
            </TR>           
          </TABLE>
  </xsl:template>
</xsl:stylesheet>
