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
  <xsl:import href="../includes/modules/simple_search.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <!-- <xsl:import href="../includes/modules/editorials.xsl"/> -->
  <!-- <xsl:import href="../includes/modules/top_room_wins.xsl"/> -->
  <xsl:import href="../includes/modules/top_scorers.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="MemberBody">

<!-- Body Begins -->

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
  <tr>
    <td valign="top" colspan="3"><img src="/i/clear.gif" width="1" height="1" border="0"/><br/>
      <!-- SRM Promo Begins -->

      <!-- SRM Promo Ends -->
    </td>
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

    <td width="1" rowspan="2" bgcolor="#FFFFFF"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
    <!-- Gutter Ends -->
  </tr>
   <tr>

<!-- Left Column Include Begins -->

  <!-- Gutter Begins -->
    <!-- <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> -->
     <!-- Gutter Ends -->

    <!-- Left Column Begins -->

    <td width="170" bgcolor="#000000" valign="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><BR/> -->
<xsl:call-template name="global_left"/>
<img src="/i/logo_ghosted_bracket.gif" width="160" height="77" border="0" alt="[ TopCoder ]" vspace="5"/><br/>
<!-- Do Not Delete This Line --><font size="1" color="#000000" face="tahoma">HiddenWord</font>
      </td>

  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <td width="1" bgcolor="#FFFFFF" valign="top"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
    <!-- Gutter Ends -->
<!-- Left Column Include Ends -->

<!-- Body Area -->

  <!-- Center Column Begins -->
    <td width="100%" valign="top" align="center" bgcolor="#FFFFFF">
     <!-- My Stats Begins -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td colspan="4" valign="top" bgcolor="#FFFFFF" align="right"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td>
  </tr>
  <tr>
    <td valign="top" bgcolor="#FFFFFF" width="11" align="right"><img src="/i/steelblue_top_left1.gif" alt="" width="90" height="26" border="0"/></td>
    <td valign="top" width="75" align="left" bgcolor="#FFFFFF"><img src="/i/steelblue_top_left2.gif" alt="" width="75" height="26" border="0"/></td>
    <td valign="middle" bgcolor="#FFFFFF" width="100%"><img src="/i/label_my_stats_big.gif" alt="My Stats" width="92" height="26" border="0"/></td>
    <td valign="top" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="26" border="0"/></td>
  </tr>
</table>

      <xsl:choose>
      <xsl:when test="count(/TC/HOME/CoderData/Data)='0'">
        <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
          <tr>
            <td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td>
          </tr>
          <tr>
            <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
            <td class="statText" valign="top" height="50">
              You must compete to view this information.
            </td>
             <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
          </tr>
        </table>
      </xsl:when>
      <xsl:otherwise>


<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
  <tr>
      <td colspan="5" class="statText"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td>
  </tr>

  <tr>
    <td class="statText" rowspan="8" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
    <td class="statText" rowspan="8" valign="top">
      <xsl:choose>
      <xsl:when test="/TC/HOME/CoderData/Data/has_image='1'">
        <img width="126" height="140" align="left" border="0"><xsl:attribute name="SRC"><xsl:value-of select="/TC/HOME/CoderData/Data/image_path"/></xsl:attribute></img>
      </xsl:when>
      <xsl:otherwise>
        <a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><img src="/i/m/nophoto_submit.gif" width="126" height="140" align="left" border="0"/></a>
      </xsl:otherwise>
      </xsl:choose>
      <img src="/i/clear.gif" alt="" width="4" height="1" border="0"/>
    </td>

    <td class="statText" colspan="2">
    <xsl:if test="/TC/HOME/CoderData/Data/quote!=''">
    "<xsl:value-of select="/TC/HOME/CoderData/Data/quote"/>"
    </xsl:if>
    </td>
    <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
  <tr>
      <td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td>
  </tr>
  <tr>
    <td class="statText">Member Since:</td>
      <td background="/i/steel_darkblue_bg.gif" class="statText" align="right" nowrap=""><xsl:value-of select="/TC/HOME/CoderData/Data/member_since_date"/></td>
      <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
  <tr>
    <td class="statText">Volatility Factor:</td>
      <td class="statText" align="right"><xsl:value-of select="/TC/HOME/CoderData/Data/vol"/></td>
      <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
  <tr>
    <td class="statText">Average Points per Contest:</td>
      <td class="statText" align="right"><xsl:value-of select="format-number(/TC/HOME/CoderData/Data/avg_final_points, '0.00')"/></td>
      <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
  <tr>
    <td class="statText">Maximum Rating:</td>
      <td class="statText" align="right"><xsl:value-of select="/TC/HOME/CoderData/Data/highest_rating"/></td>
      <td class="statText" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>

  <xsl:choose>
  <xsl:when test="/TC/HasImage='true'">
    <!-- <TR>
        <TD COLSPAN="3" CLASS="statText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
    </TR> -->
    <tr>
      <td colspan="3">
          <a><xsl:attribute name="HREF">mailto:memberphotos@topcoder.com?subject=<xsl:value-of select="/TC/ActivationCode"/> | [ <xsl:value-of select="/TC/Handle"/> ] | <xsl:value-of select="/TC/UserId"/> RE-SUBMIT IMAGE: PLEASE DO NOT CHANGE SUBJECT</xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute>Click here to resend your photo</a>
      </td>
    </tr>
  </xsl:when>
  <xsl:otherwise>
    <tr>
      <td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td>
    </tr>
    <tr>
      <td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="24" border="0"/></td>
    </tr>
  </xsl:otherwise>
  </xsl:choose>
    <tr>
      <td colspan="3" class="statText"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td>
    </tr>
    <tr>
      <td colspan="5" class="statText"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td>
    </tr>
