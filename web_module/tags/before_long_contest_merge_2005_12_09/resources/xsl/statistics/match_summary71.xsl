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
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?t=tournaments&amp;c=tourny_sched" CLASS="statText"><!-- Single Round Match 71 -->2002 TCCC Regional Championships</A></TD>
              <TD VALIGN="middle" CLASS="statText">Monday, March 13</TD>
              <TD VALIGN="middle" CLASS="statText">8:00pm EST</TD>
            </TR>            
            <!-- <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
            </TR> --> 
                    <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/i/mot_redir.html" target="_blank"><IMG SRC="/i/moto_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR>           
                    <!-- <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=schedule&amp;c=tourny_spons"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR> -->           
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 71 - March 11, 2002<!-- 2002 TCCC Regional Semifinals - March 6 --></TD>
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
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextRed">John Dethridge</A> was the winner in Room 5, and gained 335 rating points, which is the highest rating point gain ever in Division-I (<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>).  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=270505" CLASS="coderTextRed">John Dethridge</A> coded the Medium and Hard questions for 871.82 final points.
</P>

<P>
Two coders, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156216" CLASS="coderTextRed">daveagp</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A>, both won their rooms for the fourth time.  This ties the two of them with five others for 21st place (<A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statText">View the list of Division-I Wins</A>).  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156216" CLASS="coderTextRed">daveagp</A> was the winner in Room 3, coding the Easy and Medium questions for 541.61 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A> was the winner in Room 11.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A> earned 436.51 points in the "Coding Phase" by coding the Easy and Medium questions, and then added 150 points to that total with three successful challenges in the "Challenge Phase".  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A> finished with 586.51 final points.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262936" CLASS="coderTextRed">dgarthur</A> won Room 1 with a Division-I-high 1236.98 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262936" CLASS="coderTextRed">dgarthur</A> coded all three problems in the "Coding Phase" for 1186.98 points, and added 50 points in the "Challenge Phase" with one successful challenge.
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
Two coders, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154145" CLASS="coderTextGreen">dleung</A> and 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251591" CLASS="coderTextGreen">emmpee</A> won their rooms for the second consecutive time.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154145" CLASS="coderTextGreen">dleung</A> coded all three problems and had one successful challenge to win Room 32 with 1062.97 final points, while 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=251591" CLASS="coderTextGreen">emmpee</A> followed the same pattern and won Room 39 with 1082.90 final points.
</P>

<P>

<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=158447" CLASS="coderTextBlue">ValD</A> won Room 34 with 1191.94 final points.  This marked the third time in four matches that 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=158447" CLASS="coderTextBlue">ValD</A> was a room winner.  
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=158447" CLASS="coderTextBlue">ValD</A> won consecutive rooms in SRM's 68 and 69.  To win in SRM 71, 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=158447" CLASS="coderTextBlue">ValD</A> coded all three problems and had one successful challenge.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=261776" CLASS="coderTextBlue">DmdsNPrls99</A> was the winner of Room 27, and was the top point-getter in Division-II for SRM 71.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=261776" CLASS="coderTextBlue">DmdsNPrls99</A> coded all three problems for 1184.47 points in the "Coding Phase", and added one successful challenge in the "Challenge Phase" for a total of 1234.47 final points.
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


