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
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
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
          </table>          
<xsl:call-template name="srm_dates"/>
<xsl:call-template name="calendar"/>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="intro"/>
<xsl:call-template name="countries"/>                   
      </xsl:when>      
      <xsl:when test="/TC/Task='home'">
            <!-- <xsl:call-template name="module_login"/> -->       
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
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
          </table>          
<xsl:call-template name="srm_dates"/>
<xsl:call-template name="calendar"/>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="intro"/>
<xsl:call-template name="countries"/>          
      </xsl:when>                
      <xsl:when test="/TC/Task='schedule'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <xsl:call-template name="label_row"/>          
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; Schedule:</td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="/TC/Task='schedule'">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>&#160;&#160;Monthly View</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
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
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>
      
      <xsl:when test="/TC/Task='statistics'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <xsl:call-template name="label_row"/>
            <xsl:call-template name="sched_row"/>                      
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; Statistics:</td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>&#160;&#160;Round Overview</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>&#160;&#160;Last Match Results</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>&#160;&#160;Coder Rankings</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='editorial_archive'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'srm')">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=editorial_archive</xsl:attribute>&#160;&#160;Match Editorials</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='quick_stats'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=quick_stats</xsl:attribute>&#160;&#160;Quick Stats</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="div_line_row"/>                        
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=search</xsl:attribute>&#160;&#160;Advanced Member Search</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
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
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>

      <xsl:when test="/TC/Task='search'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <xsl:call-template name="label_row"/>
            <xsl:call-template name="sched_row"/>      
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; Statistics:</td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>&#160;&#160;Round Overview</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=last_match</xsl:attribute>&#160;&#160;Last Match Results</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=coder_ratings</xsl:attribute>&#160;&#160;Coder Rankings</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='editorial_archive'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=editorial_archive</xsl:attribute>&#160;&#160;Match Editorials</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='quick_stats'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=statistics&amp;c=quick_stats</xsl:attribute>&#160;&#160;Quick Stats</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="div_line_row"/>                        
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Task='search'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?t=search</xsl:attribute>&#160;&#160;Advanced Member Search</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
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
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>

      <xsl:when test="/TC/Task='features'">             
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>Features</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="div_line_row"/>
         <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
            <xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'feat_0')">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'feat_1')">graybv_lite_bg</xsl:when>			             			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>&#160;&#160;Upcoming/Past Features</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='feat_topics'">graybv_lite_bg</xsl:when> 		
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=feat_topics</xsl:attribute>&#160;&#160;Want to Write?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
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
          </table> 
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                            
      </xsl:when>

      <xsl:when test="/TC/Task='development'">       
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">     
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/> 
            <!-- <xsl:call-template name="div_line_row"/> -->             
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; Development:</td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>             
            <!-- <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>&gt; About Us</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>                           
             -->
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>&#160;&#160;Overview</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='dev_payment'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=dev_payment</xsl:attribute>&#160;&#160;Payment Requirements</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>                                    
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><font color="#999999">&#160;Coding Competitions:</font></td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Task='about_tc'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute>&#160;&#160;Why membership?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>

            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><font color="#999999">&#160;Component Development:</font></td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='components'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=components</xsl:attribute>&#160;&#160;This Week's Component<br/>&#160;&#160;&#160;&#160;&#160;Project Winners</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>

            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_projects'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_projects</xsl:attribute>&#160;&#160;Open Component Projects</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>

            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_meth'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=comp_meth</xsl:attribute>&#160;&#160;Component Development<br/>&#160;&#160;&#160;&#160;&#160;Methodology</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/> 

<!-- Component Documentation and Samples -->
			<tr>
				<td valign="top" class="statText" bgcolor="#333333">&#160;</td>
				<td valign="middle" height="15" class="statText" bgcolor="#333333">
					<xsl:attribute name="BACKGROUND">/i/<xsl:choose>
					<xsl:when test="/TC/Command='tcs_sample_docs'">graybv_lite_bg</xsl:when>
					<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
				&#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=tcs_sample_docs</xsl:attribute>&#160;&#160;Documentation and<br/>&#160;&#160;&#160;&#160;&#160;Sample Submissions</a></td>
				<td valign="top" class="statText" bgcolor="#333333">&#160;</td>
			</tr>
			<xsl:call-template name="div_line_row"/> 

