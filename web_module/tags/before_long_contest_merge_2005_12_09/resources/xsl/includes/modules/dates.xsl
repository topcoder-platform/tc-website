<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template name="dates">
        <xsl:param name="class"></xsl:param>
        <xsl:for-each select="/TC/HOME/Rounds/Round[position()=1]">
            <xsl:sort data-type="number" select="substring(RoundSegments/RoundSegment[SegmentId='1']/Start,7,4)"/>
            <xsl:sort data-type="number" select="substring(RoundSegments/RoundSegment[SegmentId='1']/Start,1,2)"/>
            <xsl:sort data-type="number" select="substring(RoundSegments/RoundSegment[SegmentId='1']/Start,4,2)"/>
                <tr valign="top"> 
                    <td id="leftDate">
                        <A class="left">
                        <xsl:attribute name="href">http://<xsl:value-of select="/TC/Host"/>/?&amp;RoundId=<xsl:value-of select="RoundId"/>&amp;t=schedule&amp;c=srm</xsl:attribute>
                        <strong><xsl:value-of select="substring(RoundSegments/RoundSegment[SegmentId='1']/Start,0,11)"/></strong><br/>
                        Register:&#160;
                        <xsl:value-of select="format-number(RoundSegments/RoundSegment[SegmentId='1']/StartHour,'##')"/>:<xsl:value-of select="RoundSegments/RoundSegment[SegmentId='1']/StartMinute"/>&#160;<xsl:value-of select="RoundSegments/RoundSegment[SegmentId='1']/StartAMPM"/><br/>
                        Compete:&#160;
                        <xsl:value-of select="format-number(RoundSegments/RoundSegment[SegmentId='2']/StartHour,'##')"/>:<xsl:value-of select="RoundSegments/RoundSegment[SegmentId='2']/StartMinute"/>&#160;<xsl:value-of select="RoundSegments/RoundSegment[SegmentId='2']/StartAMPM"/><br/>
                        </A>
                    </td>
                </tr>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
