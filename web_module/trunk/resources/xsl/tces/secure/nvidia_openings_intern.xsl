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
      
                <P>We are reinventing the visual experience beyond the bleeding-edge with the best hardware and software innovation.  The culture promotes 
                and inspires our driven team of world-class engineers and developers to be at the top of their game...and to have fun along the way!  We are shaping 
                the world of tomorrow...today.  Are you ready?</P>
            
                <P>At NVIDIA, we thrive on innovation, we're passionate about developing revolutionary technology, and we have the most brilliant minds in graphics, 
                hardware, and software.  If this sounds like the place you want to be, see what opportunities are waiting for you! </P>
            
                <P>Positions are available in our Santa Clara, CA headquarters in the following areas:</P>
                <P> <UL>
                <LI>Architecture</LI>
                <LI>Marketing - Demo &#38; Performance Teams</LI>
                <LI>Software Engineering</LI>
                <LI>IT Business Development &#40;Engineering&#41;</LI>
                </UL></P>
            
                <P>All positions are for New College Graduate &#40;NCG&#41;, Internship, and Co-op opportunities, unless otherwise indicated:</P>
<P><BR/></P>

<TABLE WIDTH="100%" CELLPADDING="5" CELLSPACING="5" BORDER="0">
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText">
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_softeng01&amp;a=secure" CLASS="bodyText">SOFTWARE ENGINEER</A></B><BR/><BR/>
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_syssofteng01&amp;a=secure" CLASS="bodyText">GRAPHICS ARCHITECTURE ENGINEER</A></B><BR/><BR/>
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_syssofteng01&amp;a=secure" CLASS="bodyText">3D GRAPHICS APPLICATION SOFTWARE ENGINEER</A></B><BR/><BR/>
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_syssofteng01&amp;a=secure" CLASS="bodyText">CAD ENGINEER*</A></B><BR/><BR/>
      </TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText">       
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_archeng01&amp;a=secure" CLASS="bodyText">SYSTEMS SOFTWARE ENGINEER</A></B><BR/> <BR/>  
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_platarcheng01&amp;a=secure" CLASS="bodyText">PERFORMANCE ANALYSIS SOFTWARE ENGINEER</A></B><BR/><BR/>
       <B><A HREF="/?&amp;t=tces&amp;c=nvidia_syssofteng01&amp;a=secure" CLASS="bodyText">WEB SOFTWARE ENGINEER</A></B><BR/><BR/>   
    </TD>
  </TR>
</TABLE> <BR/>
<P>*Intern&#47; Co-op Position Only</P>
<P>As an New College Grad at NVIDIA, your career starts faster than the speed of light!  You will be working side by side with some of the world's best engineers, 
and you will have an opportunity of a lifetime to make your mark in history.  Where your career will go…only you can tell!</P>

<P>As an intern&#47; co-op at NVIDIA, you will be empowered to show what you can do.  You are a valuable member of our team and play a critical role in the development 
of our latest products.  Your success will be determined by your technical strength and undisputed proactive attitude.</P>

<P>If you are highly motivated and passionate about winning, check out the possibilities waiting for you.</P>

<P>At NVIDIA, the sky's the limit!  Visualize your future...We do.</P>

<P><STRONG>YOUR FUTURE BEGINS HERE...</STRONG></P>

      
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
