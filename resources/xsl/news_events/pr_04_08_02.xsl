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
        <TITLE>TopCoder: Extra credit</TITLE>
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
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="smallText" COLSPAN="2" HEIGHT="18">&#160;</TD></TR>
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Articles - 2002</TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/brainerddispatchcom.gif" ALT="" WIDTH="450" HEIGHT="76" BORDER="0"/></DIV><BR/><BR/>
<P><B>Extra credit</B></P>

<P>
The Brainerd Junior High School speech team recently completed its tournament season. Heart of the Lakes conference awards were presented to the top speakers in each of the 13 Minnesota State High School League categories: Natasha Leyk, earned second in discussion; Kayla Wallin, second in serious prose; and Carmen Cummings, third in humorous interpretation. Other team members were Brad Folta, Sarah Jacobson, Vincenza Spagnuolo, Meghan Hagedon, Brittany Steinkraus, Danielle Knopik, Ashley Goedker, Amy Espersen, Kaiji Ollila, Amanda Wooden and Kayna Schindele. 
</P>

<P>
Sara Hemquist, Baxter, had her work published in the 2001-02 edition of Shelterbelt, a compilation of creative writing and artwork by Northern State University students. 
</P>

<P>
The North Central Service Cooperative awarded scholarships to students in 10th-12th grades from 12 school districts recently at its annual recognition program in Staples. Students recognized would not otherwise be honored at a local or regional level. Area scholarship winners are Kelly Trowbridge, Crosby-Ironton School District, earned a $250 scholarship from MacNeil Environmental; Matt Langer, Pierz, and Jennifer Alt, Pillager, both earned $100 from Blue Cross Blue Shield; Nicholas Ogborn, Crosby-Ironton, $100 from the NCSC leadership team; Nickole Graves, Aitkin, $150 from Horace Mann Insurance; and Justin Nash, Aitkin, won a DVD player. Other students recognized were Jeremy Vought and Carime Saxvold, both of Pequot Lakes; and Jennie Virnig, Pierz. 
</P>

<P>
Students from Brainerd High School competed at the Minnesota Distributive Education Clubs of America career development conference in Minneapolis in March. The team placed seventh in free enterprise and in the top 12 in travel and tourism. Members on the DECA team are Sarah Anderson, Jose English, Rick Kelm, Chelsey Kron, Jenni Lange, Rick Litke, Andrea Smith, Becka Theien, Art Tuttle, Dan VanEssen and Kris Vitale. Litke and Tuttle also were honored for their yearlong DECA work. 
</P>

<P>
The following area students were named to the national honor roll list for the 2001-02 school year and will receive an application for a $1,000 community contributions scholarship: Karen Cox, Tracy Kuchinski, Krystal Steinert, Kayla Koval, Matheu Weidenbach, Jason Forcier, Kate Fogle, Andy Smith and Rachel Hoben, all high school students in Little Falls; Alicia Wright, Lacey Nelson, Christy Hanson, Nickole Andert, Kelli Lecy, Jacquline Windschitl, Nicole Bender, Lemuel Berry, Kelsey Mjelmeland and Shayla Groess, all high school students in Staples/Motley; Kristin Tiggelaar, Heather Arnold, Alesha Kuschke, Tiffany McLellan, Christine Fox, Mike Langer, Kristy Bender, Laura Knierim, Jeremy Wicek and Tiffany Varilek, all high school students in Pequot Lakes; Jennifer Knowlen, high school student in Brainerd; Derek Saint Onge, Erin Catlin, Amber Buttler, Anthony Jackson, Nickole Graves, Jacqueline Baker, Kyle Bender, Dawna Butcher, Ann Davies, Nathan Horner, Katie Haberkorn, Melissa King, Katie Martin, Jacob Mehr, Jamie Miller, Stephanie Olson, Levi Baer, Daniel Appel, Jennifer Oxborough and Jason Esler, all high school students in Aitkin; Derek Haukos, Holly Sander, Tina Weitemier, Steven Perpich, Megan Beseres, Kate Beaman, Kristi Burgwald, Timothy Faatz and Michael Herda, all high school students at Crosby-Ironton. 
</P>

<P>
Curtis Johnson, a first-grader at Lowell Elementary School in Brainerd, read and reported on 100 books in the Red Tape program. 
</P>

<P>
The Cuyuna Range Lions Club is offering its $1,000 John Lindahl Memorial Scholarship to a Crosby-Ironton High School senior. The scholarship committee met April 4. 
</P>

<P>
Amy Wacker, the daughter of James and Debbie Wacker of Brainerd, was awarded a $500 scholarship from the Minnesota State University Moorhead Alumni Foundation for the 2002-03 school year. 
</P>

<P>
Stephanie Burnham, the daughter of Jan and Steve Burnham of Brainerd, submitted a poem to a contest sponsored by Creative Communication, based in Utah, and it was selected from thousands of entries as one of the top 10 in her grade division. Burnham is a fifth-grader at Pillager Elementary School. Burnham will be recognized in the poetry anthology called "A Celebration of Young Poets" and she will receive a $50 savings bond. 
</P>

<P>
Jim Esser, a 1998 graduate of Brainerd High School, recently was selected as one of 16 finalists to compete in the upcoming final rounds of the 2002 Sun Microsystems Inc. and TopCoder Collegiate Challenge tournament on April 19-20 in Cambridge, Mass. 
</P>

<P>
Esser is a senior computer sciences major at the University of Minnesota's Institute of Technologies in the Twin Cities. 
</P>

<P>
The tournament has a total prize purse of $150,000 with the winner receiving $100,000. The tournament began with 512 competitors. 
</P>

<P>
He's the son of Steve and Marie Esser of Brainerd.
</P>


<P>About TopCoder, Inc.</P>
<P>TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The best performing members are invited to compete in annual tournaments.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information and registration details visit www.topcoder.com.</P>
<P><BR/></P>
						</TD></TR> 
					</TABLE>
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
