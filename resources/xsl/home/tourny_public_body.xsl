<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/srm_dates.xsl"/>
  <xsl:import href="../includes/modules/tc_updates2.xsl"/>
  <xsl:import href="../includes/modules/white_last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>
  <xsl:import href="../includes/modules/countries2.xsl"/>
  <xsl:import href="../includes/modules/intro.xsl"/>      
  <xsl:import href="../includes/modules/coder_week2.xsl"/>
  <xsl:import href="../includes/modules/top_10_coders2.xsl"/>
  <xsl:import href="../includes/modules/top_10_schools.xsl"/>
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>
  <xsl:import href="../includes/modules/arena2.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/editorials.xsl"/>    
  <xsl:import href="../includes/modules/simple_search.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template name="PublicBody">

<!-- Body Begins -->

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/><BR/>
      <!-- SRM Promo Begins -->

      <!-- SRM Promo Ends -->    
    </TD>
    <!-- Right Column Include Begins -->

    <!-- Gutter -->
    <!-- <TD WIDTH="3" ROWSPAN="2" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD> -->
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->

<!-- 
<TD WIDTH="170" ROWSPAN="2" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/> 
  <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>
  <xsl:call-template name="module_login"/> 
  <xsl:call-template name="top_10_coders"/>
  <xsl:call-template name="arena"/>
</TD> 
-->

  <!-- Right Column Ends -->

  <!-- Gutter -->

    <TD WIDTH="1" ROWSPAN="2" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->        
  </TR>    
   <TR>

<!-- Left Column Include Begins -->   

  <!-- Gutter Begins -->
    <!-- <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> -->
     <!-- Gutter Ends -->

    <!-- Left Column Begins -->

    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><!-- <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0" VSPACE="5"><BR/> -->
<xsl:call-template name="module_login"/>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="intro"/>
<xsl:call-template name="srm_dates"/>
<!-- <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/> -->
<xsl:call-template name="calendar"/>
<xsl:call-template name="countries"/>
<IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="5"/><BR/>
<!-- Do Not Delete This Line --><FONT SIZE="1" COLOR="#CCCCCC" FACE="tahoma">HiddenWord</FONT>      
      </TD>    

  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
<!-- Left Column Include Ends -->

<!-- Body Area -->

  <!-- Center Column Begins -->  
    <TD WIDTH="100%" VALIGN="top" ALIGN="center" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/><BR/> 
<!-- Invitational block -->    
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
  <TR>
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>
    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" HSPACE="6" BORDER="0"/></TD>
    <TD CLASS="bodyText" VALIGN="top" NOWRAP="0"><A HREF="/index?t=schedule&amp;c=invit02_sched"><IMG SRC="/i/invit02_logow.gif" ALT="" WIDTH="155" HEIGHT="105" HSPACE="6" ALIGN="left" BORDER="0"/></A><BR/>
<B>When:</B> October 8th - November 23rd<BR/>
<B>Where:</B> Mohegan Sun Casino in Uncasville, CT<BR/>
<B>Total Prize:</B> $150,000<BR/><BR/>
<!--
<A CLASS="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=authentication&amp;c=login</xsl:attribute>Login</A> to sign up!<BR/>
<A CLASS="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=invit02_sched</xsl:attribute>Get more details!</A><BR/>-->
    </TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" VALIGN="top" WIDTH="100%" BGCOLOR="#CCCCCC">
<!-- tourney links -->    
	<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
      <TR>
        <TD COLSPAN="3" ALIGN="center" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;INVITATIONAL FEATURES</TD>
      </TR>                    						
	  <TR>
		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" >
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_spons'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
		<A HREF="/index?t=schedule&amp;c=tourny_spons" CLASS="statTextBig">Sponsor</A></TD> -->
		<TD WIDTH="33%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='invit02_pt1'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_pt2'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rnd2'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rnd3'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rnd4'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_semi'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_champ'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/index?t=schedule&amp;c=tourney_advancers&amp;rds=4345" CLASS="statTextBig">Round Updates</A></TD>
		<TD WIDTH="33%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='invit02_sched'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/index?t=schedule&amp;c=invit02_sched" CLASS="statTextBig">Schedule</A></TD>
		<TD WIDTH="33%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='tourny_rules_overview'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_overview'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_scoring'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_conditions'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_prizes'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_onsite'">orangebv_bg</xsl:when>
			<xsl:when test="/TC/Command='invit02_rules_structure'">orangebv_bg</xsl:when>
			<xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>	
		<A HREF="/index?t=schedule&amp;c=invit02_rules_overview" CLASS="statTextBig">Rules</A></TD>
		<!-- <TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">
			<xsl:attribute name="BACKGROUND">/i/<xsl:choose><xsl:when test="/TC/Command='nopage'">orangebv_bg</xsl:when><xsl:otherwise>steel_bluebv_bg</xsl:otherwise></xsl:choose>.gif</xsl:attribute>		
		<A HREF="/TourneyReg?&amp;cd=4320&amp;rd=4320" CLASS="statTextBig">Sign Up</A></TD>	-->	
	  </TR>
    </TABLE>
