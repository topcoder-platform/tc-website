<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="ScrollLinks">
    <xsl:param name="ShowPrev"></xsl:param>
    <xsl:param name="PrevLink"></xsl:param>
    <xsl:param name="ShowNext"></xsl:param>
    <xsl:param name="NextLink"></xsl:param>
    <xsl:choose>
      <xsl:when test="$ShowPrev='true'">
          <a><xsl:attribute name="HREF"><xsl:value-of select="$PrevLink"/></xsl:attribute>
               <xsl:attribute name="CLASS">statText</xsl:attribute>&lt;&lt; previous
           </a>
       </xsl:when>
       <xsl:otherwise>
           &lt;&lt; previous
       </xsl:otherwise>
     </xsl:choose>
     &#160;&#160;|&#160;&#160;
     <xsl:choose>
       <xsl:when test="$ShowNext='true'">
           <a><xsl:attribute name="href"><xsl:value-of select="$NextLink"/></xsl:attribute>
               <xsl:attribute name="CLASS">statText</xsl:attribute>next &gt;&gt;
           </a>
       </xsl:when>
       <xsl:otherwise>
           next&gt;&gt;
       </xsl:otherwise>
     </xsl:choose>

  </xsl:template>

</xsl:stylesheet>

