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

<script Language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
     
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
  <xsl:with-param name="title">&#160;Room&#160;2:&#160;Summary&#160;&amp;&#160;Photos</xsl:with-param>
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
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=tournament&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Summary</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText">
<P><IMG SRC="/i/2002tccc/tourney_photo2.jpg" ALT="" WIDTH="200" HEIGHT="450" HSPACE="10" VSPACE="3" ALIGN="left" BORDER="0"/>
<FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Title goes here</B></FONT><BR/>
<I>Well rested derkuci advances to finals.</I><BR/><BR/>
Friday, April 19, 2002<BR/>
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

          </TD>
            </TR>
          </TABLE>
                      
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/><A NAME="photo"></A></TD>
            </TR>          
            <TR>
              <TD VALIGN="middle" COLSPAN="3" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Photos</TD>
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR101.jpg');"><IMG SRC="/i/2002tccc/SFR101_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR102.jpg');"><IMG SRC="/i/2002tccc/SFR102_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR103.jpg');"><IMG SRC="/i/2002tccc/SFR103_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR104.jpg');"><IMG SRC="/i/2002tccc/SFR104_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR105.jpg');"><IMG SRC="/i/2002tccc/SFR105_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center"><BR/>
              <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" BGCOLOR="#000000">
	<TR>
		<TD><IMG SRC="/i/2002tccc/SFR101.jpg" NAME="bigVersion" WIDTH="432" HEIGHT="288" BORDER="0"/></TD>
	</TR>
</TABLE>
              <BR/></TD>
            </TR>            
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR106.jpg');"><IMG SRC="/i/2002tccc/SFR106_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR107.jpg');"><IMG SRC="/i/2002tccc/SFR107_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR108.jpg');"><IMG SRC="/i/2002tccc/SFR108_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR107.jpg');"><IMG SRC="/i/2002tccc/SFR107_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR108.jpg');"><IMG SRC="/i/2002tccc/SFR108_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>              
              </TD>
            </TR>
            <TR>
              <TD VALIGN="top" COLSPAN="3" CLASS="bodyText" ALIGN="center">
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR101.jpg');"><IMG SRC="/i/2002tccc/SFR101_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR102.jpg');"><IMG SRC="/i/2002tccc/SFR102_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR103.jpg');"><IMG SRC="/i/2002tccc/SFR103_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR104.jpg');"><IMG SRC="/i/2002tccc/SFR104_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>
<A HREF="Javascript:void changeImage('bigVersion', '/i/2002tccc/SFR105.jpg');"><IMG SRC="/i/2002tccc/SFR105_tn.jpg" ALT="" WIDTH="96" HEIGHT="64" VSPACE="4" HSPACE="4" BORDER="0"/></A>             
              </TD>
            </TR>              
          </TABLE>
          <P><br/></P>
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


