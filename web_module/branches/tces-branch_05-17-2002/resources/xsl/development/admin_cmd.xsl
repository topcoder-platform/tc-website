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
                                    <b>Admin Commands Project</b>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Admin Commands';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <b>Preface</b>
                                    <BR/>
                                    <BR/>            
Currently, there are several command line utilities that TopCoder runs during a competition. TopCoder also runs several utilities via an Admin Monitor interface. The goal of this project is to port all of the utilities to work within the Admin Monitor interface as well as the applet where applicable. 
                                    <BR/>
                                    <BR/>
A new EJB (Enterprise Java Bean) should be created, which controls all interaction with the database. The EJB should be a stateless session EJB. All methods related to the utilities that currently run in the Admin Monitor should be moved to the new EJB.  
                                    <BR/>
                                    <BR/>
                                    <b>Overview</b>
                                    <BR/>
                                    <BR/>
There will be a total of four people assigned to the project with positions available for Developer, Software Architect and QA Developer.  Each development assignment will undergo three phases.  Phase one is getting up to speed on the project as well as the design phase.  Reading through requirements, documentation and providing any insight as to what the over all project will entail.  The first phase will also be used for developers to get acclimated to the development serves and source code control environments.  Also, for the design portion, the team as a whole will discuss the over all project goals and objectives and come up with the different designs for each specific component.  Phase two is the development period and the final phase addresses quality assurance and bug fixes.
                                    <BR/>
                                    <BR/>
TopCoder strongly feels that the developers have a very big role when it comes to coming up with requirements for a development project.  As a member of this team you are expected to contribute to the design and implementation of various components even if you will not be working on the components directly.  TopCoder also mandates that developers provide feedback and give ideas as to how the system should run from an operations standpoint.  
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
The architect will be responsible for the design of software and test cases that meet all requirements as defined in the requirements documentation and as described by the product manager. The architect will design the solution such that component reuse is maximized. The architect will be responsible for testing the functionality of the component, reviewing the deliverables (source code, documentation, schema, etc.) and giving final approval to the Product Manager that the component satisfies the requirements and is implemented correctly. 
                                    <BR/>
                                    <BR/>
                                    <b>Developer</b>
                                    <BR/>
                                    <BR/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager. The developer's responsibility will begin on the project start date and extend through to Production Deployment. The majority of the workload will occur between the project Start Date and completion of Beta Testing. Continued support and component modifications may be required through deployment. 
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
                                    <b>Functional Overview</b>
                                    <BR/>
                                    <BR/>
The following sections describe the utilities that should be run via the Admin Monitor.
                                    <BR/>
                                    <BR/>
                                    <b>Create a Contest</b>
                                    <BR/>
                                    <BR/>
Currently, TopCoder creates a contest by running a command line utility. TopCoder would like to have the ability to create a contest through a GUI interface in a step-by-step fashion.
                                    <BR/>
                                    <BR/>
                                    <b>Room Assignments</b>
                                    <BR/>
                                    <BR/>
For every competition, TopCoder generates the contest rooms based on who is registered through a room assignment utility. The room assignments should still be run the way it currently does, but with changes to how the room ids are generated. The room ids should be generated from a database sequence. 
                                    <BR/>
                                    <BR/>
                                    <b>Create System Tests from Challenges</b>
                                    <BR/>
                                    <BR/>
After the challenge phase, TopCoder creates system tests from successful challenges made during the challenge phase. To create system tests from challenges TopCoder runs a utility from the command line. The new admin command should perform the same function as the command line utility currently does only it should be run through the GUI interface.
                                    <BR/>
                                    <BR/>
                                    <b>Consolidate Test Cases</b>
                                    <BR/>
                                    <BR/>
The idea behind the Consolidate Test Cases utility is to eliminate duplicate test cases for problems. The command should retrieve the test case arguments, compare the arguments only, and remove duplicate test cases whose arguments are identical. 
                                    <BR/>
                                    <BR/>
                                    <b>Ratings</b>
                                    <BR/>
                                    <BR/>
After each competition, TopCoder runs a utility to adjust coder ratings based on how the coder performed in the competition relative to other coders. The command should perform the same function as the command line utility currently does only it should be run through the GUI interface.
                                    <BR/>
                                    <BR/>
                                    <b>Prize Allocation</b>
                                    <BR/>
                                    <BR/>
