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
                                    <b>PDF Conversion Component Implementation Project</b>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='PDF Conversion Component Implementation Project';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>
<P>
<B>Overview</B>
</P>

<P>
The PDF Conversion component will transform standard files (i.e. Microsoft Word, Microsoft Excel, GIF, JPG) 
into Portable Document Format (PDF) files.  The value the component provides is consistency in a document 
format that can be read on all major platforms (i.e. Microsoft, Macintosh, Solaris, HPUX, IBM AIX).   
PDF files are non-platform specific and are typically read through freeware software, published by Adobe, 
Inc, called Acrobat Reader.  Companies that communicate with electronic documents are faced with the 
challenge of supporting multiple file formats and software versions, either when distributing files to 
multiple recipients or receiving files from multiple sources.  The PDF Conversion component will allow 
standard file types to be converted into PDF to avoid issues such as: Windows users sharing documents 
with Macintosh users or having the wrong version of Microsoft Office.   
</P>

<P>
An example implementation of the PDF Conversion component is a university that processes student 
applications on-line.  Students fill-out the standard loan information on-line as well as upload 
references and essays.  The uploaded files can be in any standard operating system file-type or 
version up to three years old.  Once the application is submitted, the admissions board reviews 
the student and decides whether or not they should be accepted to the university.  The problem 
with this process stems from the admissions board having to support all major file types. 
If the documents were converted into a common industry format: PDF, then there is no software 
or hardware requirement outside of a PDF reader such as Adobe Acrobat.  The PDF Conversion 
component would be used at the point the student uploads the file.
</P>

<P>
The PDF Conversion component provides a local API, as well as a Web Services interface, to
 access conversion routines that accept specific document formats and output a corresponding 
 PDF version of the document.  The component will provide facilities to perform asynchronous 
 or synchronous access to the conversion routines.  It may also act as a server that polls for 
 files located on the local file system, which need to be converted.  Currently the component 
 supports Microsoft Office documents, GIF and JPEG, but the architecture is designed such that 
 future conversion routines can be added, as they become a requirement.
</P>

<P>
<B>Functional Overview</B>
</P>

<P>
The PDF Conversion component has already completed its initial design phase.  The result of this phase is a design document that outlines potential and recommended solutions to develop a robust, scaleable PDF Conversion component.  In addition to converting files to PDF, this document also outlines issues such as synchronous/asynchronous processing, queuing of pending conversions, and threading to handle concurrent conversions and fail-over.
</P>

<P>
In an effort to rapidly develop a component that meets the immediate needs, the first phase of development will focus on asynchronous document conversion.  Issues such as queuing, threading and synchronous processing will be addressed in future releases.
</P>


<P>
<B>Staffing</B>
</P>
 
<P>
The component team will consist of three rated TopCoder Members.
</P>

<P>
<B>Architect</B><BR/>
The architect will be responsible for the delivery of a component that meets all specifications as defined in the requirements documentation and as described by the product manager.  The architect will design the solution and manage the deliverables of the developer and the QA developer.  The architect will design the solution such that component reuse is maximized.  The architect will be responsible for testing the functionality of the component, reviewing and managing deliverables (source code, documentation, schema, etc.) and giving final approval to the product manager that the component satisfies the requirements and is implemented correctly.
</P>

<P>
A design project for the PDF Conversion component has already taken place.  The architect is responsible for reviewing and signing off on the existing design or suggesting improvements.  The architect must resolve any outstanding issues or implementation details before development begins.  The architect should be familiar with all technologies being used in this project.
</P>

<P>
<B>Developer</B><BR/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager.  The developer's responsibility will begin on the project start date and extend through to Production Deployment.  The majority of the workload will occur between the project Start Date and completion of Beta Testing.  Continued support and component modifications may be required through deployment.
</P>

<P>
Responsibilities:
<UL>
	<LI>Develop client interfaces.</LI>
	<LI>Develop "Conversion Engine".  This engine is responsible for handling client requests, managing 
	component and system resources, and calling appropriate document handlers to convert individual documents.</LI>
	<LI>Develop interfaces with third party products or conversion components to convert documents to PDF.</LI>
	<LI>Technologies: Java 1.3, Log4J, XSL, XML, COM</LI>
