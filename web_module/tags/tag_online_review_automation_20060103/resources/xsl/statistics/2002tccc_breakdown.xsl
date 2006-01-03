<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/tournament_links.xsl"/>     
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
  <xsl:with-param name="title">&#160;2002 TCCC Breakdown</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->        
        <xsl:call-template name="tournament_links"/>
  <!-- Coder of the Week Pulldown Ends -->
<BR/>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif">   
  <TR>
    <TD VALIGN="top" align="center"><!-- <DIV><IMG SRC="/i/semifinals_rooms.gif" ALT="" WIDTH="300" HEIGHT="36" BORDER="0"/>
    </DIV> --><A HREF="/?t=tournaments&amp;c=tourny_sched"><IMG SRC="/i/semi02_rooms.gif" ALT="" WIDTH="507" HEIGHT="312" BORDER="0" USEMAP="#semi02_rooms_Map" VSPACE="5"/></A></TD>
    <!-- <TD VALIGN="top" COLSPAN="2" ALIGN="left" BGCOLOR="#FFFFFF"></TD> -->
  </TR> 
</TABLE>
<MAP NAME="semi02_rooms_Map">
<AREA SHAPE="rect" ALT="" COORDS="392,262,498,282" HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,235,498,256" HREF="/tc?module=MemberProfile&amp;cr=252076" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="393,208,498,228" HREF="/tc?module=MemberProfile&amp;cr=142795" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,181,498,201" HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="391,108,499,126" HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="392,81,499,102" HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="392,52,498,75" HREF="/tc?module=MemberProfile&amp;cr=111202" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="392,27,500,46" HREF="/tc?module=MemberProfile&amp;cr=157974" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="10,261,116,282" HREF="/tc?module=MemberProfile&amp;cr=113178" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,235,116,257" HREF="/tc?module=MemberProfile&amp;cr=154089" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,208,117,229" HREF="/tc?module=MemberProfile&amp;cr=120816" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="9,182,117,201" HREF="/tc?module=MemberProfile&amp;cr=264869" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,107,116,128" HREF="/tc?module=MemberProfile&amp;cr=112939" CLASS="coderTextYellow"/>
<AREA SHAPE="rect" ALT="" COORDS="9,80,115,101" HREF="/tc?module=MemberProfile&amp;cr=155275" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="8,53,117,74" HREF="/tc?module=MemberProfile&amp;cr=262935" CLASS="coderTextRed"/>
<AREA SHAPE="rect" ALT="" COORDS="9,25,117,48" HREF="/tc?module=MemberProfile&amp;cr=153505" CLASS="coderTextRed"/>
</MAP>

<!-- Semifinal breakdown by regions --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif">   
  <TR>
    <TD VALIGN="top" align="center"><A HREF="/?t=tournaments&amp;c=tourny_sched"><IMG SRC="/i/sunsemi1_sm.gif" ALT="" WIDTH="267" HEIGHT="161" BORDER="0" VSPACE="5"/><IMG SRC="/i/sunsemi2_sm.gif" ALT="" WIDTH="217" HEIGHT="161" BORDER="0" VSPACE="5"/></A></TD>
    <!-- <TD VALIGN="top" COLSPAN="2" ALIGN="left" BGCOLOR="#FFFFFF"></TD> -->
  </TR> 
</TABLE>


<!-- Favs, Cinder, Who to Watch --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BACKGROUND="/i/steel_darkblue_bg.gif">  
  <TR>  
    <TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="6" BORDER="0"/></TD>    
  </TR>  
  <TR>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="9" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="6" BORDER="0"/></TD>    
  </TR>   
  <TR>  
    <TD VALIGN="top" WIDTH="33%" ALIGN="left" CLASS="statText"><DIV><A HREF="/index?t=statistics&amp;c=2002tccc_favs"><IMG SRC="/i/tourny_badge_favs.gif" ALT="" WIDTH="150" HEIGHT="41" BORDER="0" VSPACE="4"/></A></DIV>
    <IMG SRC="/i/m/dmwright_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="8" VSPACE="1" ALIGN="left"/>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=114853" CLASS="coderTextRed">dmwright</A><BR/>
The big cheese.  The head honcho.  The top gun.  The dictionary defines a favorite as "a competitor judged most likely to win".  And win is exactly what the favorites have done so far in their TopCoder careers, as all of the favorites are among the top-25 in all-time room wins.  Let's take a deeper look at the four coders who have earned the distinction as favorites...<A HREF="/?t=statistics&amp;c=2002tccc_favs" CLASS="statText">full&#160;story</A>
</TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="1" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="33%"  ALIGN="left" CLASS="statText"><DIV><A HREF="/index?t=statistics&amp;c=2002tccc_cind"><IMG SRC="/i/tourny_badge_cind.gif" ALT="" WIDTH="150" HEIGHT="41" BORDER="0" VSPACE="4"/></A></DIV>
    <IMG SRC="/i/m/ante_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="8" VSPACE="1" ALIGN="left"/>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=264869" CLASS="coderTextYellow">ante</A><BR/>
Every competition has them.  The 1980 "Miracle on Ice" US Mens Ice Hockey Team, Buster Douglas, Rocky Balboa, the New England Patriots, and most recently Sarah Hughes.  They're what make tournaments fun, interesting and compelling. They also provide a ton of emotional drama.  It's the American way; everyone loves the underdog...<A HREF="/?t=statistics&amp;c=2002tccc_cind" CLASS="statText">full&#160;story</A>
</TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="1" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="33%" ALIGN="left" CLASS="statText"><DIV><A HREF="/index?t=statistics&amp;c=2002tccc_eyeon"><IMG SRC="/i/tourny_badge_eyeon.gif" ALT="" WIDTH="150" HEIGHT="41" BORDER="0" VSPACE="4"/></A></DIV>
    <IMG SRC="/i/m/milhouse_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="8" VSPACE="1" ALIGN="left"/>
<A HREF="/?t=statistics&amp;c=member_profile&amp;Coder_Id=154089" CLASS="coderTextRed">milhouse</A><BR/>    
These are the coders that the top-seeds fear the most.  They are either TopCoder veterans, TopCoder tournament tested, those who had outstanding performances with top scores in the Regional Quarterfinals and/or Regional Semifinals, or all of the above...<A HREF="/?t=statistics&amp;c=2002tccc_eyeon" CLASS="statText">full&#160;story</A></TD>   
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="9"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="15" BORDER="0"/></TD>    
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


