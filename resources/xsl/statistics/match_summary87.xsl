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
            <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4160&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Single Round Match 88</A></TD>                  
            <TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4160&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">Wednesday, May 15</A></TD>
            <TD VALIGN="middle" CLASS="bodyGeneric"><A HREF="/?RoundId=4160&amp;t=schedule&amp;c=srm" CLASS="bodyGeneric">7:30pm EDT (registration)</A></TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 87 - May 9, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
In Room 3, <A HREF="/tc?module=MemberProfile&amp;cr=159177" CLASS="bodyGeneric">wybili</A>, 
the lowest ranked coder in the room, pulled off a big upset, 
and won a close battle over <A HREF="/tc?module=MemberProfile&amp;cr=158067" CLASS="bodyGeneric">KurtSteinkraus</A>,
 1325.33 to 1310.91.  <B>wybili</B> earned 
280.12 on the Level One problem, 354.49 on the Level Two problem, and 690.72 on 
the Level Three problem, while <B>KurtSteinkraus</B> earned 264.03, 436.17, and 610.71 
on the three problems, respectively. 
</P>

<P>
In an even closer battle, <A HREF="/tc?module=MemberProfile&amp;cr=251134" CLASS="bodyGeneric">plan571</A>
 beat <A HREF="/tc?module=MemberProfile&amp;cr=268907" CLASS="bodyGeneric">Trolley</A>
 by just 5.13 points, 657.23 to 
652.10, to win Room 9.  plan571 earned 262.63 points on the Level One problem, 
and 394.60 on the Level Two problem.  The Level Three problem was opened and 
compiled by <B>plan571</B>, but not submitted.  <B>Trolley</B> actually earned more points 
than <B>plan571</B> on the Level Two problem, 399.34, but took longer on the Level 
One problem, and only earned 252.76 points.  <B>Trolley</B> opened and compiled the 
Level Three problem as well, but didn't submit any code for it. 
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=277659" CLASS="bodyGeneric">radeye</A>
 won Room 10 with 1443.89 final points, and gained 301 rating points, 
which is the 10th largest Division-I gain 
(<A HREF="/stat?c=biggest_rating_gains&amp;dn=1" CLASS="bodyGeneric">View the list of Division-I Rating Point Gain</A>).  
<B>radeye</B> earned 1343.89 points in the "Coding Phase" 
by gaining 273.85, 404.17, and 665.87 on the three problems, respectively.  
<B>radeye</B> then earned 100 additional points in the "Challenge Phase", 
by successfully challenging the Level Two submissions of <A HREF="/tc?module=MemberProfile&amp;cr=147031" CLASS="bodyGeneric">gaav</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=264682" CLASS="bodyGeneric">nave</A>.
</P>

                 </TD>
            </TR>             
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD></TR>        
            <TR><TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II</TD></TR>
            <TR><TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD></TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P>
<A HREF="/tc?module=MemberProfile&amp;cr=158782" CLASS="bodyGeneric">BCSEiny</A>
 had the highest score in the division, winning Room 26 with 1554.37 final points.  
<B>BCSEiny</B> earned 1454.37 points in the "Coding Phase" after submitting code for all 
three problems, but was in second place behind green, who had 1469.91 points.  
<B>BCSEiny</B> went for the win during the "Challenge Phase", adding an additional 
100 points with successful challenges of the Level One submissions of 
<A HREF="/tc?module=MemberProfile&amp;cr=271246" CLASS="bodyGeneric">blp</A> 
and <A HREF="/tc?module=MemberProfile&amp;cr=270932" CLASS="bodyGeneric">vv</A>.
  <A HREF="/tc?module=MemberProfile&amp;cr=281589" CLASS="bodyGeneric">green</A>
 was inactive during the "Challenge Phase", and finished second. 
</P>

<P>
In Room 33, <A HREF="/tc?module=MemberProfile&amp;cr=271773" CLASS="bodyGeneric">heather</A>
 won by an impressive 586.91 points.  <B>heather</B> finished 
with 1137.48 final points, with nonane finishing second with 550.57.  
<B>heather</B> earned all 1137.48 points in the "Coding Phase", but was in 
third place in the room.  <A HREF="/tc?module=MemberProfile&amp;cr=159781" CLASS="bodyGeneric">chegabon</A>
 was leading with 1261.18 points, 
and <A HREF="/tc?module=MemberProfile&amp;cr=260783" CLASS="bodyGeneric">nimrod</A>
 was in second with 1197.19.  Both members lost a ton of 
points during the "Challenge Phase" and system test, however.  
<B>chegabon</B> lost the 201.32 points that were earned on the Level One 
problem, when successfully challenged by <A HREF="/tc?module=MemberProfile&amp;cr=157428" CLASS="bodyGeneric">nonane</A>,
 and then lost 576.32 
during the system test, when the Level Three problem that was submitted 
failed.  <B>nimrod</B> actually added 50 points in the "Challenge Phase", with 
a successful challenge of the Level One submission of 
<A HREF="/tc?module=MemberProfile&amp;cr=279175" CLASS="bodyGeneric">Graymalkin</A>, but 
then lost 857.50 points during the system test, when the Level One 
and Three codes failed. 
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=262953" CLASS="bodyGeneric">MEEP!</A>
 won Room 35 with 1469.30 final points, an unbelievable 944.80
 points more than the nearest competitor.  <B>MEEP!</B> submitted code for 
 all three problems during the "Coding Phase", and had 1369.30 points.  
 <B>MEEP!</B> then added 100 additional points in the "Challenge Phase", 
 successfully challenging the Level One submissions of 
 <A HREF="/tc?module=MemberProfile&amp;cr=268581" CLASS="bodyGeneric">pi_boy</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=265344" CLASS="bodyGeneric">|v|etalhead</A>.
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


