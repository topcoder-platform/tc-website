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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/denver_bizjrnl.gif" ALT="" WIDTH="280" HEIGHT="80" BORDER="0"/></DIV><BR/><BR/>
<P><B>Coder wins big in contests</B><BR/>
Lyn Berry-Helmlinger<BR/>
Denver Business Journal</P>
<P>Last year, Lafayette native Daniel Wright earned more money at two computer programming tournaments than many folks banked at their full-time jobs.</P>
<P>In fact, the Stanford junior made nearly $46,000 from competitions in 2001.</P>
<P>Now, Wright is once again headed into the heat of competition -- this time, to vie for a prize purse worth $150,000.</P>
<P>Wright is one of 16 finalists to advance to the championship rounds of the 2002 Sun Microsystems and TopCoder Collegiate Challenge tournament. The competition is scheduled for April 19-20 at the University Park Hotel@MIT in Cambridge, Mass.</P>
<P>TopCoder will score the contestants based on their ability to use a particular coding language under the pressure of peer-to-peer competition -- known as intensity -- and velocity, which is the ability to write quality code quickly and accurately. The winner of the tournament will receive $150,000.</P>
<P>Wright is confident about his chances in the upcoming tournament.</P>
<P>"I came very, very close to winning $100,000 in the previous Invitational contest," he said. "By the TopCoder rating system, I'm one of the highest seeds for this contest -- so maybe this time I'll be lucky."</P>
<P>Wright has entered the tournament as the second seed in the West region. This is Wright's third consecutive appearance in TopCoder's first three major tournaments, according to Adam Loss, TopCoder's director of public relations.</P>
<P>"Maybe the third time will be a charm for Daniel," said Jack Hughes, TopCoder founder and chairman. "Daniel is the only member of TopCoder to reach the final 16 in each of our first three major tournaments, which is a tremendous testament to his coding skill."</P>
<P>Previously, Wright tied for ninth and won $5,750 at the 2001 TopCoder Collegiate Challenge; he was the runner-up at the 2001 TopCoder Invitational, where he competed with a group of opponents that included professional coders -- and won $25,000.</P>
<P>He advanced to the championship rounds of the upcoming challenge based on his scoring in a series of online elimination rounds, which began with a field of 512 competitors on Feb. 19, according to Loss.</P>
<P>Wright has been a member of TopCoder since April 2001 and has won a total of $45,991 from his appearances in last year's two major TopCoder challenges and the company's weekly single-round matches.</P>
<P>"I enjoy coding and I enjoy competition, perhaps in the same way that many people enjoy competitive sports," said the computer science major. "I also like the substantial prize money -- that is perhaps the main factor that has kept me competing for so long."</P>
<P>If he excels in the upcoming competition, Wright said he plans to use the prize money for mainly practical purposes.</P>
<P>"I'll pay for my tuition and pay off my student loans first," he said. "Then, maybe I'll buy a car. Mostly, I'll try to save it for the future."</P>
<P>In the meantime, Wright said he'll continue to hone his skills by competing in TopCoder's single round matches, which are held twice a week.</P>
<P>"I think practice is the best preparation," he said.</P>
<P>Connecticut-based TopCoder, which arranges and hosts online and onsite programming competitions for its members, was created in February 2001. The organization's goal is to create a community of programmers while setting the industry standard for discerning programming skill.</P>
<P>TopCoder has more than 6,000 collegiate members.</P>
<P>"Given the pedigree of these outstanding students, it is clear that we have identified the future leaders of software development and the technology industry," Hughes said of the contestants in the upcoming Sun Microsystems and TopCoder Collegiate Challenge.</P>
<P>"These 16 have put in a tremendous effort in order to elevate above a crowded field of the best and the brightest. The energy and excitement during the online elimination rounds was amazing," he added.</P>
<P>Stans Kleijnen, vice president of market development engineering for Sun, said the company is proud to be the exclusive sponsor of the 2002 TopCoder tournament.</P>
<P>"[This competition] clearly identifies some of the best collegiate programmers in the country," said Kleijnen, in a prepared statement. "[TopCoder and Sun] are working together to empower university students to deliver cutting-edge technology presentations to their peers and gain valuable experience and industry insight in the process."</P>
<P>Copyright 2002 American City Business Journals Inc.</P>
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
