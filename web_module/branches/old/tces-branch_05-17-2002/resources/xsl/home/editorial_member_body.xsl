<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/srm_dates.xsl"/>
  <xsl:import href="../includes/modules/tc_updates2.xsl"/>
  <xsl:import href="../includes/modules/white_last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>
  <xsl:import href="../includes/modules/countries.xsl"/>
  <xsl:import href="../includes/modules/intro.xsl"/>      
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/my_stats.xsl"/>  
  <xsl:import href="../includes/modules/arena2.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <!-- <xsl:import href="../includes/modules/editorials.xsl"/> -->
  <xsl:import href="../includes/modules/top_room_wins.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="MemberBody">

<!-- Body Begins -->

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/><BR/>
      <!-- SRM Promo Begins -->

      <!-- SRM Promo Ends -->    
    </TD>
    <!-- Right Column Include Begins -->

    <!-- Gutter -->
    <!-- <TD WIDTH="3" ROWSPAN="2" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD> -->
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <!-- <TD WIDTH="170" ROWSPAN="2" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/> 


<IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>
<xsl:call-template name="module_login"/> 
<xsl:call-template name="top_10_coders"/>
<xsl:call-template name="arena"/>
    </TD> -->
<!-- <xsl:call-template name="round_table"/>
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                  </xsl:when>                  
                  <xsl:otherwise>
                     <xsl:call-template name="practice_room"/>
                  </xsl:otherwise>
                </xsl:choose> -->


  <!-- Right Column Ends -->

  <!-- Gutter -->

    <TD WIDTH="1" ROWSPAN="2" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->       
  </TR>    
   <TR>

<!-- Left Column Include Begins -->   

  <!-- Gutter Begins -->
    <!-- <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> -->
     <!-- Gutter Ends -->

    <!-- Left Column Begins -->

    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><BR/> -->
<xsl:call-template name="srm_dates"/>
<IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>
<xsl:call-template name="calendar"/>
<!-- <xsl:call-template name="countries"/> -->
<IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="5"/>
      </TD>    

  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="1" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
<!-- Left Column Include Ends -->

<!-- Body Area -->

  <!-- Center Column Begins -->  
    <TD WIDTH="100%" VALIGN="top" ALIGN="center" BGCOLOR="#FFFFFF"> 




     <!-- My Stats Begins -->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="75" ALIGN="left" BGCOLOR="#FFFFFF"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/label_my_stats_big.gif" ALT="My Stats" WIDTH="92" HEIGHT="26" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>
  </TR>
</TABLE>
     
      <xsl:choose>
      <xsl:when test="count(/TC/HOME/CoderData/Data)='0'">
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
          <TR>
            <TD COLSPAN="3" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
          </TR>
          <TR>
            <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
            <TD CLASS="statText" VALIGN="top" HEIGHT="50">
              You must compete to view this information.
            </TD>
             <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          </TR>
        </TABLE>
      </xsl:when>
      <xsl:otherwise>


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
      <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>             
          
  <TR>
    <TD CLASS="statText" ROWSPAN="8" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
    <TD CLASS="statText" ROWSPAN="8" VALIGN="top">
      <xsl:choose>
      <xsl:when test="/TC/HOME/CoderData/Data/has_image='1'">
        <IMG WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"><xsl:attribute name="SRC"><xsl:value-of select="/TC/HOME/CoderData/Data/image_path"/></xsl:attribute></IMG>
      </xsl:when>
      <xsl:otherwise>
        <A><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><IMG SRC="/i/m/nophoto_submit.gif" WIDTH="126" HEIGHT="140" ALIGN="left" BORDER="0"/></A>
      </xsl:otherwise>
      </xsl:choose>
      <IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/>
    </TD>

    <TD CLASS="statText" COLSPAN="2">
    <xsl:if test="/TC/HOME/CoderData/Data/quote!=''">
    "<xsl:value-of select="/TC/HOME/CoderData/Data/quote"/>"
    </xsl:if>
    </TD>
    <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
  </TR>
  <TR>
      <TD COLSPAN="3" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD CLASS="statText">Member Since:</TD>    
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" ALIGN="right" NOWRAP=""><xsl:value-of select="/TC/HOME/CoderData/Data/member_since_date"/></TD>
      <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
  <TR>
    <TD CLASS="statText">Volatility Factor:</TD>    
      <TD CLASS="statText" ALIGN="right"><xsl:value-of select="/TC/HOME/CoderData/Data/vol"/></TD>
      <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD CLASS="statText">Average Points per Contest:</TD>    
      <TD CLASS="statText" ALIGN="right"><xsl:value-of select="format-number(/TC/HOME/CoderData/Data/avg_final_points, '0.00')"/></TD>
      <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD CLASS="statText">Maximum Rating:</TD>    
      <TD CLASS="statText" ALIGN="right"><xsl:value-of select="/TC/HOME/CoderData/Data/highest_rating"/></TD>
      <TD CLASS="statText" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>  




  <xsl:choose>
  <xsl:when test="/TC/HasImage='true'">
    <!-- <TR>
        <TD COLSPAN="3" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
    </TR> -->
    <TR>
      <TD COLSPAN="3">
          <A><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> RE-SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Click here to resend your photo</A>
      </TD>
    </TR>
  </xsl:when>
  <xsl:otherwise>
    <TR>
      <TD COLSPAN="3" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD COLSPAN="3" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="24" BORDER="0"/></TD>
    </TR>
  </xsl:otherwise>
  </xsl:choose>
    <TR>
      <TD COLSPAN="3" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
    </TR>  
    <TR>
      <TD COLSPAN="5" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
    </TR>        
