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
  <!-- <xsl:import href="../includes/modules/top_room_wins.xsl"/> -->
  <xsl:import href="../includes/modules/top_scorers.xsl"/>
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
<!-- <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/> -->
<xsl:call-template name="calendar"/>
<!-- <xsl:call-template name="countries"/> -->
<IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="5"/><BR/>
<!-- Do Not Delete This Line --><FONT SIZE="1" COLOR="#CCCCCC" FACE="tahoma">HiddenWord</FONT>      
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
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="90" HEIGHT="26" BORDER="0"/></TD>
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
          <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="5" CLASS="statText" HEIGHT="18" VALIGN="bottom">
            <IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/>
            <A CLASS="statText">
              <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
              <IMG SRC="/i/my_profile.gif" ALT="" WIDTH="59" HEIGHT="14" BORDER="0"/>
            </A>
            <A CLASS="statText">
              <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
              <IMG SRC="/i/my_rating.gif" ALT="" WIDTH="96" HEIGHT="14" BORDER="0"/>
            </A>
            <A CLASS="statText">
              <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
              <IMG SRC="/i/my_earning.gif" ALT="" WIDTH="111" HEIGHT="14" BORDER="0"/>
            </A>
          </TD>    
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
                <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_room_stats&amp;rd=<xsl:value-of select="RoundId"/>&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
                <IMG SRC="/i/coders_icon.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"/>
              </A>
            </TD>
            <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="left"> 
              <A>
                <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
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

    <!-- Last SRM Begins -->    
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="184"><IMG SRC="/i/label_srm_summary.gif" ALT="Last Match Summary" WIDTH="184" HEIGHT="26" HSPACE="5" BORDER="0" ALIGN="left"/></TD>
    <TD WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!--
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="194" ALIGN="right">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>
        <IMG SRC="/i/label_view_results.gif" ALT="Last Match Results" WIDTH="194" HEIGHT="26" BORDER="0" ALIGN="right"/>
      </A>
    </TD> 
    -->
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="4" CLASS="bodyText"><A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><B>Single Round Match 109</B></A><BR/>
Wednesday, August 21, 2002<BR/><BR/> 
    </TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR> 
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="25%" NOWRAP="0" HEIGHT="15">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>
        Div. Leaders
      </A>
    </TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="35%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>
        Problem Stats
      </A>
    </TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="15%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>
        Results
      </A>
    </TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="25%" NOWRAP="0"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Want to write?</A></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>    
</TABLE>  
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <!-- <TD VALIGN="top" WIDTH="50%"><xsl:call-template name="last_srm"/></TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
    <TD VALIGN="middle" CLASS="bodyText" WIDTH="100%">   
       <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFF99">  
          <TR>
             <TD VALIGN="middle" HEIGHT="17" ALIGN="center" COLSPAN="5" CLASS="bodyText"><B>Best/Worst Rating Change</B></TD> 
          </TR>
          <TR><TD COLSPAN="5" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>          
          <TR>
             <TD VALIGN="middle" ROWSPAN="2" WIDTH="20%" ALIGN="center" CLASS="bodyText" BGCOLOR="#FFFF66" NOWRAP="0"><B>Div-I</B></TD>
             <TD VALIGN="middle" HEIGHT="16" WIDTH="10%" CLASS="bodyText">&#160;&#160;Best:</TD> 
             <TD VALIGN="middle" WIDTH="35%" CLASS="bodyText" NOWRAP="0">&#160;&#160;pernick</TD>
             <TD VALIGN="middle" WIDTH="15%" CLASS="bodyText" ALIGN="center">254</TD>
             <TD VALIGN="middle" WIDTH="20%" CLASS="bodyText" NOWRAP="0">&#160;Room 4</TD>
          </TR>
          <TR>
             <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;&#160;Worst:</TD> 
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;&#160;animus</TD>
             <TD VALIGN="middle" CLASS="bodyText" ALIGN="center">-224</TD>
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;Room 4&#160;</TD>
          </TR>
          <TR><TD COLSPAN="5" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>          
          <TR>
             <TD VALIGN="middle" ROWSPAN="2" ALIGN="center" CLASS="bodyText" BGCOLOR="#FFFF66" NOWRAP="0">&#160;<B>Div-II</B></TD>
             <TD VALIGN="middle" HEIGHT="16" CLASS="bodyText">&#160;&#160;Best:</TD> 
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;&#160;centipede80</TD>
             <TD VALIGN="middle" CLASS="bodyText" ALIGN="center">217</TD>
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;Room 6</TD>
          </TR>
          <TR>
             <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;&#160;Worst:</TD> 
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;&#160;sphere<BR/>&#160;&#160;datakix<BR/>&#160;&#160;daily10</TD>
             <TD VALIGN="middle" CLASS="bodyText" ALIGN="center">-259</TD>
             <TD VALIGN="middle" CLASS="bodyText" NOWRAP="0">&#160;Room 12<BR/>&#160;Room 7<BR/>&#160;Room 8</TD>
          </TR>                                
       </TABLE> 
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR><TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>
</TABLE>
<!-- Editorials -->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR><TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" COLSPAN="7"><IMG SRC="/i/label_coder_view.gif" ALT="Coder's Point of View" WIDTH="148" HEIGHT="26" BORDER="0"/></TD>   
      <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText" ROWSPAN="2"><IMG SRC="/i/m/slavik_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/> By&#160;slavik<BR/><I>[TC]&#160;Member</I><BR/></TD>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText" COLSPAN="2">
    <FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>SRM 109</B></FONT>
    </TD>
  </TR>      
  <TR>    
    <!-- <TD VALIGN="top" CLASS="bodyText" WIDTH="40%">      
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm103_rookie</xsl:attribute>
        <B>Rookie Review</B>
      </A><BR/><B>Mr. Sketch</B> scored an impressive 1323.46 points by solving all Div-II problems and winning his room. His score was number 4 overall in Div-II...<A CLASS="bodyGeneric">
<xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm103_rookie</xsl:attribute>full&#160;story
      </A>
    </TD>
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD> -->
    <TD VALIGN="top" CLASS="bodyText" WIDTH="100%">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm109_prob</xsl:attribute>
        <B>Problem Set Analysis &amp; Opinion</B>
      </A><BR/>
<P>
SRM109 was unusually easy of both divisions. All problems were clearly stated with no hidden cases or 
ambiguities. There were 29 out of 184 (15.76%) coders who have submitted all the problems correctly in 
Division-II. Division-I had 99 coders participating and there were 12 coders who have submitted correct 
solutions for all three problems. 
</P>

<P><B>ZorbaTHut</B> was Division-I leader with impressive 1611.91 points. It took him only 31 minutes to complete 
all problems and become a Division-I winner. It took 14:27 minutes for <B>javaisthe_unwin</B> to complete all 
problems in Division-II to become a division leader with impressive 1676.42 points. This victory places him 
well into Div-I with 1826 rating points (1826 rating counts as 21st impressive debut overall)
...<A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm109_prob</xsl:attribute>get&#160;analysis
      </A></P>
    </TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>     
  </TR>
  <TR><TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="7" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR><TD VALIGN="top" COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD></TR>   
</TABLE>


<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR><TD VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" COLSPAN="2"><IMG SRC="/i/label_coder_view.gif" ALT="Coder's Point of View" WIDTH="148" HEIGHT="26" BORDER="0"/></TD>   
      <TD VALIGN="top" WIDTH="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>   
      <TD VALIGN="top" WIDTH="1" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
      <TD VALIGN="top" COLSPAN="2"><IMG SRC="/i/label_lessons.gif" ALT="Lessons Learned the Hard Way" WIDTH="205" HEIGHT="26" BORDER="0"/></TD>    
      <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="26" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText"><IMG SRC="/i/m/Penwiper_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/></TD>
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText">    
      <FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana">
        <B>SRM 102</B>
      </FONT><BR/>
      By&#160;Penwiper,<I>[TC] Member</I><BR/>
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_room1</xsl:attribute>
        Room One Review
      </A><BR/>
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_rookie</xsl:attribute>
        Rookie Review
      </A><BR/>
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm102_prob</xsl:attribute>
        Problem Set Analysis &amp; Opinion
      </A>
    </TD>
    <TD VALIGN="top" WIDTH="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>   
    <TD VALIGN="top" WIDTH="1" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText"><IMG SRC="/i/m/slowjoe_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/></TD>
    <TD VALIGN="top" WIDTH="60%" ALIGN="left" CLASS="bodyText">
    <FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana">
    <B>SRM 101</B><BR/>    
  By&#160;slowjoe,<I>[TC] Member</I></FONT><BR/>

Srm 101 was the last paying Single Round Match, and as such, marked
the end of an era.  In the real world, it was in the day of the
WorldCom accounting scandal, and that Brazil won through to the Soccer
World Cup final...
    <A CLASS="bodyGeneric">
      <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm101_lessons</xsl:attribute>
      full&#160;story
    </A>
  </TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
  </TR>
  <TR><TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="7" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR><TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD></TR>   
</TABLE> --> 
<xsl:call-template name="arena"/> 
<P><BR/></P>
<!-- TC special promo 
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
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
</TABLE> -->  

    </TD>
  <!-- Center Column Ends -->    
    <TD BGCOLOR="#001935" VALIGN="top" CLASS="statText" WIDTH="244"><IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/><BR/>
