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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/stanforddaily.gif" ALT="" WIDTH="408" HEIGHT="36" BORDER="0"/></DIV><BR/><BR/>
						TopCoders battle for top prize<BR/><BR/>
						Cynthia H. Cho<BR/><BR/>
						Within the next two weeks, either Jon McAlister or Daniel Wright could be $100,000 richer. McAlister and Wright, both juniors majoring in computer science, will be competing in the TopCoder Invitational Tournament, to be held Nov. 2nd and 3rd at the Foxwoods Resort &amp; Casino in Mashantucket, Conn.<BR/><BR/>
						The tournament has a grand prize of $100,000 and a total prize package of $250,000.<BR/><BR/>
						McAlister and Wright are two of the 16 finalists who have advanced to the championship rounds based on their scores from online elimination rounds. Going into these rounds, McAlister is seeded second and Wright is seeded first.<BR/><BR/>
						This is not the first appearance for either in a TopCoder tournament; last June, McAlister finished second and won $25,000 in TopCoder's Collegiate Challenge, while Wright tied for ninth and won $5,570.<BR/><BR/>
						"It is particularly noteworthy that both have been able to make to both the finals of [the Collegiate Challenge] and the current TopCoder Invitation," said Jack Hughes, the founder and chairman of TopCoder, Inc.<BR/><BR/>
						"The competition for the invitational has been fierce," Hughes said. "We applaud their ability to make it to the finals for a second time in a row and wish them the best of luck in the finals."<BR/><BR/>
						McAlister has been competing in computer programming tournaments since high school.<BR/><BR/>
						"My high school teacher. . . organized student teams every year for local, state and national math and programming contests, and with my interest in math and computer science, it wasn't long until our paths intersected," he said.<BR/><BR/>
						He started competing in TopCoder tournaments after he saw a flyer on a bulletin board in the Gates Computer Science Building and has continued since then.<BR/><BR/>
						McAlister said he is looking forward to the upcoming invitational.<BR/><BR/>
						"I'm excited. I get a free trip to Connecticut . . . and I have a chance to earn another year's worth of tuition at Stanford," he said.<BR/><BR/>
						"Also, I've met some other cool contestants through my participation and I hope to meet some more," he said.<BR/><BR/>
						Wright said he has been coding since early elementary school.<BR/><BR/>
						"I've liked to write small programs that do cool tricks for ages - it became a hobby that ultimately led to my major because I really enjoyed doing it," he said.<BR/><BR/>
						Like McAlister, Wright has also been competing in computer programming tournaments since he was in high school.<BR/><BR/>
						"In high school, I did some math competitions, and the people I met there told me about the computer programming competitions, so I tried entering them and did well [the] first time, so I carried on," he said.<BR/><BR/>
						Even as the highest-ranked competitor going into the invitational, Wright admitted that he is a little nervous.<BR/><BR/>
						"There is a large element of randomness in each contest, so while I've done quite well recently in other TopCoder [competitions], there's a very high chance that I'll have a bad day at this tournament," he said.<BR/><BR/>
						While Wright may be nervous about this tournament, both he and McAlister are the heavy favorites.<BR/><BR/>
						"Based on their performance in the Collegiate Challenge and their success [thus far] in the invitational, which is open to professionals as well as collegians, they are arguably two of the top programmers in the country," said Adam Loss, TopCoder's director of public relations.<BR/><BR/>
						The tournament is comprised of three parts.<BR/><BR/>
						First is the "Coding Phase," during which the competitors have 75 minutes to code a solution to three different algorithmic problems using either Java or C++.<BR/><BR/>
						This is followed by the "Challenging Phase," during which the competitors can open their opponents' coded solutions and challenge their answers.<BR/><BR/>
						The competition closes with the "System Test Phase," during which TopCoder's main computer figures out who has most successfully coded the algorithms.<BR/><BR/>
						The goal of the tournament, as well as of TopCoder, Inc., is to identify and promote the best computer programmers in the country, according to Loss.<BR/><BR/>
						"By hosting competitions, providing the forum for a national event, and awarding significant prizes, TopCoder provides a means for the most talented individuals to be recognized," he said.<BR/><BR/>
						"Our hope is that these individuals will garner the attention and praise they deserve," Loss said.<BR/><BR/>
						With the tournament only two weeks away, Wright has been competing in weekly single-round contests in preparation.<BR/><BR/>
						"I find them to be good practice, in addition to being a good source of income - each pays $300 if I'm lucky," he said.<BR/><BR/>
						McAlister, on the other hand, has a different approach.<BR/><BR/>
						"When I can, I will play the song 'Car Wash' repeatedly before [the] contest. It's a high school tradition that has worked well to calm anxiety."<BR/><BR/>
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
