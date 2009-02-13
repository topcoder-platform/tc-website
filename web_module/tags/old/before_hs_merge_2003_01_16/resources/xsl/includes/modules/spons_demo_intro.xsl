<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="spons_demo_pulldown.xsl"/>
  <xsl:template name="spons_demo_intro">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
	<TR>        
        <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>				
	</TR>	
	<TR>
        <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>	
		<TD CLASS="statText" VALIGN="middle" WIDTH="100%">
<P CLASS="bodyText">
For more information about sponsorship packages, please contact:<BR/>
<A HREF="mailto:sponsorships@topcoder.com" CLASS="bodyText">TopCoder Sponsor Sales</A>
</P>
		</TD>
		<TD CLASS="statText" VALIGN="top" WIDTH="20"><IMG SRC="/i/clear.gif" WIDTH="20" HEIGHT="1" BORDER="0"/></TD>
 		<TD VALIGN="top" WIDTH="170">		
    <!-- Quick Stat Pulldown Begins -->
        <xsl:call-template name="spons_demo_pulldown"/>
    <!-- Quick Stat Pulldown Ends -->	
		</TD>       
        <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>				
	</TR>	
</TABLE>
  </xsl:template>
</xsl:stylesheet>
