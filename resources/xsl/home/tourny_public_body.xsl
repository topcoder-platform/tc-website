<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../includes/modules/srm_dates.xsl"/>
  <xsl:import href="../includes/modules/tc_updates2.xsl"/>
  <xsl:import href="../includes/modules/white_last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_tidbit.xsl"/>
  <xsl:import href="../includes/modules/countries.xsl"/>
  <xsl:import href="../includes/modules/intro.xsl"/>      
  <xsl:import href="../includes/modules/coder_week2.xsl"/>
  <xsl:import href="../includes/modules/top_10_coders2.xsl"/>
  <xsl:import href="../includes/modules/round_table.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>
  <xsl:import href="../includes/modules/arena2.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/editorials.xsl"/>    
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
    <!-- <TD WIDTH="170" ROWSPAN="2" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/> 


<IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>
<xsl:call-template name="module_login"/> 
<xsl:call-template name="top_10_coders"/>
<xsl:call-template name="arena"/>
    </TD> -->
<!-- <xsl:call-template name="round_table"/>
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                  </xsl:when>                  
                  <xsl:otherwise>
                     <xsl:call-template name="practice_room"/>
                  </xsl:otherwise>
                </xsl:choose> -->


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
<xsl:call-template name="intro"/>
<xsl:call-template name="srm_dates"/>
<IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/>
<xsl:call-template name="calendar"/>
<!-- <xsl:call-template name="countries"/> -->
<IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" BORDER="0" ALT="[ TopCoder ]" VSPACE="5"/>
      </TD>    

  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="1" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
<!-- Left Column Include Ends -->

<!-- Body Area -->

  <!-- Center Column Begins -->  
    <TD WIDTH="100%" VALIGN="top" ALIGN="center" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/><BR/> 

<!-- TC top special promo --> 
<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">          
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>   
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" COLSPAN="3" WIDTH="100%" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="50" CLASS="bodyText">
    <FONT SIZE="5" COLOR="#000000" FACE="tahoma,verdana,arial"><B>Promo block</B></FONT><BR/>
    Promo subhead</TD>   
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
</TABLE> -->
 
<!-- Feature -->  
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" WIDTH="100%" BGCOLOR="#FFFFFF" HEIGHT="26"><FONT SIZE="4" COLOR="#000000" FACE="tahoma, verdana"><B>Weekly Feature</B></FONT><BR/></TD>
    <!-- <TD WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> -->
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
  </TR>   
</TABLE>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">   
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText">
<P><IMG SRC="/i/2002tccc/tourney_thumb_photo.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<A HREF="/index?t=statistics&amp;c=2002tccc_feature" CLASS="bodyGeneric"><B>A Matter of Time</B></A><BR/>
<I>dmwright Began Journey To Title At Age Six</I><BR/><BR/>
Wednesday, April 24, 2002<BR/>
By&#160;Adam Loss,<I>TopCoder Staff Writer</I><BR/>
</P>
<!-- <A HREF="/index?t=statistics&amp;c=2002tccc_cind#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#" CLASS="bodyGeneric"></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#" CLASS="bodyGeneric"></A>
<IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<IMG SRC="/i/2002tccc/coder_quote2.gif" ALT="" WIDTH="140" HEIGHT="140" ALIGN="right" HSPACE="10" VSPACE="3" BORDER="0"/>
<A HREF="/index?t=statistics&amp;c=2002tccc_cind#<A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A>" CLASS="bodyGeneric"><A HREF="/index?t=statistics&amp;c=2002tccc_cind#derkuci" CLASS="bodyGeneric">derkuci</A></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A>" CLASS="bodyGeneric"><A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#Joe" CLASS="bodyGeneric">Joe</A></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_favs#<A HREF="/index?t=statistics&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A>" CLASS="bodyGeneric"><A HREF="/index?t=statistics&amp;c=2002tccc_favs#dmwright" CLASS="bodyGeneric">dmwright</A></A>
<A HREF="/index?t=statistics&amp;c=2002tccc_eyeon#malpt" CLASS="bodyGeneric">malpt</A>
 -->

