<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/spons_demo_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
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
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
	<!-- Global Seconday Nav Begins -->		
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
  <xsl:with-param name="image">about_tc_sponsr</xsl:with-param>
  <xsl:with-param name="title">&#160;Demographics Overview</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">                
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
                <TR> 
          			<TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>
                </TR>
	            <TR>
                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		            <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">DEMOGRAPHICS LINKS:</TD>
	            </TR>                    
	            <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
					<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#FFFFFF">
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_demo_gen" CLASS="bodyText">General</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_demo_stud" CLASS="bodyText">Students</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_demo_prof" CLASS="bodyText">Professionals</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:sponsorships@topcoder.com" CLASS="bodyText">Contact sponsor sales</A></TD>
						</TR>
						<TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
					</TABLE>
		          	</TD>
        		</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
					<P>TopCoder's online programming competitions provide sponsors with a venue to target a much desired professional and student developer demographic via TopCoder's website, the competition applet, and opt-in match announcement and match summary/results emails.</P><BR/><BR/><BR/><BR/><BR/>
					<DIV ALIGN="center">
					<!--top inner table-->
					<TABLE WIDTH="75%" BORDER="1" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_gray_bg.gif">
					<TR><TD ALIGN="left" CLASS="statText">Overall, members are the biggest driving force behind new membership in TopCoder, with <SPAN CLASS="statTextBig">word of mouth accounting for over 31&#37;</SPAN> of weekly new membership. 
					Emails forwarded from Faculty accounts for more than 10&#37; of weekly growth.<BR/><BR/>Competition is the primary interest of both the student &#40;59&#37;&#41; and professional &#40;71&#37;&#41; demographic in comparison to cash prizes and employment opportunities.</TD></TR>
					</TABLE></DIV>
					<DIV ALIGN="center"><BR/><BR/>
					<TABLE WIDTH="75%" BORDER="0" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_gray_bg.gif">
					<TR>
						<TD ALIGN="left" WIDTH="47%" VALIGN="top" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Professional Profile</TD>
						<TD ALIGN="center" WIDTH="6%" VALIGN="top" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="8" HEIGHT="1" BORDER="0"/></TD>
						<TD ALIGN="left" WIDTH="47%" VALIGN="top" CLASS="statTextBig" BACKGROUND="/i/steel_blue_bg.gif">Student Profile</TD>
					</TR>
					<TR>
						<TD ALIGN="left" WIDTH="47%" VALIGN="top" CLASS="statText">
						<B>Industry Influence</B><BR/>
						26&#37;&#32;&#32;recommend technology direction and product purchasing for their organization.<BR/><BR/>
						19&#37;&#32;&#32;of professional member's organizations spend &#36;10 million or more annually on Information Technology.<BR/><BR/>
						<B>Primary Interest</B><BR/>
						66&#37;&#32;&#32;are focused on Software Development both personally and professionally. Game Software Development, Networking and Web are other primary interests.<BR/><BR/>
						<B>Industry Representation</B><UL>
						<LI>64&#37;&#32;&#32;Computers - Software</LI>
						<LI>11&#37;&#32;&#32;Computers - Consulting</LI>
						<LI>3&#37;&#32;&#32;&#32;Computers - Networking</LI>
						<LI>3&#37;&#32;&#32;&#32;Systems Software Development</LI></UL>
						<B>Company Position</B><UL>
						<LI>42&#37;&#32;&#32;Application Developer</LI>
						<LI>12&#37;&#32;&#32;Software Architect</LI>
						<LI>9&#37;&#32;&#32;&#32;Software Team Leader</LI>
						<LI>7&#37;&#32;&#32;&#32;Systems Analyst/Designer</LI></UL><BR/>
						</TD>
						<TD ALIGN="center" WIDTH="6%" VALIGN="top" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
						<TD ALIGN="left" WIDTH="47%" VALIGN="top" CLASS="statText">
						<B>School Penetration</B><BR/>
						TopCoder's student membership represents 699 schools with an average of 10 members at each school.<BR/><BR/>
						<B>Top Five Schools</B><BR/>(by member count)<UL>
						<LI>U. of Mich. Ann Arbor - 184</LI>
						<LI>MIT - 182</LI>
						<LI>U. of Texas Austin - 133</LI>						
						<LI>Georgia Tech - 129</LI></UL>						
						<LI>Virginia Tech - 127</LI>

						<B>Education to Workforce</B><UL>
						<LI>30&#37;&#32;&#32;planned 2002 graduates</LI>
						<LI>27&#37;&#32;&#32;planned 2003 graduates</LI>
						<LI>21&#37;&#32;&#32;planned 2004 graduates</LI></UL>
						<B>Degree Concentration</B><UL>
						<LI>79&#37;&#32;&#32;Bachelors</LI>
						<LI>16&#37;&#32;&#32;&#32;Masters</LI>
						<LI>5&#37;&#32;&#32;&#32;Doctorate</LI></UL><BR/>
						</TD>
					</TR>
					<TR>
						<TD ALIGN="left" VALIGN="bottom" WIDTH="47%" CLASS="bodyText" BGCOLOR="#FFFFFF"><A HREF="/index?t=about_tc&amp;c=spons_demo_prof" CLASS="bodyText">:: Professional Charts</A></TD>
						<TD ALIGN="center" WIDTH="6%" VALIGN="top" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
						<TD ALIGN="left" VALIGN="bottom" WIDTH="47%" CLASS="bodyText" BGCOLOR="#FFFFFF"><A HREF="/index?t=about_tc&amp;c=spons_demo_stud" CLASS="bodyText">:: Student Charts</A></TD>
					</TR>
					</TABLE></DIV><BR/>

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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
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
