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
                                    <b>Architect</b>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='Architect';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>
<P>
<B>Overview</B>
</P>

<P>
TopCoder and TopCoder Software are now creating software components and applications that will be sold commercially.  To effectively develop saleable software components it is required that TopCoder Software assemble a group of strong architects from the member base to design and manage the development of consistent and quality software.  
</P>

<P>
Each project team will consist of a TopCoder Software Product Manager along with an architect, developer(s) and QA developer(s) from the member base.  They will follow TopCoder Software’s iterative development methodology to lead them through a number of phases of design, development and deployment.
</P>

<P>
The architect will be responsible for the delivery of a component or software application that meets all specifications as defined in the requirements documentation and as described by the product manager.  The architect will design the solution and manage the deliverables of the developer(s) and the QA developer(s).  The architect will design the solution such that component reuse is maximized.  In addition, the architect will be responsible for testing the functionality of the component, reviewing and managing deliverables (source code, documentation, schema, etc.) and giving final approval to the Product Manager that the component satisfies the requirements and is implemented correctly.
</P>

<P>
The intention of this posting is to amass a group of members interested in the architect position.  If you are interested or have additional questions that are not covered in this posting, please inquire about this position by clicking the “Inquire” link on this page.  TopCoder will interview each candidate to review qualifications as well to ensure each architect fully understands their role in TopCoder Software development projects.  Inquiring does not commit you to working on a project.  In addition, when responding to this posting, please explain your technical strengths (i.e. UML, J2EE, data architecture, .NET, etc.), your development and design experience as well as the estimated number of hours you are typically available to work.
</P>

<P>
<B>Job Description:</B>
<UL>
  <LI>Analyze and interpret functional software requirements, resolving any outstanding issues with the 
  product manager.</LI>
  <LI>Design the technical architecture for software components and software applications.</LI>
  <LI>The design must adhere to Object Oriented design principles.</LI>
  <LI>The design must maintain TopCoder Software’s reusable component focus.</LI>
  <LI>Designs must be provided in industry standard formats, such as UML.</LI>
  <LI>Communicate architecture design and vision with the product manager and project team.</LI>
  <LI>Manage the project team to ensure the on-time development of a quality component.</LI>
  <LI>Perform code reviews to ensure the developed component properly implements the component design.</LI>
  <LI>Work closely with the product manager to ensure that software quality and functionality meet the 
  stringent TopCoder Software Quality Assurance acceptance standards.</LI>
</UL>
</P>

<P>
<B>Additional Responsibilities:</B>
<UL>
  <LI>Mentor team members in proper software development methodologies.</LI>
  <LI>Provide technical assistance to team members.</LI>
  <LI>Act as a component evangelist to the developer community.</LI>
  <LI>Understand and learn various subject areas so as to provide meaningful recommendations to enhance functional software requirements.</LI>
</UL>
</P>

<P>
<B>Technical Skills:</B>
<UL>
  <LI>Strong grasp of Object Oriented design principles with a focus on component-based software development.</LI>
  <LI>Demonstrated experience in software application design.</LI>
  <LI>Technical experience in relevant project technologies.  For example, a given project 
  may require familiarity with the following technologies:</LI>
<UL>
  <LI>Java 1.3 (JSP, Servlets, JDBC),</LI>  
  <LI>Relational database design (Microsoft SQL Server or Oracle).</LI>
</UL>
</UL>
</P>

<P>
<B>Professional Skills:</B>
<UL>
  <LI>Effective written and verbal communication skills.</LI>
  <LI>Proven leadership and management experience.</LI>
  <LI>Team player.</LI>
</UL>
</P>

<P>
<B>Payment</B>
</P>

<P>
TopCoder will compensate all team members for their work on a project.  Compensation will consist of both initial payments and royalties on the sale of the component or software application developed during the project.  The royalty amount is determined using the company royalty pool percentage, currently set as 5% of the component’s revenue, and the percentage of the developer’s contribution to the total contribution for the development of the component.  For example if a developer contributes 50% of the work effort for a component (is paid 50% of the total member cost of developing the component) that developer will receive 50% of the royalty pool for that component.  Royalties may be diluted if additional work is done to the component, as the total cost of the component will increase. 
</P>

<P>
<B>Eligibility</B>
</P>

<P>
You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:
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
There are a number of new projects that will be posted over the next few weeks and months.
</P>

                                    <a href="Javascript:document.frmInquire.Project.value='Architect';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
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

