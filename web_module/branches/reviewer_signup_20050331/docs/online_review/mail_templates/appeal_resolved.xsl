<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	        xmlns:fo="http://www.w3.org/1999/XSL/Format"
		version="1.0" > 
<xsl:output method="text" indent="yes"/>
<xsl:template match="/">
<xsl:for-each select="MAILDATA">
 Your appeal has been resolved for the project <xsl:value-of select="PROJECT_NAME"/>. 
 
Any feedback regarding the project or the process can be directed to service@topcodersoftware.com.

thanks,

</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
