<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/spons_tourny_intro.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: About TopCoder</TITLE>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
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
  <xsl:with-param name="title">&#160;Tournament Package - Public Relations</xsl:with-param>
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
		            <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">TOURNAMENT LINKS:</TD>
	            </TR>                    
	            <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
					<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#FFFFFF">
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_tourny_web" CLASS="bodyText">Web site coverage</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_tourny_applet" CLASS="bodyText">Applet coverage</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_tourny_email" CLASS="bodyText">Email distribution</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_tourny_marketing" CLASS="bodyText">Tournament marketing</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_tourny_onsite" CLASS="bodyText">Onsite arena</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_touryn_pr" CLASS="bodyText">Public Relations</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:sponsorships@topcoder.com" CLASS="bodyText">Contact sponsor sales</A></TD>
						</TR>
						<!-- <TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/i/about/srm_3pgr.pdf" CLASS="bodyText">Package overview (PDF)</A></TD>
						</TR> -->
						<TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
					</TABLE>
		          	</TD>
        		</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
					<P>Public relations is a key component of all tournament marketing. Outreach for every tournament begins immediately following the signing of a sponsor.</P>
					<P>TopCoder has received a significant amount of media coverage surrounding each of the two tournaments held to date. In addition to the releases sent out, media from around the country, 
					including television stations, have run editorials on TopCoder, the membership, semifinalists and champions, and the business model in general.</P>
					<P>See our complete list of <A HREF="/index?t=news_events&amp;c=index" CLASS="bodyText">press releases</A> and <A HREF="/index?t=news_events&amp;c=articles" CLASS="bodyText">articles</A> to date.</P>
					<P>Following is a sample from the 2002 Collegiate Challenge.</P>
					<BR/><BR/><DIV ALIGN="center">
					<TABLE WIDTH="75%" BORDER="0" CELLPADDING="4" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
					<TR>
						<TD WIDTH="50%" VALIGN="top" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Focus:</B></TD>
						<TD WIDTH="50%" VALIGN="top" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Distribution:</B></TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Announce sponsoring company</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">PRNewswire<BR/>CollegeWire</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Top 10 Schools</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">PRNewswire<BR/>CollegeWire</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Kickoff</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">PRNewswire<BR/>CollegeWire</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Regional Championship Results</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">PRNewswire<BR/>CollegeWire<BR/>Individual Campuses</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Semfinal/Championship Announcement</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">PRNewswire<BR/>CollegeWire</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Semifinal Results</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">PRNewswire<BR/>CollegeWire<BR/>Individual Campuses</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Semifinal Results "Final Four"</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">PRNewswire<BR/>CollegeWire<BR/>Individual Campuses</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Championship Results</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Photo/Caption for AP1000</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Championship Results</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Broadcast VNR</TD>
					</TR>
					<TR>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Tournament Wrapup</TD>
						<TD VALIGN="top" ALIGN="left" CLASS="statText">Broadcast VNR<BR/>Campus Promotion<BR/>TopCoder.com<BR/></TD>
					</TR>
					</TABLE></DIV><BR/>
					<A HREF="/index?t=about_tc&amp;c=spons_srm" CLASS="bodyText">What is in a SRM Package?</A><BR/><BR/>
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