<!-- Component Documentation and Samples -->
			<tr>
				<td valign="top" class="statText" bgcolor="#333333">&#160;</td>
				<td valign="middle" height="15" class="statText" bgcolor="#333333">
					<xsl:attribute name="BACKGROUND">/i/<xsl:choose>
					<xsl:when test="/TC/Command='bonus_contest_0303'">graybv_lite_bg</xsl:when>
					<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
				&#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=bonus_contest_0303</xsl:attribute>&#160;&#160;Component Design Contest</a></td>
				<td valign="top" class="statText" bgcolor="#333333">&#160;</td>
			</tr>
			<xsl:call-template name="div_line_row"/> 
                                   
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><font color="#999999">&#160;Application Development:</font></td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='app_projects'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_projects</xsl:attribute>&#160;&#160;Open Application Projects</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='app_meth'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=app_meth</xsl:attribute>&#160;&#160;Application Project<br/>&#160;&#160;&#160;&#160;&#160;Methodology</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/>
            <xsl:call-template name="about_row"/>                        
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>                        
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                           
      </xsl:when>
      
      <xsl:when test="/TC/Task='tournaments'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <xsl:call-template name="label_row"/>          
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/> 
            <xsl:call-template name="dev_row"/>                       
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; <a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute>Tournaments:</a></td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
            <xsl:when test="starts-with(/TC/Command,'tccc03_')">graybv_lite_bg</xsl:when>									
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tccc03_sched</xsl:attribute>&#160;&#160;'03 [TC] Collegiate Challenge</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'invit02')">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=invit02_champ</xsl:attribute>&#160;&#160;'02 [TC] Invitational</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'tourny_s')">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'tourny_r')">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'tccc02')">graybv_lite_bg</xsl:when>									
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_sched</xsl:attribute>&#160;&#160;'02 [TC] Collegiate Challenge</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>   
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'tourny_tci_01')">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_tci_01</xsl:attribute>&#160;&#160;'01 [TC] Invitational</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>   
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'tourny_tccc_01')">graybv_lite_bg</xsl:when>			
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_tccc_01</xsl:attribute>&#160;&#160;'01 [TC] Collegiate Challenge</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <!-- <xsl:call-template name="new_mbr_row"/> -->            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>            
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>
                  
      <xsl:when test="/TC/Task='support'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <xsl:call-template name="label_row"/>          
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <tr> 
              <td valign="top" background="/i/graybv_lite_bg.gif" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="15" class="statTextBig" background="/i/graybv_lite_bg.gif" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; Support/FAQs:</td>
              <td valign="top" background="/i/graybv_lite_bg.gif" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>&#160;&#160;General FAQs</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BGCOLOR"><xsl:choose>
			<xsl:when test="/TC/Command='comp_faq'">666666</xsl:when>
			<xsl:otherwise>333333</xsl:otherwise></xsl:choose></xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_faq</xsl:attribute>&#160;&#160;Competition FAQ</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='form_faq'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=form_faq</xsl:attribute>&#160;&#160;Forms W-9 &amp; W-8BEN FAQ</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>             
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='divisions'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=divisions</xsl:attribute>&#160;&#160;Divisions</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>             
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_preview'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_preview</xsl:attribute>&#160;&#160;Competition Preview</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='getting_started'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=getting_started</xsl:attribute>&#160;&#160;Getting Started</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>                        
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_process'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_process</xsl:attribute>&#160;&#160;Competition Process</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='ratings'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=ratings</xsl:attribute>&#160;&#160;Ratings Overview</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>             
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='editor_info'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=editor_info</xsl:attribute>&#160;&#160;Editor Information</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>             
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='software_req'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=software_req</xsl:attribute>&#160;&#160;Software Requirements</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='rules_qual'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=rules_qual</xsl:attribute>&#160;&#160;Rules &amp; Qualification</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='guide'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=guide</xsl:attribute>&#160;&#160;Visual Guide</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>             
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='charities'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=charities</xsl:attribute>&#160;&#160;Charity Donations</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>                         
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='sample_problems'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=sample_problems</xsl:attribute>&#160;&#160;Sample Problem Statements</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>            
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>            
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                   
      </xsl:when>      
      <!-- about us and press nav -->
      <xsl:when test="/TC/Task='about_tc'">       
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">     
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
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160; About Us:</td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>             
            <!-- <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>&gt; About Us</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>                           
             -->
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>&#160;&#160;Overview</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><font color="#666666">&#160;for Members:</font></td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_whyjoin'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute>&#160;&#160;Why membership?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_ratings'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_ratings</xsl:attribute>&#160;&#160;What are ratings?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_divisions'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_divisions</xsl:attribute>&#160;&#160;What are divisions?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_teams'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute>&#160;&#160;What are teams?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_match'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_match</xsl:attribute>&#160;&#160;What is a match?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_tournament'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_tournament</xsl:attribute>&#160;&#160;What is a tournament?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_referrals'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_referrals</xsl:attribute>&#160;&#160;What are referrals?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_comm'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_comm</xsl:attribute>&#160;&#160;What is the community?</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_comm'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>&#160;&#160;Job postings</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>

            
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><font color="#666666">&#160;for Sponsors:</font></td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='spons_srm'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute>&#160;&#160;Single Round Match Package</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='spons_tourny'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute>&#160;&#160;Tournament Package</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
                        
            <tr> 
              <td valign="top" bgcolor="#333333"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#333333"><font color="#666666">&#160;for Employers:</font></td>
              <td valign="top" bgcolor="#333333"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='nopagehere'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>&#160;&#160;[TC] Employment Services</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='empl_difference'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=empl_difference</xsl:attribute>&#160;&#160;Competition vs Certification</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>                        
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                           
      </xsl:when> 
      
      <xsl:when test="/TC/Task='news_events'">             
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
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
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>    
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='articles'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'article')">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=articles</xsl:attribute>&#160;&#160;Articles</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">graybv_lite_bg</xsl:when>
			<xsl:when test="starts-with(/TC/Command,'pr')">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>&#160;&#160;Press Releases</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>                             
            <xsl:call-template name="contacts_row"/>          
          </table> 
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                            
      </xsl:when>
      
      <xsl:when test="/TC/Task='contacts'">             
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
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
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contacts</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>        
          </table> 
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                            
      </xsl:when>       
