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
The TopCoder Distributed Development Environment (DDE) is a software
product that enables the building of components and component-based
software in a distributed environment.  The purpose of DDE is to enable
the development and assembly of reusable software assets. The DDE is not
platform specific.  The only requirement is that re-use be a goal for
all development efforts. 
</P>

<P>
The software industry has failed to drive the adoption of re-use.  The
industry has failed thus far for two primary reasons: Lack of a large
enough base of interacting developers aware of components available for
re-use and, more importantly, lack of accepted framework standards on
which to build components such as Web Services and J2EE.  Since
industry-wide frameworks are being adopted at an increasing pace,
TopCoder, through its large and growing developer base, sees an
opportunity to open up the development of components to our member base.
</P>

<P>
The purpose of this project is to assemble a team of architects to
design the DDE, which will happen in the two phases described below.
The implementation of phase 1 will begin immediately following this
design project.  The deliverables of the design project will be to
determine the scope, timeline and specific deliverables for the
implementation of the DDE.
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

<P>
<B>Phase 1</B><BR/>
<UL>
	<LI>Component Catalog - The Component Catalog is a repository to manage all software assets within one or many organizations.  The catalog will contain all information relating to a component, component project, users, cost, and pricing.  All components will be part of one or many component categories (i.e. infrastructure, retail, biotech).<BR/><BR/></LI>
	<LI>Component Collaborator - A place for users and developers to make suggestions on new components or enhancements to existing components.  If a component is already in specification or development, then a user can apply to participate in the process or begin collaboration on the next phase of the component.<BR/><BR/></LI>
	<LI>Specification Design Center - Once new components are identified and approved in the Component Collaborator, the process moves the idea to the Specification Design Center where formal requirements are gathered from participating / invited members of the user group.  The Specification Design Center assists the group in document collaboration; document management, meeting scheduling and information sharing through eitherchat or a newsgroup type of interface.<BR/><BR/></LI>
	<LI>Component Showroom - Provides functionality to browse and search the catalog for components, view online demos, read case studies, request information, view documentation and API specifications, and download components.  An extension of this component will be developed for TopCoder Software to allow the purchasing of components.</LI>
</UL>
</P>


<P>
<B>Phase 2</B><BR/>
<UL>
	<LI>Software Design Center - Once a component is properly specified, the Software Design Center will provide the collaboration and document management facilities to design software.  A development team will use the tool to directly author, review, enhance, comment and collaborate on-line.  This provides a virtual war-room feel where team-members work on a browser based whiteboard to design a system.  The tool assists the group in document collaboration; meeting scheduling and information sharing through either chat or a newsgroup type of interface.<BR/><BR/></LI>
	<LI>Development Management Center - Provides tools to monitor and report on the progress of development projects and the assigned developers.  The Development Management Center also provides information about developers including level, skill set, history, reviews and utilization.  The center provides tools with which to staff projects as well as communicate with developers.  There is an extension of this to provide specific TopCoder Software functionality, such as linking into the TopCoder member database, handling the posting of projects on the website and assisting in communication with members.<BR/><BR/></LI>
	<LI>Component Development Environment (CDE) - CDE provides access to the component catalog through Integrated Development Environment (IDE) interfaces and Web Service (UDDI) interfaces to allow developers / customers to work directly with component packages (executables, examples, documentation, test cases).<BR/><BR/></LI>
	<LI>Test Harness - Evaluates components by running unit tests, load tests, system tests and performance tests on components to deliver metrics such as CPU, IO and Memory usage.  The Test Harness will report on and rank all software that is tested within its framework.<BR/><BR/></LI>
	<LI>Deployment Center - Every component or bundle of components is packaged in a downloadable form.  This may include JAR, Zip, WAR or EAR.  The Deployment Center automates the packaging of the executables, examples, source code, documentation, configuration files, test cases, etc.<BR/><BR/></LI>
	<LI>Web Service Interface - The Web Service interface will allow for asset sharing and collaboration between companies that use the DDE.  The Web Service interface will provide a SOAP API to the following functionality:</LI>
	    <UL>
	 	<LI> Search the Component Catalog</LI>
		<LI> Download components or component information (for the TopCoder Software extension this will include purchasing components)</LI>
		<LI> Contribute specification or design documents</LI>
		<LI> Request the status of projects</LI>
		<LI> Access the TopCoder Test Harness</LI>
	    </UL>
</UL>
</P>

<P>
The Web Services interface will be designed to work with leading IDE vendors to incorporate developing software systems with the DDE Component Catalog.
</P>

