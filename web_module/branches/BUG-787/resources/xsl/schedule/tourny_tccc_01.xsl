<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
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
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">schedule_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;Tournaments</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
						<TR><TD WIDTH="100%" ALIGN="left" VALIGN="top" CLASS="statText">
						<BR/><DIV CLASS="statTextBig">2001 TopCoder Collegiate Challenge Recap</DIV><BR/>
						<P>From June 5-7, 2001, 16 of the top collegiate programmers in the country traveled to the San Francisco Hilton and Towers for the semifinals and final of the 2001 TopCoder Collegiate Challenge.  The tournaments purse was $250,000, with the winner receiving $100,000.</P>
						<P>The tournament began in April with 256 of TopCoder's top-rated collegiate members competing in three online elimination rounds, which reduced the field to the final 16.</P>
						<B>SEMIFINAL A</B>
						<P><A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>
, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115699" CLASS="coderTextBlue">agmarut</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108530" CLASS="coderTextYellow">dpecora</A>, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A> got the semifinal rounds started at 10:00 am on Tuesday morning.  During the "Coding Phase", <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108530" CLASS="coderTextYellow">dpecora</A> were able to finish all three problems, while <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115699" CLASS="coderTextBlue">agmarut</A> completed two.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> finished the problems the quickest, earning 1217.74 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108530" CLASS="coderTextYellow">dpecora</A> were close behind with 1101.96 and 947.40 points, respectively, while <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115699" CLASS="coderTextBlue">agmarut</A> earned 505.15.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> was able to distance himself from the field by successfully challenging the 1000-point submission by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A>, which added 100 points to his score, and caused <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A> to lose the 534.51 points he had earned from that problem.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115699" CLASS="coderTextBlue">agmarut</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108530" CLASS="coderTextYellow">dpecora</A> both failed in their challenges of the 1000-point submission from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A>, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A> failed in his challenge of the 250-point submission of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115699" CLASS="coderTextBlue">agmarut</A>, casing all three to lose 100 points each.  When the "Challenge Phase" ended, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> continued to lead, with <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108530" CLASS="coderTextYellow">dpecora</A> now in second and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A> in third.  The system test shuffled the places again, as the 250 and 1000-point submissions of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108530" CLASS="coderTextYellow">dpecora</A> failed, as did the 250-pointer from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113573" CLASS="coderTextBlue">unlord</A>, causing them to drop to third and fourth, respectively.  The 500-point code submitted by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> failed the system test as well, but he had earned enough points on the other problems to win the match by 475.83 points (880.98 to 405.15) over <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=115699" CLASS="coderTextBlue">agmarut</A>, who went through the system test unscathed.</P>
						<B>SEMIFINAL B</B>
						<P>Tuesday's afternoon session began very similar to the morning, as three coders, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111359" CLASS="coderTextYellow">Spam_vt</A>, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> completed all three of the problems, while <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113204" CLASS="coderTextGreen">wickamos</A> finished two of them.  In an extremely close battle, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111359" CLASS="coderTextYellow">Spam_vt</A> held the lead with 1363.82 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> (1291.96) and  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A> (1220.73) were just behind in second and third, with <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113204" CLASS="coderTextGreen">wickamos</A> (823.09) in fourth.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A> distanced himself from the field in the "Challenge Phase", earning an impressive 300 points by successfully challenging the 1000-point submission of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111359" CLASS="coderTextYellow">Spam_vt</A>, and both the 500 and 1000-point submissions of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> was able to gain back 100 of the 1058.13 points he lost in the "Challenge Phase", by successfully challenging the 1000-pointer from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113204" CLASS="coderTextGreen">wickamos</A>.  All of the remaining codes passed the system test, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A> advanced to the finals.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111359" CLASS="coderTextYellow">Spam_vt</A> finished second, with <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A> third and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=113204" CLASS="coderTextGreen">wickamos</A> fourth.</P>
						<B>SEMIFINAL C</B>
						<P>In the Wednesday morning semifinal, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109535" CLASS="coderTextBlue">UMdrone</A> had the lead after the "Coding Phase", earning 1188.63 points for  submitting code for all three problems.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A>, who like <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109535" CLASS="coderTextBlue">UMdrone</A> completed all three problems, was second with 992.25 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A> and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111454" CLASS="coderTextYellow">zbbrox</A> completed two of the three problems and stood third and fourth, respectively.  During the "Challenge Phase", <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A> took the lead when he successfully challenged the 1000-pointer from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109535" CLASS="coderTextBlue">UMdrone</A>.  The only other challenge in that phase was an unsuccessful attempt by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111454" CLASS="coderTextYellow">zbbrox</A> on the 1000-point submission from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A>.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A> lost his lead during the system test, when his 500 and 1000-point codes failed.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A>, whose 250 and 500-point submissions both passed the system test, won the round with 612.60 points.  He was followed by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111454" CLASS="coderTextYellow">zbbrox</A>, whose 250 and 500-point submissions also passed the system test, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112438" CLASS="coderTextRed">stevevai</A>, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109535" CLASS="coderTextBlue">UMdrone</A>, whose 250 and 500-point submissions failed.</P>
						<B>SEMIFINAL D</B>
						<P>In the final semifinal round, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A> produced the highest "Coding Phase" point total by earning 1534.91 points from his three submissions.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=110176" CLASS="coderTextYellow">Orbus</A> also submitted code for the three problems, and was in second with 1154.56 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112630" CLASS="coderTextYellow">Aleksey</A>, who completed two of the three, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108594" CLASS="coderTextGreen">freshStart</A> who completed one, were in third in fourth, respectively.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A> put considerable distance between himself and his competitors by successfully challenging all three of their 250-point submissions for 300 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=110176" CLASS="coderTextYellow">Orbus</A> tried to keep pace, but failed in his challenge of the 1000-point submission from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A>.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112630" CLASS="coderTextYellow">Aleksey</A> gained 100 points back in his successful challenge of the 500-pointer from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=110176" CLASS="coderTextYellow">Orbus</A>.  Rounding out the challenges was a failure by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108594" CLASS="coderTextGreen">freshStart</A> on the 250-pointer from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=110176" CLASS="coderTextYellow">Orbus</A>.  The 1000-point submission from <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A> ended up failing the system test, but it didn't matter, as he had accumulated enough points to win the round and advance to the final.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=110176" CLASS="coderTextYellow">Orbus</A>, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112630" CLASS="coderTextYellow">Aleksey</A>, and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=108594" CLASS="coderTextGreen">freshStart</A> finished second, third and fourth, respectively.</P>
						<B>FINALS</B>
						<P>All four coders put on an impressive display during the "Coding Phase", as they all completed the three problems and earned point totals over 1000.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> led the way with 1419.32 points.  He was followed closely by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A> (1351.96), <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A> (1276.62), and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A> (1220.15).  In a very active "Challenge Phase", <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> gained 200 points from successful challenges of the 250-point submission of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A> and the 1000-pointer of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112441" CLASS="coderTextYellow">seacow</A>, but then lost 468.04 points, when <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=109965" CLASS="coderTextYellow">vulture</A> successfully challenged his 1000-point submission.  He finished with 1151.28 final points.  That total was 7.64 points behind the final total of the 2001 TopCoder Collegiate Challenge Champion <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=105922" CLASS="coderTextRed">qubits</A>, who did lose 217.70 points from the 250-point <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114443" CLASS="coderTextRed">jonmac</A> challenge, but was able to successfully challenge two of three algorithms and gain 100 points back for a total of 1158.92 final points.</P>
						<BR/><BR/>
						ENTERTAINMENT
						<P>Following the second semifinal, the finalists were treated to a San Francisco Giants baseball game at Pac Bell Park, and witnessed a piece of history as Barry Bonds hit his 31st home run of the season.  Bonds went on to hit 73 home runs in 2001, breaking Mark McGuire's single-season record of 70.</P>

						<P>After the finals, the coders were treated to a San Francisco Bay boat cruise around the Golden Gate Bridge and Alcatraz Island.</P>
						</TD></TR>
					</TABLE>
					<P><BR/></P>
		</TD>
		<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
      </TABLE>
    </TD>

	<!-- Center Column Ends -->
<!-- Body Area Ends -->
            <!-- Gutter -->
            <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
              <!-- Right Column Include Begins --> 
              <xsl:call-template name="public_right_col"/>       
              <!-- Right Column Include Ends -->        
            </TD>
            <!-- Right Column Ends -->
            <!-- Gutter -->
            <TD WIDTH="25" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>
        <!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

