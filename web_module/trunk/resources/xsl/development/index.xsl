<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/dev/public_dev_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Development</TITLE>
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
        <xsl:call-template name="public_dev_left"/>
	<!-- Global Seconday Nav Ends -->			
<!-- Left Column Include Ends -->							
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">development</xsl:with-param>
  <xsl:with-param name="title">&#160;Overview</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<P>
 The TopCoder Development area will outline any near-term or in-progress projects at TopCoder that involve the use of the TopCoder member base. If you are interested in participating in a project that has "open" participation, feel free to click on the details of a project and submit an inquiry. A project with open participation means that we are currently soliciting member participation for that project.
</P>

<P>
<b>TopCoder is now offering development projects for commercial components.  Members can now receive, in addition to the initial payment, royalties on all sales of these components through TopCoder.  Check out the projects below and watch for more information on TopCoder Software.</b>
</P>

<P>
We will choose the project participants based upon TopCoder rating, historical TopCoder participation, and relevant experience in the technologies that are to be utilized. Ultimately, the final decision regarding the project team will be TopCoder's.
</P>

<P>
Keep in mind, TopCoder is paying significant money for these projects, and we expect a significant commitment from the project participants. You must feel confident that you can meet the deadlines specified in the project description.
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=architect" CLASS="statTextBig">Architect</A><BR/>
Member Selection: <b>Open</b><BR/>
Inquiry Deadline: TBD<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=grant_process2" CLASS="statTextBig">Grant Processing Application</A><BR/>
Start Date: July 11, 2002<BR/>
End Date: September 13, 2002<BR/>
Member Selection: <B>Open</B><BR/>
Inquiry Deadline: July 10, 2002<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=dde2" CLASS="statText">Distributed Development Environment</A><BR/>
Start Date: June 26, 2002<BR/>
End Date: August 23, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=gcc" CLASS="statText">GCC Upgrade Analysis</A><BR/>
Start Date: June 19, 2002<BR/>
End Date: June 25, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=grant_process" CLASS="statText">Grant Processing Application</A><BR/>
Start Date: June 14, 2002<BR/>
End Date: June 24, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=calendar_comp" CLASS="statText">Calendar Component</A><BR/>
Start Date: June 5, 2002<BR/>
End Date: June 28, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=pdf_cci" CLASS="statText">PDF Conversion Component Implementation Project</A><BR/>
Start Date: May 30, 2002<BR/>
End Date: Jul 2, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=editorial" CLASS="statText">Website Editorial</A><BR/>
Start Date: May 28, 2002<BR/>
End Date: Jul 9, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=dde1" CLASS="statText">Design of the TopCoder Distributed Development Environment</A><BR/>
Start Date: May 21, 2002<BR/>
End Date: June 11, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=tces1" CLASS="statText">TCES Extension Part One</A><BR/>
Start Date: May 15, 2002<BR/>
End Date: June 17, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=admin_cmd" CLASS="statText">Admin Commands</A><BR/>
Start Date: May 9, 2002<BR/>
End Date: June 20, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=chat" CLASS="statText">Moderated Chat Session</A><BR/>
Start Date: May 3, 2002<BR/>
End Date: July 17, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=team" CLASS="statText">Teams</A><BR/>
Start Date: May 7, 2002<BR/>
End Date: July 12, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=notify" CLASS="statText">Notification Component</A><BR/>
Start Date: May 3, 2002<BR/>
End Date: May 28, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=pdf_conversion" CLASS="statText">PDF Conversion Design</A><BR/>
Start Date: Apr 16, 2002<BR/>
Length: 1 week<BR/>
Member Selection: Closed<BR/>
</P>
<P>
Project: <A HREF="/index?t=development&amp;c=calendar" CLASS="statText">Calendar Component</A><BR/>
Start Date: Apr 16, 2002<BR/>
Length: 2 weeks<BR/>
Member Selection: Closed<BR/>
</P>
<P>
Project: <A HREF="/index?t=development&amp;c=file_upload" CLASS="statText">File Upload Component</A><BR/>
Start Date: Apr 16, 2002<BR/>
Length: 3.5 weeks<BR/>
Member Selection: Closed<BR/>
</P>
<P>
Project: <A HREF="/index?t=development&amp;c=web_services_proto" CLASS="statText">Web Services Proof of Concept</A><BR/>
Start Date: Apr 16, 2002<BR/>
Length: 2 weeks<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=client_impl" CLASS="statText">Client and Communication Protocol Implementation</A><BR/>
Start Date: Mar 25, 2002<BR/>
Length: 6 weeks<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=email" CLASS="statText">Email System</A><BR/>
Start Date: Mar 25, 2002<BR/>
Length: 4 weeks<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=payment" CLASS="statText">Payment Affidavit Contract Tracking</A><BR/>
Start Date: TBA<BR/>
Length: 7 weeks<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=client" CLASS="statText">Client and Communication Protocol Design</A><BR/>
Start Date: Feb 19, 2002<BR/>
Length: 10 days<BR/>
Member Selection: Closed<BR/>
Inquiry Deadline: February 18, 2002 12:00 PM EST<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=tracking" CLASS="statText">Request Tracking System</A><BR/>
Start Date: Feb 19, 2002<BR/>
Length: 21 days<BR/>
Member Selection: Closed<BR/>
Inquiry Deadline: February 18, 2002 12:00 PM EST<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=project" CLASS="statText">Project Tracking System</A><BR/>
Start Date: Jan 8, 2002<BR/>
Length: 14 days<BR/>
Technologies: Java, Servlets, EJBs, HTML, Javascript<BR/>
Member Selection: Closed<BR/>
Inquiry Deadline: Jan 4, 2002 12:00 PM EST<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=statistics" CLASS="statText">Statistics</A><BR/>
Start Date: Jan 14, 2002<BR/>
Length: 32 days<BR/>
Technologies: Java, Servlet, JSP, EJB, HTML, XML, XSL, RDBMS<BR/>
Member Selection: Closed<BR/>
Inquiry Deadline: Jan 9, 2002 12:00 PM EST<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=c" CLASS="statText">C# System Design Project</A><BR/>
Start Date: Dec 19, 2001<BR/>
Length: 9 days<BR/>
Technologies: C#, Java, .Net<BR/>
Member Selection: Closed<BR/>
Inquiry Deadline: Dec 17, 2001 2:00 PM EST<BR/>
</P>
					
					<P><br/></P>
		</TD>
		<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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

