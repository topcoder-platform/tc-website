<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="tournament_invit02_links">
	<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
	  <TR><TD COLSPAN="4"><DIV ALIGN="center"><A HREF="/index?t=tournaments&amp;c=invit02_sched"><IMG SRC="/i/invit02_logob.gif" ALT="" WIDTH="155" HEIGHT="105" VSPACE="5" BORDER="0"/></A></DIV></TD></TR>  
      <TR>
        <TD COLSPAN="4" ALIGN="center" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;INVITATIONAL FEATURES</TD>
      </TR>                    						
	  <TR>
		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" >
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_spons'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
		<A HREF="/index?t=schedule&amp;c=tourny_spons" CLASS="statTextBig">Sponsor</A></TD> -->
		<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_regions_ne'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_se'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_w'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_mw'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_ne32'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_se32'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_w32'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_mw32'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_ne128'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_se128'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_w128'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='tourny_regions_mw128'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<FONT COLOR="#999999">Round Updates</FONT></TD>
		<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='invit02_sched'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/index?t=tournaments&amp;c=invit02_sched" CLASS="statTextBig">Schedule</A></TD>
		<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_rules_overview'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_overview'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_scoring'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_conditions'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_prizes'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_onsite'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_structure'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>	
		<A HREF="/index?t=tournaments&amp;c=invit02_rules_overview" CLASS="statTextBig">Rules</A></TD>
		<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='nopage'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
                     <FONT COLOR="#999999">Sign Up</FONT></TD>
	  </TR>
    </TABLE>
</xsl:template>
</xsl:stylesheet>
