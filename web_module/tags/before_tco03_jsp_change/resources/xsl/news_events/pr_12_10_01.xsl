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
        <TITLE>TopCoder Announces Sun Microsystems as Exclusive Sponsor for Annual Collegiate Challenge</TITLE>
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
  <xsl:with-param name="title">&#160;Press Releases - 2001</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
		            <!-- <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR> -->
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P CLASS="bodyTextBold"> 12.10.2001 <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/>TopCoder Announces Sun Microsystems as Exclusive Sponsor for Annual Collegiate Challenge</P>
<P> CLASS="bodyTextItal">Leading Systems Provider Partners with Computer Programming Competition Host to Support Technology in Higher Education and Extend Reach to the Developer Community</P>
<P>GLASTONBURY, Conn., Dec. 10, 2001 -- TopCoder, Inc., a company committed to identifying and promoting top-notch computer programming talent through competition, today announced Sun Microsystems as the exclusive tournament sponsor for its 2nd Annual TopCoder Collegiate Challenge. The Sun and TopCoder Collegiate Challenge invites thousands of TopCoder members to qualify for the coveted 512 tournament spots in order to continue on in competition for national ranking, notoriety and the $150,000 prize purse, of which $100,000 will be awarded to the tournament champion.</P>
<P>Beginning February 2002, the 512 programmers will participate in a series of online elimination rounds, culminating with the Sun and TopCoder Collegiate Challenge finals on April 19-20, 2002 onsite at the University Park Hotel at Massachusetts Institute of Technology (MIT) in Cambridge, Massachusetts.</P>
<P>"Collegiate programmers are a driving force within the IT community and are an important group for Sun by way of resources, marketing and recruitment," said Stans Kleijnen, vice president, Sun Developer Network, Sun Microsystems, Inc. "The Sun and TopCoder Collegiate Challenge enables Sun to show its support for this talented community and its development, as well as provide an exciting, new way for Sun to reach such a critical target audience."</P>
<P>"TopCoder is pleased to have Sun as an exclusive sponsor for our Annual Collegiate Challenge," said Jack Hughes, founder of TopCoder, Inc. "Sun has demonstrated its commitment to the developer</P>
<P>TopCoder Announces Sun Microsystems as Exclusive Sponsor community through the creation of the Sun Developer Connection program and the Java programming language. Sponsoring this competition is just another example of Sun's commitment."</P>
<P>Elimination Rounds Will Reduce 512 to 16 for the Finals The Sun and TopCoder Collegiate Challenge will bring together 512 of the highest-rated TopCoder college-level members for four rounds of online regional competition, starting Feb. 19, 2002. The field will then be narrowed to an elite 16, who will compete in the final two rounds, April 19-20, 2002, at the University Park Hotel at MIT in Cambridge, Mass. The winner will receive $100,000 of the $150,000 prize purse.</P>
<P>TopCoder will host weekly online programming competitions, throughout the year, for both professional and collegiate developers to compete for national ranking and rewards. More information regarding the sponsorship of these weekly single-round matches, as well as the 2002 TopCoder Invitational, can be found at www.topcoder.com or by calling 1-866-867-2633.</P>
<P>About TopCoder, Inc.TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members. With a global membership database, TopCoder members extend across all professional and collegiate levels. The attraction of competition and the associated rewards create a powerful community of programmers. Access to this community is granted to corporate partners who both promote and profit from the relationship. For more information and registration details visit www.topcoder.com/?r=17.</P>
<P CLASS="smallText">About the Sun Developer Connection ProgramBuilding on Sun's vision to enable services on demand with the latest open technologies, the Sun Developer Connection (SDC) offers individual developers and software development partners a single, worldwide entry point to build a technical and business relationship with Sun. As one of the largest developer communities in the world, the SDC is the connection to Sun for comprehensive resources to build and market solutions leveraging Sun's open technologies, products, business development, and community forums.###</P>
<P CLASS="smallText">Sun, Sun Microsystems, the Sun logo, Sun Developer Connection, Java, Solaris, and The Network Is The Computer are trademarks of Sun Microsystems in the United States and other countries.</P>
<A CLASS="bodyText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>:: Register with TopCoder to compete</A>
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
