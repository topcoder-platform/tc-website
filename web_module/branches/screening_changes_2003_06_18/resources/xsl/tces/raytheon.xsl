<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Raytheon jobs at TopCoder Employment Services</TITLE>
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
      <TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;Raytheon Jobs</B></TD>
  </TR>
  <TR>
      <TD VALIGN="middle" HEIGHT="18" CLASS="bodyText">&#160;&#160;
<A HREF="/?&amp;t=tces&amp;c=raytheon_openings&amp;a=secure" CLASS="bodyText">Jobs</A>&#160;|&#160;
<A CLASS="bodyText" HREF="http://www.raytheon.com/businesses/" TARGET="_blank">Businesses</A>&#160;|&#160;
<A CLASS="bodyText" HREF="http://www.raytheon.com/about/hottech.htm" TARGET="_blank">Hot Technologies</A>&#160;|&#160;
<A CLASS="bodyText" HREF="http://www.rayjobs.com/index.cfm?Option=Benefits" TARGET="_blank">Benefits</A>
      </TD>
  </TR>
</TABLE>
<IMG SRC="/i/es/raytheon/raytheon_logo.gif" WIDTH="160" HEIGHT="44" ALT="" BORDER="0"/>

<P>
Raytheon: Aspiring to be the most admired defense and aerospace systems supplier through 
world-class people and technology.  Raytheon today is focused on defense, government and 
commercial electronics, and business aviation and special mission aircraft.
</P>

<P>
<B>RAYTHEON AT A GLANCE</B>
<UL>
	<LI>Chairman and Chief Executive Officer: Daniel P. Burnham</LI>
	<LI>Headquarters: 141 Spring Street, Lexington, Massachusetts, 02421 </LI>
	<LI>77,500 employees worldwide</LI>
	<LI>$16.9 billion in 2001 revenues</LI>
</UL>
</P>

<P>
<B>Raytheon's Strategy</B>
<UL>
	<LI>Build a global presence</LI>
	<LI>Be the industry leader in Missile Defense; Intelligence, Surveillance and Reconnaissance; Precision Strike; and Homeland Security</LI>
	<LI>Restore Raytheon Aircraft to preeminence in aviation</LI>
	<LI>Offer a full range of services to customers</LI>
	<LI>Create value in commercial markets by leveraging technology</LI>
	<LI>Continually demonstrate operational excellence through Raytheon Six Sigma</LI>
	<LI>Work as "One Company" to provide superior solutions to customer needs</LI>
</UL>
</P>

<P>
<B>Strategic Business Areas</B><BR/>
The company's four strategic business areas are aligned to provide customers with solutions that draw upon the capabilities of the entire company. These strategic business areas are: 
<UL>
	<LI>Missile Defense</LI>
	<LI>Intelligence, Surveillance and Reconnaissance</LI>
	<LI>Precision Strike</LI>
	<LI>Homeland Security</LI>
</UL>
</P>

<P>
<B>A WORLD LEADER IN GOVERNMENT AND DEFENSE ELECTRONICS </B>
</P>

<P>
<B>Government and Defense Organization</B><BR/>
Raytheon's government and defense organization was formed to align the company even closer with customers. Raytheon is positioned as a world leader in developing and integrating technology solutions to meet critical defense and non-defense needs. The seven businesses are: 
<UL>
	<LI>Integrated Defense Systems</LI>
	<LI>Intelligence &amp; Information Systems</LI>
	<LI>Missile Systems</LI>
	<LI>Network Centric Systems</LI>
	<LI>Space &amp; Airborne Systems</LI>
	<LI>Raytheon Technical Services Company</LI>
	<LI>Homeland Security</LI>
</UL>
</P>

<P>
<B>ADAPTING DEFENSE TECHNOLOGIES TO COMMERCIAL MARKETS</B>
</P>

<P>
<B>Raytheon Commercial Electronics</B><BR/>
Leveraging Raytheon's world-class technologies to meet evolving commercial needs. 
<UL>
	<LI>ELCAN Optical Technologies</LI>
	<LI>Raytheon RF Components</LI>
	<LI>Raytheon Commercial Infrared</LI>
	<LI>Raytheon Marine GmbH</LI>
	<LI>Raytheon Microelectronics Espana, S.A.</LI>
	<LI>Raytheon Technologies, Inc.</LI>
</UL>
</P>

<P>
<B>Raytheon Commercial Ventures Inc.</B><BR/>
A subsidiary responsible for exploiting the commercial value of defense technologies, largely by creating equity interests for Raytheon in stand-alone commercial businesses. 
</P>

<P>
<B>BUSINESS AVIATION AND SPECIAL MISSION AIRCRAFT</B>
</P>

<P>
Raytheon Aircraft Company
<UL>
	<LI>Revitalizing an aviation legend</LI>
	<LI>Business Jets and Turboprops</LI>
	<LI>Piston-Powered Aircraft</LI>
	<LI>Special Mission Aircraft</LI>
	<LI>Regional Airliners</LI>
	<LI>Service, Support and Parts</LI>
	<LI>Aircraft Charter and Management</LI>
</UL>
</P>

<P>
<B>BUILDING A GLOBAL PRESENCE</B>
</P>

<P>
From the Amazon region of Brazil to Canada, Europe, the Middle East and 
Australia, Raytheon technology serves critical needs in every corner of 
the globe. Raytheon's international activities are as diverse as the people of the nations the company serves.
</P>

<P>
<B>Raytheon International, Inc.</B><BR/>
Focused on expanding Raytheon's international business, Raytheon International, Inc., maintains business development offices around the world.
</P>

<P>
<B>Raytheon Systems Limited </B><BR/>
Raytheon's U.K. subsidiary, Raytheon Systems Limited, designs, develops, and manufactures advanced electronics on a broad scale.
</P>

<P>
<B>Raytheon Australia</B><BR/>
Raytheon Australia is a major player in the Australian defense electronics and systems integration business.
</P>

<P>
<B>Thales Raytheon Systems</B> <BR/>
Raytheon's joint venture with Thales has operating subsidiaries in Fullerton, Calif., and greater Paris.
</P>

<P>
<B>Raytheon Canada</B> <BR/>
Raytheon Canada is based in Ontario, Canada, and offers diverse products and support services.
</P>


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
