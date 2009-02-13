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
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		<TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm90_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm90_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm90_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">-->
<P><B>Single Round Match 90</B><BR/>
May 21, 2002</P>
<P><B>Room 1 Review</B></P>

<P>
Room 1 started with nearly simultaneous openings of the Level One problem by 
<A HREF="/stat?c=member_profile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A>, 
<A HREF="/stat?c=member_profile&amp;cr=274023" CLASS="bodyGeneric">venco</A>, 
<A HREF="/stat?c=member_profile&amp;cr=158333" CLASS="bodyGeneric">dvickrey</A>, 
and <A HREF="/stat?c=member_profile&amp;cr=157974" CLASS="bodyGeneric">bigg_nate</A>. 
<A HREF="/stat?c=member_profile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A>, 
<A HREF="/stat?c=member_profile&amp;cr=114443" CLASS="bodyGeneric">jonmac</A>, and
<A HREF="/stat?c=member_profile&amp;cr=262935" CLASS="bodyGeneric">derkuci</A>
 all opened the same problem within twenty seconds, while 
 <A HREF="/stat?c=member_profile&amp;cr=156592" CLASS="bodyGeneric">benetin</A>
 waited almost a minute, and <A HREF="/stat?c=member_profile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A> for some reason 
taking well over four minutes to start - an inauspicious beginning.
</P>

<P>
Meanwhile, <B>ZorbaTHut</B> submitted the Level One after three minutes flat for 247.22 (not the best score in the competition - 
<A HREF="/stat?c=member_profile&amp;cr=154754" CLASS="bodyGeneric">kv</A> 
in Room Two beat him by exactly half a minute). He was quickly followed by <B>derkuci</B> and <B>venco</B> at twenty-second intervals, 
for 246.62 and 245.98 points respectively.
<B>bigg_nate</B> submitted at the 4.5 minute mark for 243.71, while <B>jonmac</B> and
<B>John Dethridge</B> submitted at 5:45 and 5:55, both getting about 240 points.
<B>dvickrey</B> spent 8 minutes on a 231.52 point solution, and <B>benetin</B> spent nearly 11 minutes on a solution to give him only 219.13 
points. Despite <B>dmwright's</B> late start, he completed his code in five and a half minutes for almost 241 points.
</P>

<P>
Each coder proceeded to the Level Two problem in turn, except <B>benetin</B> and
<B>dmwright</B>, who each went straight to the Level Three problem. <B>ZorbaTHut</B> was once again the fastest submitter in 
Room 1, getting 402.33 points for less than 15 minutes of work. Yet again though, his score was topped in a 
different room (<A HREF="/stat?c=member_profile&amp;cr=269554" CLASS="bodyGeneric">Yarin</A>
 in room 24, getting 426.46 points). This time it was <B>bigg_nate</B> who had the second fastest submission, 
taking a minute longer for 391.97 points. <B>John Dethridge</B>, <B>dvickrey</B>, <B>derkuci</B>, and <B>jonmac</B> spent between seventeen and a half 
minutes to over 20 minutes on their Level Two submissions. <B>venco</B> unfortunately couldn't repeat his performance on the Level 
One, and spent over 24 minutes, getting only 321.83 points. All the coders proceeded in turn to the Level Three, joining 
<B>dmwright</B> and <B>benetin</B>.
</P>

<P>
<B>dmwright</B> was the first to submit the Level Three, partially due to his eight-minute head start over <B>ZorbaTHut</B>. 
<B>dmwright</B> spent 45 minutes and earned 451.78 points. He then went back to do the Level Two. Three minutes later <B>ZorbaTHut</B> submitted, taking less than 41 
minutes for 477.34 points. <B>ZorbaTHut</B> was the first to finish all three problems, earning 1126.89 points in slightly less 
than 59 minutes. However, unfortunately for him, <B>bigg_nate</B> submitted his Level Three thirty seconds later, actually taking 
two minutes less to code it and earning 492.67 points, bringing his total a mere point and a half above <B>ZorbaTHut</B>'s. 
The next submitter of the Level Three was <B>benetin</B>, finishing up a solution that took him 54 minutes to write, earning 
413.02 points. <B>benetin</B> had skipped to the Level Three directly, and apparently decided not to attempt the Level Two in 
the eight minutes he had remaining.
</P>

<P>
The last minute of the match produced a flurry of submissions, <B>jonmac</B> submitting with only 50 seconds remaining on the 
clock, <B>derkuci</B> waiting until 23 seconds before the end of the round, <B>John Dethridge</B> submitting with a mere 12 seconds 
remaining, and <B>dmwright</B> squeezing in his Level Two with literally two seconds until closing. The standing were <B>ZorbaTHut</B> 
and <B>bigg_nate</B> separated by a point and a half, with <B>John Dethridge</B>, <B>jonmac</B>, <B>derkuci</B>, and <B>dmwright</B> within 23 points of 
each other. <B>dmwright</B> (the highest of them, and currently 3rd place) was 70 points away from <B>ZorbaTHut</B>. <B>venco</B> and 
<B>dvickrey</B> failed to submit a Level Three, while <B>benetin</B> didn't submit a Level Two.
</P>

<P>
During challenge phase, <B>ZorbaTHut</B> went looking at <B>dmwright's</B> last-minute submission, finding a bug and successfully 
challenging. This pushed him above <B>bigg_nate</B>, taking the lead, and knocking <B>dmwright</B> behind the pack. <B>dvickrey</B> 
attempted a challenge on <B>John Dethridge</B>'s Level Two but failed, quickly mirrored by <B>venco</B>'s likewise-unsuccessful 
challenge on <B>dvickrey</B>'s Level Two.
</P>

<P>
System tests destroyed the Level Three solutions over the entire competition, leaving only <B>ZorbaTHut</B> and 
<B>John Dethridge</B>'s submissions unscathed. In addition, <B>dvickrey's</B> Level Two submission failed.
</P>

<P>
<B>ZorbaTHut</B> finished in first place with 1176.89 points, the highest score in the entire competition. 
<B>John Dethridge</B> took second highest with 1051.96 points. <B>bigg_nate</B> got third place with his 635.68 points. 
<B>dvickrey</B> got last in the room, with only a surviving Level One solution and a bad challenge. <B>benetin</B> took second-last,
 and <B>dmwright</B> got a surprising third-last.
</P>

<P>
<B>ZorbaTHut</B> picked up 117 rating points, boosting him all the way up to #5 from #10. <B>John Dethridge</B> gained 64, and <B>bigg_nate</B> 
got 38 points. Everyone else in the room lost rating, from <B>derkuci</B> who lost only a single point to <B>dvickrey</B> who dropped 
by 184 points, the maximum he could drop in one round. The only other person to drop his maximum was <B>dmwright</B>, 
losing 166 points and plummeting from his 1st-place position all the way to 4th-place, <B>ZorbaTHut</B> now only 
64 points behind him, from 347 points a day ago.
</P>

<IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;ZorbaTHut<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=152347" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
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