<P>
A pump of his fists, a loud hand clap, and exclamation of "Yes!" was the reaction of <A HREF="/stat?c=member_profile&amp;cr=153902" CLASS="bodyGeneric">evd</A> when it was 
announced that fellow Stanford University student <A HREF="/index?t=statistics&amp;c=2002tccc_feature" CLASS="bodyGeneric">dmwright</A> had won the 2002 Sun Microsystems and TopCoder 
Collegiate Challenge on Saturday April 20, at the University Park Hotel @ MIT in Cambridge, MA...<A HREF="/index?t=statistics&amp;c=2002tccc_feature" CLASS="bodyGeneric">full&#160;story</A>
</P>

    </TD>
    <TD VALIGN="top" WIDTH="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>

  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
  </TR>  
</TABLE>  


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>  
    <TD VALIGN="top" COLSPAN="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>    
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="9" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>  
    <TD VALIGN="top" COLSPAN="11" ALIGN="center"><IMG SRC="/i/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></TD>    
  </TR>       
  <TR>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="30%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Friday, April 19th:</B></FONT><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom1" CLASS="bodyGeneric">Semifinal Room 1</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom2" CLASS="bodyGeneric">Semifinal Room 2</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom3" CLASS="bodyGeneric">Semifinal Room 3</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom4" CLASS="bodyGeneric">Semifinal Room 4</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyGeneric">Bracket Update</A><BR/> 
<!-- - <A HREF="/index?t=statistics&amp;c=2002tccc_photos" CLASS="bodyGeneric"></A>Photos<BR/> -->
    </TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="35%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Saturday, April 20th:</B></FONT><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_champ" CLASS="bodyGeneric">Championship</A><BR/>
<!-- - <A HREF="/index?t=statistics&amp;c=2002tccc_sunnotes" CLASS="bodyGeneric"></A>Sun Presentation Notes<BR/> --> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyGeneric">Bracket Update</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_champ#photo" CLASS="bodyGeneric">Photos</A><BR/>
    </TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="35%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Overall:</B></FONT><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_favs" CLASS="bodyGeneric">Favorites</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_cind" CLASS="bodyGeneric">Cinderellas</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon" CLASS="bodyGeneric">Keep your eye on...</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=coderprofile_sun" CLASS="bodyGeneric">Java.Sun.Com Coder Profile</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_reception" CLASS="bodyGeneric">Opening Ceremonies</A><BR/>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>

  <TR>  
    <TD VALIGN="top" COLSPAN="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>   
  </TR>   
</TABLE>

<!-- Tourney editorial --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">     
  <!-- <TR>  
    <TD VALIGN="top" COLSPAN="7" ALIGN="center"><IMG SRC="/i/sun_banner_white.gif" ALT="Sun Microsystems" WIDTH="428" HEIGHT="84" BORDER="0"/></TD>    
  </TR>
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="middle" WIDTH="100%" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="40" CLASS="bodyText"><FONT SIZE="5" COLOR="#000000" FACE="tahoma,verdana,arial"><B>The Sun/TopCoder Collegiate Challenge is Underway!</B></FONT><BR/>
    Semifinal Rounds begin today April 19th. A new TCCC Champion will be named tomorrow.</TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>   
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>   
  </TR>         
  
  <!-- <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>   
  </TR> -->   
</TABLE> 
    

