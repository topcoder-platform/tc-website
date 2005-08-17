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
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
	    <TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
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
<P><B>Single Round Match 93</B><BR/>
May 30, 2002</P>
<P><B>Rookie Review</B></P>


<P>
    <b>Coding Phase</b>
</P>

  <p>
            For the most part, each rookie room was dominated by a single coder.
            This was most prevalent during the Coding phase.
        </p>
  <p>
        At the end of the Coding Phase, the scores were:
    </p>
  
<UL>
	<LI>Room 65:</LI>
	     <OL>
	       <LI><B>hoover_jon</B> - 1084.01</LI>
         </OL>
	<LI>Room 66:</LI>
	     <OL>
	       <LI><B>kot</B> - 1440.85</LI>
         </OL>
	<LI>Room 67:</LI>
	     <OL>
	       <LI><B>along</B> - 1165.00</LI>
         </OL>
	<LI>Room 68:</LI>
	     <OL>
	       <LI><B>Mike2000</B> - 855.51</LI>
         </OL>
	<LI>Room 69:</LI>
	     <OL>
	       <LI><B>mandersen</B> - 548.03</LI>
           <LI><B>snaff12</B> - 424.05</LI>
         </OL>
</UL>

<P>
    <b>Challenge Phase</b>
</P>

  <p>
            In Room 66, <b>kot</b> had a busy Challenge Phase.
            First, <b>kot</b> lost his Level 3 problem to a challenge by <b>yatta5000</b>.
            The reason for this is that <b>kot</b>'s Level 3 submission was simply returned a random
            number.  <b>kot</b> then proceeded to submit 4 challenges of his own.
        </p>
  <p>
            The first, against <b>gdennis</b>'s flawed Level 1 submission, failed, losing <b>kot</b>
            an additional 50 points.  <b>gdennis</b>'s solution failed to compute the rounded mean properly,
            but <b>kot</b>'s test case failed to exploit that.  <b>kot</b>'s next challenge was
            against <b>Saeven</b>'s Level 2 problem, and was successful.  <b>Saevon</b> didn't bother
            to compute the mean at all.  <b>kot</b> also successfully challenged <b>yatta5000</b>'s
            Level 1 problem, perhaps in retaliation for <b>yatta5000</b>'s earlier challenge, but then
            unsuccessfully challenged <b>Saeven</b>'s Level 2 submission.
            All of <b>kot</b>'s challenges balanced out to 0 points for him, but the unsucessful defense of
            his Level 3 problem lost him 855.28 points.
        </p>
  <p>
            The most masterful rookie performance of the night was by <b>along</b> in Room 67,
            who accumulated three successful challenges.
            <b>along</b> successfully challenged <b>vietchau</b>'s Level 1 submission (incorrect mean calculation),
            <b>samosa</b>'s Level 1 submission (same mistake),
            and <b>kidprogram</b>'s Level 2 submission.
            This gave <b>along</b> 150 points and a commanding lead.
        </p>
  <p>
            In Room 68, <b>Mike2000</b> lost both of his submissions to challenges, giving the lead up to
            <b>diffusion_84</b>.  In Room 69, <b>manderson</b> gained 50 points from
            <b>tdrapeau</b>'s Level 1 problem (which returned a mean instead of a median).
        </p>
  <p>
        At the end of the Challenge Phase, the scores were:
    </p>
  <ul>
            Room 65:
            <ol>
      <li><b>hoover_jon</b> - 1084.01</li>
    </ol>
            Room 66:
            <ol>
      <li><b>kot</b> - 585.57</li>
    </ol>
            Room 67:
            <ol>
      <li><b>along</b> - 1315.00</li>
    </ol>
            Room 68:
            <ol>
      <li><b>jonderry</b> - 505.43</li>
      <li><b>Mike2000</b> - 427.85</li>
      <li><b>diffusion_84</b> - 423.34</li>
    </ol>
            Room 69:
            <ol>
      <li><b>mandersen</b> - 598.03</li>
      <li><b>snaff12</b> - 424.05</li>
    </ol>
  </ul>

<P>
    <b>System Test Phase</b>
</P>

  <p>
            The System Phase resulted in quite a lot of movement in rookie ranks.
            In Room 65, <b>hoover_jon</b> lost his Level 3 problem, but due to his other two submissions
            was barely able to hold onto the room lead.
            In Room 68, <b>jonderry</b> lost his Level 2 submission and <b>Mike2000</b> lost his Level 1 submission,
            giving the room lead to <b>diffusion_84</b> who had previously been in third place.
            In Room 69, <b>mandersen</b> and <b>snaff12</b> each lost his Level 2 problem, leaving them with the same rankings as before.
        </p>
  <b>Final Results</b>
  <ul>
            Room 65:
            <ol>
      <li><b>hoover_jon</b> - 546.66</li>
    </ol>
            Room 66:
            <ol>
      <li><b>kot</b> - 585.57</li>
    </ol>
            Room 67:
            <ol>
      <li><b>along</b> - 1315.00</li>
    </ol>
            Room 68:
            <ol>
      <li><b>diffusion_84</b> - 423.34</li>
    </ol>
            Room 69:
            <ol>
      <li><b>mandersen</b> - 369.71</li>
    </ol>
  </ul>
  <p>
                Congratulations to <b>along</b>, whose very impressive score dwarfed that of any of the other rookies.
                This gives <b>along</b> a nice yellow rating of 1832, the sixteenth highest debut ever.
                </p>


<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
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
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A> -->
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_rookie','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<BR/>
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


