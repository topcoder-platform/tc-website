<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="../includes/modules/srm_dates.xsl"/>

  <xsl:import href="../includes/modules/common_questions.xsl"/>

  <xsl:import href="../includes/modules/tc_updates.xsl"/>

  <xsl:import href="../includes/modules/top_10_wins_div1.xsl"/> 

  <xsl:import href="../includes/modules/top_10_wins_div2.xsl"/>   

  <xsl:import href="../includes/modules/last_srm.xsl"/>

  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>

  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>

  <xsl:import href="../includes/modules/countries.xsl"/>   

  <xsl:import href="../includes/modules/coder_week.xsl"/>

  <xsl:import href="../includes/modules/top_10_coders.xsl"/>

  <xsl:import href="../includes/modules/round_table.xsl"/>

  <xsl:import href="../includes/modules/my_stats.xsl"/>

  <xsl:import href="../includes/modules/arena.xsl"/>   

  <xsl:import href="../includes/modules/calendar.xsl"/>  

  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>

  <xsl:template name="MemberBody">



<!-- <SCRIPT type="text/javascript">alert("ALTHOUGH IT MAY LOOK JUST LIKE THE LAST HOME PAGE, THIS IS MEMBER HOME, MAN...");</SCRIPT> -->



<!-- Body Begins -->

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">

  <TR>

    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/><BR/>

      <!-- SRM Promo Begins -->

      <!-- SRM Promo Ends -->    

    </TD>

    <!-- Right Column Include Begins -->

    <!-- Gutter -->

    <TD WIDTH="3" ROWSPAN="2" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>

    <!-- Gutter Ends -->

    <!-- Right Column Begins -->

    <TD WIDTH="170" ROWSPAN="2" BGCOLOR="#CCCCCC" VALIGN="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/> --> 

<xsl:call-template name="my_stats"/>

<xsl:call-template name="calendar"/>

<IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>

<xsl:call-template name="arena"/>

<xsl:call-template name="top_10_coders"/>

    </TD>

  <!-- Right Column Ends -->

    

  <!-- Gutter -->

    <TD WIDTH="25" ROWSPAN="2" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>

    <!-- Gutter Ends -->       

  </TR>    

   <TR>

     <!-- Left Column Include Begins -->   

     <!-- Gutter Begins -->

     <!-- <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> -->

     <!-- Gutter Ends -->

     <!-- Left Column Begins -->

     <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top" CLASS="statText"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><BR/> -->

      <xsl:call-template name="srm_dates"/>

      <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>

          <xsl:choose>

          <xsl:when test="/TC/LoggedIn='true'"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/>

          </xsl:when>

          <xsl:otherwise>

          <xsl:call-template name="common_questions"/>

          </xsl:otherwise>

          </xsl:choose>

      <xsl:call-template name="tc_updates"/>

      <xsl:call-template name="countries"/>              

      <IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="10"/>        

      </TD>    

  <!-- Left Column Ends -->

  <!-- Gutter Begins -->

    <TD WIDTH="3" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>

    <!-- Gutter Ends -->

<!-- Left Column Include Ends -->



<!-- Body Area -->

  <!-- Center Column Begins -->  

    <TD WIDTH="100%" VALIGN="top" ALIGN="center">

  <!-- Motorola Promo Begins -->

      <!-- <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC" WIDTH="100%">

        <TR>

          <TD WIDTH="187" VALIGN="top" BGCOLOR="#990000"><A HREF="/?RoundId=4085&amp;t=schedule&amp;c=srm"><IMG SRC="/i/moto_promo1.gif" ALT="" WIDTH="240" HEIGHT="161" BORDER="0"/></A></TD>

          <TD WIDTH="285" VALIGN="top" BGCOLOR="#990000"><A HREF="http://www.topcoder.com/i/mot_redir.html" target="_blank"><IMG SRC="/i/moto_promo2.gif" ALT="" WIDTH="244" HEIGHT="161" BORDER="0"/></A></TD>

          <TD WIDTH="100%" BACKGROUND="/i/mot_promo_bg.gif" BGCOLOR="#990000" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

          <TD WIDTH="20" BACKGROUND="/i/mot_promo_bg.gif" BGCOLOR="#990000" VALIGN="top" ALIGN="right"><IMG SRC="/i/mot_promo_top_rt.gif" ALT="" WIDTH="23" HEIGHT="22" BORDER="0"/></TD>          

        </TR>

      </TABLE> -->

     <!-- Motorola Promo Ends --> 



  <!-- Sun Promo Begins -->

      <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC" WIDTH="100%">

        <TR>

          <TD WIDTH="187" VALIGN="top" BGCOLOR="#43515E"><A HREF="/?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/sun_promo1.jpg" ALT="" WIDTH="240" HEIGHT="161" BORDER="0"/></A></TD>

          <TD WIDTH="285" VALIGN="top" BGCOLOR="#43515E"><A HREF="/i/sun_redir.html" target="_blank"><IMG SRC="/i/sun_promo2.gif" ALT="" WIDTH="244" HEIGHT="161" BORDER="0"/></A></TD>

          <TD WIDTH="100%" BACKGROUND="/i/sun_promo_bg.gif" BGCOLOR="#43515E" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

          <TD WIDTH="20" BACKGROUND="/i/sun_promo_bg.gif" BGCOLOR="#43515E" VALIGN="top" ALIGN="right"><IMG SRC="/i/sun_promo_top_rt.gif" ALT="" WIDTH="23" HEIGHT="22" BORDER="0"/></TD>          

        </TR>

      </TABLE>

     <!-- Sun Promo Ends -->

     <!-- My Stats Begins -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">

  <TR>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>

    <TD VALIGN="top" WIDTH="75" ALIGN="left" BGCOLOR="#FFFFFF"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>

    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/label_my_stats_big.gif" ALT="My Stats" WIDTH="92" HEIGHT="26" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>

  </TR>

