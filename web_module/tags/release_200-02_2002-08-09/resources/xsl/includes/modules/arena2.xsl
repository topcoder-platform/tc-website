<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="arena"> 
                  <TABLE WIDTH="100%" BGCOLOR="#FFFFFF" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                  
              <TR> 
                        <TD BGCOLOR="#FFFFFF" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
                      </TR>                       
                       <TR> 
                        <TD BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="bodyText" VALIGN="middle" HEIGHT="13"><FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Java Web Start</B></FONT></TD>
                        <TD BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>                      
                      <TR> 
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="bodyText" BGCOLOR="#FFFFFF" VALIGN="bottom"> 
                         <A HREF="http://java.sun.com/products/javawebstart/index.html" TARGET="_blank" CLASS="bodyGeneric"> Run the Arena as a Java Web Start Application </A><BR/>
                         JWS already installed? 
                         <A CLASS="bodyGeneric">
                           <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/contest/arena/ContestAppletProd.jnlp</xsl:attribute>
                           Load the Arena as a Java application
                         </A><BR/>
                         <A CLASS="bodyGeneric">
                           <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=arena&amp;c=plugins</xsl:attribute>
                           Arena Plugins - information and downloads
                         </A><BR/>
                        </TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>
                    
                       <TR> 
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="moduleText" BGCOLOR="#FFFFFF" VALIGN="bottom"/>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>                      

<xsl:if test="/TC/LoggedIn='true'">
                       <TR>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="bodyText" VALIGN="middle" HEIGHT="13"><B>Arena Source</B></TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>
                       <TR>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="bodyText" BGCOLOR="#FFFFFF" VALIGN="bottom">
                          <A CLASS="bodyGeneric">
                            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=arena&amp;c=source</xsl:attribute>
                            Click here
                          </A> for information.<br/>
                        </TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>
</xsl:if>
                     

 
              <TR> 
                        <TD BGCOLOR="#FFFFFF" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                      </TR>
                  </TABLE>
  </xsl:template>
</xsl:stylesheet>
