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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/lafayetteflagnew.gif" ALT="" WIDTH="332" HEIGHT="48" BORDER="0"/></DIV><BR/><BR/>
						Wright second in TopCoder event<BR/><BR/>
						By DOUG PIKE<BR/>
						Staff writer<BR/><BR/>
						When a friend brought a TopCoder flyer to Daniel Wright's Stanford University residence nine months ago, the 20-year-old computer science major was intrigued.<BR/><BR/>
						The organization, which conducts biweekly on-line computer programming competitions, provided the opportunity for Wright to branch out in his chosen field of study and the chance to compete with his peers across the country.<BR/><BR/>
						Saturday, Nov. 3, it also gave him a shot at $100,000.<BR/><BR/>
						Wright, whose family relocated from South Africa to Lafayette following his high school graduation in 1999, was one of four finalists in the TopCoder $250,000 Invitational tournament in Mashantucket, Conn. Saturday. The Stanford junior walked away with a second-place finish and $25,000 in his pocket for two days' work in front of a monitor.<BR/><BR/>
						"When I started competing in TopCoder, I didn't expect anything of this sort," said Wright, who competed in his first programming competition as a high school sophomore. "I was quite surprised by my success. The U.S. has quite a reputation for these kinds of things."<BR/><BR/>
						For the national invite, TopCoder, which has recruited nearly 50,000 members since its inception in February, pitted its top 256 members in the early rounds of the competition, which were contested online.<BR/><BR/>
						The first round whittled the field down to 64. Then next round dropped that number to 32, with the following round reducing the remaining hackers to an elite group of 16.<BR/><BR/>
						Wright, TopCoder's top-ranked programmer coming into the competition, easily made the final cut and was seeded sixth for the finals.<BR/><BR/>
						TopCoder flew each finalist and a guest to Connecticut's Foxwoods Resort Casino for the final two days of competition.<BR/><BR/>
						Instead of the informal on-line format, competitors waged war with their keyboards on stage in a gameshow atmosphere provided by the casino. But the event didn't exactly allow for the showmanship of the Price is Right or Wheel of Fortune.<BR/><BR/>
						"What they're given is three algorithms; 250-, 500-, and 1000-point questions in an 80-minute decoding phase," explained TopCoder representative Adam Loss. "They code solutions to the algorithms using Java or C++ (programming languages) with more points for a faster completion time."<BR/><BR/>
						At the end of the initial 80-minute period, contestants receive points for the amount of the work they were able to solve. The hard part for contestants is knowing whether or not they have completed an algorithm, and where their opponents are in the process.<BR/><BR/>
						"There are a whole bunch of things that let you know how you're doing individually, but you never know if you've completely solved the problem," Wright said. "And you don't know how your opponents have done until it's over."<BR/><BR/>
						That's where the second phase of competition comes into play.<BR/><BR/>
						In the second phase, opponents are allowed to review and compare codes with one another to look for mistakes. Correctly challenging an opponents' code results in an additional 50 points.<BR/><BR/>
						Finally, codes are sent to the main computer in a "system test phase" to check for accuracy.<BR/><BR/>
						In the finals, Wright was edged out only by fellow Stanford junior Jon McAlister. McAlister's 1,143 points barely exceeded Wright's 1,072, but both were well beyond third-place finisher Nathan Bronson who ended the day with 650. In addition to his $25,00 check for winning in the semifinal round, McAlister was also paid $75,000 for the finals win - a grand total of $100,000.<BR/><BR/>
						Wright, who won TopCoder's collegiate competition this spring, has collected $37,950 from programming competitions this year alone. But he said the money won't be splurged.<BR/><BR/>
						"I'm going to try to be reasonable with it," Wright said. "I'll put some of it toward my education - Stanford isn't exactly inexpensive."<BR/><BR/>
						Neither will Wright's services after graduation. One of the main attractions associated with programming competitions is the corporate recognition the top achievers are able to generate.<BR/><BR/>
						"That's what TopCoder is ultimately for - employment purposes," Wright said. "This will definitely go on my resume."<BR/><BR/>
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
