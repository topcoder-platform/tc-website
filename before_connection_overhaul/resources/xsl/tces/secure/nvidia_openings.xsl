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
  <xsl:import href="../nvidia_links.xsl"/>     
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

<!-- Nvidia Links Begins -->
                        <xsl:call-template name="nvidia_links"/>
<!-- Nvidia Ends -->

<IMG SRC="/i/es/nvidia/professional_banner.gif" WIDTH="510" HEIGHT="100" ALT="" BORDER="0" VSPACE="10" ALIGN="CENTER"/><BR/>       
<P>

Below is the current listing of full time positions within NVIDIA.  All
positions are available in Santa Clara, and limited opportunities are
available in Austin, TX and Durham, NC.  If the position is location
specific, it is noted in the description.  If you are interested in a
position other than Santa Clara, please indicate your location
preference on your resume.  All resumes with no location preference will
be considered for Santa Clara, unless otherwise specified.
</P>


<TABLE WIDTH="100%" CELLPADDING="5" CELLSPACING="5" BORDER="0">
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText">
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_vid_dev&amp;a=secure" CLASS="bodyText">VIDEO DEVELOPER TECHNOLOGY ENGINEER</A></B><BR/><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_3d_perftool&amp;a=secure" CLASS="bodyText">3D PERFORMANCE TOOLS SOFTWARE ENGINEER</A></B><BR/><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_3d_tool&amp;a=secure" CLASS="bodyText">3D TOOLS SOFTWARE ENGINEER</A></B><BR/><BR/>
        
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_jr_ogleng&amp;a=secure" CLASS="bodyText">JUNIOR OPENGL ENGINEER (524954)</A></B><BR/><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_sr_ogleng&amp;a=secure" CLASS="bodyText">SENIOR OPENGL ENGINEER (524953)</A></B><BR/><BR/>
         <!--<B><A HREF="/?&amp;t=tces&amp;c=nvidia_diageng&amp;a=secure" CLASS="bodyText">DIAGNOSTIC ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_peranaeng_intern&amp;a=secure" CLASS="bodyText">PERFORMANCE ANALYSIS ENGINEER INTERN/CO-OP</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_videobioseng&amp;a=secure" CLASS="bodyText">VIDEO BIOS ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_sqaeng_mobil&amp;a=secure" CLASS="bodyText">SQA ENGINEER - MOBILE</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_kernelsofteng&amp;a=secure" CLASS="bodyText">KERNEL SOFTWARE ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_mobbioseng&amp;a=secure" CLASS="bodyText">MOBILE BIOS ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_softqaeng&amp;a=secure" CLASS="bodyText">SOFTWARE QA ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_softeng1&amp;a=secure" CLASS="bodyText">SOFTWARE ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_srsyseng&amp;a=secure" CLASS="bodyText">SR. SYSTEM ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_sysbioseng&amp;a=secure" CLASS="bodyText">SYSTEM BIOS ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_oemtechprogmang&amp;a=secure" CLASS="bodyText">OEM TECHNICAL PROGRAM MANAGER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_fieldappeng&amp;a=secure" CLASS="bodyText">FIELD APPLICATION ENGINEER (Seoul, Korea)</A></B><BR/>-->
      
      </TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"> 
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_3dsseng83&amp;a=secure" CLASS="bodyText">3D SYSTEM SOFTWARE ENGINEER (521183)</A></B><BR/><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_3dsseng82&amp;a=secure" CLASS="bodyText">3D SYSTEM SOFTWARE ENGINEER (521182)</A></B><BR/><BR/> 
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_3dgseng&amp;a=secure" CLASS="bodyText">3D GRAPHICS SOFTWARE ENGINEER (520749)</A></B><BR/><BR/> 
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_sqaeng&amp;a=secure" CLASS="bodyText">SQA ENGINEER - MOBILE (517399)</A></B><BR/><BR/> 
        <!--<B><A HREF="/?&amp;t=tces&amp;c=nvidia_siginteng&amp;a=secure" CLASS="bodyText">SIGNAL INTEGRITY ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_packdesigner&amp;a=secure" CLASS="bodyText">PACKAGE DESIGNER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_srdesigneng&amp;a=secure" CLASS="bodyText">SENIOR DESIGN ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_prodtesteng&amp;a=secure" CLASS="bodyText">PRODUCT/TEST ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_whqleng&amp;a=secure" CLASS="bodyText">WHQL ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_sysdesigneng&amp;a=secure" CLASS="bodyText">SYSTEM DESIGN ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_platnetwarch&amp;a=secure" CLASS="bodyText">PLATFORM NETWORKING ARCHITECT</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_dfteng&amp;a=secure" CLASS="bodyText">DFT ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_sysdesignlead&amp;a=secure" CLASS="bodyText">SYSTEMS DESIGN LEAD</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_srsignalinteng&amp;a=secure" CLASS="bodyText">SR. SIGNAL INTEGRITY ENGINEER</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_appeng_intern&amp;a=secure" CLASS="bodyText">APPLICATIONS ENGINEER INTERN/CO-OP</A></B><BR/>
        <B><A HREF="/?&amp;t=tces&amp;c=nvidia_memarch&amp;a=secure" CLASS="bodyText">MEMORY ARCHITECT</A></B><BR/>-->
      
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
