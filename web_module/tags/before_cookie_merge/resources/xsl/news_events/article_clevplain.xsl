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
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Articles - 2002</TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/plaindealer.jpg" ALT="" WIDTH="310" HEIGHT="32" BORDER="0"/></DIV><BR/><BR/>
<P><B>Digital playground</B><BR/><BR/>
04/01/02<BR/>
Chris Seper<BR/>
Plain Dealer Reporter</P>
<P>In the seventh grade, Matt Crowley wrote his first computer program.</P>
<P>He made the words "Hello world" flash in three-dimensional type across his parents' computer screen.</P>
<P>World, say hello again to Matt Crowley 2.0 - an upgraded version of the youngster who built that first program. Nowadays, the 16-year-old sophomore helps oversee a computer network security system he created for his high school.</P>
<P>Now meet Alexander Mosby, a senior at Glenville High School who got interested in computers a little more than a year ago. Today he knows so much he's won up to $75,000 in scholarships to study computer science.</P>
<P>And here's Ben Wilhelm, a sophomore at Oberlin College who loathes computer science classes. He's favored to take home $100,000 in a nationwide computer programming contest later this month.</P>
<P><B>Part of larger group</B></P>
<P>Dozens of Alexes, Matts and Bens pepper Northeast Ohio. They're creating new software, building computers and constructing homemade versions of the Palm Pilot.</P>
<P>They are cropping up thanks in part to efforts by schools and industry to attract talented youth to technology. New computer classes and big-time competitions are making kids take notice or drawing out those who have a natural affinity for the field.</P>
<P>So while Northeast Ohio may struggle when it comes to adopting information technology, younger Ohioans are going high tech.</P>
<P>"I think this generation is taking notice of the fact that technology is the future and everybody is gradually, no matter what field they want to be in, going to be involved with technology," Mosby said. "They are taking it upon themselves to learn about technology."</P>
<P>Younger generations often lead the charge into new fields, but the trend seems more pronounced when it comes to technology, say educators and industry leaders.</P>
<P>TopCoder, the national programming contest in which Wilhelm is a finalist, just opened its college and professional competitions to high school students.</P>
<P>"I think the general population would be amazed by what 16-, 17- and 18-year-olds could make a computer do," said Tom Longo, vice president of membership at TopCoder. "Many of the collegiate programmers are as talented or more talented than many of our professional members."</P>
<P><B>Code monkey'</B></P>
<P>Crowley got into coding after his father challenged him to write that first "Hello World" program. Now, he's a self-described "code monkey" and wears a popular programmer T-shirt that plays off the Latin phrase Cogito Ergo Sum - I Think Therefore I Am.</P>
<P>Crowley's shirt says Codito Ergo Sum - I Code Therefore I Am.</P>
<P>Holy Name High School technology coordinator Dan Moderick discovered Crowley's talents while working with the school's network security system.</P>
<P>The security system regulates what users can do on the computer system, restricts access to different areas and removes different options - such as accessing the Control Panel - throughout an entire network.</P>
<P>Every time Moderick ran into a glitch in his professional software, Crowley would say, "I can write you something for that."</P>
<P>Crowley wound up writing so much for the network that Moderick dumped the professional software and went with Crowley's Amoeba SecureCast, which was named after one of his best friend's nicknames in a lab class.</P>
<P>To make sure it was safe, a friend of Crowley's kept hacking into the program. Crowley kept making repairs until the two couldn't break through any more.</P>
<P>"Just seeing your work actually help something and work on a computer makes you feel good and make more programs," Crowley said.</P>
<P><B>On the fast track</B></P>
<P>Mosby would have never thought the biggest muscle would be his mind. The avid weightlifter who bench-presses more than 250 pounds had always wanted to study sports medicine.</P>
<P>But he said computers give him an express lane to his dreams. During a presentation about new computer networking classes at Glenville last year, Mosby learned it could take him two to four years to be ready for a $70,000-a-year computer job - no more than half the time it would take him to get to that level in sports medicine.</P>
<P>"It's a career where advancement is more rapid and salary is higher and the hours are less," Mosby said.</P>
<P>So he started plugging away in computer classes and on his own started tinkering with computers. He periodically joins other students at the nonprofit Computer Assisting People Inc., refurbishing computers for needy organizations.</P>
<P>Once, over the course of a couple of days, he built his home computer from spare parts.</P>
<P>He has won a pair of scholarships. The first is from New Horizons Computer Learning Center to pay for books, training and tests to become a Microsoft Certified Systems Engineer - one of two primary certifications in computer networking.</P>
<P>He will take the test to become a Cisco Certified Network Associate, the other primary certification, this summer. He plans to study computer science at the University of Pittsburgh, where he is also receiving a full tuition scholarship renewable each year.</P>
<P>"I like the speed in which the technology grows," Mosby said. "I am always amazed day in and day out. When I got into computers the new 500 MHz processor was out. Now they are talking about 2.2 gigahertz, and I know what a processor does - that's the more amazing thing."</P>
<P><B>Getting help or going alone</B></P>
<P>Both Crowley and Mosby had a little help along the way via teachers and programs that were able to let them pursue their zest for technology.</P>
<P>Moderick took a relatively unprecedented step of letting a student run his high school network (Moderick and Crowley know how to run the system).</P>
<P>"I trusted him," Moderick said. "I told him, 'You have a multimillion system and you get to play with it.' "</P>
<P>Mosby was funneled into new Cisco Network Academy classes in the Cleveland city schools which started in 2000. Students in high schools including Glenville, Lincoln-West and James F. Rhodes learn computer networking and are prepared to take some certification exams.</P>
<P>Many well-paying computer jobs don't necessarily require college degrees, but instead a series of computer certifications, according to a study by the Greater Cleveland Growth Association.</P>
<P>But many technology-inclined students - as is the case with Wilhelm - often don't find mentors through school. He has taken only two computer classes on his way to a six-figure payoff.</P>
<P>First a physics major, then a philosophy major and now undecided, the Oberlin sophomore just happened along a basic computer-programming book in the early 1990s while scrounging up cash to buy the SimCity video game.</P>
<P>"There was a study on human reflexes that paid $15 if you went and [participated]," Wilhelm said. "I went over there and was interested in the computer panels on the screen. They showed me the code, and I didn't understand it. So they gave me an introduction to basic programming."</P>
<P>After writing smaller programs, the Seattle native wrote a free program that repairs corrupted computer files. For a time, the program could be downloaded from some popular Web sites.</P>
<P>Wilhelm doesn't think he's doing anything spectacular in the competition at TopCoder. He says he just processes these things faster than anyone else.</P>
<P>TopCoder challenges programmers by forcing them to solve various problems.</P>
<P>For example, competitors had to find the cheapest way to travel from one place to another, knowing the distance between a handful of gas stations, the price of gas at each station and that they would have to buy a drink at each place.</P>
<P>"There is a sort of beauty in making big, complex things that work well, and there's nothing more complex than computer programs," he said. "You do that and show it to someone and that's pretty."</P>
<P>While he's still trying to figure out a major, Wilhelm said he won't take computer science.</P>
<P>"There are so many bad computer science programs out there," he said. "Besides, there's more to life than computer science."</P>
<P>Teachers and technology advocates say they still have problems luring bright kids from more popular activities like sports or glamorous professions like medicine and law.</P>
<P>Only a handful of girls are in the ranks of Cleveland's young tech elite - a nationwide problem that the region's new programs still haven't addressed.</P>
<P>Mosby, who, along with weightlifting, writes poetry and leads Glenville's chess team, said the toughest part of getting students interested is that "kids are kids."</P>
<P>"Most of my friends think they are going to the NBA," he said, laughing. "But they are taking notice [of technology]."</P>
<P>Contact Chris Seper at:<BR/>
cseper@plaind.com, 216-999-5405<BR/><BR/>
&#64;2002 The Plain Dealer. Used with permission.<BR/>
Copyright 2002 cleveland.com. All Rights Reserved.</P>
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
