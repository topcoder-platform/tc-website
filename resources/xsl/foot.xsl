<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Foot"/>
  </xsl:template>
  <xsl:template name="Foot">
    <!-- Footer Include Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
		<TD BGCOLOR="#CCCCCC" WIDTH="160"><IMG SRC="/i/clear.gif" WIDTH="160" HEIGHT="1" BORDER="0"/></TD>
	    <TD BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="10" BORDER="0"/></TD>
        <TD BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/><P CLASS="bodyText"><!-- &#160;&#160;&#160;&#160;:.&#160;&#160; --><A HREF='javascript:history.back()' CLASS="bodyText"><IMG SRC="/i/previous.gif" ALT="" WIDTH="93" HEIGHT="21" BORDER="0"/><!-- Previous Page --></A></P></TD>
    </TR>
	<TR>
		<TD BGCOLOR="#666666" WIDTH="160"><IMG SRC="/i/clear.gif" WIDTH="160" HEIGHT="1" BORDER="0"/></TD>
	    <TD BGCOLOR="#666666" WIDTH="10"><IMG SRC="/i/footer_top_angle.gif" WIDTH="10" HEIGHT="10" BORDER="0"/></TD>
        <TD BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    </TR>
</TABLE>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#666666">
	<TR>
		<TD COLSPAN="2" HEIGHT="15" BACKGROUND="/i/footer_graphic_tile.gif" ALIGN="left"><IMG SRC="/i/footer_graphic.gif" WIDTH="710" HEIGHT="16" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD WIDTH="20" VALIGN="top" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="20" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="100%" VALIGN="top" ALIGN="left" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/>
		<SPAN CLASS="smallFoot"><A HREF="/reg/index.jsp" CLASS="smallFoot" TARGET="_parent">register</A>&#160;&#160;::&#160;&#160;<!-- <A HREF="#" CLASS="smallFoot">login</A>&#160;&#160;::&#160;&#160; --><A HREF="/?t=about_tc&amp;c=index" CLASS="smallFoot" TARGET="_parent">about [TC]</A>&#160;&#160;::&#160;&#160;<A HREF="/?t=contacts&amp;c=index" CLASS="smallFoot" TARGET="_parent">contacts</A>&#160;&#160;::&#160;&#160;<A HREF="/?t=&amp;c=privacy" CLASS="smallFoot" TARGET="_parent">privacy</A>&#160;&#160;::&#160;&#160;<A HREF="/?t=&amp;c=terms" CLASS="smallFoot" TARGET="_parent">terms</A>&#160;&#160;::&#160;&#160;
		<A HREF="/?t=home&amp;c=public_home" CLASS="smallFoot" TARGET="_parent">[TC] home</A></SPAN><BR/><SPAN CLASS="smallText">Copyright &#169; 2002, TopCoder, Inc. All rights reserved.</SPAN><BR/><BR/><BR/></TD>
	</TR>
</TABLE>    

    <!-- <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#666666">
      <TR>
        <TD COLSPAN="2" HEIGHT="15" BACKGROUND="/i/footer_graphic_tile.gif" ALIGN="left">
          <IMG SRC="/i/footer_graphic.gif" WIDTH="710" HEIGHT="16"/>
        </TD>
      </TR>
      <TR>
        <TD WIDTH="20" VALIGN="top" BGCOLOR="#666666">
          <IMG SRC="/i/clear.gif" WIDTH="20" HEIGHT="1" BORDER="0"/>
        </TD>
        <TD WIDTH="100%" VALIGN="top" ALIGN="left" BGCOLOR="#666666">
          <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/>
          <SPAN CLASS="smallfoot">
            <A HREF="#" CLASS="smallfoot">privacy</A>
            &#160;&#160;::&#160;&#160;
            <A HREF="#" CLASS="smallfoot">terms</A>
            &#160;&#160;::&#160;&#160;
            <A HREF="#" CLASS="smallfoot">site map</A>
            &#160;&#160;::&#160;&#160;
            <A HREF="#" CLASS="smallfoot">[TC] home</A>
          </SPAN><BR/>
          <SPAN CLASS="smalltext">Copyright &#169; 2002, TopCoder Inc. All rights reserved.</SPAN><BR/><BR/><BR/>
        </TD>
      </TR>
    </TABLE> -->
    <!-- Footer Include Ends -->
  </xsl:template>
</xsl:stylesheet>
