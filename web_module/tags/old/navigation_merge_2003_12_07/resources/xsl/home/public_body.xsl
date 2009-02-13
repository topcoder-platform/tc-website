<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/srm_dates.xsl"/>
  <xsl:import href="../includes/modules/common_questions.xsl"/>
  <xsl:import href="../includes/modules/tc_updates.xsl"/>
  <xsl:import href="../includes/modules/last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>
  <xsl:import href="../includes/modules/countries.xsl"/>    
  <xsl:import href="../includes/modules/coder_week.xsl"/>
  <xsl:import href="../includes/modules/top_10_coders.xsl"/>
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>
  <xsl:import href="../includes/modules/arena.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>  
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="PublicBody">
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

<xsl:call-template name="calendar"/>

<IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>

<xsl:call-template name="module_login"/> 

<xsl:call-template name="top_10_coders"/>

<xsl:call-template name="arena"/>

<!-- <xsl:call-template name="round_table"/>

                <xsl:choose>

                  <xsl:when test="/TC/LoggedIn='true'">

                  </xsl:when>                  

                  <xsl:otherwise>

                     <xsl:call-template name="practice_room"/>

                  </xsl:otherwise>

                </xsl:choose> -->

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

    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><BR/> -->

<xsl:call-template name="srm_dates"/>

<IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>

<xsl:call-template name="common_questions"/>

<xsl:call-template name="tc_updates"/>

<xsl:call-template name="countries"/>

<IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="5"/>

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
  <TR>
    <TD VALIGN="middle" COLSPAN="4" WIDTH="100%" ALIGN="left" BGCOLOR="#FFFFFF"><!-- <FONT SIZE="4" COLOR="#093158" FACE="tahoma, verdana"><B>&#160;&#160;&#160;&#160;2002 TopCoder Collegiate Challenge</B></FONT><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/> --><IMG SRC="/i/label_2002tccc.gif" ALT="" WIDTH="300" HEIGHT="26" BORDER="0" VSPACE="3"/></TD>
    <!-- <TD VALIGN="top" WIDTH="33%" COLSPAN="2" ALIGN="left" BGCOLOR="#FFFFFF"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="33%" COLSPAN="3" ALIGN="left" BGCOLOR="#FFFFFF"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD> -->
  </TR>        

      </TABLE>

     <!-- Sun Promo Ends -->   

<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif">
  <TR>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="17" BORDER="0"/></TD>
  </TR>   
  <TR>
    <TD VALIGN="top" WIDTH="100%" NOWRAP="0" BGCOLOR="#44515E" ALIGN="center"><A HREF="/?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/sumsemi_sm_top1.gif" ALT="" WIDTH="267" HEIGHT="60" BORDER="0"/><IMG SRC="/i/sumsemi_sm_top2.gif" ALT="" WIDTH="217" HEIGHT="60" BORDER="0"/></A></TD>
  </TR>   
  <TR>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#FFFFFF" ALIGN="center"><IMG SRC="/i/sumsemi_sm_top3.gif" ALT="" WIDTH="484" HEIGHT="17" BORDER="0"/></TD>
  </TR> 
</TABLE> -->


<!-- breakdown blurb --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">   
  <TR>  
     <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
     <TD VALIGN="top" COLSPAN="7" BGCOLOR="#44515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>     
     <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>  
     <TD VALIGN="top" COLSPAN="9" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD>
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="40%" CLASS="bodyText" NOWRAP="0">

<A HREF="/?t=statistics&amp;c=2002tccc_breakdown"><FONT SIZE="3" COLOR="#CC0000" FACE="tahoma, verdana"><B>Tournament&#160;Breakdown</B></FONT></A>

<DIV ALIGN="center"><IMG SRC="/i/02tccc_logow_sm.gif" ALT="" WIDTH="96" HEIGHT="74" BORDER="0"/></DIV>

<B>Semifinals/Championship</B><BR/>
Location: University Park Hotel &#64; MIT<BR/>
When: Friday, April 19th and Saturday, April 20th<BR/>
Check back here for updates!<BR/>

<P>
<!-- <A HREF="/?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyText">Click here</A> to view tournament room 
assignments as well as "The Favorites", "The Cinderellas" and who to "Keep Your Eye On". -->
<UL>
	<LI><A HREF="/?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyText">Semifinals Breakdown</A></LI>
	<LI><A HREF="/?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyText">Room Assignments</A></LI>
	<LI><A HREF="/?t=statistics&amp;c=2002tccc_favs" CLASS="bodyText">Favorites</A></LI>
	<LI><A HREF="/?t=statistics&amp;c=2002tccc_cind" CLASS="bodyText">Cinderellas</A></LI>
	<LI><A HREF="/?t=statistics&amp;c=2002tccc_eyeon" CLASS="bodyText">Keep Your Eye On...</A></LI>
