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
                                    <b>Job Posting</b>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='Job Posting';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>


<P>
<B>Preface</B>
</P>

<P>
Currently, the TopCoder web site uses simple static html pages to present job opportunities to its members,.  This project will add the ability for companies to build job "campaigns" and allow their representatives to view information about the progress of a campaign and those members that have shown interest in the campaign's available jobs.
</P>

<P>
<B>Overview</B>
</P>

<P>
The project will consist of five phases, which are (i) Software Architecture and Design, (ii) Development, (iii) Quality Assurance Test, (iv) Product Test, and (v) Production Deployment.  
</P>

<B>Staffing</B>

<P>
The component team will consist of four rated TopCoder Members.
</P>

<P>
<B>One Architect</B><BR/>
<B>Two Developers</B><BR/>
<B>One Quality Assurance Developer</B><BR/>
</P>

<P>
<B>Architect</B><BR/>
The architect will be responsible for the design of software and test cases that meet all requirements as defined in the requirements documentation and as described by the product manager. The architect will design the solution such that component reuse is maximized. The architect will be responsible for testing the functionality of the component, reviewing the deliverables (source code, documentation, schema, etc.) and giving final approval to the Product Manager that the component satisfies the requirements and is implemented correctly. 
</P>

<P>
<B>Developers</B><BR/>
The developers will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the architect and product manager.  The developer's responsibility will begin on the project start date and extend through to Production Deployment.  The majority of the workload will occur between the project Start Date and the Product Test Phase.  Continued support and component modifications may be required through Production Deployment.
</P>

<P>
<B>QA Developer</B><BR/>
The QA developer will be responsible for finalizing the system architecture and design, developing written test cases for the QA and Product Test phases, developing the test cases using J-Unit and HTTP-Unit, executing all tests and providing documentation outlining the test cases and their results.
</P>

<P>
<B>Functional Overview</B>
</P>

<P>
The following section describes the required tasks.
</P>

<UL>
<P>
	<LI><B>Login</B><BR/>
	Add to the current login functionality to authenticate a corporate user.</LI>
</P>
	
<P>
	<LI><B>Security</B><BR/>
	The user must not be able to modify a request and look at another company's information.</LI>
</P>

<P>
	<LI><B>Content</B><BR/>
	A company may have several job "campaigns".  Each of these campaigns may have a number 
	of jobs available within them.  A company representative will be able to look at each of 
	the company's campaigns and drill into information about those campaigns, for example, 
	the associated job postings.  The representative will then be able to look at detailed 
	and aggregate demographic information about those members interested in the available 
	jobs.  Also, company representatives will be able to look at statistical information 
	about those members who have shown interest in a particular job.</LI>
</P>
</UL>

<P>
<B>Phase 1:  Software Architecture and Design - Complete August 8, 2002</B><BR/>
The purpose of the Software Architecture and Design phase is to finalize the system design, test cases and deliverable dates. All designs should be submitted into CVS. 
</P>

<P>
<B>Software Architecture Documents </B><BR/>
<I>Requirements </I>
<UL>
	<LI> UML, dataflow and class interaction diagrams </LI>
	<LI> Database Schema  </LI>
	<LI> GUI requirements: HTML page design, required data elements and process flow</LI>
</UL>
<I>Accountability </I>
<UL>
	<LI> Primary: Architect </LI>
</UL>
</P>

<P>
<B>Test case design and functional test plan</B><BR/> 
<I>Requirements</I> 
<UL>
	<LI> Definition of what each test case evaluates and how it is executed. Examples include: </LI>
<UL>
		<LI> Run unit test harness (i.e. JUnit, HttpUnit) </LI>
	    <LI> Define GUI click path </LI>
</UL>
	<LI> Start on main.jsp, click "Login", etc</LI>
</UL>
<I>Accountability</I> 
<UL>
	<LI> Primary: QA Developer</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<B>Phase 2:  Development - Complete August 22, 2002</B><BR/>
The Development phase begins when there is a finalized design document. During the Development phase, the developers should be focused on implementing the component according to the design document. Also during this phase, the QA Developer should be creating the automated and manual test case as defined in the design phase. All source code should be checked into CVS on a daily basis as changes are made. The completion of this phase is marked by the end of development, meaning all source code required for the component is functionally complete and has been checked into CVS. In addition, all automated and manual test cases are written and ready for execution. 
</P>

