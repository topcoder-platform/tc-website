<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template name="BodyRight">
  <xsl:choose>
    <xsl:when test="/TC/LoggedIn='true'">
      <!-- Logged In Top -->
    </xsl:when>
    <xsl:otherwise>
      <!-- Logged Out Top -->
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>



