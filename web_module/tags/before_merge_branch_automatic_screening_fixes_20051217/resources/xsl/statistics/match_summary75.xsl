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
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;Last Match Summary</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
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
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4105&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 76<!-- 2002 TCCC Regional Championships --></A></TD>            
              <TD VALIGN="middle" CLASS="statText">Monday, April 1</TD>
              <TD VALIGN="middle" CLASS="statText">10:00pm EST</TD>
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
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 75 - March 26, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>                                               
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-I<!-- Northeast Region --> </TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>
<A HREF="/stat?c=all_time_wins_by_div&amp;dn=1" CLASS="statText">View the list of Division-I Wins</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="statText">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A> 
<A HREF="/stat?c=all_time_wins" CLASS="statText">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>
<A HREF="/stat?&amp;c=highest_totals&amp;dn=2" CLASS="statText">View the list of Division-II Point Totals</A>
<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Impressive Debuts</A>
-->
<P>
<A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="coderTextRed">evd</A> was the Room 1 winner in Single Round Match 
75 with 790.51 final points.  <A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="coderTextRed">evd</A> earned 241.11 
points on the Level One problem and 399.40 points on the Level Two problem, for a total of 640.51 after the "Coding Phase".  
<A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="coderTextRed">evd</A> then gained 150 points in the "Challenge Phase" with successful challenges of the Level One submissions of <A HREF="/tc?module=MemberProfile&amp;cr=262935" CLASS="coderTextRed">derkuci</A>, <A HREF="/tc?module=MemberProfile&amp;cr=153505" CLASS="coderTextRed">ambrose</A>, and <A HREF="/tc?module=MemberProfile&amp;cr=156592" CLASS="coderTextRed">benetin</A>.  
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=264961" CLASS="coderTextYellow">henchq</A> won Room 4 with a division-high 1101.30 final points.  <A HREF="/tc?module=MemberProfile&amp;cr=264961" CLASS="coderTextYellow">henchq</A> was the only coder in the room to successfully submit code for all three problems.  <A HREF="/tc?module=MemberProfile&amp;cr=264961" CLASS="coderTextYellow">henchq</A> earned 229.06 points on the Level One problem, 397.82 on the Level Two problem, and 424.42 on the Level Three problem, for a total of 1051.30 points during the "Coding Phase".  <A HREF="/tc?module=MemberProfile&amp;cr=264961" CLASS="coderTextYellow">henchq</A> added 50 additional points with a successful challenge of the Level Two submission of <A HREF="/tc?module=MemberProfile&amp;cr=156603" CLASS="coderTextYellow">LinkII</A>.  This performance added an impressive 245 points to the rating of <A HREF="/tc?module=MemberProfile&amp;cr=264961" CLASS="coderTextYellow">henchq</A>.
</P>

<P>
The biggest upset in Division-I occurred in Room 11, where <A HREF="/tc?module=MemberProfile&amp;cr=251322" CLASS="coderTextYellow">jjmoon</A>, who was rated 10th of the 10 coders in the room, was the winner.  <A HREF="/tc?module=MemberProfile&amp;cr=251322" CLASS="coderTextYellow">jjmoon</A> finished with 319.20 final points.  <A HREF="/tc?module=MemberProfile&amp;cr=251322" CLASS="coderTextYellow">jjmoon</A> coded the Level One problem during the "Coding Phase" for 219.20 points, and then added 100 points in the "Challenge Phase" with successful challenges of the Level Two submissions of <A HREF="/tc?module=MemberProfile&amp;cr=270887" CLASS="coderTextBlue">eduar09</A> and <A HREF="/tc?module=MemberProfile&amp;cr=273149" CLASS="coderTextBlue">Suuloti</A>. 
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
              <TD VALIGN="top" COLSPAN="3" CLASS="statText">            
<P>
First-time coder <A HREF="/tc?module=MemberProfile&amp;cr=273457" CLASS="coderTextYellow">jesser</A>
 won Room 56 with a division-high 1288.94 final points, all earned in the "Coding Phase". <A HREF="/tc?module=MemberProfile&amp;cr=273457" CLASS="coderTextYellow">jesser</A>
 earned 247.85 points on the Level One problem, 511.95 on the Level Two problem, and 529.14 on the Level Three problem.  During the "Challenge Phase", <A HREF="/tc?module=MemberProfile&amp;cr=272196" CLASS="coderTextGray">geisler</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=273416" CLASS="coderTextGray">xxfobxx</A>
 both tried to challenge the Level Two submission of <A HREF="/tc?module=MemberProfile&amp;cr=273457" CLASS="coderTextYellow">jesser</A>
, but to no avail.  The 1845 point debut rating of <A HREF="/tc?module=MemberProfile&amp;cr=273457" CLASS="coderTextYellow">jesser</A>
 is the 10th highest ever (<A HREF="/stat?c=impressive_debuts" CLASS="statText">View the list of Impressive Debuts</A>).
</P>

<P>
Two big upsets occurred in Room 35 and Room 42, as the number 10 seeds won both rooms.
</P>

<P>
In Room 35, <A HREF="/tc?module=MemberProfile&amp;cr=264728" CLASS="coderTextGreen">Liguo</A>
 was the winner with 601.28 final points.  <A HREF="/tc?module=MemberProfile&amp;cr=264728" CLASS="coderTextGreen">Liguo</A>
 earned 643.03 points in the "Coding Phase", after submitting code for the Level One and Two problems.  <A HREF="/tc?module=MemberProfile&amp;cr=264728" CLASS="coderTextGreen">Liguo</A>
 added 200 points to that total in the "Challenge Phase" with five successful challenges and one failed challenge.  The Level One submission of <A HREF="/tc?module=MemberProfile&amp;cr=264728" CLASS="coderTextGreen">Liguo</A>
 then failed the system test, costing <A HREF="/tc?module=MemberProfile&amp;cr=264728" CLASS="coderTextGreen">Liguo</A>
 the 241.75 points that were earned on that problem.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=160019" CLASS="coderTextGreen">ISlattery</A>
 was the winner of Room 42 with 740.60 final points.  <A HREF="/tc?module=MemberProfile&amp;cr=160019" CLASS="coderTextGreen">ISlattery</A>
 coded the Level One problem for 242.66 points and the Level Two problem for 547.94, for a total of 790.60 points in the "Coding Phase".  <A HREF="/tc?module=MemberProfile&amp;cr=160019" CLASS="coderTextGreen">ISlattery</A>
 then lost 50 points in the "Challenge Phase" when a challenge of the Level Three submission of <A HREF="/tc?module=MemberProfile&amp;cr=263860" CLASS="coderTextGray">Crono</A>
 failed.
</P>


<!-- <P>
View the Top-10 Winners:<BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_ne" CLASS="statText">Northeast Top-10</A> | <A HREF="/index?t=statistics&amp;c=top_10_wins_se" CLASS="statText">Southeast Top-10</A><BR/>
<A HREF="/index?t=statistics&amp;c=top_10_wins_w" CLASS="statText">West Top-10</A> | <A HREF="/index?t=statistics&amp;c=top_10_wins_mw" CLASS="statText">Midwest Top-10</A><BR/>
</P> -->
          </TD>
            </TR>            
          </TABLE>
          <P><br/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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


