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
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4110&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 77<!-- 2002 TCCC Regional Championships --></A></TD>            
              <TD VALIGN="middle" CLASS="statText">Wednesday, April 3</TD>
              <TD VALIGN="middle" CLASS="statText">9:00pm EST</TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 76 - April 1, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Impressive Debuts</A>
-->
<P>
An extremely close battle took place in Room 4, as <A HREF="/tc?module=MemberProfile&amp;cr=128924" CLASS="coderTextYellow">thekcc</A> outscored <A HREF="/tc?module=MemberProfile&amp;cr=152476" CLASS="coderTextYellow">kalmes</A>
 by .84 points (1416.95 to 1416.11) to win the room.  <A HREF="/tc?module=MemberProfile&amp;cr=152476" CLASS="coderTextYellow">kalmes</A>
 actually coded the Level One and Three problems quicker than <A HREF="/tc?module=MemberProfile&amp;cr=128924" CLASS="coderTextYellow">thekcc</A>, but the difference in the match was the scoring differential of the Level Two submissions.  <A HREF="/tc?module=MemberProfile&amp;cr=128924" CLASS="coderTextYellow">thekcc</A> earned 238.04 on the Level One problem, 291.45 on the Level Two problem and 887.46 on the Level Three problem, while <A HREF="/tc?module=MemberProfile&amp;cr=152476" CLASS="coderTextYellow">kalmes</A>
 gained 241.31 on the Level One problem, 347.32 on the Level Two problem and 827.48 on the Level Three problem.
</P>

<P>
Although it wasn't as close as Room 4, <A HREF="/tc?module=MemberProfile&amp;cr=153505" CLASS="coderTextRed">ambrose</A>
 was the winner in Room 1 by just 20.17 points (1570.58 to 1550.41) over <A HREF="/tc?module=MemberProfile&amp;cr=260835" CLASS="coderTextRed">reid</A>
.   <A HREF="/tc?module=MemberProfile&amp;cr=260835" CLASS="coderTextRed">reid</A>
 was actually winning the room after the "Coding Phase", earning all 1550.41 points in that phase.  <A HREF="/tc?module=MemberProfile&amp;cr=153505" CLASS="coderTextRed">ambrose</A>
 earned 246.89 points on the Level One problem, 430.57 on the Level Two problem and 843.12 on the Level Three problem for a total of 1520.58 points in the "Coding Phase".  <A HREF="/tc?module=MemberProfile&amp;cr=153505" CLASS="coderTextRed">ambrose</A>
 won the room by successfully challenging the Level Two submission of malpt for 50 points.  <A HREF="/tc?module=MemberProfile&amp;cr=260835" CLASS="coderTextRed">reid</A>
 gained 245.14 points on the Level One problem, 417.87 on the Level Two problem and 887.40 on the Level Three problem.
</P>

<P>
Four coders who were seeded 10th of 10 coders in their respective rooms pulled off tremendous upset wins.  <A HREF="/tc?module=MemberProfile&amp;cr=251322" CLASS="coderTextYellow">jjmoon</A>
 won Room 9 with 1025.31 points, <A HREF="/tc?module=MemberProfile&amp;cr=268580" CLASS="coderTextBlue">Wasyuu</A>
 was the winner in Room 18 with 532.11, <A HREF="/tc?module=MemberProfile&amp;cr=154619" CLASS="coderTextBlue">hilfiger</A>
 was victorious in Room 23 with 1100.65, while <A HREF="/tc?module=MemberProfile&amp;cr=129815" CLASS="coderTextBlue">dmh2000</A>
 triumphed right next door in Room 24 with 470.01.
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
The top scorer in the division was <A HREF="/tc?module=MemberProfile&amp;cr=271976" CLASS="coderTextBlue">Corrinado</A>
, who won Room 29 with 1210.52 points.  <A HREF="/tc?module=MemberProfile&amp;cr=271976" CLASS="coderTextBlue">Corrinado</A>
 earned 1160.52 points in the "Coding Phase" after answering all three problems, and then added 50 points to that total in the "Challenge Phase" with a successful challenge of the Level Two submission of <A HREF="/tc?module=MemberProfile&amp;cr=156822" CLASS="coderTextGreen">m_chen</A>
.  Virtual tried to challenge the Level Two submission of <A HREF="/tc?module=MemberProfile&amp;cr=271976" CLASS="coderTextBlue">Corrinado</A>
, but to no avail.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=265299" CLASS="coderTextGray">HotStuff</A>
 pulled off the biggest upset in the division, winning Room 48 with 633.70 final points as the 10th seed in the room.  <A HREF="/tc?module=MemberProfile&amp;cr=265299" CLASS="coderTextGray">HotStuff</A>
 just edged <A HREF="/tc?module=MemberProfile&amp;cr=273419" CLASS="coderTextGreen">FatAlbert</A>
, who finished with 629.44 points.  <A HREF="/tc?module=MemberProfile&amp;cr=265299" CLASS="coderTextGray">HotStuff</A>
 earned 175.63 points on the Level One problem and 408.07 on the Level Two problem for a total of 583.70 points in the "Coding Phase".  During the "Challenge Phase", <A HREF="/tc?module=MemberProfile&amp;cr=265299" CLASS="coderTextGray">HotStuff</A>
 gained an additional 50 points with a successful challenge of the Level One submission of <A HREF="/tc?module=MemberProfile&amp;cr=107160" CLASS="coderTextGray">uler3161</A>
.  <A HREF="/tc?module=MemberProfile&amp;cr=273419" CLASS="coderTextGreen">FatAlbert</A>
 also had one successful challenge for 50 points, and actually earned more points on the Level Two problem, 411.17.  <A HREF="/tc?module=MemberProfile&amp;cr=273419" CLASS="coderTextGreen">FatAlbert</A>
 fell just short, however, by earning 168.27 points on the Level One problem.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=274537" CLASS="coderTextYellow">mpb</A>
 won Room 65 with 1092.11 final points, the most of all the first-time coders.  <A HREF="/tc?module=MemberProfile&amp;cr=274537" CLASS="coderTextYellow">mpb</A>
 earned 192.04 points on the Level One problem, 488.68 on the Level Two problem and 411.39 on the Level Three problem.
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


