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
<!-- Invitational block -->    
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
  <TR>
    <TD COLSPAN="3" CLASS="bodyText" VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="50"><FONT SIZE="3" FACE="verdana, arial, tahoma"><B>The 2002 TopCoder Invitational is currently underway!</B></FONT></TD>
  </TR>
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" VALIGN="top" NOWRAP="0"><A HREF="/index?t=schedule&amp;c=invit02_sched"><IMG SRC="/i/invit02_logow.gif" ALT="" WIDTH="155" HEIGHT="105" HSPACE="6" ALIGN="left" BORDER="0"/></A><BR/>
<B>When:</B> November 22nd and 23rd<BR/>
<B>Where:</B> Mohegan Sun Casino in Uncasville, CT<BR/>
<B>Total Prize:</B> $150,000<BR/>
<A HREF="http://www.mohegansun.com/directions/index.jsp" TARGET="_blank">
<IMG SRC="/i/spectator.gif" ALT="Invitational" WIDTH="200" HEIGHT="57" VSPACE="3" BORDER="0"/></A>
<!--
<A CLASS="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=authentication&amp;c=login</xsl:attribute>Login</A> to sign up!<BR/>
<A CLASS="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=invit02_sched</xsl:attribute>Get more details!</A><BR/>-->
    </TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD COLSPAN="3" CLASS="bodyText" VALIGN="top" WIDTH="100%">
<!-- tourney links -->    
	<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
      <TR>
        <TD COLSPAN="3" ALIGN="center" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;INVITATIONAL FEATURES</TD>
      </TR>                    						
	  <TR>
		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" >
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_spons'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
		<A HREF="/index?t=schedule&amp;c=tourny_spons" CLASS="statTextBig">Sponsor</A></TD> -->
		<TD WIDTH="33%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='invit02_pt1'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_pt2'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rnd2'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rnd3'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rnd4'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_semi'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_champ'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/index?t=schedule&amp;c=tourney_advancers&amp;rds=4355" CLASS="statTextBig">Round Updates</A></TD>
		<TD WIDTH="33%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='invit02_sched'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/index?t=schedule&amp;c=invit02_sched" CLASS="statTextBig">Schedule</A></TD>
		<TD WIDTH="33%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_rules_overview'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_overview'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_scoring'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_conditions'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_prizes'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_onsite'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_structure'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>	
		<A HREF="/index?t=schedule&amp;c=invit02_rules_overview" CLASS="statTextBig">Rules</A></TD>
		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='nopage'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/TourneyReg?&amp;cd=4320&amp;rd=4320" CLASS="statTextBig">Sign Up</A></TD>	-->	
	  </TR>
    </TABLE>
<!-- tourney links end -->     
<!-- <B>Update:</B><BR/>
The assignments for the first round of the tournament are now available.  Each part lists the assigned members alphabetically by handle.<BR/><BR/> -->


    </TD>    
  </TR>
  <!-- <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" CLASS="bodyText"><BR/>
<FONT SIZE="3" FACE="verdana, arial, tahoma"><B>The Reception: A View from the Inside</B></FONT><BR/>
In a scene reminiscent of Survivor, 16 finalists have gathered onsite to outwit, out-type and 
out-code each other and, in the process, walk away with $50,000.  With the Melbourne University vs. 
University of Waterloo rivalry alive on the international scene, and the question of whether Stanford 
University will continue its dominance on the minds of the Americans, the 2002 TopCoder Invitational 
is slated to be the most exciting onsite event yet.  Join me as the scene unfolds over the next two days...
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=tournament&amp;c=invit02_reception</xsl:attribute>read&#160;more</A>

<BR/><BR/>
<B>Room 1</B>: 8AM (EST)(<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=schedule&amp;c=invit02_sched</xsl:attribute>Get details</A>). Logon to view round activity.
<BR/><BR/>
    </TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>     
  <TR>
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->  
</TABLE>

<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/>

