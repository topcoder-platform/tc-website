<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top2.xsl"/>
  <xsl:import href="../script.xsl"/>  
  <xsl:import href="tourny_member_body.xsl"/>
  <xsl:import href="tourny_public_body.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder Home</TITLE>
        <xsl:call-template name="CSS"/>      
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
        <xsl:choose>
          <xsl:when test="/TC/LoggedIn='true'">
            <xsl:call-template name="MemberBody"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="PublicBody"/>
          </xsl:otherwise>
        </xsl:choose>
    <!-- Footer Include Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
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
    <TD WIDTH="20" VALIGN="top" BGCOLOR="#666666" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="20" HEIGHT="1" BORDER="0"/></TD>
    <TD WIDTH="100%" VALIGN="top" ALIGN="left" BGCOLOR="#666666" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/>
    <SPAN CLASS="smallFoot">
      <A CLASS="smallFoot">
        <xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>
        register
      </A>&#160;&#160;::&#160;&#160;
      <A CLASS="smallFoot">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>
        about [TC]
      </A>&#160;&#160;::&#160;&#160;
      <A CLASS="smallFoot">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>
        contacts
      </A>&#160;&#160;::&#160;&#160;
      <A CLASS="smallFoot">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>
        privacy
      </A>&#160;&#160;::&#160;&#160;
      <A CLASS="smallFoot">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>
        terms
      </A>&#160;&#160;::&#160;&#160;
      <A CLASS="smallFoot">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=home&amp;c=public_home</xsl:attribute>
        [TC] home
      </A>
    </SPAN><BR/><SPAN CLASS="smallText">Copyright &#169; 2002, TopCoder, Inc. All rights reserved.</SPAN><BR/><BR/><BR/></TD>
  </TR>
</TABLE>    
    <!-- Footer Include Ends -->
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