</TABLE>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">  

  <TR>

    <TD VALIGN="top" WIDTH="11" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

    <TD COLSPAN="2" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0" VSPACE="1"/><BR/>

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">

        <TR>

          <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="5" CLASS="statText" HEIGHT="18" VALIGN="bottom"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/><A><xsl:attribute name="HREF">/stat?c=member_profile&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute><IMG SRC="/i/my_profile.gif" ALT="" WIDTH="59" HEIGHT="14" BORDER="0"/></A><A><xsl:attribute name="HREF">/stat?c=ratings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute><IMG SRC="/i/my_rating.gif" ALT="" WIDTH="96" HEIGHT="14" BORDER="0"/></A><A><xsl:attribute name="HREF">/stat?c=earnings_history&amp;cr=<xsl:value-of select="/TC/UserId"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute><IMG SRC="/i/my_earning.gif" ALT="" WIDTH="111" HEIGHT="14" BORDER="0"/></A></TD>     

        </TR>        

        

        

        <!-- <TR>

          <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="5" CLASS="statText" HEIGHT="16">&#160;&#160;<A><xsl:attribute name="HREF">?t=statistics&amp;c=member_profile&amp;Coder_Id=<xsl:value-of select="/TC/UserId"/></xsl:attribute><xsl:attribute name="CLASS">statText</xsl:attribute> profile </A>&#160;|&#160;<A HREF="/index?t=statistics&amp;c=ratings_history" CLASS="statText"> rating history </A>&#160;|&#160;<A HREF="/index?t=statistics&amp;c=earnings_history" CLASS="statText"> earnings history </A></TD>    

        </TR> -->       





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

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">  

  <TR>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    

  </TR>

  <xsl:if test="count(/TC/HOME/Last3Comps/RoomResult)!='0'">

    <TR>

      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>    

    </TR>  

    <TR>

      <TD BACKGROUND="/i/steel_gray_bg3.gif" COLSPAN="16" CLASS="smallFoot" HEIGHT="16" VALIGN="middle">&#160;Statistics from your Last <xsl:value-of select="count(/TC/HOME/Last3Comps/RoomResult)"/> Matches (click the <IMG SRC="/i/coders_icon_onclear.gif" ALT="" WIDTH="10" HEIGHT="10" HSPACE="2" BORDER="0"/> icon to view problem information).</TD>    

    </TR> 

    <TR>

      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    

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

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(CodingPoints, '0.00')"/></TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(ChallengePoints, '0.00')"/></TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(TestPoints, '0.00')"/></TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(FinalPoints, '0.00')"/></TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">

            <xsl:choose>

            <xsl:when test="Advanced='Y'">

              Yes

            </xsl:when>

            <xsl:otherwise> 

              No

            </xsl:otherwise>

            </xsl:choose>

          </TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">

            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PreRoundRating, '0')"/></xsl:with-param></xsl:call-template>

          </TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right"><xsl:value-of select="format-number(RatingDifference, '0.00')"/></TD>    

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">&#160;&#160;</TD>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" VALIGN="middle" ALIGN="right">

            <xsl:call-template name="GetRatingToDisplay"><xsl:with-param name="rating"><xsl:value-of select="format-number(PostRoundRating, '0')"/></xsl:with-param></xsl:call-template>

          </TD>      

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>        

        </TR>

         <TR>

         <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    

         </TR>        

    </xsl:for-each>

    <TR>

      <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    

    </TR>

    <TR>

      <TD BACKGROUND="/i/steel_blue_bg.gif" CLASS="statText" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>

    </TR>

    <TR>

        <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="statText" COLSPAN="16"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>

    </TR>        

  </xsl:if>

