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

<html>
<head>
	<xsl:call-template name="Preload"/>      
 <title>TopCoder :: Development</title>
	<xsl:call-template name="CSS"/>      
<!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
</head>

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">
	<xsl:call-template name="Top"/>

<table width="100%" height="69%" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
	<tr valign="top">
<!-- Left Column Begins -->
		<td width="170" bgcolor="#CCCCCC">
			<xsl:call-template name="public_dev_left"/>
	  	</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
		<td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="8" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
		<td class="bodyText" width="100%" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="240" height="1" vspace="5" border="0"/><br/>
			<xsl:call-template name="BodyTop">
			<xsl:with-param name="image1">steelblue</xsl:with-param>
			<xsl:with-param name="image">development</xsl:with-param>
			<xsl:with-param name="title">&#160;Component Development</xsl:with-param>
			</xsl:call-template>
			<table border="0" cellspacing="0" cellpadding="0" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%">
				<tr>
					<td bgcolor="#000033" background="/i/steel_darkblue_bg.gif" valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
					<td class="statText" colspan="2" valign="top" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
<p>The TopCoder Development area lists any near-term or in-progress projects at TopCoder that involve the use of the TopCoder member base. Projects are classified as "Application" or "Component" projects.  <b>There has been significant change to the process of component development, all members interested in this need to first review the TopCoder Software Component Development Methodology detailed below.</b></p>
<p><b>Application Projects:</b></p>
<p>Application projects require that interested members submit an inquiry by the Posting End Date.  At this time, TopCoder will notify the members selected to participate on the project team.   Participants will be chosen based upon TopCoder rating, historical TopCoder participation, and relevant experience in the technologies that are to be utilized. Ultimately, TopCoder will have the final decision regarding the project team.  If you are interested in participating in a project that has "open" participation, feel free to click on the details of a project and submit an inquiry.</p>
<p><b>Component Projects:</b></p>
<p>Component projects have been redesigned to to be more competitve.  Interested members must submit their solution to the posted project by the project due date. Once all submissions have been received, a review team will select the winning solution. Software components built through the competition based projects offer the additional benefit of being commercially marketed. In addition to the initial payment received for providing the winning solution, members can also receive royalties on all sales of the component through TopCoder Software. The TopCoder Software Component Development Methodology combines the best of traditional software development methodologies with the power of community-based, distributed development. This methodology is designed for low-level base components, not for larger applications. The steps of the process are as follows:</p>

<p><b>Component Design Project:</b></p>
<ol>
<li>TopCoder Software product manager posts a design project on the Development section of the TopCoder website. This posting includes a high-level functional description of the component and a timeline for submissions and project payment. A requirements specification document and the required deliverables for the design proposal will be sent to all members who inquire about the project.  </li>
<li>Only rated TopCoder members are allowed to inquire about the Design project on the Development section of the TopCoder website.</li>
<li>The product manager will grant all eligible members access to an online forum on <a href="http://www.topcodersoftware.com" class="statText">www.topcodersoftware.com</a>.  This forum is used for the designers to ask the product manager questions about the requirements specification.  </li>
<li>All designers are required to submit their designs to the product manager by the end of the design phase as stated on the project posting.  Any designs received after the Initial Submission Due Date will be ignored.  </li>
<li>The product manager will assemble an architecture review board consisting of 3 TopCoder Software architects to review proposals submitted by the designers.</li>
<li>A member of the architecture review board first screens the design documents to verify that the proposal includes all required elements and performs a high-level review of the designs to narrow down to the top 5 component designs.</li>
<li>Accepted designs are then reviewed by the architecture board and scored. The architecture board will submit a design scorecard for each design, which may include suggestions for improvements.</li>
<li>The member with the winning design will be given additional time to incorporate design suggestions received from the architecture board.  The additional time period will be set as a percentage (currently 20%) of the initial design period.  For example, a component with a 5 day design period will allow an additional 1 day after the due date for the designer to incorporate the suggestions.  If the completed design is submitted on time, the designer is paid the first of two payments for the project as stated in the project posting.</li>
<li>The winning designer is required to answer questions regarding the design during the development project.  At the completion of the development project the designer will receive their final payment.</li>
</ol>