</table>
  </xsl:otherwise>
  </xsl:choose>



<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
  <tr>
    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
    <td colspan="2" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" vspace="1"/><br/>
      <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
        <tr>
          <td background="/i/steel_gray_bg3.gif" colspan="5" class="statText" height="18" valign="bottom">
            <img src="/i/clear.gif" alt="" width="4" height="1" border="0"/>
            <a class="statText">
              <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
              <img src="/i/my_profile.gif" alt="" width="59" height="14" border="0"/>
            </a>
            <a class="statText">
              <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
              <img src="/i/my_rating.gif" alt="" width="96" height="14" border="0"/>
            </a>
            <a class="statText">
              <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute>
              <img src="/i/my_earning.gif" alt="" width="111" height="14" border="0"/>
            </a>
          </td>
        </tr>
        <tr>
          <td background="/i/steel_darkblue_bg.gif" colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
        </tr>
        <tr>
          <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right" width="15%" height="14">Ranking</td>
          <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right" width="15%">Rating</td>
          <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right" width="30%">Earnings</td>
          <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right" width="40%"># of Competitions</td>
          <td background="/i/steel_bluebv_bg.gif" class="statText" valign="middle" align="right" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
        </tr>
        <tr>
          <td background="/i/steel_darkblue_bg.gif" colspan="5" class="smallFoot"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td>
        </tr>
        <tr>
          <xsl:choose>
          <xsl:when test="/TC/Ranking>0">
            <td class="statText" valign="middle" align="right" height="13"><xsl:value-of select="/TC/Ranking"/>&#160;&#160;</td>
          </xsl:when>
          <xsl:otherwise>
            <td class="statText" valign="middle" align="right" height="13">Not Ranked&#160;&#160;</td>
          </xsl:otherwise>
          </xsl:choose>
          <td class="statText" valign="middle" align="right"><xsl:value-of select="/TC/Rating"/>&#160;&#160;</td>
          <td class="statText" valign="middle" align="right">$<xsl:value-of select="format-number(/TC/HOME/Coder/TotalEarnings, '0.00')"/>&#160;&#160;</td>
          <td class="statText" valign="middle" align="right"><xsl:value-of select="/TC/HOME/Coder/NumCompetitions"/>&#160;&#160;</td>
          <td class="statText" valign="middle" align="right" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
        </tr>
        <tr>
          <td  colspan="5" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" class="smallText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td>
        </tr>
      </table>
