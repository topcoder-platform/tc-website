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
                                    <b>Design of the TopCoder Distributed Development Environment</b>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='Design of the TopCoder Distributed Development Environment';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>
<P>
<B>Overview</B>
</P>

<P>
The TopCoder Distributed Development Environment (DDE) is a software product that enables the building of components and component-based software in a distributed environment.  The purpose of DDE is to enable the development and assembly of reusable software assets. The DDE is not platform specific.  The only requirement is that re-use be a goal for all development efforts. 
</P>

<P>
The software industry has failed to drive the adoption of re-use.  The industry has failed thus far for two primary reasons: Lack of a large enough base of interacting developers aware of components available for re-use and, more importantly, lack of accepted framework standards on which to build components such as Web Services and J2EE.  Since industry-wide frameworks are being adopted at an increasing pace, TopCoder, through its large and growing developer base, sees an opportunity to open up the development of components to our member base. 
</P>

<P>
The purpose of this project is to finalize and implement a design, which was started by an architecture team, to satisfy the business requirements of the first phase of the DDE.  The project completion will be marked, by the successful production deployment of the DDE.
</P>


<P>
<B>Functional Overview</B>
</P>

<P>
The DDE provides a framework for developing component-based software.  A development organization can manage its own reusable assets inside the DDE as well as pull in assets from other organizations using the DDE and TopCoder Software directly.  Development organizations that use the DDE along with the TopCoder Software Distributed Development Methodology will receive maximum benefit.  The Distributed Development Methodology is an iterative development process that leads developers through a number of phases / deliverables, all the way from specification to deployment.  The deliverables include UML diagrams, documentation, commented source code, code reviews, QA rating and of course, detailed software specifications.  These deliverables allow for a robust and optimally functioning DDE.  
</P>

<P>
The DDE promotes the reuse of software by providing strong search functionality over a component catalog, component documentation, examples / demos and API's. The DDE assists developers in the selection of complimentary components to build component bundles (applications) from the component catalog.  Where no component is found, the DDE will start a component collaboration session to define the requirements for a component.
</P>

<P>
Following is the scope of the DDE project, split into Phase 1 and Phase 2:
</P>

Phase 1
<UL>

<P>
	<LI> Component Catalog - The Component Catalog is a repository to manage all software assets within one or many organizations.  The catalog will contain all information relating to a component, component project, users, cost, and pricing.  All components will be part of one or many component categories (i.e. infrastructure, retail, biotech).</LI>
</P>

<P>
	<LI> Component Collaborator - A place for users and developers to make suggestions on new components or enhancements to existing components.  If a component is already in specification or development, then a user can apply to participate in the process or begin collaboration on the next phase of the component.</LI>
</P>

<P>
	<LI> Specification Design Center - Once new components are identified and approved in the Component Collaborator, the process moves the idea to the Specification Design Center where formal requirements are gathered from participating / invited members of the user group.  The Specification Design Center assists the group in document collaboration; document management, meeting scheduling and information sharing through either chat or a news group-like interface.</LI>
</P>

<P>
	<LI> Component Showroom - Provides functionality to browse and search the catalog for components, view online demos, read case studies, request information, view documentation and API specifications, and download components.  An extension of this component will be developed for TopCoder Software to allow the purchasing of components.</LI>
</P>
</UL>

Phase 2
<UL>
<P>
	<LI> Software Design Center - Once a component is properly specified, the Software Design Center will provide the collaboration and document management facilities to design software.  A development team will use the tool to directly author, review, enhance, comment and collaborate on-line.  This provides a virtual war-room feel where team-members work on a browser based whiteboard to design a system.  The tool assists the group in document collaboration; meeting scheduling and information sharing through either chat or a news group-like interface.</LI>
</P>

<P>
	<LI> Development Management Center - Provides tools to monitor and report on the progress of development projects and the assigned developers.  The Development Management Center also provides information about developers including level, skill set, history, reviews and utilization.  The center provides tools with which to staff projects as well as communicate with developers.  There is an extension of this to provide specific TopCoder Software functionality, such as linking into the TopCoder member database, handling the posting of projects on the website and assisting in communication with members</LI>
</P>

<P>
	<LI> Component Development Environment (CDE) - CDE provides access to the component catalog through Integrated Development Environment (IDE) interfaces and Web Service (UDDI) interfaces to allow developers / customers to work directly with component packages (executables, examples, documentation, test cases).</LI>
</P>

<P>
	<LI> Test Harness - Evaluates components by running unit tests, load tests, system tests and performance tests on components to deliver metrics such as CPU, IO and Memory usage.  The Test Harness will report on and rank all software that is tested within its framework.</LI>
</P>