<P>
<B>Development of the component</B><BR/>
<I>Requirements </I>
<UL>
	<LI> During development, resolve any design issues with the project team </LI>
	<LI> Check source code into CVS on a daily basis. </LI>
	<LI> Upon completion of the Development phase, a functionally working component must exist in CVS and in the shared development environment.</LI>
</UL>
<I>Accountability </I>
<UL>
	<LI> Primary: Developers </LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>


<P>
<B>Development of the test cases</B><BR/>
<I>Requirements </I>
<UL>
    <LI> Develop automated and manual test cases. </LI>
	<LI> Implement the examples as outlined in the specifications document. </LI>
	<LI> Check source code into CVS on a daily basis. </LI>
	<LI> Upon completion of the Development phase, all test cases must exist in CVS.</LI>
</UL>
<I>Accountability </I>
<UL>
	<LI> Primary: QA Developer</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>


<B>Documentation</B><BR/>
<I>Requirements</I> 
<UL>
	<LI> Finalize deployment documentation for the component. Summarize technologies used and how to implement the component. Be sure to include package dependencies and required entries to the CLASSPATH. </LI>
	<LI> A general overview of how to implement the future enhancements as listed in the design specs must also be addressed.</LI>
</UL>
<I>Accountability</I> 
<UL>
	<LI> Primary: Architect</LI>
</UL>

<P>
<B>Deployment to QA environment</B><BR/>
<I>Requirements</I> 
<UL>
	<LI> Build the component</LI> 
	<LI> Deploy the component in QA</LI>
</UL>
<I>Accountability </I>
<UL>
	<LI> Primary:  Developers</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>


<P>
<B>Phase 3:  Quality Assurance Test - Complete August 25, 2002</B><BR/>
All component source code undergoes testing. All code is reviewed to determine correct interpretation of the design, proper commenting and adherence to coding standards. It is expected that this will be an iterative phase where bug fixes and enhancements are added and regression tested. The result of this phase is a fully functional component or component assembly approved by all members of the development team. 
</P>

<P>
<B>Testing</B><BR/>
<I>Requirements</I> 
<UL>
	<LI> Execute Unit tests in selected test harness </LI>
	<LI> Execute manual tests </LI>
	<LI> Test required component examples</LI>
</UL>
<I>Accountability</I> 
<UL>
	<LI> Primary: QA Developer</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<B>Initial Source code review</B><BR/>
<I>Requirements</I> 
<UL>
	<LI> Validate design is implemented correctly</LI> 
	<LI> Check code for proper commenting and adherence to coding standards.</LI> 
	<LI> A report of the QA Developer's and Architect's findings must be posted to the newsgroup for the developers and product manager to review.</LI>
</UL>
<I>Accountability</I> 
<UL>
	<LI> Primary: Architect </LI>
	<LI> Secondary: QA Developer</LI>
</UL>
</P>

<P>
<B>Subsequent Development</B><BR/>
<I>Requirements</I> 
<UL>
	<LI> Provide ongoing support and fixes for any errors found during testing</LI>
</UL>
<I>Accountability</I> 
<UL>
	<LI> Primary:  Developers </LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<B>Component sign off </B>
<UL>
	<LI> Primary: Architect</LI>
	<LI> Secondary: Developers, QA Developer</LI>
</UL>
</P>

<P>
<B>Phase 4:  Product Test - Complete August 29, 2002</B><BR/>
This phase requires the submission of required documentation, source code, test cases, examples and supporting materials. QA Test will retest the component from a fresh build and in a new installation. No functional errors or design flaws should pass through to this phase. Should any subsequent development be necessary, the project will go back to the Quality Assurance Test phase until the problems have been resolved. TopCoder's internal QA team will evaluate the component and the test cases. At this time the code may also undergo user acceptance testing. 
</P>

<P>
<B>Final Source Code Review</B><BR/>
<I>Requirements </I>
<UL>
	<LI> Validate design is implemented correctly </LI>
	<LI> Check code for proper commenting and adherence to coding standards.</LI> 
	<LI> A report of the QA Developer's and Architect's findings must be posted to the newsgroup for the developers and product manager to review.</LI>