<table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
  <tr>
    <td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
  </tr>
  <xsl:if test="count(/TC/HOME/Last3Comps/RoomResult)!='0'">
    <tr>
      <td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td>
    </tr>
    <tr>
      <td background="/i/steel_gray_bg3.gif" colspan="16" class="smallFoot" height="16" valign="middle">&#160;Statistics from your Last <xsl:value-of select="count(/TC/HOME/Last3Comps/RoomResult)"/> Matches (click the <img src="/i/coders_icon_onclear.gif" alt="" width="10" height="10" hspace="2" border="0"/> icon to view problem information).</td>
    </tr>
    <tr>
      <td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    </tr>
    <tr>
      <td background="/i/steel_bluebv_bg.gif" valign="middle" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" height="28">Coder</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Coding<br/>Phase</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;+&#160;</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Challenge<br/>Phase</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;+&#160;</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Testing<br/>Phase</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;=&#160;</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Final<br/>Points</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Adv.</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Old<br/>Rating</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;+&#160;</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">Rating<br/>Change</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" align="right">&#160;=&#160;</td>
      <td background="/i/steel_bluebv_bg.gif" class="statTextBig" valign="middle" width="10%" align="center">New<br/>Rating</td>
      <td background="/i/steel_bluebv_bg.gif" valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
    </tr>
    <tr>
      <td background="/i/steel_darkblue_bg.gif" colspan="16"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td>
    </tr>
    <xsl:for-each select="/TC/HOME/Last3Comps/RoomResult">
        <tr>
          <xsl:choose><xsl:when test="/TC/LoggedIn='true'">
            <td background="/i/steel_darkblue_bg.gif" valign="middle" width="10">
              <a>
                <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_room_stats&amp;rd=<xsl:value-of select="RoundId"/>&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
                <img src="/i/coders_icon.gif" alt="" width="10" height="10" hspace="2" border="0"/>
              </a>
            </td>
            <td background="/i/steel_darkblue_bg.gif" class="statText" valign="left">
              <a>
                <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=<xsl:value-of select="CoderId"/></xsl:attribute>
                <xsl:attribute name="CLASS">statText</xsl:attribute>
                <font>
                  <xsl:attribute name="color">
                    <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="PostRoundRating"/></xsl:with-param></xsl:call-template>
                  </xsl:attribute>
                  <xsl:value-of select="Handle"/>
                </font>
              </a>
            </td>
            </xsl:when>
            <xsl:otherwise>
              <td>
                <img src="/i/coders_icon.gif" alt="" width="10" height="10" hspace="4" border="0"/>
              </td>
              <td>
                <xsl:attribute name="CLASS">statText</xsl:attribute>
                <font>
                  <xsl:attribute name="color">
                    <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="PostRoundRating"/></xsl:with-param></xsl:call-template>
                  </xsl:attribute>
                  <b><xsl:value-of select="Handle"/></b>
                </font>
              </td>
            </xsl:otherwise></xsl:choose>
          <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(CodingPoints, '0.00')"/></td>
          <td class="statText" valign="middle" align="right">&#160;&#160;</td>
          <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(ChallengePoints, '0.00')"/></td>
          <td class="statText" valign="middle" align="right">&#160;&#160;</td>
          <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(TestPoints, '0.00')"/></td>
          <td class="statText" valign="middle" align="right">&#160;&#160;</td>
          <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(FinalPoints, '0.00')"/></td>
          <td class="statText" valign="middle" align="right">
            <xsl:choose>
            <xsl:when test="Advanced='Y'">
              Yes
            </xsl:when>
            <xsl:otherwise>
              No
            </xsl:otherwise>
            </xsl:choose>
          </td>
          <td class="statText" valign="middle" align="right">
            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PreRoundRating, '0')"/></xsl:with-param></xsl:call-template>
          </td>
          <td class="statText" valign="middle" align="right">&#160;&#160;</td>
          <td class="statText" valign="middle" align="right"><xsl:value-of select="format-number(RatingDifference, '0.00')"/></td>
          <td class="statText" valign="middle" align="right">&#160;&#160;</td>
          <td class="statText" valign="middle" align="right">
            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PostRoundRating, '0')"/></xsl:with-param></xsl:call-template>
          </td>
          <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
        </tr>
         <tr>
         <td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="2" border="0"/></td>
         </tr>
    </xsl:for-each>
    <tr>
      <td colspan="16"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td>
    </tr>
    <tr>
      <td background="/i/steel_blue_bg.gif" class="statText" colspan="16"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td>
    </tr>
    <tr>
        <td class="statText" colspan="16"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td>
    </tr>
  </xsl:if>
</table>
    </td>
    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
  </tr>
  <tr>
    <td colspan="4" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td>
  </tr>
  <tr>
    <td valign="top" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0"/></td>
    <td valign="top" width="14"><img src="/i/clear.gif" alt="" width="14" height="8" border="0"/></td>
    <td valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
  </tr>
