<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
     <br/>
         <xsl:apply-templates select="rss/channel"/>
     <br/>
  </xsl:template>

  <xsl:template match="rss/channel">
           <ul class="headlines">
               <xsl:apply-templates select="item"/>
           </ul>
           <div class="clear"><a class="viewButton" title="View All"><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><span>View All</span></a></div>
  </xsl:template>

  <xsl:template match="item">
            <li class="dottedBottom"><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a><br />
            <xsl:value-of select="description" disable-output-escaping="yes"/><br/>
            </li>
  </xsl:template>
</xsl:stylesheet>