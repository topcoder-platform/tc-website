<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/news_events/public_news_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
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
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="public_news_left"/>
	<!-- Global Seconday Nav Ends -->	
<!-- Left Column Include Ends -->    		
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
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
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Articles - 2002</TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.13.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://builder.com.com/article.jhtml?id=u00220021106adm01.htm&amp;rcode=&amp;page=1" CLASS="bodyText" TARGET="_blank">You'll find more than competitions at TopCoder these days</A></TD></TR>	
        <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;10.21.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.informationweek.com/story/IWK20021018S0027" CLASS="bodyText">FBI Tries E-Recruiting</A></TD></TR>        
        <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;10.14.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.informationweek.com/story/IWK20021014S0002" CLASS="bodyText">A Chance To Win A Contest And A Job</A></TD></TR>  			
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.07.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_business20" CLASS="bodyText">Show Me the C++</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.01.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_drdobbs2" CLASS="bodyText">And the winner is...</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.10.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_contratimes" CLASS="bodyText">Computer wiz takes on high on-line stakes</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.08.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_stanforddaily4" CLASS="bodyText">Students advance to TopCoders finals</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.06.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_marietta" CLASS="bodyText">Georgia Tech computer science major to compete in TopCoder . . .</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.05.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_dnvrbizjrnl2" CLASS="bodyText">Coder wins big in contests</A></TD></TR>
        <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;04.04.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.informationweek.com/story/IWK20020228S0016" CLASS="bodyText">Software Jocks Vie For The Prize</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.01.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_clevplain" CLASS="bodyText">Digital Playground</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.27.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.informationweek.com/story/IWK20020227S0002" CLASS="bodyText">Cultivating Next-Generation IT Talent</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;02.22.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_stanforddaily3" CLASS="bodyText">Annual coding competition features student entrants</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Articles - 2001</TD></TR> 
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.20.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_rmnews" CLASS="bodyText">Whiz cracks contest code</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.18.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_esj" CLASS="bodyText">Sun Sponsors Collegiate Developer Tournament</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.17.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_javaboutique" CLASS="bodyText">Sun Microsystems Launches New Way to Reach Java Community . . .</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.10.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_cnet_dec10" CLASS="bodyText">Students to compete in Java, C++ </A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.10.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_brndwk" CLASS="bodyText">Sun Microsystems Named Exclusive Sponsor of Computer Challenge</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.29.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_darwin" CLASS="bodyText">Five Thoughts about Hiring IT Professionals</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.26.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_houstonchron2" CLASS="bodyText">College student outpaces rivals to win contest</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.12.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_mht3" CLASS="bodyText">Chips &amp; Drivers: It's a digital shootout at Java corral . . .</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.12.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_lafayettenews" CLASS="bodyText">Wright second in TopCoder event</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.12.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.informationweek.com/story/IWK20011111S0004" CLASS="bodyText">Programmer Wows 'Em</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.09.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_ga_technique" CLASS="bodyText">Tech student makes TopCoder semifinals</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.09.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_citybiz" CLASS="bodyText">In Depth: High tech survivors</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.08.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.informationweek.com/story/IWK20011108S0013" CLASS="bodyText">College Junior Wins Programming Contest--And $100K</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.07.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_stanforddaily2" CLASS="bodyText">TopCoders return rich, triumphant</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.06.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_cornell" CLASS="bodyText">Grad Student Emerges at TopCoder '01</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.04.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_courant2" CLASS="bodyText">'TopCoder' Outwits His Rivals</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.01.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_cio_trendlines" CLASS="bodyText">Performance Metrics - Code for Cash</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.31.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_ucf" CLASS="bodyText">Computer Wizard a Finalist for $100,000 Prize</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.26.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_dnvrbizjrnl" CLASS="bodyText">Colorado native among nation's top programmers</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.24.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_stanforddaily" CLASS="bodyText">TopCoders battle for top prize</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.18.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_oberlin" CLASS="bodyText">Oberlin College Student Competes in TopCoder Tournament</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.12.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_sfbiztimes" CLASS="bodyText">Geekletes descend upon programming contest</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.26.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_dailyneb" CLASS="bodyText">Students compute, compete for dollars on Web site</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.12.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_wenatchee" CLASS="bodyText">'Not a typical computer nerd'</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.10.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_bglobe" CLASS="bodyText">The new rules</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.04.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_mht2" CLASS="bodyText">TopCoder Inc. offers challenge to top programmers</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.01.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_softdev" CLASS="bodyText">If You Build It, They Will Come . . .</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.24.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_ideamarketers" CLASS="bodyText">Programmers Compete For Cash and Recognition</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;08.30.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_geekcom" CLASS="bodyText">Coding competition for cash</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.27.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_micheng" CLASS="bodyText">EECS students excel in computing competitions</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.16.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_vatech" CLASS="bodyText">Virginia Tech student places 5th in national computer programming . . .</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.12.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_wpi" CLASS="bodyText">Marut Competes in Top Coder Contest</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;07.02.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_avidpro" CLASS="bodyText">Gladiator geeks...</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.26.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_techrepublic" CLASS="bodyText">Test your mettle at TopCoder.com</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.25.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_univmich" CLASS="bodyText">EECS Students Winners in TopCoder Collegiate Challenge</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.18.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_mht" CLASS="bodyText">Code warrior hits big time</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.08.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_stargazette" CLASS="bodyText">Erin native wins $100,000 in contest</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.29.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_pcmag" CLASS="bodyText">You Are the Fastest Coder</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.24.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_courant" CLASS="bodyText">A Game Of Their Own</A></TD></TR>
            </TABLE>
<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
