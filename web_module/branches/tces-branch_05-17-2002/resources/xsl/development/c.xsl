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
                                    <FORM method="POST" name="frmInquire" ACTION="http://www.topcoder.com/">
                                        <INPUT VALUE="development" NAME="Task" TYPE="hidden"/><INPUT VALUE="inquire" NAME="Command" TYPE="hidden"/><INPUT VALUE="" NAME="Project" TYPE="hidden"/><INPUT VALUE="" NAME="To" TYPE="hidden"/>
                                    </FORM>
                                        <b>C&#35; System Design Project</b>
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <b>Description</b>
                                    <BR/>
                                    <BR/>            
TopCoder plans to add C&#35; to our arsenal of programming languages that are supported in competitions.  This project will address the feasibility, and plan the architecture that will be used in the actual implementation project that follows this project.  This project will involve two developers from the current member base, along with a TopCoder project manager.
<BR/>
                                    <BR/>
                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>
TopCoder will compensate all team members for their work on the C&#35; System Design Project. 
Each development member will get paid a total $800.00 to be paid upon the completion of the project*.
<BR/>
                                    <BR/>
*Completion of the project is defined as follows: 
<ul>
                                        <li>All tasks assigned by the project manager have been completed.</li>
                                        <li>The deliverables have been turned over to the project manager.</li>
                                        <li>The project manager has signed off on all deliverables.</li>
                                    </ul>
                                    <b>Eligibility</b>
                                    <BR/>
                                    <BR/>            
You must be a valid TopCoder member, meeting all of the membership requirements and fit into one of the following categories:<BR/>
                                    <ol>
                                        <li>a US Citizen</li>
                                        <li>a Lawful Permanent Resident of the US (i.e., a Green Card holder)</li>
                                        <li>currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
                                    </ol>
                                    <b>Time Line</b>
                                    <BR/>
                                    <BR/>            
The project will begin on the 19th of December. There will be a kick-off conference call to address the following: introduction of team members, design considerations for the C&#35; systems, specific time lines, deliverables, and any outstanding issues.<BR/>
The project is scheduled to be completed by December 28th. The December 28th deadline entails delivery of a technical implementation plan as well as a high-level architecture diagram.
<ul>
                                        <li>Project Start Date:    December 19th, 2001</li>
                                        <li>Project End Date:      December 28th, 2001</li>
                                    </ul>
                                    <b>Provisions</b>
                                    <BR/>
                                    <BR/>            
The TopCoder project manager will set project dates, milestones, goals, and deliverables prior to the project's start date. Any member that is chosen to join the project will have to agree to the specified tasks and dates. If at any point the TopCoder project manager feels that any team member is not accomplishing their task in a timely and acceptable manner they will be removed from the team and a new member will be assigned. In order to join the project team, all members will need to sign a contract agreeing to the specified terms.
<BR/>
                                    <BR/>
                                    <b>Project Details</b>
                                    <BR/>
                                    <BR/>            

The C&#35; System Design Project will provide a roadmap for the development and implementation of the C&#35; System.  While this project does not include any of the development work, it will be desirable for the participants of this project to participate in the development project that will spawn from the design.  The goal of this project is to come up with a technical and architectural plan that will describe how compiling and testing of solutions written in C&#35; can be integrated into TopCoder's current competition architecture (all UNIX).  Knowledge of C&#35; and Java will be necessary in order to contribute on this team.  The deliverables of this project will be:
<ol>
                                        <li>A technical implementation plan that outlines the necessary technologies and components to integrate C&#35; with TopCoder's competition engine.</li>
                                        <li>A High-Level Architecture diagram that outlines how the technologies and components will interact</li>
                                    </ol>

					
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

