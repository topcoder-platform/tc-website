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
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4095&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 73 (Motorola)<!-- 2002 TCCC Regional Championships --></A></TD>            
              <TD VALIGN="middle" CLASS="statText">Thursday, March 21</TD>
              <TD VALIGN="middle" CLASS="statText">10:00pm EST</TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 72 - March 20, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statText">View the list of Division-I Wins</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div2" CLASS="statText">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A> 
<A HREF="/index?t=statistics&amp;c=srm_wins" CLASS="statText">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>
<A HREF="/index?t=statistics&amp;c=high_total_div2" CLASS="statText">View the list of Division-II Point Totals</A>
-->

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=251989" CLASS="coderTextYellow">AdamSelene</A>, the lowest ranked coder in Room 5, used the "Challenge Phase" for a come-from-behind win.  <A HREF="/stat?c=member_profile&amp;cr=251989" CLASS="coderTextYellow">AdamSelene</A> coded the Level One and Level Two problems in the "Coding Phase" for 649.61 points.  That point total placed <A HREF="/stat?c=member_profile&amp;cr=251989" CLASS="coderTextYellow">AdamSelene</A> in third place.  During the "Challenge Phase", <A HREF="/stat?c=member_profile&amp;cr=251989" CLASS="coderTextYellow">AdamSelene</A> took advantage of mistakes found in Level One submissions.  <A HREF="/stat?c=member_profile&amp;cr=251989" CLASS="coderTextYellow">AdamSelene</A> successfully challenged 
<A HREF="/tc?module=MemberProfile&amp;cr=264961" CLASS="coderTextYellow">henchq</A>, <A HREF="/stat?c=member_profile&amp;cr=160074" CLASS="coderTextYellow">jyasp</A>, and <A HREF="/stat?c=member_profile&amp;cr=160136" CLASS="coderTextYellow">Annie29</A> for 150 points, and after proceeding through the system test unscathed, won the room with a final point total of 799.61.
</P>

<P>
In Room 19, a close battle took place between <A HREF="/tc?module=MemberProfile&amp;cr=251317" CLASS="coderTextBlue">brett1479</A> and <A HREF="/stat?c=member_profile&amp;cr=160082" CLASS="coderTextBlue">slavik</A>.  Both coders earned points on the Level One and Level Two problems.  <A HREF="/stat?c=member_profile&amp;cr=251317" CLASS="coderTextBlue">brett1479</A> coded the Level One problem in 28:34 for 190.27 points and the Level Two problem in 21:37 for 324.07 points, a total of 514.34.  <A HREF="/stat?c=member_profile&amp;cr=160082" CLASS="coderTextBlue">slavik</A> coded the Level One problem in 33:04 for 174.75 points and the Level Two problem in 21:56 for 321.68 points, a total of 496.43 points.  Those point totals differ by only 17.91 points.  <A HREF="/stat?c=member_profile&amp;cr=160082" CLASS="coderTextBlue">slavik</A> did gain 50 points in the "Challenge Phase" from a successful challenge of the Level One submission of <A HREF="/stat?c=member_profile&amp;cr=269078" CLASS="coderTextGreen">dzadza</A>, which would have won the room.  <A HREF="/stat?c=member_profile&amp;cr=160082" CLASS="coderTextBlue">slavik</A> was unsuccessful in a challenge of the Level One submission of <A HREF="/stat?c=member_profile&amp;cr=260406" CLASS="coderTextBlue">konsept</A>, however, losing the 50 points gained from the successful challenge, and resulting in the second place finish.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=152073" CLASS="coderTextRed">NDBronson</A>, TopCoder's top-ranked coder, won Room 1 with the highest point total in the division, 1360.71.  <A HREF="/stat?c=member_profile&amp;cr=152073" CLASS="coderTextRed">NDBronson</A> earned 308.30 points on the Level One problem, 453.43 points on the Level Two problem, and 598.98 points on the Level Three problem.  <A HREF="/stat?c=member_profile&amp;cr=152073" CLASS="coderTextRed">NDBronson</A> gained 72 rating points, and now has a rating of 2977.
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
<A HREF="/tc?module=MemberProfile&amp;cr=269057" CLASS="coderTextBlue">Slamin</A>, the lowest ranked coder in Room 24, won a close battle with <A HREF="/stat?c=member_profile&amp;cr=260272" CLASS="coderTextBlue">rfu</A>.  <A HREF="/stat?c=member_profile&amp;cr=269057" CLASS="coderTextBlue">Slamin</A> earned 241.37 points on the Level One problem, 310.61 points on the Level Two problem, and 690.67 points on the Level Three problem, a total of 1242.65 final points.  <A HREF="/stat?c=member_profile&amp;cr=260272" CLASS="coderTextBlue">rfu</A> gained 242.53, 383.50, and 603.66, respectively on the problems for a total of 1229.69 points, 12.96 behind <A HREF="/stat?c=member_profile&amp;cr=269057" CLASS="coderTextBlue">Slamin</A>.
</P>

<P>
Two first-time coders made impressive debuts:
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=272072" CLASS="coderTextYellow">SnapDragon</A> earned 1523.54 final points in winning Room 53, and had a debut rating of 1911, which is the fifth best rating point debut ever (<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Winning Debuts</A>).  <A HREF="/stat?c=member_profile&amp;cr=272072" CLASS="coderTextYellow">SnapDragon</A> coded all the problems in the "Coding Phase" for 1423.54 points, and then had two successful challenges for 100 additional points in the "Challenge Phase".
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=251183" CLASS="coderTextYellow">mathewsb</A> used four successful challenges for a come-from-behind win in Room 55.  <A HREF="/stat?c=member_profile&amp;cr=251183" CLASS="coderTextYellow">mathewsb</A> coded all three problems in the "Coding Phase" for 1147.23 points.  That total placed <A HREF="/stat?c=member_profile&amp;cr=251183" CLASS="coderTextYellow">mathewsb</A> second in the room behind <A HREF="/stat?c=member_profile&amp;cr=264815" CLASS="coderTextBlue">KingLego</A>, who had 1210.01.  <A HREF="/stat?c=member_profile&amp;cr=251183" CLASS="coderTextYellow">mathewsb</A> went right after the leader in the "Challenge Phase", successfully challenging the Level Two submission of <A HREF="/stat?c=member_profile&amp;cr=264815" CLASS="coderTextBlue">KingLego</A>.  The three other challenges of <A HREF="/stat?c=member_profile&amp;cr=251183" CLASS="coderTextYellow">mathewsb</A> were of the Level One submissions of <A HREF="/stat?c=member_profile&amp;cr=272164" CLASS="coderTextGray">chapernowne1234</A>, <A HREF="/stat?c=member_profile&amp;cr=271976" CLASS="coderTextGreen">Corrinado</A>, and <A HREF="/stat?c=member_profile&amp;cr=271214" CLASS="coderTextGray">ilaci</A>.  <A HREF="/stat?c=member_profile&amp;cr=251183" CLASS="coderTextYellow">mathewsb</A> finished with 1347.23 final points.
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


