<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>   
  <xsl:import href="../includes/modules/rating.xsl"/>
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="public_stats_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Member Profile</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
      <xsl:choose>
      <xsl:when test="count(/TC/STATLISTS/Coder)='0'">
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
          </TR>
          <TR>
            <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="top" HEIGHT="50">
              No member profile available.
            </TD>
          </TR>
        </TABLE>
      </xsl:when>
      <xsl:otherwise>


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
      <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>  
  <TR>
          <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">
            <SPAN CLASS="statTextLarge"><B>Coder:</B>&#160;
              <FONT>
                <xsl:attribute name="color">
                  <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="/TC/STATLISTS/Coder/Rating"/></xsl:with-param></xsl:call-template>
                </xsl:attribute>
                <B><xsl:value-of select="/TC/STATLISTS/Coder/Handle"/></B>
              </FONT>
            </SPAN>
          </TD>
  </TR>
            <TR>
              <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
            </TR>  
          <xsl:if test="/TC/STATLISTS/Coder/Quote!=''">
            <TR>
              <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="center" WIDTH="80%">"<xsl:value-of select="/TC/STATLISTS/Coder/Quote"/>"</TD>
            </TR>
            <TR>
              <TD COLSPAN="5" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
          </xsl:if>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ROWSPAN="11" VALIGN="top">
      <xsl:choose>
      <xsl:when test="/TC/STATLISTS/Coder/Image!=''">
        <IMG WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"><xsl:attribute name="SRC"><xsl:value-of select="/TC/STATLISTS/Coder/Image"/></xsl:attribute></IMG>
      </xsl:when>
      <xsl:otherwise>
        <xsl:choose>
        <xsl:when test="/TC/HasImage='true'">
          <IMG SRC="/i/m/nophoto_big.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
          <xsl:when test="/TC/LoggedIn='true'">
            <A><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><IMG SRC="/i/m/nophoto_submit.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/></A>
          </xsl:when>
          <xsl:otherwise>
            <A><xsl:attribute name="HREF">?t=statistics&amp;c=member_profile&amp;submit_photo=true</xsl:attribute><IMG SRC="/i/m/nophoto_login.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/></A>
          </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
      </xsl:choose>
      <IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/>
    </TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="50%">Rating:</TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right" WIDTH="20%"><xsl:value-of select="/TC/STATLISTS/Coder/Rating"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left" WIDTH="30%">
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
              <A>
                 <xsl:attribute name="HREF">?t=statistics&amp;c=ratings_history&amp;Coder_Id=<xsl:value-of select="/TC/STATLISTS/Coder/CoderId"/></xsl:attribute>
                 <xsl:attribute name="CLASS">statText</xsl:attribute>[&#160;ratings&#160;history&#160;]
              </A>
                  </xsl:when>
                  <xsl:otherwise>
               <A>
                 <xsl:attribute name="HREF">/?t=authentication&amp;c=login</xsl:attribute>
                 <xsl:attribute name="CLASS">statText</xsl:attribute>[&#160;login&#160;for&#160;history&#160;]
              </A>                 
                  </xsl:otherwise>
                </xsl:choose>
            </TD>
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Volatility Factor:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><xsl:value-of select="/TC/STATLISTS/Coder/Volatility"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Member Since:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right" NOWRAP=""><xsl:value-of select="/TC/STATLISTS/Coder/MemberSince"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Total Earnings:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right">
      $<xsl:value-of select="format-number(/TC/STATLISTS/Coder/TotalEarnings, '0.00')"/>
      </TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
              <A>
                 <xsl:attribute name="HREF">/?t=statistics&amp;c=earnings_history&amp;Coder_Id=<xsl:value-of select="/TC/STATLISTS/Coder/CoderId"/></xsl:attribute>
                 <xsl:attribute name="CLASS">statText</xsl:attribute>[&#160;earnings&#160;history&#160;]
              </A>
                  </xsl:when>
                  <xsl:otherwise>
               <A>
                 <xsl:attribute name="HREF">/?t=authentication&amp;c=login</xsl:attribute>
                 <xsl:attribute name="CLASS">statText</xsl:attribute>[&#160;login&#160;for&#160;history&#160;]
              </A>                 
                  </xsl:otherwise>
                </xsl:choose>
            </TD>
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Number of Competitions:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><xsl:value-of select="/TC/STATLISTS/Coder/NumCompetitions"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
  </TR>  
  <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Average Points per Contest:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/AvgPoints, '0.00')"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Maximum Rating:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><xsl:value-of select="/TC/STATLISTS/Coder/MaxRating"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
  </TR>  




  <xsl:choose>
  <xsl:when test="/TC/HasImage='true'">
    <TR>
        <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="24" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD>
          <A><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> RE-SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Click here to resend your photo</A>
      </TD>
    </TR>
  </xsl:when>
  <xsl:otherwise>
    <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="24" BORDER="0"/></TD>
    </TR>
  </xsl:otherwise>
  </xsl:choose>
    




<!--
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText">Average Room Seed:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/AvgRoomSeed, '0.00')"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" NOWRAP="">Average Room Finishing Position:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/AvgRoomFinish, '0.00')"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="left">&#160;</TD>
  </TR>
-->

  <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="14" BORDER="0"/></TD>
  </TR>      
</TABLE>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&#160;&#160;Submission Information</TD>    
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Problem</TD>  
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Failed Challenge</TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Failed Sys. Test</TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="20%"># Submitted</TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">Success %</TD>  
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" HEIGHT="13">Easy</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumEasyFailChallenge"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumEasyFailSys"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumEasySubmitted"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/EasySuccessPercent, '0.00')"/>%</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" HEIGHT="13">Medium</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumMedFailChallenge"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumMedFailSys"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumMedSubmitted"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/MedSuccessPercent, '0.00')"/>%</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" HEIGHT="13">Hard</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumHardFailChallenge"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumHardFailSys"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumHardSubmitted"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/HardSuccessPercent, '0.00')"/>%</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
  </TR>        
  <TR>
    <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" HEIGHT="13">Total:</TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/TotalFailChallenge"/></TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/TotalFailSys"/></TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/TotalSubmitted"/></TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/TotalSuccessPercent, '0.00')"/>%</TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD>    
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">  
  <TR>
    <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="7" CLASS="registerNav" HEIGHT="18">&#160;&#160;Challenge Information</TD>    
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="25%" HEIGHT="18">Problem</TD>  
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%"># Failed Challenges</TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center" WIDTH="25%"># Challenges</TD>
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="25%">Success %</TD>  
    <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallFoot" HEIGHT="13">Easy</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumEasyChallengeFail"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumEasyChallenges"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/EasyChallengePercent, '0.00')"/>%</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallFoot" HEIGHT="13">Medium</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumMedChallengeFail"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumMedChallenges"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/MedChallengePercent, '0.00')"/>%</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
  </TR>
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallFoot" HEIGHT="13">Hard</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumHardChallengeFail"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/NumHardChallenges"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/HardChallengePercent, '0.00')"/>%</TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
  </TR>        
  <TR>
    <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="smallFoot" VALIGN="middle" HEIGHT="13">Total:</TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/TotalChallengeFail"/></TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center"><xsl:value-of select="/TC/STATLISTS/Coder/TotalNumChallenges"/></TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(/TC/STATLISTS/Coder/TotalChallengePercent, '0.00')"/>%</TD>
    <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
  </TR>  
</TABLE>
</xsl:otherwise>
</xsl:choose>
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
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

