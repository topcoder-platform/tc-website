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
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
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

                           <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                              <TR>
                                 <TD CLASS="statText" BGCOLOR="#43515E" HEIGHT="18" VALIGN="middle">&#160;&#160;<B>Great Jobs at Google</B></TD>
                              </TR>
                              <TR>
                                 <TD CLASS="bodyText" HEIGHT="18" VALIGN="middle">&#160;&#160;<A HREF="/?&amp;t=tces&amp;c=google_openings&amp;a=secure" CLASS="bodyText">Jobs</A>&#160;|&#160;
                                    <A HREF="http://www.google.com/about.html" CLASS="bodyText" TARGET="_blank">About Google</A>&#160;|&#160;
                                    <A HREF="http://www.google.com/jobs/culture.html" CLASS="bodyText" TARGET="_blank">Culture</A>&#160;|&#160;
                                    <A HREF="http://www.google.com/jobs/benefits.html" CLASS="bodyText" TARGET="_blank">Benefits</A>&#160;|&#160;
                                    <A HREF="http://www.google.com/jobs/inside.html" CLASS="bodyText" TARGET="_blank">Inside&#160;View</A>	
                                 </TD>
                              </TR>	
                           </TABLE>

                           <A href="/?&amp;t=tces&amp;c=google"><IMG SRC="/i/es/google_sm.gif" WIDTH="143" HEIGHT="59" BORDER="0"/></A><BR/>       

                           <P>
                           <B>Positions currently available</B>
                           </P>

<TABLE WIDTH="100%" CELLPADDING="5" CELLSPACING="5" BORDER="0">
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_soft_eng&amp;a=secure" CLASS="bodyText">Software Engineering</A></B></TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_java&amp;a=secure" CLASS="bodyText">Java</A></B></TD>
  </TR>
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_eng_tools&amp;a=secure" CLASS="bodyText">Engineering Tools</A></B></TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_verification&amp;a=secure" CLASS="bodyText">Verification</A></B></TD>
  </TR>
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_windows&amp;a=secure" CLASS="bodyText">Windows</A></B></TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_linux&amp;a=secure" CLASS="bodyText">Linux Kernel</A></B></TD>
  </TR>
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_front_end&amp;a=secure" CLASS="bodyText">Front End Focus</A></B></TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_ui_eng&amp;a=secure" CLASS="bodyText">User Interface Engineer</A></B></TD>
  </TR>
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_intranet_dev&amp;a=secure" CLASS="bodyText">Intranet Web Developer</A></B></TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_release_eng&amp;a=secure" CLASS="bodyText">Release Engineer</A></B></TD>
  </TR>
   <TR>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_site_reliability&amp;a=secure" CLASS="bodyText">Site Reliability Engineer</A></B></TD>
      <TD ALIGN="left" VALIGN="top" CLASS="bodyText"><B><A HREF="/?&amp;t=tces&amp;c=google_soft_ver_eng&amp;a=secure" CLASS="bodyText">Sr Software Verification Engineer</A></B></TD>
  </TR>
</TABLE> 
                           

                        </TD>
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
