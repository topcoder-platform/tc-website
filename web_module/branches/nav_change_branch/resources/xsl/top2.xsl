<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="menu2.xsl"/>
  <xsl:import href="includes/modules/rating.xsl"/>
  <xsl:import href="authentication/form.xsl"/>  
  <xsl:import href="script.xsl"/>
  <!-- <xsl:import href="../includes/modules/rating.xsl"/> -->  
  <xsl:output indent="no" method="html"/>
  <xsl:template match="/">
    <xsl:call-template name="Top"/>
  </xsl:template>
  <xsl:template name="Top">
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">    
            <TR>
<!--
          	  <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_blank" HREF="http://www.topcodersoftware.com"><IMG SRC="/i/tcs_button.gif" ALT="" WIDTH="144" HEIGHT="17" BORDER="0"/></A></TD>            


          	  <TD VALIGN="middle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif"><A TARGET="_parent"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute><IMG SRC="/i/tces_button.gif" ALT="" WIDTH="102" HEIGHT="17" BORDER="0"/></A></TD>
-->           <TD VALIGN="middle" BGCOLOR="#333333" CLASS="time" NOWRAP="0"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="5"/></TD>
              <TD VALIGN="middle" BGCOLOR="#333333" NOWRAP="0" CLASS="registerToday"><SPAN CLASS="time">&#160;&#160;&#160;&#160;Current Member Count</SPAN>&#160;:&#160; <xsl:value-of select="format-number(/TC/MemberCount,'#,##0')"/> - <span class="time"><xsl:call-template name="DateTime"/></span><a href="Javascript:tcTime()" class="statText">[Get Time]</a></TD>
              <TD VALIGN="middle" BGCOLOR="#333333" WIDTH="100%" ALIGN="right" CLASS="globalNavSmall" NOWRAP="0">
                <!-- <A TARGET="_parent" CLASS="globalNavSmall">
                  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>
                  About [TC]
                </A>&#160;&#160;&#160;:&#160;&#160;&#160; -->  
                <A HREF="http://www.topcodersoftware.com" TARGET="_parent" CLASS="globalNavSmall">TopCoder Software</A>&#160;&#160;&#160;|&#160;&#160;&#160;
                <A HREF="#" TARGET="_parent" CLASS="globalNavSmall">TopCoder High School</A>&#160;&#160;&#160;|&#160;&#160;&#160;
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
                </xsl:choose>&#160;&#160;&#160;|&#160;&#160;&#160;
                <!-- <A TARGET="_parent" CLASS="globalNavSmall">
                  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>
                  Contacts
                </A>
                &#160;&#160;&#160;:&#160;&#160;&#160; -->
                <A TARGET="_parent" CLASS="globalNavSmall">
                  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/></xsl:attribute>
                  Home
                </A>
              </TD>
              <TD WIDTH="15" BGCOLOR="#333333"><IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0" VSPACE="8"/></TD>
            </TR>
            <TR>
              <TD BGCOLOR="#000000" COLSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                
    </TABLE> 
    <!-- Logo Bar Include Begins -->       
    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">            
      <TR>
        <TD WIDTH="15" BGCOLOR="#000000"><A NAME="top"></A>
        <IMG SRC="/i/clear.gif" WIDTH="15" HEIGHT="1" BORDER="0"/></TD>
        <TD WIDTH="206" BGCOLOR="#000000">
          <A TARGET="_parent">
            <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=home&amp;c=public_home</xsl:attribute>
            <IMG SRC="/i/logo.gif" WIDTH="206" HEIGHT="49" BORDER="0" VSPACE="13"/>
          </A>
        </TD>
        <TD WIDTH="20" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" HSPACE="15"/></TD>
        <TD CLASS="time" VALIGN="bottom" NOWRAP="" ALIGN="right"><!-- <BR/>
              <SPAN CLASS="registerToday">&#160;&#160;&#160;&#160;Current Member Count</SPAN>&#160;:&#160; <xsl:value-of select="format-number(/TC/MemberCount,'#,##0')"/> -->
                 <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">            
                       <TR>
                          <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="75" BORDER="0"/></TD>
                          <TD BACKGROUND="/i/top_div1_badge.jpg" WIDTH="100%" BGCOLOR="#333333"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="75" BORDER="0"/></TD>
                          <TD CLASS="time" ALIGN="right" VALIGN="middle" WIDTH="150" BGCOLOR="#333333"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/><BR/>
                             <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">            
                                <TR>
                                   <TD class="time" HEIGHT="18" VALIGN="middle" ALIGN="center" BGCOLOR="#000000">                                                                           
                    <!-- Welcome <SPAN CLASS="smallBrackets">[ </SPAN> --> 
                    <A CLASS="statText">
                      <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
                      <FONT>
                        <xsl:attribute name="color">
                          <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="/TC/Rating"/></xsl:with-param></xsl:call-template>
                        </xsl:attribute>
                        <B><xsl:value-of select="/TC/Handle"/></B>
                      </FONT>
                    </A>  
                    <!-- <SPAN CLASS="smallBrackets">]</SPAN> -->
                                   </TD>
                                 </TR>
                                <TR>
                                   <TD class="time" HEIGHT="18" VALIGN="middle" ALIGN="center">                                                                         
    <form name="selectform">
      <!-- <select name="myfeatures" size="1" class="dropdown" onchange="goTo(this)"> -->