<!-- TC top special promo --> 
<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">     
  <TR>  
    <TD VALIGN="top" COLSPAN="11" ALIGN="center"><IMG SRC="/i/sun_banner_white.gif" ALT="Sun Microsystems" WIDTH="428" HEIGHT="84" BORDER="0"/></TD>    
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="35%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Friday, April 19th:</B></FONT><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom1" CLASS="bodyGeneric">Semifinal Room 1</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom2" CLASS="bodyGeneric">Semifinal Room 2</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom3" CLASS="bodyGeneric">Semifinal Room 3</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom4" CLASS="bodyGeneric">Semifinal Room 4</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyGeneric">Bracket Update</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_photos" CLASS="bodyGeneric">Photos</A><BR/>
    </TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="35%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Saturday, April 20th:</B></FONT><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_champ" CLASS="bodyGeneric">Champion</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_sunnotes" CLASS="bodyGeneric">Sun Presentation Notes</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyGeneric">Bracket Update</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_photos" CLASS="bodyGeneric">Photos</A><BR/>
    </TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="1"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="30%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Overall:</B></FONT><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_favs" CLASS="bodyGeneric">Favorites</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=2002tccc_cind" CLASS="bodyGeneric">Cinderellas</A><BR/>
- <A HREF="/index?t=statistics&amp;c=2002tccc_eyeon" CLASS="bodyGeneric">Keep your eye on...</A><BR/> 
- <A HREF="/index?t=statistics&amp;c=coderprofile_sun" CLASS="bodyGeneric">Java.Sun.Com Coder Profile</A><BR/>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>

  <TR>  
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>   
  </TR>   
</TABLE> -->

    <!-- Last SRM Begins -->    
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>
    <TD VALIGN="middle" BGCOLOR="#FFFFFF" WIDTH="184"><A HREF="/index?t=statistics&amp;c=match_summary"><IMG SRC="/i/label_srm_summary.gif" ALT="Last Match Summary" WIDTH="184" HEIGHT="26" HSPACE="5" BORDER="0" ALIGN="left"/></A></TD>
    <TD WIDTH="100%" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="194" ALIGN="right"><A HREF="/stat?c=last_match" CLASS="bodyGeneric"><IMG SRC="/i/label_view_results.gif" ALT="Last Match Results" WIDTH="194" HEIGHT="26" BORDER="0" ALIGN="right"/></A></TD>
  </TR>
</TABLE>   
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD>    
  </TR>  
</TABLE>  

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" WIDTH="100%">
<xsl:call-template name="last_srm"/>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="14"><IMG SRC="/i/clear.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
</TABLE>
                         
<!-- Editorials --> 
<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="2" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD>    
  </TR>     
  <TR>
  	<TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD> 
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" ALIGN="left" BGCOLOR="#FFFFFF"><FONT SIZE="3" COLOR="#000000" FACE="tahoma"><B>Coder's Point of View</B></FONT></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="8" BORDER="0"/></TD>    
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="26" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="55" ALIGN="left" CLASS="bodyText">
    <IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1"/><BR/>    
    </TD>
    <TD VALIGN="top" WIDTH="100%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>Single Round Match 80</B></FONT><BR/>
Monday, April 15, 2002<BR/>
By&#160;lbackstrom,<I>TopCoder Member</I><BR/>
<A HREF="/?t=statistics&amp;c=srm80_room1" CLASS="bodyGeneric">Room One Review</A> | 
<A HREF="/?t=statistics&amp;c=srm80_rookie" CLASS="bodyGeneric">Rookie Review</A> | 
<A HREF="/?t=statistics&amp;c=srm80_prob" CLASS="bodyGeneric">Problem Set Analysis &amp; Opinion</A><BR/>
    </TD>
     <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>   
  </TR>

  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" COLSPAN="2" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>  
    <TD VALIGN="top" COLSPAN="4"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>    
  </TR>   
</TABLE> -->
 <!-- Coder of the Week Begins -->
   <xsl:call-template name="coder_week"/>
<!-- Coder of the Week Ends -->

<xsl:call-template name="tc_updates"/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
  </TR>  
  <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="100%" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR> 
  <TR>  
    <TD VALIGN="top" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="2" BORDER="0"/></TD>    
  </TR>   
</TABLE>
<xsl:call-template name="arena"/> 

