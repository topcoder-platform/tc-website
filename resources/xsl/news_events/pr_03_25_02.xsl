<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Sixteen Finalists Announced for $150,000 Sun Microsystems and TopCoder Collegiate Challenge</TITLE>
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
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Press Releases - 2002</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
		            <!-- <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR> -->
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P><B>Sixteen Finalists Announced for $150,000 Sun Microsystems and TopCoder Collegiate Challenge</B></P>
<P>Computer Programming Tournament Will Award $100,000 To Winner</P>

<P>
GLASTONBURY, CT - March 25, 2002 - TopCoder, Inc., a company committed to identifying and promoting computer programming talent, announced today the 16 finalists - four Regional Champions and 12 "wildcards" - to compete in the upcoming final rounds of the 2002 Sun Microsystems, Inc. and TopCoder Collegiate Challenge tournament being held April 19-20 at the University Park Hotel @ MIT in Cambridge, Massachusetts.  The tournament has a total prize purse of $150,000, with the winner receiving $100,000.  
</P>

<P>
The four Regional Champions are: Northeast - Ben Wilhelm (Oberlin College), Southeast - Trayton Otto (Georgia Institute of Technology), Midwest - Tom Sirgedas (University of Michigan-Ann Arbor), and West - Dan Adkins (University of California-Berkeley).  The 12 "wildcards" include: Nathan Paymer, Ling Li, and Po-Shen Loh (California Institute of Technology), Daniel Wright, Eugene Davydov, and Ante Derek (Stanford University), James Esser (University of Minnesota-Twin Cities), Logan Hanks (Virginia Polytechnic Institute State University), Jonathan Salz (Massachusetts Institute of Technology), Joseph Nievelt (Michigan Technological University), Jeremy Haubold (Purdue University), and Ambrose Feinstein (University of Central Florida).
</P>

<P>
All finalists advanced to the championship rounds based on their scoring in a series of online elimination rounds, which began with a field of 512 competitors on February 19, 2002.  Regional Champions had the highest point totals during the Regional Finals, held on March 13.  The "wildcard" advancers finished with the next 12 highest point totals, regardless of region.  
</P>

<P>
"Sun is proud to be the exclusive sponsor of the 2002 TopCoder Collegiate Challenge, which clearly identified some of the best collegiate programmers in the country," said Stans Kleijnen, vice president, market development engineering at Sun Microsystems, Inc.  "TopCoder in association with the Sun Developer Connection (SDC) program -- Sun's overarching resource for individual developers which includes access to programs such as the Student Technology Associate Representative (STAR) program -- are working together to empower university students to deliver cutting-edge technology presentations, to their peers and gain valuable experience and industry insight in the process."
</P>

<P>
"Given the pedigree of these outstanding students, it is clear that we have identified the future leaders of software development and the technology industry," said TopCoder founder and Chairman, Jack Hughes.  "TopCoder has over 6,000 collegiate members.  These 16 have put in a tremendous effort in order to elevate above a crowded field of the best and the brightest.  The energy and excitement during the online elimination rounds was amazing.  We look forward to seeing them all at MIT in April."
</P>

<P>
This is the second annual Collegiate Challenge and third major programming tournament hosted by TopCoder.  The 2001 TopCoder Collegiate Challenge was held in June 2001, and was won by Jason Woolever, a Massachusetts Institute of Technology graduate student.  Woolever is currently a Senior Research and Development Engineer at Synopsys, Inc. of Sunnyvale, California.  
</P>


<P>
About TopCoder, Inc.<BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com. 
</P>

<P>
About Sun Developer Connection Program<BR/>
Building on Sun's vision to enable services on demand with the latest open technologies, the Sun Developer Connection (SDC) offers individual developers and software development partners a single, worldwide entry point to build a technical and business relationship with Sun. As one of the largest developer communities in the world, the SDC is the connection to Sun for comprehensive resources to build and market solutions leveraging Sun's open technologies, products, business development, and community forums. All programs, registration and eligibility information can be found at <A HREF="http://www.sun.com/sdc" CLASS="bodyText" TARGET="_blank">http://www.sun.com/sdc</A>.  STAR is designed to empower university students to deliver cutting-edge technology presentations, to their peers and gain valuable experience and industry insight in the process. For more information about the STAR program, go to: <A HREF="http://www.sun.com/developers/evangcentral/students/sunstar.html" CLASS="bodyText" TARGET="_blank">http://www.sun.com/developers/evangcentral/students/sunstar.html</A> 
</P>


<P>
Sun, Sun Microsystems, the Sun logo, Sun Developer Connection, Java, and The Network Is The Computer are trademarks of Sun Microsystems in the United States and other countries.
</P>

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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="pr_right_col"/>       
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