<!-- about us and press nav ends --> 

      <xsl:when test="/TC/Command='terms'">
            <!-- <xsl:call-template name="module_login"/> -->       
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <xsl:call-template name="read_row"/> 
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333" background="/i/graybv_lite_bg.gif">
              &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>&#160;&#160;Terms, Revisions</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
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
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                    
      </xsl:when>
      
      <xsl:when test="/TC/Command='privacy'">
            <!-- <xsl:call-template name="module_login"/> -->       
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <xsl:call-template name="read_row"/> 
            <xsl:call-template name="terms_row"/>
            <xsl:call-template name="div_line_row"/>                         
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333" background="/i/graybv_lite_bg.gif">
              &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>&#160;&#160;Privacy Policy</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
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
          </table>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>         
      </xsl:when>

      <xsl:when test="/TC/Task='tces'">
            <!-- <xsl:call-template name="module_login"/> -->       
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
            <tr> 
              <td valign="top" bgcolor="#000000"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#000000"><img alt="" width="10" height="10" src="/i/arrow_white_down.gif" border="0"/><font color="#FFFFFF">&#160;<a href="/?&amp;t=tces&amp;c=index" class="statTextBig">[TC] Employment Services</a></font></td>
              <td valign="top" bgcolor="#000000"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='nopagehere'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute>&#160;&#160;Jobs for Members</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>
            <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='hiring'">graybv_lite_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=hiring</xsl:attribute>&#160;&#160;Hiring for Employers</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
            <xsl:call-template name="div_line_row"/>            
            <tr> 
              <td valign="top" bgcolor="#666666"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
              <td valign="middle" height="18" class="statTextBig" bgcolor="#666666"><font color="#000000">&#160;[TCES] Reporting</font></td>
              <td valign="top" bgcolor="#666666"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
            </tr>
			<tr>
			  <td valign="top" bgcolor="#666666" class="subNav" align="right">&#160;</td>
			  <td valign="top" height="15" bgcolor="#666666" class="statText" width="100%">Employers <a href="/tces/tces?task=LoginTask" class="statText"><b>login</b></a> to access the [TCES] reporting application.<br/></td>
			  <td valign="top" bgcolor="#666666" class="statText">&#160;</td>
			</tr>
            <tr><td colspan="2" bgcolor="#666666"><img src="/i/clear.gif" width="1" height="1" border="0" vspace="2"/></td><td width="1" bgcolor="#666666"><img src="/i/clear.gif" width="1" height="1" border="0"/></td></tr>            
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
          </table>
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
          <table width="170" bgcolor="#000000" cellspacing="0" cellpadding="0" border="0">
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
          </table>          
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
            <tr><td valign="top" colspan="3" bgcolor="#000000"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  </xsl:template>
  
  <xsl:template name="left_nav_btm_row">
            <img alt="" width="170" height="69" src="/i/left_nav_btm.gif" border="0"/><br/><br/><img src="/i/logo_ghosted_bracket.gif" width="160" height="77" alt="[ TopCoder ]" vspace="10" border="0"/>
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
    <tr> 
      <td valign="top" bgcolor="#000000"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
      <td valign="middle" height="18" class="statTextBig" bgcolor="#000000">What's INSIDE:</td>
      <td valign="top" bgcolor="#000000"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
    </tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  </xsl:template>
  
  <xsl:template name="read_row">
    <!-- <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="8" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR> -->
    <tr> 
      <td valign="top" bgcolor="#000000"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
      <td valign="middle" height="18" class="statTextBig" bgcolor="#000000">Please READ:</td>
      <td valign="top" bgcolor="#000000"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
    </tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  </xsl:template>  
  

  <xsl:template name="sched_row">  
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>Schedule</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>   
  </xsl:template>

  <xsl:template name="stats_row"> 
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Statistics</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>        
  </xsl:template>

  <xsl:template name="feat_row">
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=features&amp;c=index</xsl:attribute>Features</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>    
  </xsl:template>
  
  <xsl:template name="dev_row">
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=development&amp;c=index</xsl:attribute>Development</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>    
  </xsl:template>
  
  <xsl:template name="tourney_row">
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=tourny_index</xsl:attribute>Tournaments</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>    
  </xsl:template> 
  
  <xsl:template name="rtables_row">
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/index.jsp</xsl:attribute>Round Tables</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>    
  </xsl:template>
  
  <xsl:template name="rules_row">
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>Support/FAQs</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>  
  </xsl:template> 
   
  <xsl:template name="reg_row">
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/reg/index.jsp</xsl:attribute>Register</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>  
  </xsl:template> 
   
  <xsl:template name="new_mbr_row">
    <tr><td valign="top" class="statText">&#160;</td><td valign="middle" height="15" class="statText"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=new_mbr&amp;c=index</xsl:attribute>New Member Tour</a></td><td valign="top" class="statText">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>  
  </xsl:template>
  
  <xsl:template name="terms_row">  
    <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">&#160;&#160;&#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=terms</xsl:attribute>Terms, Revisions</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>   
  </xsl:template>
  
  <xsl:template name="privacy_row">  
    <tr><td valign="top" class="statText" bgcolor="#333333">&#160;</td><td valign="middle" height="15" class="statText" bgcolor="#333333">&#160;&#160;&#160;&#160;&#160;<a class="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=&amp;c=privacy</xsl:attribute>Privacy Policy</a></td><td valign="top" class="statText" bgcolor="#333333">&#160;</td></tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>   
  </xsl:template>      
  
