<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">  
  <xsl:import href="../includes/modules/calendar.xsl"/> 
  <xsl:import href="../includes/modules/simple_search.xsl"/> 
  <xsl:import href="../includes/modules/corp_nav.xsl"/>    
  <xsl:import href="../includes/modules/intro.xsl"/> 
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/my_stats.xsl"/>     
  <xsl:template name="global_left">
    <xsl:choose>
      <xsl:when test="/TC/Task='public_home'">
            <!-- <xsl:call-template name="module_login"/> -->         
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>
          </TABLE>          
<xsl:call-template name="srm_dates"/>
<xsl:call-template name="calendar"/>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="intro"/>
<xsl:call-template name="countries"/>                   
      </xsl:when>      
      <xsl:when test="/TC/Task='home'">
            <!-- <xsl:call-template name="module_login"/> -->       
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>
          </TABLE>          
<xsl:call-template name="srm_dates"/>
<xsl:call-template name="calendar"/>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="intro"/>
<xsl:call-template name="countries"/>          
      </xsl:when>                
      <xsl:when test="/TC/Task='schedule'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>          
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; Schedule:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="/TC/Task='schedule'">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>&#160;&#160;Monthly View</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <!-- <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=year_02</xsl:attribute>&#160;&#160;2002 at a Glance</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR> -->
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>            
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>
      
      <xsl:when test="/TC/Task='statistics'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>
            <xsl:call-template name="sched_row"/>                      
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; Statistics:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='editorial_archive'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'srm')">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=editorial_archive</xsl:attribute>&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='quick_stats'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=quick_stats</xsl:attribute>&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="div_line_row"/>                        
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=search</xsl:attribute>&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>            
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>

      <xsl:when test="/TC/Task='search'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>
            <xsl:call-template name="sched_row"/>      
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; Statistics:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>&#160;&#160;Round Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>&#160;&#160;Last Match Results</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>&#160;&#160;Coder Rankings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='editorial_archive'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=editorial_archive</xsl:attribute>&#160;&#160;Match Editorials</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='quick_stats'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=quick_stats</xsl:attribute>&#160;&#160;Quick Stats</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="div_line_row"/>                        
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Task='search'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=search</xsl:attribute>&#160;&#160;Advanced Member Search</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>            
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>

      <xsl:when test="/TC/Task='features'">             
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>Features</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="div_line_row"/>
         <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
            <xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'feat_0')">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'feat_1')">graybv_lite_bg</xsl:when>			             			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>&#160;&#160;Upcoming/Past Features</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='feat_topics'">graybv_lite_bg</xsl:when> 		
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_topics</xsl:attribute>&#160;&#160;Want to Write?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <xsl:call-template name="dev_row"/>                  
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/>           
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>                        
            <xsl:call-template name="contacts_row"/>        
          </TABLE> 
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                            
      </xsl:when>

      <xsl:when test="/TC/Task='development'">       
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">     
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/> 
            <!-- <xsl:call-template name="div_line_row"/> -->             
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; Development:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>             
            <!-- <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>&gt; About Us</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>                           
             -->
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>&#160;&#160;Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='dev_payment'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=dev_payment</xsl:attribute>&#160;&#160;Payment Requirements</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>                                    
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#999999">&#160;Coding Competitions:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Task='about_tc'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute>&#160;&#160;Why membership?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>

            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#999999">&#160;Component Development:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='components'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=components</xsl:attribute>&#160;&#160;This Week's Component<BR/>&#160;&#160;&#160;&#160;&#160;Project Winners</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_projects'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_projects</xsl:attribute>&#160;&#160;Open Component Projects</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_meth'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_meth</xsl:attribute>&#160;&#160;Component Development<BR/>&#160;&#160;&#160;&#160;&#160;Methodology</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/> 
                                   
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#999999">&#160;Application Development:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='app_projects'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_projects</xsl:attribute>&#160;&#160;Open Application Projects</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='app_meth'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_meth</xsl:attribute>&#160;&#160;Application Project<BR/>&#160;&#160;&#160;&#160;&#160;Methodology</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/>
            <xsl:call-template name="about_row"/>                        
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>                        
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                           
      </xsl:when>
      
      <xsl:when test="/TC/Task='tournaments'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>          
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/> 
            <xsl:call-template name="dev_row"/>                       
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; <A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute>Tournaments:</A></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="starts-with(/TC/Command,'tourny_s')">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'tourny_r')">graybv_lite_bg</xsl:when>						
			<xsl:when test="starts-with(/TC/Command,'tccc02')">graybv_lite_bg</xsl:when>									
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_sched</xsl:attribute>&#160;&#160;'02 [TC] Collegiate Challenge</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'invit02')">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=invit02_champ</xsl:attribute>&#160;&#160;'02 [TC] Invitational</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>   
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'tourny_tccc_01')">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_tccc_01</xsl:attribute>&#160;&#160;'01 [TC] Collegiate Challenge</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>   
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'tourny_tci_01')">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_tci_01</xsl:attribute>&#160;&#160;'01 [TC] Invitational</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>            
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>
                  
      <xsl:when test="/TC/Task='support'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>          
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <TR> 
              <TD VALIGN="top" BACKGROUND="/i/graybv_lite_bg.gif" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="15" CLASS="statTextBig" BACKGROUND="/i/graybv_lite_bg.gif" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; Support/FAQs:</TD>
              <TD VALIGN="top" BACKGROUND="/i/graybv_lite_bg.gif" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>&#160;&#160;General FAQs</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BGCOLOR"><xsl:choose>
			<xsl:when test="/TC/Command='comp_faq'">666666</xsl:when>
			<xsl:otherwise>333333</xsl:otherwise></xsl:choose></xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_faq</xsl:attribute>&#160;&#160;Competition FAQ</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='form_faq'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=form_faq</xsl:attribute>&#160;&#160;Forms W-9 &amp; W-8BEN FAQ</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='divisions'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=divisions</xsl:attribute>&#160;&#160;Divisions</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_preview'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_preview</xsl:attribute>&#160;&#160;Competition Preview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='getting_started'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=getting_started</xsl:attribute>&#160;&#160;Getting Started</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>                        
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_process'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_process</xsl:attribute>&#160;&#160;Competition Process</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='ratings'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=ratings</xsl:attribute>&#160;&#160;Ratings Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='editor_info'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=editor_info</xsl:attribute>&#160;&#160;Editor Information</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='software_req'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=software_req</xsl:attribute>&#160;&#160;Software Requirements</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='rules_qual'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=rules_qual</xsl:attribute>&#160;&#160;Rules &amp; Qualification</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='guide'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=guide</xsl:attribute>&#160;&#160;Visual Guide</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='charities'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=charities</xsl:attribute>&#160;&#160;Charity Donations</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>                         
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='sample_problems'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=sample_problems</xsl:attribute>&#160;&#160;Sample Problem Statements</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>            
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>      
      <!-- about us and press nav -->
      <xsl:when test="/TC/Task='about_tc'">       
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">     
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>            
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <!-- <xsl:call-template name="div_line_row"/> -->             
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; About Us:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>             
            <!-- <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>&gt; About Us</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>                           
             -->
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>&#160;&#160;Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#666666">&#160;for Members:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_whyjoin'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute>&#160;&#160;Why membership?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_ratings'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_ratings</xsl:attribute>&#160;&#160;What are ratings?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_divisions'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_divisions</xsl:attribute>&#160;&#160;What are divisions?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_teams'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute>&#160;&#160;What are teams?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_match'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_match</xsl:attribute>&#160;&#160;What is a match?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_tournament'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_tournament</xsl:attribute>&#160;&#160;What is a tournament?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_referrals'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_referrals</xsl:attribute>&#160;&#160;What are referrals?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_comm'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_comm</xsl:attribute>&#160;&#160;What is the community?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_comm'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>&#160;&#160;Job postings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>

            
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#666666">&#160;for Sponsors:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='spons_srm'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>&#160;&#160;Single Round Match Package</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='spons_tourny'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>&#160;&#160;Tournament Package</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
                        
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#666666">&#160;for Employers:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='nopagehere'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>&#160;&#160;[TC] Employment Services</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='empl_difference'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=empl_difference</xsl:attribute>&#160;&#160;Competition vs Certification</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>                        
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                           
      </xsl:when> 
      
      <xsl:when test="/TC/Task='news_events'">             
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/>           
            <xsl:call-template name="about_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>    
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='articles'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'article')">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=articles</xsl:attribute>&#160;&#160;Articles</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'pr')">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>&#160;&#160;Press Releases</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>                             
            <xsl:call-template name="contacts_row"/>          
          </TABLE> 
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                            
      </xsl:when>
      
      <xsl:when test="/TC/Task='contacts'">             
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/>           
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>                        
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contacts</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>        
          </TABLE> 
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                            
      </xsl:when>       