</table>

    <!-- My Stats Ends -->
<img src="/i/clear.gif" alt="" width="1" height="1" border="0"/><br/>
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr>
    <td VALIGN="top" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></td>
    <td VALIGN="top" WIDTH="1" bgcolor="#000000"><A HREF="/?&amp;t=tournaments&amp;c=tccc03_sched"><IMG SRC="/i/tournament/tccc03/tccc03_home.gif" ALT="" WIDTH="138" HEIGHT="90" BORDER="0"/></A></td>
    <td VALIGN="top" bgcolor="#000000" CLASS="statText"><BR/>
    <B>When:</B> Feb. 18th - April 5th, 2003<BR/>
    <B>Where:</B> the University Park Hotel @ MIT in Cambridge, MA<BR/>
    <B>Total Purse:</B> $100,000<BR/><BR/>
    <FONT COLOR="#CC0000"><B>200 TopCoder Members will win money!</B></FONT><BR/>
<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tccc03_sched</xsl:attribute>Click here</A>
for more information.<BR/><BR/>
    </td>
    <td VALIGN="top" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></td>
  </tr>
</table>

<!-- Summary/Best/Worst Begins -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr>
    <td valign="middle" bgcolor="#FFFFFF" width="184"><img src="/i/label_srm_summary.gif" alt="Last Match Summary" width="184" height="26" hspace="5" border="0" align="left"/></td>
    <td width="100%" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
  </tr>
</table>
<table border="0" cellspacing="1" cellpadding="0" width="100%" bgcolor="#FFFFFF">
<tr>
    <td valign="top" width="4"><img src="/i/clear.gif" alt="" width="4" height="1" border="0"/></td>
    <td valign="top" colspan="3" class="bodyText"><a class="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><b>Single Round Match 128</b></a><br/>
Monday, January 6, 2003<br/><br/>


    </td>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
  </tr>
  <tr>
    <td valign="top" width="4"><img src="/i/clear.gif" alt="" width="4" height="1" border="0"/></td>
    <td valign="middle" align="center" bgcolor="#CCCCCC" width="33%" nowrap="0" height="15">
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>
        Div. Leaders
      </a>
    </td>
    <td valign="middle" align="center" bgcolor="#CCCCCC" width="43%" nowrap="0">
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>
        Problem Stats
      </a>
    </td>
    <td valign="middle" align="center" bgcolor="#CCCCCC" width="23%" nowrap="0">
      <a class="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>
        Results
      </a>
    </td>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
  </tr>
</table>

<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">
  <tr>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="middle" class="statText" width="100%">
       <table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#001935">
          <tr>
             <td valign="middle" height="17" align="center" colspan="5" class="statTextBig" background="/i/steel_bluebv_bg.gif">Best/Worst Rating Change</td>
          </tr>
          <tr><td colspan="5" bgcolor="#FFFFFF"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td></tr>
          <xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">
            <tr>
              <td height="14" valign="middle" width="20%" class="statTextBig" nowrap="0">&#160;&#160;&#160;<xsl:value-of select="division"/></td>
              <td valign="middle" width="10%" class="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</td>
              <td valign="middle" width="35%" class="statText" nowrap="0">&#160;&#160;
                <a>
                  <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                  <xsl:attribute name="CLASS">bodyText</xsl:attribute>
                  <font>
                    <xsl:attribute name="color">
                      <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                    </xsl:attribute>
                    <xsl:value-of select="handle"/>
                  </font>
                </a>
              </td>
              <td valign="middle" width="15%" class="statText" align="center"><xsl:value-of select="change"/></td>
              <td valign="middle" width="20%" class="statText" nowrap="0">&#160;<xsl:value-of select="room_name"/></td>
            </tr>
          </xsl:for-each>
          <tr><td colspan="5" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="6" border="0"/></td></tr>
       </table>
    </td>
    <td valign="top" width="6"><img src="/i/clear.gif" alt="" width="6" height="1" border="0"/></td>
  </tr>

<!-- Uncomment for invit02

  <TR>
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" CLASS="bodyText"><BR/>
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=invit02_champ</xsl:attribute><B>G'day Mate!</B></A><BR/>
by MaryBeth Biondi, <I>TopCoder Staff</I><BR/>

<P>
...
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=tournaments&amp;c=invit02_champ</xsl:attribute>read&#160;more</A>
</P>
    </TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->

  <tr><td colspan="3" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="8" border="0"/></td></tr>
