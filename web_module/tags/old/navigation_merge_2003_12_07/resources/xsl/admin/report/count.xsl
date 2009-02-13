<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../menu.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">
  <html>
    <head>
      <title>Admin Member Count</title>
    </head>
    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
      <xsl:call-template name="Top"/>
      <xsl:call-template name="Menu"/>
      <center>
        <table border="1">
          <tr>
            <td>
              <b>
                <small>
                  Count
                  <xsl:if test="/TC/Before">
                    as of <xsl:value-of select="/TC/Before"/>
                  </xsl:if>
                </small>
              </b>
            </td>
          </tr>
          <tr>
            <td><xsl:value-of select="/TC/MemberCount"/></td>
          </tr>
        </table>
      </center>
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
