<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/about/public_about_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: About TopCoder</TITLE>
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
	<!-- Global Seconday Nav Begins -->		
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="public_about_left"/>
	<!-- Global Seconday Nav Ends -->	
<!-- Left Column Include Ends -->
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><br/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">about_tc_sponsr</xsl:with-param>
  <xsl:with-param name="title">&#160;Demographics Overview</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
                <TR><TD VALIGN="middle" CLASS="smallText" COLSPAN="3" HEIGHT="18"><BR/><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/>
                <A HREF="/index?t=about_tc&amp;c=spons_demo_gen" CLASS="smallText">&#160;General Charts</A> :: 
                <A HREF="/index?t=about_tc&amp;c=spons_demo_prof" CLASS="smallText">&#160;Professional Charts</A> :: 
                <A HREF="/index?t=about_tc&amp;c=spons_demo_stud" CLASS="smallText">&#160;Student Charts</A></TD>
                </TR>
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
					TopCoder's online programming competitions provide sponsors with a venue to target a much desired professional and student developer demographic via TopCoder's website, the competition applet, and opt-in match announcement and match summary/results emails.<BR/><BR/>
					<DIV ALIGN="center">
					<!--top inner table-->
					<TABLE WIDTH="400" BORDER="1" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_gray_bg.gif">
					<TR><TD ALIGN="left" CLASS="statTextBig">Overall, members are the biggest driving force behind new membership in TopCoder, with word of mouth accounting for over 30&#37; of weekly new membership. Emails forwarded from Faculty accounts for more than 12&#37; of weekly growth.<BR/><BR/>Competition is the primary interest of both the student &#40;48&#37;&#41; and professional &#40;62&#37;&#41; demographic in comparison to cash prizes and employment opportunities.</TD></TR>
					</TABLE><BR/><BR/>
					<!--unique stat table-->
					<TABLE WIDTH="400" BORDER="1" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_gray_bg.gif">
					<TR><TD ALIGN="left" CLASS="statTextBig"><UL>
					<LI>00% submits at least two solutions per match</LI>
					<LI>00% has successfully submitted on the 500 or 1000 point question</LI>
					<LI>00% has successfully challenged other coders for additional points</LI>
					<LI>00% has competed in 10 or more matches</LI>
					<LI>00% competes at least twice a month</LI></UL>
					</TD></TR>
					</TABLE><BR/><BR/>
					<TABLE WIDTH="400" BORDER="0" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_gray_bg.gif">
					<TR>
						<TD ALIGN="left" WIDTH="190" VALIGN="top" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Professional Profile</TD>
						<TD ALIGN="center" WIDTH="8" VALIGN="top" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
						<TD ALIGN="left" WIDTH="190" VALIGN="top" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Student Profile</TD>
					</TR>
					<TR>
						<TD ALIGN="left" WIDTH="200" VALIGN="top" CLASS="statTextBig">
						<B>Industry Influence</B><BR/>
						40&#37;&#32;&#32;recommend technology direction and product purchasing for their organization.<BR/><BR/>
						22&#37;&#32;&#32;of professional member's organizations spend &#36;10 million or more annually on Information Technology.<BR/><BR/>
						<B>Primary Interest</B><BR/>
						68&#37;&#32;&#32;are focused on Software Development both personally and professionally. Game Software Development, Networking and Web are other primary interests.<BR/><BR/>
						<B>Industry Representation</B><UL>
						<LI>57&#37;&#32;&#32;Computers - Software</LI>
						<LI>14&#37;&#32;&#32;Computers - Consulting</LI>
						<LI>7&#37;&#32;&#32;&#32;Computers - Networking</LI>
						<LI>7&#37;&#32;&#32;&#32;Systems Software Development</LI></UL>
						<B>Company Position</B><UL>
						<LI>35&#37;&#32;&#32;Application Developer</LI>
						<LI>14&#37;&#32;&#32;Software Architect</LI>
						<LI>9&#37;&#32;&#32;&#32;Software Team Leader</LI>
						<LI>8&#37;&#32;&#32;&#32;Project Manager</LI></UL><BR/>
						</TD>
						<TD ALIGN="center" WIDTH="10" VALIGN="top" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
						<TD ALIGN="left" WIDTH="200" VALIGN="top" CLASS="statTextBig">
						<B>School Penetration</B><BR/>
						TopCoder's student membership represents 380 schools with an average of 36 members competing from the top schools.<BR/><BR/>
						<B>Top Five Schools</B><BR/>(by member count)<UL>
						<LI>111&#32;&#32;MIT</LI>
						<LI>78&#32;&#32;&#32;Virginia Polytechnic</LI>
						<LI>72&#32;&#32;&#32;Stanford University</LI>
						<LI>62&#32;&#32;&#32;Carnegie Mellon</LI>
						<LI>59&#32;&#32;&#32;University of Michigan Ann Arbor</LI></UL>
						<B>Education to Workforce</B><UL>
						<LI>2&#37;&#32;&#32;&#32;planned 2001 graduates</LI>
						<LI>15&#37;&#32;&#32;planned 2002 graduates</LI>
						<LI>11&#37;&#32;&#32;planned 2003 graduates</LI></UL>
						<B>Degree Concentration</B><UL>
						<LI>23&#37;&#32;&#32;Bachelors</LI>
						<LI>5&#37;&#32;&#32;&#32;Masters</LI>
						<LI>1&#37;&#32;&#32;&#32;Doctorate</LI></UL><BR/>
						</TD>
					</TR>
					<TR>
						<TD ALIGN="left" VALIGN="bottom" WIDTH="200" CLASS="bodyText" BGCOLOR="#FFFFFF"><A HREF="/index?t=about_tc&amp;c=spons_demo_prof" CLASS="smallText">:: Professional Charts</A></TD>
						<TD ALIGN="center" WIDTH="10" VALIGN="top" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
						<TD ALIGN="left" VALIGN="bottom" WIDTH="200" CLASS="bodyText" BGCOLOR="#FFFFFF"><A HREF="/index?t=about_tc&amp;c=spons_demo_stud" CLASS="smallText">:: Student Charts</A></TD>
					</TR>
					</TABLE></DIV><BR/>

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
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
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
