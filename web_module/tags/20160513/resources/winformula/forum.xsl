<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:jf="http://www.jivesoftware.com/xmlns/jiveforums/rss">
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
            <li class="dottedBottom"><a><xsl:attribute name="href">http://winningformula.espn.com/forums?module=Message&amp;messageID=<xsl:value-of select="substring-before(substring-after(link,'messageID='), '&amp;')" /></xsl:attribute><span style="font-size:14px;"><xsl:value-of select="title"/></span></a><br />
            <em>by <xsl:value-of select="jf:author" /> on <xsl:value-of select="substring-before(jf:creationDate,'-')" /></em>
            <span style="font-size:12px;"><xsl:value-of select="description" disable-output-escaping="yes"/></span><br/>
            </li>
  </xsl:template>
</xsl:stylesheet>
