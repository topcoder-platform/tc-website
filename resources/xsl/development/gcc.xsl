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
                                    <b>GCC Upgrade Analysis Project</b>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='GCC Upgrade Analysis';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>
                                    <BR/>
                                    <b>Preface</b>
                                    <BR/>
                                    <BR/>            
Currently, the TopCoder C++ engine uses GCC 2.96, which is a Redhat 7.1 default. There seems to be several issues with this compiler release. Therefore, TopCoder would like to upgrade to a newer GCC compiler. The goal of this project is evaluate how the current C++ system works, what compiler TopCoder should upgrade to and also provide an overview of what changes need to be made to incorporate the new GCC compiler.
                                    <BR/>
                                    <BR/>
                                    <b>Overview</b>
                                    <BR/>
                                    <BR/>
The project will consist of one phase. This will cover the ramp up time, requirements review, documentation, and discussion about the project overall. During this time, the architect will need to become familiar with the development servers and the source code control environments. Additionally, the architect will document any issues uncovered with the current TopCoder C++ engine.
                                    <BR/>
                                    <BR/>
                                    <b>Staffing</b>
                                    <BR/>
                                    <BR/>
One rated TopCoder Member as the Architect. 
<ul>
<li>
                                    <b>Architect</b>
                                    <BR/>
                                    <BR/>
The architect will be responsible for the design of software and test cases that meet all requirements as defined in the requirements documentation and as described by the product manager. The architect will design the solution such that component reuse is maximized. The architect will be responsible for testing the functionality of the component, reviewing the deliverables (source code, documentation, schema, etc.) and giving final approval to the Product Manager that the component satisfies the requirements and is implemented correctly. 
</li>
</ul>
                                    <b>Functional Overview</b>
                                    <BR/>
                                    <BR/>
The following section describes the tasks required by the Architect.
<ul>
  <li>
    <b>Evaluation of New GCC Compiler</b><br/>  Evaluate what GCC compiler TopCoder should upgrade to.
  </li>
  <li>
    <b>Evaluation of Modifications</b><br/>  Evaluate and document what changes need to be made to the current C++ engine in order to run correctly with the new compiler. Develop a timeline and specifications for a project involving the implementation of the modifications that need to take place.
  </li>
  <li>
    <b>Deliver a Scope Document</b><br/>  A scope document must be delivered to TopCoder by the project completion date.
  </li>
</ul>
                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>
<ul>
  <b>Architect</b><br/>
  The architect will get paid a total of $600.00 at the completion of the project.*<br/>
*Completion of the project is defined as follows: 
   <ul>
     <li>All tasks assigned by the project manager have been completed. </li>
     <li>The deliverables are functioning properly and integrated within the other project software deliverables. </li>
     <li>The project manager has signed off on the scope document. </li>
   </ul>
</ul>
                                    <b>Eligibility</b>
                                    <BR/>
                                    <BR/>            
You must be a rated TopCoder member, at least 18 years of age, meeting all of the membership requirements and fit into one of the following categories:
<ol>
  <li>A US Citizen.</li>
  <li>A Lawful Permanent Resident of the US (i.e., a Green Card holder).</li>
  <li>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
</ol>
                                    <b>Time Line</b>
                                    <BR/>
                                    <BR/>            
The project will begin on the 19th of June. There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The project is scheduled to be completed by June 25th. 
                                    <ul>
                                        <li>Project Start Date:    June 19, 2002</li>
                                        <li>Project End Date:      June 25, 2002</li>
                                    </ul>
                                    <a href="Javascript:document.frmInquire.Project.value='GCC Upgrade Analysis';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
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

