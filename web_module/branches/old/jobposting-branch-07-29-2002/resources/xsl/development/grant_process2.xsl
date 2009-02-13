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
                                    <b>Grant Processing Application</b>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='Grant Processing Application';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>

<P>
<B>Overview</B>
</P>

<P>
The Grant Processing application is a web-based tool designed to facilitate the management of the grant processing lifecycle.  This lifecycle consists of accepting, processing and reviewing applications from prospective grant recipients, determining funding amounts and project timelines, tracking funding throughout the duration of the project, and soliciting updates and feedback for on-going and completed projects.  In addition, the application provides system administrators with the tools and information required to manage this process.  These tools include business reports to aggregate total funding and project status, as well as administration screens to manage system data.
</P>

<P>
A static html mock-up has already been completed to provide detailed insight into the required functionality of the system.  While this mock-up is not all-inclusive, it does cover all major functional requirements.  The purpose of this project is to finalize the existing application architecture and design, implement the Grant Processing application, thoroughly test the implementation, and package the application for deployment.
</P>

<P>
<B>Functional Requirements</B>
</P>

<P>
The Grant Processing application requires the integration of several business functions into one, standalone application.  These business functions are outlined as follows:
<UL>
	<LI> User Registration</LI>
	<LI> User Login</LI>
	<LI> Grant application and management</LI>
<UL>
	 <LI> Project management</LI>
<UL>
	 <LI> Timeline</LI>
	 <LI> Budget</LI>
	 <LI> Personnel and roles</LI>
</UL>
	 <LI> Status</LI>
	 <LI> Task List</LI>
	 <LI> Notes</LI>
	 <LI> Scheduled Notifications and reminders</LI>
	 <LI> Recommendations</LI>
	 <LI> Supporting documentation (uploaded files)</LI>
</UL>
	<LI> User administration</LI>
<UL>
		<LI> Personal information</LI>
	 <LI> Organizational information</LI>
	 <LI> Application roles and permissions</LI>
</UL>
	<LI> Organizational Administration</LI>
<UL>
	<LI> Corporate Information</LI>	
</UL>
	<LI> Reporting</LI>	
</UL>
</P>

<P>
<B>Staffing</B>
</P>
 
<P>
The component team will consist of 7 rated TopCoder Members.
</P>

<P>
<B>Architect</B><BR/>
The architect will be responsible for the design of the database schema, persistence layer that accesses the schema, software architecture and front-end jsp design. The architect will provide all necessary methods and operations for the development of components, which require access to the database or other persistent data stores. The architect will work with the product manager to develop a functionally complete database schema, persistence architecture and object model.  The architect will design the solution and will later manage the deliverables pertaining to that solution by the developers and the QA developers in the implementation phase.
</P>
	
<P>
Requirements: Database design experience, OO design experience, J2EE experience including JSP, JDBC and EJB.
</P>
	
<P>
<B>Back-End Developer</B> (2)<BR/>
The back-end developers are responsible for finalizing the database schema and system architecture and design, implementing the schema, developing the business logic persistence layer and the database persistence layer, and creating any maintenance scripts required to support the persistent store.  In addition, the back-end developers will be responsible for developing installation and user guides pertinent to the application.
</P>

<P>
Requirements: OO design experience, Relational Database design experience, J2EE experience including JDBC and EJB.
</P>
	
<P>
<B>Front-End Developer</B> (2)<BR/>
The front-end developers are responsible for finalizing the system architecture and design, developing the business logic persistence layer and designing and implementing the application front-end,  In addition, the front-end developers will need to provide documentation on how to customize and configure the front-end "look and feel."
</P>
	
<P>
Requirements: OO design experience, Java programming experience with JDBC, EJB and JSP.
</P>

<P>
<B>QA Developer</B> (2)<BR/>
The QA developers will be responsible for finalizing the system architecture and design, developing written test cases for the QA and Product Test phases, developing the test cases using J-Unit and HTTP-Unit, executing all tests and providing documentation outlining the test cases and their results.
</P>
	
<P>
Requirements: Java programming experience, including usage of JSP and EJB, HTTP-unit, J-Unit.
</P>

<P>
<B>Deliverables</B>
</P>

<P>
<B>Finalize Software Architecture and Design - Complete July 16, 2002</B><BR/>
The purpose of Specification phase is to finalize the system design, test cases and deliverable dates.  All designs should be submitted into CVS.
</P>

<P>
<B>Software Architecture Documents</B>
Requirements
<UL>
	<LI> UML, dataflow and class interaction diagrams</LI>
	<LI> Database Schema and XML Schema</LI>
	<LI> GUI requirements: HTML page design, required data elements and process flow</LI>
</UL>
</P>

<P>
Accountability
<UL>
	<LI> Primary: Architect</LI>
	<LI> Secondary: Front-end Developers, Back-End Developers, QA Developers</LI>
