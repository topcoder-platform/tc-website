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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/wenachtee_world.gif" ALT="" WIDTH="354" HEIGHT="79" BORDER="0"/></DIV><BR/><BR/>
						'Not a typical computer nerd'<BR/><BR/>
						September 12, 2001<BR/>
						By Dee Riggs, World staff writer<BR/><BR/>
						Andy Nierman has always done well with numbers. Really well.<BR/><BR/>
						He got the top grades in his classes, scored "off the board" in state and national math tests and just genuinely loved the subject, says his mother.<BR/><BR/>
						But Doris and David Nierman wanted more from their son. They let his math interests blossom but steered him steadily into athletics. Their efforts culminated in 1992, when he and his partner won the state tennis doubles championship.<BR/><BR/>
						The Niermans wanted a well-rounded son.<BR/><BR/>
						That, it would seem, is what they got.<BR/><BR/>
						Consider the accomplishments this year for Nierman, 27. In May, his Ultimate Frisbee team at the University of Michigan took fifth in nationals. Earlier in the year, he made it to the quarter finals in boxing as part of the university's team.<BR/><BR/>
						"I lost to a guy from the Citadel," he says. "Navy and the Citadel are both in our region so it's kind of a tough region."<BR/><BR/>
						And in June, while taking a break from work on a doctorate in computer science, Nierman won $25,000 in a computer programming competition. The TopCoder Collegiate Challenge was open to college students in the United States and Canada.<BR/><BR/>
						"He's not a typical computer nerd," says his mother.<BR/><BR/>
						She says she wasn't surprised to hear that he was one of 16 finalists for the contest, sponsored by TopCoder Inc. The California company runs contests to judge the abilities of computer programmers and uses that information to help match programmers with employers. As a finalist, Nierman received $3,000 and a flight to San Francisco for the finals.<BR/><BR/>
						She also wasn't worried about how her son would handle the pressure of competition.<BR/><BR/>
						"He's a relaxed person," she says. "Our kids have always done well in competitions. They're used to competing in sports. When they get under pressure, they do well. They get that from their Dad."<BR/><BR/>
						Dave Nierman was a top athlete for the former Peshastin-Dryden high school in the 1960s.<BR/><BR/>
						And maybe from Benjamin Franklin. Doris says the Niermans are related -- about nine generations back -- to the great inventor.<BR/><BR/>
						Whatever the reason, Andy is a 1992 Cashmere High School graduate who will surely rival other classmates for "most successful" honors at his 10-year reunion.<BR/><BR/>
						First off, he got full-tuition scholarships to Pacific Lutheran University where he earned a degree in computer science in 1996. Scholarships paid his way through studying for a masters in computer science and computer engineering at the University of Michigan. And he is now on a full-ride scholarship as he pursues his doctorate at that university.<BR/><BR/>
						This spring, Nierman entered the TopCoder competition after seeing an advertisement in the university's engineering department. After three rounds of testing, which spanned about a month, he learned in mid-May that he was one of 16 finalists.<BR/><BR/>
						If he got first place, he'd win $100,000. The next three, top-scoring competitors would take home $25,000.<BR/><BR/>
						The chance to win some money couldn't have come at a better time. Nierman had a July 1 date to marry junior high school teacher Tisha Giesbrecht. They had plans to honeymoon in Hawaii, then haul their belongings cross country to an apartment in Ann Arbor, Mich. Nierman also had his eye on a new Mac PowerBook G4, and the winnings would come in handy with that purchase.<BR/><BR/>
						But first, he had to do well in San Francisco. The competition would take place over four days. Sitting at separate work stations in two rooms, the finalists were asked to log onto the TopCoder Web site and work problems against the clock. Each day, they worked three problems, which took about 90 minutes.<BR/><BR/>
						Problems varied in intensity. Andy recalls having to write a program that would figure out, using weights of objects, how many items would fit into a backpack. Another problem involved programming a computer to find the fastest way to get from one city to another. "It isn't like you're looking at a map and saying, 'Well, this is easy,' " he says. He had to compute a program that would work for any city that the testers plugged in at a later time.<BR/><BR/>
						Then things got a bit cutthroat as competitors critiqued each other's work. If you found a problem, it worked in your favor. If you missed a problem -- or criticized something that was not a problem -- you lost points.<BR/><BR/>
						The competitors used a computer language called Java, which is used to create Web-based programs that can work on different computer operating systems.<BR/><BR/>
						Is there joy in this?<BR/><BR/>
						"It's kind of a grind," Andy admits, but the end result -- a computer that does what you tell it to do -- is rewarding. "It's like you're an inventor, creating these little programs that do work for you," he says.<BR/><BR/>
						Was the competition hard?<BR/><BR/>
						"If you have a day to sit down and solve these problems, then they're not too hard," he says. "The hard part is having to solve all three of these in an hour and 15 minutes, code them all on the computer and not make any mistakes."<BR/><BR/>
						In the end, he says, he just wasn't fast enough to beat a student from the Massachusetts Institute of Technology.<BR/><BR/>
						"I wasn't too bummed," he says. "I got some money and a free trip."<BR/><BR/>
						One other thing: the honor of being a finalist is a feather in his resume. Andy figures it will look good when he starts looking for post-doctorate employment.<BR/><BR/>
						But you won't find him pounding on the doors at Microsoft or any of the corporate giants that hire computer programmers. Nierman wants to teach. He's hoping for a spot on a university campus that is about the size of his first alma mater, PLU.<BR/><BR/>
						"I like the interaction with students, the more laid-back atmosphere, I guess," he says.<BR/><BR/>
						His mother thinks he'll make a good teacher.<BR/><BR/>
						"He's very sociable and people really like him," she says. "And he's good with other people. Of course, I'm his mother so I'm prejudiced."<BR/><BR/>
						Dee Riggs can be reached at 664-7147 or deeriggs@wenworld.com <BR/><BR/>
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
