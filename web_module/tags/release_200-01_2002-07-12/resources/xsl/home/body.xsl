<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="left.xsl"/>
<xsl:import href="right.xsl"/>

<xsl:template name="Body">
  <xsl:choose>
    <xsl:when test="/TC/LoggedIn='true'">
      <!-- Logged In Body Begin -->
      <!-- Logged In Body End -->
    </xsl:when>
    <xsl:otherwise>
      <!-- Logged Out Body Begin -->
      <xsl:call-template name="Left"/>


      <xsl:call-template name="Right"/>
      <!-- Logged Out Body End -->
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>



