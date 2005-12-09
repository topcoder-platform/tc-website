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
        <TITLE>Student Seeks TopCoder Computer Title</TITLE>
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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/southbendtribune.jpg" ALT="" WIDTH="565" HEIGHT="51" BORDER="0"/></DIV><BR/><BR/>
<P><B>Student seeks top computer title</B></P>

<P>
By KEN BRADFORD<BR/>
Tribune Staff Writer <BR/>
</P>

<P>
Jeremy Haubold remembers how he got started in computer programming.
</P>

<P>
"My dad started me at age 5," he said. "He thought it would be a useful skill, and I just started playing around with it."
</P>

<P>
Now a senior at Purdue University, Haubold has earned a place among the top young programmers in the country.
</P>

<P>
He and 15 other finalists are awaiting the annual Collegiate Challenge Computer Programming Tournament. The finals in the tournament, sponsored by Sun Microsystems and TopCoder, will be April 19 and 20 in Cambridge, Mass.
</P>

<P>
The top prize is $100,000.
</P>

<P>
"A hundred grand would be nice," said the son of Tim and Fran Haubold of South Bend. "It would pay for grad school."
</P>

<P>
It may seem a distant dream -- he's ranked 12th among the 16 finalists -- but he plans on giving it his best effort.
</P>

<P>
The second of seven Haubold children, he was home-schooled. He feels he's found his niche with his double major in computer science and mathematics at Purdue.
</P>

<P>
He joined the TopCoder competitions this year after a company representative visited Purdue. In basic terms, the challenge is to come up with the best code to solve a specific problem.
</P>

<P>
Here's a very simplified version of a problem: We'll give you a sentence. Create a program that finds the letter used most commonly in it.
</P>

<P>
A challenge like that might take three to five minutes. In a true TopCoder event, students are given three problems to solve in 75 minutes.
</P>

<P>
He qualified for the finals by competing in a series of online elimination rounds, beginning in February. He's ranked third among Midwest participants and already has earned $2,625 in prize money.
</P>

<P>
"I love competing," Haubold said. "Ideally, these are things that will prepare me for the job market."
</P>

<P>
He likes the work, too. Many of the top people in his field are interested more in management, but he still enjoys the math and logic work.
</P>

<P>
"I don't think I'll ever want to stop coding," he said.
</P>

<P>
His longer-term goals are to attend graduate school in computer sciences and he would like to have a career that involves artificial intelligence.
</P>

<P>
Jack Hughes, TopCoder founder, said the contest brings attention to the top talent in the industry.
</P>

<P>
With 6,000 collegiate members, TopCoder is well aware how bright its finalists are.
</P>

<P>
"Given the pedigree of these outstanding students, it is clear that we have identified the future leaders of software development and the technology industry," he said, in a news release.
</P>

<P>
Haubold chose Purdue because it has one of the 20 best computer science schools in the country. Several of the other finalists are from elite schools like Stanford, MIT and the University of California-Berkeley.
</P>

<P>
"Some of these are just better than me," he said, laughing.
</P>

<P>
And this isn't a competition that allows for a lot of last-minute study or preparation.
</P>

<P>
"Chances are, you didn't get this far without knowing how to do this," he said.
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
