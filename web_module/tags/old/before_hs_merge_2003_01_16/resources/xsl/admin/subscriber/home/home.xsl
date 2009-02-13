<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="../tab.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:import href="../form.xsl"/>
<xsl:import href="../foot.xsl"/>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

<xsl:template match="/">
  <html>
    <head>
      <title>Subscriber Admin Home</title>
    </head>
    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
      <xsl:call-template name="Top"/>
      <xsl:call-template name="NavForm"/>
      <table cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td valign="top" align="left">
            <xsl:call-template name="Home_A"/>
            <xsl:call-template name="Request_I"/>
          </td>
        </tr>
      </table> 
      <br/>
      <br/>
      <table>
        <tr>
          <td>Welcome to the Topcoder Subscriber Administrator Utility</td>
        </tr>
      </table>
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
