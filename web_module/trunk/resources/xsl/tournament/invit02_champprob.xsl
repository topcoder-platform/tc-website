<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/invit02_nav.xsl"/>   
  <xsl:import href="../includes/schedule/public_schedule_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournament</TITLE>
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
        <xsl:call-template name="public_schedule_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">schedule</xsl:with-param>
  <xsl:with-param name="title">&#160;Championship&#160;Problems&#160;&amp;&#160;Chrono&#160;Logs</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="seminav"/>
  <!-- Global Seconday Nav Ends --> 
<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%"> 
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Problem Analysis &amp; Opinion</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<P>
Saturday, November 23, 2002
</P>
              
<P>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum 
dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis 
eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</P>

<P>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut 
laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad minim veniam, quis nostrud exerci tation 
ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.  Duis autem vel eum iriure dolor 
in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis 
at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue 
duis dolore te feugait nulla facilisi.  Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed 
diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  Ut wisi enim ad 
minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</P>

<P>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum 
dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent 
luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis 
eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum.</P>


<IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;lbackstrom<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=159052" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          </TD>
            </TR>                  
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/invit02/Betting.pdf" CLASS="bodyText">Betting</A><BR/>
Level Two (500) - <A HREF="/i/invit02/Roadmap.pdf" CLASS="bodyText">Roadmap</A><BR/>
Level Three (1000) - <A HREF="/i/invit02/Omaha.pdf" CLASS="bodyText">Omaha</A><BR/>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Championship Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
              
8:00:00 AM - zoidal opens the Level One problem <BR/>
8:00:01 AM - derkuci opens the Level One problem <BR/>
8:00:01 AM - ambrose opens the Level One problem <BR/>
8:00:02 AM - DjinnKahn opens the Level One problem <BR/>
8:18:48 AM - DjinnKahn opens the Level Two problem <BR/>
8:19:21 AM - ambrose submits the Level One problem for 180.11 points <BR/>
8:19:29 AM - ambrose opens the Level Two problem <BR/>
8:20:53 AM - zoidal opens the Level Two problem <BR/>
8:25:52 AM - ambrose submits the Level Two problem for 476.36 points <BR/>
8:26:03 AM - ambrose opens the Level Three problem <BR/>
8:30:32 AM - derkuci submits the Level One problem for 140.90 points <BR/>
8:30:44 AM - derkuci opens the Level Two problem <BR/>
8:32:07 AM - DjinnKahn submits the Level Two problem for 416.07 points <BR/>
8:32:14 AM - DjinnKahn opens the Level Three problem <BR/>
8:35:04 AM - zoidal submits the Level Two problem for 407.77 points <BR/>
8:35:09 AM - zoidal opens the Level Three problem <BR/>
8:39:20 AM - derkuci submits the Level Two problem for 459.37 points<BR/> 
8:39:30 AM - derkuci opens the Level Three problem<BR/> 
9:04:41 AM - ambrose submits the Level Three problem for 491.61 points<BR/> 
9:09:24 AM - zoidal submits the Level One problem for 93.30 points<BR/> 
9:14:57 AM - zoidal submits the Level Three problem for 483.41 points<BR/><BR/>

<B>Challenges</B><BR/>
9:23:18 AM - DjinnKahn challenges ambrose on the Level Two problem successfully<BR/>

          </TD>
            </TR>            
                                   
          </TABLE>
          <P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>   	
  <TR>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>	
  <TR>
    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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
<!-- <A HREF="/index?t=tournament&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
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


