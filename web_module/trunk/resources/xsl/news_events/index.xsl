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
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="2" CELLSPACING="0" BGCOLOR="#FFFFFF">
		<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="23" BORDER="0"/></TD></TR>
						
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Press Releases <!--Archive--> - 2002</TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
		<!-- <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;05.28.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.globe.com/dailyglobe2/126/business/Tournaments_become_latest_high_tech_recruiting_tool+.shtml" TARGET="_blank" CLASS="bodyText">Tournaments Become Latest High-tech Recruiting Tool</A></TD></TR> -->
        <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;10.30.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_10_30_02" CLASS="bodyText">TopCoder Competitions Expand to High Schools</A></TD></TR>
        <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;10.28.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_10_28_02" CLASS="bodyText">TopCoder Announces Field for the 2002 TopCoder Invitational Programming Tournament</A></TD></TR>
        <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;10.22.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_10_22_02" CLASS="bodyText">TopCoder Expands to Include Employment Services</A></TD></TR>        
        <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;08.13.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_08_13_02" CLASS="bodyText">Sun Microsystems and TopCoder Host SunNetwork(SM) Coding Challenge</A></TD></TR>        
        <TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;05.28.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_05_28_02" CLASS="bodyText">TopCoder Adds China, New Zealand and Ireland To Its Developer Community</A></TD></TR>
<!-- 		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_drdobbs2" CLASS="bodyText">And the winner is...</A></TD></TR>
		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.30.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.stanforddaily.com/tempo?page=content&amp;id=8146&amp;repository=0001_article" CLASS="bodyText" TARGET="_blank">Wright Sweeps Most Recent TopCoder Championship</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.22.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://www.admin.mtu.edu/urel/breaking/2002/codewin.html" CLASS="bodyText" TARGET="_blank">Michigan Tech Student Wins $5,000 in TopCoder Competition</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.20.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://ADTmag.com/article.asp?id=6296" CLASS="bodyText" TARGET="_blank">Student Wins $100K in Collegiate Programming Challenge</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.20.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="http://boston.internet.com/news/article/0,,2001_1013931,00.html" CLASS="bodyText" TARGET="_blank">College Code King Crowned</A></TD></TR>	-->	
		
<!-- 				<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.11.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_04_11_02" CLASS="bodyText">Student seeks top computer title</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.11.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_04_11_02b" CLASS="bodyText">BHS grad has shot at winning $100,000 in computer contest</A></TD></TR>		
<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.10.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_contratimes" CLASS="bodyText">Computer wiz takes on high on-line stakes</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.10.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_04_10_02" CLASS="bodyText">CS Major Competes for $100K</A></TD></TR>		
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.08.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_stanforddaily4" CLASS="bodyText">Students advance to TopCoders finals</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.08.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_04_08_02" CLASS="bodyText">Extra credit</A></TD></TR> -->		
<!-- 		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.06.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_marietta" CLASS="bodyText">Georgia Tech computer science major to compete in TopCoder . . .</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.05.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_dnvrbizjrnl2" CLASS="bodyText">Coder wins big in contests</A></TD></TR>
		<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.01.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=article_clevplain" CLASS="bodyText">Digital Playground</A></TD></TR> -->
						<TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;03.25.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_03_25_02" CLASS="bodyText">TopCoder Announces Sixteen Finalists for $150,000 Sun Microsystems and TopCoder Collegiate Challenge</A></TD></TR>											
						<TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;03.05.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_03_05_02" CLASS="bodyText">TopCoder Reaches 10,000 Members Milestone</A></TD></TR>						
						<TR><TD VALIGN="top" CLASS="bodyText" HEIGHT="14">&#160;02.19.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_02_19_02" CLASS="bodyText">TopCoder Announces Field for the 2002 Sun Microsystems and TopCoder Collegiate Challenge Programming Tournament</A></TD></TR>          
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;01.28.02</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_01_28_02" CLASS="bodyText">TopCoder Adds the United Kingdom To Its Developer Community</A></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD></TR>
						
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Press Releases <!--Archive--> - 2001</TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;12.10.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_12_10_01" CLASS="bodyText">Sun Sponsoring 2002 Collegiate Challenge</A></TD></TR>           
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;11.06.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_11_06_01" CLASS="bodyText">Houston Native Jon McAlister Wins $250,000 TopCoder Invitational</A></TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;10.15.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_10_15_01" CLASS="bodyText">TopCoder Announces Sixteen Finalists For $250,000 Invitational Tournament</A></TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;09.24.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_09_24_01" CLASS="bodyText">Foxwoods to Host $250,000 TopCoder Invitational Tournament</A></TD></TR>
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;06.07.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_06_07_01" CLASS="bodyText">Jason Woolever Wins 2001 TopCoder Collegiate Challenge</A></TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.29.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_05_29_01" CLASS="bodyText">TopCoder Addresses Demand for Elite Programmers with Coding Competitions</A></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;05.22.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_05_22_01" CLASS="bodyText">Sixteen Collegiate Programmers to Compete for Coveted "TopCoder" Title</A></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" HEIGHT="14">&#160;04.24.01</TD><TD VALIGN="middle" CLASS="bodyText"><A HREF="/index?t=news_events&amp;c=pr_04_24_01" CLASS="bodyText">TopCoder Names Jack Hughes Chairman of the Board</A></TD></TR>                                                      
						<!-- <TR><TD COLSPAN="2" CLASS="bodyText"><BR/><BR/>Please direct media related questions to:<BR/><A HREF="mailto:gherchen@topcoder.com" CLASS="bodyText">George Herchenroether, VP of Marketing</A></TD></TR> -->
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
