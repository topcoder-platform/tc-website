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
				<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4145&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 85</A></TD>						
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4145&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Wednesday, May 1</A></TD>
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4145&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">7:30pm EDT</A></TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 84 - April 30, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="bodyGeneric">View the list of Division-I Rating Point Gain</A>
<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="bodyGeneric">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="bodyGeneric">View the list of Winning Debuts</A> 
<A HREF="/stat?c=all_time_wins" CLASS="bodyGeneric">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="bodyGeneric">View the list of Winning Debuts</A>
<A HREF="/stat?&amp;c=highest_totals&amp;dn=2" CLASS="bodyGeneric">View the list of Division-II Point Totals</A>
<A HREF="/stat?c=impressive_debuts" CLASS="bodyGeneric">View the list of Impressive Debuts</A>
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A>
-->
<P>It was a night of very close battles in the top-three Division-I rooms.</P>
<P>Starting right off in Room 1, where the top-rated coders battle each other every match, <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">reid</A> 
was the winner with 1274.00 final points.  That total was just 8.05 more than <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">NDBronson</A> (1265.95), 
11.64 more than <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">ZorbaTHut</A> (1262.36) and 62.55 more than <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">malpt</A> (1211.45). 
The leader in Room 1 after the "Coding Phase" was <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">JohnDethridge</A> with 1343.50 points, while <B>NDBronson</B> 
was in second with 1315.95, and reid was third. <B>NDBronson</B> was unsuccessful in a challenge of the Level One submission of <B>ZorbaTHut</B>, and lost 50 points.  <B>ZorbaTHut</B> 
successfully challenged the Level Two submission of <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">dmwright</A>, and moved from fifth place to third place.  While 
<B>JohnDethridge</B> made it through the "Challenge Phase" unscathed, his Level Two submission ended up failing the system test, which cost him the 339.81 points he earned from his submission. 
That dropped him all the way to sixth place, and gave <B>reid</B> the room win.</P>

<P>Right next door in Room 2, <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">ambrose</A> earned 1190.15 final points to win the room.  He beat <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">SnapDragon</A> 
(1174.28) by 15.87 points, and had 46.39 more than anr (1143.76).  After the "Coding Phase", evd was in first with 1236.16 points, <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">bigg_nate</A> 
was second with 1203.72, and <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">Joe</A> was third with 1174.81.  In the "Challenge Phase", <B>ambrose</B> successfully challenged the Level One submission of 
<A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">evd</A>, knocking <B>evd</B> from first to fourth. <B>ambrose</B> didn't jump to first place until the system test, when the Level One submission of <B>bigg_nate</B> failed, dropping him from first to fifth.</P>

<P>Continuing in order, <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">benetin</A> won Room 3 in come-from-behind fashion with two successful challenges. <B>benetin</B> 
finished with 912.47 final points.  That's 24 more points than <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">pl31415</A> (888.47), and 39.56 more than <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">kv</A> (862.91). 
<B>benetin</B> was actually in eighth place after the "Coding Phase", but successfully challenged the Level One submissions of both <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">Sord</A> and 
<A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=1" CLASS="bodyGeneric">Logan</A>. <B>Sord</B> had been the leader of the room with 1196.89 points, but besides being successfully challenged by <B>benetin</B>, his Level Two submission failed the system test.  He finished fifth.</P>
                 </TD>
            </TR>             
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>        
            <TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II</TD></TR>
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P>Despite having his Level Two submission fail the system test, <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">harv</A> had three successful challenges to win Room 34. 
<B>harv</B> earned 1484.75 points in the "Coding Phase" to lead the room.  He then earned 150 points in the "Challenge Phase", with successes on the Level One and Three submissions of 
<A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">jerschneid</A> and the Level One submission <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">bml137</A>. 
<A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">bgalbs</A> tried to challenge the Level Two submission of harv, but to no avail.  <B>harv</B> finished with 1166.20 points.</P>

<P>Ever win a room after losing more than half your points in the "Challenge Phase"?  Well it happened to <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">ruckc</A> in Room 59. 
<B>ruckc</B> coded all three problems in "Coding Phase" for 1399.41 points. <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">gjbeyl</A> then successfully challenged the Level 
Three submission of <B>ruckc</B> in the "Challenge Phase", which cost <B>ruckc</B> the 722.70 points earned on that problem.  That put <B>gjbeyl</B> in first place.  The Level Three submission of 
<B>gjbeyl</B> failed the system test, however, which meant a loss of the 366.79 points earned on that problem, a second place finish, and a win for <B>ruckc</B>.</P>

<P><A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">cbthiess</A> won Room 62 with 1547.52 final points, producing a debut rating of 1755, which is the 25th best ever 
(<A HREF="/stat?c=impressive_debuts" CLASS="bodyGeneric">View the list of Impressive Debuts</A>). <B>cbthiess</B> coded all three problems in the "Coding Phase" for 1447.52 points, and then added 100 points to that total with successful challenges of the 
Level One submissions of <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">NinjaDragon</A> and <A HREF="/stat?c=last_match&amp;rd=4140&amp;dn=2" CLASS="bodyGeneric">sanderj</A>.</P>
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