<A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournament/2002sunnetwork_button.gif" alt="" width="244" height="79" border="0"/></A><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
    <TD class="statText" WIDTH="100%" ALIGN="right"><A HREF="http://sunnetwork.sun.com/sf2002/reg/general/index.en.jsp" TARGET="_blank" CLASS="statText"><B>Register for the conference</B> &gt;</A></TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
    <TD class="statText" WIDTH="100%" ALIGN="right"><A HREF="http://sunnetwork.sun.com/" TARGET="_blank" CLASS="statText">Learn more &gt;</A></TD>    
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                              
</TABLE>
<A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=2002sunnetwork</xsl:attribute><IMG SRC="/i/tournament/2002sunnetwork_chall.gif" alt="" width="244" height="56" border="0"/></A><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD class="statText" WIDTH="100%" ALIGN="right"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=2002sunnetwork</xsl:attribute><B>Register to compete</B> &gt;</A></TD> 
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD class="statText" WIDTH="100%" ALIGN="right"><A class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=2002sunnetwork_rules</xsl:attribute>Get Official Rules &amp; Regulations &gt;</A></TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                               
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD class="statText" WIDTH="100%"><B>Note:</B><BR/>Contestants must be a <A HREF="/reg/index.jsp" CLASS="statText">TopCoder member</A> and a registered attendee of the SunNetwork<sup>sm</sup> Conference 
in order to participate in the SunNetwork<sup>sm</sup> Coding Challenge.</TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                               
</TABLE>
<IMG SRC="/i/tournament/2002sunnetwork_btm.gif" alt="" width="244" height="34" border="0"/><BR/><BR/>

<A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=2002invit_rules</xsl:attribute>
<IMG SRC="/i/2002invit_button.gif" alt="" width="244" height="77" border="0"/></A><BR/><BR/>
<!-- <A>
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;ContestId=4220&amp;t=schedule&amp;c=srm</xsl:attribute>
    <IMG SRC="/i/sponspromo_motorola.gif" ALT="" WIDTH="244" HEIGHT="172" BORDER="0"/>
  </A><BR/> -->
<!-- <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=jack_qa_061302</xsl:attribute>
<IMG SRC="/i/jack_chat_qa.gif" alt="" width="244" height="100" border="0"/></A><BR/>    
    <IMG SRC="/i/jack_chat_promo3.gif" alt="" width="244" height="201" border="0"/><BR/><BR/>

<IMG SRC="/i/sponspostmatch_citrix.gif" WIDTH="244" HEIGHT="172" BORDER="0" USEMAP="#sponspromo_citrix_Map"/>
<MAP NAME="sponspromo_citrix_Map">
  <AREA SHAPE="rect" ALT="" COORDS="4,5,240,109">
    <xsl:attribute name="HREF">Javascript:sponsorLinkWindow('http://<xsl:value-of select="/TC/Host"/>/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=home','Citrix','1','1','680','489')</xsl:attribute>
  </AREA>
  <AREA SHAPE="rect" ALT="" COORDS="106,145,195,157">
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=smr93_room1</xsl:attribute>
  </AREA>
  <AREA SHAPE="rect" ALT="" COORDS="106,133,196,144">
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=match_summary</xsl:attribute>
  </AREA>
  <AREA SHAPE="rect" ALT="" COORDS="107,117,192,132">
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>
  </AREA>
</MAP>
<A>
  <xsl:attribute name="HREF">Javascript:sponsorLinkWindow('http://<xsl:value-of select="/TC/Host"/>/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=home','Citrix','1','1','680','489')</xsl:attribute>
  <img BORDER="0" HEIGHT="172" WIDTH="244" ALT="" SRC="/i/sponspromo_citrix.gif"/>
</A><BR/> 
-->

 <!--  <A>
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;ContestId=4210&amp;t=schedule&amp;c=srm</xsl:attribute>
    <IMG SRC="/i/sponspromo_motorola.gif" ALT="" WIDTH="244" HEIGHT="172" BORDER="0"/>
  </A><BR/><BR/>
  <A>
    <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm96</xsl:attribute>
    <IMG SRC="/i/sponspromo_motorola.gif" ALT="" WIDTH="244" HEIGHT="172" BORDER="0"/>
  </A><BR/><BR/> -->

<!--<A TARGET="_parent">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute>
  <IMG SRC="/i/promo_teams.gif" WIDTH="244" HEIGHT="81" BORDER="0"/>
</A><BR/>
<A TARGET="_parent">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=jobs&amp;c=index</xsl:attribute>
  <IMG SRC="/i/promo_jobs.gif" WIDTH="244" HEIGHT="81" BORDER="0"/>
</A>-->
<xsl:call-template name="my_stats"/>
<IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/>
     <xsl:choose>
     <xsl:when test="number(/TC/Rating)&lt;1200"> 
       <xsl:call-template name="top_scorers"><xsl:with-param name="division">2</xsl:with-param></xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
       <xsl:call-template name="top_scorers"><xsl:with-param name="division">1</xsl:with-param></xsl:call-template>
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
  <!-- <xsl:call-template name="quick_stats_tidbit"/> -->
  <!-- Quick Stat Pulldown Ends -->
                </TD>
              </TR>               
            </TABLE><BR/>
<A HREF="/stat?c=member_profile&amp;cr=277659" CLASS="coderTextRed">
<IMG SRC="/i/codermonth_july.gif" ALT="Coder of the Month" WIDTH="244" HEIGHT="156" VSPACE="10" BORDER="0"/></A>    
    </TD>
    <!-- <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
<!-- Body Area Ends -->
  </TR>   
</TABLE>
  </xsl:template>
</xsl:stylesheet>


