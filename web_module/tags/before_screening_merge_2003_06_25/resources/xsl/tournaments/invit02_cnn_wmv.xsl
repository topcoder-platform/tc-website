<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>
  <xsl:import href="../includes/modules/invit02_nav.xsl"/>    
  <xsl:import href="../includes/global_left.xsl"/>
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
    <TD WIDTH="180" VALIGN="top">
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
    <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">tournaments</xsl:with-param>
  <xsl:with-param name="title">&#160;Video</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="seminav"/>
  <!-- Global Seconday Nav Ends --> 
<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" WIDTH="100%">
            <!-- <TR>
              <TD COLSPAN="3" ALIGN="center"><BR/><A HREF="/index?t=tournaments&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_banner_white.gif" ALT="" WIDTH="428" HEIGHT="84" VSPACE="5" BORDER="0"/></A></TD>
            </TR> -->          
            <TR>
              <TD VALIGN="middle" WIDTH="30%" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Title/Description</TD>
              <TD VALIGN="middle" WIDTH="20%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Media Type</TD>            
              <TD VALIGN="middle" WIDTH="20%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Media Size</TD>             
              <TD VALIGN="middle" WIDTH="15%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Download</TD>              
              <TD VALIGN="middle" WIDTH="15%" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Play</TD>            
            </TR>
            <TR>
              <TD VALIGN="middle" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
              <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;&#160;<A HREF="/i/tournament/invit02/invit02_cnn.wmv" CLASS="bodyText">CNN HeadlineNews</A></TD>
              <TD VALIGN="middle" CLASS="bodyText">&#160;&#160;Windows Media</TD>            
              <TD VALIGN="middle" CLASS="bodyText">&#160;&#160;3.27 MB</TD>
              <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;&#160;<A HREF="/i/tournament/invit02/invit02_cnn.wmv" CLASS="bodyText">click here</A></TD>                           
              <TD VALIGN="middle" CLASS="bodyText">&#160;&#160;<A HREF="/?&amp;t=tournaments&amp;c=invit02_cnn_wmv" CLASS="bodyText"></A>click here</TD>
            </TR> 
            <TR>
              <TD VALIGN="middle" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
          </TABLE>            
          <TABLE BORDER="0" BGCOLOR="#000000" CELLSPACING="1" CELLPADDING="0" WIDTH="100%">            
            <TR>
              <TD VALIGN="middle" ALIGN="center" COLSPAN="5" CLASS="bodyText">
<P><BR/></P>
<P><BR/></P>               
              <EMBED TARGET="MYSELF" SRC="/i/tournament/invit02/invit02_cnn.wmv" ALT="" CONTROLLER="true" CACHE="true" BORDER="0"/>
<P><BR/></P>
<P><BR/></P>               
              </TD>
            </TR>                                                      
          </TABLE>       
<P><BR/></P>          
<P><BR/></P>       
<table cellpadding="5" cellspacing="0" border="0" width="90%">
<tr>
<td colspan="3" class="bodyText"><B>Additional Resources</B><br/>
Use the buttons below to download a media player.</td>
</tr>
<tr>
<td nowrap=""><a href="http://www.apple.com/quicktime/download/" target="_new"><img src="/i//button_qt.gif" width="90" height="33" border="0" alt="CLICK HERE TO GO TO THE APPLE QUICKTIME DOWNLOAD PAGE"/></a>&#160; <a href="http://scopes.real.com/real/player/player.html?src=010709realhome_1,010613rpchoice_h1&amp;dc=717716715" target="_new"><img src="/i//button_real.gif" width="90" height="33" border="0" alt="CLICK HERE TO GO TO THE REAL PLAYER DOWNLOAD PAGE"/></a>&#160; <a href="http://windowsmedia.com/download/download.asp" target="_new"><img src="/i//button_wmp.gif" width="120" height="33" border="0" alt="CLICK HERE TO GO TO THE MICROSOFT WINDOWS MEDIA PLAYER DOWNLOAD PAGE"/></a>
</td></tr>
</table><br/>

          
                      
<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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