After each competition, TopCoder runs a utility to calculate the prize money distribution. Currently, many redundant steps are taken in calculating the prizes, which TopCoder would like to eliminate. 
                                    <BR/>
                                    <BR/>
In addition to calculating prizes after a contest, TopCoder would like the ability to calculate estimated prizes per room before the coding phase even begins. In this case, the room placement is not needed because the prizes are calculated for projected prize winners. In order to view the estimated earnings, coders logged into the applet should be able to click on a menu item and receive a popup containing all the prize allocations per room, per place.
                                    <BR/>
                                    <BR/>
                                    <b>Insert Practice Room</b>
                                    <BR/>
                                    <BR/>
For each round, TopCoder creates a practice room for each set of problems used in the round. For example, for every Single Round Match, two practice rooms are created: one practice room containing the Division 1 problem set and another practice room containing the Division 2 problem set. TopCoder would like to automate this process through a GUI interface. 
                                    <BR/>
                                    <BR/>
                                    <b>Register User</b>
                                    <BR/>
                                    <BR/>
Sometimes during a competition, TopCoder manually registers coders for different reasons. TopCoder would like to automate this process through a GUI interface. 
                                    <BR/>
                                    <BR/>
                                    <b>Unregister User</b>
                                    <BR/>
                                    <BR/>
Sometimes during a competition, TopCoder manually unregisters coders for different reasons. TopCoder would like to automate this process through a GUI interface.
                                    <BR/>
                                    <BR/>
                                    <b>Object Loader</b>
                                    <BR/>
                                    <BR/>
This command is used to load blob objects into the database. Currently, the object loading process is cumbersome. TopCoder would like the ability to load blob objects through a well-formatted GUI interface.
                                    <BR/>
                                    <BR/>
                                    <b>Text Loader</b>
                                    <BR/>
                                    <BR/>
This command is used to load text database data types into the database. Currently, the text loading process is cumbersome. TopCoder would like the ability to load text objects through a well-formatted GUI interface.
                                    <BR/>
                                    <BR/>
                                    <b>Blob Object Searcher</b>
                                    <BR/>
                                    <BR/>
The command is used to search blob objects based on a phrase. This command should allow a user to choose a database table and a column and provide a phrase to search for.
                                    <BR/>
                                    <BR/>
                                    <b>Text Searcher</b>
                                    <BR/>
                                    <BR/>
The command is used to search text fields based on a phrase. This command should allow a user to choose a database table and a column and provide a phrase to search for.
                                    <BR/>
                                    <BR/>
                                    <b>Verification</b>
                                    <BR/>
                                    <BR/>
TopCoder would like an easy way to verify that competitions are setup correctly.  The command should display, in a nice format, relevant competition data. 
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>
                                    Architect will get paid a total of $2,100.00:
                                    <ul>
                                        <li>$210.00 at the start of the project.</li>
                                        <li>$1050.00 on June 5th.</li>
                                        <li>$840.00 at the completion of the project.* </li>
                                    </ul>
                                    There will be a total of two developers.<br/>
                                    Each developer will get paid a total of $3,600.00:
                                    <ul>
                                        <li>$360.00 at the start of the project.</li>
                                        <li>$1800.00 on June 5th.</li>
                                        <li>$1440.00 at the completion of the project.*</li>
                                    </ul>
                                    QA Developer will get paid a total of $1,800.00:
                                    <ul>
                                        <li>$180.00 at the start of the project.</li>
                                        <li>$900.00 on June 5th.</li>
                                        <li>$720.00 at the completion of the project.* </li>
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
                                        <li>A US Citizen.</li>
                                        <li>A Lawful Permanent Resident of the US (i.e., a Green Card holder).</li>
                                        <li>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
                                    </ol>
                                    <b>Time Line</b>
                                    <BR/>
                                    <BR/>            
The project will begin on the 9th of May. There will be a kick-off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The project is scheduled to be complete by June 20th. 
                                    <ul>
                                        <li>Project Start Date:    May 9, 2002</li>
                                        <li>Project End Date:      June 20, 2002</li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Admin Commands';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
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

