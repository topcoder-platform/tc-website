<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_invit02_links.xsl"/>  
  <xsl:import href="../includes/modules/invit02_rule_links.xsl"/> 
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="180" VALIGN="top">
              <!-- Left Column Include Begins -->  
              <!-- Global Seconday Nav Begins -->  
              <xsl:call-template name="global_left"/>
              <!-- Global Seconday Nav Ends -->      
              <!-- Left Column Include Ends -->          
            </TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">tournaments_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->        
        <xsl:call-template name="tournament_invit02_links"/>
  <!-- Coder of the Week Pulldown Ends -->
  <BR/><BR/>
                    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
                    <TR>
                      <TD COLSPAN="3" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Online Schedule</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" WIDTH="30%" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Online Round #1<BR/>
                      </TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="35%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=tourney_advancers&amp;rds=4324" CLASS="statTextBig">Advancers</A></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="35%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=tourney_advancers&amp;rds=4325" CLASS="statTextBig">Advancers</A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=invit02_pt1" CLASS="statTextBig">Part 1 Seeding</A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=invit02_pt2" CLASS="statTextBig">Part 2 Seeding</A></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">1,024</TD>
                      <TD ALIGN="center" CLASS="statText">512</TD>
                      <TD ALIGN="center" CLASS="statText">512</TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">64<BR/>192</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">64<BR/>192</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                                            
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD VALIGN="top" CLASS="statText">Tues. Oct. 8th<BR/>Registration: 6:30 PM - 9:25 PM EDT<BR/>Start: 9:30 EDT</TD>
                      <TD VALIGN="top" CLASS="statText">Thurs. Oct. 10th<BR/>Registration: 6:30 PM - 9:25 EDT<BR/>Start: 9:30 EDT</TD>
                    </TR>
                                                          
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Online Round #2<BR/>
                      </TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=tourney_advancers&amp;rds=4335" CLASS="statTextBig">Advancers</A> | <A HREF="/index?t=tournaments&amp;c=invit02_breakdown" CLASS="statTextBig">qubits Breakdown</A></TD>
                    </TR>                    
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">512</TD>
                      <TD COLSPAN="2" ALIGN="center" CLASS="statText">&#160;</TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                 
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD COLSPAN="2" ALIGN="center" HEIGHT="13" CLASS="statText">64<BR/>192</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>                                                           
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD COLSPAN="2" VALIGN="middle" CLASS="statText">Wed. Oct. 16th, Start: 9:30 PM EDT</TD>
                    </TR>                   
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Online Round #3<BR/>
                      </TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=tourney_advancers&amp;rds=4345" CLASS="statTextBig">Advancers</A> | <A HREF="/index?t=tournaments&amp;c=invit02_breakdown_r3" CLASS="statTextBig">qubits Breakdown</A></TD>
                    </TR>                    
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">256</TD>
                      <TD COLSPAN="2" ALIGN="center" CLASS="statText">&#160;</TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                 
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD COLSPAN="2" ALIGN="center" HEIGHT="13" CLASS="statText">32<BR/>32</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                       
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>                                                           
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD COLSPAN="2" VALIGN="middle" CLASS="statText">Wed. Oct. 23th, Start: 9:30 PM EDT</TD>
                    </TR>
                     <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Online Round #4<BR/>
                      </TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=tourney_advancers&amp;rds=4355" CLASS="statTextBig">Advancers</A> | <A HREF="/index?t=tournaments&amp;c=invit02_breakdown_r4" CLASS="statTextBig">qubits Breakdown</A></TD>
                    </TR>                    
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">64</TD>
                      <TD COLSPAN="2" ALIGN="center" CLASS="statText">&#160;</TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                 
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD COLSPAN="2" ALIGN="center" HEIGHT="13" CLASS="statText">8<BR/>8</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                       
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>                                                           
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD COLSPAN="2" VALIGN="middle" CLASS="statText">Wed. Oct. 30th, Start: 9:30 PM EST</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD>
                    </TR>                    
                    </TABLE>                

                   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
                    <TR>
                      <TD COLSPAN="5" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Onsite Schedule</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                        
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Semifinals</TD>
                      <TD COLSPAN="4" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
                    </TR>                    
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourney_semi" CLASS="statTextBig">Room #1</A></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourney_semi" CLASS="statTextBig">Room #2</A></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourney_semi" CLASS="statTextBig">Room #3</A></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourney_semi" CLASS="statTextBig">Room #4</A></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">16</TD>
                      <TD ALIGN="center" CLASS="statText">4</TD>
                      <TD ALIGN="center" CLASS="statText">4</TD>
                      <TD ALIGN="center" CLASS="statText">4</TD>
                      <TD ALIGN="center" CLASS="statText">4</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date: Fri. Nov. 22nd&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">8:00 AM</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">11:00 AM</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">3:00 PM</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">6:00 PM</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=invit02_semiroom1" CLASS="statTextBig">Summary</A></TD>
                      <TD COLSPAN="4" ALIGN="center" HEIGHT="13" CLASS="statText">&#160;</TD>
                    </TR>                                     
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Championship</TD>
                      <TD COLSPAN="4" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
                    </TR>                    
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD COLSPAN="4" ALIGN="center" VALIGN="middle" WIDTH="74%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/index?t=tournaments&amp;c=tourney_champ" CLASS="statTextBig">1 Room</A></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">4</TD>
                      <TD COLSPAN="4" ALIGN="center" CLASS="statText">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">Invitational Champion&#160;</TD>
                      <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="statText">1</TD>
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Sat. Nov. 23rd 11:00 AM</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText"><A HREF="/index?t=tournaments&amp;c=invit02_champ" CLASS="statTextBig">Summary</A></TD>
                      <TD COLSPAN="4" ALIGN="center" HEIGHT="13" CLASS="statText">&#160;</TD>
                    </TR>                     
                    </TABLE>
          <P><BR/></P>
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