<!-- about us and press nav -->
  <xsl:template name="corp_label_row">
    <tr> 
      <td valign="top" bgcolor="#000000"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
      <td valign="middle" height="18" class="statTextBig" bgcolor="#000000"><font color="#999999">[TC] Corporate</font></td>
      <td valign="top" bgcolor="#000000"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
    </tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  </xsl:template> 
  
  <xsl:template name="about_row">
    <tr> 
      <td valign="top" bgcolor="#000000"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
      <td valign="middle" height="15" class="statTextBig" bgcolor="#000000"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About Us</a></td>
      <td valign="top" bgcolor="#000000"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
    </tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  </xsl:template>  
  
  <xsl:template name="press_row">
    <tr> 
      <td valign="top" bgcolor="#000000"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
      <td valign="middle" height="15" class="statTextBig" bgcolor="#000000"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</a></td>
      <td valign="top" bgcolor="#000000"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
    </tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  </xsl:template>
  
  <xsl:template name="contacts_row">
    <tr> 
      <td valign="top" bgcolor="#000000"><img alt="" width="6" height="1" src="/i/clear.gif" border="0"/></td>
      <td valign="middle" height="15" class="statTextBig" bgcolor="#000000"><img alt="" width="10" height="10" src="/i/arrow_white.gif" border="0"/>&#160;<a class="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contacts</a></td>
      <td valign="top" bgcolor="#000000"><img alt="" width="8" height="1" src="/i/clear.gif" border="0"/></td>
    </tr>
    <tr><td valign="top" colspan="3" bgcolor="#333333"><img alt="" width="1" height="1" src="/i/clear.gif" border="0"/></td></tr>
  </xsl:template>  
        
<!-- Nav ends -->   

</xsl:stylesheet>
