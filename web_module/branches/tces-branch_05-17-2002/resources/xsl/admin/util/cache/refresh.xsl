<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../../menu.xsl"/>
<xsl:import href="../../top.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">
  <html>
    <head>
      <title>Admin Refresh Cache</title>
    </head>
    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
      <xsl:call-template name="Top"/>
      <xsl:call-template name="Menu"/>
      <table>
        <xsl:for-each select="/TC/args">
          <tr><td><b><xsl:value-of select="."/> cache refreshed.</b></td></tr>
        </xsl:for-each>
      </table>
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
