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
<!-- Invitational block -->    
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
  <TR>
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>
    <TD CLASS="statTextBig" COLSPAN="3" BGCOLOR="#666666" HEIGHT="21" VALIGN="middle" ALIGN="center"><B>TopCoder Invitational Information</B></TD>
  </TR>
  <TR>
    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" HSPACE="6" BORDER="0"/></TD>
    <TD CLASS="bodyText" VALIGN="top"><A HREF="/index?t=schedule&amp;c=invit02_sched"><IMG SRC="/i/invit02_logow.gif" ALT="" WIDTH="155" HEIGHT="105" HSPACE="6" ALIGN="left" BORDER="0"/></A><BR/>
      <xsl:choose>
      <xsl:when test="/TC/HOME/InvitationalInfo/IsRegistered='0'">
        <xsl:choose>
        <xsl:when test="/TC/HOME/InvitationalInfo/Invitational_Eligibility/Info/is_eligible='false'">
          <xsl:choose>
          <xsl:when test="/TC/HOME/InvitationalInfo/Invitational_Eligibility/Info/in_eligible_country='false'">
            Unfortunately you are not eligible to participate in the 2002 TopCoder Invitational Tournament because are you are not from an eligible country.
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
            <xsl:when test="/TC/HOME/InvitationalInfo/Invitational_Eligibility/Info/has_enough_ratings='false'">
              You are not eligible to compete in the 2002 TopCoder Invitational Tournament because you have not competed in at least 3 rated events.
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
              <xsl:when test="/TC/HOME/InvitationalInfo/Invitational_Eligibility/Info/has_recent_competition='false'">
                You are not eligible to compete in the 2002 TopCoder Invitational Tournament because you have not competed since March 30, 2002.
              </xsl:when>
              <xsl:otherwise>
              </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
        <B><FONT COLOR="#CC0000">&#62;&#62; There are 136 open spots!</FONT></B><BR/>
Based on your profile information and your rated event participation, you are eligible to sign up for the 2002 TopCoder Invitational tournament.  Even if your rating is below the current cut-off, signing up for the event now will ensure that you are on the stand-by list in the event that not all of the invited members accept their invitations.<BR/><BR/>
          <A HREF="/TourneyReg?&amp;cd=4320&amp;rd=4320" CLASS="bodyText">Click here to sign up for the 2002 TopCoder Invitational</A><BR/>
          <BR/>
        </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        You have signed up to participate in the 2002 TopCoder Invitational.  If you are one of the top 1024 rated TopCoder members on October 1, 2002 you will receive an email confirming your eligibility.
      </xsl:otherwise>
      </xsl:choose>
    </TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>    
</TABLE>

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
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><B>Single Round Match 115</B></A><BR/>
Monday, September 30, 2002<BR/><BR/> 
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
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>
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
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR><TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>
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
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText" ROWSPAN="2"><IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/> By&#160;ZorbaTHut<BR/><I>[TC]&#160;Member</I><BR/></TD>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText" COLSPAN="2">
    <FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>SRM 115</B></FONT>
    </TD>
  </TR>      
  <TR>
    <TD VALIGN="top" CLASS="bodyText" WIDTH="100%">
	<A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm115_prob</xsl:attribute>
        <B>Problem Set Analysis &amp; Opinion</B>
      </A><BR/>
<P>
Last match before the invitational! Curiously enough, the match wasn't
bigger than usual - if anything, it was smaller. I'm guessing a lot of
people were holding on to their ratings, worried that they'd drop too far.
Well, by now you've heard the news, whether it's good or bad for you, so
I'll stop speculating and get down to the problems.
</P>

<P>
SRM 115 had a nice selection of problems, none spectacularly hard or
spectacularly easy. The Division-I Level Two problem proved extremely quick
for many people if they knew the solution from past Topcoder rounds. The
Level Three problems in both divisions were extremely difficult, with a
total of nine people from both divisions getting their Level Three.
</P>

	  <P>
The only oddity problem-wise was a surprisingly low success rate on the
Division-II Level One problem, due to some tricky calculations and rather
odd rules. As for solutions, I find it worth pointing out that despite the
fastest successful submissions on the Level One and Level Two problems, I
still ended up in third place due to some ghastly bugs on my Level Three
problem, <B>Yarin</B> and <B>NDBronson</B> both beating me - though in <B>NDBronson</B>'s case,
this was augmented by a successful challenge.... 
	  <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm115_prob</xsl:attribute>get&#160;analysis
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
<!-- End of Point of View -->

<xsl:call-template name="arena"/> 
<P><BR/></P>
     </TD>
  <!-- Center Column Ends -->    
    <TD BGCOLOR="#001935" VALIGN="top" CLASS="statText" WIDTH="244"><IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/><BR/>
<A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=apex</xsl:attribute></A>  
<IMG USEMAP="#apex_home" SRC="/i/es/apex/apex_home.gif" alt="" width="244" height="160" border="0"/>  
  <BR/>
<map name="apex_home">
<area alt="" shape="poly" coords="229,104,120,105,105,94,11,95,10,120,36,146,229,148" href="/stat?&amp;c=last_match"/>
<area alt="" shape="poly" coords="225,88,124,89,106,77,8,77,9,31,230,30" href="/?&amp;t=tces&amp;c=apex"/>
</map> 
 
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
<A HREF="/?&amp;t=schedule&amp;c=2002sun_sched">
<IMG SRC="/i/2002sn_winner.gif" ALT="SunNetwork Coding Challenge" WIDTH="244" HEIGHT="156" VSPACE="5" BORDER="0"/></A>            
<!-- <A HREF="/stat?c=member_profile&amp;cr=108262" CLASS="coderTextRed">
<IMG SRC="/i/codermonth_aug.gif" ALT="Coder of the Month" WIDTH="244" HEIGHT="156" VSPACE="0" BORDER="0"/></A> -->
    </TD>
<!-- Body Area Ends -->
  </TR>   
</TABLE>
  </xsl:template>
</xsl:stylesheet>