<!-- tourney links end -->     
<!-- <B>Update:</B><BR/>
The assignments for the first round of the tournament are now available.  Each part lists the assigned members alphabetically by handle.<BR/><BR/> -->
<P>
<A CLASS="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=schedule&amp;c=tourney_advancers&amp;rds=4345</xsl:attribute>Click here</A> to view the advancers from Round 3 to the next round.
</P>

<P>
<B>Next Round #4</B>: Oct. 30th, at 9:30PM (<A CLASS="bodyText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/index?t=schedule&amp;c=invit02_sched</xsl:attribute>Get details</A>). Logon to view round activity.
</P>

    </TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
  <TR>
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
</TABLE>


<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
  <TR>
    <TD VALIGN="top" WIDTH="8" BGCOLOR="#666666"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" COLSPAN="2" WIDTH="100%" BGCOLOR="#666666" CLASS="bodyText" ALIGN="center" HEIGHT="21"><FONT SIZE="3" COLOR="#FFFFFF" FACE="arial, verdana, tahoma"><B>2002 SunNetwork Coding Challenge Winner is...</B></FONT>
    </TD>  
    <TD VALIGN="top" WIDTH="8" BGCOLOR="#666666"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
  </TR>
</TABLE>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">   
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>      
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText"><IMG SRC="/i/m/jonmac_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="5"/></TD>
    <TD VALIGN="top" WIDTH="40%" ALIGN="left" CLASS="bodyText"><BR/>
    Handle: <B>jonmac</B><BR/>
    Member Since: <B>03.04.01</B><BR/>
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=member_profile&amp;cr=114443</xsl:attribute>
View Profile
      </A><BR/>
    </TD>
    <TD VALIGN="middle" WIDTH="60%" CLASS="bodyText" ALIGN="center" HEIGHT="21" NOWRAP="0"><IMG SRC="/i/2002sn_chall.gif" ALT="" WIDTH="154" HEIGHT="56" BORDER="0"/><BR/>      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=2002sun_sched</xsl:attribute>
Round Updates/Schedule
      </A> | <A HREF="http://sunnetwork.sun.com/sf2002/info/features/winners.jsp" CLASS="bodyGeneric" TARGET="_blank">Full Story</A><BR/><BR/></TD> 
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>         
  </TR>
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="3" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
</TABLE>
 
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="50%" NOWRAP="0" HEIGHT="15">
<A HREF="http://sunnetwork.sun.com/" TARGET="_blank" CLASS="bodyGeneric">Learn more</A>
    </TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="50%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=2002sun_sched</xsl:attribute>
Round Updates/Schedule
      </A>
    </TD> 
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>  
</TABLE> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" WIDTH="50%" CLASS="bodyText" ALIGN="center" HEIGHT="21"><IMG SRC="/i/2002sn_sm.gif" ALT="" WIDTH="200" HEIGHT="41" BORDER="0"/></TD>
    <TD VALIGN="middle" WIDTH="50%" CLASS="bodyText" ALIGN="center" HEIGHT="21"><IMG SRC="/i/2002sn_chall.gif" ALT="" WIDTH="154" HEIGHT="56" BORDER="0"/></TD>      
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
  </TR> 
  
  <TR><TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="2" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR><TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD></TR>   
</TABLE> -->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/>

<!-- Summary/Best/Worst Begins -->         
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="184"><IMG SRC="/i/label_srm_summary.gif" ALT="Last Match Summary" WIDTH="184" HEIGHT="26" HSPACE="5" BORDER="0" ALIGN="left"/></TD>
    <TD WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="3" CLASS="bodyText"><A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute><B>2002 TopCoder Invitational Round #3</B></A><BR/>