</UL>
<I>Accountability</I> 
<UL>
	<LI> Primary: Architect </LI>
	<LI> Secondary: QA Developer</LI>
</UL>
</P>

<P>
<B>Testing</B><BR/>
<I>Requirements</I> 
<UL>
	<LI> Execute Unit tests in selected test harness </LI>
	<LI> Execute manual tests </LI>
	<LI> Test required component examples</LI>
</UL>
<I>Accountability </I>
<UL>
	<LI> Primary: QA Developer</LI>
	<LI> Secondary: Architect</LI>
</UL>
</P>

<P>
<B>Component sign off</B> 
<UL>
	<LI> Primary: QA Developer</LI> 
	<LI> Secondary: Architect</LI>
</UL>
</P>


<P>
<B>Phase 5:  Production Deployment - Complete September 3, 2002</B><BR/>
The component goes through final approval from the product manager, which includes rating the component. Once approved the component is packaged and deployed to the TC Code Catalog. 
</P>

<P>
<B>Component sign off and rating</B> 
<UL>
	<LI> Primary: Product Manager</LI>
</UL>
</P>

<P>
NOTE:  In the event that the project plan is delayed in any way, prompt explanation must be reported to the Product Manager. TopCoder is not responsible for incorrect interpretation of the project scope or deliverables as they are listed in this specification document. 
</P>

<P>
<B>Payment</B> 
</P>

<P>
TopCoder will compensate all team members for their work on the project.   The payment will be distributed in four installments: (i) upon the successful completion of the Software Architecture and Design Phase, (ii) up the successful completion of the Development Phase, (iii) upon the successful completion of the Quality Assurance Test Phase, and (iv) upon successful Production Deployment*.
</P>

<P>
	<B>Architect</B><BR/>
The architect will be paid a total of $1,400 in the following installments described above:<BR/>
(i) $140.<BR/>
(ii) $350. <BR/>
(iii) $350. <BR/>
(iv) $560. <BR/>
</P>

<P>
Developers<BR/>
Each developer will be paid a total of $1,800 in the following installments described above:<BR/>
(i) $180.<BR/>
(ii) $450. <BR/>
(iii) $450. <BR/>
(iv) $720.<BR/>
</P>

<P>
QA Developer<BR/>
The QA Developer will be paid a total of $900 in the following installments described above:<BR/>
(i) $90.<BR/>
(ii) $225. <BR/>
(iii) $225. <BR/>
(iv) $360.<BR/>
</P>


<P>
*Successful Production Deployment is defined as follows: 
<UL>
	<LI> All tasks assigned by the product manager have been completed.</LI> 
	<LI> The deliverables are functioning properly and integrated within the other project software deliverables. </LI>
	<LI> The product manager has signed off on all delivered components. </LI>
	<LI> Project/task completion is not defined by the timeline listed above. The dates are to be used as guidelines and may change throughout the project. </LI>
	<LI> Final payment is conditional on the fully functional component as defined in the requirements and by the product manager.</LI>
</UL>
</P>

<P>
<B>Eligibility</B>
</P>

<P>
You must be a rated TopCoder member, meeting all of the membership requirements and fit 
into one of the following categories:
<OL>
	<LI> a US Citizen </LI>
	<LI> a Lawful Permanent Resident of the US (i.e., a Green Card holder) </LI>
	<LI> currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</LI>
	<LI> A Non US Citizen working in their country of residence.</LI>
</OL>
</P>



<P>
<B>Time Line</B>
</P>


<P>
The project will begin on July 25, 2002. There will be a kick-off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The project is scheduled to be completed by August 29th. 
</P>

<P>
<B>Architect</B><BR/>
Project Start Date: July 25, 2002 <BR/>
Project End Date: August 29, 2002<BR/>
</P>

<P>
<B>Developers</B><BR/>
Project Start Date: August 1, 2002 <BR/>
Project End Date: August 29, 2002<BR/>
</P>

<P>
<B>QA Developer</B><BR/>
Project Start Date: August 1, 2002 <BR/>
Project End Date: August 29, 2002<BR/>
</P>



                                    <a href="Javascript:document.frmInquire.Project.value='Job Posting';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
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

