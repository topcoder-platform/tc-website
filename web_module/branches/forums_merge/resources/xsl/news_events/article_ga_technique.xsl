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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/ga_technique.gif" ALT="" WIDTH="310" HEIGHT="93" BORDER="0"/></DIV><BR/><BR/>
						Tech student makes TopCoder semifinals<BR/><BR/>
						By Sriram Narasimhan<BR/>
						Contributing Writer<BR/>
						ATLANTA<BR/>
						November 9, 2001<BR/><BR/>
						Perhaps what the computer programmer needed most, excluding, of course, more processing power, was a company with a simple and sound mission statement demonstrating its desire to reverse the traditional stereotypes encapsulating the profession.<BR/><BR/>
						That desire for social change became a reality in 2000, when a man named Jack Hughes founded TopCoder, a Connecticut-based company that regularly runs tournaments that bring the most skilled computer programmers in the country together. Contestants compete against one another to solve a variety of tasks in either the Java or C++ programming language.<BR/><BR/>
						This past Friday and Saturday, TopCoder hosted the first-ever $250,000 TopCoder Invitational Computer Programming Tournament in Foxwoods Resort Casino in Mashantucket, CT. It was just one of numerous rounds of tournaments in which members of the always expanding company compete. However, what makes this particular competition especially significant is that one of the finalists in the competition, Trayton Otto, is a student at Georgia Tech.<BR/><BR/>
						"TopCoder gave me an avenue to tackle problems that I could not tackle in a classroom. It's brought my programming to a whole new level," Trayton Otto, a second year Computer Science major, said. "I've learned rapidly as a result of classes and TopCoder combined...I'd recommend it to anyone who's interested in programming to expand their abilities."<BR/><BR/>
						Otto was one of 15 finalists in the competition that not only included students from other prestigious colleges in the country, but also professional computer programmers.<BR/><BR/>
						Otto's task in the finalist round was divided into three computer problems of increasing difficulty which he chose to solve using Java. The first asked Otto to calculate the least number of moves that could be taken to move a red checker piece from one side of a checkerboard to the other, while still moving past the black pieces. The second program enabled a user to input a single, arbitrary string into the interface and receive as an output, a series of multiple strings. The final, as well as the most difficult, required the competitor to design a program that would perform the basic mathematics functions on inputs containing very large numerical values.<BR/><BR/>
						Although Trayton Otto was not the winner of the $100,000 grand prize, he still won $3,000 for making it to the semifinalist level. John McAlister from Stanford University, won the tournament.<BR/><BR/>
						"It was definitely a good group who came to the contest. A lot of the programming skill came from their innate ability," said McAlister, whose computer program aimed to investigate some of the mathematical representations in residential telephone lines.<BR/><BR/>
						The starting point for Otto, McAlister, and every other programmer, is TopCoder's website, www.topcoder.com, which is not only the hub to forums where programmers such as Otto discuss solutions to various problems, but also where anyone interested can take a look at the company's mission statement and the rationale for its existence.<BR/><BR/>
						In addition, there are links directly on the website to documents concerning equal economic status compared to other professions in the United States. Long-term goals such as these were the impetus for the founding of the company.<BR/><BR/>
						"Programmers are looked at as a community as a whole, where it is difficult to differentiate between one and the next...it doesn't specify in terms of skills, as do the various professions in tween one and the next as do the various professions in medicine. TopCoder gives [programmers] a name," Rob Hughes, the COO of the company, said.<BR/><BR/>
						"This was a great way to show potential employers their skills, much more than one could in a traditional interview. Programmers must be compensated accordingly for the work they perform."<BR/><BR/>
						In addition, TopCoder frequently allows companies to sponsor their tournaments, both reducing the cost of the competitions as well as providing a name to potential employers.<BR/><BR/>
						Over 125 people sign up on the website daily as new members. Experienced members have been known to average nearly five hours a week either competing in small tournaments, or collectively discussing solutions to problems in TopCoder.<BR/><BR/>
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
