<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="menu.xsl"/>
  <xsl:import href="includes/modules/rating.xsl"/>
  <xsl:import href="script.xsl"/>
  <!-- <xsl:import href="../includes/modules/rating.xsl"/> -->  
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Top"/>
  </xsl:template>
  <xsl:template name="Top">
    <!-- Logo Bar Include Begins -->
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">
      <TR>
        <TD WIDTH="15" BGCOLOR="#000000"><A NAME="top"></A>
        <IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
        <TD WIDTH="206" BGCOLOR="#000000">
          <A TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=home&amp;c=public_home</xsl:attribute>
            <IMG SRC="/i/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="10"/>
          </A>
        </TD>
        <TD WIDTH="20" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="15"/></TD>
        <TD WIDTH="100%" BGCOLOR="#000000" ALIGN="right" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/><BR/>
          <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" ALIGN="right">
            <TR>
<!--
          	  <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_blank" HREF="http://www.topcodersoftware.com"><IMG SRC="/i/tcs_button.gif" ALT="" WIDTH="144" HEIGHT="17" BORDER="0"/></A></TD>            
-->

          	  <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute><IMG SRC="/i/tces_button.gif" ALT="" WIDTH="82" HEIGHT="17" BORDER="0"/></A></TD>
              <!-- <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif" CLASS="time" NOWRAP="0"></TD> -->
              <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif" CLASS="time" NOWRAP="0"><SPAN CLASS="registerToday">&#160;&#160;&#160;&#160;Current Member Count</SPAN>&#160;:&#160; <xsl:value-of select="format-number(/TC/MemberCount,'#,##0')"/></TD>
              <TD VALIGN="middle" BGCOLOR="#43515E" WIDTH="100%" BACKGROUND="/i/steel_gray_bg.gif" ALIGN="right" CLASS="globalNavSmall" NOWRAP="0">
                <A TARGET="_parent" CLASS="globalNavSmall">
                  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>
                  About [TC]
                </A>&#160;&#160;&#160;:&#160;&#160;&#160;
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                    <A TARGET="_parent" CLASS="globalNavSmall">
                      <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=authentication&amp;c=submit_logout</xsl:attribute>
                      Logout
                    </A>
                  </xsl:when>
                  <xsl:otherwise>
                    <A TARGET="_parent" CLASS="globalNavSmall">
                      <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=authentication&amp;c=login</xsl:attribute>
                      Login
                    </A>
                  </xsl:otherwise>
                </xsl:choose>&#160;&#160;&#160;:&#160;&#160;&#160;
                <A TARGET="_parent" CLASS="globalNavSmall">
                  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>
                  Contacts
                </A>
                &#160;&#160;&#160;:&#160;&#160;&#160;
                <A TARGET="_parent" CLASS="globalNavSmall">
                  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/></xsl:attribute>
                  Home
                </A>
              </TD>
              <TD WIDTH="15" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0" VSPACE="8"/></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
              <TD BGCOLOR="#000000" ALIGN="center" NOWRAP="0">
                <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/>
<!-- 
<A TARGET="_parent">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
  <IMG SRC="/i/jobs_banner2.gif" ALT="" WIDTH="170" HEIGHT="46" VSPACE="5" BORDER="0"/>
</A>
<A TARGET="_parent">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute>
  <IMG SRC="/i/teams_banner.gif" ALT="" WIDTH="170" HEIGHT="46" VSPACE="5" BORDER="0"/>
</A>
<IMG SRC="/i/clear.gif" WIDTH="72" HEIGHT="1" BORDER="0" VSPACE="20"/> 
-->
              </TD>
              <TD CLASS="time" VALIGN="middle" NOWRAP="" ALIGN="right"><BR/>
              <SPAN CLASS="registerToday">&#160;&#160;&#160;&#160;Current Member Count</SPAN>&#160;:&#160; <xsl:value-of select="format-number(/TC/MemberCount,'#,##0')"/>
                 <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'"><BR/>
                    Welcome Back <SPAN CLASS="smallBrackets">[ </SPAN> 
                    <A CLASS="statText">
                      <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                      <FONT>
                        <xsl:attribute name="color">
                          <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="/TC/Rating"/></xsl:with-param></xsl:call-template>
                        </xsl:attribute>
                        <B><xsl:value-of select="/TC/Handle"/></B>
                      </FONT>
                    </A>  
                    <SPAN CLASS="smallBrackets">]</SPAN> :
                    <span class="time">
                      <xsl:call-template name="DateTime"/>
                    </span>
                  </xsl:when>             
                  <xsl:otherwise><BR/>             
                    <SPAN CLASS="smallBrackets">[ </SPAN> 
                    <A TARGET="_parent" CLASS="registerToday">
                      <xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>
                      Register Today
                    </A> :
                    <span class="time">
                      <xsl:call-template name="DateTime"/>
                    </span>
                    <SPAN CLASS="smallBrackets">]</SPAN>
                  </xsl:otherwise>
                </xsl:choose>
                <BR/>
                <a href="Javascript:tcTime()" class="statText">Current time at TopCoder</a>
                <BR/><BR/>
                
              </TD>
              <TD WIDTH="15" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
            </TR>
          </TABLE>
        </TD>
      </TR>
     <!--  <TR>    
        <TD COLSPAN="2" BGCOLOR="#000000" VALIGN="bottom"><IMG SRC="/i/logo_btm_tab.gif" ALT="" WIDTH="187" HEIGHT="6" BORDER="0"/></TD> -->  
        <!-- <TD COLSPAN="4" BGCOLOR="#000000" ALIGN="right">
          <A TARGET="_parent" HREF="Javascript:arena()" CLASS="registerNav">
            <IMG SRC="/i/label_download_applet.gif" ALT="Download the Applet" WIDTH="134" HEIGHT="17" BORDER="0"/>
          </A>
          <A TARGET="_parent" CLASS="registerNav">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=practice_room</xsl:attribute>
            <IMG SRC="/i/label_visit_practice_room.gif" ALT="Visit the Practice Room" WIDTH="141" HEIGHT="17" BORDER="0"/>
          </A>
          <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/>
        </TD> 
      </TR> -->               
    </TABLE>
    <xsl:call-template name="TopMenu"/>
  </xsl:template>
</xsl:stylesheet>
