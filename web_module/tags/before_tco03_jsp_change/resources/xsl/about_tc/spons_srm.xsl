<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/spons_srm_intro.xsl"/>
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
  <xsl:with-param name="title">&#160;Single Round Match &#40;SRM&#41; Package</xsl:with-param>
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
		            <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">SRM PACKAGE LINKS:</TD>
	            </TR>                    
	            <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
					<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#FFFFFF">
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_srm_web" CLASS="bodyText">Web site coverage</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_srm_applet" CLASS="bodyText">Applet coverage</A></TD>
						</TR>
						<TR>
							<TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
							<TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="/index?t=about_tc&amp;c=spons_srm_email" CLASS="bodyText">Email distribution</A></TD>
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
					<P>The Single Round Match is the key component for TopCoder's membership. Every time a match is hosted, coders take part in an online competition that will either build up or bring down their rating. The outcome of this rating change is the potential change in seeding for the next scheduled tournament.</P>
					<P>Additionally, each match has earning potential for those who finish in the top spots in each of the assigned rooms for a given match.</P>
					<P>Ultimately, a match becomes the developer's equivalent of any major league sporting event where the "win or loss" affects standings &#40;in this case ratings&#41; and a possible playoff seed.</P>
					
					<!-- <P>A package consists of <B>5 single rounds</B>. These can run sequentially or over a period of months, depending upon both schedule availability and a sponsor's calendar.</P><BR/><BR/> -->
					
					<B>An Integrated Approach</B><BR/>
					<P>TopCoder reaches members through three distinct media. Each of the media venues is a unique opportunity for the sponsoring company to present its support of the event and promote brand awareness amongst the demographic. In addition to the individual media, a survey question &#40;to members&#41; is made exclusive to a sponsor.</P>
					<P><UL><LI><A HREF="/index?t=about_tc&amp;c=spons_srm_web" CLASS="bodyText">Web Site</A><BR/>
					The Web site is the primary vehicle for the competitions. In addition to providing the content, statistics, and features applicable to a match, the Web site is the primary point of entry for any match.</LI><BR/>
					<LI><A HREF="/index?t=about_tc&amp;c=spons_srm_applet" CLASS="bodyText">TC Arena Applet</A><BR/>
					The Arena Applet is where all of the excitement takes place. <B>Competitors spend an average 2.5 hours online</B> before, during and after a match! During the three phases (Coding, Challenge, and System Test) coders go head-to-head vying for points, ratings, and ultimately the cash prize.</LI><BR/>
					<LI><A HREF="/index?t=about_tc&amp;c=spons_srm_email" CLASS="bodyText">Opt-In Email</A><BR/>
					Over 80&#37; of the membership opts-in for match notification. The email program is designed to inform members of the match sponsors, key points about them, and the appropriate URL references per sponsor.</LI></UL></P>
					<P><DIV ALIGN="center"><IMG SRC="/i/about/srm_time.gif" ALT="" WIDTH="396" HEIGHT="108" BORDER="0"/></DIV></P>
					<P>&#42;TopCoder does not guarantee the number of impressions per single round match</P>
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