</TABLE> 
  </xsl:otherwise>
  </xsl:choose>









<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">  
  <TR>
    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0" VSPACE="1"/><BR/>
      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
        <TR>
          <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="5" CLASS="statText" HEIGHT="18" VALIGN="bottom"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/><A><xsl:attribute name="HREF">/stat?c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute><IMG SRC="/i/my_profile.gif" ALT="" WIDTH="59" HEIGHT="14" BORDER="0"/></A><A><xsl:attribute name="HREF">/stat?c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute><IMG SRC="/i/my_rating.gif" ALT="" WIDTH="96" HEIGHT="14" BORDER="0"/></A><A><xsl:attribute name="HREF">/stat?c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute><IMG SRC="/i/my_earning.gif" ALT="" WIDTH="111" HEIGHT="14" BORDER="0"/></A></TD>    
        </TR>        
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
        </TR>      
        <TR>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right" WIDTH="15%" HEIGHT="14">Ranking</TD>        
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right" WIDTH="15%">Rating</TD>  
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right" WIDTH="30%">Earnings</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right" WIDTH="40%"># of Competitions</TD>
          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
        </TR>
        <TR>
          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="5" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
        </TR>        
        <TR>
          <xsl:choose>
          <xsl:when test="/TC/Ranking>0">
            <TD CLASS="statText" VALIGN="middle" ALIGN="right" HEIGHT="13"><xsl:value-of select="/TC/Ranking"/>&#160;&#160;</TD>
          </xsl:when>
          <xsl:otherwise>
            <TD CLASS="statText" VALIGN="middle" ALIGN="right" HEIGHT="13">Not Ranked&#160;&#160;</TD>
          </xsl:otherwise>
          </xsl:choose>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="/TC/Rating"/>&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">$<xsl:value-of select="format-number(/TC/HOME/Coder/TotalEarnings, '0.00')"/>&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="/TC/HOME/Coder/NumCompetitions"/>&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>         
        </TR> 
        <TR>
          <TD  COLSPAN="5" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
        </TR>  
      </TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">  
  <TR>
    <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
  </TR>
  <xsl:if test="count(/TC/HOME/Last3Comps/RoomResult)!='0'">
    <TR>
      <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    
    </TR>  
    <TR>
      <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="16" CLASS="smallFoot" HEIGHT="16" VALIGN="middle">&#160;Statistics from your Last <xsl:value-of select="count(/TC/HOME/Last3Comps/RoomResult)"/> Matches (click the <IMG SRC="/i/coders_icon_onclear.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"/> icon to view problem information).</TD>    
    </TR> 
    <TR>
      <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    </TR>  
    <TR>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" HEIGHT="28">Coder</TD>  
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" ALIGN="center">Coding<br/>Phase</TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right">&#160;+&#160;</TD>    
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" ALIGN="center">Challenge<br/>Phase</TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right">&#160;+&#160;</TD>    
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" ALIGN="center">Testing<br/>Phase</TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right">&#160;=&#160;</TD>    
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" ALIGN="center">Final<br/>Points</TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" ALIGN="center">Adv.</TD>  
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" ALIGN="center">Old<br/>Rating</TD>
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right">&#160;+&#160;</TD>    
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" ALIGN="center">Rating<br/>Change</TD>    
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" ALIGN="right">&#160;=&#160;</TD>    
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" VALIGN="middle" WIDTH="10%" ALIGN="center">New<br/>Rating</TD>    
      <TD BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
    </TR>  
    <xsl:for-each select="/TC/HOME/Last3Comps/RoomResult">
        <TR>
          <xsl:choose><xsl:when test="/TC/LoggedIn='true'">
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="middle" WIDTH="10">
              <A>
                <xsl:attribute name="HREF">/stat?c=coder_room_stats&amp;rd=<xsl:value-of select="RoundId"/>&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
                <IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"/>
              </A>
            </TD>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="left"> 
              <A>
                <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
                <xsl:attribute name="CLASS">statText</xsl:attribute>
                <FONT>
                  <xsl:attribute name="color">
                    <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="PostRoundRating"/></xsl:with-param></xsl:call-template>
                  </xsl:attribute>
                  <xsl:value-of select="Handle"/>
                </FONT>
              </A>
            </TD>
            </xsl:when>
            <xsl:otherwise>
              <TD>
                <IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="4" BORDER="0"/>
              </TD>
              <TD>
                <xsl:attribute name="CLASS">statText</xsl:attribute>
                <FONT>
                  <xsl:attribute name="color">
                    <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="PostRoundRating"/></xsl:with-param></xsl:call-template>
                  </xsl:attribute>
                  <B><xsl:value-of select="Handle"/></B>
                </FONT>
              </TD>
            </xsl:otherwise></xsl:choose>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(CodingPoints, '0.00')"/></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(ChallengePoints, '0.00')"/></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(TestPoints, '0.00')"/></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(FinalPoints, '0.00')"/></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">
            <xsl:choose>
            <xsl:when test="Advanced='Y'">
              Yes
            </xsl:when>
            <xsl:otherwise> 
              No
            </xsl:otherwise>
            </xsl:choose>
          </TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">
            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PreRoundRating, '0')"/></xsl:with-param></xsl:call-template>
          </TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(RatingDifference, '0.00')"/></TD>    
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right">
            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PostRoundRating, '0')"/></xsl:with-param></xsl:call-template>
          </TD>      
          <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        
        </TR>
         <TR>
         <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
         </TR>        
    </xsl:for-each>
    <TR>
      <TD COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
    </TR>
    <TR>
      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>
    <TR>
        <TD CLASS="statText" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR>        
  </xsl:if>
