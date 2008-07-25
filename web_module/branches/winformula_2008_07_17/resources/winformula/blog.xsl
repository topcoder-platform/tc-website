<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
     <br/>
     <xsl:apply-templates select="rss/channel"/>
     <br/>
  </xsl:template>
  
  <xsl:template match="rss/channel">
           <a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a>
           <br/>
       <xsl:apply-templates select="item"/>
       <br/>
  </xsl:template>
  
  <xsl:template match="item">
            <b><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a></b>
            <br/>
            <xsl:value-of select="description" disable-output-escaping="yes"/><br/>
  </xsl:template>
</xsl:stylesheet>