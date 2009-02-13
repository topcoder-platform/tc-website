<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template name="formatmmddyyyy">
		<xsl:param name="DATE"/>
		<xsl:if test='boolean($DATE)'>
			<xsl:value-of select="substring($DATE, 6,2)"/>.<xsl:value-of select="substring($DATE, 9,2)"/>.<xsl:value-of select="substring($DATE, 1,4)"/>
		</xsl:if>
    </xsl:template>
    <xsl:template name="urldate">
        <!--MM&#47;DD&#47;YYYY-->
		<xsl:param name="DATE"/>
		<xsl:if test='boolean($DATE)'>
			<xsl:value-of select="substring($DATE, 6,2)"/>%2e<xsl:value-of select="substring($DATE, 9,2)"/>%2e<xsl:value-of select="substring($DATE, 1,4)"/>
		</xsl:if>
    </xsl:template>

    <xsl:template name="public_dev_right">
    <xsl:param name="projects"/>

<!-- Declare universal variables -->
                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="design-phase" select="'112'" />
                <xsl:variable name="dev-phase" select="'113'" />
                <xsl:variable name="priceFormat" select="'$###,###.00'" />
                <xsl:variable name="status_id" select="'301'" />
<!-- Declaration ends -->

<div class="devRightSpacer">
            <table width="170" border="0" cellspacing="0" cellpadding="5">
                <tr valign="top">
                    <td width="100%">
                    	<a href="/tc?module=Static&amp;d1=dev&amp;d2=usdc_overview"><img src="/i/promos/usdc_promo_small.gif" width="170" height="150" border="0"/></a><br/>
                    	<img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
                        <a href="/index?t=development&amp;c=components"><img src="/i/development/winners_promo.gif" border="0"/></a>
                    </td>
                </tr>
                <tr valign="top">
                    <td width="100%" class="smallText">
                        <p>Read the Component <a href="/index?t=development&amp;c=comp_meth">Methodology</a> before submitting a Component design or development solution.</p>
                        <p><strong>Not sure what to submit?</strong> Go to Component <A href="/index?t=development&amp;c=tcs_sample_docs">Documentation and Sample Submissions</A>.</p>
                    </td>
                </tr>
            </table>
</div>

           <p><br/></p>

    </xsl:template>
</xsl:stylesheet>
