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
<!--body contextual links-->
<TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
   <TR>
      <TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;Solipsys Jobs</B></TD>
  </TR>
  <TR>
      <TD VALIGN="middle" HEIGHT="18" CLASS="bodyText"><A HREF="/?&amp;t=tces&amp;c=solipsys_openings&amp;a=secure" CLASS="bodyText">Jobs</A> | <A HREF="http://www.solipsys.com/customer.php3" TARGET="_blank" CLASS="bodyText">Customer Approach</A> | <A HREF="http://www.solipsys.com/facility.php3" TARGET="_blank" CLASS="bodyText">Facilities</A> | <A HREF="http://www.solipsys.com/products.php3" TARGET="_blank" CLASS="bodyText">Products</A> | <A HREF="/?&amp;t=tces&amp;c=solipsys" CLASS="bodyText">Solipsys Main Page</A>
      </TD>
  </TR>
</TABLE>
<!-- Client Message Begins -->
<IMG SRC="/i/es/solipsys/solipsys_logo.gif" WIDTH="135" HEIGHT="60" ALT="" BORDER="0" VSPACE="10"/><BR/>   


<P><B>Associate Analyst (00085)</B></P>
<P>Work as a Solipsys Analyst! Solipsys is experiencing tremendous growth and augmenting its multi-disciplined staff with the best and brightest talent available. Conceive, develop, model, and evaluate ideas for application to military combat, radar, and data fusion systems in the areas of track state estimation, multi-sensor correlation, sensor alignment, and other related processes. The person in this position will provide data analysis support of product release testing and system evaluation using Matlab. This position is located in Laurel, Maryland.</P>

<P><B>In this position, you would:</B>
<UL>
<LI>Apply optimal estimation techniques, develop Matlab models, and evaluate model effectiveness using both simulated and recorded sensor data. </LI>
<LI>Conduct engineering trade studies of potential algorithms. </LI>
<LI>Conduct interactive exploratory data analysis, using applications such as DataDesk, for case studies to evaluate both model and real-time system performance. </LI>
<LI>Analyze tracking system performance with regard to accuracy and continuity (stability of track number and identification assignment). </LI>
<LI>Analyze correlation model performance on multi-sensor databases. </LI>
<LI>Model and evaluate fusion algorithms applied to multi-sensor data. </LI>
<LI>Create plots, graphs, and summaries of analysis results for reports and presentation materials. </LI>
<LI>Support program review and technical interchange meetings with the sponsor or customer. </LI>
<LI>Write documentation in support of Solipsys Corporation products. </LI>
</UL>
</P>

<P><B>Requirements and Qualifications</B>
<UL>
<LI>BS in, Mathematics, Systems Engineering, Physics, Electrical Engineering, Statistics, or related discipline with zero - three years experience. Must have STRONG math background. </LI>
<LI>Familiarity with mathematical and statistical computing environments using PCs (Matlab and/or DataDesk). </LI>
<LI>Ability to pay strict attention to detail. </LI>
<LI>Familiarity with C++ for off line experiments helpful. </LI>
<LI>Signal processing skills would also be useful. </LI>
<LI>Must possess strong documentation skills.</LI>
</UL>
</P>

<P><B>This position requires applicants to be eligible for a US SECRET Security Clearance for access to classified information.</B></P> 

<P>Solipsys is an Equal Opportunity Employer.</P>

  


<P ALIGN="center"><A HREF="/jobposting?&amp;t=JobHitTask&amp;jid=74&amp;jt=2" CLASS="bodyText">Apply now!</A> | <A HREF="/?&amp;t=tces&amp;c=solipsys_openings&amp;a=secure" CLASS="bodyText">Back to Jobs</A></P>

<!-- Job Description Ends -->
          
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
