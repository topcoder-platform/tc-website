<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
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
        <xsl:call-template name="public_stats_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
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
				<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?ContestId=4215&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 99</A></TD>						
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?ContestId=4215&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Thursday, June 20</A></TD>
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?ContestId=4215&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">6:30pm EDT (registration)</A></TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 98 - June 19, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<A HREF="/stat?c=member_profile&amp;cr=272072" CLASS="bodyGeneric">SnapDragon</A>, 
participating from room one, once again broke the 3000 rating point mark with a final score of 1269.13 
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=268580" CLASS="bodyGeneric">Wasyuu</A>
 and <A HREF="/stat?c=member_profile&amp;cr=288170" CLASS="bodyGeneric">qwj</A>
 dominated room 8, both achieving impressive rating gains of 127 and 246 rating points respectively. 
</P>

<P>
Room 3 produced three new red-rated coders, with <A HREF="/stat?c=member_profile&amp;cr=264961" CLASS="bodyGeneric">henchq</A>
, <A HREF="/stat?c=member_profile&amp;cr=263379" CLASS="bodyGeneric">pochmann</A>
, and <A HREF="/stat?c=member_profile&amp;cr=274068" CLASS="bodyGeneric">Brian</A>
 all turning in very impressive 
performances.  <B>henchq</B> has crossed into the red territory twice in the past, but for both <B>pochmann</B> and <B>Brian</B> 
this is their initial incursion into the most elite of the rating groups. 
</P>

<P>
Lackluster performances from both <A HREF="/stat?c=member_profile&amp;cr=156216" CLASS="bodyGeneric">daveagp</A>
 and <A HREF="/stat?c=member_profile&amp;cr=262902" CLASS="bodyGeneric">ZandMaster</A>
 resulted in both dropping from the red group back 
down into the yellow group. 
</P>

<P>
Room 12 produced an incredible performance from <A HREF="/stat?c=member_profile&amp;cr=260987" CLASS="bodyGeneric">dangelo</A>
, who produced a final score of 1330.20 and a rating 
increase of 196 points. 
</P>

<P>
In room 27, <A HREF="/stat?c=member_profile&amp;cr=280380" CLASS="bodyGeneric">dislyxec</A>
 turned in a very successful challenge phase, gaining 150 points from offensive challenges, 
throwing in a successful defense of a challenge for good measure.  <B>dislyxec</B> improves to a 60% challenge success 
rate, and with a final score of 457.82 points, moves up in the ratings as well.
</P>



                 </TD>
            </TR>             
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>        
            <TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BGCOLOR="#CCCCCC" CLASS="bodyText">&#160;&#160;<B>Division-II</B></TD></TR>
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P>
Nine first-time competitiors bypassed Division-II, jumping straight into Division-I.  
The most impressive of the first-timer performances was turned in by 
<A HREF="/stat?c=member_profile&amp;cr=289251" CLASS="bodyGeneric">ragnabot</A>
 who managed 
1238.44 points in room 63, the seventh highest overall score in Division-II 
(<A HREF="/stat?c=impressive_debuts" CLASS="bodyGeneric">View the list of Impressive Debuts</A>).  <B>ragnabot</B> also 
successfully defended against three challenges and turned in a relatively easy challenge 
against <A HREF="/stat?c=member_profile&amp;cr=289904" CLASS="bodyGeneric">sirishks</A>
 to top it off. 
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=285577" CLASS="bodyGeneric">Partorg</A>
, in room 31, produced the most fruitful performance in Division-II, hammering out 
1403.64 points, with none of it resulting from the challenge phase.  As a result, <B>Partorg</B> 
has risen 233 rating points to a current rating of 1359. 
</P>

<P>
Both <A HREF="/stat?c=member_profile&amp;cr=158663" CLASS="bodyGeneric">Xcifer</A>
 in room 47 and <A HREF="/stat?c=member_profile&amp;cr=264728" CLASS="bodyGeneric">Liguo</A>
 in room 41 ransacked their rooms during the challenge phase, 
with each managing to issue 4 successful challenges apiece.  Both added their 200 challenge 
points on top of successful level one and level two problem submissions. 
</P>

<P>
In room 60, <A HREF="/stat?c=member_profile&amp;cr=263657" CLASS="bodyGeneric">purpleurple</A>
 looked to have a secure lead going into the system testing phase, only 
to loose 730 of 955 points to the system tests.  As a result, 
<A HREF="/stat?c=member_profile&amp;cr=273303" CLASS="bodyGeneric">Celeborn</A>
 won the room with a final 
score of 658.92 points and a Division-I initial rating of 1385.
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
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
<A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98" TARGET="_blank"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<!-- <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=match_summary','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A> -->
    
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


