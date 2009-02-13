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
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4085&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 71<!-- 2002 TCCC Regional Semifinals (All Regions) --></A></TD>            
              <TD VALIGN="middle" CLASS="statText">Monday, March 11</TD>
              <TD VALIGN="middle" CLASS="statText">9:00pm EST</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
            </TR>
                    <!-- <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=schedule&amp;c=tourny_spons"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR> -->           
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 70 - March 7, 2002<!-- 2002 TCCC Regional Semifinals - March 6 --></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                        
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-I <!-- Northeast Region --></TD>
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
Three coders, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269058" CLASS="coderTextYellow">jasonw</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262951" CLASS="coderTextBlue">db</A>, had performances that earned them top-25 Rating Point Gain's in SRM 70.  
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A> was the winner in Room 5, and had a rating gain of 279, which ranks as the ninth highest ever (<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>).  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A> earned 1200.73 final points by coding all three problems.  The final point total of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A> was the fourth highest in Division I.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269058" CLASS="coderTextYellow">jasonw</A> finished second to <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A> in Room 5, and had a rating point gain of 261, which is the 14th largest gain ever.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269058" CLASS="coderTextYellow">jasonw</A> coded all three problems for 1171.12 final points, which was the fifth highest in Division I.
</P>

<P>
The 20th largest gain ever was earned by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262951" CLASS="coderTextBlue">db</A>, whose rating increased by 234 points.  Like <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268947" CLASS="coderTextYellow">anr</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269058" CLASS="coderTextYellow">jasonw</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262951" CLASS="coderTextBlue">db</A> coded all three problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262951" CLASS="coderTextBlue">db</A> won Room 21 with 993.48 final points.
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II <!-- Southeast Region --></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">            

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A> had an extremely impressive TopCoder debut.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A> coded all three problems for a Division II-high 1672.80 final points.  That point total helped <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A> win Room 54 (<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>), and is the fourth highest ever in Division II (<A HREF="/index?t=statistics&amp;c=high_total_div2" CLASS="statText">View the list of Division-II Point Totals</A>).  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextYellow">John Dethridge</A> also had a 1908 Rating Point Debut, which is the sixth highest debut rating ever (<A HREF="/index?t=statistics&amp;c=rate_debut" CLASS="statText">View the list of Rating Point Debut</A>).
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=263379" CLASS="coderTextBlue">pochmann</A> was also very successful in SRM 70, cracking two top-25 lists.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=263379" CLASS="coderTextBlue">pochmann</A> coded all three problems for 1614.45 final points, the ninth highest total, to win Room 33.  That performance caused the rating of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=263379" CLASS="coderTextBlue">pochmann</A> to increase by 377 points, which is the 12th largest increase. 
</P>

<P>
Two coders, 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=261008" CLASS="coderTextGreen">mthed</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262456" CLASS="coderTextGray">Shadowfax</A> won their rooms for the second consecutive time.  
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=261008" CLASS="coderTextGreen">mthed</A> coded all three problems and won Room 38, while <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262456" CLASS="coderTextGray">Shadowfax</A> correctly coded the medium and hard problems to win Room 43.
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


