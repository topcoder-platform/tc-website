<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:import href="../modules/tcs_new_projects2.xsl"/>
	<xsl:import href="../modules/my_stats.xsl"/>
	<xsl:template name="public_dev_right">
        <xsl:param name="projects"/>
		<xsl:choose>
			<xsl:when test="/TC/LoggedIn='true'">
				<xsl:call-template name="tcs_new_projects"/>
			</xsl:when>                  
			<xsl:otherwise>
				<xsl:call-template name="tcs_new_projects"><xsl:with-param name="projects" select="$projects"/></xsl:call-template>
			</xsl:otherwise>
		</xsl:choose> 
	</xsl:template>
</xsl:stylesheet>
