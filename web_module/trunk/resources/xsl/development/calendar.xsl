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
                                        <span class="statTextBig">Calendar Component Project</span>
                                    </font>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Calendar';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <b>Overview</b>
                                    <BR/>
                                    <BR/>            
The Calendar component will provide a graphical user interface for navigating a monthly calendar and selecting a date.  Calendar configuration will enable administrators to mark days of the week and specific dates as blocked from selection and/or as days of interest, such as holidays.  The administrator will also have the ability to customize the look of the calendar.
                                    <BR/>
                                    <BR/>
                                    <b>Functional Overview</b>
                                    <BR/>
                                    <BR/>
This component will dynamically build a calendar interface that looks much like a standard monthly calendar.  The end-user will have the ability to navigate across months and years to select a specific date.  The component must reference a customizable data source to manage holidays and limit date selection.  The data source is not yet designed; some potential solutions include a relational database or an XML document.  Finally, an HTML interface must be created to administer this data.
                                    <BR/>
                                    <BR/>
The graphical interface for this implementation for the Calendar component will be an HTML "pop-up" window.
                                    <BR/>
                                    <BR/>
                                            <b>Staffing</b>
                                            <BR/>
The component team will consist of 3 rated TopCoder Members.
                                            <ul>
                                                <li>
                                                    <b>Architect</b><br/>
The architect will be responsible for the design of software and test cases that meet all requirements as defined in the requirements documentation and as described by the product manager.  The architect will design the solution such that component reuse is maximized.  The architect will be responsible for testing the functionality of the component, reviewing the deliverables (source code, documentation, schema, etc.) and giving final approval to the Product Manager that the component satisfies the requirements and is implemented correctly.  
                                                </li>
                                                <li>
                                                    <b>Developer</b><br/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager.  The developer's responsibility will begin on the project start date and extend through to Production Deployment.  The majority of the workload will occur between the project Start Date and completion of Beta Testing.  Continued support and component modifications may be required through deployment.
                                                </li>
                                                <li>
                                                    <b>QA Developer</b><br/>
The QA Developer is responsible for testing the completed component.  Tests should involve both normal and extreme scenarios to simulate production usage.  The developer's responsibility will begin on the project Start Date and extend through to Production Deployment.  The majority of the workload will occur during Beta and QA testing.  In addition to implementing component testing, it is also the QA Developer's responsibility to stay abreast of component design and progress.  In the event the lead Developer cannot complete the project, TopCoder Software fully expects the QA developer to have sufficient knowledge of the component so as to continue and complete development.  
                                                </li>
                                            </ul>
                                            <b>Technology</b>
                                            <BR/>
                                            <ul>
                                              <li>
Java 1.3
                                              </li>
                                              <li>
XML, XSL/XSLT
                                              </li>
                                              <li>
HTTP
                                              </li>
                                              <li>
Javascript
                                              </li>
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
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" >
  <TR>
    <TD class="statTextBig" colspan="2">Architect</TD>
  </TR>
  <TR>
    <TD class="statTextBig">Royalty Percentage</TD>
    <TD class="statTextBig" align="left">19.35%</TD>
  </TR>
  <TR>
    <TD class="statTextBig">Total Payment</TD>
    <TD class="statTextBig" align="left">$300.00</TD>
  </TR>
  <TR>
    <TD class="statText">First Payment</TD>
    <TD class="statText" align="left">$30.00</TD>
  </TR>
  <TR>
    <TD class="statText">Second Payment</TD>
    <TD class="statText" align="left">$120.00</TD>
  </TR>
  <TR>
    <TD class="statText">Final Payment</TD>
    <TD class="statText" align="left">$150.00</TD>
  </TR>
  <TR><TD colspan="2"><BR/></TD></TR>
  <TR>
    <TD class="statTextBig" colspan="2">Developer</TD>
  </TR>
  <TR>
    <TD class="statTextBig">Royalty Percentage</TD>
    <TD class="statTextBig" align="left">64.52%</TD>
  </TR>
  <TR>
    <TD class="statTextBig">Total Payment</TD>
    <TD class="statTextBig" align="left">$1000.00</TD>
  </TR>
  <TR>
    <TD class="statText">First Payment</TD>
    <TD class="statText" align="left">$100.00</TD>
  </TR>
  <TR>
    <TD class="statText">Second Payment</TD>
    <TD class="statText" align="left">$400.00</TD>
  </TR>
  <TR>
    <TD class="statText">Final Payment</TD>
    <TD class="statText" align="left">$500.00</TD>
  </TR>
  <TR><TD colspan="2"><BR/></TD></TR>
  <TR>
    <TD class="statTextBig" colspan="2">Quality Assurance</TD>
  </TR>
  <TR>
    <TD class="statTextBig">Royalty Percentage</TD>
    <TD class="statTextBig" align="left">16.13%</TD>
  </TR>
  <TR>
    <TD class="statTextBig">Total Payment</TD>
    <TD class="statTextBig" align="left">$250.00</TD>
  </TR>
  <TR>
    <TD class="statText">First Payment</TD>
    <TD class="statText" align="left">$25.00</TD>
  </TR>
  <TR>
    <TD class="statText">Second Payment</TD>
    <TD class="statText" align="left">$100.00</TD>
  </TR>
  <TR>
    <TD class="statText">Final Payment</TD>
    <TD class="statText" align="left">$125.00</TD>
  </TR>
  <TR><TD colspan="2"><BR/></TD></TR>

</TABLE>


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
                                        <li>a US Citizen</li>
                                        <li>a Lawful Permanent Resident of the US (i.e., a Green Card holder)</li>
                                        <li>currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
                                    </ol>
                                    <b>Time Line</b>
                                    <BR/>
                                    <BR/>            
There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The deadline entails integration of the developed components with one another, along with system testing.
                                    <ul>
                                        <li>Project Start Date:    April 16, 2002</li>
                                        <li>Project End Date:      April 30, 2002</li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Calendar';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
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

