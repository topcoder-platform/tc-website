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
        <TITLE>Field Announced for 2002 TopCoder Invitational</TITLE>
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
		            <TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P><B>Field Announced for 2002 TopCoder Invitational</B><BR/>
              Programmers From Around the World to Vie for a Share of $150,000</P>

<P>
GLASTONBURY, CT., Oct. 28, 2002 - TopCoder, Inc., the leader in on-line programming competition and 
skills assessment, today announced the field of 64 finalists for the 2002 TopCoder Invitational.  
The tournament, which will award cash prizes totaling $150,000, began on October 8th and will culminate 
with the final rounds of competition being held November 22nd - 23rd at the Mohegan Sun Casino in Connecticut. 
"Mohegan Sun is pleased to host the final rounds of the 2002 TopCoder Invitational," said Mitchell Etess, 
executive vice president of marketing at Mohegan Sun.  "We welcome TopCoder and all the finalists to our 
facility, and we look forward to the exciting competition ahead."
</P>

<P>
<B>64 Finalists Emerge From Field of Over 1,000 Programmers</B><BR/> 
The 2002 TopCoder Invitational kicked off earlier this month with over 1,000 of the highest-rated 
TopCoder members from around the world competing for the chance to advance in the annual tournament.  
Four online eliminations rounds were held this month.  These elimination rounds resulted in a field of 64 emerging as the best coders in the world.  The 64 competitors will next compete on Wednesday, October 30th, with the 16 highest scoring members in that round advancing to the semifinal round of the tournament.  The "sweet 16" will compete in the tournament's final onsite rounds and will vie for the $50,000 grand prize.  The Semifinal and Championship rounds will be held November 22nd and 23rd at the Mohegan Sun Casino.  
</P>

<P>
<B>The Best of the Best</B><BR/>
Some fierce competition transpired this month during the online rounds, and there are some repeat appearances by some TopCoder veterans.  The reigning TopCoder Invitational Champion, Jon McAlister, has advanced to the field of 64.  The Stanford University senior, along with his classmate, Daniel Wright, continues to dominate the field.  Wright is also a veteran of TopCoder tournaments, as he won the 2002 Sun Microsystems and TopCoder Collegiate Challenge held this past April.  Wright and McAlister are seeded 8th and 23rd, respectively, in the tournament.
</P>

<P>
Five out of the top 10 tournament competitors are college students.  Reid Barton (seeded 2nd) is a sophomore at MIT.  John Dethridge (seeded 4th) has a long trip if he advances to the finals.  Dethridge is pursing his doctorate degree from the University of Melbourne in Australia.  Nathan Paymer (seeded 7th) is a senior at the California Institute of Technology.  Paymer was also a semifinalist in the 2002 Sun Microsystems and TopCoder Collegiate Challenge.  The 10th seed in the tournament is Chuong Do, a junior at Stanford University.
</P>

<P>
Although the tournament is open to both student and professional TopCoder members, college students dominate the field with 43 competitors.  The top three schools (and the number of students from each) that are represented in the 2002 TopCoder Invitational are:  MIT (7), Stanford (5), and the California Institute of Technology (3).
</P>

<P>
This is the second annual Invitational, and fourth major programming tournament hosted by TopCoder.  TopCoder's previous tournaments, and the individuals who won each tournament, are:
<UL>
	<LI> 2001 TopCoder Collegiate Challenge (June 2001):  won by Jason Woolever, a graduate student from MIT and currently a Senior Research and Development Engineer at Synopsys, Inc. of Sunnyvale, California.  </LI>
	<LI> 2001 TopCoder Invitational (November 2001): won by Jon McAlister, currently a senior at Stanford University</LI>
	<LI> 2002 Sun Microsystems and TopCoder Collegiate Challenge (April 2002): won by Daniel Wright, currently a senior at Stanford University.</LI>
</UL>
</P>
 
<P>
 "TopCoder is the authority on identifying developers with specific skills and determining their proficiency within that skill set," said TopCoder chairman and founder, Jack Hughes.  "With our membership now representing over 20,000 collegiate and professional developers working in state of the art technologies from around the world, we have been extremely pleased with our growth.  It is amazing to watch developers at this skill level compete.  All of those that have made it to this round of 64 have shown themselves to be some of the best in the world."    
</P>

<P><BR/></P>

<P>
<B>About TopCoder, Inc.</B><BR/>
TopCoder, Inc. organizes and hosts online and onsite programming competitions for its members.  With a global membership database, TopCoder members extend across all professional and collegiate levels.  The attraction of competition and the associated rewards create a powerful community of programmers.  Access to this community is granted to corporate partners who both promote and profit from the relationship.  For more information, visit www.topcoder.com.</P>


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
