<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="quick_stats_pulldown.xsl"/>

  <xsl:template name="stats_intro">
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">	
	<TR>
		<TD ROWSPAN="2" CLASS="statText" VALIGN="top" WIDTH="100%">
<P CLASS="statText">
The following data is available to both members and non-members. 
Members are given a deeper view of statistics as well as the ability 
to review individual member history, submissions, and of course, 
statistics.</P>
		</TD>
		<TD ROWSPAN="2" CLASS="statText" VALIGN="top" WIDTH="20"><IMG SRC="/i/clear.gif" WIDTH="20" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statTextBig" VALIGN="top" WIDTH="170"><B>Quick Stats:</B>
		<IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="1"/><BR/>
		</TD>	
	</TR>
	
	<TR>
		<TD VALIGN="top" WIDTH="170" class="statText">		
    <!-- Quick Stat Pulldown Begins -->
        <xsl:call-template name="quick_stats_pulldown"/>
    <!-- Quick Stat Pulldown Ends -->	
		</TD>
	</TR>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="3">
        <BR/>
        <xsl:call-template name="rating_key"/>
      </TD>
    </TR>	
</TABLE>
  </xsl:template>

  <xsl:template name="rating_key">
[ <SPAN CLASS="coderTextGray">000 - 899</SPAN> | <SPAN CLASS="coderTextGreen">900 - 1199</SPAN> | <SPAN CLASS="coderTextBlue">1200 - 1499</SPAN> | <SPAN CLASS="coderTextYellow">1500 - 2199</SPAN> | <SPAN CLASS="coderTextRed">2200+</SPAN> ] 
  </xsl:template>


</xsl:stylesheet>
