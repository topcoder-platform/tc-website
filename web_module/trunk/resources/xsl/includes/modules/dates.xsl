<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="dates">
    <xsl:for-each select="/TC/HOME/Rounds/Round[RoundId!='1000' and RoundId!='1080' and position()=1]">
    <!--<xsl:for-each select="/TC/HOME/Rounds/Round[number(RoundId)>4155]">-->
    <!--<xsl:for-each select="/TC/HOME/Rounds/Round[position()=1]">-->
      <xsl:sort data-type="number" select="substring(RoundSegments/RoundSegment[SegmentId='1']/Start,7,4)"/>
      <xsl:sort data-type="number" select="substring(RoundSegments/RoundSegment[SegmentId='1']/Start,1,2)"/>
      <xsl:sort data-type="number" select="substring(RoundSegments/RoundSegment[SegmentId='1']/Start,4,2)"/>
      <TR> 
        <TD VALIGN="top">
          <xsl:attribute name="CLASS"><xsl:value-of select="$class"/></xsl:attribute>
          <xsl:if test="$class='statText'">&#160;<IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/></xsl:if>
        </TD>
        <TD>
          <xsl:attribute name="CLASS"><xsl:value-of select="$class"/></xsl:attribute>
          <A>
            <xsl:attribute name="CLASS"><xsl:value-of select="$class"/></xsl:attribute>
            <xsl:choose>
              <xsl:when test="RoundId='64' or RoundId='68'">
                <xsl:attribute name="href">/?t=schedule&amp;c=tourny_sched</xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="href">/?RoundId=<xsl:value-of select="RoundId"/>&amp;t=schedule&amp;c=srm</xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <b><xsl:value-of select="substring(RoundSegments/RoundSegment[SegmentId='1']/Start,0,11)"/></b><br/>
            Register:&#160;
            <xsl:value-of select="RoundSegments/RoundSegment[SegmentId='1']/StartHour"/>:<xsl:value-of select="RoundSegments/RoundSegment[SegmentId='1']/StartMinute"/>&#160;<xsl:value-of select="RoundSegments/RoundSegment[SegmentId='1']/StartAMPM"/><br/>
            Compete:&#160;
            <xsl:value-of select="RoundSegments/RoundSegment[SegmentId='2']/StartHour"/>:<xsl:value-of select="RoundSegments/RoundSegment[SegmentId='2']/StartMinute"/>&#160;<xsl:value-of select="RoundSegments/RoundSegment[SegmentId='2']/StartAMPM"/><br/>
          </A>
        </TD>
      </TR>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