<!-- Summary/Best/Worst Begins -->         
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="184"><IMG SRC="/i/label_srm_summary.gif" ALT="Last Match Summary" WIDTH="184" HEIGHT="26" HSPACE="5" BORDER="0" ALIGN="left"/></TD>
    <TD WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
<TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="3" CLASS="bodyText"><A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=round_stats&amp;rd=4371</xsl:attribute><B>The 2002 TopCoder Invitational: Room 2</B></A><BR/>
Friday, November 22, 2002<BR/><BR/>

<B>Room 2 updates: </B> <A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=schedule&amp;c=tourney_semi</xsl:attribute>Advancer Stats</A> | <A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=tournament&amp;c=invit02_brackets</xsl:attribute>Brackets</A> | <A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=tournament&amp;c=invit02_semiroom2</xsl:attribute>Summary</A> | <A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=tournament&amp;c=invit02_semiroom2#photo</xsl:attribute>Photos</A>
<BR/><BR/>
    </TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="33%" NOWRAP="0" HEIGHT="15">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>
        Div. Leaders
      </A>
    </TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="43%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>
        Problem Stats
      </A>
    </TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="23%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=round_stats&amp;rd=4371</xsl:attribute>
        Results
      </A>
    </TD>   
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>  
</TABLE> 

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" CLASS="statText" WIDTH="100%">  
       <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#001935">  
          <TR>
             <TD VALIGN="middle" HEIGHT="17" ALIGN="center" COLSPAN="5" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">Best/Worst Rating Change</TD> 
          </TR>
          <TR><TD COLSPAN="5" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>          
          <xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">
            <TR>
              <TD HEIGHT="14" VALIGN="middle" WIDTH="20%" CLASS="statTextBig" NOWRAP="0">&#160;&#160;&#160;<xsl:value-of select="division"/></TD>
              <TD VALIGN="middle" WIDTH="10%" CLASS="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</TD> 
              <TD VALIGN="middle" WIDTH="35%" CLASS="statText" NOWRAP="0">&#160;&#160;
                <A>
                  <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                  <xsl:attribute name="CLASS">bodyText</xsl:attribute>
                  <FONT>
                    <xsl:attribute name="color">
                      <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                    </xsl:attribute>
                    <xsl:value-of select="handle"/>
                  </FONT>
                </A>
              </TD>
              <TD VALIGN="middle" WIDTH="15%" CLASS="statText" ALIGN="center"><xsl:value-of select="change"/></TD>
              <TD VALIGN="middle" WIDTH="20%" CLASS="statText" NOWRAP="0">&#160;<xsl:value-of select="room_name"/></TD>
            </TR>            
          </xsl:for-each>
          <TR><TD COLSPAN="5" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>
       </TABLE>
    </TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  
<!-- Uncomment for invit02 -->
 
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="3" CLASS="bodyText"><BR/>
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournament&amp;c=invit02_semiroom2</xsl:attribute><B>A Nail Biter, Indeed</B></A><BR/>
by MaryBeth Biondi, <I>TopCoder Staff</I><BR/>

<P>
The morning's second competition brought a few more spectators onsite, but lots more online.  
Nearly 50 members logged in to cheer on their fellow coders in a tightly contested match, which
 pitted <B>dmwright</B>'s tournament experience against <B>reid</B>'s speed.  <B>dgarthur</B> and <B>lars</B>, in some 
 people's minds, may have only been along for the experience...
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=tournament&amp;c=invit02_semiroom2</xsl:attribute>read&#160;more</A>
</P>
<B>Room 3</B>: 3PM (EST)(<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=schedule&amp;c=invit02_sched</xsl:attribute>Get details</A>). Logon to view round activity.
<BR/><BR/>
    </TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>
  
  <TR><TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>   
</TABLE>
<!-- Summary/Best/Worst Ends -->

