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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm87_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm87_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm87_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm87_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR>
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links <A HREF="/stat?c=last_match&amp;rd=4140" CLASS="bodyGeneric">NDBronson</A> -->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<P><B>Single Round Match 87</B><BR/>
May 9, 2002</P>
<P><B>Room 1 Review</B></P>

<P>
I'm the winner of Room 1 (<A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A>), and it's finally pulling me out of a
 long slump (for now, at least), but since I'm the writer, it might be a
 little hard to avoid tooting my own horn, so to speak. Bear with me. I'll
 talk in the third person so it's not quite so unbearable.
</P>
 
<P>
 Room 1 started out with an extremely fast submission by <B>ZorbaTHut</B> on the
 Level One - 3:47, getting 294.77 points and securing the fastest Level One
 submission in Div-I. <A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A> submitted about a minute and a half
 later, getting 290.67 points, followed by <A HREF="/tc?module=MemberProfile&amp;cr=272072" CLASS="bodyGeneric">SnapDragon</A> a minute after that
 with 287.37 points, and <A HREF="/tc?module=MemberProfile&amp;cr=153505" CLASS="bodyGeneric">ambrose</A>
 twenty seconds later for 285.90 points.
 <A HREF="/tc?module=MemberProfile&amp;cr=120816" CLASS="bodyGeneric">malpt</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>
 submitted within five seconds of each other after almost
 eight minutes of coding, getting 279.03 and 279.37 points. <A HREF="/tc?module=MemberProfile&amp;cr=156592" CLASS="bodyGeneric">benetin</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="bodyGeneric">evd</A>
 brought up the end, <B>evd</B> spending eleven and a half minutes for 260.29
 points.
</P>
 
<P>
 A minute and a half after <B>evd</B>'s Level One submission, <B>ZorbaTHut</B> submitted
 his solution for the Level Two after nine and a quarter minutes of coding,
 getting the fastest Level Two submission as well as 499.02 points. Following
 him after slightly more than 3 minutes was, again, <B>Snapdragon</B>, spending ten
 and a half minutes coding the Level Two and getting 487.81 points for his
 work. This time <B>dmwright</B> tied with <B>evd</B>, both spending a little under
 thirteen and a half minutes, getting 456.36 and 457.92 points each. <B>malpt</B>
 and benetin finished last, taking 18:24 for 405.26pt and 22:30 for 367.54pt.
</P>
 
<P>
 Before benetin submitted his Level Two, however, <B>ZorbaTHut</B> finished up his
 Level Three in only fifteen and a half minutes, getting 712.42pt, finishing
 the entire set in only 28 and a half minutes for a grand total of over 1500
 points. <B>Snapdragon</B> finished approximately three minutes later, spending only
 15 extra seconds on the 900 but only getting 706.56 points for it (though
 also beating out benetin's 550.) <B>Snapdragon</B> finished with a grand total of
 1481.74 points, well within range of a single challenge.
</P>
 
<P>
 However, four minutes after <B>Snapdragon</B>'s completion, <B>John Dethridge</B>
 submitted his 900 as well, beating <B>ZorbaTHut</B>'s time by 30 seconds for 721.57
 points, a total of 1447.43, within one challenge of <B>Snapdragon</B>. And five
 minutes after that <B>malpt</B> beat <B>John Dethridge</B>'s time by almost a full minute,
 taking barely over 14 minutes of coding time to finish with 735.89 points
 for the Level Three (the best score in for this problem over the entire
 division), 1420.18 points total, within one challenge of <B>John Dethridge</B>.
</P>
 
<P>
 Unfortunately, the next person to complete all three problems - <B>dmwright</B> -
 placed him 56 points behind <B>malpt</B>. <B>dmwright</B> took 20:39 to earn 628.27
 points. Next was <B>ambrose</B>, a mere 28 points behind <B>dmwright</B>. It must have
 been very frustrating when <B>evd</B> beat <B>ambrose</B>'s time on the 900 by a minute,
 beating <B>ambrose</B>'s score by less than a single point despite spending almost
 three minutes more on all the problems together.
</P>
 
<P>
 By 47 minutes into the match everyone in Room One had submitted all three
 problems, with the exceptions of <A HREF="/tc?module=MemberProfile&amp;cr=156592" CLASS="bodyGeneric">benetin</A> and 
 <A HREF="/tc?module=MemberProfile&amp;cr=128924" CLASS="bodyGeneric">thekcc</A>. <B>benetin</B> was still
 working on his Level Three solution, which he eventually submitted just
 before the end of the match for 438.21 points, getting second-to-last with a
 total score of 1072.04. <B>thekcc</B>, on the other hand, had opened all three
 problems and left with no submissions, clearly an attempt to lower his
 rating to get out of Room One (and frankly, I can't blame him - Room One is
 brutal.)
</P>
 
<P>
 Challenge Phase could have been devastating, as the only person who couldn't
 raise their rank by a single challenge was <B>dmwright</B>. However, almost all the
 solutions were bugless. <B>ambrose</B> successfully challenged 
 <B>benetin</B>'s 900pt,
 dropping <B>benetin</B>'s 8th-place to a lower-scoring 8th-place but raising
 <B>ambrose</B> two ranks, but then unsuccessfully challenged <B>benetin</B>'s 550pt,
 dropping <B>ambrose</B> back to 7th again. benetin attempted to kill <B>ZorbaTHut</B>'s
 900 on a worst-case efficiency challenge, but failed. There were no other
 challenges, despite all the competitors looking for anything to use.
</P>
 
<P>
 System tests proved the quality of the submissions - every remaining problem
 passed all the tests, leaving the winners <B>ZorbaTHut</B>, <B>Snapdragon</B>, and <B>John Dethridge</B>. Despite the fastest Level Three in the division, <B>malpt</B> missed
 placing by 27 points.
</P>
 
<P>
 This round was good to the ratings in Room One. <B>ZorbaTHut</B> gained 148 rating
 points, <B>Snapdragon</B> 93, and <B>John Dethridge</B> 76. <B>malpt</B> gained the fewest,
 getting only 37. The only people to lose rating were <B>dmwright</B> (dropping 4
 points from his astronomical rating of 2932, now only leading 
 <A HREF="/tc?module=MemberProfile&amp;cr=152073" CLASS="bodyGeneric">NDBronson</A>
 by
 17 points), <B>benetin</B>
 (losing 68 points), and <B>thekcc</B>
, capping out his maximum
 drop in one round by diving 170 rating points, plummeting to rank 37 and
 barely going yellow.
</P>

<IMG SRC="/i/m/ZorbaTHut_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;ZorbaTHut<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


