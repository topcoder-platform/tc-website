<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">




<xsl:template name="ArenaApplet">
  <xsl:param name="host"></xsl:param>
  <xsl:param name="port"></xsl:param>
  <xsl:param name="tunnel"></xsl:param>
  <xsl:param name="companyName"></xsl:param>
  <OBJECT>
    <xsl:attribute name="classid">clsid:8AD9C840-044E-11D1-B3E9-00805F499D93</xsl:attribute>
    <xsl:attribute name="width">239</xsl:attribute>
    <xsl:attribute name="height">26</xsl:attribute>
    <xsl:attribute name="name">LaunchApplet</xsl:attribute>
    <xsl:attribute name="align">middle</xsl:attribute>
    <xsl:attribute name="vspace">0</xsl:attribute>
    <xsl:attribute name="hspace">0</xsl:attribute>
    <xsl:choose>
      <xsl:when test="contains(/TC/Browser/AppName, 'Netscape')">">
        <xsl:attribute name="codebase">http://java.sun.com/j2se/1.3/jre/index.html</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="codebase">http://java.sun.com/products/plugin/1.3/jinstall-13-win32.cab#Version=1,3,0,0</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <PARAM name="name" value="LaunchApplet"/>
    <PARAM name="code" value="com.topcoder.client.contestApplet.LaunchApplet.class"/>
    <PARAM name="codebase">
      <xsl:attribute name="value">/contest/classes</xsl:attribute>
    </PARAM>
    <PARAM name="archive" value="ContestApplet.jar"/>
    <PARAM name="type" value="application/x-java-applet;version=1.3"/>
    <PARAM name="scriptable" value="false"/>
    <PARAM name="host"><xsl:attribute name="value"><xsl:value-of select="$host"/></xsl:attribute></PARAM>
    <PARAM name="port"><xsl:attribute name="value"><xsl:value-of select="$port"/></xsl:attribute></PARAM>
    <PARAM name="tunnel"><xsl:attribute name="value"><xsl:value-of select="$tunnel"/></xsl:attribute></PARAM>
    <PARAM name="companyName"><xsl:attribute name="value"><xsl:value-of select="$companyName"/></xsl:attribute></PARAM>
    <EMBED>
      <xsl:attribute name="type">application/x-java-applet;version=1.3</xsl:attribute>
      <xsl:attribute name="code">com.topcoder.client.contestApplet.LaunchApplet.class</xsl:attribute>
      <xsl:attribute name="codebase">/contest/classes</xsl:attribute>
      <xsl:attribute name="name">LaunchApplet</xsl:attribute>
      <xsl:attribute name="archive">ContestApplet.jar</xsl:attribute>
      <xsl:attribute name="host"><xsl:value-of select="$host"/></xsl:attribute>
      <xsl:attribute name="port"><xsl:value-of select="$port"/></xsl:attribute>
      <xsl:attribute name="tunnel"><xsl:value-of select="$tunnel"/></xsl:attribute>
      <xsl:attribute name="companyName"><xsl:value-of select="$companyName"/></xsl:attribute>
      <xsl:attribute name="width">239</xsl:attribute>
      <xsl:attribute name="height">26</xsl:attribute>
      <xsl:attribute name="align">middle</xsl:attribute>
      <xsl:attribute name="vspace">0</xsl:attribute>
      <xsl:attribute name="hspace">0</xsl:attribute>
      <xsl:attribute name="scriptable">false</xsl:attribute>
      <xsl:attribute name="pluginspage">http://java.sun.com/j2se/1.3/jre/index.html</xsl:attribute>
      <NOEMBED></NOEMBED>
    </EMBED>
  </OBJECT>
</xsl:template>




</xsl:stylesheet>
