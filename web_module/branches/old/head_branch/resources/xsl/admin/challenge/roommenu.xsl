<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../menu.xsl"/>
<xsl:import href="../top.xsl"/>
<xsl:template match="/">

<html>
<head>
</head>
<body>
      <xsl:call-template name="Top"/>
      <xsl:call-template name="Menu"/>


<TABLE width="100%" cellpadding="0" cellspacing="0" border="0" >
  <tr>
    <td valign="center" align="center">
      <br/><br/>
      <table width="319" cellspacing="0" cellpadding="0" border="5">
        <tr>
          <td align="center" valign="center" width="50" height="20">
            <xsl:text>Round Id</xsl:text>
          </td>
          <td align="center" valign="center" width="250" height="20">
            <xsl:text>Room Id</xsl:text>
          </td>
          <td align="center" valign="center" width="250" height="20">
            <xsl:text>Room Description</xsl:text>
          </td>
         </tr>
         <xsl:for-each select="/TC/CHALLENGE/Contest">
            <tr>
                <td>
                      <xsl:value-of select="RoundId"/>
                </td>
                <td>
                    <A>
                      <xsl:attribute name="HREF">/admin?Task=challenge&amp;Command=getChallengeList&amp;roomid=<xsl:value-of select="RoomId"/>&amp;roundid=<xsl:value-of select="RoundId"/></xsl:attribute>
                      <xsl:value-of select="RoomId"/>
                    </A>
                </td>
                <td>
                    <xsl:value-of select="RoomDesc"/>
                </td>
            </tr>
         </xsl:for-each>
      </table>
    </td>
  </tr>
</TABLE>
</body>

</html>
</xsl:template>
</xsl:stylesheet>