Wednesday, October 23, 2002<BR/><BR/> 
    </TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR> 
  <TR> 
    <TD VALIGN="top" WIDTH="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="4" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="33%" NOWRAP="0" HEIGHT="15">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#leaders</xsl:attribute>
        Div. Leaders
      </A>
    </TD>
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="43%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview#problem_stats</xsl:attribute>
        Problem Stats
      </A>
    </TD> 
    <TD VALIGN="middle" ALIGN="center" BGCOLOR="#CCCCCC" WIDTH="23%" NOWRAP="0">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">/stat?&amp;c=last_match</xsl:attribute>
        Results
      </A>
    </TD>   
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>   
  </TR>  
</TABLE> 

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" CLASS="statText" WIDTH="100%">  
       <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#001935">  
          <TR>
             <TD VALIGN="middle" HEIGHT="17" ALIGN="center" COLSPAN="5" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">Best/Worst Rating Change</TD> 
          </TR>
          <TR><TD COLSPAN="5" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>          
          <xsl:for-each select="/TC/HOME/GainersAndLosers/Coder">
            <TR>
              <TD HEIGHT="14" VALIGN="middle" WIDTH="20%" CLASS="statTextBig" NOWRAP="0">&#160;&#160;&#160;<xsl:value-of select="division"/></TD>
              <TD VALIGN="middle" WIDTH="10%" CLASS="statText">&#160;&#160;<xsl:value-of select="change_type"/>:</TD> 
              <TD VALIGN="middle" WIDTH="35%" CLASS="statText" NOWRAP="0">&#160;&#160;
                <A>
                  <xsl:attribute name="HREF">stat?c=member_profile&amp;cr=<xsl:value-of select="coder_id"/></xsl:attribute>
                  <xsl:attribute name="CLASS">bodyText</xsl:attribute>
                  <FONT>
                    <xsl:attribute name="color">
                      <xsl:call-template name="GetRatingColor"><xsl:with-param name="rating"><xsl:value-of select="rating"/></xsl:with-param></xsl:call-template>
                    </xsl:attribute>
                    <xsl:value-of select="handle"/>
                  </FONT>
                </A>
              </TD>
              <TD VALIGN="middle" WIDTH="15%" CLASS="statText" ALIGN="center"><xsl:value-of select="change"/></TD>
              <TD VALIGN="middle" WIDTH="20%" CLASS="statText" NOWRAP="0">&#160;<xsl:value-of select="room_name"/></TD>
            </TR>            
          </xsl:for-each>
          <TR><TD COLSPAN="5" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>
       </TABLE>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR><TD COLSPAN="3" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>
</TABLE>
<!-- Summary/Best/Worst Ends -->

<!-- Coder Point of View Begins -->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR><TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
      <TD VALIGN="top" COLSPAN="7"><IMG SRC="/i/label_coder_view.gif" ALT="Coder's Point of View" WIDTH="148" HEIGHT="26" BORDER="0"/></TD>   
      <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText" ROWSPAN="2"><IMG SRC="/i/m/slavik_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/> 
    By&#160;slavik<BR/><I>[TC]&#160;Member</I><BR/></TD>
    <TD VALIGN="top" WIDTH="8" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText" COLSPAN="2">
    <FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>2002 TopCoder Invitational Round #3</B></FONT>
    </TD>
  </TR>      
  <TR>
    <TD VALIGN="top" CLASS="bodyText" WIDTH="100%">
	<A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=invit02_r3_prob</xsl:attribute>
        <B>Problem Set Analysis &amp; Opinion</B>
      </A><BR/>	  
<P>
The problem set for this round was a little easy for this Round of Tournament and one would expect to have a little more 
difficult set of problems at this stage. <B>ZorbaTHut</B> was a round leader with impressive 1472.93 points and 91 rating 
points gain. Problem one was just a typing skill contest and would not get you into the next round alone. Problem 
two and three were more difficult but not difficult enough for this stage. The cut off for this round was 588 
point and only people who have completed at least two problems fairly quickly would advance to the next round. 
After this round we still have 26 yellow coders who are still in the contest but most of them will be illuminated 
in the next round or they would become red. 7 red coders and all green and blue coders were illuminated during this 
round (or became yellow)...
<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=invit02_r3_prob</xsl:attribute>get&#160;analysis</A>
</P>
    </TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>     
  </TR>
  <TR><TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="7" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR><TD VALIGN="top" COLSPAN="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD></TR>   
</TABLE>
<!-- End of Point of View -->

