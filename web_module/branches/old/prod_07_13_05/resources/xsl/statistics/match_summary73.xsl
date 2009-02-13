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
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?RoundId=4097&amp;t=schedule&amp;c=srm" CLASS="statText">Single Round Match 74<!-- 2002 TCCC Regional Championships --></A></TD>            
              <TD VALIGN="middle" CLASS="statText">Monday, March 25</TD>
              <TD VALIGN="middle" CLASS="statText">9:00pm EST</TD>
            </TR>            
            <!-- <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
            </TR> -->
                    <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/i/mot_redir.html" target="_blank"><IMG SRC="/i/moto_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR>          
                    <!-- <TR>
                      <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=schedule&amp;c=tourny_spons"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
                    </TR> -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 73 - March 21, 2002<!-- 2002 TCCC Regional Championships - March 13 --></TD>
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
<A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statText">View the list of Division-I Wins</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div1" CLASS="statText">View the list of Division-I Rating Point Gain</A>
<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="statText">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A> 
<A HREF="/stat?c=all_time_wins" CLASS="statText">View the list of Overall Wins</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>
<A HREF="/index?t=statistics&amp;c=high_total_div2" CLASS="statText">View the list of Division-II Point Totals</A>
-->
<P>
2002 Collegiate Challenge finalist <A HREF="/tc?module=MemberProfile&amp;cr=252076" CLASS="coderTextRed">Wasteland</A> won Room 3  by the smallest margin in the division.  <A HREF="/tc?module=MemberProfile&amp;cr=252076" CLASS="coderTextRed">Wasteland</A> coded all three problems for 1152.16 final points. <A HREF="/tc?module=MemberProfile&amp;cr=252076" CLASS="coderTextRed">Wasteland</A> earned 253.33 points on the Level One problem, 340.46 on the Level Two problem, and 558.37 on the Level Three problem.  That total was only 8.34 points more than the 1143.82-point total of <A HREF="/tc?module=MemberProfile&amp;cr=251457" CLASS="coderTextYellow">etolson</A>.  <A HREF="/tc?module=MemberProfile&amp;cr=251457" CLASS="coderTextYellow">etolson</A> earned 1093.82 points by coding all three problems in the "Coding Phase", and added 50 additional points with a successful challenge of the Level One submission of axch in the "Challenge Phase".
</P>

<P>
The biggest upset in the division occurred in Room 15, as 
<A HREF="/tc?module=MemberProfile&amp;cr=159838" CLASS="coderTextBlue">gaul</A>, the ninth lowest ranked coder of the 10 competitors in the room, was the winner with 307.20 final points.  
<A HREF="/tc?module=MemberProfile&amp;cr=159838" CLASS="coderTextBlue">gaul</A> coded the Level One problem for 257.20 points during the "Coding Phase", and added 50 points to that total with a successful challenge of the Level Three submission of <A HREF="/tc?module=MemberProfile&amp;cr=251658" CLASS="coderTextBlue">maxjenius</A> in the "Challenge Phase".
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="coderTextRed">ZorbaTHut</A> was the winner in Room 1, and had the highest point total, 1390.45, in the division.  <A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="coderTextRed">ZorbaTHut</A> earned 293.82 points on the Level One problem, 420.95 on the Level Two problem, and 675.68 on the Level Three problem.  The room win was the 17th overall for <A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="coderTextRed">ZorbaTHut</A>, and the 15th in Division-I.  <A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="coderTextRed">ZorbaTHut</A> ranks eighth in Overall Room Wins (<A HREF="/stat?c=all_time_wins" CLASS="statText">View the list of Overall Wins</A>) and eighth in Division-I Room Wins (<A HREF="/stat?c=all_time_wins_by_div&amp;dn=1" CLASS="statText">View the list of Division-I Room Wins</A>).
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
The closest battle in Division-II took place in Room 37, as <A HREF="/tc?module=MemberProfile&amp;cr=266084" CLASS="coderTextGreen">stimpil</A> beat 
<A HREF="/tc?module=MemberProfile&amp;cr=267221" CLASS="coderTextGreen">bml137</A> by 20.45 points, 762.09 to 741.64.  Both <A HREF="/tc?module=MemberProfile&amp;cr=266084" CLASS="coderTextGreen">stimpil</A> and 
<A HREF="/tc?module=MemberProfile&amp;cr=267221" CLASS="coderTextGreen">bml137</A> coded the Level One and Level Two problems successfully, but failed on the Level Three problem.
</P>

<P>
Two large margin wins took place in Room's 49 and 52:
</P>

<P>
In Room 49, <A HREF="/tc?module=MemberProfile&amp;cr=159146" CLASS="coderTextGray">badass_hacker</A> coded all three problems for 1132.35 points, 893.75 more than the second place finisher, <A HREF="/tc?module=MemberProfile&amp;cr=251022" CLASS="coderTextGray">PigeonBoy</A>, who earned 238.60 final points by coding the Level One problem.  <A HREF="/tc?module=MemberProfile&amp;cr=159146" CLASS="coderTextGray">badass_hacker</A> coded the Level One problem for 247.50 points, the Level Two problem for 484.23 points, and the Level Three problem for 400.62 points.
</P>

<P>
<A HREF="/tc?module=MemberProfile&amp;cr=112492" CLASS="coderTextGreen">ligremor</A> won Room 52 by an even greater margin, 999.64 points!!!  <A HREF="/tc?module=MemberProfile&amp;cr=112492" CLASS="coderTextGreen">ligremor</A> coded all of the problems in the "Coding Phase" for 1197.00 points, and added 50 more in the "Challenge Phase" with a successful challenge of the Level Two submission of <A HREF="/tc?module=MemberProfile&amp;cr=267264" CLASS="coderTextGray">Atom</A>.  <A HREF="/tc?module=MemberProfile&amp;cr=112492" CLASS="coderTextGreen">ligremor</A> finished with 1247.00 points.  <A HREF="/tc?module=MemberProfile&amp;cr=261030" CLASS="coderTextGray">meeish85</A> coded the Level One submission for 247.36 points and finished second in the room.  Besides the large margin of victory, <A HREF="/tc?module=MemberProfile&amp;cr=112492" CLASS="coderTextGreen">ligremor</A> also had a rating point increase of 402, which is the ninth highest in the division (<A HREF="/stat?c=biggest_rating_gains&amp;dn=2" CLASS="statText">View the list of Division-II Rating Point Gain</A>).
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


