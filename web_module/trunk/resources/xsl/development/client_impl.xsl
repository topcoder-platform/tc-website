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
                               <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">
                                    <FORM method="POST" name="frmInquire" ACTION="/">
                                        <INPUT VALUE="development" NAME="t" TYPE="hidden"/><INPUT VALUE="inquire" NAME="c" TYPE="hidden"/><INPUT VALUE="" NAME="Project" TYPE="hidden"/><INPUT VALUE="" NAME="To" TYPE="hidden"/>
                                    </FORM>
                                        <span class="statTextBig">Client and Communication Protocol Implementation Project</span>
                                    </font>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Client and Protocol Implementation';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <b>Purpose</b>
                                    <BR/>
                                    <BR/>            
It has become apparent to TopCoder that the current client used by our members to enter the competition environment, more commonly known as the "Arena", needs to undergo a fairly substantial overhaul.  The Client and Communication Protocol Phase 2 - Implementation Project will entail the implementation of the designs that the team had undergone in the design phase.
<BR/>
                                    <BR/>
                                    <b>Project Specifications</b>
                                    <BR/>
                                    <BR/>
There will be a total of 7 members working on the Client and Communication Protocol Implementation project.  The 7 members will be split into 3 teams.  One team will be responsible for the implementation of the new design of the communication protocol.  The second team will focus on the implementation of the client software.  The third team will be a QA team that will validate all of the functionality.  There will also be a technical project manager assigned to the team for the duration of the project.  If at any point the Project Manager feels a team member is not accomplishing their tasks in an appropriate manner they will be removed from the project.  At such time one of the QA members will be able to step in and take on the position of the developer.  Currently, TopCoder has 3 positions open for the Client and Communication Protocol Implementation Project.  One developer for the client software component and 2 members for the Quality Assurance positions.
                                    <ul>
                                        <li>
                                            <b>Client Software</b>
                                            <BR/>
There will be 2 members assigned to the implementation of the newly designed client software.  The entire project will span a life development cycle period of 6 weeks.  The members assigned to Client Software components will take part in the project for the duration.  However the member selected to the client Software team will only be required to work on the final 5 weeks of the project.
                                            <ul>
                                                <li>
                                                    <b>Design</b>
                                                    <ol>
                                                      <li>
One common problem with client applications is that user interface and logic are mixed together in the same class.  The problem with this is that the user interface class will become complex and difficult to manage.  Also, neither the user interface code nor the logic code can be reused since it is intertwined.  This design addresses this by using a Model-View-Controller architecture.  The model will contain the current state of the client.  The controller will get data and listen for events from the model and update the view as necessary.  
                                                      </li>
                                                      <li>
The view and controller objects will be created by a factory then plugged together. The factory will only return interfaces, not classes.  With this arrangement the view and/or controller class can be replaced without any changes to the calling code.
                                                      </li>
                                                      <li>
The factory will also act as an object repository that will allow objects to get references to the major objects in the system through static methods.  If an object needs to reference another object, it can get a reference to it from the object repository, as opposed to relying on another object to supply it with a reference.  This will allow the objects in the system to be more self-contained, thus reducing dependency between objects.
                                                      </li>
                                                      <li>
The communication with the server is totally contained behind an interface.  This will make server class easy to change without affecting other classes.
                                                      </li>
                                                    </ol>
                                                </li>
                                            </ul>
                                        </li>
                                     </ul>
                                     <ul>
                                        <li>
                                            <b>Quality Assurance</b>
                                            <BR/>
There will be 2 members assigned to the Quality Assurance portion of the project.  The members assigned to the QA portion of the project will take part in the project for the entire duration.  However they will only be required to work the final 2 weeks of the project, when the project goes into the testing and re-work phase.
                                        </li>
                                    </ul>



                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>
TopCoder will compensate all team members for their work on the Client and Communication Protocol Implementation project. 
                                    <BR/>
                                    <BR/>
Each software development member will get paid a total $3,000.00 
                                    <ul>
                                        <li>$300.00 at the start of the project </li>
                                        <li>$1500.00 at the completion of the second milestone </li>
                                        <li>$1200.00 at the completion of the project* </li>
                                    </ul>
Each quality assurance member will get paid a total $500.00 
                                    <ul>
                                        <li>$50.00 at the start of the project </li>
                                        <li>$450.00 at the completion of the project* </li>
                                    </ul>
*Completion of the project is defined as follows: 
                                    <ul>
                                        <li>All tasks assigned by the project manager have been completed. </li>
                                        <li>The deliverables are functioning properly and integrated within the other project software deliverables. </li>
                                        <li>The project manager has signed off on all delivered components. </li>
                                    </ul>
                                    <b>Eligibility</b>
                                    <BR/>
                                    <BR/>            
You must be a rated TopCoder member, meeting all of the membership requirements and fit into one of the following categories:<BR/>
                                    <ol>
                                        <li>a US Citizen</li>
                                        <li>a Lawful Permanent Resident of the US (i.e., a Green Card holder)</li>
                                        <li>currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
                                    </ol>
                                    <b>Time Line</b>
                                    <BR/>
                                    <BR/>            
The project will begin on the 25th of March. There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues.  The Client and Communication Protocol Implementation project is scheduled to be complete by May 6th.
                                    <ul>
                                        <li>Project Start Date:    March 25, 2002</li>
                                        <li>Project End Date:      May 6, 2002</li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Client and Protocol Implementation';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
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

