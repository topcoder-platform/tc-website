<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">



<xsl:import href="../menu.xsl"/>

<xsl:import href="../top.xsl"/>

<xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>



<xsl:template match="/">

  <html>

    <head>

      <title>Choose a Round</title>

    </head>

    <body marginwidth="0" marginheight="0" topmargin="0" leftmargin="0">

      <xsl:call-template name="Top"/>

      <xsl:call-template name="Menu"/>

      <center>

        <font size="8">dok's tool</font>

        <br/>

        <small>use it wisely</small>

        <br/>

        <br/>

        <table border="1">

          <tr>

            <td colspan="3">

              <b>

                <small>

                  Choose a Round 

                </small>

              </b>

            </td>

          </tr>

          <tr>

            <td><b><small>Round Id</small></b></td>

            <td><b><small>Contest</small></b></td>

            <td><b><small>Round</small></b></td>

          </tr>

          <xsl:for-each select="/TC/COMPILATION/Round">

            <tr>

              <td>

                <a>

                  <xsl:attribute name="href">/admin/?Task=compilation&amp;Command=get_coders&amp;RoundId=<xsl:value-of select="RoundId"/></xsl:attribute>

                  <xsl:value-of select="RoundId"/>

                </a>

              </td>

              <td><xsl:value-of select="ContestName"/></td>

              <td><xsl:value-of select="RoundName"/></td>

            </tr>

          </xsl:for-each>

        </table>

      </center>

    </body>

  </html>

</xsl:template>





</xsl:stylesheet>

