<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/module_login.xsl"/>
  <xsl:template name="global_left">
    <xsl:choose>
      <xsl:when test="/TC/task='public_home'">
         <xsl:call-template name="module_login"/>
      </xsl:when>                  
      <xsl:otherwise>
         Invalid task. 
      </xsl:otherwise>
    </xsl:choose> 
  </xsl:template>
</xsl:stylesheet>
