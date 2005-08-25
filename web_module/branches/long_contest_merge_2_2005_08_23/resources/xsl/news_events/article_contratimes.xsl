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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/contratimes.jpg" ALT="" WIDTH="562" HEIGHT="40" BORDER="0"/></DIV><BR/><BR/>
<P>Posted on Wed, Apr. 10, 2002<BR/><BR/>
Computer wiz takes on high on-line stakes<BR/>
By Jackie Burrell<BR/><BR/>
STAFF WRITER</P>
<P>The garb runs more toward college sweatshirts than leather flight jackets, but the competition at TopCoder is as real as anything Tom Cruise faced at Miramar. And Top Gun's Maverick and Goose wouldn't stand a chance against Zorbat Hut or Orinda's Bigg_nate in the battle for coding supremacy.</P>
<P>For 12,000 young computer programmers, TopCoder.com offers a chance to test one's programming skills against some of the best and brightest. There is prestige. There is money. And down the road, there may be lucrative job offers.</P>
<P>TopCoder is Jack Hughes' latest nom de Web, an on-line vehicle for computer programming competition that pits hundreds of young software coders against each other in semi-weekly challenges. The real action is at MIT later this month when 16 national finalists go head-to-head for the Collegiate Challenge championship and $125,000 in prize money.</P>
<P>It's a tantalizing proposition for Miramonte graduate Nate Paymer, a math and computer science major at Cal Tech. Seeded sixth in the Western region, Paymer is one of those vying for the title of TopCoder.</P>
<P>Paymer is, in TopCoder parlance, a Cinderella : a star who appeared out of nowhere last fall.</P>
<P>With a computer programmer father and math teacher mother, Paymer was probably genetically destined for math wizardry. At Miramonte, he blended academics with sports and music, but it wasn't until the jazz drummer hit Cal Tech that his interest in computer science surfaced. On a lark, Paymer entered his first TopCoder match last November. And the rest has been as easy as, well, pi.</P>
<P>Those semi-weekly matches consist of solving three programming problems, ranging in difficulty. Puzzles might involve sending gladiators through a maze or reversing a series of randomly expressed letters from upper to lower case and vice-versa, so that "AbcDeFghiJ" becomes "aBCdEfGHIj."</P>
<P>With a 75-minute deadline, 500 or so programmers vie to solve the puzzles by writing code in C++ or Java programming languages, and submitting the results on-line. Their program must complete the maze or flip the letters in eight seconds or less, flawlessly, and points are awarded for speed and accuracy.</P>
<P>"It's mostly the intellectual challenge. I really like the feeling when it works. It's satisfying," says Paymer.</P>
<P>In the second round, the programming solutions : the code : is tested by all the other contestants. Anyone can challenge another contestant's code, find the flaws and disqualify his opponent. Successful challenges bring additional points, faulty challenges cost points : and points are everything.</P>
<P>"We look at each other's code and try to break it. I think that part's really fun," says Paymer. "You're trying to understand code you've never seen before. There are many different ways to solve a problem and some people try a completely new or different approach."</P>
<P>For the players, it's not just the beauty of the algorithm. There is intellectual challenge, serious prize money and future prospects. Collegiate Challenge sponsor Sun Microsystems and other high tech, TopCoder supporters are keeping an eye on this next generation of programmers, and Hughes calls these 16 finalists "the future leaders of software development and the technology industry."</P>
<P>Paymer left the novice ranks behind many months ago. Now, the Cal Tech junior eyes next week's finals with just a hint of trepidation, despite his designation as "one of the most impressive coders in the 2002 Collegiate Challenge," according to the Web site.</P>
<P>One star will emerge from the big challenge next week, garnering hoopla and prize money. Then the cycle begins again. Another match, another puzzle, and yet more high tech pi in the sky.</P>
<P>------------------------------------------------------------------------<BR/>
(c) 2001 cctimes and wire service sources. All Rights Reserved.<BR/>
http://www.bayarea.com</P>
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
