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
        <TITLE>TopCoder Addresses Demand for Elite Programmers with Coding Competitions</TITLE>
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
<P CLASS="bodyTextBold">05.29.2001 - TopCoder Addresses Demand for Elite Programmers with Coding Competitions<BR/><SPAN CLASS="bodyTextItal">- San Francisco Collegiate Tournament Finals Concurrent with Sun Java One Event<BR/>- Contestants from Top U.S. Universities Vying for Share of $250,000 Prize Purse.</SPAN></P>
<P>Glastonbury, Conn. - May 29, 2001 - TopCoder, Inc., a Glastonbury, Connecticut-based company committed to identifying and promoting top-notch computer programming talent, announced today the list of contestants for its upcoming TopCoder Collegiate Challenge finals. The event, which will be held in San Francisco from June 5-7, at the San Francisco Hilton and Towers, will pit some of the country's top student programmers against each other in live, two-hour rounds of competition. The tournament also sets the stage for the official launch of TopCoder, which uses these competitions to attract and rate highly skilled programmers while facilitating connections between its members and companies in which technology is a business imperative.</P>
<P>By coupling one-of-a-kind competitions with a unique objective rating system, TopCoder is setting the industry standard for clearly differentiating programming skill. Jack Hughes, the company's founder and author of this innovative business model, is also co-founder and former chairman of Tall[\u225]n, Inc., an application development professional services firm in which CMGI, Inc. acquired a majority ownership last year.</P>
<P>Hughes has long recognized the critical role of programming talent in creating innovative products and services. He named his previous company Tall[\u225]n because it means "talent" in Gaelic. Tall[\u225]n was recognized as one of the fastest-growing technology companies in North America four years in a row by consultancy firm Deloitte &amp; Touche.</P>
<P>"TopCoder serves to bring excellent programmers together with leading companies in search of high-tech talent," said Hughes, a veteran programmer. "We're confident our programming competitions test and reflect real-world coding skills in a way that's valuable to our constituents. Our fast-growing membership base is already proof of that. By hosting these competitions, TopCoder will provide the means for leading companies to recruit, assess and hire the upper echelon of computer programmers."</P>
<P>Sixteen programmers from some of the nation's top schools for computer science will compete for the $100,000 grand prize and an overall purse of $250,000. The 16 finalists are: Jon McAlister, Daniel Wright and David Pecora (Stanford University); Andrew Nierman, Jason Dillaman and James Lee (University of Michigan); Nathan Egge and Alex Kalita (Virginia Polytechnic Institute and State University); Benjamin Jackson and Sean Stanek (Iowa State University); Jason Woolever (MIT); Kenneth Tang (University of California, San Diego); Jason Wodicka (Rensselaer Polytechnic Institute); Aleksey Kurchuk (Rutgers University); Chad Wood (University of Texas at Austin); and, Andrew Marut (Worcester Polytechnic Institute).</P>
<P>The finalists have been divided into groups of four, based on scoring during the preliminary online qualification rounds. The four first place winners from the June 5 and June 6 semi-final rounds will compete in the final championship round on June 7. The tournament will be held concurrent with Sun Microsystems' Java One conference.</P>
<P>TopCoder leverages the results of its competitions like the Collegiate Challenge Tournament to create a national database of talent-differentiated student and professional programmers. This database, coupled with TopCoder's unique rating system, provides prospecting employers a means to efficiently and cost-effectively source, evaluate and select talent. Companies gain access to the TopCoder database through various subscriptions and sponsorships, utilizing member profile and statistical information to make informed hiring and marketing decisions. While the current competitions are based on the Java programming language, other competitions in other languages, like C++, are currently in development.</P>
<P>Several competitions are scheduled for the remainder of 2001 including TopCoder's first professional tournament, the TopCoder Invitational. The Invitational will begin in September with a series of online elimination rounds and culminate in November with a final round of competition onsite at the Foxwoods Resort Casino in Connecticut. The total purse for the TopCoder Invitational will also be $250,000. For more information and registration details, visit the Web site, www.topcoder.com.</P>
<P CLASS="smallText">About TopCoder, Inc.<BR/>TopCoder, Inc. organizes and runs programming competitions for its members. Through its Web site, www.topcoder.com, the company has effectively combined attributes of online gaming, recruiting and IT certification. By offering substantial membership incentives, including cash awards, and a unique objective rating model, TopCoder brings together highly qualified, talent-differentiated programmers and acts as a conduit for companies seeking access to such a group. As a commercial site, TopCoder establishes partnerships with organizations in the form of subscriptions and sponsorships.</P> 
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
