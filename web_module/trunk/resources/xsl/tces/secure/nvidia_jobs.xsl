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
        <TITLE>Job Listings for NVIDIA on TopCoder</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" >
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

<DIV ALIGN="CENTER"><IMG SRC="/i/es/nvidia/main_banner.gif" WIDTH="510" HEIGHT="100" ALT="" BORDER="0" VSPACE="10" /></DIV>

               <p><b>At NVIDIA, the sky's the limit! Visualize your future...We do.</b></p>
                        <p>Positions are available in our Santa Clara, CA headquarters. All positions are for New College Graduate &#40;NCG&#41;, Internship, and Co-op opportunities, unless otherwise indicated.</p>

 <TABLE WIDTH="100%" CELLPADDING="5" CELLSPACING="5" BORDER="0">
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText">
       <b>SOFTWARE</b><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Software Engineer</A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Systems Software Engineer</A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Performance Analysis Software Engineer</A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Software QA Engineer</A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Cad Engineer (intern/co-op position only)</A><BR/>
       <b>ARCHITECTURE</b><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Graphics Architecture Engineer</A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">3D Graphics Applications Software Engineer</A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Platform Architecture Engineer (Intern/Co-op position only)</A><BR/>
       <b>IT/BUSINESS DEVELOPMENT</b><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Web Software Engineer</A><BR/>
       <b>MARKETING</b><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Technical Marketing Engineering Intern</A><BR/>
       <b>HARDWARE</b><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Hardware Engineer - ASIC</A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Mixed Signal Design Engineer</A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Applications Engineer </A><BR/>
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Systems Engineer </A><BR/> 
       <A HREF="/?&amp;t=tces&amp;c=nvidia_soft_eng&amp;a=secure" CLASS="bodyText">Analog/Mixed-Signal Design Engineer Ð Wireless </A><BR/>
      </TD>
  </TR>
</TABLE>

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
