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
                               <font color="#ffffff" size="2" face="arial, helvetica, verdana, sans-serif">
                                    <FORM method="POST" name="frmInquire" ACTION="/">
                                        <INPUT VALUE="development" NAME="t" TYPE="hidden"/><INPUT VALUE="inquire" NAME="c" TYPE="hidden"/><INPUT VALUE="" NAME="Project" TYPE="hidden"/><INPUT VALUE="" NAME="To" TYPE="hidden"/>
                                    </FORM>
                                        <span class="statTextBig">Notification Component Project</span>
                                    </font>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Notification Component';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <b>Overview</b>
                                    <BR/>
                                    <BR/>            
The Notification component is an event driven service that manages user and system messages. The Notification component is responsible for scheduling, sending and keeping track of messages.  These messages may come in the form of pending or past-due tasks, reminders, mass announcements, system commands, etc.  The initial version of this component needs to handle interfacing with an existing TCSEmail component to send emails, provide an interface for clients to access messages and provide the ability to trigger events such as calling other components.  The only events this component is concerned with is date driven events, in future releases events may include more complex logic. The format and transmission of the message may vary; for instance, this project is only concerned with sending email messages and triggering other components, but additional transmission mediums, which are out of the scope of this project, may include instant messaging, broadcasts messages, mobile device messages (SMS), etc.   
                                    <BR/>
                                    <BR/>
                                    <b>Functional Overview</b>
                                    <BR/>
                                    <BR/>
The Notification Component is responsible for the following:
<ol>
<li>Interface to schedule events.</li>
<li>Polling a database or queue for events.</li>
<li>Interfacing with the TCS Email Component.</li>
<li>Generating messages according to message type by interfacing with the TCSDocumentGeneration component.</li>
<li>Rescheduling (resetting) messages to be sent at a later date.</li>
<li>Deleting messages in the database.</li>
<li>Navigating and searching messages based on attributes.</li>
<li>Web based administration tool to manage the message repository.</li>
<li>Provide a data access interface to perform standard SQL.</li>
</ol>
                                            <b>Staffing</b>
                                            <BR/>
                                            <BR/>
The component team will consist of three rated TopCoder Members.
                                            <BR/>
                                            <BR/>
                                            <b>Architect</b>
                                            <BR/>
                                            <BR/>
The architect will be responsible for the design of software and test cases that meet all requirements as defined in the requirements documentation and as described by the product manager.  The architect will design the solution such that component reuse is maximized.  The architect will be responsible for testing the functionality of the component, reviewing the deliverables (source code, documentation, schema, etc.) and giving final approval to the Product Manager that the component satisfies the requirements and is implemented correctly.  
                                            <BR/>
                                            <BR/>
                                            <b>Developer</b>
                                            <BR/>
                                            <BR/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager.  The developer's responsibility will begin on the project start date and extend through to Production Deployment.  The majority of the workload will occur between the project Start Date and completion of Beta Testing.  Continued support and component modifications may be required through deployment.
                                            <BR/>
                                            <BR/>
                                            <b>QA Developer</b>
                                            <BR/>
                                            <BR/>
The QA Developer is responsible for testing the completed component.  Tests should involve both normal and extreme scenarios to simulate production usage.  The developer's responsibility will begin on the project Start Date and extend through to Production Deployment.  The majority of the workload will occur during Beta and QA testing.  In addition to implementing component testing, it is also the QA Developer's responsibility to stay abreast of component design and progress.  In the event the lead Developer cannot complete the project, TopCoder Software fully expects the QA developer to have sufficient knowledge of the component so as to continue and complete development.  
                                            <BR/>
                                            <BR/>
                                            <b>Technology</b>
                                            <BR/>
                                            <ul>
                                              <li>Java 1.3</li>
                                              <li>XML</li>
                                              <li>JDBC</li>
                                              <li>HTML</li>
                                              <li>JSP</li>
                                            </ul>
                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>
