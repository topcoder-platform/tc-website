<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../menu.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">
  <html>
    <head>
      <title>Choose a Coder</title>
    </head>
    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
      <xsl:call-template name="Top"/>
      <xsl:call-template name="Menu"/>
      <center>
        <table border="1">
          <tr>
            <td colspan="3">
              <b>
                <small>
                  Choose a Coder
                </small>
              </b>
            </td>
          </tr>
          <tr>
            <td><b><small>Coder Id</small></b></td>
            <td><b><small>Handle</small></b></td>
          </tr>
          <xsl:for-each select="/TC/COMPILATION/Coder">
            <xsl:sort select="Handle" order="ascending"/>
            <tr>
              <td>
                <a>
                  <xsl:attribute name="href">/admin/contest?module=Challenge&amp;Command=get_problems&amp;RoundId=<xsl:value-of select="../RoundId"/>&amp;CoderId=<xsl:value-of select="CoderId"/></xsl:attribute>
                  <xsl:value-of select="CoderId"/>
                </a>
              </td>
              <td><xsl:value-of select="Handle"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </center>
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