</UL>
</P>

<P>
<B>Test case design and functional test plan</B>
	Requirements
<UL>			
<LI> Definition of what each test case evaluates and how it is executed
Examples: </LI>
<UL>
	<LI>Run unit test harness (i.e. JUnit, HttpUnit)</LI>
	<LI> Define GUI click path</LI>
<UL>
		<LI> Start on main.jsp, click "File Upload"</LI>
	 <LI> Load /testing/test.doc from local machine.</LI>
</UL>
</UL>
	<LI> Review the examples required for component acceptance.  It is the QA developer's 
	responsibility to understand and implement these examples during development.</LI>
</UL>
</P>

<P>
Accountability
<UL>
	<LI> Primary: QA Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<B>Development - Complete August 30, 2002</B><BR/>
The Development phase begins when there is a finalized design document.  During the Development phase the developer should be focused on implementing the component according to the design document.  Also during this phase, the QA Developer should be creating the automated and manual test case as defined in the design phase.  All source code should be checked into CVS on a daily basis as changes are made.  The completion of this phase is marked by the end of development, meaning all source code required for the component is functionally complete and has been checked into CVS.  In addition, all automated and manual test cases are written and ready for execution.  
</P>

<P>
<I>Development of the component</I><BR/> 
	Requirements
<UL>
	<LI> During development, resolve any design issues with the project team</LI>
	<LI> Check source code into CVS on a daily basis.</LI>  
	<LI> Upon completion of the Development phase, a functionally working component must exist in CVS and in the shared development environment.</LI>
</UL>
Accountability
<UL>
	<LI> Primary: Front-end Developers, Back-End Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<I>Development of the test cases</I><BR/>
	Requirements
<UL>
	<LI> Develop automated and manual test cases.</LI>
	<LI> Implement the examples as outlined in the specifications document.</LI>
	<LI> Check source code into CVS on a daily basis. </LI> 
	<LI> Upon completion of the Development phase, all test cases must exist in CVS.</LI>
</UL>
Accountability
<UL>
	<LI> Primary: QA Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<I>Documentation</I><BR/>
	Requirements
<UL>
	<LI> Finalize deployment documentation for the component.  Summarize technologies used and how to implement the component.  Be sure to include package dependencies and required entries to the CLASSPATH.</LI>
	<LI> A general overview of how to implement the future enhancements as listed in the design specs must also be addressed.</LI>
</UL>
Accountability
<UL>
	<LI> Primary: Architect</LI>
</UL>
</P>

<P>
<I>Deployment to QA environment</I><BR/>
	Requirements
<UL>
	<LI> Build the component</LI>
	<LI> Deploy the component in QA</LI>
</UL>
Accountability
<UL>
	<LI> Primary: Front-end Developers, Back-End Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<B>Quality Assurance Test - Complete September 6, 2002</B><BR/>
All component source code undergoes testing.  All code is reviewed to determine correct interpretation of the design, proper commenting and adherence to coding standards. It is expected that this will be an iterative phase where bug fixes and enhancements are added and regression tested.  The result of this phase is a fully functional component or component assembly approved by all members of the development team.
</P>

<P>
<I>Testing</I><BR/>
	Requirements
<UL>
	<LI> Execute Unit tests in selected test harness</LI> 
	<LI> Execute manual tests</LI>
	<LI> Test required component examples</LI>
</UL>
Accountability
<UL>
	<LI> Primary: QA Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<I>Initial Source code review</I><BR/>
	Requirements
<UL>
	<LI> Validate design is implemented correctly</LI>
	<LI> Check code for proper commenting and adherence to coding standards. </LI>
	<LI> A report of the QA and Architects findings must be posted to the newsgroup for the developer and product manager to review.</LI>
</UL>
Accountability
<UL>
	<LI> Primary: Architect</LI>
	<LI> Secondary: QA Developers</LI>
</UL>
</P>

<P>
<I>Subsequent Development</I><BR/>
	Requirements
<UL>
	<LI> Provide ongoing support and fixes for any errors found during testing</LI>
</UL>
Accountability
<UL>
	<LI> Primary: Front-end Developers, Back-End Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<I>Component sign off</I>
<UL>
	<LI> Primary: Architect, Front-end Developers, Back-End Developers, QA Developers</LI>
</UL>
</P>

<P>
<B>Product Test - Complete September 13, 2002</B><BR/>
This phase requires the submission of required documentation, source code, test cases, examples and supporting materials.  QA Test will retest the component from a fresh build and in a new installation.  No functional errors or design flaws should pass through to this phase.  Should any subsequent development be necessary the project will go back to the qa test phase until the problems have been resolved.
TopCoder Software internal QA team will evaluate the component and the test cases.  At this time the code may also undergo user acceptance testing.
</P>

<P>
<I>Final Source Code Review</I><BR/>
	Requirements
