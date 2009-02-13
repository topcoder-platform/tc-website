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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm94_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm94_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm94_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <!-- <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR> -->
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 94</B><BR/>
June 3, 2002</P>
<P><B>Room 1 Review</B></P>

<p>Room 1 started out with
<B>SnapDragon</B>, <B>derkuci</B>, <B>DjinnKahn</B>, <B>kv</B>, <B>evd</B>, <B>ZorbaTHut</B>, and <B>bigg_nate</B> opening the
level 1 problem, <B>dmwright</B> going for his usual level 2 start, and <B>John Dethridge</B>, starting 4 minutes later, opening the level 1. <B>SnapDragon</B> Submitted
the level one problem just 6 minutes and 18 seconds after opening it, the
fastest in the division, for 333.78 points, and moved on to the level 2. <B>evd</B>
was the next to submit, gaining 314.42 points for 9 minutes of coding, but <B>John Dethridge</B> 
came in next, and since he started 4 minutes into the competition, he
gains 322.28 points. <B>SnapDragon</B> again was the first to submit the Level two for
397.04 points -- having both his level 1 AND 2 complete before <B>dmwright</B>
finishes the level 2. Finally, <B>dmwright</B> submits, just 3 minutes later, for
333.40 points. For the level three, <B>SnapDragon</B> submits just over 35 minutes
into the competition, giving him a division high of 1514.88 points, over 200
points above anyone else in division 1 going into the challenge phase. The next
room 1 finisher was <B>bigg_nate</B>, who finished over an hour after opening his
first problem. Before the challenge, the points looked like this:</p>

<table border="0" cellpadding="0" cellspacing="2" bgcolor="#ffffff" width="100%">
 <tr>
  <td class="bodyText">
  <b>handle </b>
  </td>
  <td class="bodyText">
  <b>Level 1 </b>
  </td>
  <td class="bodyText">
  <b>Level 2 </b>
  </td>
  <td class="bodyText">
  <b>Level 3 </b>
  </td>
  <td class="bodyText">
  <b>Total</b>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>SnapDragon</B></p>
  </td>
  <td class="bodyText">
  <p>333.78</p>
  </td>
  <td class="bodyText">
  <p>397.04</p>
  </td>
  <td class="bodyText">
  <p>784.06</p>
  </td>
  <td class="bodyText">
  <p>1514.88</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>bigg_nate</B></p>
  </td>
  <td class="bodyText">
  <p>278.77</p>
  </td>
  <td class="bodyText">
  <p>311.33</p>
  </td>
  <td class="bodyText">
  <p>650.77</p>
  </td>
  <td class="bodyText">
  <p>1240.87</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>dmwright</B></p>
  </td>
  <td class="bodyText">
  <p>301.57</p>
  </td>
  <td class="bodyText">
  <p>333.40</p>
  </td>
  <td class="bodyText">
  <p>548.38</p>
  </td>
  <td class="bodyText">
  <p>1183.35</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>evd</B></p>
  </td>
  <td class="bodyText">
  <p>314.42</p>
  </td>
  <td class="bodyText">
  <p>362.48</p>
  </td>
  <td class="bodyText">
  <p>492.24</p>
  </td>
  <td class="bodyText">
  <p>1169.14</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>ZorbaTHut</B></p>
  </td>
  <td class="bodyText">
  <p>252.26</p>
  </td>
  <td class="bodyText">
  <p>378.43</p>
  </td>
  <td class="bodyText">
  <p>509.34</p>
  </td>
  <td class="bodyText">
  <p>1140.03</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>kv</B></p>
  </td>
  <td class="bodyText">
  <p>252.50</p>
  </td>
  <td class="bodyText">
  <p>347.23</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>599.73</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>derkuci</B></p>
  </td>
  <td class="bodyText">
  <p>271.95</p>
  </td>
  <td class="bodyText">
  <p>279.90</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>551.85</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>DjinnKahn</B></p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>367.09</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>367.09</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>John Dethridge</B></p>
  </td>
  <td class="bodyText">
  <p>322.28</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>322.28</p>
  </td>
 </tr>
</table>