<p><b>Component Development Project</b></p>
<ol>
<li>TopCoder Software product manager posts a development project on the Development section of the TopCoder website.  This posting includes a high-level functional description of the component, deliverables for the component solution, a timeline for submissions and project payment information.  Completed design documents from the design phase will be sent to all members who inquire about the project. </li>
<li>Only rated TopCoder members are allowed to inquire about the development project on the Development section of the TopCoder website.</li>
<li>The TopCoder product manager will grant all eligible members access to an online forum on <a href="http://www.topcodersoftware.com" class="statText">www.topcodersoftware.com</a>.  This forum is used for the developers to ask questions of the designer and the product manager.</li>
<li>All developers are required to submit the component solutions to the product manager by the end of the development phase as stated on the project posting.  </li>
<li>The product manager will assemble a development review board consisting of 3 TopCoder Software Development Reviewers to review, test and certify solutions submitted by the developers.</li>
<li>A member of the Development Review board will screen the submitted solutions to verify that all required elements are included and will perform a high-level review of the designs to narrow down to the top 5 component solutions.</li>
<li>The component solutions are then reviewed by the Development Review board and scored.  The Development Review board will submit a development scorecard along with any bugs and the corresponding test cases.</li>
<li>The developer with the winning solution will be given additional time to fix bugs and incorporate design suggestions from the Development Review board.  The additional time period will be set as a percentage (currently 20%) of the initial development period.  For example, a component with a 10 day design period will allow an additional 2 days after the due date for the developer to incorporate the suggestions.  If the completed solution is submitted on time and passes all regression testing the developer is paid the entire development payment as stated in the development project posting.  Also at that time, the designer is paid the final payment for the design contract as detailed in the design project posting.</li>
</ol>
<table border="0" cellspacing="5" cellpadding="5" width="100%">
        <tr><td class="statText"><b>Most Recent Postings</b></td></tr>
		<tr>
		<td  valign="top" class="statText">
<p>
Project: <a href="/index?t=development&amp;c=api_compare" class="statText">API Comparator Component Design</a><br/>
Component Posting: 11/8/2002<br/>
Component Submission Due Date: 11/19/2002<br/>
</p>   

<p>
Project: <a href="/index?t=development&amp;c=ip_filter" class="statText">IP Filter Component Design</a><br/>
Component Posting: 11/8/2002<br/>
Component Submission Due Date: 11/19/2002<br/>
</p>   
        
<p>
Project: <a href="/index?t=development&amp;c=object_formatter" class="statText">Object Formatter Component Design</a><br/>
Component Posting: 11/8/2002<br/>
Component Submission Due Date: 11/21/2002<br/>
</p>   

        </td>
		<td  valign="top" class="statText">
<p>
Project: <a href="/index?t=development&amp;c=resourcebundle" class="statText">ResourceBundle Component Design</a><br/>
Component Posting: 11/8/2002<br/>
Component Submission Due Date: 11/12/2002<br/>
</p>

<p>
Project: <a href="/index?t=development&amp;c=unique_key" class="statText">Unique Key Generator Component Design</a><br/>
Component Posting: 11/8/2002<br/>
Component Submission Due Date: 11/21/2002<br/>
</p>
        
<p>
Project: <a href="/index?t=development&amp;c=object_pool" class="statText">Object Pool Component Design</a><br/>
Component Posting: 10/25/2002<br/>
Component Submission Due Date: 11/11/2002<br/>
</p>   

        </td>
    </tr>
    <tr><td class="statText"><b>Closed Postings</b></td></tr>	
    <tr>
		<td  valign="top" class="statText">
<p>
Project: <a href="/index?t=development&amp;c=utg" class="statText">Unit Test Generator Component Design</a><br/>
Component Posting: 10/25/2002<br/>
Component Submission Due Date: 11/7/2002<br/>
Member Selection: Closed<br/>
</p>   

