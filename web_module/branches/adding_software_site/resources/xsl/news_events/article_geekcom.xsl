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
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/geek_com.gif" ALT="" WIDTH="297" HEIGHT="70" BORDER="0"/></DIV><BR/><BR/>
						Coding competition for cash<BR/>
						posted 9:53am EST Thu Aug 30 2001<BR/><BR/>
						<b>NEWS</b><BR/>
						TopCoder.com's 2001 Invitational Programming Tournament is set to begin on September 12. Cash prizes will come from a US$250,000 purse, with $100,000 going to the winner. By registering on the TopCoder.com website, U.S. residents (including Guam, Puerto Rico, and the U.S. Virgin Islands) and Canadian residents (except for Quebec folks) 18 or over who program in Java or C++ can compete in qualifying contests to get into the top 256 rated programmers on the site. Those 256 contestants will compete online as the field is narrowed to 16. Those 16 will then be brought to the Foxwoods Resort Casino in Connecticut for the final competition on November 2nd and 3rd. This is TopCoder's second large-scale programming contest; in June of this year, Jason Woolever from M.I.T. got $100,000 as the winner of the 2001 TopCoder Collegiate Challenge.<BR/><BR/>
						Founded last year, TopCoder.com is a programming community/business "committed to identifying and promoting top-notch computer programming talent." The site's founders wanted to come up with some objective way of differentiating "the best in the profession ... from the rest of the pack" to help great programmers get the salaries they deserve. The various competitions TopCoder sponsors (mostly online) serve as that skill ranking mechanism and offer cash incentives to winners (single-round matches can get you $300). Even if you don't satisfy the competition requirements above, you can still participate in Round Tables and observe the competitions, and you also get access to employment opportunities offered to/by select corporate partners.<BR/><BR/>
						Very simply, TopCoder competitions have three phases:<BR/><ul>
						<li>Coding, where all participants get an hour to code and submit solutions to three algorithmic problems (easy, medium, and difficult)</li><BR/>
						<li>Challenge, where you can pick apart other contestants' submissions; successful challenges are rewarded with points, while those successfully challenged lose them</li><BR/>
						<li>System-Testing, where Challenge survivors' submissions are tested automatically on the TopCoder server</li></ul><BR/>
						The scoring procedure (an "objective assessment model and unique rating system") is detailed and extensively outlined on the website, focusing on "intensity, or the ability to use a particular coding language while under the pressure of competition; and velocity, the ability to write good code quickly and accurately." The rights to submitted solutions remain with the contestants, but TopCoder gets a "perpetual, royalty-free, irrevocable, non-exclusive right and license to use, reproduce and publish such code."<BR/><BR/>
						Registration (asking for General Information, Education, Experience, and Skills) is free, and there are some upcoming Single Round Matches on September 4, 6, 10, and 17. Please see TopCoder.com for much more detail.<BR/><BR/>
						<b>SAM'S OPINION</b><BR/>
						If you're a C++ or Java programmer this sounds like a no-lose experience. If you're good, you might actually win some money for working on basic algorithm solutions; if you're not, you can get better by watching people dissect your code and participating in Round Tables and such. If you submit code that you're particularly proud of, it's still yours to do with as you will, so even if TopCoder has some nefarious dudes in the background assembling good algorithm solutions into some sort of super program the company will sell later, you can still put your own competitive version out there. :)<BR/><BR/>
						I'd never heard of this site before, but it seems like a really great idea all around. I'm not sure if the founders' desire to set up some sort of objective programmer rating system will really impact programmers' salaries, but I imagine it couldn't hurt to stick your TopCoder rating or current standing on a resume ... the concept is certainly excellent. I'm also not clear on how partner corporations benefit from being partners with TopCoder (besides getting some access to good programming talent), but the site doesn't seem to hold anything back in terms of detail (check out the website--you won't believe how much info is there), so I'd be surprised if there were anything shady going on.<BR/><BR/>
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
