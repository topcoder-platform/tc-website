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
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Last Match Summary</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
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
				<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4175&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 91</A></TD>						
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4175&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Wednesday, May 22</A></TD>
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4175&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">7:30pm EDT (registration)</A></TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 90 - May 21, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                                               
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-I<!-- Northeast Region --> </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<!-- <A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="bodyGeneric">View the list of Division-I Consecutive Wins</A>
<A HREF="/stat?c=all_time_wins_by_div&amp;dn=1" CLASS="bodyGeneric">View the list of Division-I Wins</A>
<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="bodyGeneric">View the list of Division-I Rating Point Gains</A>
<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="bodyGeneric">View the list of Division-II Rating Point Gains</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="bodyGeneric">View the list of Winning Debuts</A> 
<A HREF="/stat?c=all_time_wins" CLASS="bodyGeneric">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="bodyGeneric">View the list of Winning Debuts</A>
<A HREF="/stat?&amp;c=highest_totals&amp;dn=2" CLASS="bodyGeneric">View the list of Division-II Point Totals</A>
<A HREF="/stat?c=impressive_debuts" CLASS="bodyGeneric">View the list of Impressive Debuts</A>
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A>
-->
<P>
Three 10-seeds, <A HREF="/tc?module=MemberProfile&amp;cr=110013" CLASS="bodyGeneric">Soli</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=268638" CLASS="bodyGeneric">elchive</A>, 
and <A HREF="/tc?module=MemberProfile&amp;cr=278595" CLASS="bodyGeneric">seaniswise</A>, 
won close battles in Room's 8, 11 and 12. 
</P>

<P>
<B>Soli</B> won Room 8 with 577.00 final points, after coding the Level One problem for 
240.10 points and the Level Two problem for 336.90 points.  Both <A HREF="/tc?module=MemberProfile&amp;cr=268907" CLASS="bodyGeneric">Trolley</A> 
and <A HREF="/tc?module=MemberProfile&amp;cr=279526" CLASS="bodyGeneric">cbthiess</A> 
tried to challenge the Level Two submission of <B>Soli</B>, but to no avail.  The room win 
was the 14 overall for Soli, who has won $3,875 in 66 matches.
</P>

<P>
<B>elchive</B> won Room 11 with 583.23 final points, after coding the Level One problem for 
226.54 points, and the Level Two problem for 356.69 points. <A HREF="/tc?module=MemberProfile&amp;cr=283993" CLASS="bodyGeneric">NeutralParity</A> failed in 
his challenge of the Level Two code of <B>elchive</B>. <B>elchive</B> has won $422 in 16 matches, 
and has been victorious twice.
</P>

<P>
<B>seaniswise</B> won Room 12 with 540.85 final points.  <B>seaniswise</B> earned 490.85 points in 
the "Coding Phase", 226.77 on the Level One problem, and 264.08 on the Level Two.  
<B>seaniswise</B> added 50 points in the "Challenge Phase", with a successful challenge of 
the Level Three submission of <A HREF="/tc?module=MemberProfile&amp;cr=150905" CLASS="bodyGeneric">solman</A>. 
<B>solman</B> was in first place in the room after the "Coding Phase", but ended up finishing fourth.  
This was the first room win for <B>seaniswise</B>, who has won $215 in eight matches.
</P>
                 </TD>
            </TR>             
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>        
            <TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II</TD></TR>
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P>
<A HREF="/tc?module=MemberProfile&amp;cr=158698" CLASS="bodyGeneric">Perlaze</A>
 earned the most points in Division-II, 1392.58, and won Room 25. 
<B>Perlaze</B> coded the Level One problem in 2:03 for 248.68 points, the Level 
Two in 5:00 for 485.06 points, and the Level Three in 23:07 for 658.84 points. 
This is the third room win for <B>Perlaze</B>, who has won $778.00 in 39 matches.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=280380" CLASS="bodyGeneric">dislyxec</A>
 used two challenges for a come-from-behind win in Room 30.  <B>dislyxec</B> 
coded all the problems for 1106.21 points in the "Coding Phase", which placed 
him third.  In the "Challenge Phase", <B>dislyxec</B> successfully challenged the Level 
Three submissions of <A HREF="/tc?module=MemberProfile&amp;cr=274760" CLASS="bodyGeneric">Doomhammer</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=278630" CLASS="bodyGeneric">anniehuang</A>
 for 100 addtional points, and won 
the room with 1206.21 final points.  With the room win, <B>dislyxec</B> is now three-for-three 
in TopCoder SRM's, having won his room in SRM's 85 and 87, as well.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=155087" CLASS="bodyGeneric">carwashi</A>
 won by just 0.31 points over <A HREF="/tc?module=MemberProfile&amp;cr=268908" CLASS="bodyGeneric">DragonX</A>
 in Room 56, 500.27 to 499.96. <B>carwashi</B> 
coded the Level One problem in 6:51 for 236.52 points, and the Level Two problem in 
34:10 for 263.75 points, while <B>DragonX</B> coded the Level One problem in 14:07 for 204.18 points, 
and the Level Two problem in 28:04 for 295.78 points.  This is the second overall win for <B>carwashi</B>.
</P>
          </TD>
            </TR>            
          </TABLE>
          <P><br/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


