<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
           <div class="clear">
                <a href="http://sports.espn.go.com/ncf/index" class="viewButton" title="News" target="_blank"><span>News</span></a>
                <a href="http://scores.espn.go.com/ncf/scoreboard" class="viewButton" title="Scores" target="_blank"><span>Scores</span></a>
                <a href="http://sports.espn.go.com/espn/rss/ncf/news" class="viewButton" title="RSS" target="_blank"><span>RSS</span></a>
           </div>
  </xsl:template>
  
  <xsl:template match="item">
            <li class="dottedBottom"><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><span style="font-size:14px;"><xsl:value-of select="title"/></span></a><br />
            <span style="font-size:12px;"><xsl:value-of select="description" disable-output-escaping="yes"/></span><br/>
            </li>
  </xsl:template>
</xsl:stylesheet>
