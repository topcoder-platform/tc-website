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
        <TITLE>Microsoft jobs at TopCoder Employment Services</TITLE>
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
      <TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;Microsoft Jobs</B></TD>
  </TR>
  <TR>
      <TD VALIGN="middle" HEIGHT="18" CLASS="bodyText"><A HREF="/?&amp;t=tces&amp;c=ms_openings&amp;a=secure" CLASS="bodyText">Jobs</A> | <A HREF="http://www.microsoft.com/careers/mslife/benefits/plan.aspx" TARGET="_blank" CLASS="bodyText">Benefits</A> | <A HREF="http://www.microsoft.com/careers/mslife/diversepride" TARGET="_blank" CLASS="bodyText">Diversity</A> | <A HREF="http://www.microsoft.com/careers/mslife/locations" TARGET="_blank" CLASS="bodyText">Locations</A>
      </TD>
  </TR>
</TABLE>
<!-- Client Message Begins -->
<IMG SRC="/i/es/ms/ms_logo.gif" WIDTH="160" HEIGHT="40" ALT="" BORDER="0" VSPACE="10"/>

<P>There are two key aspects to Microsoft's past and future success: our vision of technology and the values that we live by every day as a company. To reflect our role as an industry leader and to focus our efforts on the opportunities ahead, we have embraced a new corporate mission: </P>

<P><EM><FONT COLOR="#3333CC">To enable people and businesses throughout the world to realize their full potential.</FONT></EM></P>

<P>Delivering on this mission requires a clearly defined set of values and tenets. Our company values are not new, but have recently been articulated to reinforce our new mission. </P>

<P><B>Great people with great values</B><BR/>
Achieving our mission requires great people who are bright, creative, and energetic, and who share the following values:
<UL>
<LI>Integrity and honesty.</LI> 
<LI>Passion for customers, partners, and technology.</LI> 
<LI>Open and respectful with others and dedicated to making them better.</LI> 
<LI>Willingness to take on big challenges and see them through.</LI> 
<LI>Self critical, questioning, and committed to personal excellence and self-improvement.</LI> 
<LI>Accountable for commitments, results, and quality to customers, shareholders, partners, and employees.</LI> 
</UL></P>

<P><B>Tenets that propel our mission</B><BR/>
The tenets central to accomplishing our mission include:</P>

<UL>
<LI>Customer trust. Earning customer trust through the quality of our products and our responsiveness and accountability to customers and partners.</LI>
<LI>Broad customer connection. Connecting broadly with customers, understanding their needs and uses of technology, and providing support when they have questions or concerns.</LI> 
<LI>Innovative, evolving, and responsible platform leadership. Expanding platform innovation, benefits, and opportunities for customers and partners, openness in discussing our future directions, getting feedback, and working with others to ensure that their products and our platforms work well together.</LI> 
<LI>Enabling people to do new things. Broadening choices for customers by identifying new areas of business, incubating new products, integrating new customer scenarios into existing businesses, exploring acquisition of key talent and experience, and integrating more deeply with new and existing partners.</LI> 
<LI>A global inclusive commitment. Thinking and acting globally, enabling a multicultural workforce that generates innovative decision-making for a diverse universe of customers and partners, innovating to lower the costs of technology, and showing leadership in supporting the communities in which we work and live.</LI> 
<LI>Excellence. Excellence in everything we do to deliver on our mission.</LI> 
</UL>

<P>At Microsoft, we're committed to our mission &#150; improving the potential of our customers around the world.</P>

<P><A HREF="/?&amp;t=tces&amp;c=ms_openings&amp;a=secure" CLASS="bodyText">Click here</A> for our available positions.</P>

<!-- Client Message Ends -->

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