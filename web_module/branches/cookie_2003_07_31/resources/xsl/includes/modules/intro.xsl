<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="intro">
     <TABLE WIDTH="170" BGCOLOR="#333333" CELLSPACING="0" CELLPADDING="0" BORDER="0">
      <TR> 
        <TD VALIGN="top"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig">Links for Coders</TD>
        <TD VALIGN="top"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>      
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute>
            - Why membership
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_ratings</xsl:attribute>
            - Ratings
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_divisions</xsl:attribute>
            - Divisions
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>
      <!-- <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute>
            - Teams
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR> -->
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
            - Jobs
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>      
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>      
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>
            - <B>Register Now</B>
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>      
      <TR> 
        <TD VALIGN="top"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig">Links for Sponsors</TD>
        <TD VALIGN="top"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR> 
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>
            - Overview
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>
            - Single Round Matches
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>
            - Tournaments
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>      
      <TR> 
        <TD VALIGN="top"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig">Links for Employers</TD>
        <TD VALIGN="top"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR> 
      <TR>       
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
        <TD VALIGN="middle" HEIGHT="15" CLASS="statText">
          &#160;
          <A CLASS="statText">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=hiring</xsl:attribute>
            - Why TopCoder
          </A>
        </TD>
        <TD VALIGN="top" CLASS="statText">&#160;</TD>
      </TR>
      <TR> 
        <TD VALIGN="top" COLSPAN="3"><IMG ALT="" WIDTH="1" HEIGHT="3" SRC="/i/clear.gif" BORDER="0"/></TD>
      </TR>            
     </TABLE>
  </xsl:template>
</xsl:stylesheet>
