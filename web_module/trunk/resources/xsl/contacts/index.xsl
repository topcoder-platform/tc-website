<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>  
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Contacts</TITLE>
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
	<!-- Global Seconday Nav Ends -->	
        <!-- Left Column Include Begins -->
        <xsl:call-template name="global_left"/>
        <!-- Left Column Include Ends -->
	<!-- Global Seconday Nav Ends -->			
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
  <xsl:with-param name="image">contacts</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
					<P CLASS="bodyText">TopCoder is dedicated to servicing members, partnering companies, the media and anyone else interested in what TopCoder is about. Please contact the 
					appropriate individuals below for more information or assistance.</P><DIV ALIGN="center">
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
					<TR><TD COLSPAN="2" ALIGN="left" CLASS="bodyText"><B>Please direct general questions or concerns to</B></TD></TR>
					<TR><TD COLSPAN="2" ALIGN="left" CLASS="bodyText">TopCoder, Inc.<BR/>703 Hebron Avenue<BR/>Glastonbury, CT 06033 U.S.A.<BR/>Phone: 860.633.5540<BR/>Fax: 860.657.4276<BR/>Email:<A HREF="mailto:service@topcoder.com" CLASS="bodyText">TopCoder General Inbox</A><BR/></TD></TR>
					<TR><TD COLSPAN="2" ALIGN="left" CLASS="bodyText"><BR/><B><A HREF="mailto:mlydon@topcoder.com" CLASS="bodyText">NEED TECH SUPPORT?</A></B><BR/></TD></TR>
					<TR><TD COLSPAN="2" ALIGN="left" CLASS="bodyText"><BR/><B>Questions regarding sponsorships, membership, employment services and technology</B></TD></TR>
				<TR>
					<TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>					
					<TR>
					<TD WIDTH="50%" ALIGN="left" CLASS="bodyText" VALIGN="top">
					<A HREF="mailto:dvaughn@topcoder.com" CLASS="bodyText">Sponsorship Sales</A><BR/>
					Drew Vaughn, VP of Sales<BR/>
					Corporate Office<BR/>
					703 Hebron Avenue<BR/>
					Glastonbury, CT 06033<BR/>
					ph: 860.633.5540<BR/>
					fx: 860.657.4276<BR/>
					</TD>
					<TD WIDTH="50%" ALIGN="left" CLASS="bodyText" VALIGN="top">
					<A HREF="mailto:tlongo@topcoder.com" CLASS="bodyText">Membership/College Relations</A><BR/>
					Tom Longo, VP of Membership<BR/>
					Corporate Office<BR/>
					703 Hebron Avenue<BR/>
					Glastonbury, CT 06033<BR/>
					ph: 860.633.5540<BR/>
					fx: 860.657.4276<BR/>
					</TD>
					</TR>
				<TR>
					<TD COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="15" BORDER="0"/></TD>
				</TR>											
					<TR>					
					<TD WIDTH="50%" ALIGN="left" CLASS="bodyText" VALIGN="top">
					<A HREF="mailto:mlydon@topcoder.com" CLASS="bodyText">Competition Applet/Website</A><BR/>
					Mike Lydon, CTO<BR/>
					Corporate Office<BR/>
					703 Hebron Avenue<BR/>
					Glastonbury, CT 06033<BR/>
					ph: 860.633.5540<BR/>
					fx: 860.657.4276<BR/>
					</TD>
					<TD WIDTH="50%" ALIGN="left" CLASS="bodyText" VALIGN="top">
					<A HREF="mailto:tces@topcoder.com" CLASS="bodyText">Employment Services</A><BR/>
					Paul Moriarty, Director of Employment Services<BR/>
					Corporate Office<BR/>
					703 Hebron Avenue<BR/>
					Glastonbury, CT 06033<BR/>
					ph: 860.633.5540<BR/>
					fx: 860.657.4276<BR/>
					</TD>										
					</TR>
					</TABLE>
					</DIV><BR/>
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