<UL>
	<LI> Validate design is implemented correctly</LI>
	<LI> Check code for proper commenting and adherence to coding standards.</LI>
	<LI> A report of the QA and Architects findings must be posted to the newsgroup for the developer and product manager to review.</LI>
</UL>
Accountability
<UL>
	<LI> Primary: Architect</LI>
	<LI> Secondary: QA Developers</LI>
</UL>
</P>

<P>
<I>Testing</I><BR/>
	Requirements
<UL>
	<LI> Execute Unit tests in selected test harness </LI>
	<LI> Execute manual tests</LI>
	<LI> Test required component examples</LI>
</UL>
Accountability
<UL>
	<LI> Primary: QA Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<I>Component sign off</I>
<UL>
	<LI> Primary: QA Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<B>Production Deployment</B><BR/>
The component goes through final approval from the product manager, which includes rating the component.  Once approved the component is packaged and deployed to the TCS Component Catalog.
</P>

<P>
<I>Component sign off and rating</I>
<UL>
	<LI> Primary: Product Manager</LI>
</UL>
</P>

<P>
*In the event that the project plan is delayed in any way, prompt explanation must be reported to the Product Manager.  TopCoder Software is not responsible for incorrect interpretation of the project scope or deliverables as they are listed in this specification document.
</P>

<P>
<B>Technology</B>
<UL>
	<LI> Java 1.4</LI>
	<LI> JSP </LI>
	<LI> JDBC</LI>
	<LI> HTML</LI>
	<LI> MS SQLSERVER 2000</LI>
	<LI> Apache HTTP Server</LI>
	<LI> Apache Tomcat Server or JBoss</LI>
</UL>
</P>


<P>
<B>Payment</B>
</P>

<P>
TopCoder will compensate all team members for their work on the project.  Compensation will consist of both initial payments and royalties on the sale of the component.  The initial payment will be distributed in three installments: at the completion of the design phase; at the completion of the development phase; and at the completion of the project.   
</P>

<P>
Members will also collect royalties on the revenue generated from the sale of the component.  This amount is determined using the company royalty pool percentage, currently set as 5% of the component's revenue, and the percentage of the developer's contribution to the total contribution for the development of the component.  For example if a developer contributes 50% of the work effort for a component (is paid 50% of the total member cost of developing the component) that developer will receive 50% of the royalty pool for that component.  Royalties may be diluted if additional work is done to the component, as the total cost of the component will increase. 
</P>

<P>
<B>Architect	<BR/>
Royalty Percentage - 25.00%<BR/>
Total Payment - $7,500.00</B><BR/>
First Payment - $750.00<BR/>
Second Payment - $3,000.00<BR/>
Third Paymentv$3,750.00<BR/>
</P>
	
<P>
<B>Back-End Developer (2)	<BR/>
Royalty Percentage - 15.00%<BR/>
Developer Total Payment - $4,500.00</B><BR/>
First Payment - $450.00<BR/>
Second Payment - $1,800.00<BR/>
Third Payment - $2,250.00<BR/>
</P>
	
<P>
<B>GUI Developer (2)	<BR/>
Royalty Percentage - 15.00%<BR/>
Developer Total Payment - $4,500.00</B><BR/>
First Payment - $450.00<BR/>
Second Payment - $1,800.00<BR/>
Third Payment - $2,250.00<BR/>
</P>
	
<P>
<B>Quality Assurance (2)	<BR/>
Royalty Percentage - 7.50%<BR/>
Quality Assurance Payment - $2,250.00</B><BR/>
First Payment - $225.00<BR/>
Second Payment - $900.00<BR/>
Third Payment - $1,125.00<BR/>
</P>

<P>
*Completion of the project is defined as follows: 
<UL>
	<LI> All tasks assigned by the product manager have been completed.</LI>
	<LI> The deliverables are functioning properly and integrated within the other project software deliverables. </LI>
	<LI> The product manager has signed off on all delivered components.</LI>
	<LI> Project/task completion is not defined by the timeline listed above.  The dates are to be used as guidelines and may change throughout the project. </LI> 
	<LI> Final payment is conditional on the fully functional component as defined in the requirements and by the product manager.</LI>
</UL>
</P>

<P>
<B>Eligibility</B>
</P>

<P>
You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:
<UL>
	<LI> A US Citizen</LI>
	<LI> A Lawful Permanent Resident of the US (i.e., a Green Card holder) </LI>
	<LI> Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</LI>
	<LI> A Non US Citizen working in their country of residence. </LI>

</UL>
</P>

<P>
<B>Time Line</B>
</P>

<P>
There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The deadline entails integration of the developed components with one another, along with system testing.
</P>

<P>
Architect:<BR/>
Project Start Date: July 11,2002<BR/>
Project End Date: September 13, 2002<BR/>
</P>
                                    <a href="Javascript:document.frmInquire.Project.value='Grant Processing Application';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
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

