<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/> 
  <xsl:import href="input.xsl"/>  
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
  <xsl:with-param name="title">&#160;Problem Statistics</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
  </TR>  
  <TR>
      <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
  </TR>      
</TABLE>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">  
  <TR>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR>
  <xsl:choose>
  <xsl:when test="count(/TC/STATLISTS/Main/Contest)='0'">
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statTextBig" COLSPAN="7">
        No statistics available.
      </TD>
    </TR>
  </xsl:when>
  <xsl:otherwise>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
    </TR>  
    <TR>
      <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="7" HEIGHT="18">&#160;Problem Statistics for
        <xsl:value-of select="/TC/STATLISTS/Main/ContestName"/> > <xsl:value-of select="/TC/STATLISTS/Main/RoundName"/>
        > <xsl:value-of select="/TC/STATLISTS/Main/RoomName"/> > <xsl:value-of select="/TC/STATLISTS/Main/Handle"/>
      </TD>
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    </TR>  
    <TR>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Class Name</TD>  
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" ALIGN="center">Method Name</TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="25%" ALIGN="center">Difficulty</TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="25%" ALIGN="center">Status</TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="10%" ALIGN="center">Points</TD>  
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    </TR>  
    <xsl:for-each select="/TC/STATLISTS/Main/Contest/Problem">
      <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">
          <xsl:if test="ProblemId=../../ProblemId">[ </xsl:if>
          <A>
            <xsl:attribute name="HREF">index?t=statistics&amp;c=problem_stats&amp;Contest_Id=<xsl:value-of select="../ContestId"/>&amp;Round_Id=<xsl:value-of select="../RoundId"/>&amp;Coder_Id=<xsl:value-of select="../CoderId"/>&amp;Problem_Id=<xsl:value-of select="ProblemId"/></xsl:attribute>
            <xsl:attribute name="CLASS">statText</xsl:attribute><xsl:value-of select="ClassName"/>
          </A>
          <xsl:if test="ProblemId=../../ProblemId"> ]</xsl:if>
        </TD>  
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle"><xsl:value-of select="MethodName"/></TD>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle"><xsl:value-of select="DifficultyDesc"/></TD>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="Status"/></TD>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="Points"/></TD>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
      </TR>
      <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
      </TR>
    </xsl:for-each>
    <TR>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="16" BORDER="0"/></TD>
    </TR>    
    <xsl:for-each select="/TC/STATLISTS/Main/Contest/Problem">
      <xsl:if test="ProblemId=../../ProblemId">
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="7" VALIGN="middle" ALIGN="center">
            <A>
              <xsl:attribute name="HREF">index?t=statistics&amp;c=problem_statement&amp;Contest_Id=<xsl:value-of select="../ContestId"/>&amp;Round_Id=<xsl:value-of select="../RoundId"/>&amp;Coder_Id=<xsl:value-of select="../CoderId"/>&amp;Problem_Id=<xsl:value-of select="ProblemId"/></xsl:attribute>
                <xsl:attribute name="CLASS">statText</xsl:attribute>View <xsl:value-of select="ClassName"/> Problem Statement
            </A>
          </TD>
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="problemText" COLSPAN="7" VALIGN="middle" ALIGN="left">
            <linefeed><detab><spc>
              <xsl:value-of select="ProgramText"/>
            </spc></detab></linefeed>
          </TD>
        </TR>
<!--
        <TR>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="7" VALIGN="middle" ALIGN="center">
            <A>
              <xsl:attribute name="HREF">index?t=statistics&amp;c=program_text&amp;Contest_Id=<xsl:value-of select="../ContestId"/>&amp;Round_Id=<xsl:value-of select="../RoundId"/>&amp;Coder_Id=<xsl:value-of select="../CoderId"/>&amp;Problem_Id=<xsl:value-of select="ProblemId"/></xsl:attribute>
                <xsl:attribute name="CLASS">statText</xsl:attribute>Enlarge <xsl:value-of select="ClassName"/>
            </A>
          </TD>
        </TR>
-->
        <xsl:if test="Challenge/ContestId!=''">
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
          </TR>  
          <TR>
            <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="7" HEIGHT="18">&#160;Defense Results</TD>
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR>  
          <TR>
            <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Challenger</TD>  
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="center">Challenge Arguments</TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="center">Expected Result</TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="center">Received Result</TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="center">Succeeded</TD>
            <TD BACKGROUND="/i/steel_blue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR>  
          <xsl:for-each select="Challenge">
            <TR>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">
                <A>
                  <xsl:attribute name="HREF">index?t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="ChallengerId"/></xsl:attribute>
                  <xsl:attribute name="CLASS">statText</xsl:attribute>
                  <FONT>
                    <xsl:attribute name="color">
                      <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="Rating"/></xsl:with-param></xsl:call-template>
                    </xsl:attribute>
                    <B><xsl:value-of select="Challenger"/></B>
                  </FONT>
                </A>
              </TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="center"><linefeed><xsl:value-of select="ChallengeArgs"/></linefeed></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="center"><linefeed><xsl:value-of select="ExpectedResult"/></linefeed></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="center"><linefeed><xsl:value-of select="ReceivedResult"/></linefeed></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="left">
                <xsl:choose>
                <xsl:when test="Succeeded='1'">
                  Yes
                </xsl:when>
                <xsl:otherwise>
                  No
                </xsl:otherwise>
                </xsl:choose>
              </TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
            </TR>  
          </xsl:for-each>
        </xsl:if>

        <xsl:if test="Test/TestId!=''">
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
          </TR>  
          <TR>
            <TD BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig" COLSPAN="7" HEIGHT="18">&#160;System Test Results</TD>
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR>  
          <TR>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" WIDTH="20%" HEIGHT="18">Test Arguments</TD>  
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="center">Expected Results</TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="center">Result</TD>
            <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
          </TR>
          <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
          </TR>  
          <xsl:for-each select="Test">
            <TR>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="left"><linefeed><xsl:value-of select="TestArgs"/></linefeed></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="left"><linefeed><xsl:value-of select="ExpectedResult"/></linefeed></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" COLSPAN="2" ALIGN="left"><linefeed><xsl:value-of select="ActualResult"/></linefeed></TD>
              <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
            </TR>  
          </xsl:for-each>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:otherwise>
  </xsl:choose>
</TABLE>
  
  
<P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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

