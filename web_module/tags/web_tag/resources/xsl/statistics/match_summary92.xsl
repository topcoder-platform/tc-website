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
				<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4185&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 93</A></TD>						
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4185&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Thursday, May 30</A></TD>
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4185&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">8:30pm EDT (registration)</A></TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 92 - May 29, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<A HREF="/stat?c=member_profile&amp;cr=129815" CLASS="bodyGeneric">dmh2000</A>
 only coded the Level One problem, but it was enough to win Room 20 by 3.62 points, 
187.47 to 183.85 over <A HREF="/stat?c=member_profile&amp;cr=262953" CLASS="bodyGeneric">MEEP!</A>
  &#160;<B>dmh2000</B> coded the Level One problem in 25:29, which placed 
him fifth after the "Coding Phase".  <B>MEEP!</B> was actually in first place with 478.50 points.  
During the "Challenge Phase", however, ethaneade successfully challenged the Level Two 
submission of <B>MEEP!</B>, causing <B>MEEP!</B> to lose the 294.65 points earned on that problem.  
<A HREF="/stat?c=member_profile&amp;cr=263788" CLASS="bodyGeneric">monteith</A>, 
who was in third after the "Coding Phase" also lost points in the 
"Challenge Phase", while <A HREF="/stat?c=member_profile&amp;cr=272349" CLASS="bodyGeneric">smileywiley</A>
 and <A HREF="/stat?c=member_profile&amp;cr=267180" CLASS="bodyGeneric">Ani</A>, 
 who were in second and fourth, 
lost all of there points in the system test. 
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=280198" CLASS="bodyGeneric">alanm</A>
 won Room 21 with 513.34 final points, and added 255 points to his rating, 
the biggest Division-I increase of the match.  <B>alanm</B> earned 231.82 points on the 
Level One problem, and 281.52 on the Level Two problem.  
<A HREF="/stat?c=member_profile&amp;cr=264728" CLASS="bodyGeneric">Liguo</A>
 and <A HREF="/stat?c=member_profile&amp;cr=269213" CLASS="bodyGeneric">Tek</A>
 both tried 
to challenge the Level One submission of <B>alanm</B>, but to no avail. 
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=273414" CLASS="bodyGeneric">drcode</A>
 had the poorest outing in Room 19, and ended up losing 221 rating points, 
the most in the division for the match.  <B>drcode</B> submitted code for the Level One 
and Two problems, earning a combined 460.52 points in the "Coding Phase".  <B>drcode</B> 
then lost 150 points with three unsuccessful challenges, and 179.35 when 
<A HREF="/stat?c=member_profile&amp;cr=156439" CLASS="bodyGeneric">Moose</A> 
successfully challenged his Level One submission in the "Challenge Phase".  
The Level Two submission of <B>drcode</B> ended up failing the system test, 
leaving <B>drcode</B> with -150 final points for the match.
</P>

                 </TD>
            </TR>             
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>        
            <TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II</TD></TR>
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P>
<A HREF="/stat?c=member_profile&amp;cr=278938" CLASS="bodyGeneric">binaryni</A>
 was the top point-getter in Division-II, winning Room 28 with 
1370.22 final points.  <B>binaryni</B> earned 241.96 points on the Level One 
problem, 362.46 on the Level Two problem, and 615.80 on the Level 
Three problem, for 1220.22 points after the "Coding Phase".  <B>binaryni</B> 
then added 150 points in the "Challenge Phase" with successful challenges 
of the Level Two submissions of <A HREF="/stat?c=member_profile&amp;cr=280986" CLASS="bodyGeneric">InsaneProdigy</A>, 
<A HREF="/stat?c=member_profile&amp;cr=263468" CLASS="bodyGeneric">Rakot</A>, 
and <A HREF="/stat?c=member_profile&amp;cr=159543" CLASS="bodyGeneric">PongsriBunny</A>.  
<B>binaryni</B> added 219 rating points, which is the largest gain for the division in the match. 
</P>

<P>
Two rooms were decided by less than one point: 
</P>

<P>
In Room 62, <A HREF="/stat?c=member_profile&amp;cr=275394" CLASS="bodyGeneric">Tazjam</A>
 outpaced <A HREF="/stat?c=member_profile&amp;cr=283493" CLASS="bodyGeneric">mozuon</A>
 234.76 to 234.40, a difference of only 
0.36 points.  <B>Tazjam</B> submitted code for the Level One problem in 7:19, 
while <B>mozuon</B> submitted six seconds later. 
</P>

<P>
An even closer battle took place in Room 68, where 
<A HREF="/stat?c=member_profile&amp;cr=276128" CLASS="bodyGeneric">WordMuncher</A> earned 
0.22 more points than <A HREF="/stat?c=member_profile&amp;cr=286346" CLASS="bodyGeneric">Tempralisis</A>
 to win the room. <B>WordMuncher</B> spent 
19:48 on the Level One problem for 178.08 points, while <B>Tempralisis</B> 
spent three seconds more and earned 177.86.  
<A HREF="/stat?c=member_profile&amp;cr=271531" CLASS="bodyGeneric">VladVM</A> challenged both 
of their codes in the "Challenge Phase", but failed each time.
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
		<A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<!-- <center><A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=match_summary','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A></center><BR/> -->
    
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


