<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../menu.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">
  <html>
    <head>
      <title>Day by Day Registration Report</title>
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
                  Day By Day Registration 
                  <xsl:if test="/TC/After">
                    starting <xsl:value-of select="/TC/After"/>
                  </xsl:if>
                </small>
              </b>
            </td>
          </tr>
          <tr>
            <td><b><small>Day</small></b></td>
            <td><b><small>Registered</small></b></td>
            <td><b><small>Activated</small></b></td>
          </tr>
          <xsl:for-each select="/TC/DayRegs/DayReg">
            <tr>
              <td><xsl:value-of select="MemberSince"/></td>
              <td><xsl:value-of select="Registered"/></td>
              <td><xsl:value-of select="Activated"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </center>
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
