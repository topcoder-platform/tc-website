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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/mhtlogo.gif" ALT="" WIDTH="218" HEIGHT="79" BORDER="0"/></DIV><BR/><BR/>
						Code warrior hits big time<BR/><BR/>
						6/18/2001<BR/>
						By Jeff Miller<BR/><BR/>
						Jason Woolever is $100,000 richer thanks to his coding ability.<BR/><BR/>
						It's not a monster signing bonus. The recent MIT computer science graduate student came out on top in the first-ever programming competition put on by a Glastonbury, Conn. startup called TopCoder Inc.<BR/><BR/>
						The TopCoder Collegiate Challenge initially took place online over several months. About 130 college students participated. Earlier this month, the 16 finalists converged on San Francisco to compete in-person for a $250,000 total purse.<BR/><BR/>
						The finals consisted of five rounds, each of which was broken down into three phases. In the first phase, contestants have a limited amount of time to complete three programming assignments, which vary in difficulty. The more difficult problems are worth more points, and the faster a contestant programs, the higher the score.<BR/><BR/>
						In the second phase, the coders peer at their opponents' code, searching for bugs. Contestants who find bugs see their scores increase; programmers with buggy code lose points they gained in the first phase.<BR/><BR/>
						Finally, in the third phase, TopCoder's system bangs away at the remaining code; if the code breaks, the contestant loses points.<BR/><BR/>
						"TopCoder emphasizes a different way of programming," Woolever said. "They focus on speed and you don't have time for comments, which aren't useful anyway, since you're going to run it right away. It's kind of the hacker philosophy."<BR/><BR/>
						Woolever, 22 and from the town of Erin in upstate New York, heard about the competition from a friend at Stanford University, who knew that Woolever had participated in other programming competitions.<BR/><BR/>
						When he heard how much money was at stake, his interest was piqued.<BR/><BR/>
						"That's a lot of money involved," Woolever said.<BR/><BR/>
						There were some tight moments when it looked as if the $100,000 prize might slip away. In the semifinals, for example, Woolever finished the most difficult, and most valuable, problem in the round with nearly an hour to spare - earning him important points for speed.<BR/><BR/>
						Afterward, however, he realized he'd left out a small, vital piece of code. His program would fail. His stomach sank.<BR/><BR/>
						"As it turned out, though, I made it up by challenging other people's code," Woolever said.<BR/><BR/>
						Woolever had worked out a system for tearing apart his opponents' programs. Previously, when he simply dove straight into the code, he discovered that he began to think like the programmer and, therefore, missed bugs.<BR/><BR/>
						"Before you look at the code," Woolever said, "if you look for specific problems, you can find them and nail them."<BR/><BR/>
						Even more impressive, Woolever's specialties are C and C++ rather than Java, the computer language used in the competition.<BR/><BR/>
						"Oh, I can get along in Java," Woolever quipped.<BR/><BR/>
						Woolever's not sure what he'll do with his money, yet. Maybe a car, maybe a downpayment on a house. Right now he's consumed with starting his new job as a senior research and development engineer at Synopsys in Sunnyvale, Calif.<BR/><BR/>
						TopCoder isn't finished with competitions. In fact, it's just getting started. <BR/><BR/>
						Individual rounds of competition take place weekly with prizes up to $300.<BR/><BR/>
						Its next large tournament, the TopCoder Invitational, will be open to college students and professionals alike. The competition will probably include both Java and C/C++.<BR/><BR/>
						Online initial rounds have already begun, although there's still room for new contestants. Finalists will compete in November in Las Vegas for a $350,000 purse, with a grand prize of $100,000.<BR/><BR/>
						"The idea of the company," said Jack Hughes, chairman of TopCoder, "is that employers are looking for high-talent entrepreneurs."<BR/><BR/>
						TopCoder plans to make money through competition sponsorships and subscriptions, through which companies can gain access to participants. There is no charge to competing programmers.<BR/><BR/>
						"It's still early," Hughes said of his angel-backed company. "There's not a lot of revenue yet, but we're growing. In March, when we started recruiting (participants) we had 20 to 30. Now, we've had 1,574 programmers registered as members for our contests."<BR/><BR/>
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
