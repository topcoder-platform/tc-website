<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="left.xsl"/>
<xsl:import href="form.xsl"/>
<xsl:import href="right.xsl"/>
<xsl:import href="activate_form.xsl"/>
<xsl:import href="../includes/body_top.xsl"/>

<xsl:template name="Body">

  <xsl:param name="activate"></xsl:param>
  <xsl:param name="valid"></xsl:param>
  <!-- Body Begins -->
  <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
    <TR>
      <!-- Left Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Begins -->
        <xsl:call-template name="BodyLeft"/>
        <!-- Left Column Include Ends -->
        <!-- Global Seconday Nav Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
      <!-- Gutter Ends -->
      <!-- Body Area -->
      <!-- Center Column Begins -->
      <TD class="statTextBig" width="100%" bgcolor="#CCCCCC" valign="top">
        <IMG src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">login</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <xsl:if test="not(/TC/ErrorMsg='')">
            <TR>
              <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
              <TD COLSPAN="2" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                <IMG SRC="/i/clear.gif" ALT="" WIDTH="380" HEIGHT="1" BORDER="0"/><BR/>
                <xsl:choose>
                  <xsl:when test="$activate='true'">
                    <xsl:call-template name="ActivateForm"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <P CLASS="registerNav"><b><xsl:value-of select="/TC/ErrorMsg"/></b></P>
                  </xsl:otherwise>
                </xsl:choose>
              </TD>
              <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
          </xsl:if>
          <TR>
            <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
              <IMG SRC="/i/clear.gif" ALT="" WIDTH="380" HEIGHT="1" BORDER="0"/><BR/>
              <P CLASS="statText">
                <SPAN CLASS="statTextBig">Forgot your password?</SPAN><BR/>
                If you cannot remember your password <A HREF="index?t=authentication&amp;c=recover_password" CLASS="statText">click here</A> and we can send it to you via email.
              </P>
              <P CLASS="statText"><SPAN CLASS="statTextBig">New to TopCoder?</SPAN><BR/>
                Click here to 
		<A CLASS="statText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>register now</A>. 
                After you complete the registration process, we will
                send your account activation code via email.
              </P>
              <xsl:choose>
                <xsl:when test="$valid='false'">
                  <DIV CLASS="statTextBig"><CENTER><SPAN CLASS="statTextBig">* Invalid Login *</SPAN></CENTER></DIV>
                </xsl:when>
                <xsl:otherwise>
                  <BR/><BR/>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:call-template name="Form"/>
              <P><BR/></P>
            </TD>
            <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
          </TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
        </TABLE>
      </TD>
      <!-- Center Column Ends -->
      <!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/><BR/></TD>
      <!-- Right Column Include Begins -->
      <!-- Gutter -->
        <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"/></TD>
        <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1"/><BR/>
      <!-- Right Column Include Begins -->
      <xsl:call-template name="BodyRight"/>
      <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
      <!-- Gutter Ends -->
    </TR>
  </TABLE>
  <!-- Body Ends -->

</xsl:template>

</xsl:stylesheet>

