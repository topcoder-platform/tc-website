<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="dates">
    <xsl:for-each select="/TC/HOME/Contests/Contest[ContestId!='1000' and ContestId!='1080' and ContestId!='65' and ContestId!='66' and ContestId!='67' and position()=1]">
      <xsl:sort data-type="number" select="substring(ContestStartTimestamp,7,4)"/>
      <xsl:sort data-type="number" select="substring(ContestStartTimestamp,1,2)"/>
      <xsl:sort data-type="number" select="substring(ContestStartTimestamp,4,2)"/>
      <xsl:variable name="start_hr">
        <xsl:value-of select="number(substring(ContestStartTimestamp,12,2))"/>
      </xsl:variable>
      <xsl:variable name="start_min">
        <xsl:value-of select="substring(ContestStartTimestamp,15,2)"/>
      </xsl:variable>
      <xsl:variable name="am_pm">
        <xsl:value-of select="substring(ContestStartTimestamp,21,2)"/>
      </xsl:variable>
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
              <xsl:when test="ContestId='64' or ContestId='68'">
                <xsl:attribute name="href">/?t=schedule&amp;c=tourny_sched</xsl:attribute>
              </xsl:when>
              <xsl:otherwise>
                <xsl:attribute name="href">/?ContestId=<xsl:value-of select="ContestId"/>&amp;t=schedule&amp;c=srm</xsl:attribute>
              </xsl:otherwise>
            </xsl:choose>
            <xsl:choose>
              <xsl:when test="ContestId='64'">
                <b>Sun Microsystems TopCoder Collegiate Challenge Semifinals</b><br/>
                <b>04/19/2002</b><br/>
              </xsl:when>
              <xsl:when test="ContestId='68'">
                <b>Sun Microsystems TopCoder Collegiate Challenge Championship</b><br/>
                <b>04/20/2002</b><br/>
              </xsl:when>
              <xsl:when test="ContestId='4130'">
                <b>04/22/2002</b><br/>
                Register: 6:30 PM<br/>
                Compete: 8:00 PM<br/>
              </xsl:when>
              <xsl:when test="ContestId='4135'">
                <b>04/24/2002</b><br/>
                Register: 7:30 PM<br/>
                Compete: 9:00 PM<br/>
              </xsl:when>
              <xsl:when test="ContestId='4165'">
                <b>05/18/2002</b><br/>
                Register: 11:30 AM<br/>
                Compete: 1:00 PM<br/>
              </xsl:when>
              <xsl:otherwise>
                <b><xsl:value-of select="substring(ContestStartTimestamp,0,11)"/></b><br/>
                Register:&#160;
                <xsl:value-of select="$start_hr"/>:<xsl:value-of select="$start_min"/>&#160;<xsl:value-of select="$am_pm"/><br/>
                Compete:&#160;
                <xsl:value-of select="number($start_hr)+2"/>:<xsl:value-of select="format-number(number($start_min)-30,'00')"/>&#160;<xsl:value-of select="$am_pm"/><br/>
              </xsl:otherwise>
            </xsl:choose>
          </A>
        </TD>
      </TR>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
