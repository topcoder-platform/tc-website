<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="arena"> 

            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tr><td class="bodyText" valign="middle" height="13"><font size="2" color="#000000" face="Arial, Helvetica, Sans-serif"><strong>Java Web Start</strong></font></td></tr>                      
                <tr> 
                    <td class="bodyText" bgcolor="#FFFFFF" valign="bottom"> 
                        Run the Arena as a <a href="http://java.sun.com/products/javawebstart/index.html" target="_blank" class="bodyGeneric">Java Web Start Application</a><br/>
                        JWS already installed? Load the Arena as a <a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/contest/arena/ContestAppletProd.jnlp</xsl:attribute>Java Application</a><br/>
                        <a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=arena&amp;c=plugins</xsl:attribute>Arena Plugins</a>&#151;Information and Downloads
                    </td>
                </tr>
            </table>

</xsl:template>
</xsl:stylesheet>
