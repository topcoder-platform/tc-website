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
				<TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4190&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 94</A></TD>						
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4190&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Monday, June 3</A></TD>
				<TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4190&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">7:30pm EDT (registration)</A></TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 93 - May 30, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="bodyGeneric">View the list of Division-I Rating Point Gains</A>
<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="bodyGeneric">View the list of Division-II Rating Point Gains</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="bodyGeneric">View the list of Winning Debuts</A> 
<A HREF="/stat?c=all_time_wins" CLASS="bodyGeneric">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="bodyGeneric">View the list of Winning Debuts</A>
<A HREF="/stat?&amp;c=highest_totals&amp;dn=2" CLASS="bodyGeneric">View the list of Division-II Point Totals</A>
<A HREF="/stat?c=impressive_debuts" CLASS="bodyGeneric">View the list of Impressive Debuts</A>
<A HREF="/stat?c=last_match&amp;rd=4115&amp;dn=1" CLASS="bodyGeneric">dmwright</A>
-->

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=251335" CLASS="bodyGeneric">Echo</A>
 won Room 2 by 1.12 points over 
<A HREF="/tc?module=MemberProfile&amp;cr=158067" CLASS="bodyGeneric">KurtSteinkraus</A>, 689.93 to 688.81.  
<B>Echo</B> earned 271.38 points on the Level One problem and 418.55 on the 
Level Three problem.  <B>KurtSteinkraus</B> earned 262.60 points on the Level 
One problem and 426.21 on the Level Two problem.  In a strange 
occurrence, both coders added 82 rating points. 
</P>

<P>
In Room 10, <A HREF="/tc?module=MemberProfile&amp;cr=153724" CLASS="bodyGeneric">Vaduz</A>
 used a successful challenge for a come-from-behind 
474.71-473.65 win over <A HREF="/tc?module=MemberProfile&amp;cr=104810" CLASS="bodyGeneric">marmaros</A>.  
That's a difference of just 1.06 points.  
<B>Vaduz</B> earned 177.55 points on the Level One problem, and 247.16 on the Level 
Two problem, for 424.71 total points in the "Coding Phase".  That point total 
placed him seventh in the room.  <B>Vaduz</B> then added 50 points in the "Challenge Phase" 
with a successful challenge of the Level One submission of 
<A HREF="/tc?module=MemberProfile&amp;cr=282125" CLASS="bodyGeneric">markan</A>.  
<B>marmaros</B> earned 221.87 points on the Level One problem and 251.78 points 
on the Level Two problem. 
</P>

<P>
A similar situation took place in Room 26, where 
<A HREF="/tc?module=MemberProfile&amp;cr=159758" CLASS="bodyGeneric">[ucf]entity</A> used a 
challenge for a close come-from-behind win over pozdol, 450.77-449.31.  
That's a difference of just 1.46 points.  <B>[ucf]entity</B> earned 165.53 
points on the Level One problem and 235.24 on the Level Two problem, 
for a total of 400.77 points after the "Coding Phase".  That total 
placed him fourth in the room.  During the "Challenge Phase", 
<B>[ucf]entity</B> added 100 points with successful challenges of the 
Level One submissions of <A HREF="/tc?module=MemberProfile&amp;cr=154074" CLASS="bodyGeneric">dimer0</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=150336" CLASS="bodyGeneric">trieuvan</A>, but then lost 50 
with an unsuccessful challenge of the Level One submission of 
<A HREF="/tc?module=MemberProfile&amp;cr=265918" CLASS="bodyGeneric">jonboy</A>.
</P>

                 </TD>
            </TR>             
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>        
            <TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II</TD></TR>
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P>
<A HREF="/tc?module=MemberProfile&amp;cr=273416" CLASS="bodyGeneric">xxfobxx</A>
 used two successful challenges for a come-from-behind win in Room 37.  
<B>xxfobxx</B> coded the Level One and Two problems for 542.17 points in the "Coding Phase".  
That total placed him fourth in the room.  In the "Challenge Phase", <B>xxfobxx</B> successfully 
challenged the Level Two submission of <A HREF="/tc?module=MemberProfile&amp;cr=273030" CLASS="bodyGeneric">pewloo</A>
 and the Level One submission of <A HREF="/tc?module=MemberProfile&amp;cr=270256" CLASS="bodyGeneric">mannix</A>. 
</P>

<P>
The largest rating point gain and loss in the division for the match were earned in Room 48.  
<A HREF="/tc?module=MemberProfile&amp;cr=281252" CLASS="bodyGeneric">dilipdalton</A>
 added 189 points after winning the room with 548.87 final points.  
He earned 498.87 points in the "Coding Phase", and 50 in the "Challenge Phase".  
<A HREF="/tc?module=MemberProfile&amp;cr=270914" CLASS="bodyGeneric">mercury_m</A>
 lost 444 rating points after finishing last in the room.  
<B>mercury_m</B> earned 150.54 points in the "Coding Phase", but lost 150 points 
with three unsuccessful challenges, and then lost the 150.54 points he earned 
on his submission when it failed the system test.  <B>mercury_m</B> finished with -150.00 points. 
</P>

<P>
First-time coder <A HREF="/tc?module=MemberProfile&amp;cr=251223" CLASS="bodyGeneric">along</A>
 earned the highest point total in the division with 
1315.00 final points.  That was enough to win Room 67.  That point total 
earned him a rating debut of 1832, which is the 16th highest ever.  <B>along</B> 
earned 1165.00 points in the "Coding Phase" after coding all three problems.  
He then added 150 points in the "Challenge Phase" with three successful challenges.
</P>


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
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm92"><IMG SRC="/i/motorola_sidebar.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A> -->
<A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=match_summary','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
    
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


