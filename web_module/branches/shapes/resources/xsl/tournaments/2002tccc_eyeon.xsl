<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/stats/public_stats_left.xsl"/> 
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
    <TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="public_stats_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">statistics</xsl:with-param>
  <xsl:with-param name="title">&#160;2002 TCCC - Keep Your Eye On...</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="4" CLASS="statText">Tournament Breakdown:<BR/>
              <A HREF="/index?t=tournaments&amp;c=2002tccc_cind" CLASS="statText">The Cinderellas</A> | <A HREF="/index?t=tournaments&amp;c=2002tccc_favs" CLASS="statText">The Favorites</A> | <A HREF="/index?t=tournaments&amp;c=2002tccc_eyeon" CLASS="statText">Keep Your Eye On...</A>
              </TD>
            </TR>          
            <TR>
              <TD COLSPAN="4" ALIGN="center"><BR/><A HREF="/index?t=tournaments&amp;c=tourny_spons"><IMG SRC="/i/tournament/sun_banner.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR>           
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Keep Your Eye On...</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
These are the coders who the top-seeds fear the most.  They are either TopCoder veterans, TopCoder tournament tested, those who had outstanding performances with top scores in the Regional Quarterfinals and/or Regional Semifinals, or all of the above.  Rest assured that the hands of the favorites will be trembling on their keyboards if they find themselves matched up in the same room of one or more of these coders:
                 </TD>
            </TR> 
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="milhouse"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Northeast Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="25%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;6</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2395</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;MIT</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why the favorites should worry:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/milhouse_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
Of the four MIT students to make the Regional Finals, only <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A> advanced to the semifinals, and it's pretty much a given <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A> will want to perform at a high level with the next round on campus at MIT.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A> finished third in Room 2, and gained the ninth spot in the semifinals.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A> won Room 12 in the Regional Quarterfinals with the sixth highest point total (1162.85) in the Northeast region after submitting the correct code for all three problems and being successful in two challenges.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A> finished second to reid in Room 8 of the Regional Semifinals.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A> was one of the 16 semifinalists in the 2001 TopCoder Invitational.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A> is ranked 16th in the overall TopCoder rankings.  Will home-school advantage help <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A> to the championship?
</P>
                 </TD>
            </TR>
            <!-- end fav -->  
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="ColinMacLeod"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Southeast Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="10%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="40%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;8</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;1976</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;Georgia Institute of Technology</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why the favorites should worry:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/ColinMacLeod_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A> was the surprise champion of the Southeast Region, winning Room 3 with 497.16 final points in the Regional Finals.  In the Regional Quarterfinals, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A> triumphed in Room 22 with 943.39 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A> earned 696.22 final points in the Regional Semifinals and finished second in Room 10 to dgarthur.  This is the third major tournament for <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A>, who made it to the third round of the 2001 TopCoder Collegiate Challenge, and was one of the 16 semifinalists in the 2001 TopCoder Invitational.  Don't let his overall TopCoder ranking of 50 fool you; come tournament time <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A> gets the job done.
</P>
                 </TD>
            </TR>
            <!-- end fav --> 
              
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="Joe"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Midwest Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="25%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;2</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2282</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;Michigan Technological University </TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why the favorites should worry:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/Joe_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A> finished in third place of Room 1 in the Regional Finals, and earned the 12th spot in the semifinals.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A> won Room 5 in the Regional Quarterfinals with the seventh highest point total in the region, 962.61.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A> was also triumphant in the Regional Semifinals, winning Room 2 with 935.55 final points, the sixth highest point total in the region.  This is the second major tournament for <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A>, who made it to the first round of the 2001 Invitational.  Can <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A> win the title in his second major tournament?
</P>
                 </TD>
            </TR>
            <!-- end fav --> 
  
             <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="zoidal"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Midwest Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="25%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;3</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2006</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;Purdue University</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why the favorites should worry:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/zoidal_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A> advanced to the semifinals by finishing fourth in Room 1 in the Regional Finals, and earning the 13th spot.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A> won Room 6 in the Regional Quarterfinals with the eighth highest point total in the region, 910.68.  In the Regional Semifinals, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A> earned 687.58 final points, and finished in third place in Room 3.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A> advanced to the third round of the 2001 Collegiate Challenge and the second round the 2001 Invitational.  Will the third tournament be the charm for <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A>?