</UL>
</P>
    </TD>
    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#44515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="60%" CLASS="bodyText">
<P><FONT SIZE="3" COLOR="#000000" FACE="tahoma, verdana"><B>Sun Technical Presentation</B></FONT></P>
<P>
Sun will be presenting on J2ME, Java &amp; XML,
Java &amp; LOGO, and the <A HREF="/i/sun_redir.html" CLASS="bodyText" target="_blank">STAR program</A>.</P>

<P>
<B>Attendance:</B>
<UL>
	<LI>Open to members only</LI>
	<LI>Saturday, April 20th</LI>
	<LI>9:00am - 11:30am</LI>
	<LI>University Park Hotel &#64; MIT</LI>
	<LI>Limited seating</LI>
	<LI><A HREF="mailto:tccc_sun@topcoder.com?subject=Seating at Sun Presentation" CLASS="bodyText">Contact us</A> for seating</LI>
</UL></P>     
    </TD>    
    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
     <TD VALIGN="top" COLSPAN="9" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD>
  </TR>  
  <TR>  
     <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
     <TD VALIGN="top" COLSPAN="7" BGCOLOR="#44515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>     
     <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>  
     <TD VALIGN="top" COLSPAN="9" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="8" BORDER="0"/></TD>
  </TR>     
</TABLE> 
    <!-- Last SRM Begins --> 

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">

  <TR>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>

    <TD VALIGN="top" WIDTH="75" ALIGN="left" BGCOLOR="#FFFFFF"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>

    <TD CLASS="header" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="184"><A HREF="/index?t=statistics&amp;c=match_summary"><IMG SRC="/i/label_srm_summary.gif" ALT="Last Match Summary" WIDTH="184" HEIGHT="26" BORDER="0"/></A></TD>

    <TD CLASS="header" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="100%" ALIGN="right"><A HREF="/stat?c=last_match"><IMG SRC="/i/label_view_results.gif" ALT="View Results" WIDTH="194" HEIGHT="26" BORDER="0"/></A></TD>

    <!-- <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD> -->

  </TR>

</TABLE>  

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">  

  <TR>

    <TD VALIGN="top" WIDTH="11" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

    <TD COLSPAN="2" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">

<xsl:call-template name="last_srm"/>

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

    <!-- Last SRM Ends -->                     

  <!-- Division I Begins -->

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" WIDTH="100%">

  <TR>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="75" ALIGN="left"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>

    <TD CLASS="bodySubHead" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="60%"><A HREF="/stat?c=all_time_wins_by_div&amp;dn=1"><IMG SRC="/i/label_div_1.gif" ALT="Division I" WIDTH="116" HEIGHT="26" BORDER="0" ALIGN="left"/></A></TD>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>

    <TD ROWSPAN="8" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="2" HEIGHT="1" BORDER="0"/></TD>

    <TD ROWSPAN="8" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="40%">

  <!-- Featured Stats Begins -->  

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">

        <TR>

          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right" BACKGROUND=""><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>

          <TD VALIGN="top" WIDTH="75" ALIGN="left" BGCOLOR="#FFFFFF" BACKGROUND=""><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>

          <TD CLASS="bodySubHead" VALIGN="middle" BGCOLOR="#FFFFFF" BACKGROUND="" WIDTH="100%"><IMG SRC="/i/label_quick_stats_sm.gif" ALT="Quick Stats" WIDTH="104" HEIGHT="26" BORDER="0"/></TD>

          <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right" BACKGROUND=""><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>

        </TR>

  <!-- <TR>

    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999" WIDTH="50%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>

  </TR> --> 

        <TR>

          <TD VALIGN="top" WIDTH="11" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

          <TD COLSPAN="2" VALIGN="top" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="105" HEIGHT="1" BORDER="0"/><BR/>

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="2" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">

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

    <!-- Quick Stat Pulldown Begins --> 