<!-- about us and press nav ends --> 

      <xsl:when test="/TC/Command='terms'">
            <!-- <xsl:call-template name="module_login"/> -->       
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="read_row"/> 
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333" BACKGROUND="/i/graybv_lite_bg.gif">
              &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>&#160;&#160;Terms, Revisions</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="privacy_row"/>            
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                    
      </xsl:when>
      
      <xsl:when test="/TC/Command='privacy'">
            <!-- <xsl:call-template name="module_login"/> -->       
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="read_row"/> 
            <xsl:call-template name="terms_row"/>
            <xsl:call-template name="div_line_row"/>                         
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333" BACKGROUND="/i/graybv_lite_bg.gif">
              &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>&#160;&#160;Privacy Policy</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>         
      </xsl:when>

      <xsl:when test="/TC/Task='tces'">
            <!-- <xsl:call-template name="module_login"/> -->       
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <TR> 
              <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/><FONT COLOR="#FFFFFF">&#160;<A HREF="/?&amp;t=tces&amp;c=index" CLASS="statTextBig">[TC] Employment Services</A></FONT></TD>
              <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='nopagehere'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>&#160;&#160;Jobs for Members</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='hiring'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=hiring</xsl:attribute>&#160;&#160;Hiring for Employers</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR> 
              <TD VALIGN="top" BGCOLOR="#666666"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#666666"><FONT COLOR="#000000">&#160;[TCES] Reporting</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#666666"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
			<TR>
			  <TD VALIGN="top" BGCOLOR="#666666" CLASS="subNav" ALIGN="right">&#160;</TD>
			  <TD VALIGN="top" HEIGHT="15" BGCOLOR="#666666" CLASS="statText" WIDTH="100%">Employers <A HREF="/tces/tces?task=LoginTask" CLASS="statText"><B>login</B></A> to access the [TCES] reporting application.<BR/></TD>
			  <TD VALIGN="top" BGCOLOR="#666666" CLASS="statText">&#160;</TD>
			</TR>
            <TR><TD COLSPAN="2" BGCOLOR="#666666"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0" VSPACE="2"/></TD><TD WIDTH="1" BGCOLOR="#666666"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>            
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>         
      </xsl:when>                 

                                         
      <xsl:otherwise>      
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                     <!-- <xsl:call-template name="my_stats"/> -->             
                  </xsl:when>                  
                  <xsl:otherwise>
                     <!-- <xsl:call-template name="module_login"/> -->
                  </xsl:otherwise>
                </xsl:choose>     
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>            
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>
          </TABLE>          