<select name="quickstat" size="1" class="dropdown" onchange="window.location=this.options[this.selectedIndex].value">      
        <OPTION value="SELECTED"> Select a Feature: </OPTION>
        <OPTION><xsl:attribute name="value">/stat?c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Profile</OPTION>
        <OPTION><xsl:attribute name="value">/stat?c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Rating History</OPTION>
        <OPTION><xsl:attribute name="value">/stat?c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Earnings History</OPTION>
        <OPTION><xsl:attribute name="value">/stat?c=coder_room_stats&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>Room Statistics</OPTION> 
        <OPTION><xsl:attribute name="value">/stat?c=round_stats</xsl:attribute>Round Statistics</OPTION>
        <OPTION><xsl:attribute name="value">/index?t=search</xsl:attribute>Advanced Member Search</OPTION> 
        <OPTION><xsl:attribute name="value">/PactsMemberServlet</xsl:attribute>Affidavits</OPTION> 
        <OPTION><xsl:attribute name="value">/index?t=search&amp;c=refer</xsl:attribute>My Referrals</OPTION>
        <OPTION><xsl:attribute name="value">/index?t=development&amp;c=index</xsl:attribute>Development</OPTION>
        <OPTION><xsl:attribute name="value">/index?t=tces&amp;c=index</xsl:attribute>TCES (jobs)</OPTION> 
      </select>
    </form>
                                   </TD>                                   
                                 </TR>                                 
                               </TABLE>
                          </TD>
                          <TD WIDTH="10" BGCOLOR="#333333"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                       </TR>             
                    </TABLE>
                  </xsl:when>             
                  <xsl:otherwise>
                    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">            
                       <TR>
                          <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                          <TD WIDTH="100%" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                          <TD CLASS="time" ALIGN="right" VALIGN="bottom" WIDTH="190" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="190" HEIGHT="1" BORDER="0"/><BR/>     
                    <!-- <SPAN CLASS="smallBrackets">[ </SPAN> 
                    <A TARGET="_parent" CLASS="registerToday">
                      <xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>
                      Register Today
                    </A> : -->

                    <!-- <SPAN CLASS="smallBrackets">]</SPAN> -->
                          </TD>
                          <TD WIDTH="10" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                       </TR> 
                       <TR>
                          <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="74" BORDER="0"/></TD>
                          <TD WIDTH="100%" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="74" BORDER="0"/></TD>
                          <TD CLASS="time" ALIGN="right" VALIGN="middle" WIDTH="190" BGCOLOR="#000000">     
<xsl:call-template name="Form"/>
                          </TD>
                          <TD WIDTH="10" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                       </TR>           
                    </TABLE>                    
                  </xsl:otherwise>
                </xsl:choose>                
        </TD>        
      </TR>             
    </TABLE>
    <xsl:call-template name="TopMenu"/>
  </xsl:template>
</xsl:stylesheet>