<p>
Project: <a href="/index?t=development&amp;c=timer" class="statText">Timer Component Design</a><br/>
Component Posting: 10/25/2002<br/>
Component Submission Due Date: 11/7/2002<br/>
Member Selection: Closed<br/>
</p>   
       
        </td>
		<td  valign="top" class="statText">

<p>
Project: <a href="/index?t=development&amp;c=log_interface" class="statText">Logging Wrapper Component Design</a><br/>
Component Posting: 10/25/2002<br/>
Component Submission Due Date: 11/6/2002<br/>
Member Selection: Closed<br/>
</p>   

<p>
Project: <a href="/index?t=development&amp;c=email_engine" class="statText">Email Engine Component Design</a><br/>
Component Posting: 10/25/2002<br/>
Component Submission Due Date: 11/6/2002<br/>
Member Selection: Closed<br/>
</p> 
        </td>
    </tr>
    </table>
    
<!--
<P>
Project: <A HREF="/index?t=development&amp;c=ssoc" CLASS="statText">Single Sign On Components</A><BR/>
Start Date: September 27, 2002<BR/>
End Date: October 11, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=file_reader" CLASS="statText">File Reader</A><BR/>
Start Date: August 2, 2002<BR/>
End Date: August 21, 2002<BR/>
Member Selection: Closed<BR/>
</P>

<P>
Project: <A HREF="/index?t=development&amp;c=job_posting" CLASS="statText">Job Posting</A><BR/>
Start Date: July 25, 2002<BR/>
End Date: August 29, 2002<BR/>
Member Selection: Closed<BR/>
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
-->
<!--<P>
Project: <A HREF="/index?t=development&amp;c=architect" CLASS="statText">Architect</A><BR/>
Member Selection: Closed<BR/>
</P>-->

<!--<P>
Project: <A HREF="/index?t=development&amp;c=grant_process2" CLASS="statText">Grant Processing Application</A><BR/>
Start Date: July 11, 2002<BR/>
End Date: September 13, 2002<BR/>
Member Selection: Closed<BR/>
</P>-->

<!--<P>
Project: <A HREF="/index?t=development&amp;c=grant_process" CLASS="statText">Grant Processing Application</A><BR/>
Start Date: June 14, 2002<BR/>
End Date: June 24, 2002<BR/>
Member Selection: Closed<BR/>
</P>-->

<!--<P>
Project: <A HREF="/index?t=development&amp;c=calendar_comp" CLASS="statText">Calendar Component</A><BR/>
Start Date: June 5, 2002<BR/>
End Date: June 28, 2002<BR/>
Member Selection: Closed<BR/>
</P>-->

<!-- <P>
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
</P> -->
					
					<p><br/></p>
		</td>
		<td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
	</tr>
	<tr>
		<td colspan="4" valign="top" bgcolor="#000033" background="/i/steel_darkblue_bg.gif" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td>
	</tr>   	
	<tr>
		<td valign="top" background="" bgcolor="#CCCCCC" width="11" align="right"><img src="/i/clear.gif" alt="" width="11" height="8" border="0"/></td>
		<td background="/i/steel_darkblue_bg.gif" valign="top" bgcolor="#000033" width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0"/></td>
		<td background="/i/steel_darkblue_bg.gif" valign="top" bgcolor="#000033" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
		<td valign="top" background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
	</tr>	
	<tr>
		<td valign="top" background="" width="11" align="right" bgcolor="#CCCCCC"><img src="/i/clear.gif" alt="" width="11" height="8" border="0"/></td>
		<td valign="top" background="" bgcolor="#CCCCCC" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0"/></td>
		<td valign="top" background="" bgcolor="#CCCCCC" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
		<td valign="top" background="" bgcolor="#CCCCCC" width="10"><img src="/i/clear.gif" alt="" width="1" height="1" border="0"/></td>
	</tr>
</table>
		</td>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<td width="4" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<td width="170" bgcolor="#CCCCCC" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </td>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<td width="25" bgcolor="#CCCCCC"><img src="/i/clear.gif" width="25" height="1" border="0"/></td>
    <!-- Gutter Ends -->
	</tr>
</table>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>