</TABLE>      

      

    </TD>

    <TD VALIGN="top" WIDTH="10" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>

  </TR>

  <TR>

    <TD COLSPAN="4" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>

  </TR>     

  <TR>

    <TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>

    <TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="14"><IMG SRC="/i/clear.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>

    <TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

    <TD VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

  </TR>  

</TABLE> 

    <!-- My Stats Ends -->

                         

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" WIDTH="100%" VALIGN="top">

  <TR>

    <TD VALIGN="bottom" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>

    <TD VALIGN="bottom" BGCOLOR="#FFFFFF" WIDTH="75"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>

    <TD CLASS="bodySubHead" VALIGN="top" BGCOLOR="#FFFFFF">

<xsl:choose>

  <xsl:when test="number(/TC/Rating)&lt;1200">

    <A HREF="/stat?c=round_stats&amp;dn=2"><IMG SRC="/i/label_div_2.gif" ALT="Division II" WIDTH="116" HEIGHT="26" BORDER="0"/></A>

  </xsl:when>

  <xsl:otherwise>

    <A HREF="/stat?c=round_stats&amp;dn=1"><IMG SRC="/i/label_div_1.gif" ALT="Division I" WIDTH="116" HEIGHT="26" BORDER="0"/></A>

  </xsl:otherwise>

</xsl:choose>

    </TD>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>

    <TD ROWSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="2" HEIGHT="1" BORDER="0"/></TD>

    <TD ROWSPAN="4" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif">

  <!-- SRM Results Begins -->  

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">

        <TR>

          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right" BACKGROUND=""><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>

          <TD VALIGN="top" WIDTH="75" ALIGN="left" BGCOLOR="#FFFFFF" BACKGROUND=""><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>

          <TD VALIGN="middle" BGCOLOR="#FFFFFF" BACKGROUND=""><A HREF="/index?t=statistics&amp;c=match_summary"><IMG SRC="/i/label_srm_summary_sm.gif" ALT="Last Match Summary" WIDTH="102" HEIGHT="26" BORDER="0"/></A></TD>

          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right" BACKGROUND=""><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>

        </TR>

        <TR>

          <TD VALIGN="top" WIDTH="11" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

          <TD COLSPAN="2" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" HEIGHT="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="105" HEIGHT="1" BORDER="0"/><BR/>

    <!-- Last SRM Begins --> 

<xsl:call-template name="last_srm"/>

    <!-- Last SRM Ends -->             

            

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">

        <TR>

          <TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>

        </TR>              

        <TR>

          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="left" BACKGROUND=""><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>

          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="75" ALIGN="left" BACKGROUND=""><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>

          <TD CLASS="bodyTextBold" VALIGN="middle" BGCOLOR="#FFFFFF" BACKGROUND=""><IMG SRC="/i/label_quick_stats_sm.gif" ALT="Quick Stats" WIDTH="104" HEIGHT="26" BORDER="0"/></TD>                              

        </TR>

              <TR>

                <TD CLASS="statText" VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>

              </TR>              

              <TR>

                <TD CLASS="statText" VALIGN="top" COLSPAN="3">Select a Quick Stat from the menu below.</TD>

              </TR>

              <TR>

                <TD CLASS="statText" VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>

              </TR>                              

               <TR>

                <TD CLASS="quickstatText" VALIGN="top" COLSPAN="3">

    <!-- Quick Stat Pulldown Begins --> 

<xsl:call-template name="quick_stats_pulldown"/>

    <!-- Quick Stat Pulldown Ends -->

                </TD>

              </TR>                 

            </TABLE>  

          </TD>

          <TD VALIGN="top" WIDTH="10" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>

        </TR>

      </TABLE>

    <!-- Quick Stat Pulldown Begins --> 

<xsl:call-template name="quick_stats_tidbit"/>

    <!-- Quick Stat Pulldown Ends -->      

  <!-- Featured Stats Ends -->

    </TD>

  </TR>

  <TR>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11" HEIGHT="200"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="2" VALIGN="top" BGCOLOR="#000033"><IMG SRC="/i/clear.gif" ALT="" WIDTH="105" HEIGHT="1" BORDER="0"/><BR/>

    <!-- SRM Results Begins -->

    

<xsl:choose>

  <xsl:when test="number(/TC/Rating)&lt;1200">

     <xsl:call-template name="top_10_wins_div2"/>

  </xsl:when>

  <xsl:otherwise>

     <xsl:call-template name="top_10_wins_div1"/>

  </xsl:otherwise>

</xsl:choose>     

        

    <!-- SRM Results Ends --> 

    </TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

  </TR>  

  <TR>

    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left_blue_home.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

  </TR>  

</TABLE>

  <!-- SRM Results Ends -->

<!-- Coder of the Week Begins -->

<xsl:call-template name="coder_week"/>

<!-- Coder of the Week Ends -->         

    </TD>

  <!-- Center Column Ends -->

<!-- Body Area Ends -->

  </TR>   

</TABLE>

  </xsl:template>

</xsl:stylesheet>

