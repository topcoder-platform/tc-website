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
              <TD VALIGN="middle" HEIGHT="15" BGCOLOR="#CCCCCC" CLASS="bodyText" WIDTH="40%">&#160;&#160;<B>Match</B></TD>            
              <TD VALIGN="middle" BGCOLOR="#CCCCCC" CLASS="bodyText" WIDTH="30%">&#160;<B>Date</B></TD>
              <TD VALIGN="middle" BGCOLOR="#CCCCCC" CLASS="bodyText" WIDTH="30%">&#160;<B>Time</B></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                        
            <TR>
				<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4200&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 96</A></TD>						
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4200&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Tuesday, June 11</A></TD>
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4200&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">8:30pm EDT (registration)</A></TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 95 - June 5, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                                               
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BGCOLOR="#CCCCCC" CLASS="bodyText">&#160;&#160;<B>Division-I</B><!-- Northeast Region --> </TD>
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
<A HREF="/stat?c=member_profile&amp;cr=286907" CLASS="bodyGeneric">WishingBone</A>
 won Room 11 with 1038.64 final points, and had a rating point gain of 355, 
which is the fourth highest ever in Division-I 
(<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="bodyGeneric">View the list of Division-I Rating Point Gains</A>).  WishingBone earned 270.87 points 
on the Level One problem, 259.25 on the Level Two problem, and 508.52 on the Level 
Three problem.  harv tried to challenge the Level Three submission of <B>WishingBone</B>, 
but to no avail.  <B>WishingBone</B> was the only coder in Room 11 to code all three 
problems, and won the room by 542.65 points. 
</P>

<P>
In Room 2, <A HREF="/stat?c=member_profile&amp;cr=156592" CLASS="bodyGeneric">benetin</A>
 was in fourth place after the "Coding Phase" with 1066.99 
points, but he successfully challenged two of the three coders ahead of him, 
and watched the other have a submission fail the system test for a 
come-from-behind win.  During the "Coding Phase", benetin coded the 
Level One problem for 268.22 points, the Level Two problem for 263.70, and 
the Level Three problem for 535.07.  <B>benetin</B> challenged the Level One 
submissions of <A HREF="/stat?c=member_profile&amp;cr=105922" CLASS="bodyGeneric">qubits</A>
 and <A HREF="/stat?c=member_profile&amp;cr=113178" CLASS="bodyGeneric">po</A>
 in the "Challenge Phase" for 100 points 
(1166.99 final points), and watched as the Level One submission of 
<A HREF="/stat?c=member_profile&amp;cr=142795" CLASS="bodyGeneric">Joe</A> 
failed the system test. 
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=269980" CLASS="bodyGeneric">FishSpeaker</A>
 found himself in sixth place after the "Coding Phase", but 
like <B>benetin</B> in Room 2, used two successful challenges for a room win.  
<B>FishSpeaker</B> earned 374.58 points in the "Coding Phase" by coding both 
the Level One and Two problems.  He then successfully challenged the 
Level One submissions of <A HREF="/stat?c=member_profile&amp;cr=274259" CLASS="bodyGeneric">TrekkyLeaper</A>
 and <A HREF="/stat?c=member_profile&amp;cr=279845" CLASS="bodyGeneric">dizzy</A>, 
 who were both in front 
of him, for 100 additional points, and the room win.
</P>
                 </TD>
            </TR>             
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>        
            <TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BGCOLOR="#CCCCCC" CLASS="bodyText">&#160;&#160;<B>Division-II</B></TD></TR>
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P>
<A HREF="/stat?c=member_profile&amp;cr=159922" CLASS="bodyGeneric">mike0625</A>
 won Room 33 with 1583.39 final points, which was the highest total 
in Division-II.  <B>mike0625</B> coded all three problems in the "Coding Phase" 
for 1433.39 points, then added 150 additional points in the "Challenge Phase" 
with successful challenges of the Level One submissions of 
<A HREF="/stat?c=member_profile&amp;cr=279987" CLASS="bodyGeneric">bcurren</A>, 
<A HREF="/stat?c=member_profile&amp;cr=159147" CLASS="bodyGeneric">bkramer</A>, 
and <A HREF="/stat?c=member_profile&amp;cr=153662" CLASS="bodyGeneric">weirfreak</A>. 
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=286112" CLASS="bodyGeneric">mbarb</A>
 won Room 28 with the second highest point total in Division-II, 1424.92 
final points, and also had the largest rating point gain of all Division-II 
coders for the match, 242.  <B>mbarb</B> coded all three problems for 1324.92 points 
in the "Coding Phase", and then added 100 additional points in 
the "Challenge Phase", with successful challenges of the Level Three 
submissions of <A HREF="/stat?c=member_profile&amp;cr=281249" CLASS="bodyGeneric">jrladieu</A>
 and <A HREF="/stat?c=member_profile&amp;cr=112974" CLASS="bodyGeneric">sansri</A>. 
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=156420" CLASS="bodyGeneric">edragon</A>
 had the most successful night in the "Challenge Phase", using four 
successful challenges for 200 points to win Room 39.  <B>edragon</B> coded all 
three problems in the "Coding Phase" for 1038.33 points, and found himself 
in fifth place.  During the "Challenge Phase", <B>edragon</B> successfully 
challenged the Level One and Three submissions of 
<A HREF="/stat?c=member_profile&amp;cr=261244" CLASS="bodyGeneric">zakaluka</A>, the Level One 
submission of <A HREF="/stat?c=member_profile&amp;cr=274886" CLASS="bodyGeneric">dimitrik314159</A>, 
and the Level Three submission of <A HREF="/stat?c=member_profile&amp;cr=283868" CLASS="bodyGeneric">VelvetNight</A>. 
</P>

<P>
Of note, <A HREF="/stat?c=member_profile&amp;cr=269554" CLASS="bodyGeneric">Yarin</A>
 won the Ineligible Room (Room 27) for the 8th consecutive time.
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
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=match_summary','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A> -->
    
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


