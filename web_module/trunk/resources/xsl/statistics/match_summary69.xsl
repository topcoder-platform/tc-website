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
							<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?t=tournaments&amp;c=tourny_sched" CLASS="statText"><!-- Single Round Match 69 -->2002 TCCC Regional Semifinals (All Regions)</A></TD>
							<TD VALIGN="middle" CLASS="statText">Wednesday, March 6</TD>
							<TD VALIGN="middle" CLASS="statText">8:00pm EST</TD>
						</TR>						
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
						</TR>
                    <!-- <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR> -->						
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 69 - Feb 28, 2002 <!-- TCCC First Round W/MW- February 21, 2002 --></TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
						</TR>												
						<TR>
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-I <!-- West Region --></TD>
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
Two coders, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=265736" CLASS="coderTextRed">Ken Alverson</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=260987" CLASS="coderTextYellow">skyice</A>, had performances that earned them top-25 Rating Point Gain's in SRM 69.  
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=265736" CLASS="coderTextRed">Ken Alverson</A> was the winner in Room 3, and had a rating gain of 289, which ranks as the fifth highest ever (<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>).  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=265736" CLASS="coderTextRed">Ken Alverson</A> earned 1234.45 final points by submitting the correct code for all three problems, which was the highest point total of the match.  
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=260987" CLASS="coderTextYellow">skyice</A> had a rating increase of 225, which ties <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> for 21st.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> had a 225-point rating gain in SRM 2.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=260987" CLASS="coderTextYellow">skyice</A> won Room 17 with 1092.97 final points by submitting the correct code for all three problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=260987" CLASS="coderTextYellow">skyice</A> did earn 50 additional points by successfully challenging the 1000-point submission of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156541" CLASS="coderTextBlue">SteveStern</A>, but then lost 50 by being incorrect in a challenge of the 1000-pointer of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156824" CLASS="coderTextBlue">addaon</A>.
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
							<TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II <!-- Midwest Region --></TD>
						</TR>
						<TR>
							<TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
						</TR>						
						<TR>
							<TD VALIGN="top" COLSPAN="3" CLASS="statText">						
<P>
Even though they didn't make the top-25 in Highest Rating Point Debut (<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>), the four new coders who won their room all had impressive point totals and earned a high enough rating to join Division-I for the next match.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266571" CLASS="coderTextYellow">jburnim</A> was the debut winner in Room 51.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266571" CLASS="coderTextYellow">jburnim</A> submitted the correct code for all three problems in the "Coding Phase" for 1012.03 points to place second behind <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268919" CLASS="coderTextBlue">ChaosDeathFish</A>, who had 1121.91 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266571" CLASS="coderTextYellow">jburnim</A> then added 100 points in the "Challenge Phase" with two successful challenges to jump past <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268919" CLASS="coderTextBlue">ChaosDeathFish</A>.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268919" CLASS="coderTextBlue">ChaosDeathFish</A> lost 50 points with an unsuccessful challenge and 433.33 points after the system test failed the 1000-point submission.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266571" CLASS="coderTextYellow">jburnim</A> earned a debut rating of 1537.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269539" CLASS="coderTextBlue">tperry</A> won Room 52 by submitting the correct code for all three problems for 942.41 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=156927" CLASS="coderTextGreen">CSEGod</A> led the room after the "Coding Phase" and the "Challenge Phase" with 1071.57 points, but lost 674.75 points when the 1000-point submission failed the system test.  The debut rating of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269539" CLASS="coderTextBlue">tperry</A> is 1399.
</P>

<P>
The Room 53 winner was <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268662" CLASS="coderTextYellow">nano</A>, who earned 1182.64 final points by submitting the correct code for all three problems for 1132.64 points in the "Coding Phase", and adding 50 points in the "Challenge Phase" with a successful challenge of the 500-point submission of amosz42.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269543" CLASS="coderTextBlue">BunnyBaby</A> was leading the room with 1224.29 points until the system test failed the 1000-pointer, causing a loss of 609 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268662" CLASS="coderTextYellow">nano</A> earned a 1643 debut rating.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266690" CLASS="coderTextYellow">Jlyer</A> was the Room 54 winner after correctly coding all three problems in the "Coding Phase" for 1022.76 points, and then earning 50 additional points in the "Challenge Phase" with a successful challenge of the 250-pointer of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=269546" CLASS="coderTextGray">RReyes</A>.  The debut rating of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=266690" CLASS="coderTextYellow">Jlyer</A> is 1503.
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

