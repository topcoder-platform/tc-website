<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../menu.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">
  <html>
    <head>
      <title>Degree Counts</title>
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
                  Degree Counts 
                  <xsl:if test="/TC/Before">
                    before <xsl:value-of select="/TC/Before"/>
                  </xsl:if>
                </small>
              </b>
            </td>
          </tr>
          <tr>
            <td><b><small>Degree</small></b></td>
            <td><b><small>Count</small></b></td>
          </tr>
          <xsl:for-each select="/TC/DegreeCounts/DegreeCount">
            <tr>
              <td><xsl:value-of select="Degree"/></td>
              <td><xsl:value-of select="Count"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </center>
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