<xsl:call-template name="quick_stats_tidbit"/>

    <!-- Quick Stat Pulldown Ends -->              

          </TD>

          <TD VALIGN="top" WIDTH="10" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>

        </TR>

  <!-- <TR>

    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999" WIDTH="40%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>

  </TR>     

  <TR>

    <TD VALIGN="top" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>

    <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/clear.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#999999" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#999999" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

  </TR>  

  <TR>

    <TD VALIGN="top" BGCOLOR="#999999" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#999999" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#999999" WIDTH="40%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#999999" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

  </TR> -->

      </TABLE>

  <!-- Featured Stats Ends -->

    </TD>

  </TR>

  <TR>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="105" HEIGHT="1" BORDER="0"/><BR/>

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">

        <TR>

          <TD COLSPAN="4" WIDTH="1"><IMG HEIGHT="3" WIDTH="1" SRC="/i/clear.gif"/></TD>

        </TR>

        <TR>

          <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="registerNav" COLSPAN="4" VALIGN="middle" HEIGHT="14">&#160;&#160;Top-3 room winners from the last match.<!-- Top-3 winners from match 67 --></TD>

        </TR>        

        <TR>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    

        </TR>                

        <TR>

          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="13">&#160;&#160;Place&#160;&#160;&#160;</TD>  

          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" WIDTH="32%">Handle</TD>

          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Room#</TD>

          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Points</TD>  

        </TR>

        <TR>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4" CLASS="smallFoot"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    

        </TR> 

        <!-- <TR>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4" CLASS="statTextBig">There were no Division-I coders in this round.<BR/><BR/></TD>    

        </TR> -->                
        <TR>
          <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">&#160;&#160;&#160;1st.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=153902" CLASS="coderTextRed">evd</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">2</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1152.03</TD>  
        </TR>    
        <TR>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right" HEIGHT="12">2nd.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=152073" CLASS="coderTextRed">NDBronson</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1130.16</TD>
        </TR>
        <TR>
          <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">3rd.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=151360" CLASS="coderTextYellow">buddh4sack</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">8</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">580.93</TD>
        </TR>

        <TR>

          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>

        </TR>

        <TR>

          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>

        </TR>

        <TR>

          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>

        </TR>                          

      </TABLE>  

    </TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

  </TR>

  <!-- <TR>

    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>

  </TR> -->  

  <!-- Division I Ends -->

  <!-- Division II Begins -->

  <TR>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/steelblue_top_left1.gif" ALT="" WIDTH="11" HEIGHT="26" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="75" ALIGN="left"><IMG SRC="/i/steelblue_top_left2.gif" ALT="" WIDTH="75" HEIGHT="26" BORDER="0"/></TD>

    <TD CLASS="bodySubHead" VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="100%"><A HREF="/stat?c=all_time_wins_by_div&amp;dn=1"><IMG SRC="/i/label_div_2.gif" ALT="Division II" WIDTH="116" HEIGHT="26" BORDER="0" ALIGN="left"/></A></TD>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="26" BORDER="0"/></TD>

  </TR>

  <TR>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="105" HEIGHT="1" BORDER="0"/><BR/>

      <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">

        <TR>

          <TD COLSPAN="4" WIDTH="1"><IMG HEIGHT="3" WIDTH="1" SRC="/i/clear.gif"/></TD>

        </TR>

        <TR>

          <TD BACKGROUND="/i/steel_gray_bg3.gif" CLASS="registerNav" COLSPAN="4" VALIGN="middle" HEIGHT="14">&#160;&#160;Top-3 room winners from the last match.<!-- Top-3 winners from match 68 --></TD>

        </TR>        

        <TR>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    

        </TR>      

        <TR>

          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="10" HEIGHT="13">&#160;&#160;Place&#160;&#160;&#160;</TD>  

          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" WIDTH="32%">Handle</TD>

          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Room#</TD>

          <TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="smallFoot" VALIGN="middle" ALIGN="center" WIDTH="32%">Points</TD>  

        </TR>

        <TR>

          <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="4" CLASS="smallFoot" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    

        </TR>        

        <TR>
          <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">&#160;&#160;&#160;1st.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=274023" CLASS="coderTextBlue">venco</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">48</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1651.44</TD>  
        </TR>    
        <TR>
          <TD CLASS="statText" VALIGN="middle" ALIGN="right" HEIGHT="12">2nd.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=268010" CLASS="coderTextBlue">cem1834</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">26</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1651.01</TD>
        </TR>
        <TR>
          <TD CLASS="statText" ALIGN="right" VALIGN="middle" HEIGHT="12">3rd.&#160;&#160;&#160;</TD>
          <TD CLASS="statText" VALIGN="middle"><A HREF="/stat?c=member_profile&amp;cr=262602" CLASS="coderTextBlue">infrared</A></TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">27</TD>
          <TD CLASS="statText" VALIGN="middle" ALIGN="center">1649.46</TD>
        </TR>

        <TR>

          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>

        </TR>

        <TR>

          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_blue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>

        </TR>

        <TR>

          <TD  COLSPAN="4" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="smallText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>

        </TR>          

      </TABLE>  

    </TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>

  </TR>

  <!-- <TR>

    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" WIDTH="100%" BACKGROUND="/i/steel_blue_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>

  </TR> -->    

  <TR>

    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left_blue_home.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>

    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>

  </TR>  

</TABLE>

  <!-- Division II Ends -->

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