<P>
<B>Staffing</B>
</P>
 
<P>
The component team will consist of two rated TopCoder Members.
</P>

<P>
<B>Data Architect</B><BR/>
The data architect will be responsible for the design of the database schemas and the persistence layer that accesses the schemas.  They will provide all necessary methods and operations for the development of components, which require access to the database or other persistent data stores.  The architect will work with the product manager and the software architect to develop a functionally complete database schema, persistence architecture and object model. 
</P>

<P>
Requirements: Database design experience; OO design experience; Java programming experience with JDBC and XML.
</P>


<P>
<B>Software Architect</B><BR/>
The software architect will be responsible for the delivery of a design that meets all specifications as defined in the requirements documentation and as described by the product manager.  The architect will design the solution and will later manage the deliverables pertaining to that solution by the developer and the QA developer in the implementation phase.  The architect will design the solution such that component reuse is maximized.
</P>	

<P>
Requirements: OO design experience; Java programming experience; JSP experience.
</P>

<P>
<B>Deliverables</B>
</P>

<P>
<B>System Architecture and Design</B><BR/>
The purpose of the System Architecture and Design phase is to finalize the system design and agree upon deliverable dates.
</P>

<P>
<B>System Design Requirements</B><BR/>
&#183; UML (use case, class, state and interaction diagrams), dataflow and software architecture diagrams<BR/>
&#160;&#160; - Accountability  <BR/>
&#160;&#160;&#160; - Primary: Data Architect, Software Architect<BR/>
</P>

<P>
&#183; Database Schema and XML Schema<BR/>
&#160;&#160; - Accountability  <BR/>
&#160;&#160;&#160; - Primary: Data Architect<BR/>
</P>

<P>
&#183; GUI requirements: HTML page design (Data Elements, not creative design), process flow<BR/>
&#160;&#160; - Accountability  <BR/>
&#160;&#160;&#160; - Primary: Software Architect<BR/>
</P>

<P>
&#183; Enhancement strategy document for phase 2<BR/>
&#160;&#160; - Accountability <BR/>
&#160;&#160;&#160; - Primary: Data Architect, Software Architect<BR/>
</P>

<P>
&#183; Deployment strategy document- packaging and installation<BR/>
&#160;&#160; - Accountability  <BR/>
&#160;&#160;&#160; - Primary: Data Architect <BR/>
&#160;&#160;&#160; - Secondary: Software Architect<BR/>
</P>


<P>
<B>Technology</B>
</P>

<P>
<UL>
	<LI>Java 1.3</LI>
	<LI>JSP</LI>
	<LI>JDBC</LI>
	<LI>XML</LI>
	<LI>HTML</LI>
</UL>
</P>

<P>
<B>Payment</B>
</P>

<P>
TopCoder will compensate all team members for their work on the project.  Compensation will consist of both initial payments and royalties on the sale of the component.  The initial payment will be distributed in three installments: at the start of the project; at the completion of the second milestone; and at the completion of the project.  
</P>

<P>
Members will also collect on the revenue generated from the sale of the component.  This amount is determined using the company royalty pool percentage, currently set as 5% of the component's revenue, and the percentage of the developer's contribution to the total contribution for the development of the component.  For example if a developer contributes 50% of the work effort for a component (is paid 50% of the total member cost of developing the component) that developer will receive 50% of the royalty pool for that component.  Royalties may be diluted if additional work is done to the component, as the total cost of the component will increase. 
</P>

<P>
<B>Data Architect</B><BR/>	
Royalty Percentage - 50.00%<BR/>
Total Payment - $1,200.00<BR/>
First Payment - $120.00<BR/>
Second Payment - $480.00<BR/>
Third Payment - $600.00<BR/>
</P>
	
<P>
<B>Software Architect</B><BR/>	
Royalty Percentage - 50.00%<BR/>
Total Payment - $1,200.00<BR/>
First Payment - $120.00<BR/>
Second Payment - $480.00<BR/>
Third Payment - $600.00<BR/>
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
	<LI> Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</LI>
</OL>
</P>

<P>
<B>Time Line</B>
</P>

<P>
There will be a kick-off conference call to address the following: introduction of all team members, design considerations for the new systems, specific timelines, deliverables and any outstanding issues.  
</P>
<P>
Project Start Date: May 21, 2002 <BR/>
Project End Date: Jun 11, 2002<BR/> 
</P>


<P>
* Note there will be an implementation phase immediately following this project.  Pending a performance review the architects may be invited to continue working on the project. 
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