</TABLE>      
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="14"><IMG SRC="/i/clear.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
</TABLE> 

    <!-- My Stats Ends -->    
<!-- TC top special promo --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">     
  <TR>  
    <TD VALIGN="top" COLSPAN="7" ALIGN="center"><IMG SRC="/i/sun_banner_white.gif" ALT="Sun Microsystems" WIDTH="428" HEIGHT="84" BORDER="0"/></TD>    
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Tournament Links:</B></FONT><BR/>
- Editorials: <A HREF="/index?t=statistics&amp;c=2002tccc_favs" CLASS="bodyGeneric">Favorites</A>, <A HREF="/index?t=statistics&amp;c=2002tccc_cind" CLASS="bodyGeneric">Cinderellas</A>, <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon" CLASS="bodyGeneric">Keep your eye on...</A><BR/> 
- <A HREF="http://www.hotelatmit.com/ancill/directions.html" CLASS="bodyGeneric" Target="_blank">Directions to University Park Hotel @ MIT</A><BR/> 
- Sun Microsystems Technical Presentation<BR/> 
Presenting on J2ME, Java and XML, Java and Logo, and the STAR program.
<A HREF="mailto:tccc_sun@topcoder.com" CLASS="bodyGeneric">Limited seating - sign up today!</A><BR/>
    </TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Friday, April 19th</B></FONT><BR/>
- Semifinals Room 1-4<BR/>
<A HREF="/index?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyGeneric">Room Assignments / Schedule</A><BR/><BR/>

<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Saturday, April 20th</B></FONT><BR/>
- CHAMPIONSHIP ROUND<BR/>
Check back April 19th for room assignments/schedule<BR/><BR/>
    </TD>
    <TD VALIGN="top" WIDTH="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>

  <!-- <TR>  
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
  <TR>  
    <TD VALIGN="top" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>   
  </TR>   
</TABLE>     
    <!-- Last SRM Begins --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="184"><A HREF="/index?t=statistics&amp;c=match_summary"><IMG SRC="/i/label_srm_summary.gif" ALT="Last Match Summary" WIDTH="184" HEIGHT="26" HSPACE="5" BORDER="0" ALIGN="left"/></A></TD>
    <TD WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="194" ALIGN="right"><A HREF="/stat?c=last_match" CLASS="bodyGeneric"><IMG SRC="/i/label_view_results.gif" ALT="Last Match Results" WIDTH="194" HEIGHT="26" BORDER="0" ALIGN="right"/></A></TD>
  </TR>
</TABLE>   
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD>    
  </TR>  
</TABLE>  

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" WIDTH="100%">
<xsl:call-template name="last_srm"/>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="14"><IMG SRC="/i/clear.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
</TABLE>
                         
