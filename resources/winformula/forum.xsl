<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:dc="http://purl.org/dc/elements/1.1/">
  <xsl:template match="/">
     <br/>
     <xsl:apply-templates select="rss/channel"/>
     <br/>
  </xsl:template>
  
  <xsl:template match="rss/channel">
           <ul class="headlines">
               <xsl:apply-templates select="item[1]"/> 
               <xsl:apply-templates select="item[2]"/>
               <xsl:apply-templates select="item[3]"/>   
           </ul>
           <div class="clear"><a class="viewButton" title="View All"><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><span>View All</span></a></div>
  </xsl:template>
  
  <xsl:template match="item">
            <li class="dottedBottom"><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><span style="font-size:14px;"><xsl:value-of select="title"/></span></a><br />
            <em>(by  <xsl:value-of select="dc:creator" /> on <xsl:value-of select="substring-before(pubDate,'-')" /> </em>
                <span style="font-size:12px;">
                <xsl:choose>
                   <xsl:when test="string-length(description) &gt; 200">
                    <xsl:value-of select="substring(description,0,200)" disable-output-escaping="no"/>...
                   </xsl:when>
                   <xsl:otherwise>
                    <xsl:value-of select="description" disable-output-escaping="no"/>
                   </xsl:otherwise>
                 </xsl:choose>
             </span><br/>
            </li>
  </xsl:template>
</xsl:stylesheet>
