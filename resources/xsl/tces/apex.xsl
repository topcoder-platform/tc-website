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
        <TITLE>Apex jobs at TopCoder Employment Services</TITLE>
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
  <TR align="top">
    <!-- Left Column Begins -->
    <TD WIDTH="180">
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
<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150">
   <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
                <TR> 
                <TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>
                </TR>
              <TR>
                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
                <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">EMPLOYMENT LINKS:</TD>
              </TR>                    
              <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
          <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
            <TR>
              <TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
              <TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:tces@topcoder.com" CLASS="bodyText">Contact employment services</A></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>        
          </TABLE>
                </TD>
            </TR>
   <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE> -->
<TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
<TR>

<TD VALIGN="middle" HEIGHT="18" BGCOLOR="#43515E" CLASS="statText"><B>&#160;Great Jobs at Apex</B></TD>

</TR>



<TR>

<TD VALIGN="middle" HEIGHT="18" CLASS="bodyText">

&#160;&#160;<A CLASS="bodyText" HREF="/?t=tces&amp;c=apex">Jobs</A>&#160;|&#160;

<A CLASS="bodyText" HREF="/?&amp;t=tces&amp;c=apex_details&amp;a=secure">Job Requirements</A>&#160;|&#160;



</TD>

</TR>



</TABLE>



<IMG SRC="/i/es/apex/apexlogo.gif" WIDTH="82" HEIGHT="71" ALT="Apex" BORDER="0"/>



<P>Apex Data Services (<A HREF="http://www.apexinc.com" CLASS="bodyText" TARGET="_blank">http://www.apexinc.com</A>) is an international data conversion company headquartered in Herndon, VA.  We are an employee-owned company devoted to the growth of our staff as we solve interesting technical problems in a stimulating environment.</P>

<P>We have only one more position to fill, and we're looking to fill it with a real "heavy hitter."  This individual will work directly with our chief technologist on setting the technical direction of the company and will have responsibilities that include architecture, design, and implementation.  This is a full-time job (no contractors, please) at our Herndon, VA office near Dulles Airport outside of Washington, DC.</P>



<P><B>We are not a greedy company.</B></P>

<P>Although the financial bottom line is always important, doing things right is more important.  Our core values are Excellence, Integrity, and Human Dignity.  These values are practiced throughout our business, both inside and outside of our software development activities.  We respect people, take pleasure in solving problems well, and love to teach and learn from each other.</P>



<P><B>We are a meritocracy.</B></P>

<P>Advancement and reward come from doing good work and making good contributions.  Our environment encourages people who have what it takes to do a good job.</P>



<P><B>We are a small company where everyone gets to do a little of everything.</B></P>

<P>In a software development role, you'll obviously spend a fair amount of time writing code, but you'll never have to worry about coding in a vacuum.  Our programmers are expected to be able to function in all phases of a project's life cycle from requirements analysis through maintenance, and from interfacing with customers to interfacing with users.</P>



<P><B>We sell services, not products.</B></P>

<P>The vast majority of the software we develop is for our own internal use.  We're not selling a product -- we're selling a service.  We write software to enable us to generate the kind of data that our customers want.  That software is run by our own production facilities, which employ close to 2,000 people.  This gives us an unusual level of control over our environment as well as direct access to our user base.</P>



<P><B>We solve algorithmically complex problems.</B></P>

<P>The nature of our work requires us to decompose problems in a manner different from how most people would do it.  Because of the high volume of material that we process and the high degree of control that we require, we often choose to build custom solutions to problems from scratch.  This means we have the chance to build foundations and components as well as top-level applications.  We can define abstractions barriers and then work on both sides of them.  Getting all this right requires a higher caliber of programmer than one who just assembles existing pieces or works with off-the-shelf APIs.</P>



<P><B>Our software practices guarantee quality.</B></P>

<P>Our entire software infrastructure and all of our applications are backed by automated regression test suites.  These are not quick and dirty test setups thrown together by some automated testing tool.  These are test suites coded as carefully as the applications that they are testing.  The result is that our software is very stable, and that when a bug does show up, it gets fixed and stays fixed.</P>



<P><B>We know when to build and when to throw away.</B></P>

<P>The solutions that work today won't necessarily be the best solutions in two or three years.  You may decide in time that a solution you built earlier is no longer adequate to the problems that are occurring today.  At Apex, we're not afraid to build new technology to solve a problem, and we're not afraid to retire old technology when it has outlived its usefulness.  If we feel something we did before needs fixing, we fix it.</P>



<P><B>Our software engineering VP is a TopCoder member!</B></P>

<P>Wouldn't you rather work for someone who writes code because it's fun?  At Apex, you can grow and advance while still getting your hands dirty, and you'll always have people to bounce ideas off of.</P>



<P><A HREF="/?t=tces&amp;c=apex_details&amp;a=secure">Click here</A> for job details.</P>





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