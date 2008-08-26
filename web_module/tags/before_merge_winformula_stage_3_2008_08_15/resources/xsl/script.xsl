<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="CSS">
      <script language="JavaScript" type="text/javascript" src="/js/tcscript.js"></script>
  </xsl:template>

    <xsl:template name="JS">
        <script language="JavaScript" type="text/javascript" src="/js/tcscript.js"></script>
    </xsl:template>


  <xsl:template name="DateTime"><xsl:value-of select="/TC/Today"/></xsl:template>


  <xsl:template name="Preload">
    <script language="JavaScript" type="text/javascript" src="/js/tcscript.js"></script>
  </xsl:template>
</xsl:stylesheet>
