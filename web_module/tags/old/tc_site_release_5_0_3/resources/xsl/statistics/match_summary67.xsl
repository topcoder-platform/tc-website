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
                     <TD VALIGN="middle" HEIGHT="13" CLASS="statText"><A HREF="/?t=tournaments&amp;c=tourny_sched" CLASS="statText"><!-- Single Round Match 67 -->2002 TCCC First Round W/MW</A></TD>
                     <TD VALIGN="middle" CLASS="statText">Thursday, February 21</TD>
                     <TD VALIGN="middle" CLASS="statText">10:00pm EST</TD>
                  </TR>                  
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="22" BORDER="0"/></TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Last Match Summary: Single Round Match 67 - Feb 20, 2002<!-- 2002 TCCC First Round NE/SE - February 19, 2002 --></TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                  </TR>                                    
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-I<!-- Northeast Region --></TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
                  </TR>                                 
                  <TR>
                     <TD VALIGN="top" COLSPAN="3" CLASS="statText">
<!-- <A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>
<A HREF="/index?t=statistics&amp;c=srm_wins_div1" CLASS="statText">View the list of Division-I Wins</A>
<A HREF="/index?t=statistics&amp;c=rate_gain_div2" CLASS="statText">View the list of Division-II Rating Point Gain</A>
<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A> -->

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>
 won for the fourth consecutive time, which ties five others for the third longest streak (<A HREF="/index?t=statistics&amp;c=consec_wins_div1" CLASS="statText">View the list of Division-I Consecutive Wins</A>).  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>
 won Room 1 with 1303.20 final points after coding all three problems in the "Coding Phase", and challenging the 1000-point submission of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152073" CLASS="coderTextRed">NDBronson</A>.  The win was the 43rd for <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A>
, far and away the most among all members (<A HREF="/index?t=statistics&amp;c=srm_wins" CLASS="statText">View the list of Overall Wins</A>).  
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262935" CLASS="coderTextYellow">derkuci</A>
 was the other consecutive winner in SRM 67, as the 966.19 final points <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262935" CLASS="coderTextYellow">derkuci</A>
 earned by coding all three problems, won Room 4.   
</P>

<P>
In Room 23, 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159168" CLASS="coderTextBlue">Virtual</A>
 used the "Challenge Phase" to win a  Division I room for the first time.  
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159168" CLASS="coderTextBlue">Virtual</A>
 was in last place after earning 160.29 points in the "Coding Phase", submitting code for only the 250-point problem.  During the "Challenge Phase", 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159168" CLASS="coderTextBlue">Virtual</A>
 successfully challenged the 500-point submissions of both <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=158450" CLASS="coderTextGreen">sid6581</A>
 and <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=262074" CLASS="coderTextGreen">gblack</A>
 for 100 additional points.  The 260.29 final point total of 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159168" CLASS="coderTextBlue">Virtual</A>
 was enough to jump past the other nine coders in the room, and give 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=159168" CLASS="coderTextBlue">Virtual</A>
 the win.
</P>

               </TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
                  </TR>            
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Division-II<!-- Southeast Region --></TD>
                  </TR>
                  <TR>
                     <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
                  </TR>                  
                  <TR>
                     <TD VALIGN="top" COLSPAN="3" CLASS="statText">                  

<P>
It was a high scoring night in Division II.
</P>

<P>
In Room 24, 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A>
 broke the all-time record for points in Division II by earning 1898.64 final points (<A HREF="/index?t=statistics&amp;c=high_total_div2" CLASS="statText">View the list of Division II Point Totals</A>).  The previous record was 1713.30, which was earned by <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=152437" CLASS="coderTextBlue">oneshinevn</A>
 in SRM 20.  
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A>
 coded all three problems for 1648.64 points in the "Coding Phase", and then added 250 additional points with five successful challenges to earn the record.  
</P>

<P>
All in all, 14 coders added their name to the Division II Highest Point Total list in SRM 67.
</P>

<P>

<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=155069" CLASS="coderTextBlue">chi</A>
 wasn't the only coder with five successful challenges, as <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267685" CLASS="coderTextGreen">bengle</A>
 accomplished the same feat in Room 55, which was the key in <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267685" CLASS="coderTextGreen">bengle</A>
 winning the room.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267685" CLASS="coderTextGreen">bengle</A>
 submitted code for all three problems in the "Coding Phase", earning 1032.97 points.  With 250 additional points earned in the "Challenge Phase", <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267685" CLASS="coderTextGreen">bengle</A>
 had 1282.97 heading into the system test.  The 500 and 1000-point submissions of <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267685" CLASS="coderTextGreen">bengle</A>
 failed the system test, costing <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267685" CLASS="coderTextGreen">bengle</A>
 796.60 points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267685" CLASS="coderTextGreen">bengle</A>
 ended up winning the room with 486.37 points, but would have finished third in the room without the 250 points gained in the Challenge Phase.
</P>

<P>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268212" CLASS="coderTextYellow">dukeola</A>
 had the top performance of all of the first time coders, winning Room 61 with 1572.81 final points, and earning a debut rating of 1696 (<A HREF="/index?t=statistics&amp;c=winning_debut" CLASS="statText">View the list of Winning Debuts</A>).  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=268212" CLASS="coderTextYellow">dukeola</A>
 submitted the correct code for all three problems and was successful in his only challenge, the 500-pointer of 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=267264" CLASS="coderTextGray">Atom</A>.  
</P>


<P>
The next TopCoder competition is the first round of the 2002 Sun and TopCoder Collegiate Challenge for the MidWest and West regions, which will be held Thursday, February 21 at 10:00pm EST. <A HREF="/?t=tournaments&amp;c=tourny_sched" CLASS="statText">View match overview.</A>
</P>


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
      <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
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

