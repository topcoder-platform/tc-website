<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../../top.xsl"/>
  <xsl:import href="../../script.xsl"/>
  <xsl:import href="../../includes/body_top.xsl"/>  
  <xsl:import href="../../foot.xsl"/>
  <xsl:import href="../../includes/modules/practice_room.xsl"/>
  <xsl:import href="../../includes/modules/module_login.xsl"/>  
  <xsl:import href="../../includes/modules/calendar.xsl"/>
  <xsl:import href="../../includes/global_left.xsl"/> 
  <xsl:import href="../../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Employment Services</TITLE>
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
    <TD WIDTH="180" VALIGN="top">
  <!-- Global Seconday Nav Begins -->    
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
  <xsl:with-param name="image">jobs</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>

<TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
   <TR>
      <TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;NVIDIA Jobs</B></TD>
  </TR>
  <TR>
      <TD VALIGN="middle" HEIGHT="18" CLASS="bodyText"><A HREF="/?&amp;t=tces&amp;c=nvidia_openings&amp;a=secure" CLASS="bodyText">Full Time Positions</A> | <A HREF="/?&amp;t=tces&amp;c=nvidia_openings_intern&amp;a=secure" CLASS="bodyText">Intern/Co-op Positions</A> | <A HREF="http://www.nvidia.com/view.asp?PAGE=products" CLASS="bodyText" TARGET="_blank">Products</A> | <A HREF="http://www.nvidia.com/view.asp?PAGE=benefits" CLASS="bodyText" TARGET="_blank">Benefits</A> | <A HREF="/?&amp;t=tces&amp;c=nvidia" CLASS="bodyText">NVIDIA Main Page</A></TD>
  </TR>
</TABLE>
<IMG SRC="/i/es/nvidia/nvidia_logo.gif" WIDTH="120" HEIGHT="83" ALT="" BORDER="0" VSPACE="10"/><BR/>       
<P>
<B>Intern/Co-op Positions</B><BR/> 
NVIDIA's Intern &amp; Co-op Program is a year-round program offering work
terms ranging from 3 to 6 months. In addition to a competitive salary, we
provide relocation assistance and housing assistance for those that do not
reside or attend a university in the Bay Area. For more information, check out
<A HREF="http://www.nvidia.com" CLASS="bodyText" TARGET="_blank">www.nvidia.com</A>.
</P>
<P> 
Below is the current listing of intern and co-op positions within
NVIDIA.  All positions are available in Santa Clara, CA, Austin, TX, and
Durham, NC unless otherwise noted. All resumes will be considered for
Santa Clara, and if you are interested in another location, please
indicate your location preference on your resume.  Click on the job
title for the position description and requirements.
</P>

<TABLE WIDTH="100%" CELLPADDING="5" CELLSPACING="5" BORDER="0">
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText">
       <P>
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_embedsofteng_intern&amp;a=secure" CLASS="bodyText">EMBEDDED SOFTWARE ENGINEER INTERN</A></B><BR/><BR/>
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_softeng01_intern&amp;a=secure" CLASS="bodyText">SOFTWARE ENGINEER INTERN/CO-OP</A></B><BR/><BR/>
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_syssofteng01_intern&amp;a=secure" CLASS="bodyText">SYSTEMS SOFTWARE ENGINEER INTERN/CO-OP</A></B><BR/><BR/></P>      
      </TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText">
       <P>       
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_archeng01_intern&amp;a=secure" CLASS="bodyText">ARCHITECT INTERN/CO-OP</A></B><BR/><BR/>  
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_platarcheng01_intern&amp;a=secure" CLASS="bodyText">PLATFORM ARCHITECT INTERN/CO-OP</A></B><BR/><BR/>
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_netsofteng01_intern&amp;a=secure" CLASS="bodyText">NETWORKING SOFTWARE INTERN/CO-OP</A></B><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/><IMG SRC="/i/header_new.gif" WIDTH="46" HEIGHT="20" ALT="" VALIGN="bottom" BORDER="0"/><BR/><BR/></P>        
    </TD>
  </TR>
</TABLE> 
<!--end contextual links-->
          
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