</P>
                 </TD>
            </TR>
            <!-- end fav -->
                                  
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="Wasteland"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Midwest Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="25%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;4</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2063</TD>
              <TD VALIGN="middle" CLASS="statText" NOWRAP="0">&#160;University of Minnesota-Twin Cities</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why the favorites should worry:</TD>
            </TR>                       
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/Wasteland_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>
Although <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A> finished second in Room 1 of the Regional Finals, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A> has already tasted victory in the Collegiate Challenge.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A> won Room 7 in the Regional Quarterfinals with the third highest point total in the region, 1078.93.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A> was also victorious in the Regional Semifinals, winning Room 8 with 765.11 final points.  <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A> is a relatively new member to TopCoder, having joined in December 2001.  Since debuting with a 1557 rating, <A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A> has improved it by 506 points.  Is this TopCoder newcomer ready for the pressure of live coding?  
</P>
                 </TD>
            </TR>
            <!-- end fav -->  
            
            <!-- begin fav -->            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><A NAME="malpt"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                              
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;West Region</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" WIDTH="25%" HEIGHT="15" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Seed</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;Rating</TD>
              <TD VALIGN="middle" WIDTH="25%" BACKGROUND="/i/steel_blue_bg.gif" CLASS="statTextBig">&#160;School</TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;4</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;2709</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;University of California-Berkeley</TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Why the favorites should worry:</TD>
            </TR>                        
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>                      
            <TR>
              <TD VALIGN="top" COLSPAN="4" CLASS="statText">
<P><IMG SRC="/i/m/malpt_big.jpg" ALT="" WIDTH="126" HEIGHT="140" BORDER="0" HSPACE="5" VSPACE="5" ALIGN="left"/>

<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A> won the West region with a Regional Finals-high 1068.24 final points.  With the sixth highest total (1153.05) in the West region, 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A> was the Regional Quarterfinals winner of Room 20.  
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A> placed third in Room 16 with 706.21 final points in the Regional Semifinals.  
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A> was one of the 16 semifinalists in the 2001 TopCoder Invitational.  
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A> is tied for second with 25 <A HREF="/index?t=tournaments&amp;c=srm_wins" CLASS="statText">Overall Room Wins</A>, 24 of which are Division I wins.  Two of the top-25 <A HREF="/index?t=tournaments&amp;c=high_total_div1" CLASS="statText">Highest Point Totals</A> in Division I, including the eighth highest (1678.85), were earned by 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A>, and 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A> is ranked 16th in <A HREF="/index?t=tournaments&amp;c=sub_acc" CLASS="statText">Submission Accuracy</A> (75.97%).  Will the experience of 
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A>, a Doctoral student and veteran of 51 SRMs, lead to a championship?
</P>
                 </TD>
            </TR>
            <!-- end fav --> 
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="18" BORDER="0"/></TD>
            </TR>                                                      
          </TABLE>
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">          
             <TR>
              <TD VALIGN="middle" COLSPAN="4" HEIGHT="15" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;Comparison of the Sleepers</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>
            </TR>            
            <TR>
              <TD VALIGN="middle" HEIGHT="15" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Region</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;Handle</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;2002 Collegiate Challenge Submission Accuracy</TD>
              <TD VALIGN="middle" BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig">&#160;2002 Collegiate Challenge Challenge Success</TD>              
            </TR>            
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;Northeast</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;87.50% (7-for-8)</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;100.00% (2-for-2)</TD>             
            </TR>
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;Southeast</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=111202" CLASS="coderTextYellow">ColinMacLeod</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;66.67% (6-for-9)</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;66.67% (2-for-3)</TD>              
            </TR>            
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;Midwest</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=142795" CLASS="coderTextRed">Joe</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;77.78% (7-for-9)</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;0.00% (0-for-1)</TD>             
            </TR>
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=112939" CLASS="coderTextYellow">zoidal</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;87.50% (7-for-8)</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;Has not attempted a challenge</TD>             
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=252076" CLASS="coderTextYellow">Wasteland</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;66.67% (6-for-9)</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;Has not attempted a challenge</TD>             
            </TR>                         
            <TR>
              <TD VALIGN="middle" HEIGHT="13" CLASS="statText">&#160;West</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=120816" CLASS="coderTextRed">malpt</A></TD>
              <TD VALIGN="middle" CLASS="statText">&#160;77.78% (7-for-9)</TD>
              <TD VALIGN="middle" CLASS="statText">&#160;50.00% (2-for-4)</TD>              
            </TR>                                    
            <TR>
              <TD VALIGN="middle" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
    <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- <A HREF="/index?t=tournaments&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


