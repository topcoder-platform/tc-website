<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../top.xsl"/>
<xsl:import href="../menu.xsl"/>
<xsl:import href="../form.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
<xsl:template match="/">
  <html>
    <head>
      <title>Internal Error</title>
    </head>
    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">


      <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td>
            <xsl:call-template name="Top"/>
            <xsl:call-template name="NavForm"/>
            <xsl:call-template name="Menu"/>
          </td>
        </tr>
        <tr>
          <td>
            <b>Internal Error</b>
          </td>
        </tr>
      </table>


    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
