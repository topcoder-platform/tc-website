<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template name="arena"> 

            <table width="100%" cellspacing="0" cellpadding="3" border="0">
                <tr valign="middle"><td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Java Web Start</font></td></tr>
                <tr> 
                    <td class="bodyText"> 
                        Run the Arena as a <a class="bodyText" href="http://java.sun.com/products/javawebstart/index.html" target="_blank">Java Web Start Application</a><br/>
                        JWS already installed? Load the Arena as a <a class="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/contest/arena/ContestAppletProd.jnlp</xsl:attribute>Java Application</a><br/>
                        <a class="bodyText"><xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=arena&amp;c=plugins</xsl:attribute>Arena Plugins</a>&#151;Information and Downloads
                    </td>
                </tr>

                <tr><td><img src="/i/clear.gif" alt="" width="1" height="10" border="0" /></td></tr>
            </table>

</xsl:template>
</xsl:stylesheet>
