<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	        xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version="1.0" > 
<xsl:output method="text" indent="yes"/>
<xsl:template match="/">
<xsl:for-each select="MAILDATA">
component_request_notification

REQUESTOR_NAME  = <xsl:value-of select="REQUESTOR_NAME "/>
COMPONENT_NAME = <xsl:value-of select="COMPONENT_NAME"/>

</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
