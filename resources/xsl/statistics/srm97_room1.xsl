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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm97_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm97_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm97_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm97_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR>
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 97</B><BR/>
June 12, 2002</P>
<P><B>Room 1 Review</B></P>

<P>
Room One today saw the usual quick start by most of the room on the Level
One problem. <B>ZorbaTHut</B>, <B>SnapDragon</B>, <B>Yarin</B>, <B>dgarthur</B>, <B>malpt</B>, and <B>DjinnKahn</B>
opened the Level One within seconds of the round's start. <B>John Dethridge</B> and
<B>reid</B> started late, both opening at approximately the three-minute mark.
<B>venco</B> broke with tradition and opened the Level Three first.
</P>

<P>
First submission went to <B>Yarin</B>, turning in his Level One in a little over
nine minutes for 317.70 points. <B>Yarin</B> was quickly followed by <B>SnapDragon</B>,
then <B>ZorbaTHut</B>, the last earning 314.79 points. As usual, the late starts
messed things up a little. Despite submitting a minute and a half later,
<B>John Dethridge</B> got the fastest submission in the room, earning 325.37 points
for slightly under eight minutes of work, <B>reid</B> spending only twenty seconds
more for 323.70 points. Curiously enough, while almost all the programmers
finished in less than ten and a half minutes of work, <B>malpt</B>, <B>dgarthur</B>, and
<B>DjinnKahn</B> spent over thirteen and a half minutes each, yet came within
twenty seconds of each other, earning under 290 points.  Each coder
proceeded to the Level Two except <B>John Dethridge</B>, who skipped ahead to the
Level Three.
</P>

<P>
And speaking of the Level Three, <B>venco</B> finished up his Level Three
submission after only 21:39, earning 750.13 points then dropping back to
start the Level One. <B>John Dethridge</B> finished his Level Three before any
coder finished the grueling Level Two problem, 768.56 points on 20 minutes
of work, and dropped to the Level Two after a short break.
</P>

<P>
First submission on the Level Two came from <B>Yarin</B> as well, spending 22:43
for 299.21 points, but once again his score was beaten by a late started.
<B>reid</B> took the high score on the Level Two, barely more than 19 minutes of
work yielding 325.62 points. Most of the coders finished less than 30
minutes after starting, <B>DjinnKahn</B> coming within 30 seconds of the border,
earning from 289 points to 259 points on the low end. <B>dgarthur</B> apparently
ran into some trouble, taking more than ten minutes longer than <B>DjinnKahn</B>,
only earning 218.17 points. Each coder proceeded on to the Level Three.
</P>

<P>
<B>reid</B> was the first to complete the problem set, spending under 16 minutes on
the Level Three, getting 861.66 points for his solution. <B>SnapDragon</B> finished
second, needing 17:38 for 825.82 points. <B>DjinnKahn</B> spent pver 22 minutes for
737.13 points and was quickly topped by <B>dgarthur</B>'s 883.14 point solution,
coded in under 15 minutes. <B>malpt</B> took 28 minutes, submitting 4 minutes
before the end of the match for 650.12 points, followed by <B>ZorbaTHut</B>'s
solution, ten minutes longer and 110 points weaker. <B>venco</B>, meanwhile,
finished up his Level Two solution, only earning 221.86 points on it. <B>Yarin</B>
was the only one to not submit all three problems.
</P>

<P>
After coding phase, <B>reid</B> had a clear lead with 1510.98 points, <B>SnapDragon</B>
falling behind by almost 100 points, followed rapidly by <B>dgarthur</B> and <B>John Dethridge</B>, either of them in a position to take 2nd place by a single
challenge. <B>ZorbaTHut</B> took the lowest place among the coders who had
completed the set, <B>Yarin</B> taking last overall.
</P>

<P>
Challenge phase would bring its set of changes, though. <B>venco</B> rapidly
challenged <B>dgarthur</B>'s Level One solution, pushing him two places up - one
place from <B>dgarthur</B>'s fall, and one place for passing <B>DjinnKahn</B>, who was
literally a single point ahead beforehand. Unfortunately for <B>dgarthur</B>, his
Level Two was flawed as well, which <B>Yarin</B> used to increase his score.
Unfortunately for <B>Yarin</B>, <B>dgarthur</B>'s Level Three alone was worth more than
both of <B>Yarin</B>'s submissions, even with the challenge included.
</P>

<P>
An unusually interesting challenge round was followed by unusually damaging
system tests. Four problems failed overall. <B>dgarthur</B>'s Level Three turned
out to be flawed as well, dropping <B>dgarthur</B> to a devastating zero total
points. <B>malpt</B>'s Level Three had a bug, known to <B>malpt</B> even before challenge
phase, as he admitted afterwards. <B>ZorbaTHut</B> and <B>DjinnKahn</B> both lost their
Level Two submissions as well.
</P>

<P>
<B>reid</B>, on the other hand, kept all his submissions, gaining 89 rating points
to become the third coder to break 3000. <B>SnapDragon</B>'s submissions survived
as well, propelling him to within 12 points of the 3000 barrier. <B>John Dethridge</B> took third, increasing his rating to 2905, while <B>venco</B>'s rating
increased 94 points, the most in the room. <B>venco</B>'s final score of 1333.20,
including his challenge, would have been sufficient to easily win any other
room.
</P>

<P>
<B>DjinnKahn</B> only finished with 1024.95 points, and while his final score was
beaten by <B>radeye</B> in room 2, he would have won any room from 3rd on. His
rating increased by 86. <B>ZorbaTHut</B>'s near-first and near-3000 dropped by 15
points, still well within reach of 3000, though not within reach of <B>reid</B>.
<B>Yarin</B> lost 20 points, and <B>malpt</B> 29. <B>dgarthur</B>, not surprisingly, lost his
maximum in one round, a painful 191 rating points.
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
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A> -->
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


