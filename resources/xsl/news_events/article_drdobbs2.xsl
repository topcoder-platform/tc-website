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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/drdobbs.gif" ALT="" WIDTH="217" HEIGHT="77" BORDER="0"/></DIV><BR/><BR/>
<P><B>And the winner is...</B></P>
<P>Okay, I'll grant you that programming contests don't have the, well, sex appeal of a celebrity boxing match between Tonya Harding and Paula Jones. Nor, for that matter, do they have the excitement of Stone Cold Steve Austin and Diamond Dallas Page slam-bamming in the ring, or Jeff Gordon and Rusty Wallace bumping and grinding around the track. Still, considering that countless coding contests are going on at any one time, you have to wonder - what's the big deal?</P>
<P>Programming competitions come in every color and flavor, and are held for all sorts of reasons, the least of which is that they can be both instructive and fun. Even DDJ has sponsored its share of competitions, the "Data Compression Contest" (February 1991) and "Handwriting Recognition Contest" (January 1993) come to mind. On top of that, DDJ has published articles by contest winners like Eric McRae who discussed his winning project for a Motorola 68HC16 design contest (see "Avoiding Microcontroller Processing Pile-ups," October 1993) and Friedger M&#252;ffke's Moving Letter Box in "The Curl Programming Environment" (September 2001). Then there's the University of Lethbridge's GoFigure contest (mentioned last month in this space), which challenged high-school students to decipher an encrypted message in order to win a scholarship.</P>
<P>One reason for putting on a contest is publicity. That's likely what's behind NEC Electronics' recently announced "Esprit de K0RE" 8-bit microcontroller design contest (http://www.necel.com/K0REcontest). Just for entering, you get the K0RE System Design Kit (assembler, C compiler, flash programmer, and target board), and for winning an NEC-Mitsubishi 50-inch Plasma Sync flat-panel display. Likewise, Borland has again cranked up its community contests (http://codecentral.borland.com/codecentral/ccweb.exe/contests). Although the first one is likely over by the time you read this, you can still learn from reviewing the entries.</P>
<P>The Google search-engine folks have a different reason for sponsoring a programming contest they have a problem that needs solving. They want to know what interesting things you can do with 900,000 of Google's web pages (http://www.google.com/programming-contest/). The grand prize of $10,000 sounds okay, too.</P>
<P>Another reason to hold a contest is to make money. That's what Topcoder (http://www.topcoder.com/), a business that designs and hosts ongoing coding competitions as a commercial endeavor, is all about. Depending on the contest, you can take home thousands of dollars. For its part, Topcoder makes its money from corporate sponsors and companies that use contests as an employment screening tool.</P>
<P>Then there are the more academic-like contests, such as the Loebner Prize (http://www.loebner.net/Prizef/2002_Contest/loebner-prize-rules-2002.html) which presents an annual cash award to the designer of a computer system that best succeeds in passing a variant of the Turing Test. The International Olympiads in Informatics (IOI) has for more than a decade been the premier academic Olympiads for high-school students worldwide. Organized by the United Nations Educational, Scientific, and Cultural Organization (UNESCO), IOI's goal is to promote the art and science of computer programming. And for the first time this year, IOI will be hosted in the United States, on the campus of the University of Wisconsin-Parkside (http://www.uwp.edu/academic/mathematics/usaco/ioi2003web/index.htm). Similar to IOI, the American Computer Science League (http://www.acsl.org/acsl/) has organized computer-science and programming contests for junior and senior high-school students around the world for more than 20 years. Forget about the big bucks, however. Winning schools receive copies of Microsoft-donated software (Visual C++, Visual Basic, and the like), along with trophies, and top-scoring students get programming books.</P>
<P>For students, the big kahuna of coding contests is the ACM Intercollegiate Programming Contest (http://icpc.baylor.edu/icpc/). Every year since 1970, more than 17,000 students representing 1300-plus universities from 67 countries have competed for scholarships, prizes, and bragging rights.</P>
<P>One of my favorite contests is the legendary International Obfuscated C Code Contest (http://www.ioccc.org/), where the challenge is to write the most obscure/obfuscated C program, while illustrating the importance of programming style. Interestingly, the 1986 grand winner of the Obfuscated C contest was Larry Wall of Perl fame. Of course, Perl now has its own Obfuscated Perl Code Contest (http://www.sysadminmag.com/tpj/obfuscated/) where the tongue-in-cheek objective is "to determine who can write the most devious, inhuman, disgusting, amusing, amazing, and bizarre Perl code." Now and again, proponents of other languages - Visual Basic, Java, PHP, and the like - hold obfuscated code contests of their own.</P>
<P>This isn't to say that every contest is worth the salt that seasons it. Some are outright scams. More often than not, however, the good in coding competitions outweighs the bad. Programming contests generate interest and enthusiasm. They provide instruction and recognition. They stimulate creativity and reward intellectual achievement. And then, of course, there are the prizes. Some of them have really cool prizes.</P>
<P>Jonathan Erickson<BR/>
editor-in-chief<BR/>
jerickson@ddj.com</P>
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