<!-- TC special promo --> 
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%" BGCOLOR="#FFFFFF">  
  <TR>  
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>    
  <TR>  
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/></TD>    
  </TR>     
  <TR>
    <TD VALIGN="top" WIDTH="8"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="26" BORDER="0"/></TD>  
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Sponsorships</B></FONT><BR/>
TopCoder offers sponsorship programs for the weekly <A HREF="/index?t=about_tc&amp;c=spons_srm" CLASS="bodyGeneric">Single Round Matches</A> as well as for 
<A HREF="/index?t=about_tc&amp;c=spons_tourny" CLASS="bodyGeneric">Tournaments</A>. Read more about our 
<A HREF="/index?t=about_tc&amp;c=spons_target" CLASS="bodyGeneric">sponsorship programs</A>.<BR/>
    </TD>
    <TD VALIGN="top" WIDTH="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="5" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="50%" ALIGN="left" CLASS="bodyText">
<FONT SIZE="2" COLOR="#000000" FACE="tahoma, verdana"><B>[TC] Employment Services</B></FONT><BR/>
TopCoder works with companies to connect them with top-rated developers. Read more about our 
<A HREF="/index?t=about_tc&amp;c=empl_tces" CLASS="bodyGeneric">employment services</A>.<BR/>
    </TD>
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>

  <TR>  
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>    
  </TR>  
  <!-- <TR>  
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" COLSPAN="3" WIDTH="100%" BGCOLOR="#43515E"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>    
    <TD VALIGN="top" WIDTH="6"><IMG SRC="/i/clear.gif" ALT="" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>  
    <TD VALIGN="top" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="4" BORDER="0"/></TD>   
  </TR>  -->   
</TABLE> 

    </TD>
  <!-- Center Column Ends -->    
    <TD BGCOLOR="#001935" VALIGN="top" CLASS="bodyText" WIDTH="244"><IMG SRC="/i/clear.gif" ALT="" WIDTH="244" HEIGHT="1" BORDER="0"/><BR/>
<A HREF="/i/sun_redir.html" target="_blank"><IMG SRC="/i/sun_promo2.gif" ALT="" WIDTH="244" HEIGHT="161" BORDER="0"/></A><BR/><BR/>
<xsl:call-template name="top_10_coders"/>
<!-- <A TARGET="_parent" HREF="/?t=about_tc&amp;c=membr_teams"><IMG SRC="/i/teams_banner.gif" WIDTH="170" HEIGHT="46" BORDER="0" HSPACE="5" VSPACE="5"/></A><BR/>
<A TARGET="_parent" HREF="/?t=jobs&amp;c=index"><IMG SRC="/i/jobs_banner2.gif" WIDTH="170" HEIGHT="46" BORDER="0" HSPACE="5" VSPACE="5"/></A> -->

 

            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                 <TR> 
                  <TD COLSPAN="3" BGCOLOR="#001935"><IMG SRC="/i/label_quick_stats_home.gif" ALT="Quick Stats" WIDTH="166" HEIGHT="17" BORDER="0"/></TD>
                </TR>
                 <TR> 
                  <TD BGCOLOR="#FFFFFF" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                </TR>                
              <TR>
                <TD ROWSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>                
                <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                <TD ROWSPAN="4"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>             
              </TR>              
              <TR>
                <TD CLASS="statText" VALIGN="top">Select a Quick Stat from the menu below.</TD>
              </TR>
              <TR>
                <TD CLASS="statText" VALIGN="top"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
              </TR>                              
               <TR>
                <TD CLASS="quickstatText" VALIGN="top">
    <!-- Quick Stat Pulldown Begins --> 
    
<xsl:call-template name="quick_stats_pulldown"/>

    <!-- Quick Stat Pulldown Ends -->
    <!-- Quick Stat Pulldown Begins --> 
    
<xsl:call-template name="quick_stats_tidbit"/>

    <!-- Quick Stat Pulldown Ends -->    
    
                </TD>
              </TR>               
            </TABLE>    
    </TD>
    <TD WIDTH="10" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
<!-- Body Area Ends -->
  </TR>   
</TABLE>
  </xsl:template>
</xsl:stylesheet>