<!-- Coder Point of View Begins -->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR><TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" COLSPAN="7"><IMG SRC="/i/label_coder_view.gif" ALT="Coder's Point of View" WIDTH="148" HEIGHT="26" BORDER="0"/></TD>   
      <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText" ROWSPAN="2"><IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/> 
    By&#160;lbackstrom<BR/><I>[TC]&#160;Member</I><BR/></TD>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText" COLSPAN="2">
    <FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>The 2002 TopCoder Invitational: Room 2</B></FONT>
    </TD>
  </TR>      
  <TR>
    <TD VALIGN="top" CLASS="bodyText" WIDTH="100%">
	<A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournament&amp;c=invit02_semiprob2</xsl:attribute>
        <B>Problem Set Analysis &amp; Opinion</B>
      </A><BR/>	  
<P>
This round had a pretty simple easy problem, and pretty difficult medium and hard problems, both dealing with graphs, 
though in very different ways.  All three coders submitted the easy fairly quickly.  <B>dmwright</B> then moved 
on the the hard problem while everyone else solved the medium.  <B>Lars</B> was the fastest on the medium, though 
his solution was doomed to timeout.  <B>reid</B> and <B>dgarthur</B> submitted shortly afterwards.  With about 15 minutes 
to go, <B>dmwright</B> gave up on the hard, and went back to the medium, but was unable to finish it.  With less than 
5 minutes to spare, both <B>dgarthur</B> and <B>reid</B> submitted the 1000.  However <B>reid</B> had an off by 1 error somewhere, 
and <B>dgarthur</B> came away with the upset....<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournament&amp;c=invit02_semiprob2</xsl:attribute>Get the analysis</A>
</P>
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
<!-- End of Point of View -->

<xsl:call-template name="arena"/> 
<P><BR/></P>
     </TD>
  <!-- Center Column Ends -->    
    <TD BGCOLOR="#001935" VALIGN="top" CLASS="statText" WIDTH="244"><IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=fbi</xsl:attribute></A>  
<IMG USEMAP="#artifact_home" SRC="/i/artifact/artifact_home.gif" alt="" width="244" height="160" border="0"/>  
  <BR/> -->
<MAP NAME="artifact_home">
<AREA ALT="Artifact Software" SHAPE="poly" COORDS="17,33,17,60,141,60,141,92,228,92,228,25,17,25" HREF="/?&amp;t=schedule&amp;c=srm_spon_artifact"/>
<!--<AREA ALT="" SHAPE="poly" COORDS="229,104,120,105,105,94,11,95,10,120,36,146,229,148" HREF="/?RoundId=4365&amp;t=schedule&amp;c=srm"/>-->
<AREA ALT="" shape="poly" coords="229,104,120,105,105,94,11,95,10,120,36,146,229,148" href="/stat?&amp;c=last_match"/>
</MAP>
<A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
<IMG SRC="/i/tces_promo.gif" alt="" width="244" height="77" border="0"/></A>
<A HREF="/?&amp;t=development&amp;c=components">
<IMG SRC="/i/tcs_board.gif" ALT="TCS" WIDTH="244" HEIGHT="156" VSPACE="1" BORDER="0"/></A>
<!-- <A HREF="/?&amp;t=news_events&amp;c=pr_10_22_02">
<IMG SRC="/i/tces_quote.gif" ALT="TCES" WIDTH="244" HEIGHT="156" BORDER="0"/></A> -->
 
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

                </TD>
              </TR>               
            </TABLE><BR/>
<!-- <A HREF="/?&amp;t=schedule&amp;c=2002sun_sched">
<IMG SRC="/i/2002sn_winner.gif" ALT="SunNetwork Coding Challenge" WIDTH="244" HEIGHT="156" VSPACE="5" BORDER="0"/></A> -->           
<A HREF="/stat?c=member_profile&amp;cr=294543">
<IMG SRC="/i/codermonth_oct.gif" ALT="Coder of the Month" WIDTH="244" HEIGHT="156" VSPACE="10" BORDER="0"/></A>
    </TD>
<!-- Body Area Ends -->
  </TR>   
</TABLE>
  </xsl:template>
</xsl:stylesheet>


