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
        <TITLE>Sixteen Finalists Announced in 2002 TopCoder Invitational</TITLE>
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
<P><B>Sixteen Finalists Announced in 2002 TopCoder Invitational</B><BR/>
Computer Programming Tournament Will Award $50,000 to Champion</P>

<P>
GLASTONBURY, CT., Nov. 11, 2002 - TopCoder, Inc., the leader in on-line programming competition and skills assessment, today announced the 16 finalists who have advanced to the final rounds of the 2002 TopCoder Invitational.  The second annual tournament, which will award cash prizes totaling $150,000, will hold its semifinal and championship rounds November 22 - 23 at Mohegan Sun in Uncasville, CT.  The tournament champion will take home $50,000.  
</P>

<P>
The "Sweet 16" field of onsite competitors is comprised of the following top programmers:
</P>
<P>
Derek Kisman, Waterloo, Ontario, Canada<BR/>
Reid Barton, Arlington, MA<BR/>
Nathan Bronson, Chapel Hill, NC<BR/>
John Dethridge, Camberwell, Victoria, Australia<BR/>
Ben Wilhelm, Seattle, WA<BR/>
Tomas Rokicki, Palo Alto, CA<BR/>
Daniel Wright, Lafayette, CO<BR/>
Dan Adkins, Berkeley, CA<BR/>
Ambrose Feinstein, Orlando, FL<BR/>
David Arthur, Durham, NC<BR/>
Ruoming Pang, Princeton, NJ<BR/>
Tom Sirgedas, Novi, MI<BR/>
Lars Hellsten, Toronto, Canada<BR/>
Sergey Kalinichenko, San Francisco, CA<BR/>
Jared Showalter, Cambridge, MA<BR/>
Zhiyan Liu, Princeton, NJ <BR/>   
</P>

<P>
Over the past several months, thousands of developers around the world have competed at TopCoder for the coveted tournament spots.  All finalists advanced to the tournament's onsite rounds based on their performance in a series of online elimination rounds, which began in October.  After these rounds, only the best 16 remain standing.  "TopCoder's objective programming tournaments identify and promote some of the best and brightest developers in the world.  These individuals represent the future leaders of software development and of the technology industry," said TopCoder founder and chairman, Jack Hughes.  "TopCoder has more than 20,000 members from around the globe, and our membership increases each day.  These 16 have elevated themselves above a crowded field and should be proud of the fact that they have made it to the final onsite rounds.  I'm sure some of them are quite relieved as well.  We look forward to seeing them all at Mohegan Sun."
</P>

<P>
<B>Global Representation</B> <BR/>
The field of finalists includes citizens from Australia, Canada, China and the United States.  Due to travel limitations, three would-be finalists will be unable to attend the onsite finals in Connecticut.  Jiazhi Wu and Jiqing Tang, both students from Zhejiang University in Hangzhou, China, and Yi Chen, a student at South China University of Technology in Guangzhou, China, advanced to the finals based on their performance in the most recent elimination round.  Their tournament spots went to the next highest scoring competitors.  
</P>

<P>
In addition, TopCoder welcomes Zhiyan Liu as the first female to advance to the finals of its major tournaments.  Liu, a student at Princeton University, is making her second TopCoder tournament appearance. 
</P>

<P>
Despite being open to both student and professional TopCoder members, college students outnumber professional programmers in the tournament.  In total, 10 students are making an appearance in the onsite finals.  Princeton University and MIT each have two representatives in the tournament finals.  Other schools represented are Duke University, Oberlin College, Stanford University, University of California - Berkeley, University of Central Florida, University of Melbourne (Australia), University of Michigan - Ann Arbor, and the University of Waterloo (Canada).
</P>

<P>
This is the second annual Invitational tournament and fourth major programming tournament hosted by TopCoder.  The 2002 Sun Microsystems and TopCoder Collegiate Challenge was held in April 2002, and was won by Daniel Wright, then a junior at Stanford University in Stanford, CA.  "We are not surprised to see Daniel back in the finals of this tournament.  He is typically a force to be reckoned with in our competitions," added Hughes.
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
