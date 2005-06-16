<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="GetRatingColor">
      <xsl:param name="rating"></xsl:param>
      <xsl:choose>
        <xsl:when test="number($rating)>2199">#ff0000</xsl:when>
        <xsl:when test="number($rating)>1499 and number($rating)&lt;2200">#ffff00</xsl:when>
        <xsl:when test="number($rating)>1199 and number($rating)&lt;1500">#66cccc</xsl:when>
        <xsl:when test="number($rating)>899 and number($rating)&lt;1200">#99ff33</xsl:when>
        <xsl:when test="number($rating)&lt;0900">#cccccc</xsl:when>
      </xsl:choose>
  </xsl:template>

  <xsl:template name="GetRatingClass">
      <xsl:param name="rating"></xsl:param>
      <xsl:choose>
        <xsl:when test="number($rating)>2199">coderTextRed</xsl:when>
        <xsl:when test="number($rating)>1499 and number($rating)&lt;2200">coderTextYellow</xsl:when>
        <xsl:when test="number($rating)>1199 and number($rating)&lt;1500">coderTextBlue</xsl:when>
        <xsl:when test="number($rating)>899 and number($rating)&lt;1200">coderTextGreen</xsl:when>
        <xsl:when test="number($rating)>0 and number($rating)&lt;0900">coderTextGray</xsl:when>
        <xsl:when test="number($rating)&lt;0">coderTextOrange</xsl:when>
        <xsl:otherwise>coderTextWhite</xsl:otherwise>
      </xsl:choose>
  </xsl:template>

    <xsl:template name="GetRatingClassDark">
        <xsl:param name="rating"></xsl:param>
        <xsl:choose>
          <xsl:when test="number($rating)>2199">coderTextRed</xsl:when>
          <xsl:when test="number($rating)>1499 and number($rating)&lt;2200">coderTextYellow</xsl:when>
          <xsl:when test="number($rating)>1199 and number($rating)&lt;1500">coderTextBlue</xsl:when>
          <xsl:when test="number($rating)>899 and number($rating)&lt;1200">coderTextGreen</xsl:when>
          <xsl:when test="number($rating)>0 and number($rating)&lt;0900">coderTextGray</xsl:when>
          <xsl:when test="number($rating)&lt;0">coderTextOrange</xsl:when>
          <xsl:otherwise>coderTextBlack</xsl:otherwise>
        </xsl:choose>
    </xsl:template>


  <xsl:template name="GetRatingToDisplay">
    <xsl:param name="rating"></xsl:param>
    <xsl:choose>
      <xsl:when test="number($rating)=0">NR</xsl:when>
      <xsl:otherwise><xsl:value-of select="$rating"/></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