TopCoder will compensate all team members for their work on the project.  Compensation will consist of both initial payments and royalties on the sale of the component.  The initial payment will be distributed in three installments: at the start of the project; at the completion of the second milestone; and at the completion of the project.  
                                    <BR/>
                                    <BR/>
Members will also collect royalties on the revenue generated from the sale of the component.  This amount is determined using the company royalty pool percentage, currently set as 5% of the component's revenue, and the percentage of the developer's contribution to the total contribution for the development of the component.  For example if a developer contributes 50% of the work effort for a component (is paid 50% of the total member cost of developing the component) that developer will receive 50% of the royalty pool for that component.  Royalties may be diluted if additional work is done to the component, as the total cost of the component will increase. 
                                    <BR/>
                                    <BR/>
<TABLE WIDTH="50%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" >
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig" colspan="2">Architect</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig">Royalty Percentage</TD>
    <TD class="statTextBig" align="right">22.36%</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig">Total Payment</TD>
    <TD class="statTextBig" align="right">$540.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">First Payment</TD>
    <TD class="statText" align="right">$54.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">Second Payment</TD>
    <TD class="statText" align="right">$216.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">Third Payment</TD>
    <TD class="statText" align="right">$270.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig" colspan="2"><BR/></TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig" colspan="2">Developer</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig">Royalty Percentage</TD>
    <TD class="statTextBig" align="right">62.11%</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig">Total Payment</TD>
    <TD class="statTextBig" align="right">$1,500.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">First Payment</TD>
    <TD class="statText" align="right">$150.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">Second Payment</TD>
    <TD class="statText" align="right">$600.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">Third Payment</TD>
    <TD class="statText" align="right">$750.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig" colspan="2"><BR/></TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig" colspan="2">QA Developer</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig">Royalty Percentage</TD>
    <TD class="statTextBig" align="right">15.53%</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statTextBig">Total Payment</TD>
    <TD class="statTextBig" align="right">$375.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">First Payment</TD>
    <TD class="statText" align="right">$37.50</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">Second Payment</TD>
    <TD class="statText" align="right">$150.00</TD>
  </TR>
  <TR>
    <TD class="statTextBig" colspan="2">&#160;&#160;&#160;&#160;&#160;</TD>
    <TD class="statText">Third Payment</TD>
    <TD class="statText" align="right">$187.50</TD>
  </TR>
</TABLE>

<BR/>
*Completion of the project is defined as follows: 
                                    <ul>
                                        <li>All tasks assigned by the project manager have been completed. </li>
                                        <li>The deliverables are functioning properly and integrated within the other project software deliverables. </li>
                                        <li>The project manager has signed off on all delivered components. </li>
                                        <li>Project/task completion is not defined by the timeline listed below.  The dates are to be used as guidelines and may change throughout the project.  Final payment is conditional on the fully functional component as defined in the requirements and by the project manager.</li>
                                    </ul>
                                    <b>Eligibility</b>
                                    <BR/>
                                    <BR/>            
You must be a rated TopCoder member, meeting all of the membership requirements and fit into one of the following categories:<BR/>
                                    <ol>
                                        <li>A US Citizen</li>
                                        <li>A Lawful Permanent Resident of the US (i.e., a Green Card holder)</li>
                                        <li>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
                                    </ol>
                                    <b>Time Line</b>
                                    <BR/>
                                    <BR/>            
There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The deadline entails integration of the developed components with one another, along with system testing.
                                    <BR/>
                                    <BR/>
                                    Architect:
                                    <ul>
                                        <li>Project Start Date:    May 3, 2002</li>
                                        <li>Project End Date:      May 28, 2002</li>
                                    </ul>
                                    Developer / QA Developer:
                                    <ul>
                                        <li>Project Start Date:    May 7, 2002</li>
                                        <li>Project End Date:      May 28, 2002</li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Notification Component';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
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

