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
                                    <FORM method="POST" name="frmInquire" ACTION="/">
                                        <INPUT VALUE="development" NAME="t" TYPE="hidden"/><INPUT VALUE="inquire" NAME="c" TYPE="hidden"/><INPUT VALUE="" NAME="Project" TYPE="hidden"/><INPUT VALUE="" NAME="To" TYPE="hidden"/>
                                    </FORM>
                                    <b>Website Editorial Project</b>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Website Editorial';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <b>Preface</b>
                                    <BR/>
                                    <BR/>            
Currently, members who write feature articles for TopCoder submit their articles with email.  TopCoder would like to automate this submission and review process with a web-based application.
                                    <BR/>
                                    <BR/>
                                    <b>Overview</b>
                                    <BR/>
                                    <BR/>
There will be a total of four people assigned to the project with positions available for development, architect and quality assurance.  Each development assignment will undergo three phases.  Phase one is getting up to speed on the project and the design phase.  This will involve reading through requirements, documentation and providing any insight as to what the over all project will entail.  The first phase will also be used for developers to get acclimated to the development servers and source code control environments.  The team as a whole will discuss the overall project goals and objectives and come up with the different designs for each specific component.  Phase two is the development phase and the final phase is for quality assurance, bug fixes and the completion of documentation.
                                    <BR/>
                                    <BR/>
TopCoder feels very strongly that developers have a big role in creating project requirements.  As a member of this team you are expected to contribute to the design and implementation of various components even if you will not be working on the directly.  TopCoder also mandates that developers provide feedback and give ideas as to how the system should run from an operations standpoint.  Keep in mind you will ultimately be the end user of this system.
                                    <BR/>
                                    <BR/>
                                    <b>Staffing</b>
                                    <BR/>
                                    <BR/>
The component team will consist of four rated TopCoder Members. 
<ul>
<li>One Architect</li>
<li>Two Developers</li>
<li>One QA Developer</li>
</ul>
                                    <b>Architect</b>
                                    <BR/>
                                    <BR/>
The architect will be responsible for the design of software and test cases that meet all requirements as defined in the requirements documentation and as described by the project manager. The architect will design the solution such that component reuse is maximized. The architect will be responsible for testing the functionality of the component, reviewing the deliverables (source code, documentation, schema, etc.) and giving final approval to the project manager that the component satisfies the requirements and is implemented correctly. 
                                    <BR/>
                                    <BR/>
                                    <b>Developer</b>
                                    <BR/>
                                    <BR/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the project manager. The developer's responsibility will begin on the project start date and extend through to Production Deployment. The majority of the workload will occur between the project Start Date and completion of Beta Testing. Continued support and component modifications may be required through deployment. 
                                    <BR/>
                                    <BR/>
                                    <b>QA Developer</b>
                                    <BR/>
                                    <BR/>
The QA Developer is responsible for testing the completed component. Tests should involve both normal and extreme scenarios to simulate production usage. The developer's responsibility will begin on the project Start Date and extend through to Production Deployment. The majority of the workload will occur during Beta and QA testing. In addition to implementing component testing, it is also the QA Developer's responsibility to stay abreast of component design and progress. In the event the lead Developer cannot complete the project, TopCoder fully expects the QA developer to have sufficient knowledge of the component so as to continue and complete development.
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <b>Functional Overview of Web-Based Content Submission/Review</b>
                                    <BR/>
                                    <BR/>
Members
<ul>
<li>The editorial content will be posted through a web-based user interface.</li>
<li>Choice of predefined templates that determine the placement and formatting of editorial content.</li>
<li>Security will be based on TopCoder Member accounts and groups of Member accounts.</li>
<li>TopCoder Members will be able to add/edit/review submissions associated with their TopCoder account.</li>
<li>Search/replace functionality to change search criteria into dynamic links (the destination of the link determined by the template chosen).</li>
</ul>
Administrative
<ul>
<li>TopCoder Administrators will have a web-based user interface to add/edit/review submissions from TopCoder Members.</li>
<li>The Administrative utility will also provide the ability to create, track, and move multiple versions of a content submission in multiple environments. For example, a version of content submitted by a user, a quality assurance version for review by TopCoder administrators, and a production version.</li>
<li>Web-based user interface to add/edit/review templates for editorial content.</li>
</ul>
System
<ul>
<li>Content cache.</li>
<li>Custom tag post processing for dynamic links.</li>
<li>Page templates that can call content from the file system or database.</li>
</ul>
Technologies
<ul>
<li>Java</li>
<li>HTML</li>
</ul>

                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>
                                    Architect will get paid a total of $2,275.00:
                                    <ul>
                                        <li>$227.00 at the start of the project.</li>
                                        <li>$455.00 at the first milestone.</li>
                                        <li>$682.00 at the second milestone. </li>
                                        <li>$910.00 at the completion of the project.*</li>
                                    </ul>
                                    There will be a total of two developers.<br/>
                                    Each developer will get paid a total of $3,000.00:
                                    <ul>
                                        <li>$300.00 at the start of the project.</li>
                                        <li>$600.00 at the first milestone.</li>
                                        <li>$900.00 at the second milestone.</li>
                                        <li>$1,200.00 at the completion of the project.*</li>
                                    </ul>
                                    QA Developer will get paid a total of $1,500.00:
                                    <ul>
                                        <li>$150.00 at the start of the project.</li>
                                        <li>$300.00 at the first milestone.</li>
                                        <li>$450.00 at the second milestone.</li>
                                        <li>$600.00 at the completion of the project.* </li>
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
You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:<BR/>
                                    <ul>
                                        <li>A US Citizen.</li>
                                        <li>A Lawful Permanent Resident of the US (i.e., a Green Card holder).</li>
                                        <li>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
                                    </ul>
                                    <b>Time Line</b>
                                    <BR/>
                                    <BR/>            
The project will begin on the 28th of May. There will be a kick-off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The project is scheduled to be complete by July 9th. 
                                    <ul>
                                        <li>Project Start Date:    May 28, 2002</li>
                                        <li>Project End Date:      July 9, 2002</li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Website Editorial';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
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