<P>
	<LI> Deployment Center - Every component or bundle of components is packaged in a downloadable form.  This may include JAR, Zip, WAR or EAR.  The Deployment Center automates the packaging of the executables, examples, source code, documentation, configuration files, test cases, etc.</LI>
</P>

<P>
	<LI> Web Service Interface - The Web Service interface will allow for asset sharing and collaboration between companies that use the DDE.  The Web Service interface will provide a SOAP API to the following functionality:
<UL>
	<LI> Search the Component Catalog</LI>
	<LI> Download components or component information (for the TopCoder 
	Software extension this will include purchasing components)</LI>
	<LI> Contribute specification or design documents</LI>
	<LI> Request the status of projects</LI>
	<LI> Access the TopCoder Test Harness</LI>
</UL>
	The Web Services interface will be designed to work with leading IDE vendors to incorporate developing software systems with the DDE Component Catalog.</LI>
</P>

</UL>

<P>
<B>Staffing</B>
</P>

<P>
The component team will consist of nine rated TopCoder Members.
</P>

<P>
<B>Data Architect (1)</B><BR/>
The data architect will be responsible for the design of the database schemas and the persistence layer that accesses the schemas.  They will provide all necessary methods and operations for the development of components, which require access to the database or other persistent data stores.  The architect will work with the product manager and the software architect to develop a functionally complete database schema, persistence architecture and object model. 
</P>

<P>
Requirements: Database design experience; OO design experience; Java programming experience with JDBC and XML.
</P>

<P>
<B>Software Architect (1)</B><BR/>
The software architect will be responsible for the delivery of a design that meets all specifications as defined in the requirements documentation and as described by the product manager.  The architect will design the solution and will later manage the deliverables pertaining to that solution by the developer and the QA developer in the implementation phase.  The architect will design the solution such that component reuse is maximized.
</P>
	
<P>
	Requirements: OO design experience; Java programming experience; JSP experience.
</P>

<P>
<B>Usability Architect (1)</B><BR/>
The role of the Usability Architect (UA) is to work through the various levels of user interaction required for a component or an assembly of components to work as a stand alone or combined as an application. The UA will work in conjunction with the Product Manager and the Software Architect to align business and technology goals with the user experience. Usability Architects will be involved in the requirements, prototype and implementation phases and will deliver the necessary layouts, code, and documentation required to meet the goals set forth by the project requirements. The UA will be required to use existing components and TopCoder Software brand guidelines to produce all elements needed in the user interaction. In the case where new processes are introduced that have not been accounted for in any component sample, the UA will need to create the necessary front-end (while applying the brand guidelines) with the intention of it being reused in other applications and/or components.
</P>
	
<P>
	Requirements: User Interface / Information Architecture Experience, HTML, Style Sheets
</P>

<P>
<B>Data Architecture Developer (1)</B><BR/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager.  The developer's responsibility will begin on the project start date and extend through to Production Deployment.  The majority of the workload will occur between the project Start Date and completion of Beta Testing.  Continued support and component modifications may be required through deployment.
</P>

<P>
Responsibilities:
<UL>
	<LI> Develop persistence layer (data access layer).</LI>
	<LI> Develop data interfaces for specific business components.</LI>
	<LI> Technologies: Java 1.3, EJB, JDBC</LI>
</UL>
</P>


<P>
<B>Front-end Developer (1)</B><BR/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager.  The developer's responsibility will begin on the project start date and extend through to Production Deployment.  The majority of the workload will occur between the project Start Date and completion of Beta Testing.  Continued support and component modifications may be required through deployment.
</P>

<P>
Responsibilities:
<UL>
	<LI> Develop Model2 Architecture (Model View Controller pattern) for front-end development.</LI>
	<LI> Develop client interfaces.</LI>
	<LI> Technologies: Java 1.3, EJB, XML, XSL</LI>
</UL>
</P>


<P>
<B>Component Developer (2)</B><BR/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager.  The developer's responsibility will begin on the project start date and extend through to Production Deployment.  The majority of the workload will occur between the project Start Date and completion of Beta Testing.  Continued support and component modifications may be required through deployment.
</P>

<P>
Responsibilities:
<UL>
	<LI> Develop business logic required to implement the DDE phase 1 requirements.</LI>
	<LI> Technologies: Java 1.3, EJB</LI>
</UL>
</P>


<P>
<B>Quality Assurance (2)</B><BR/>
The QA Developer is responsible for designing and implementing a test plan from the component design documentation.  The QA developer is also responsible for testing the completed component.  Tests should involve both normal and extreme scenarios to simulate production usage.  The developer's responsibility will begin on the project Start Date and extend through to Production Deployment.  In addition to implementing component testing, it is also the QA Developer's responsibility to stay abreast of and contribute to the component design and the progress of the development.  In the event the lead Developer cannot complete the project, TopCoder Software fully expects the QA developer to have sufficient knowledge of the component so as to continue and complete development.
</P>