<p>
The challenge phase brought two challenges. One from <B>derkuci</B> trying for a
timeout on <B>ZorbaTHut</B>'s Counter solution, and one from <B>kv</B> on <B>bigg_nate</B>'s
SquareFind solution, submitting a parallelogram that was not square. Neither
challenge succeeded.<br/>
<br/>
In the testing phase, one solution of each problem failed. <B>evd</B>'s level 3 failed
with a timeout, dropping him below <B>ZorbaTHut</B>. <B>kv</B>'s SquareFind failed due to his
assumption that the input array would always have at least 4 elements in it.
Finally, in <B>DjinnKahn</B>'s NumberFill solution, he forgot to check for the case
that an area had no numbers in it.<br/>
<br/>
<B>SnapDragon</B> takes the win with 1514.88 points, giving him 92 rating points for
his highest ever 3005 rating, and making him the number 1 rated coder at
TopCoder, moving past both NDBronson and reid. For second place, <B>bigg_nate</B> gets
92 rating points. <B>ZorbaTHut</B> gains 39 points, but it's not enough to stop
<B>dmwright</B>'s 55-point gain from knocking him out of 4th place, just 11 points
ahead. <B>DjinnKahn</B> loses 177 rating points, and <B>John Dethridge</B> loses 100 rating
points.<br/>
<br/>
Here is the room 1 log:<br/>
9:00:03 PM - <B>SnapDragon</B> opens the Level One problem <br/>
9:00:07 PM - <B>derkuci</B> opens the Level One problem <br/>
9:00:10 PM - <B>DjinnKahn</B> opens the Level One problem <br/>
9:00:41 PM - <B>kv</B> opens the Level One problem <br/>
9:00:46 PM - <B>evd</B> opens the Level One problem <br/>
9:00:51 PM - <B>ZorbaTHut</B> opens the Level One problem <br/>
9:01:35 PM - <B>bigg_nate</B> opens the Level One problem <br/>
9:02:12 PM - <B>dmwright</B> opens the Level Two problem <br/>
9:03:51 PM - <B>John Dethridge</B> opens the Level One problem <br/>
9:06:22 PM - <B>SnapDragon</B> submits the Level One problem for 333.78 points <br/>
9:06:29 PM - <B>SnapDragon</B> opens the Level Two problem <br/>
9:10:32 PM - <B>evd</B> submits the Level One problem for 314.42 points <br/>
9:10:41 PM - <B>evd</B> opens the Level Two problem <br/>
9:12:19 PM - <B>John Dethridge</B> submits the Level One problem for 322.28 points <br/>
9:14:07 PM - <B>John Dethridge</B> opens the Level Three problem <br/>
9:16:20 PM - <B>derkuci</B> submits the Level One problem for 271.95 points <br/>
9:16:46 PM - <B>bigg_nate</B> submits the Level One problem for 278.77 points <br/>
9:17:03 PM - <B>bigg_nate</B> opens the Level Two problem <br/>
9:17:09 PM - <B>SnapDragon</B> submits the Level Two problem for 397.04 points <br/>
9:17:22 PM - <B>SnapDragon</B> opens the Level Three problem <br/>
9:17:33 PM - <B>derkuci</B> opens the Level Two problem <br/>
9:19:58 PM - <B>kv</B> submits the Level One problem for 252.50 points <br/>
9:20:07 PM - <B>kv</B> opens the Level Two problem <br/>
9:20:10 PM - <B>ZorbaTHut</B> submits the Level One problem for 252.26 points <br/>
9:20:17 PM - <B>ZorbaTHut</B> opens the Level Two problem <br/>
9:20:23 PM - <B>dmwright</B> submits the Level Two problem for 333.40 points <br/>
9:20:54 PM - <B>dmwright</B> opens the Level Three problem <br/>
9:25:24 PM - <B>evd</B> submits the Level Two problem for 362.48 points <br/>
9:25:35 PM - <B>evd</B> opens the Level Three problem <br/>
9:27:31 PM - <B>DjinnKahn</B> opens the Level Two problem <br/>
9:33:09 PM - <B>ZorbaTHut</B> submits the Level Two problem for 378.43 points <br/>
9:33:13 PM - <B>ZorbaTHut</B> opens the Level Three problem <br/>
9:35:14 PM - <B>SnapDragon</B> submits the Level Three problem for 784.06 points <br/>
9:36:37 PM - <B>kv</B> submits the Level Two problem for 347.23 points <br/>
9:36:48 PM - <B>kv</B> opens the Level Three problem <br/>
9:38:05 PM - <B>bigg_nate</B> submits the Level Two problem for 311.33 points <br/>
9:38:16 PM - <B>bigg_nate</B> opens the Level Three problem <br/>
9:41:42 PM - <B>DjinnKahn</B> submits the Level Two problem for 367.09 points <br/>
9:42:02 PM - <B>DjinnKahn</B> opens the Level Three problem <br/>
9:43:15 PM - <B>derkuci</B> submits the Level Two problem for 279.90 points <br/>
9:44:16 PM - <B>derkuci</B> opens the Level Three problem <br/>
9:55:40 PM - <B>dmwright</B> submits the Level Three problem for 548.38 points <br/>
9:55:48 PM - <B>dmwright</B> opens the Level One problem <br/>
10:04:08 PM - <B>bigg_nate</B> submits the Level Three problem for 650.77 points <br/>
10:07:34 PM - <B>dmwright</B> submits the Level One problem for 301.57 points <br/>
10:07:40 PM - <B>evd</B> submits the Level Three problem for 492.24 points <br/>
10:12:46 PM - <B>ZorbaTHut</B> submits the Level Three problem for 509.34 points <br/>
10:15:35 PM - <B>John Dethridge</B> opens the Level Two problem <br/>
10:26:27 PM - <B>kv</B> challenges <B>bigg_nate</B> on the Level One problem Unsuccessfully <br/>
10:32:34 PM - <B>derkuci</B> challenges <B>ZorbaTHut</B> on the Level Three problem
Unsuccessfully</p>
  
<IMG SRC="/i/m/schveiguy_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;schveiguy<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=273217" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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


