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
A static html mock-up has already been completed to provide detailed insight into 
the required functionality of the system.  While this mock-up is not all-inclusive, 
it does cover all major functional requirements.  
The purpose of this project is to design the technical infrastructure to support 
these requirements.  This infrastructure extends from front-end JSP design to 
back-end database schema design, as well as integration with the following TCS components: 
Email Engine, PDF Conversion, Document Generation, Configuration
Manager, Calendar and File Upload.
</P>

<P>
<B>Functional Overview</B>
</P>

<P>
The Grant Processing application requires the integration of several business functions into one, standalone application.  These business functions are outlined as follows:
<UL>
	<LI> User Registration</LI>
	<LI> User Login</LI>
	<LI> Grant application and management</LI>
       <UL>
          <LI>Project management</LI>
             <UL>
                 <LI> Timeline</LI>
                 <LI> Budget</LI>
                 <LI> Personnel and roles</LI>
             </UL>
          <LI>Status</LI>
          <LI>Task List</LI>
          <LI>Notes</LI>
          <LI>Scheduled Notifications and reminders</LI>
          <LI>Recommendations</LI>
          <LI>Supporting documentation (uploaded files)</LI>                                                         
       </UL>
	<LI> User administration</LI>       
       <UL>
          <LI>Personal information</LI>
          <LI>Organizational information</LI>
          <LI>Application roles and permissions</LI>                                                        
       </UL> 
	<LI> Organizational Administration</LI>       
       <UL>
          <LI>Corporate Information</LI>                                                        
       </UL> 
	<LI> Reporting</LI>                     
</UL>
</P>


<P>
<B>Staffing</B>
</P>
 
<P>
The component team will consist of 2 rated TopCoder Members.
</P>

<P>
<B>Data Architect</B><BR/>
The data architect will be responsible for the design of the database schemas and the persistence layer that accesses the schemas. They will provide all necessary methods and operations for the development of components, which require access to the database or other persistent data stores. The architect will work with the product manager and the software architect to develop a functionally complete database schema, persistence architecture and object model. 
</P>

<P>
Requirements: 
<UL>
	<LI>Database design experience</LI>
	<LI>OO design experience</LI>
	<LI>Java programming experience with JDBC </LI>
	<LI>XML</LI>
</UL>
</P>

<P>
<B>Software Architect</B><BR/>
The software architect will be responsible for the delivery of a design that meets all specifications as defined in the requirements documentation and as described by the product manager. The architect will design the solution and will later manage the deliverables pertaining to that solution by the developer and the QA developer in the implementation phase.
</P>

<P>
Requirements: 
<UL>
	<LI>OO design experience</LI>
	<LI>Java programming experience</LI>
	<LI>JSP experience</LI>
</UL>
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
</P>

<P>
<UL>
	<LI>UML (use case, class, state and interaction diagrams), dataflow and software architecture diagrams</LI>
<UL>
       <LI>Accountability </LI>
        	<LI>Primary: Data Architect, Software Architect</LI>
</UL>
</UL>
</P>

<P>
<UL>
	<LI>Database Schema</LI>
<UL>
       <LI>Accountability </LI>
        	<LI>Primary: Data Architect</LI>
</UL>
</UL>
</P>

<P>
<UL>
	<LI>GUI requirements: JSP structure, Process flow, Security implementation</LI>
<UL>
       <LI>Accountability </LI>
        	<LI>Primary: Software Architect</LI>
</UL>
</UL>
</P>

<P>
<UL>
	<LI>Deployment strategy document- packaging and installation</LI>
<UL>
		   <LI>Accountability </LI>
        	<LI>Primary: Data Architect </LI>
        	<LI>Secondary: Software Architect</LI>
</UL>
</UL>
</P>

<B>Technology</B>
<UL>
	<LI>Java 1.3</LI> 
	<LI>JSP </LI>
	<LI>JDBC</LI>
	<LI>HTML</LI>
	<LI>MS SQLSERVER 2000</LI>
	<LI>Apache HTTP Server</LI>
	<LI>Apache Tomcat Server</LI>
</UL>


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
Data Architect	<BR/>
Royalty Percentage - 50.00%<BR/>
Total Payment - $600.00<BR/>
First Payment - $60.00<BR/>
Second Payment - $540.00<BR/>
</P>
	
<P>
Software Architect	<BR/>
Royalty Percentage - 50.00%<BR/>
Developer Total Payment - $600.00<BR/>
First Payment - $60.00<BR/>
Second Payment - $540.00<BR/>
</P>	

<P>
*Completion of the project is defined as follows:<BR/> 
All tasks assigned by the product manager have been completed. 
The deliverables are functioning properly and integrated within the other project software deliverables. 
The product manager has signed off on all delivered components.
Project/task completion is not defined by the timeline listed above.  The dates are to be used as guidelines and may change throughout the project.  Final payment is conditional on the fully functional component as defined in the requirements and by the product manager.
</P>


<P>
<B>Eligibility</B>
</P>

<P>
You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:
A US Citizen
A Lawful Permanent Resident of the US (i.e., a Green Card holder) 
Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.
</P>

<P>
<B>Time Line</B>
</P>

<P>
There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The deadline entails integration of the developed components with one another, along with system testing.
</P>

<P>
Architect:<BR/>
Project Start Date: June 14,2002<BR/>
Project End Date: June 24, 2002<BR/>
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

