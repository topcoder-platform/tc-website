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
      <title>Subscriber Request Admin</title>
    </head>
    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">
      <xsl:call-template name="Top"/>
      <xsl:call-template name="NavForm"/>
      <table cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td valign="top" align="left">
            <xsl:call-template name="Home_I"/>
            <xsl:call-template name="Request_A"/>
          </td>
        </tr>
      </table> 
      <br/>
      <br/>
      <table width="100%" border="1">
        <tr>
          <td><small><b>Request</b></small></td>
          <td><small><b>Company</b></small></td>
          <td><small><b>Size</b></small></td>
          <td><small><b>First</b></small></td>
          <td><small><b>Middle</b></small></td>
          <td><small><b>Last</b></small></td>
          <td><small><b>Title</b></small></td>
          <td><small><b>Phone</b></small></td>
          <td><small><b>Email</b></small></td>
          <td><small><b>Timestamp</b></small></td>
        </tr>
        <xsl:for-each select="/TC/REQUEST/Requests/SubscriberRequest">
          <tr>
            <td><small><xsl:value-of select="SubscriberRequestId"/></small></td>
            <td><small><xsl:value-of select="CompanyName"/></small></td>
            <td><small><xsl:value-of select="CompanySize"/></small></td>
            <td><small><xsl:value-of select="FirstName"/></small></td>
            <td><small><xsl:value-of select="MiddleName"/></small></td>
            <td><small><xsl:value-of select="LastName"/></small></td>
            <td><small><xsl:value-of select="Title"/></small></td>
            <td><small><xsl:value-of select="Phone"/></small></td>
            <td><small><xsl:value-of select="Email"/></small></td>
            <td><small><xsl:value-of select="Timestamp"/></small></td>
          </tr>
          <tr>
            <td colspan="10"><small><xsl:value-of select="Comment"/><br/><br/></small></td>
          </tr>
        </xsl:for-each>
      </table>
    </body>
  </html>
</xsl:template>


</xsl:stylesheet>