</table>

<!-- Summary/Best/Worst Ends -->

<!-- Coder Point of View Begins -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#FFFFFF">  
  <tr><td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="8" border="0"/></td>
      <td valign="top" colspan="7"><img src="/i/label_coder_view.gif" alt="Coder's Point of View" width="148" height="26" border="0"/></td>   
      <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>    
  </tr>  
  <tr>
    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>  
    <td valign="top" width="55" align="left" class="bodyText" rowspan="2"><img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1"/><br/> 
    By&#160;Yarin<br/><i>[TC]&#160;Member</i><br/></td>
    <td valign="top" width="8" rowspan="2"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td> 
    <td valign="top" width="100%" align="left" class="bodyText" colspan="2">
    <font size="2" color="#000000" face="tahoma, verdana"><b>SRM 129</b></font> 
    </td>
  </tr>      
  <tr>
    <td valign="top" class="bodyText" width="100%">
	<a class="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm129_prob</xsl:attribute>
        <b>Problem Set Analysis &amp; Opinion</b>
      </a><br/>
Tuesday, January 14, 2003<br/>      
<p>It was a long time since it last happened, but last night it happened again - a cancelled SRM! 
Many people (including me) had serious connection problems starting just a few minutes before the 
SRM was about to begin. The contest was postponed 20 minutes, but even then not everyone who had 
registered could login to the arena. The admins quickly realized this couldn't be a fair contest, 
so they decided to cancel it but still let those who wished work on the problems. 
A good decision as the problem set was a nice one!</p>

<p>
I guess it was my usual luck that I, <b>Yarin</b>, should do one of my best performances ever when 
it didn't count, winning Division-I with <b>1656.91</b> points. In Division-II, another impressive 
score was seen: <b>1601.35</b> by first timer <b>Yi Zhang</b>. The runner ups in Division-I was 
<b>radeye</b> and in Division-II <b>Karshikinpa</b>
...<a class="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=srm129_prob</xsl:attribute>Get the analysis</a>
</p>
    </td>
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>     
  </tr>
  <tr><td valign="top" colspan="9"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>  
  <tr>  
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
    <td valign="top" width="100%" colspan="7" bgcolor="#43515E"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>    
    <td valign="top" width="8"><img src="/i/clear.gif" alt="" width="8" height="1" border="0"/></td>
  </tr> 
  <tr><td valign="top" colspan="8"><img src="/i/clear.gif" alt="" width="1" height="4" border="0"/></td></tr>   
</table>
<!-- End of Point of View -->

<xsl:call-template name="arena"/>
<p><br/></p>
     </td>
  <!-- Center Column Ends -->
    <td bgcolor="#001935" valign="top" class="statText" width="244"><img src="/i/clear.gif" alt="" width="244" height="1" border="0"/><br/>
<!--SRM Sponsor Starts-->

  <!--   <IMG SRC="/i/srm_home.gif" WIDTH="244" HEIGHT="250" ALT="" BORDER="0" USEMAP="#srm_home"/><MAP NAME="srm_home">
<AREA ALT="" COORDS="124,28,228,90" HREF="/?&amp;t=tces&amp;c=fbi"/>
<AREA ALT="" COORDS="141,160,224,187" HREF="/?&amp;t=schedule&amp;c=srm_spon_artifact"/>
<AREA ALT="" SHAPE="POLY" COORDS="23,193,112,193,121,201,234,201,234,240,38,240,12,216,12,193" HREF="/stat?&amp;c=last_match"/>
</MAP> -->

					<img usemap="#artifact_home" src="/i/es/artifact/artifact_home.gif" alt="" width="244" height="160" border="0"/><br/>
					<map name="artifact_home">
						<area alt="TCES" shape="poly" coords="17,33,17,60,141,60,141,92,228,92,228,25,17,25" href="/?&amp;t=schedule&amp;c=srm_spon_artifact"/>					
						<!-- <area alt="TCES" shape="poly" coords="17,33,17,60,141,60,141,92,228,92,228,25,17,25" href="/?&amp;t=tces&amp;c=artifact"/> -->
						<!-- <area alt="" shape="poly" coords="229,104,120,105,105,94,11,95,10,120,36,146,229,148" href="/?RoundId=4440&amp;t=schedule&amp;c=srm"/> --> 
						<area alt="" SHAPE="poly" COORDS="229,104,120,105,105,94,11,95,10,120,36,146,229,148" HREF="/stat?&amp;c=last_match"/>
					</map>