<P>
Responsibilities:
<UL>
	<LI> Develop unit tests for all publicly accessible methods.</LI>
	<LI> Develop and implement functional unit test plan and product test plan.</LI>
	<LI> Technologies: Java 1.3, JUnit, HTTPUnit</LI>
</UL>
</P>

<P>
<B>Payment</B>
</P>

<P>
TopCoder will compensate all team members for their work on the project.  Compensation will consist of both initial payments and royalties on the sale of the component.  The initial payment will be distributed in three installments: at the completion of the design phase; at the completion of the development phase; and at the completion of the project.  
</P>

<P>
Members will also collect on the revenue generated from the sale of the component.  This amount is determined using the company royalty pool percentage, currently set as 5% of the component's revenue, and the percentage of the developer's contribution to the total contribution for the development of the component.  For example if a developer contributes 50% of the work effort for a component (is paid 50% of the total member cost of developing the component) that developer will receive 50% of the royalty pool for that component.  Royalties may be diluted if prior work has already been completed or if additional work is done to the component, as the total cost of the component increases. 
</P>

<P>
<B>Software Architect (1)</B>	<BR/>
Royalty Percentage - 24.18%<BR/>
Total Payment - $8,100.00<BR/>
First Payment - $810.00<BR/>
Second Payment - $3,240.00<BR/>
Third Payment - $4,050.00<BR/>
</P>
	
<P>
<B>Data Architect (1)</B>	<BR/>
Royalty Percentage - 8.06%<BR/>
Developer Total - Payment	$2,700.00<BR/>
First Payment - $270.00<BR/>
Second Payment - $1,080.00<BR/>
Third Payment - $1,350.00<BR/>
</P>
	
<P>
<B>Usability Architect (1)</B>	<BR/>
Royalty Percentage - 8.06%<BR/>
Quality Assurance Payment - $2,700.00<BR/>
First Payment - $270.00<BR/>
Second Payment - $1,080.00<BR/>
Third Payment - $1,350.00<BR/>
</P>
	
<P>
<B>Front-End Developer (1)</B>	<BR/>
Royalty Percentage - 11.94%<BR/>
Total Payment - $4,000.00<BR/>
First Payment - $400.00<BR/>
Second Payment - $1,600.00<BR/>
Third Payment - $2,000.00<BR/>
</P>
	
<P>
<B>Component Developer (2)</B>	<BR/>
Royalty Percentagev11.94%<BR/>
Total Payment - $4,000.00<BR/>
First Payment - $400.00<BR/>
Second Payment - $1,600.00<BR/>
Third Payment - $2,000.00<BR/>
</P>
	
<P>
<B>Data Architecture Developer (1)</B>	<BR/>
Royalty Percentage - 11.94%<BR/>
Total Payment - $4,000.00<BR/>
First Payment - $400.00<BR/>
Second Payment - $1,600.00<BR/>
Third Payment - $2,000.00<BR/>
</P>
	
<P>
<B>Quality Assurance (2)</B>	<BR/>
Royalty Percentage - 5.97%<BR/>
Quality Assurance Payment - $2,000.00<BR/>
First Payment - $200.00<BR/>
Second Payment - $800.00<BR/>
Third Payment - $1,000.00<BR/>
</P>

<P>
*Completion of the project is defined as follows: 
<UL>
	<LI> All tasks assigned by the product manager have been completed. </LI>
	<LI> The deliverables are functioning properly and integrated within the other project software deliverables.</LI> 
	<LI> The product manager has signed off on all delivered components.</LI>
	<LI> Project/task completion is not defined by the timeline listed above.  The dates are to be used as guidelines and may change throughout the project.</LI>  
	<LI> Final payment is conditional on the fully functional component as defined in the requirements and by the product manager.</LI>
</UL>
</P>

<P>
<B>Eligibility</B>
</P>

<P>
You must be a rated TopCoder member, at least 18 years of age, meeting all of the TopCoder membership requirements and fit into one of the following categories:
<OL>
	<LI> A US Citizen.</LI>
	<LI> A Lawful Permanent Resident of the US (i.e., a Green Card holder).</LI>
	<LI> Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.
	Time Line</LI>
</OL>
</P>

<P>
There will be a kick-off conference call to address the following: introduction of all team members, design considerations for the new systems, specific timelines, deliverables and any outstanding issues.  
</P>

<P>
Project Start Date: June 26, 2002 <BR/>
Project End Date: August 23, 2002<BR/>
</P>

                                    <a href="Javascript:document.frmInquire.Project.value='Design of the TopCoder Distributed Development Environment';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
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

