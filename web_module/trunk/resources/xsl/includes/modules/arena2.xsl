<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="arena"> 

            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                <tr><td class="bodyText" valign="middle" height="13"><font size="2" color="#000000" face="tahoma, verdana"><b>Java Web Start</b></font></td></tr>                      
                <tr> 
                    <td class="bodyText" bgcolor="#FFFFFF" valign="bottom"> 
                        <a href="http://java.sun.com/products/javawebstart/index.html" target="_blank" class="bodyGeneric">Run the Arena as a Java Web Start Application</a><br/>
                        JWS already installed? 
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/contest/arena/ContestAppletProd.jnlp</xsl:attribute>Load the Arena as a Java application</a><br/>
                        <a class="bodyGeneric">
                        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=arena&amp;c=plugins</xsl:attribute>Arena Plugins - information and downloads</a>
                    </td>
                </tr>
            </table>

</xsl:template>
</xsl:stylesheet>