<!-- Feature -->  
<TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="top" WIDTH="5" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" WIDTH="40%" BGCOLOR="#FFFFFF" HEIGHT="26"><IMG SRC="/i/label_feat.gif" ALT="Weekly Feature" WIDTH="184" HEIGHT="26" BORDER="0"/></TD>
    <TD WIDTH="60%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="7" ROWSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="7" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" ALIGN="center" HEIGHT="15">
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=features</xsl:attribute>
        Upcoming/Past Features
      </A>
    </TD>
    <TD VALIGN="middle" BGCOLOR="#CCCCCC" ALIGN="center"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Feature ideas?</A></TD>
  </TR>
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">   
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/>
<!-- <IMG SRC="/i/f/feat_050102_tn2.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/> -->   
<IMG SRC="/i/m/Penwiper_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/>
By&#160;Penwiper<BR/><I>[TC] Member</I><BR/></TD>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText"><BR/>
<A CLASS="bodyGeneric">
  <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=feat_100902</xsl:attribute>
  <B>Graphics Programming for Motion Capture</B></A><BR/>
<!-- <I>"If you take it slow you'll move up."</I><BR/> -->
October 9, 2002<BR/>

<P>
If you have ever played a video game, gone to a movie, or just watched a bit of television at some point in the last ten years, chances are you have already seen the end results of what motion capture (mocap) technology can help to produce. Mocap technology as we know it today probably first came into widespread use in the late 1970s and early 1980s when biomechanics labs began to use computers to analyze human motion. Throughout the late 1980s and early 1990s mocap was adopted by the film and entertainment industries, often on an experimental basis. Although they were initially designed to save time and obviate the need for hiring scores of key-frame animators, many of the early systems were difficult to use, and did not work very well. The early optical systems which required markers placed on an actor's body and multiple cameras, would often suffer from occlusion, requiring animators to painstakingly edit the captured motion data by hand...<A CLASS="bodyGeneric"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=feat_100902</xsl:attribute>full&#160;story</A></P>
<!-- <P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Have an idea for the weekly feature?</A></P> -->
  </TD>
    <TD VALIGN="top" WIDTH="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR><TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"/></TD></TR>
  <TR>
  <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  <TD VALIGN="top" BGCOLOR="#43515E" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  <TD VALIGN="top" WIDTH="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
</TABLE> 

 <!-- Coder of the Week Begins -->
   <!-- <xsl:call-template name="coder_week"/> -->
<!-- Coder of the Week Ends -->
<xsl:call-template name="tc_updates"/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR><TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR><TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>   
</TABLE>
<xsl:call-template name="arena"/> 
<!-- TC special promo --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
  <TR><TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD></TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="26" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText"><FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Sponsorships</B></FONT><BR/>TopCoder offers sponsorship programs for the weekly 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>
        Single Round Matches
      </A> as well as for 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>Tournaments</A>. Read more about our 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_target</xsl:attribute>sponsorship programs</A>.<BR/></TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText"><FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Employment Services</B></FONT><BR/>TopCoder works with companies to connect them with top-rated developers. Read more about our 
      <A CLASS="bodyGeneric">
        <xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>employment services</A>.<BR/></TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD></TR>
  <TR><TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
</TABLE> 
    </TD>
  <!-- Center Column Ends -->    
    <TD BGCOLOR="#001935" VALIGN="top" CLASS="statText" WIDTH="244"><IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/><BR/>

<A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=google</xsl:attribute></A>  
<IMG USEMAP="#google_home" SRC="/i/es/google/google_home.gif" alt="" width="244" height="160" border="0"/>  
  <BR/>
<map name="google_home">
<area alt="" shape="poly" coords="229,104,120,105,105,94,11,95,10,120,36,146,229,148" href="/stat?c=round_stats&amp;rd=4340"/>
<!-- <area alt="" shape="poly" coords="229,104,120,105,105,94,11,95,10,120,36,146,229,148" href="/stat?&amp;c=last_match"/>
<area alt="" shape="poly" coords="229,104,120,105,105,94,11,95,10,120,36,146,229,148" href="/?ContestId=4340&amp;t=schedule&amp;c=srm"/> -->
<area alt="" shape="poly" coords="225,88,124,89,106,77,8,77,9,31,230,30" href="/?&amp;t=tces&amp;c=google"/>
</map>
<A HREF="/?&amp;t=news_events&amp;c=pr_10_22_02">
<IMG SRC="/i/tces_quote.gif" ALT="TCES" WIDTH="244" HEIGHT="156" VSPACE="10" BORDER="0"/></A>
<!-- <A><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>
<IMG SRC="/i/tces_promo.gif" alt="" width="244" height="77" border="0"/></A><BR/> -->

