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
            <!-- <TR>
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
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4080&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 702002 TCCC Regional Semifinals (All Regions)</A></TD>            
              <TD VALIGN="middle" CLASS="statText">Wednesday, March 7</TD>
              <TD VALIGN="middle" CLASS="statText">9:00pm EST</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
            </TR> -->
                    <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=schedule&amp;c=tourny_spons"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR>           
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: <!-- Single Round Match 69 - Feb 28, 2002 -->2002 TCCC Regional Semifinals - March 6</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                        
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-I --> Northeast Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>
<A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statText">View the list of Division-I Wins</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div2" CLASS="statText">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A> 
<A HREF="/index?t=statistics&amp;c=srm_wins" CLASS="statText">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>
<A HREF="/index?t=statistics&amp;c=high_total_div2" CLASS="statText">View the list of Division-II Point Totals</A>
-->
<P>
Top-seeded <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=147102" CLASS="coderTextRed">pl31415</A> won Room 5 by coding the 250 and 1000-point problems and finishing with 847.55 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159052" CLASS="coderTextYellow">lbackstrom</A>, the 13th seed, earned a place as a wildcard in the regional championships by finishing second in the room with 786.10 points.  
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152347" CLASS="coderTextRed">ZorbaTHut</A>, the second seed, earned 1223.49 final points by coding all three problems to win Room 6.  That point total was the highest of the round.  
</P>
<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=263580" CLASS="coderTextYellow">enderx</A>, who is ranked 30th and is the long shot of the region, was the only other coder in the room to code all three problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=263580" CLASS="coderTextYellow">enderx</A> finished with 977.58 final points to finish second in the room and advance to the regional championships as a wildcard.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A> was the top-seed in Room 8 and ended up winning that room with 925.52 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=260835" CLASS="coderTextRed">reid</A> coded the 250 and 1000-point problems.
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-II --> Southeast Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">            
<P>
Top-seeded <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A>
 was the winner in Room 9.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=153505" CLASS="coderTextRed">ambrose</A>
 coded the 250 and 1000-pointers and finished with 773.90 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251289" CLASS="coderTextBlue">EtherMage</A>, who is ranked 99th and is the lowest ranked coder in the region and tournament, garnered a spot in the regional championships with a second place finish in the room. 
</P>

<P>
The second seed, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262936" CLASS="coderTextRed">dgarthur</A>, who had a region-high 1039.49 final points, won room 10.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262936" CLASS="coderTextRed">dgarthur</A> was the only coder in the room to code all three problems.  2001 Invitational finalist <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A> finished second in the room and is headed to the regional championships. 
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=135178" CLASS="coderTextYellow">Firewind</A>, the top-seed in the room and fourth ranked coder in the region, was the winner in Room 11. <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=135178" CLASS="coderTextYellow">Firewind</A> earned 726.85 final points by coding the 250 and 1000-point problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=265334" CLASS="coderTextYellow">levantri</A>, the seventh seed, coded the same problems as <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=135178" CLASS="coderTextYellow">Firewind</A> and added a successful challenge to finish a close second in the room with 708.95 final points.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=157628" CLASS="coderTextYellow">ShakeSpace</A>, the sixth seed, pulled off a minor upset by winning Room 12 with 809.80 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=157628" CLASS="coderTextYellow">ShakeSpace</A> coded the 250 and 1000-pointers.  The top seed in the room was the fifth seed, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156848" CLASS="coderTextYellow">TPcoder</A>, who finished second with 417.28 final points, but didn't make the regional championships.
</P>



<!-- <P>
View the Top-10 Winners:<BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_ne" CLASS="statText">Northeast Top-10</A> | <A HREF="/index?t=statistics&amp;c=top_10_wins_se" CLASS="statText">Southeast Top-10</A><BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_w" CLASS="statText">West Top-10</A> | <A HREF="/index?t=statistics&amp;c=top_10_wins_mw" CLASS="statText">Midwest Top-10</A><BR/>
</P> -->
          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-I --> West Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>
<A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statText">View the list of Division-I Wins</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div2" CLASS="statText">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A> 
<A HREF="/index?t=statistics&amp;c=srm_wins" CLASS="statText">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>
<A HREF="/index?t=statistics&amp;c=high_total_div2" CLASS="statText">View the list of Division-II Point Totals</A>
-->
<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>, the top seed in the region and in the tournament, earned a region-high 1107.87 final points by coding all three problems and having one successful challenge, to win Room 13.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113178" CLASS="coderTextRed">po</A> was the only other coder to code all three problems in the room.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113178" CLASS="coderTextRed">po</A>
 earned 931.86 points and finished second.
</P>

<P>
Room 14 was won by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> the region's second seed.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> coded the 250 and 1000-point problems and had one successful challenge to finish with 794.29 final points.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=157974" CLASS="coderTextRed">bigg_nate</A>, the second seeded coder in Room 15 and sixth seed in the region, was the upset winner.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=157974" CLASS="coderTextRed">bigg_nate</A> coded the 250 and 1000-pointers and had two successful challenges, finishing with 918.50 final points.  The top seed in the room was <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=129672" CLASS="coderTextRed">doeth</A>, who was ranked third in the region.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=129672" CLASS="coderTextRed">doeth</A> finished with 290.87 final points, which wasn't enough to advance to the regional championships as a wildcard.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262935" CLASS="coderTextRed">derkuci</A>, the third seed in Room 16 and 13th seed in the region, was the winner with 1029.63 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262935" CLASS="coderTextRed">derkuci</A> was the only coder in the room to code all three problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A>, the top seed in the room and fourth in the region, will be a wildcard after finishing third in the room with 706.21 final points.
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;<!-- Division-II --> Midwest Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">            
<P>
Four of the top-six seeded coders won the four rooms in the MidWest region.  Top-seeded <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155275" CLASS="coderTextRed">DjinnKahn</A> won Room 1 with 938.69 final points, the highest total for the region. <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155275" CLASS="coderTextRed">DjinnKahn</A> was the only coder in the room to code all three problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A>, the eighth seed and a 2001 Collegiate Challenge finalist, finished second in the room with 619.81 points to advance to the regional championships as a wildcard.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A>, the second seed, won Room 2 with 935.55 final points.  Like <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155275" CLASS="coderTextRed">DjinnKahn</A> in Room 1, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A> was the only coder in the room to code all three problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154619" CLASS="coderTextBlue">hilfiger</A>, the 56th seed and Cinderella story of the region, will be a wildcard by finishing second with 684.05 points.  
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A>, the sixth seed, was the upset winner in Room 3.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A> coded the 250 and 1000-point problems and earned 798.47 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A>, the number three seed in the region and top seed in the room, finished third in the room with 687.58 final points. <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A> coded the 250 and 1000-pointers, enough to advance to the regional championships as a wildcard.
</P>

<P>
Room 4 was won by the number four seed, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A>.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A> was the only coder in the room to code more than one problem.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A> coded the 250 and 1000-point problems and finished with 765.11 final points.  The big surprise in the MidWest was that the number five seed <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=151418" CLASS="coderTextYellow">ChaiBot</A> was eliminated.
</P>



<P>
View the Top-10 room winners:<BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_regions" CLASS="statText">All Regions</A> 
<!-- | <A HREF="/index?t=statistics&amp;c=top_4_wins_se" CLASS="statText">Southeast</A><BR/>
<A HREF="/index?t=statistics&amp;c=top_4_wins_w" CLASS="statText">West</A> | <A HREF="/index?t=statistics&amp;c=top_4_wins_mw" CLASS="statText">Midwest</A><BR/>
 --></P>
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


