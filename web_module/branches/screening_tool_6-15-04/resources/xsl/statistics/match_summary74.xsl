<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
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
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Last Match Summary</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;The next TopCoder competition:</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="40%">&#160;Match</TD>            
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="40%">&#160;Date</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" WIDTH="20%">&#160;Time</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                        
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4100&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 75<!-- 2002 TCCC Regional Championships --></A></TD>            
              <TD VALIGN="middle" CLASS="statText">Tuesday, March 26</TD>
              <TD VALIGN="middle" CLASS="statText">8:00pm EST</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
            </TR>
                    <!-- <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/i/mot_redir.html" target="_blank"><IMG SRC="/i/moto_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR> -->          
                    <!-- <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=schedule&amp;c=tourny_spons"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR> -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 74 - March 25, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>                                               
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-I<!-- Northeast Region --> </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>
<A HREF="/stat?c=all_time_wins_by_div&amp;dn=1" CLASS="statText">View the list of Division-I Wins</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="statText">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A> 
<A HREF="/stat?c=all_time_wins" CLASS="statText">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>
<A HREF="/stat?&amp;c=highest_totals&amp;dn=2" CLASS="statText">View the list of Division-II Point Totals</A>
-->
<P>
<A HREF="/stat?c=member_profile&amp;cr=153505" CLASS="coderTextRed">ambrose</A> was the winner in Room 1 with a division-high 1159.53 points.  <A HREF="/stat?c=member_profile&amp;cr=153505" CLASS="coderTextRed">ambrose</A> coded the Level One problem for 341.60 points, the Level Two problem for 410.66, and the Level Three problem for 357.27, for a total of 1109.53 points in the "Coding Phase".  <A HREF="/stat?c=member_profile&amp;cr=153505" CLASS="coderTextRed">ambrose</A> added 50 points in the "Challenge Phase" by successfully coding the Level Three submission of <A HREF="/stat?c=member_profile&amp;cr=150424" CLASS="coderTextRed">RachaelLCook</A>.  The win was the 23rd Overall Room Win (<A HREF="/stat?c=all_time_wins" CLASS="statText">View the list of Overall Wins</A>) for <A HREF="/stat?c=member_profile&amp;cr=153505" CLASS="coderTextRed">ambrose</A>, and the 20th in Division-I (<A HREF="/stat?c=all_time_wins_by_div&amp;dn=1" CLASS="statText">View the list of Division-I Wins</A>).  <A HREF="/stat?c=member_profile&amp;cr=153505" CLASS="coderTextRed">ambrose</A> ranks fourth in both Overall and Division-I Room Wins.
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=158333" CLASS="coderTextRed">dvickrey</A> was the winner in an extremely close battle in Room 2.  <A HREF="/stat?c=member_profile&amp;cr=158333" CLASS="coderTextRed">dvickrey</A> coded all three problems for 1118.09 final points, just 4.28 more than <A HREF="/stat?c=member_profile&amp;cr=138663" CLASS="coderTextRed">Sord</A>, who finished second with 1113.81, and 4.35 more than <A HREF="/stat?c=member_profile&amp;cr=113178" CLASS="coderTextRed">po</A>, who finished third with 1113.74.
</P>

