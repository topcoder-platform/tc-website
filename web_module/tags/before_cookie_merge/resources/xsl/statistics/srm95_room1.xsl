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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm95_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm95_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm95_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm95_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
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
<P><B>Single Round Match 95</B><BR/>
June 5, 2002</P>
<P><B>Room 1 Review</B></P>

<P>
Room One started with the normal flurry of Level One openings, 
<A HREF="/stat?c=member_profile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>
ignoring his usual Level Two start to join the rest of the pack. 
<A HREF="/stat?c=member_profile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A>,
<A HREF="/stat?c=member_profile&amp;cr=157974" CLASS="bodyGeneric">bigg_nate</A>, 
and <A HREF="/stat?c=member_profile&amp;cr=120816" CLASS="bodyGeneric">malpt</A>
 raced to be the first, all opening in under five
seconds. <A HREF="/stat?c=member_profile&amp;cr=153902" CLASS="bodyGeneric">evd</A>
 and <A HREF="/stat?c=member_profile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>
 both opened after about thirty seconds, while <A HREF="/stat?c=member_profile&amp;cr=154754" CLASS="bodyGeneric">kv</A>
waited more than seventy seconds and <A HREF="/stat?c=member_profile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A>
 taking nearly four
minutes just to open the first problem.
</P>

<P>
Only five minutes after the start of the match <B>ZorbaTHut</B> submitted his 300pt
solution, for 290.73 points, the highest in the room. <B>evd</B> followed a minute
later, earning 287.79 points, closely followed by <B>bigg_nate</B>. <B>kv</B> spent seven
minutes on the solution for 283.75 points, followed soon after by <B>malpt</B>.
<B>John Dethridge</B> and <B>dmwright</B> submitted at the nine-and-a-half-minute mark,
<B>dmwright</B> taking over nine minutes to earn 272.52 points. However, due to his
late start, <B>John Dethridge</B> got the second highest score in the room on the
Level One problem, spending only 5:45 for 288.32 points.
</P>

<P>
Each coder moved on to the Level Two in sequence, joining <B>ZorbaTHut</B>, who
submitted after only seven minutes of work, earning 353.68 points, the
highest score in the room for the 375pt as well. <B>bigg_nate</B> submitted second,
getting 328.12 points for eleven minutes of work, followed seconds after by
<B>kv</B>, only taking nine and a half minutes due to his late start and slightly
slower 300pt. <B>John Dethridge</B> took second in the room on the Level Two as
well, finishing after 8:16 for 346.53 points. <B>dmwright</B> spent over twenty
minutes on the problem, amd <B>evd</B> took almost 25 minutes, for only 237.95
points.
</P>

<P>
It became clear very quickly who knew how to solve the 1100. <B>kv</B> submitted
first after less than 20 minutes of work, getting a whopping 782.64 points,
beaten a minute later by <B>John Dethridge</B>'s 16-minute submission for 857.85
points. <B>malpt</B> took 18 minutes, and <B>dmwright</B> spent almost 29 minutes, but
despite <B>ZorbaTHut</B> opening it with more than an hour left, it took him over
50 minutes to finally figure out the solution, submitting for only 460.58
points, in fifth place.
</P>

<P>
However, looking over his problems, <B>malpt</B> found a bug in his 375pt solution,
and was forced to resubmit. At this point the problem had been open for over
47 minutes, and combined with the resubmission penalty, this brought his
score down to 127.82 points for that problem. This was followed soon after
by another bug, in his 300pt this time, and the open-time of almost an hour
combined with the penalty downed his score to a devastating 90 points flat,
dropping him behind <B>ZorbaTHut</B>.
</P>

<P>
At the end of the coding phase <B>John Dethridge</B> was leading with 1492.70
points, followed by <B>kv</B> with 1405.30 points, <B>dmwright</B> with 1177.11 points,
ZorbaHut trailing with 1104.89 points, and <B>malpt</B> taking <B>ZorbaTHut</B>'s old
place with only 1035.56 points. <B>bigg_nate</B> and <B>evd</B> didn't submit solutions to
the Level Three, and were left with 613.83 and 525.73 points respectively.
</P>

<P>
Challenge phase, unlike usual in Room One, produced quite a few changes.
<B>dmwright</B> challenged <B>kv</B>'s Level Two submission successfully, dropping <B>kv</B> down
between <B>malpt</B> and <B>ZorbaTHut</B>. <B>John Dethridge</B> took out <B>evd</B>'s Level One
problem, which served no purpose other than to increase <B>John Dethridge</B>'s now
enormous lead even more and to drop <B>evd</B>'s last place even further down.
<B>malpt</B>, now in 5th place, attempted to challenge <B>ZorbaTHut</B>'s Level Three
problem. If successful, <B>malpt</B> would have vaulted over <B>kv</B>, and combined with
<B>ZorbaTHut</B>'s drop, would have landed him in 3rd place. However, the challenge
was a failure, and <B>malpt</B> dropped back further.
</P>

<P>
After challenge phase <B>John Dethridge</B> was far in the lead of anyone else,
<B>dmwright</B> over 300 points behind, with <B>ZorbaTHut</B> clinging to third place 400
points behind, less than 50 points ahead of <B>kv</B>.
</P>

<P>
System test kept this positioning - every problem left after challenge phase
passed perfectly.
</P>

<P>
<B>John Dethridge</B> gained 98 rating points from his impressive showing.
<B>dmwright</B>, the highest-ranked coder registered for SRM 95, increased his
rating by 46. <B>ZorbaTHut</B>, the second highest-ranked coder, only gained 17.
<B>malpt</B> did exactly as expected and his rating remained the same, while
<B>bigg_nate</B>'s only dropped by 4 points. <B>evd</B>, unfortunately, lost 143 points
with only a surviving 375pt submission.
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