<!-- Editorials --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="2" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD>    
  </TR>     
  <TR>
  	<TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" ALIGN="left" BGCOLOR="#FFFFFF"><FONT SIZE="3" COLOR="#000000" FACE="tahoma"><B>Coder's Point of View</B></FONT></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>    
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="26" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText">
    <IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/>    
    </TD>
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Single Round Match 80</B></FONT><BR/>
Monday, April 15, 2002<BR/>
By&#160;lbackstrom,<I>TopCoder Member</I><BR/>
<A HREF="/?t=statistics&amp;c=srm80_room1" CLASS="bodyGeneric">Room One Review</A> | 
<A HREF="/?t=statistics&amp;c=srm80_rookie" CLASS="bodyGeneric">Rookie Review</A> | 
<A HREF="/?t=statistics&amp;c=srm80_prob" CLASS="bodyGeneric">Problem Set Analysis &amp; Opinion</A><BR/>
    </TD>
     <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>   
  </TR>

  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="2" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>    
  </TR>   
</TABLE>

<xsl:call-template name="tc_updates"/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
  </TR>   
</TABLE>
<xsl:call-template name="arena"/> 

<!-- TC special promo --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
  <TR>  
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD>    
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="26" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Sponsorships</B></FONT><BR/>
TopCoder offers sponsorship programs for the weekly <A HREF="/index?t=about_tc&amp;c=spons_srm" CLASS="bodyGeneric">Single Round Matches</A> as well as for 
<A HREF="/index?t=about_tc&amp;c=spons_tourny" CLASS="bodyGeneric">Tournaments</A>. Read more about our 
<A HREF="/index?t=about_tc&amp;c=spons_target" CLASS="bodyGeneric">sponsorship programs</A>.<BR/>
    </TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Employment Services</B></FONT><BR/>
TopCoder works with companies to connect them with top-rated developers. Read more about our 
<A HREF="/index?t=about_tc&amp;c=empl_tces" CLASS="bodyGeneric">employment services</A>.<BR/>
    </TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>

  <TR>  
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
  <!-- <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>   
  </TR>  -->   
</TABLE>  

    </TD>
  <!-- Center Column Ends -->    
    <TD BGCOLOR="#001935" VALIGN="top" CLASS="bodyText" WIDTH="244"><IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/><BR/>
<A HREF="/i/sun_redir.html" target="_blank"><IMG SRC="/i/sun_promo2.gif" ALT="" WIDTH="244" HEIGHT="161" BORDER="0"/></A><BR/>
<!-- <A TARGET="_parent" HREF="/?t=about_tc&amp;c=membr_teams"><IMG SRC="/i/teams_banner.gif" WIDTH="170" HEIGHT="46" BORDER="0" HSPACE="5" VSPACE="5"/></A><BR/>
<A TARGET="_parent" HREF="/?t=jobs&amp;c=index"><IMG SRC="/i/jobs_banner2.gif" WIDTH="170" HEIGHT="46" BORDER="0" HSPACE="5" VSPACE="5"/></A> -->
<xsl:call-template name="my_stats"/>

     <xsl:choose>
     <xsl:when test="number(/TC/Rating)&lt;1200"> 
       <xsl:call-template name="top_room_wins"><xsl:with-param name="division">2</xsl:with-param></xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
       <xsl:call-template name="top_room_wins"><xsl:with-param name="division">1</xsl:with-param></xsl:call-template>
     </xsl:otherwise>
     </xsl:choose>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                 <TR> 
                  <TD COLSPAN="3" BGCOLOR="#001935"><IMG SRC="/i/label_quick_stats_home.gif" ALT="Quick Stats" WIDTH="166" HEIGHT="17" BORDER="0"/></TD>
                </TR>
                 <TR> 
                  <TD BGCOLOR="#FFFFFF" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                </TR>                
              <TR>
                <TD ROWSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                <TD ROWSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
              </TR>              
              <TR>
                <TD CLASS="statText" VALIGN="top">Select a Quick Stat from the menu below.</TD>
              </TR>
              <TR>
                <TD CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
              </TR>                              
               <TR>
                <TD CLASS="quickstatText" VALIGN="top">
    <!-- Quick Stat Pulldown Begins --> 
    
<xsl:call-template name="quick_stats_pulldown"/>

    <!-- Quick Stat Pulldown Ends -->
    <!-- Quick Stat Pulldown Begins --> 
    
<xsl:call-template name="quick_stats_tidbit"/>

    <!-- Quick Stat Pulldown Ends -->    
    
                </TD>
              </TR>               
            </TABLE>    
    </TD>
    <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Body Area Ends -->
  </TR>   
</TABLE>
  </xsl:template>
</xsl:stylesheet>

