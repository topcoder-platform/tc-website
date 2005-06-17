<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/dev/public_dev_right.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <title>TopCoder | Development</title>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
                <xsl:call-template name="Top">
                <xsl:with-param name="level1">development</xsl:with-param>
                </xsl:call-template>

<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
  <TR valign="top">
    <!-- Left Column Begins -->
    <TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">development</xsl:with-param>
  <xsl:with-param name="title">&#160;Overview</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
  <TR>
    <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD class="bodyText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                                    <FORM method="POST" name="frmInquire" ACTION="/">
                                        <INPUT VALUE="development" NAME="t" TYPE="hidden"/><INPUT VALUE="inquire" NAME="c" TYPE="hidden"/><INPUT VALUE="" NAME="Project" TYPE="hidden"/><INPUT VALUE="" NAME="To" TYPE="hidden"/>
                                    </FORM>
                                    <b>TopCoder High School</b>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='TopCoder High School';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" class="bodyText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>
<P>
<B>Purpose</B>
</P>

<P>
TopCoder plans on providing High School based competitions and providing those results via a new website that will be geared towards sponsors and students.  The TopCoder High School project is the first step in implementing a new High School Website and Competition Arena for competition.
</P>

<P>
<B>Overview</B>
</P>

<P>
The project will consist of five phases, which are: (i) TopCoder Environment Training, (ii) Development, (iii) Quality Assurance Test, (iv) Application Test, and (v) Production Deployment. 
</P>

<P>
<B>Staffing</B>
</P>
 
<P>
The development team will consist of 3 rated TopCoder Members. <BR/><BR/>
Two Developers<BR/>
One Quality Assurance Developer<BR/>
</P>


<P>
<B>Developers</B><BR/>
Developers will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager. Each Developer's responsibility will begin on the Project Start Date and extend through to Production Deployment. The majority of the workload will occur between the Project Start Date and the Application Test Phase. Continued support and application modifications may be required through Production Deployment. 
</P>

<P>
<B>QA Developer</B><BR/>
The QA Developer will be responsible for finalizing the system architecture and design, developing written test cases for the QA and Application Test phases, developing the test cases using J-Unit and HTTP-Unit, executing all tests and providing documentation outlining the test cases and their results. 
</P>


<P>
<B>Functional Overview</B>
</P>

<P>
The following section describes the required tasks. 
<UL>
    <LI> Login</LI>
      <UL>
        <LI> Implement a new authentication scheme using a TopCoder Software security component.</LI>
      </UL>
   <LI> Statistics</LI>
      <UL>         
        <LI> All of the topcoder.com statistics functionality will be ported over to the new TopCoder High School website.</LI>
        <LI> Statistics will be enhanced to provide high school information. </LI>
      </UL>
   <LI> Registration</LI>
      <UL>
         <LI> Implement a new registration path for coaches.</LI>
            <UL>
              <LI> Registration will be based on an approved High School list</LI>
            </UL>
         <LI> Implement a new registration path for students.</LI>      
            <UL>
              <LI> Student's registration will be based on a coach's registration.</LI>
            </UL>      
      </UL>
<!--    </UL>
<LI> JSP Conversion</LI>
   <UL>
     <LI> All of the new TopCoder High School website will be rendered by JSP</LI>
     <LI> Existing static XSL topcoder.com pages will be converted to JSP and implemented on the High School Website.  Pages to convert are</LI>
       <UL>
         <LI> Public Home Page</LI>
         <LI> Member (student/coach) Home Page</LI>
         <LI> All FAQ</LI>       
         <LI> About Us</LI> 
         <LI> Press Room</LI>        
         <LI> Contacts</LI> 
         <LI> Calendar</LI>                       
       </UL>
   </UL> -->
    <LI> New Areas</LI>
   <UL>
     <LI> Member Tour</LI>
       <UL>
         <LI> A section on the website that new members will use to get familiar with the TopCoder High School website and arena</LI>
       </UL>     
     <LI> Resources</LI>
       <UL>
         <LI>A page devoted to providing links and resources for new coders to learn Java, C++ and C#</LI>
       </UL>     
   </UL>
</UL>  
</P>

<P>
<B>Phase 1: TopCoder Environment Training - Complete November 28, 2002</B>
</P>

<P>
The purpose of the Application definition and understanding phase is to finalize the system design and test cases, to get acclimated to the development environment and to outline deliverable dates.  
</P>

