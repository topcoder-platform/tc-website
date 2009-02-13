<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="dates.xsl"/>
  <xsl:template name="srm_dates">
            <table border="0" cellspacing="0" cellpadding="0" valign="top" width="100%" bgcolor="#222222">
                <tr> 
                    <td valign="top"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
                    <td valign="middle" height="18" class="statTextBig">Next Match:</td>
                    <td valign="top"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
                </tr>
            </table>
            
            <table width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#000000"> 
                <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="3" border="0"/></td></tr>

                <xsl:call-template name="dates">
                    <xsl:with-param name="class">statText</xsl:with-param>
                </xsl:call-template>
                
                <tr><td colspan="2"><img src="/i/clear.gif" width="1" height="3" border="0"/></td></tr>
            </table>
  </xsl:template>
</xsl:stylesheet>
