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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/pcmag_logo.gif" ALT="" WIDTH="105" HEIGHT="109" BORDER="0"/></DIV><BR/><BR/>
						You Are the Fastest Coder<BR/><BR/>
						By Mary E. Behr, PC Magazine<BR/>
						May 29, 2001 1:58 PM PT<BR/><BR/>
						There will be no eating of rats, no futuristic sets with roving spotlights, and no one snapping, "You are the weakest link." When 16 finalists enter the San Francisco Hilton ballroom on June 6 to compete in the final rounds of TopCoder.com's first contest, the Collegiate Challenge, they will face only computers and the clock.<BR/><BR/>
						These 16 contenders from top schools such as Harvard, MIT, Rensselaer, Stanford, and the University of Michigan will compete for the fun, the chance of catching an employer's eye, and the $100,000 purse. The sponsor, TopCoder.com, is a Web site created for the programming community for exactly those reasons. And they must be good reasons: In the barely four months the site has been up, TopCoder has amassed 1,200 members.<BR/><BR/>
						Survival of the Fittest<BR/>
						Founder Jack Hughes got the idea for the site from his experiences in the business world. For 15 years, he ran a technical consulting firm where one of his biggest problems was identifying top programming talent. So he decided his next job would be creating a Web site to help locate excellent coders. "In society, we identify talent through competition. That idea was the basis for this site," he says.<BR/><BR/>
						A parallel goal of the site is to help programmers get jobs. That's why each player has a ranking. Hughes is lining up corporate sponsors for the tournaments and hoping that the relationships will lead to jobs for the members.<BR/><BR/>
						College Round<BR/>
						Enthusiasm for the Collegiate Challenge was drummed up the old-fashioned way: by hanging posters at universities with good computer science programs. Participants must be members of TopCoder who have downloaded the distributed applet and qualified through online rounds.<BR/><BR/>
						The online competition has three phases. The first requires writing code for three questions of varying degrees of difficulty. This typically takes an hour and a half to two hours. In the second phase, the Challenge Phase, competitors challenge each other's code for errors. The challengers had better be right, or they lose points. During the third phase, called System Test, TopCoder's system tests players' code for accuracy.<BR/><BR/>
						The Collegiate Challenge will operate in much the same way; the only difference is that it will be in person. Players will face each other in groups of four and individually solve the three problems. The winners of those rounds will meet in the final contest to determine the winner. Andrew Nierman, a 27-year-old computer science Ph.D. student at the University of Michigan, is one of the 16 finalists. He's in it for the cash. "My main motivator is the money. But it's fun, too."<BR/><BR/>
						Nierman has a special challenge: One of his good friends is also in the final 16. Is Andrew confident that he will win? "Well, it's going to be pretty tough. There's going to have to be a little luck involved. It's a high-powered group of people."<BR/><BR/>
						Speed Freak<BR/>
						What makes one person's code better than another's? Speed. "The people who can look at simple problems, pick them apart, and solve them quickly are generally the people who can solve the tougher problems as well," says Nierman.<BR/><BR/>
						Hughes says there are plans to add other measures to determine winners. "Right now we're testing three things: accuracy, ability to recognize flaws in someone else's code, and speed. But we're in the process of adding two new metrics: efficiency of code-how fast it runs; and resource usage-how much memory and disk space it uses."<BR/><BR/>
						The next meet, the Invitational, will feature 256 top coders. Held in Las Vegas in November, it will be open to both professionals and college kids, with 128 seeded seats and 128 open seats. The qualifying rounds are taking place now at http://www.topcoder.com.<BR/><BR/>
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
