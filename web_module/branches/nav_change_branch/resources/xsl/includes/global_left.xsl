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
            <xsl:call-template name="member_features"/>          
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
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
            <xsl:call-template name="member_features"/>      
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
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
      <xsl:when test="/TC/Task=''">
            <xsl:call-template name="member_features"/>      
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/> 
            <xsl:call-template name="sched_row"/>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
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
            <xsl:call-template name="member_features"/>              
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>          
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333">&gt; Schedule:</TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute> - Monthly View</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='year_02'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=year_02</xsl:attribute> - 2002 at a Glance</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <xsl:call-template name="corp_label_row"/> 
            <xsl:call-template name="about_row"/>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>            
          </TABLE>         
      </xsl:when>
      <!-- about us and press nav -->
      <xsl:when test="/TC/Task='about_tc'"> 
            <xsl:call-template name="member_features"/>      
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">     
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <xsl:call-template name="corp_label_row"/>           
            <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>&gt;&#160;About Us</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333" ALIGN="center"> <FONT COLOR="#CCCCCC">for Members:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_whyjoin'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_whyjoin</xsl:attribute> - Why membership?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_ratings'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_ratings</xsl:attribute> - What are ratings?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_divisions'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_divisions</xsl:attribute> - What are divisions?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_teams'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_teams</xsl:attribute> - What are teams?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_match'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_match</xsl:attribute> - What is a match?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_tournament'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_tournament</xsl:attribute> - What is a tournament?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_referrals'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_referrals</xsl:attribute> - What are referrals?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_comm'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=membr_comm</xsl:attribute> - What is the community?</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='membr_comm'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute> - Job postings</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>

            
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333" ALIGN="center"> <FONT COLOR="#CCCCCC">for Sponsors:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='spons_srm'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_srm</xsl:attribute> - Single Round Match Package</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='spons_tourny'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=spons_tourny</xsl:attribute> - Tournament Package</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
                        
            <TR> 
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
              <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#333333" ALIGN="center"> <FONT COLOR="#CCCCCC">for Employers:</FONT></TD>
              <TD VALIGN="top" BGCOLOR="#333333"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='nopagehere'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tces&amp;c=index</xsl:attribute> - [TC] Employment Services</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='empl_difference'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=empl_difference</xsl:attribute> - Competition vs Certification</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <xsl:call-template name="press_row"/>
            <xsl:call-template name="contacts_row"/>                        
          </TABLE>                 
      </xsl:when> 
      
      <xsl:when test="/TC/Task='news_events'">
            <xsl:call-template name="member_features"/>              
          <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
            <xsl:call-template name="label_row"/>            
            <xsl:call-template name="sched_row"/>            
            <xsl:call-template name="stats_row"/>
            <xsl:call-template name="tourney_row"/>
            <xsl:call-template name="rtables_row"/> 
            <xsl:call-template name="rules_row"/>
            <xsl:call-template name="corp_label_row"/>           
            <xsl:call-template name="about_row"/>            
            <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>&gt;&#160;Press Room</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='articles'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=articles</xsl:attribute> - Articles</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='index'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute> - Press Releases</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
            <TR><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">
            <xsl:attribute name="BACKGROUND">/i/<xsl:choose>
			<xsl:when test="/TC/Command='features'">orangebv_bg</xsl:when>
			<xsl:otherwise>clear</xsl:otherwise></xsl:choose>.gif</xsl:attribute>
            &#160;&#160;&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=features</xsl:attribute> - Features</A></TD><TD VALIGN="top" CLASS="statText" BGCOLOR="#666666">&#160;</TD></TR>
            <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>                             
            <xsl:call-template name="contacts_row"/>          
          </TABLE>                   
      </xsl:when> 
<!-- about us and press nav ends -->                                          
      <xsl:otherwise>      
         Invalid task. 
      </xsl:otherwise>
    </xsl:choose>
   <!-- <TABLE WIDTH="170" BGCOLOR="#000000" CELLSPACING="0" CELLPADDING="0" BORDER="0">
    <TR> 
      <TD VALIGN="top" COLSPAN="3" BGCOLOR="#000000"><IMG ALT="" WIDTH="1" HEIGHT="10" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>    
   </TABLE>  -->  
  </xsl:template>


<!-- Navigation Rows Below -->
  <xsl:template name="member_features">
                <xsl:choose>
                  <xsl:when test="/TC/LoggedIn='true'">
                     <xsl:call-template name="my_stats"/>             
                  </xsl:when>                  
                  <xsl:otherwise></xsl:otherwise>
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
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=schedule&amp;c=index</xsl:attribute>Schedule</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>   
  </xsl:template>

  <xsl:template name="stats_row"> 
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/stat?&amp;c=round_overview</xsl:attribute>Statistics</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>        
  </xsl:template>

  <xsl:template name="news_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template>
  
  <xsl:template name="tourney_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=tournaments&amp;c=index</xsl:attribute>Tournaments</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template> 
  
  <xsl:template name="rtables_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/rtables/index</xsl:attribute>Round Tables</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>    
  </xsl:template>
  
  <xsl:template name="rules_row">
    <TR><TD VALIGN="top" CLASS="statText">&#160;</TD><TD VALIGN="middle" HEIGHT="15" CLASS="statText">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=support&amp;c=index</xsl:attribute>Rules/FAQs</A></TD><TD VALIGN="top" CLASS="statText">&#160;</TD></TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>  
  </xsl:template> 
  
<!-- about us and press nav -->
  <xsl:template name="corp_label_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">[TC] Corporate</TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template> 
  
  <xsl:template name="about_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=about_tc&amp;c=index</xsl:attribute>About Us</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>  
  
  <xsl:template name="press_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=news_events&amp;c=index</xsl:attribute>Press Room</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>
  
  <xsl:template name="contacts_row">
    <TR> 
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="6" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
      <TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BGCOLOR="#000000">&#160;<A CLASS="statText"><xsl:attribute name="HREF">http://<xsl:value-of select="/TC/Host"/>/?&amp;t=contacts&amp;c=index</xsl:attribute>Contacts</A></TD>
      <TD VALIGN="top" BGCOLOR="#000000"><IMG ALT="" WIDTH="8" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD>
    </TR>
    <TR><TD VALIGN="top" COLSPAN="3" BGCOLOR="#333333"><IMG ALT="" WIDTH="1" HEIGHT="1" SRC="/i/clear.gif" BORDER="0"/></TD></TR>
  </xsl:template>  
        
<!-- Nav ends -->   

</xsl:stylesheet>