<xsl:call-template name="srm_dates"/>
<xsl:call-template name="calendar"/>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="intro"/>
<xsl:call-template name="countries"/> 
      </xsl:otherwise>
    </xsl:choose>
   <!-- <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
    <TR> 
      <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="10" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>    
   </TABLE>  -->  
  </xsl:template>






<!-- Navigation Rows Below -->
  <xsl:template name="div_line_row">
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>
  
  <xsl:template name="left_nav_btm_row">
            <IMG ALT="" WIDTH="170" HEIGHT="69" SRC="/i/left_nav_btm.gif" BORDER="0"/><BR/><BR/><IMG SRC="/i/logo_ghosted_bracket.gif" WIDTH="160" HEIGHT="77" ALT="[ TopCoder ]" VSPACE="10" BORDER="0"/>
  </xsl:template>
  
  <xsl:template name="member_features">
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                     <xsl:call-template name="my_stats"/>             
                  </xsl:when>                  
                  <xsl:otherwise>                     
                  </xsl:otherwise>
                </xsl:choose> 
  </xsl:template>

  <xsl:template name="label_row">
    <!-- <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="8" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> -->
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">What's INSIDE:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>
  
  <xsl:template name="read_row">
    <!-- <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="8" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> -->
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">Please READ:</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>  
  

  <xsl:template name="sched_row">  
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
  </xsl:template>

  <xsl:template name="stats_row"> 
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Statistics</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>        
  </xsl:template>

  <xsl:template name="feat_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>Features</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template>
  
  <xsl:template name="dev_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Development</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template>
  
  <xsl:template name="tourney_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute>Tournaments</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template> 
  
  <xsl:template name="rtables_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/index.jsp</xsl:attribute>Round Tables</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template>
  
  <xsl:template name="rules_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>Support/FAQs</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
  </xsl:template> 
   
  <xsl:template name="reg_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Register</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
  </xsl:template> 
   
  <xsl:template name="new_mbr_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=new_mbr&amp;c=index</xsl:attribute>New Member Tour</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
  </xsl:template>
  
  <xsl:template name="terms_row">  
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>Terms, Revisions</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
  </xsl:template>
  
  <xsl:template name="privacy_row">  
    <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">&#160;&#160;&#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>Privacy Policy</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
  </xsl:template>      
  
<!-- about us and press nav -->
  <xsl:template name="corp_label_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000"><FONT COLOR="#999999">[TC] Corporate</FONT></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template> 
  
  <xsl:template name="about_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="15" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About Us</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>  
  
  <xsl:template name="press_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="15" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>
  
  <xsl:template name="contacts_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="15" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contacts</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>  
        
<!-- Nav ends -->   

</xsl:stylesheet>
