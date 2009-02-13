<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="corp_nav">
    <xsl:choose>  
      <xsl:when test="/TC/Task='about_tc'">        
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="about_row"/> 
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333">&gt; for MEMBERS:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute> - Why Membership?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=year_02</xsl:attribute> - What are Ratings?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333">&gt; for SPONSORS:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute> - Why Membership?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=year_02</xsl:attribute> - What are Ratings?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
                        
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333">&gt; for EMPLOYERS:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute> - Why Membership?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=year_02</xsl:attribute> - What are Ratings?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <xsl:call-template name="press_row"/>            
          </TABLE>        
      </xsl:when> 
      
      <xsl:when test="/TC/Task='news_events'">        
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="about_row"/> 
            <xsl:call-template name="press_row"/>            
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=articles</xsl:attribute> - Articles</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute> - Press Releases</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=features</xsl:attribute> - Features</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>                             
          </TABLE>        
      </xsl:when>                                    
      <xsl:otherwise>      
         Invalid task. 
      </xsl:otherwise>
    </xsl:choose>     
     
     
     <!-- <TABLE WIDTH="170" BGCOLOR="#333333" CELLSPACING="0" CELLPADDING="0" BORDER="0">
      <TR> 
        <TD VALIGN="top"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
        <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig">About Us</TD>
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
        <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig">Press Room</TD>
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
     </TABLE> -->
  </xsl:template>
  
  
<!-- Navigation Rows Below -->
  <xsl:template name="about_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About US</A></TD>
      <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>  
  
  <xsl:template name="press_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press ROOM</A></TD>
      <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>
        
<!-- Nav ends -->  
</xsl:stylesheet>
