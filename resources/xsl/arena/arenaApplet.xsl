<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">




<xsl:template name="ArenaApplet">
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
    <PARAM name="type" value="application/x-java-applet;version=1.2"/>
    <PARAM name="scriptable" value="false"/>
    <PARAM name="host" value="www.topcoder.com"/>
    <PARAM name="port" value="5001"/>
    <PARAM name="tunnel" value="http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=5001"/>
    <PARAM name="companyName" value="TopCoder"/>
    <EMBED>
      <xsl:attribute name="type">application/x-java-applet;version=1.2</xsl:attribute>
      <xsl:attribute name="code">com.topcoder.client.contestApplet.LaunchApplet.class</xsl:attribute>
      <xsl:attribute name="codebase">/contest/classes</xsl:attribute>
      <xsl:attribute name="name">LaunchApplet</xsl:attribute>
      <xsl:attribute name="archive">ContestApplet.jar</xsl:attribute>
      <xsl:attribute name="host">www.topcoder.com</xsl:attribute>
      <xsl:attribute name="port">5001</xsl:attribute>
      <xsl:attribute name="tunnel">http://arena2.topcoder.com/servlet/com.topcoder.utilities.HTTPTunnelling.Tunnel?host=listener+port=5001</xsl:attribute>
      <xsl:attribute name="companyName">TopCoder</xsl:attribute>
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