<P>
<B>Software Architecture Documents</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Dataflow diagrams</LI> 
    <LI> Database Schema</LI>  
    <LI> GUI requirements: HTML page design, required data elements and process flow</LI> 
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: Product Manager</LI> 
</UL>

<P>
<B>Development Environment Configuration</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Connect and download code from CVS</LI> 
    <LI> Connect to Database</LI>  
    <LI> Connect to development servers and configure development accounts</LI>
    <LI> Build Code Base</LI>  
    <LI> Review TopCoder Software components to be used</LI>    
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: Developers</LI> 
</UL>

<P>
<B>Test case design and functional test plan</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Definition of what each test case evaluates and how it is executed. Examples include:</LI>
      <UL>
        <LI>Run unit test harness (i.e. JUnit, HttpUnit)</LI> 
        <LI>Define GUI click path</LI>      
     </UL>     
    <LI> Start on main.jsp, click "Login", etc</LI>      
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: QA Developer</LI> 
</UL>


<P>
<B>Phase 2: Development - Complete December 30, 2002</B>
</P>

<P>
The Development phase begins when there is a finalized design document. During the Development phase, the Developers should be focused on implementing the application components according to the design document. Also during this phase, the QA Developer should be creating the automated and manual test cases as defined in the design phase. All source code should be checked into CVS on a daily basis as changes are made. The completion of this phase is marked by the end of development, meaning all source code required for the application is functionally complete and has been checked into CVS. In addition, all automated and manual test cases are written and ready for execution. 
</P>

<P>
<B>Development of the application</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> During development, resolve any design issues with the project team</LI> 
    <LI> Check source code into CVS on a daily basis.</LI>  
    <LI> Upon completion of the Development phase, a functionally working application must exist in CVS and in the shared development environment.</LI>
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: Developers</LI> 
</UL>

<P>
<B>Development of the test cases</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Develop automated and manual test cases.</LI> 
    <LI> Implement the examples as outlined in the specifications document.</LI>  
    <LI> Check source code into CVS on a daily basis.</LI>
    <LI> Upon completion of the Development phase, all test cases must exist in CVS.</LI>    
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: QA Developer</LI> 
</UL>


<P>
<B>Documentation</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Finalize deployment documentation for the application. Summarize technologies used and how to implement the application. Be sure to include package dependencies and required entries to the CLASSPATH. </LI> 
    <LI> A general overview of how to implement the future enhancements as listed in the design specs must also be addressed.</LI>      
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: Developers</LI> 
</UL>

<P>
<B>Deployment to QA environment</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Build the Application</LI> 
    <LI> Deploy the application in QA</LI>      
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: Developers</LI> 
</UL>

<P>
<B>Phase 3: Quality Assurance Test - Complete January 14, 2003</B>
</P>

<P>
All application source code undergoes testing. All code is reviewed to determine correct interpretation of the design, proper commenting and adherence to coding standards. It is expected that this will be an iterative phase where bug fixes and enhancements are added and regression tested. The result of this phase is a fully functional application or component assembly approved by all members of the development team. 
</P>

<P>
<B>Testing</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Execute Unit tests in selected test harness</LI> 
    <LI> Execute manual tests</LI>
    <LI> Test required component examples</LI>
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: QA Developer</LI> 
</UL>

<P>
<B>Initial Source code review</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Validate design is implemented correctly</LI> 
    <LI> Check code for proper commenting and adherence to coding standards.</LI>
    <LI> A report of the QA Developer's findings must be posted to the newsgroup for the developers and product manager to review.</LI>
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: QA Developer</LI> 
</UL>

<P>
<B>Subsequent Development</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Provide ongoing support and fixes for any errors found during testing</LI>
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: Developers</LI> 
</UL>
 
<P>
<B>Application sign off</B> 
</P>

<UL>
    <LI> Primary: QA Developer</LI>
</UL>

<P>
<B>Phase 4: Application Test - Complete January 15, 2003</B>
</P>

<P>
This phase requires the submission of required documentation, source code, test cases, examples and supporting materials. QA Test will retest the application components from a fresh build and in a new installation. No functional errors or design flaws should pass through to this phase. Should any subsequent development be necessary, the project will go back to the Quality Assurance Test phase until the problems have been resolved. TopCoder's internal QA team will evaluate the application components and the test cases. At this time the code may also undergo user acceptance testing. 
</P>

<P>
<B>Final Source Code Review</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Validate design is implemented correctly</LI> 
    <LI> Check code for proper commenting and adherence to coding standards.</LI>
    <LI> A report of the QA Developer's findings must be posted to the newsgroup for the developers and product manager to review.</LI>
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: QA Developer</LI> 
</UL>

