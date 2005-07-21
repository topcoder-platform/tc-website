<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" media-type="text/rtf"/>
<xsl:template match="/">

Wecome to TopCoder Software!

To activate your new account just follow the following link:

<xsl:value-of select="activationEmail/url"/>

Best,
The TopCoder Software Team
</xsl:template>
</xsl:stylesheet>