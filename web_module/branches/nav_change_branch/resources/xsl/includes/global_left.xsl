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
            <xsl:call-template name="new_mbr_row"/>            
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
            <xsl:call-template name="new_mbr_row"/>            
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
			<xsl:when test="/TC/Command='index'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute> - Monthly View</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=year_02</xsl:attribute> - 2002 at a Glance</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <xsl:call-template name="new_mbr_row"/>            
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
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; Support/FAQs:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute> - General FAQs</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_faq'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_faq</xsl:attribute> - Competition FAQ</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='form_faq'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=form_faq</xsl:attribute> - Forms W-9 &amp; W-8BEN FAQ</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='divisions'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=divisions</xsl:attribute> - Divisions</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_preview'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_preview</xsl:attribute> - Competition Preview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='getting_started'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=getting_started</xsl:attribute> - Getting Started</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>                        
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='comp_process'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=comp_process</xsl:attribute> - Competition Process</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='ratings'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=ratings</xsl:attribute> - Ratings Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='editor_info'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=editor_info</xsl:attribute> - Editor Information</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='software_req'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=software_reg</xsl:attribute> - Software Requirements</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='rules_qual'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=rules_qual</xsl:attribute> - Rules &amp; Qualification</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='guide'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=guide</xsl:attribute> - Visual Guide</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>             
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='charities'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=charities</xsl:attribute> - Charity Donations</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>                         
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='sample_problems'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=sample_problems</xsl:attribute> - Sample Problem Statements</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
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
            <!-- <xsl:call-template name="member_features"/> -->      
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">     
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>            
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <xsl:call-template name="new_mbr_row"/>            
            <xsl:call-template name="corp_label_row"/>
            <xsl:call-template name="div_line_row"/>             
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160; About Us:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>             
            <!-- <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>&gt; About Us</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>                           
             -->
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute> - Overview</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>            
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#666666">&#160;for Members:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_whyjoin'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute> - Why membership?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_ratings'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_ratings</xsl:attribute> - What are ratings?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_divisions'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_divisions</xsl:attribute> - What are divisions?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_teams'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute> - What are teams?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_match'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_match</xsl:attribute> - What is a match?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_tournament'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_tournament</xsl:attribute> - What is a tournament?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_referrals'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_referrals</xsl:attribute> - What are referrals?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_comm'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_comm</xsl:attribute> - What is the community?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_comm'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute> - Job postings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>

            
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#666666">&#160;for Sponsors:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='spons_srm'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute> - Single Round Match Package</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='spons_tourny'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute> - Tournament Package</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
                        
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333"><FONT COLOR="#666666">&#160;for Employers:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='nopagehere'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute> - [TC] Employment Services</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='empl_difference'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=empl_difference</xsl:attribute> - Competition vs Certification</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>                        
          </TABLE>
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                           
      </xsl:when> 
      
      <xsl:when test="/TC/Task='news_events'">
            <!-- <xsl:call-template name="member_features"/> -->              
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="feat_row"/>            
            <xsl:call-template name="dev_row"/>             
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <xsl:call-template name="new_mbr_row"/>            
            <xsl:call-template name="corp_label_row"/>           
            <xsl:call-template name="about_row"/>            
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white_down.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>    
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='articles'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=articles</xsl:attribute> - Articles</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute> - Press Releases</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>   
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#333333">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='features'">top_bar_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=features</xsl:attribute> - Features</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#333333">&#160;</TD></TR>
            <xsl:call-template name="div_line_row"/>                             
            <xsl:call-template name="contacts_row"/>          
          </TABLE> 
<xsl:call-template name="simple_search"/>
<xsl:call-template name="left_nav_btm_row"/>                            
      </xsl:when> 
<!-- about us and press nav ends --> 
                                         
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
            <xsl:call-template name="dev_row"/>            
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <xsl:call-template name="new_mbr_row"/>            
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
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=index</xsl:attribute>Tournaments</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template> 
  
  <xsl:template name="rtables_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/index</xsl:attribute>Round Tables</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template>
  
  <xsl:template name="rules_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>Support/FAQs</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
  </xsl:template> 
  
  <xsl:template name="new_mbr_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=new_mbr&amp;c=index</xsl:attribute>New Member Tour</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
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
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About Us</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>  
  
  <xsl:template name="press_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>
  
  <xsl:template name="contacts_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000"><IMG ALT="" WIDTH="10" HEIGHT="10" SRC="/i/arrow_white.gif" BORDER="0"/>&#160;<A CLASS="statTextBig"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contacts</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>  
        
<!-- Nav ends -->   

</xsl:stylesheet>
