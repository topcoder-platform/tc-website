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
                                    <B>Single Sign On Components</B>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='Single Sign On Components';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>
<P><B>Overview</B></P>

<P>
TopCoder Software is looking to create a set of single sign on (SSO) components that will enable customers to create an architecture that supports SSO for both new and existing applications.  We want to explore SSO for both web applications and desktop applications, including third party packages such as SAP, Peoplesoft, etc.  These may require two different approaches for SSO given the added requirements to launch an application on a client machine as opposed to launching applications in a web environment.  The SSO design should allow new applications to be plugged in and will need to sit on top of an LDAP server. 
</P>

<P>
We are looking for a member with specific experience in SSO to act as architect to define a set of components that will allow customers to build an infrastructure that supports SSO for their applications.  The initial project is the design phase where the specific components are identified.  Once that project is complete, TopCoder will determine which of the components will be developed and added to the TopCoder Software Component Catalog.  
</P>

<P>
<B>Job Description</B>
</P>
<UL>
	<LI>Assist in the development of the SSO requirements with a TopCoder Software Product Manager.</LI>
	<LI>Design a component architecture diagram and a workflow diagram</LI>
	<LI>Design class diagrams for each component</LI>
	<LI>Recommended Skills</LI>
	<LI>Experience with SSO</LI>
	<LI>Experience with LDAP</LI>
	<LI>Experience with J2EE</LI>
</UL>

<P><B>Deliverables</B></P>

<P>High level design documents - October 4<SUP>th</SUP>, 2002<BR/>
Component Diagram - Details the software components used in the SSO architecture.<BR/>
Use Case Diagram - Display the process flow of clients that will use these systems.</P>		

<P>Detailed design documents - October 11<SUP>th</SUP>, 2002<BR/>
	Class Diagram(s) - For each component.<BR/>
Sequence Diagram(s) - Show the interaction of classes for each component.</P>
	
<P><B>Payment</B></P>
<P>TopCoder will compensate all team members for their work on the project. Compensation will consist of both initial payments and royalties on the sale of the component. The initial payment will be distributed in three installments, as follows: (i) upon the successful completion of the Software Architecture and Design Phase, (ii) up the successful completion of the Development Phase and, (iii) upon successful Production Deployment<SUP>*</SUP>.</P> 
<P>Members will also collect royalties on the revenue generated from the sale of the component. This amount is determined using the company royalty pool percentage, currently set as 5% of the component's revenue, and the percentage of the developer's contribution to the total contribution for the development of the component. For example if a developer contributes 50% of the work effort for a component (is paid 50% of the total member cost of developing the component) that developer will receive 50% of the royalty pool for that component. Royalties may be diluted if additional work is done to the component, as the total cost of the component will increase.</P> 

<P><B>Architect</B></P>
<P>Total Payment - $900.00<BR/>
First Deliverable - $300.00<BR/>
Project Completion - $600.00</P>

<P><SUP>*</SUP>Successful Production Deployment is defined as follows:</p>

<UL>
	<LI>All tasks assigned by the product manager have been completed. </LI>
	<LI>The deliverables are functioning properly and integrated within the other project software deliverables. </LI>
	<LI>The product manager has signed off on all delivered components. </LI>
	<LI>Project/task completion is not defined by the timeline listed above. The dates are to be used as guidelines and may change throughout the project. </LI>
	<LI>Final payment is conditional on the fully functional component as defined in the requirements and by the product manager.</LI>
</UL>

<P><B>Eligibility</B></P>
<P>You must be a rated TopCoder member, 18 years of age or older and be one of the following: </P>

<OL>
	<LI>US Citizen </LI>
	<LI>Lawful Permanent Resident of the US (i.e., a Green Card holder) </LI>
	<LI>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor. </LI>
	<LI>Non US Citizen working in their country of residence.</LI>
</OL>

<P><B>Time Line</B></P>
<P>There will be a conference call to address the following: requirements, design considerations for the components, specific time lines, deliverables, and any outstanding issues. <BR/>
Project Start Date: September 27th, 2002<BR/>
Project End Date: October 11th, 2002</P>


                                    <a href="Javascript:document.frmInquire.Project.value='Single Sign On Components';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
          <P><BR/></P>
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