<P>
<B>Testing</B> 
</P>

<I>Requirements</I>
<UL>
    <LI> Execute Unit tests in selected test harness</LI> 
    <LI> Execute manual tests </LI>
    <LI> Test required component examples</LI>
</UL>

<I>Accountability</I> 
<UL>
    <LI> Primary: QA Developer</LI> 
</UL>

<B>Application sign off</B> 
<UL>
    <LI> Primary: Product Manager</LI> 
</UL>


<P>
<B>Phase 5: Production Deployment - Complete January 17, 2003</B>
</P>

<P>
The application components go through final approval from the product manager. Once approved the application is packaged and deployed to the TC Code base. 
</P>

<B>Application sign off</B> 
<UL>
    <LI> Primary: Product Manager</LI> 
</UL>

<P>
NOTE: In the event that the project plan is delayed in any way, prompt explanation must be reported to the Product Manager. TopCoder is not responsible for incorrect interpretation of the project scope or deliverables as they are listed in this specification document. 
</P>

<P>
<B>Payment</B>
</P>

<P>
TopCoder will compensate all team members for their work on the project. The payment will be distributed in five installments: (i) upon the successful completion of a certain milestone as set forth in the Development Agreement between developer and TopCoder, (ii) upon the successful completion of a certain other milestone as set forth in the Development Agreement between developer and TopCoder, (iii) upon the successful completion of the Development Phase, (iv) upon the successful completion of the Quality Assurance Test Phase, and (v) upon successful Production Deployment*. 
</P>


<P>
<B>Developers</B><BR/>
Each developer will be paid a total of $2,800 in the following installments as described above:<BR/><BR/>
(i) $250<BR/>
(ii) $450<BR/>
(iii) $450<BR/>
(iv) $450<BR/>
(v) $1,200<BR/>
</P>

<P>
<B>QA Developer</B><BR/>
The QA Developer will be paid a total of $1,200 in the following installments as described above:<BR/><BR/>
(i) $120<BR/>
(ii) $180<BR/>
(iii) $180<BR/>
(iv) $180<BR/>
(v) $540<BR/>
</P>

<P>
*Successful Production Deployment is defined as follows:  
<UL>
    <LI> All tasks assigned by the product manager have been completed.</LI>
    <LI> The deliverables are functioning properly and integrated within the other project software deliverables.</LI>
    <LI> The product manager has signed off on all delivered application components.</LI>
    <LI> Project/task completion is not defined by any dates listed above. The dates are to be used as guidelines and may change throughout the project. </LI> 
    <LI> Final payment is conditional on the fully functional application as defined in the requirements and by the product manager.</LI>
</UL>
</P>

<P>
<B>Eligibility</B>
</P>

<P>
You must be a rated TopCoder member, meeting all of the membership requirements and fit into one of the following categories: 
<UL>
    <LI> A US Citizen</LI>
    <LI> A Lawful Permanent Resident of the US (i.e., a Green Card holder) </LI>
    <LI> Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</LI>
    <LI> A Non US Citizen working in their country of residence. </LI>

</UL>
</P>

<P>
<B>Time Line</B>
</P>

<P>
The project will begin on November 25, 2002. There will be a kick-off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The project is scheduled to be complete by January 17th. 
</P>

<P>
<B>Developers:</B><BR/>
Project Start Date: November 25, 2002<BR/>
Project End Date: January 17, 2003<BR/>
</P>

<P>
<B>QA Developer:</B><BR/>
Project Start Date: November 25, 2002<BR/>
Project End Date:  January 17, 2003<BR/>
</P>

                                    <a href="Javascript:document.frmInquire.Project.value='TopCoder High School';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" class="bodyText"><b>Click here to inquire &gt;&gt;</b></a>
          <P><br/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
                <tr><td height="5" colspan="7"><img src="/i/clear.gif" alt="" height="5" border="0" /></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td width="14"><img src="/i/table_mid_left2x.gif" alt="" width="14" height="8" border="0" /></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>    
    
                <tr valign="top">
                    <td background="" bgcolor="#FFFFFF" width="10" align="right"><img src="/i/clear.gif" alt="" width="10" height="8" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="14"><img src="/i/table_btm_left2.gif" alt="" width="14" height="8" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="1" border="0" /></td>
                    <td background="" bgcolor="#FFFFFF" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="6"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
    <TD WIDTH="180" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_dev_right"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

