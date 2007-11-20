<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="dates.xsl"/>
  <xsl:template name="srm_dates">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td id="leftNavTitle">Next Match:</td></tr>

                <xsl:call-template name="dates">
                    <xsl:with-param name="class">leftDate</xsl:with-param>
                </xsl:call-template>
                
            </table>
  </xsl:template>
</xsl:stylesheet>
