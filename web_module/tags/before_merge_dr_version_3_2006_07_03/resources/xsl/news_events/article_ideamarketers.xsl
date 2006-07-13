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
        <TITLE>TopCoder :: Press Room</TITLE>
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
  <xsl:with-param name="title">&#160;Articles</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="smallText" COLSPAN="2" HEIGHT="18">&#160;</TD></TR>
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Articles - 2001</TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/ideamarketers.gif" ALT="" WIDTH="494" HEIGHT="51" BORDER="0"/></DIV><BR/><BR/>
						Programmers Compete For Cash and Recognition<BR/><BR/>
						by Beth Sunny<BR/><BR/>
						The New Economy has created a paradigm shift in the role of computer programmers and the essential role they play in advancing the daily lives of tomorrow's businesses, governments and people. As a result, programmers are in high demand in today's economy.<BR/><BR/>
						But despite this reality, no mechanism has been developed to qualify programmers' skills to prospective employers. Furthermore, no value system or accreditation has emerged that effectively credentials elite programmers as true professionals like doctors or accountants.<BR/><BR/>
						TopCoder, Inc. hopes to change that. They have introduced a new category built on placing high value on skilled programmers. Specifically, the company hosts on-and off-line "tournaments" where programmers compete for cash. Using its unique objective rating system, TopCoder showcases real-world talent before the industries top IT firms. The concept was created earlier this year by Jack Hughes, co-founder and former chairman of Tallan, Inc., an application development professional services firm that was purchased in 2000 by CMGI.<BR/><BR/>
						[Beth] Jack, you have an interesting concept here. What is the history of TopCoder?<BR/><BR/>
						[Jack] TopCoder was founded on the premise that talent and skill are the determinant factors in the quality and utility of software - and software has become central to the global economy. In my capacities as both a programmer and an executive, I've worked on successful projects that were driven by superior programming skills, yet that talent goes unqualified and, for the most part, unrecognized. TopCoder's mission is to create objective ratings that place high value on the programming industry's best and brightest. The company will build opportunity and community for programmers through computer programming tournaments and employer connections.<BR/><BR/>
						[Beth] So how exactly do you qualify and identify the industry's best programmers?<BR/><BR/>
						[Jack] At www.topcoder.com our members compete online in real-time. Choosing Java or C++, contestants write solutions to algorithmic problems under tight time constraints. Scoring in TopCoder competitions is based on two factors: intensity, or the ability to use a particular coding language well under the pressure of peer-to-peer competition; and velocity, the ability to write good code quickly and accurately. Contest scores are calculated using TopCoder's objective assessment model then factored into the contestant's overall rating using a set of formulae created by TopCoder to fairly and accurately gauge a contestant's performance. Winners are the fastest among their peers to solve the problems with code that withstands the scrutiny of other contestants, and then our system test. <BR/><BR/>
						[Beth] What does it cost to participate?<BR/><BR/>
						[Jack] It costs our members nothing to compete but each gets a performance-based rating, a chance to win prize money, and an opportunity to get connected with companies that partner with TopCoder in the form of sponsorships. <BR/><BR/>
						[Beth] That explains the "qualifying" part. How do you help to identify and promote competitors? <BR/><BR/>
						[Jack] TopCoder leverages the results of its competitions to create a national database of talent-differentiated student and professional programmers. This database, coupled with TopCoder's rating system, provides prospecting companies a means to efficiently and cost-effectively source, evaluate and access talent. Companies gain access to the TopCoder database through sponsorships of its single round matches and major tournaments. <BR/><BR/>
						[Beth] What types of companies do you normally attract?<BR/><BR/>
						[Jack] IT companies have expressed the most interest in partnering with us. They are looking for exposure in front of an elite group of programmers who are the decision-makers and future decision-makers responsible for purchasing corporate technology products and services. Sponsors can utilize member profile and statistical information to make informed hiring and marketing decisions. <BR/><BR/>
						[Beth] What types of competitions are available for programmers and how much is at stake?<BR/><BR/>
						[Jack] While we host single round matches twice a week, where members can win anywhere from $25-$300, we also run full-blown tournaments. At our $250,000 Collegiate Challenge in June, an MIT Graduate Student won $100,000. Our next major tournament is the TopCoder Invitational, which is open to college students and professionals, and begins in September. It also has a $250,000 total purse, and will once again pay the winner $100,000.<BR/><BR/>
						[Beth] Overall, do you feel your program is a success?<BR/><BR/>
						[Jack] We're confident our programming competitions test and reflect real-world coding skills in ways that are valuable to our constituents. Our fast-growing membership base is already proof of that. Since our introduction in March, we have added over 2,600 members, for the month of August we've been averaging 18 new members a day. Such an online assembly of developers is an invaluable resource for companies whose business depends on accessing these top technologists.<BR/><BR/>
						</TD></TR>                                                                 
					</TABLE>
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
