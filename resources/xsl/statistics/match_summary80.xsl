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
              <TD VALIGN="middle" HEIGHT="13" CLASS="bodyText"><A HREF="/?t=tournaments&amp;c=tourny_sched" CLASS="bodyGeneric"><!-- Single Round Match 80 -->2002 TCCC Semifinals</A></TD>
              <TD VALIGN="middle" CLASS="bodyText">Friday, April 19</TD>
              <TD VALIGN="middle" CLASS="bodyText"><A HREF="/?t=tournaments&amp;c=tourny_sched" CLASS="bodyGeneric">tourney schedule</A></TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 80 - April 15, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<P>
Four Division-I coders used two challenges for come-from-behind room wins: 
</P>

<P>
In Room 12, <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">kdby</A> coded the Level One and Level Two problems during the "Coding Phase" for 423.85 points.  That total placed him seventh in the room.  In the "Challenge Phase", <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">kdby</A> successfully challenged the Level One submission of <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">turian</A>, who was the room leader with 1169.14 points, as well as the Level One submission of <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">mmsa</A>.  Those challenges added 100 points to the total of <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">kdby</A>, producing a final point total of 523.85. 
</P>

<P>
In Room 13, <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">hilgart</A> took a similar approach to <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">kdby</A>, coding the Level One and Two problems during the "Coding Phase" for 481.48 points.  That point total placed him fourth in the room.  Again, just like <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">kdby</A>, <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">hilgart</A> challenged Level One submissions during the "Challenge Phase".  <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">hilgart</A> successfully challenged <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">graycu02</A> and <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">tihi</A> for 100 additional points, and won the room with 581.48 final points. 
</P>

<P>
With 518.75 points after the "Coding Phase", <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">hilfiger</A> placed fourth in Room 15.  <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">hilfiger</A> coded the Level One and Two problems.  During the "Challenge Phase", <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">hilfiger</A> successfully challenged the Level Three submission of <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">jfreyss</A>, who was the room leader with 1188.27 points, and <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">EnderJon</A>, who was in second place with 1097.18.  <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">hilfiger</A> finished with 618.75 points. 
</P>

<P>
In Room 22, <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">billyf19</A> coded the Level One and Two problems during the "Coding Phase" for 399.49 points.  <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">billyf19</A> added 100 additional points in the "Challenge Phase", by successfully challenging the Level One submissions of <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">lightningmonsoo</A> and <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">harv</A>.  The Level Two submission of <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=1" CLASS="bodyGeneric">billyf19</A> ended up failing the system test, but a final point total of 256.22 was enough to win the room.
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
<A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">b0b0b0b</A> was the top-scorer in Division-II, earning 1522.93 final points to win Room 33.  <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">b0b0b0b</A> earned 248.17 points on the Level One problem, 543.28 on the Level Two problem, and 731.48 on the Level Three problem. 
</P>

<P>
The winner in Room 42 was <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">tenken</A>, who earned 1256.40 points after submitting code for all three problems.  <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">tenken</A> was the lowest rated coder in the room, entering the competition with a rating of 861.  The low rating, coupled with the high point total, gave <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">tenken</A> a rating gain of 274, which was the highest in the division for the match. 
</P>

<P>
<A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">Yarin</A> was the top-scoring first time coder, winning Room 60 with 1266.37 final points.  <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">Yarin</A> earned 246.19 points on the Level One problem, 281.73 on the Level Two problem, and 738.45 on the Level Three problem.  <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">Xin</A> tried to challenge the Level Three submission of <A HREF="/stat?c=last_match&amp;rd=4125&amp;dn=2" CLASS="bodyGeneric">Yarin</A>, but to no avail.
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