<!--SRM Sponsor Ends-->

<!-- <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
<IMG SRC="/i/tces_promo.gif" alt="" width="244" height="77" border="0"/></A> -->

<!-- Software Promo Begins -->
                    <a href="/?&amp;t=development&amp;c=bonus_contest_0303"><img src="/i/tcs_board.gif" alt="TCS" width="244" height="156" vspace="1" border="0"/></a>
<!-- Software Promo Ends -->

<!-- Software Leader Board Begins -->
            <table width="100%" border="0" cellspacing="0" cellpadding="0" valign="top" bgcolor="#001935" background="/i/steel_darkblue_bg.gif">
                <tr><td height="17" class="moduleTitle" valign="middle"><img src="/i/module_labels_tcs_coders.gif" alt="TopCoder Software Leaders" width="226" height="17" border="0"/></td></tr>
            </table>

            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="3" border="0"/></td>
                    <td width="59%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="39%"><img src="/i/clear.gif" width="1" height="3" border="0"/></td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="3" border="0"/></td>
                </tr>

                <tr valign="middle">
                    <td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
                    <td class="statTextBig" background="/i/steel_bluebv_bg.gif">Handle</td>
                    <td class="statTextBig" align="right" background="/i/steel_bluebv_bg.gif" nowrap="nowrap">Average Score</td>
                    <td width="10" height="15" background="/i/steel_bluebv_bg.gif"><img src="/i/clear.gif" width="10" height="15" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
                    <td class="statText" align="right">89.46</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150940">orb</a></td>
                    <td class="statText" align="right">83.78</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=285960">jkang</a></td>
                    <td class="statText" align="right">82.40</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=141163">darkstalker</a></td>
                    <td class="statText" align="right">81.89</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td colspan="4" class="smallFoot"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                    <td class="statText"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
                    <td class="statText" align="right">81.52</td>
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
                </tr>

                <tr>
                    <td colspan="4"><img src="/i/clear.gif" width="1" height="10" border="0"/></td>
                </tr>
            </table>
<!-- Software Leader Board Ends -->

<!-- <A HREF="/?&amp;t=news_events&amp;c=pr_10_22_02"> -->

<img src="/i/clear.gif" alt="" width="244" height="1" border="0"/>
     <xsl:choose>
     <xsl:when test="number(/TC/Rating)&lt;1200">
       <xsl:call-template name="top_scorers"><xsl:with-param name="division">2</xsl:with-param></xsl:call-template>
     </xsl:when>
     <xsl:otherwise>
       <xsl:call-template name="top_scorers"><xsl:with-param name="division">1</xsl:with-param></xsl:call-template>
     </xsl:otherwise>
     </xsl:choose>

            <table border="0" cellspacing="0" cellpadding="0" bgcolor="#001935" background="/i/steel_darkblue_bg.gif" width="100%">
                 <tr>
                  <td colspan="3" bgcolor="#001935"><img src="/i/label_quick_stats_home.gif" alt="Quick Stats" width="166" height="17" border="0"/></td>
                </tr>
                 <tr>
                  <td bgcolor="#FFFFFF" colspan="3"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
                </tr>
              <tr>
                <td rowspan="4"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
                <td><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td>
                <td rowspan="4"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
              </tr>
              <tr>
                <td class="statText" valign="top">Select a Quick Stat from the menu below.</td>
              </tr>
              <tr>
                <td class="statText" valign="top"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td>
              </tr>
               <tr>
                <td class="quickstatText" valign="top">
    <!-- Quick Stat Pulldown Begins -->

<xsl:call-template name="quick_stats_pulldown"/>

                </td>
              </tr>
            </table><br/>
<!-- <A HREF="/?&amp;t=schedule&amp;c=2002sun_sched">
<IMG SRC="/i/2002sn_winner.gif" ALT="SunNetwork Coding Challenge" WIDTH="244" HEIGHT="156" VSPACE="5" BORDER="0"/></A> -->
            <a href="/stat?c=member_profile&amp;cr=304168">
            <img src="/i/codermonth_dec.gif" alt="Coder of the Month" width="244" height="116" vspace="10" border="0"/></a>
    </td>
<!-- Body Area Ends -->
  </tr>
</table>
  </xsl:template>
</xsl:stylesheet>
