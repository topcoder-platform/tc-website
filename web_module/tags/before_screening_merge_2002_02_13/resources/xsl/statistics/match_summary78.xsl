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
              <TD VALIGN="middle" HEIGHT="13" CLASS="bodyText"><A HREF="/?RoundId=4120&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 79<!-- 2002 TCCC Regional Championships --></A></TD>            
              <TD VALIGN="middle" CLASS="bodyText">Wednesday, April 10</TD>
              <TD VALIGN="middle" CLASS="bodyText">9:00pm EST</TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 78 - April 9, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="bodyGeneric">View the list of Division-II Rating Point Gain</A>
<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="bodyGeneric">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="bodyGeneric">View the list of Winning Debuts</A> 
<A HREF="/stat?c=all_time_wins" CLASS="bodyGeneric">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="bodyGeneric">View the list of Winning Debuts</A>
<A HREF="/stat?&amp;c=highest_totals&amp;dn=2" CLASS="bodyGeneric">View the list of Division-II Point Totals</A>
<A HREF="/stat?c=impressive_debuts" CLASS="bodyGeneric">View the list of Impressive Debuts</A>
-->
<P>
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A> earned 100 points in the 
"Challenge Phase" for a come-from-behind win in Room 1.  The room win was the 44th by 
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A>, by far the most of any 
member (<A HREF="/stat?c=all_time_wins" CLASS="bodyGeneric">View the list of Overall Wins</A>).  
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A> had a total of 1308.41 
points in the "Coding Phase", and trailed room-leader 
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">NDBronson</A> 
by 73.30 points, 1381.71 to 1308.41.  
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A> earned 241.71 points on 
the Level One problem, 355.08 on the Level Two problem, and 711.62 on the Level Three problem.  
During the "Challenge Phase", <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A> 
first successfully challenged the Level Three submission of 
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dgarthur</A>, and then the Level Two submission 
of <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">bigg_nate</A>.  Those two successful 
challenges and the passing of all three submissions through the system test, gave 
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A> the room win with 1408.41 final points.  
That total was 26.70 points more than <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">NDBronson</A> 
(1381.71), who didn't attempt a challenge, but like <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A> 
had all three submissions pass the system test. 
</P>

<P>
The top-score in Division-I was earned by <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">SnapDragon</A>, who won Room 3 with 1483.30 final points.  <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">SnapDragon</A> earned 243.96 points on the Level One problem, 405.17 on the Level Two problem, and 734.17 on the Level Three problem for 1383.30 points in the "Coding Phase".  <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">SnapDragon</A> added 100 points in the "Challenge Phase" with successful challenges of the Level Two submissions of <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">qubits</A> and <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dangelo</A>. 
</P>

<P>
The biggest margin of victory in Division-I was in Room 7, where <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dgoodman</A> won by 573.64 points.  <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dgoodman</A> finished with 1198.36 points, all earned in the "Coding Phase".  The second place finisher in the room was <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">bm999</A>, who earned 574.72 points in the "Coding Phase" and 50 in the "Challenge Phase" for a total of 624.72.
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
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">            
<P>
The highest score earned by a first-time coder was the 1441.00 point total of <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">antimatter</A>, 
who was the winner in Room 53.  That point total earned <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">antimatter</A> a 
1785 debut rating (<A HREF="/stat?c=impressive_debuts" CLASS="bodyGeneric">View the list of Impressive Debuts</A>), 
which is the 17th highest ever. 
</P>

<P>
The margin of victory in three Division-II rooms was less than one point: 
</P>

<P>
The closest margin was in Room 49, where <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">WallyWaffle</A> beat <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">Tronaek</A> by 0.86 points, 787.80 to 786.94.  
In Room 45, <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">Fuzzyb18</A> triumphed over <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">jmkapadia</A> by 0.93 points, 708.81 to 707.88.  Making that room even closer 
was <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">IvIetalhead</A>, who finished third with 701.53 points.  The third tight battle took place in Room 57, 
where <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">Tre</A> outpaced <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">fvolny4</A> by 0.99 points, 574.65 to 573.66. 
</P>

<P>
The biggest margin of victory in Division-II was in Room 30, where <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">joexner</A> won by 817.93.  <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">joexner</A> 
submitted code for all three problems in the "Coding Phase" for 1316.20 points.  <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">joexner</A> then added 
200 points from four successful challenges of his opponent's Level Three submissions in the "Challenge Phase", 
to finish with 1516.20 points, the highest total of the match.  Five different coders tried to challenge the 
Level Three submission of <A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=2" CLASS="bodyGeneric">joexner</A>, but to no avail.
</P>


<!-- <P>
View the Top-10 Winners:<BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_ne" CLASS="bodyGeneric">Northeast Top-10</A> | <A HREF="/index?t=statistics&amp;c=top_10_wins_se" CLASS="bodyGeneric">Southeast Top-10</A><BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_w" CLASS="bodyGeneric">West Top-10</A> | <A HREF="/index?t=statistics&amp;c=top_10_wins_mw" CLASS="bodyGeneric">Midwest Top-10</A><BR/>
</P> -->
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


