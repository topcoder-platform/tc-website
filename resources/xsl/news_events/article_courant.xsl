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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/ctnow_logo.gif" ALT="" WIDTH="206" HEIGHT="58" BORDER="0"/></DIV><BR/><BR/>
						<b>A Game Of Their Own</b><BR/><BR/>
						By JOHN M. MORAN<BR/>
						The Hartford Courant<BR/>
						Apr 24 2001 12:00AM<BR/><BR/>
						Jack Hughes thinks computer programmers are the Rodney Dangerfields of American business: Their work can make or break a company, yet they still get no respect.<BR/><BR/>
						But Hughes, himself a programmer, is determined to change that. He's launching a high-profile tournament aimed at giving the nation's best authors of computer code a chance to strut their stuff.<BR/><BR/>
						The winner of his grueling contests, the first of which is under way, will earn $100,000 cash and the title of TopCoder. Even greater riches and recognition may soon follow in the form of a job from a major software company.<BR/><BR/>
						A far-out scheme? Perhaps.<BR/><BR/>
						But then, lots of people didn't understand Hughes' last venture, a Glastonbury-based software company called Tallan Inc. All that changed last February when, at the height of the dot-com frenzy, Hughes sold 80 percent of Tallan to Massachusetts-based CMGI Inc. for an eye-popping $920 million in cash and stock.<BR/><BR/>
						The deal made Hughes one of Greater Hartford's biggest winners in the Internet sweepstakes that burned out during the past year.<BR/><BR/>
						It also freed his time and gave him the resources to start TopCoder Inc., also in Glastonbury, as the mechanism for running the computer programming tournaments. TopCoder hopes to earn money by charging computer companies for sponsorships, and for the right to contact winning programmers.<BR/><BR/>
						The tournaments themselves mix the single-elimination format of the NCAA basketball tournament with the brain-teasing challenge of "Who Wants to Be a Millionaire?"<BR/><BR/>
						The tournament began April 7 with 256 contestants who had successfully completed a qualifying exam that tested their basic programming competence. Those contestants have embarked on a series of two-hour tests, completed online during a period of weeks.<BR/><BR/>
						To those unfamiliar with the arcane language of computer programming, the questions are mind-numbing in their complexity. Words and phrases such as "valid infix expression," "class validator," and "ArrayList argument" turn up in abundance in test questions.<BR/><BR/>
						Even more complex are the answers, which must be delivered in written computer code that has more in common with an Einstein physics formula than with standard English. Any program that works can be correct, so problems can have multiple possible solutions. But competitors can score by pointing out errors in someone else's coding. <BR/><BR/>
						Tournaments may not have the action and pageantry of live sporting events, but Hughes believes the tournaments will develop an audience of spectators.<BR/><BR/>
						"I don't think it's going to have the appeal of NASCAR, but for people interested in programming, I think there's going to be quite an audience interested from a spectator standpoint," he said.<BR/><BR/>
						Spectators will be able to discuss and root for their favorite programmers via online chat rooms set up during the competition.<BR/><BR/>
						The first TopCoder tournament, known as the TopCoder Collegiate Challenge, is under way, and is scheduled to culminate with championship rounds on June 5 and 6 at the JavaOne Conference in San Francisco.<BR/><BR/>
						Beyond the honor of the tournament victory, TopCoder winners stand to accumulate a substantial amount of money. The overall tournament champion will pocket $100,000. Lower finishers will earn anywhere from $3,000 to $25,000.<BR/><BR/>
						Later TopCoder contests - some of them one-day affairs, others the multiple-round tournaments - will be open to professional programmers, as well as students.<BR/><BR/>
						Indeed, organizers believe some programmers may become so proficient that they may literally become tournament professionals, earning their living solely from TopCoder events.<BR/><BR/>
						"There's more to this than just finding a pool of employable talent," Hughes said. "There could be people who do nothing but participate in TopCoder tournaments."<BR/><BR/>
						In time, TopCoder also hopes to expand the kinds of programming contests it holds beyond Java to other computer languages, such as C++, Perl, SQL and more.<BR/><BR/>
						Hughes traces the undervaluation of computer programming talent to historical factors that gave programmers - or "coders," as they're known in the trade - a job classification similar to those of clerks and administrative staff.<BR/><BR/>
						That classification, enshrined in federal labor law, separated programmers from other educated professionals, such as lawyers, accountants and doctors, and thus helped keep salaries down.<BR/><BR/>
						But equally important, he said, is that programmers have had no place where they could show off their talents. And that's the role TopCoder expects to fill.<BR/><BR/>
						"Programming, by nature, is very competitive," Hughes said. "I thought, 'There's got to be a better way of identifying the best people out there.' "<BR/><BR/>
						Identifying that talent is essential for software companies, for whom the right talent can mean the difference between success and failure. In fact, programming talent was so essential to the success of Hughes' last company that he renamed it from Business Data Services to Tallan, which is the Gaelic word for talent.<BR/><BR/>
						As a result, Hughes believes he'll find a ready source of corporate sponsors willing to underwrite TopCoder tournaments in return for the right to contact winners with job offers. For now, however, he's personally funding both the tournament prizes and the TopCoder organization.<BR/><BR/>
						The TopCoder model is an intriguing approach to identifying top programming talent, said John Hannon, managing director for MSA Venture Partners in Wallingford, which helps recruit and place programmers.<BR/><BR/>
						But Hannon noted that technology hiring is currently slumping at start-up and established companies alike. "It's an interesting idea, but whether or not it's got the right timing is something I would question," he said.<BR/><BR/>
						Yet Hughes remains confident of TopCoder's future despite the brutal downturn in technology and "dot-com" stocks during the past year.<BR/><BR/>
						"I don't believe the whole tech world is going to go away anytime soon," he said. "There's always been a dearth of talent, and I don't see that changing anytime soon."<BR/><BR/>
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
