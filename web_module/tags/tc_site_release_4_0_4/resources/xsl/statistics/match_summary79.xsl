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
              <TD VALIGN="middle" HEIGHT="13" CLASS="bodyText"><A HREF="/?RoundId=4125&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 80<!-- 2002 TCCC Regional Championships --></A></TD>            
              <TD VALIGN="middle" CLASS="bodyText">Monday, April 15</TD>
              <TD VALIGN="middle" CLASS="bodyText">9:00pm EST</TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 79 - April 10, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
Let's take a look at three rooms where the biggest upsets took place in Division-I.  These are the rooms where the 
10th seeded coder in the room was the winner. 
</P>

<P>
<A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">Logan</A> was the winner in Room 3 with 1357.58 final points.  <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">Logan</A> earned 275.90 points on the Level One problem, 
367.53 on the Level Two problem, and 664.15 on the Level Three problem for 1307.58 points during the "Coding Phase".  
During the "Challenge Phase", <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">Logan</A> added 50 points with a successful challenge of the Level Three submission of <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">Echo</A>.  
<A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">Logan</A> gained 168 rating points, and if this contest were held today, would be the third ranked coder in the room.  <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">Logan</A> 
is one of the 16 finalists in the 2002 Collegiate Challenge. 
</P>

<P>
In Room 14, <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">eduar09</A> was victorious with 1356.25 final points, all of which were earned in the "Coding Phase".  
That impressive performance added 327 points to the rating of <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">eduar09</A>, which is the fourth highest Rating Point Gain in 
Division-I (<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="bodyGeneric">View the list of Division-I Rating Point Gain</A>).
  <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">eduar09</A> won the room by 818.86 points, which was the biggest blow-out in the division. 
</P>

<P>
In a close battle in Room 19, <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">danwyand</A> outpaced <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">krave</A> by 4.13 points, 305.28 to 301.15.  <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">danwyand</A> earned 709.54 
points in the "Coding Phase" by submitting code for the Level One and Three problems, and added 50 to that total 
with a successful challenge of the Level Three submission of <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">cem1834</A>.  The Level Three submission of <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=1" CLASS="bodyGeneric">danwyand</A> ended 
up failing the system test, however, resulting in the lower final point total.
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
The top-point total in Division-II was earned by <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">cd21</A> in Room 30 with 1385.81 final points.  <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">cd21</A> earned 291.99 points 
on the Level One problem, 414.81 on the Level Two problem, and 629.01 on the Level Three problem for a total of 1335.81
 points in the "Coding Phase".  <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">cd21</A> added 50 points to that total with a successful challenge of the Level Three submission
  of <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">lekien</A>. 
</P>

<P>
The closest battle in Division-II took place in the Room 38, where <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">Mega</A> edged <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">MaxPower</A> by 1.67 points, 670.14 to 668.47.  
<A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">Mega</A> earned all 670.14 points during the "Coding Phase" by successfully coding the Level One and Two problems, while <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">MaxPower</A> 
earned 568.47 points in the "Coding Phase" by also successfully coding the Level One and Two problems.  <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">MaxPower</A> then added 
100 in the "Challenge Phase" with two successful challenges. 
</P>

<P>
<A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">mmsa</A> was the highest scoring first-time coder, winning Room 61 with 824.11 final points.  During the "Coding Phase", <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">mmsa</A> 
successfully coded the Level One and Two problems for 674.11 points.  That total placed <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">mmsa</A> fourth.  <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">mmsa</A> attempted five 
challenges in the "Challenge Phase" four of which were successful, giving <A HREF="/stat?c=last_match&amp;rd=4120&amp;dn=2" CLASS="bodyGeneric">mmsa</A> 150 additional points, which were enough 
for the come-from-behind room win.
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