<P>
The biggest upset in Division-I was in Room 6, where <A HREF="/stat?c=member_profile&amp;cr=272072" CLASS="coderTextYellow">SnapDragon</A>, the lowest rated coder in the room, ended up winning with 1073.64 final points.  <A HREF="/stat?c=member_profile&amp;cr=272072" CLASS="coderTextYellow">SnapDragon</A> earned 339.94 points on the Level One problem, 308.40 on the Level Two, and 375.30 on the Level Three, for a total of 1023.64 points in the "Coding Phase".  <A HREF="/stat?c=member_profile&amp;cr=272072" CLASS="coderTextYellow">SnapDragon</A> then earned 50 additional points in the "Challenge Phase" with a successful challenge of the Level Two submission of <A HREF="/stat?c=member_profile&amp;cr=158306" CLASS="coderTextYellow">SlayerK</A>.
</P>

                 </TD>
            </TR>
        <!-- <TR>
          <TD COLSPAN="3" CLASS="statTextBig" WIDTH="1">There were no Division-I coders in this round.</TD>    
        </TR> -->             
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>        
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II<!-- Southeast Region --> </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">            
<P>
It was a night for high scores in Division-II, as three of the top-five highest point totals were established (<A HREF="/stat?&amp;c=highest_totals&amp;dn=2" CLASS="statText">View the list of Division-II Point Totals</A>).
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=264169" CLASS="coderTextGreen">Ninjak</A> won Room 39 with the highest point in the division, 1752.81 final points.  That total is the second highest ever in Division-II.  <A HREF="/stat?c=member_profile&amp;cr=264169" CLASS="coderTextGreen">Ninjak</A> needed just under 12 minutes to complete all three problems.  <A HREF="/stat?c=member_profile&amp;cr=264169" CLASS="coderTextGreen">Ninjak</A> earned 248.89 points on the Level One problem, 485.75 on the Level Two problem, and 968.17 on the Level Three problem, for a total of 1702.81 points in the "Coding Phase".  <A HREF="/stat?c=member_profile&amp;cr=264169" CLASS="coderTextGreen">Ninjak</A> added 50 points in the "Challenge Phase" with a successful challenge of the Level Three submission of <A HREF="/stat?c=member_profile&amp;cr=156742" CLASS="coderTextGreen">ahmedf</A>.  <A HREF="/stat?c=member_profile&amp;cr=260505" CLASS="coderTextGray">makanu</A> and <A HREF="/stat?c=member_profile&amp;cr=251017" CLASS="coderTextGray">Mark</A> both tried to challenge the Level Three submission of <A HREF="/stat?c=member_profile&amp;cr=264169" CLASS="coderTextGreen">Ninjak</A>, but to no avail.
</P>

<P>
The second highest point total of the night, and third all-time in Division-II, was the 1751.96 final point total of <A HREF="/stat?c=member_profile&amp;cr=260828" CLASS="coderTextBlue">Larry</A>, who was the winner in Room 24.  <A HREF="/stat?c=member_profile&amp;cr=260828" CLASS="coderTextBlue">Larry</A> coded all three problems in the "Coding Phase" for 1701.96 points, then added 50 in the "Challenge Phase" with a successful challenge of the Level Three submission of <A HREF="/stat?c=member_profile&amp;cr=262503" CLASS="coderTextGreen">Dandalf</A>.  <A HREF="/stat?c=member_profile&amp;cr=260828" CLASS="coderTextBlue">Larry</A> actually coded all three problems quicker than <A HREF="/stat?c=member_profile&amp;cr=264169" CLASS="coderTextGreen">Ninjak</A> in total, but <A HREF="/stat?c=member_profile&amp;cr=264169" CLASS="coderTextGreen">Ninjak</A> had a higher total due to submitting the Level Three problem 21 seconds before <A HREF="/stat?c=member_profile&amp;cr=260828" CLASS="coderTextBlue">Larry</A>.
</P>

<P>
One could argue that <A HREF="/stat?c=member_profile&amp;cr=159965" CLASS="coderTextBlue">wcbarksdale</A> had the most impressive night.  <A HREF="/stat?c=member_profile&amp;cr=159965" CLASS="coderTextBlue">wcbarksdale</A> won Room 26 with 1717.90 final points, the third highest total of the night, and fifth all-time.  <A HREF="/stat?c=member_profile&amp;cr=159965" CLASS="coderTextBlue">wcbarksdale</A> coded the Level One problem for 247.93 points, the Level Two problem for 479.35 points, and the Level Three problem for 940.62 points, for a total of 1667.90 points during the "Coding Phase".  During the "Challenge Phase", <A HREF="/stat?c=member_profile&amp;cr=159965" CLASS="coderTextBlue">wcbarksdale</A> successfully challenged the Level Three submission of Kniht for 50 points, and survived a challenged by <A HREF="/stat?c=member_profile&amp;cr=271976" CLASS="coderTextGreen">Corrinado</A>.  What makes the win by <A HREF="/stat?c=member_profile&amp;cr=159965" CLASS="coderTextBlue">wcbarksdale</A> so impressive is that <A HREF="/stat?c=member_profile&amp;cr=159965" CLASS="coderTextBlue">wcbarksdale</A> began the match as the lowest rated coder in the room.
</P>


<!-- <P>
View the Top-10 Winners:<BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_ne" CLASS="statText">Northeast Top-10</A> | <A HREF="/index?t=statistics&amp;c=top_10_wins_se" CLASS="statText">Southeast Top-10</A><BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_w" CLASS="statText">West Top-10</A> | <A HREF="/index?t=statistics&amp;c=top_10_wins_mw" CLASS="statText">Midwest Top-10</A><BR/>
</P> -->
          </TD>
            </TR>            
          </TABLE>
          <P><br/></P>
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
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