</UL>
</P>

<P>
<B>QA Developer</B><BR/>
The QA Developer is responsible for designing and implementing a test plan from the component design documentation.  The QA developer is also responsible for testing the completed component.  Tests should involve both normal and extreme scenarios to simulate production usage.  The QA developer's responsibility will begin on the project Start Date and extend through to Production Deployment.  In addition to implementing component testing, it is also the QA Developer's responsibility to stay abreast of and contribute to the component design and the progress of the development.  In the event the lead Developer cannot complete the project, TopCoder Software fully expects the QA developer to have sufficient knowledge of the component so as to continue and complete development.
</P>

<P>
Responsibilities:
<UL>
	<LI>Develop unit tests for all publicly accessible methods.</LI>
	<LI>Develop and implement functional unit test plan.</LI>
	<LI>Implement required component examples.</LI>
	<LI>Technologies: Java 1.3, JSP, JUNIT, HTTPUNIT, HTML</LI>
</UL>
</P>

<P>
<B>Technologies</B>
<UL>
	<LI>Java 1.3</LI>
	<LI>JSP</LI>
	<LI>HTML</LI>
	<LI>XSL-FO</LI>
	<LI>XML-FOP</LI>
	<LI>COM</LI>
</UL>
</P>

<P>
<B>Payment</B>
</P>

<P>
TopCoder will compensate all team members for their work on the project.  Compensation will consist of both initial payments and royalties on the sale of the component.  The initial payment will be distributed in three installments: at the start of the project; at the completion of the second milestone; and at the completion of the project.  
</P>

<P>
Members will also collect royalties on the revenue generated from the sale of the component.  This amount is determined using the company royalty pool percentage, currently set as 5% of the component's revenue, and the percentage of the developer's contribution to the total contribution for the development of the component.  For example if a developer contributes 50% of the work effort for a component (is paid 50% of the total member cost of developing the component) that developer will receive 50% of the royalty pool for that component.  Royalties may be diluted if additional work is done to the component, as the total cost of the component will increase. 
</P>

<P>
<B>Architect</B>	<BR/>
Royalty Percentage - 19.35%<BR/>
Total Payment - $600.00<BR/>
First Payment - $60.00<BR/>
Second Payment - $240.00<BR/>
Third Payment - $300.00<BR/>
</P>
	
<P>
<B>Developer</B>	<BR/>
Royalty Percentage - 64.52%<BR/>
Developer Total Payment - $2000.00<BR/>
First Payment - $200.00<BR/>
Second Payment - $800.00<BR/>
Third Payment - $1000.00<BR/>
</P>
	
<P>
<B>Quality Assurance</B> 	<BR/>
Royalty Percentage - 16.13%<BR/>
Quality Assurance Payment - $500.00<BR/>
First Payment - $50.00<BR/>
Second Payment - $200.00<BR/>
Third Payment - $250.00<BR/>
</P>

<P>
*Completion of the project is defined as follows: 
<UL>
	<LI>All tasks assigned by the product manager have been completed.</LI> 
	<LI>The deliverables are functioning properly and integrated within the other project software deliverables.</LI> 
	<LI>The product manager has signed off on all delivered components.</LI>
	<LI>Project/task completion is not defined by the timeline listed above.  The dates are to be used as guidelines 
	and may change throughout the project.  Final payment is conditional on the fully functional 
	component as defined in the requirements and by the product manager.</LI>
</UL>
</P>

<P>
<B>Eligibility</B>
</P>

<P>
You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership 
requirements and fit into one of the following categories:
<UL>
	<LI>A US Citizen</LI>
	<LI>A Lawful Permanent Resident of the US (i.e., a Green Card holder)</LI> 
	<LI>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</LI>
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
Project Start Date: May 30, 2002 <BR/>
Project End Date: July 1, 2002<BR/>
</P>

<P>
Developer / QA Developer<BR/>
Project Start Date: June 3, 2002 <BR/>
Project End Date: July 2, 2002<BR/>
</P>

                                    <a href="Javascript:document.frmInquire.Project.value='PDF Conversion Component Implementation Project';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
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