<!-- <A HREF="/?&amp;t=schedule&amp;c=oraclesurv_rules">
<IMG SRC="/i/oraclesurv_promo.gif" ALT="Oracle Code Survivor" WIDTH="244" HEIGHT="156" VSPACE="5" BORDER="0"/></A> -->

<!-- <A HREF="http://sunnetwork.sun.com" TARGET="_blank"><IMG SRC="/i/tournament/2002sunnetwork_button.gif" alt="" width="244" height="79" border="0"/></A><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
    <TD class="statText" WIDTH="100%" ALIGN="right"><A HREF="http://sunnetwork.sun.com/sf2002/reg/general/index.en.jsp" TARGET="_blank" CLASS="statText"><B>Register for the conference</B> &gt;</A></TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
    <TD class="statText" WIDTH="100%" ALIGN="right"><A HREF="http://sunnetwork.sun.com/" TARGET="_blank" CLASS="statText">Learn more &gt;</A></TD>    
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                              
</TABLE>
<A HREF="http://sunnetwork.sun.com/sf2002/reg/general/index.en.jsp" TARGET="_blank" CLASS="statText"><IMG SRC="/i/tournament/2002sunnetwork_chall.gif" alt="" width="244" height="56" border="0"/></A><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD class="statText" WIDTH="100%" ALIGN="right"><A class="statText"><xsl:attribute name="HREF">http://sunnetwork.sun.com/sf2002/topcoder/index.jsp</xsl:attribute>For more information and official rules and regulations&gt;</A></TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                               
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
  <TR> 
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="3" HEIGHT="1" BORDER="0"/></TD>
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>      
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD class="statText" WIDTH="100%"><B>Note:</B><BR/>Contestants must be a <A HREF="/reg/index.jsp" CLASS="statText"></A>TopCoder member and a registered attendee of the SunNetwork<sup>sm</sup> Conference 
in order to participate in the SunNetwork<sup>sm</sup> Coding Challenge.</TD>
    <TD><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD> 
    <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>                 
  </TR>                               
</TABLE>
<IMG SRC="/i/tournament/2002sunnetwork_btm.gif" alt="" width="244" height="34" border="0"/><BR/> -->

    <TABLE WIDTH="100%" BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" BGCOLOR="#001935">
      <TR> 
        <TD VALIGN="middle" BGCOLOR="#001935" HEIGHT="18" CLASS="moduleTitle"><IMG SRC="/i/module_labels_10_coders.gif" ALT="Top 10 Coders" WIDTH="166" HEIGHT="17" BORDER="0"/></TD>
      </TR>
       <TR> 
        <TD BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
      </TR>
       <TR> 
        <TD BGCOLOR="#001935"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
      </TR>      
    </TABLE>
<xsl:call-template name="top_10_schools"/>
<xsl:call-template name="top_10_coders"/>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR><TD COLSPAN="3" BGCOLOR="#001935"><IMG SRC="/i/label_quick_stats_home.gif" ALT="Quick Stats" WIDTH="166" HEIGHT="17" BORDER="0"/></TD></TR>
  <TR><TD BGCOLOR="#FFFFFF" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                
  <TR>
    <TD ROWSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
    <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
    <TD ROWSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
  </TR>              
  <TR><TD CLASS="statText" VALIGN="top">Select a Quick Stat from the menu below.</TD></TR>
  <TR><TD CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                              
  <TR><TD CLASS="quickstatText" VALIGN="top">
  <!-- Quick Stat Pulldown Begins --> 
       <xsl:call-template name="quick_stats_pulldown"/>
  <!-- Quick Stat Pulldown Ends -->
  <!-- Quick Stat Pulldown Begins --> 
  <!-- <xsl:call-template name="quick_stats_tidbit"/> -->
  <!-- Quick Stat Pulldown Ends -->
  </TD>
  </TR>               
</TABLE><BR/>
<!-- <A HREF="/?&amp;t=schedule&amp;c=2002sun_sched">
<IMG SRC="/i/2002sn_winner.gif" ALT="SunNetwork Coding Challenge" WIDTH="244" HEIGHT="156" VSPACE="5" BORDER="0"/></A> -->
<A HREF="/stat?c=member_profile&amp;cr=296745">
<IMG SRC="/i/codermonth_sept.gif" ALT="Coder of the Month" WIDTH="244" HEIGHT="156" VSPACE="10" BORDER="0"/></A>
</TD>
<!-- <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD> -->
<!-- Body Area Ends -->
</TR>   
</TABLE>

  </xsl:template>
</xsl:stylesheet>

