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
        <TITLE>TopCoder :: Development</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#CCCCCC" valign="top">
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
                                    <b>Candidate Screening Tool</b>
                                    <BR/>
                                    <a href="Javascript:document.frmInquire.Project.value='Candidate Screening Tool';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
                                    <BR/>
<P>
<B>Purpose</B>
</P>

<P>
Companies have a need to qualify a technical candidate's development skills and abilities.  TopCoder will develop and promote the new Candidate Screening Tool that will allow designated company representatives (HR, senior developers, product managers, etc.) to test a developer's technical abilities.  The Screening Tool will be designed in such a way to provide objective real time technical statistical information to the reviewing company representative.
</P>

<P>
<B>Objective</B>
</P>

<P>
The objective is for TopCoder to build a Candidate Screening Tool that provides an easier and more accurate way for companies to hire technically competent employees.  Once candidates complete the TopCoder Screening process employers will have enough information to make educated decisions based upon the developer's performance.  The major benefit that the Screening Tool will provide to potential employers is the ability to compare the test results to normal SRM matches.  With this information the company representative will be able to identify how this candidate has performed based on SRM results
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
The development team will consist of 12 rated TopCoder Members. <BR/><BR/>
Nine Developers<BR/>
Three Quality Assurance Developers<BR/>
</P>


<P>
<B>Developers</B><BR/>
Developers will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager. Each Developer's responsibility will begin on the Project Start Date and extend through to Production Deployment. The majority of the workload will occur between the Project Start Date and the Application Test Phase. Continued support and application modifications may be required through Production Deployment. 
</P>

<P>
<B>QA Developers</B><BR/>
The QA Developers will be responsible for finalizing the system architecture and design, developing written test cases for the Quality Assurance and Application Test phases, developing the test cases using J-Unit and HTTP-Unit, executing all tests and providing documentation outlining the test cases and their results. 
</P>


<P>
<B>Functional Overview</B>
</P>

<P>
The following section describes the required tasks.  
<UL>
	<LI>Screening Applet</LI>
      <UL>
	    <LI>Develop a new TopCoder Screening Applet that will allow authorized users to Solve algorithmic problem sets. Features:</LI>
           <UL>
	          <LI>Login</LI>
	          <LI>Move to Coding Rooms</LI>
	          <LI>Open Assigned Problems</LI>
	          <LI>Write Code in Editor Window</LI>
	          <LI>Compile Code</LI>
	          <LI>Test Code</LI>
	          <LI>Submit Code</LI>
	          <LI>Available help manual</LI>
	          <LI>Ability to change preferences</LI>
	          <LI>Overall progress bar with associated status</LI>
	          <LI>Coding Timer</LI>
	       </UL> 
	    <LI>Apply newly developed Screening Tool images to the applet</LI>	       
	    <LI>Develop client socket connection for access to the screening server</LI>	       
	    <LI>Develop Applet listener to process responses from the server</LI>
	    <LI>Applet processor to handle all server and client requests/responses</LI>	    	       
      </UL>
   <LI>Screening Server</LI>
      <UL>    	 
	    <LI>Implement the TopCoder Non-Blocking IO Socket Listener server for the new screening server</LI>
	    <LI>Develop new Request/Response Protocol</LI>
	    <LI>Develop new Request and Response Handler Threads</LI>
	    <LI>Develop new Business Processors</LI>	    
	    <LI>Implement a services interface to existing compiling, testing, cache and EJB services</LI>
	    <LI>Integrate server with TopCoder Software components</LI>	    
	    <LI>The application server for all EJB and JMS related services will be JBoss</LI>
	    <LI>Implement JMS Queues for asynchronous processing</LI>
	    <LI>New Timer thread logic that allows every screening candidate to have their own instance of a timer</LI>
	    <LI>Implement Heartbeat thread to sync timers with client applets</LI>	    
	    <LI>Apply changes to existing administration application to support the new screening application</LI>
	    <LI>Develop new Enterprise Java Beans for all database transactions</LI>
      </UL>
   <LI>Screening Website</LI>
      <UL>
	     <LI>Account Set up</LI>
	        <UL>
	          <LI>Develop JSP pages with corresponding EJBs that allow authorized users to create logins for candidates that will go through the screening process</LI>
            </UL>
	     <LI>Screening Session Outline</LI>      
	        <UL>
	          <LI>Develop JSP pages with corresponding EJBs that allow authorized users to create session outlines.  Session outlines are like testing profiles.  This is where the user would be able to set up the tests for the candidates that will be taking the tests.  Functionality:</LI>
                 <UL>
	                <LI>Name of Outline</LI>
	                <LI>TopCoder Problem sets to be used</LI>
	                <LI>Choose single problems to be used</LI>
	                <LI>Specify the programming language to be used by the candidate</LI>
	                <LI>Ability to provide example problems</LI>	                
	             </UL>  
            </UL>      
	     <LI>Associate session outline with candidate accounts</LI>      
	        <UL>
	          <LI>Develop JSP pages with corresponding EJBs that allow authorized users to associate outlines with candidate accounts.  Functionality:</LI>
                 <UL>
	                <LI>Account that will be tested</LI>
	                <LI>Notes about the developer</LI>
	                <LI>Time for screening test session</LI>	                
	             </UL>  
            </UL> 
	     <LI>Reporting Test Results</LI>      
	        <UL>
	          <LI>All of the information from the candidates test session will be reported back to the screening administrator.  Reported Data will be:</LI>
                 <UL>
                    <P>
	                <LI><B>Header Summary Page</B></LI>
	                <LI>Grouped by outline (session group)</LI>
	                <LI>Username (email)</LI>
	                <LI>Status (completed, in progress, etc)</LI>
	                <LI>Total Time Spent - Online</LI>
	                <LI># of Problems Presented</LI>	                
	                <LI># of Problems Submitted</LI>
	                <LI># of Problems Correct</LI>
	                <LI>Link to detail information</LI>	                
	                <LI>Email link to send candidate the results</LI>
	                </P>
	                <P>
	                <LI><B>Detail Page</B></LI>
	                <LI>Time Online</LI>
	                <LI>SRM Set Problems</LI>	                
                        <UL>
	                       <LI>Name</LI>
	                       <LI>Language</LI>	                
	                       <LI>Points</LI>
	                       <LI>Status</LI>
	                       <LI># Tests Passed</LI>
	                       <LI># Tests Failed</LI>	                
	                       <LI>Time to submit</LI>
	                       <LI>Problem Detail Link</LI>	                       	                	                	                
	                   </UL>
	                <LI>How TC Members did on these SRM set problems</LI>	                
                        <UL>
	                       <LI>Name</LI>
	                       <LI>Division</LI>	                
	                       <LI>Level</LI>
	                       <LI># Coders</LI>
	                       <LI># Submissions</LI> 
	                       <LI>% Who Submitted</LI>
	                       <LI># Correct Submissions</LI>	                       
	                       <LI>% Correct Submissions</LI>
	                       <LI>Overall Correct %</LI>	                       
	                       <LI>Avg. time to submit</LI>
	                       <LI>Avg. points</LI>	                                            	                	                	                
	                   </UL> 	                
	                <LI>TC Problem Detail Page</LI>
                        <UL>
	                       <LI>System Tests tested against (arguments, expected, received)</LI>                                            	                	                	                
	                   </UL>
	                <LI>Code submitted</LI>	                   	                
	                <LI>Links to Top TopCoder Solutions</LI> 
	                </P>	                	                	                
	             </UL>  
            </UL>                 
      </UL>

</UL>  
</P>

<P>
<B>Phase 1: TopCoder Environment Training - Complete December 19, 2002</B>
</P>

<P>
The purpose of the TopCoder Environment Training phase is to finalize the system design and test cases, to get acclimated to the development environment and to outline deliverable dates.  
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
	<LI> Primary: QA Developers</LI> 
</UL>


<P>
<B>Phase 2: Development - Complete January 17, 2003</B>
</P>

<P>
The Development phase begins when there is a finalized design document. During the Development phase, the Developers should be focused on implementing the application components according to the design document. Also during this phase, the QA Developers should be creating the automated and manual test cases as defined in the design phase. All source code should be checked into CVS on a daily basis as changes are made. The completion of this phase is marked by the end of development, meaning all source code required for the application is functionally complete and has been checked into CVS. In addition, all automated and manual test cases are written and ready for execution. 
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
	<LI> Primary: QA Developers</LI> 
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
<B>Phase 3: Quality Assurance Test - Complete January 27, 2003</B>
</P>

<P>
All application component source code undergoes testing. All code is reviewed to determine correct interpretation of the design, proper commenting and adherence to coding standards. It is expected that this will be an iterative phase where bug fixes and enhancements are added and regression tested. The result of this phase is a fully functional application or component assembly approved by all members of the development team. 
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
	<LI> Primary: QA Developers</LI> 
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
	<LI> Primary: QA Developers</LI> 
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
	<LI> Primary: QA Developers</LI>
</UL>

<P>
<B>Phase 4: Application Test - Complete January 28, 2003</B>
</P>

<P>
This phase requires the submission of required documentation, source code, test cases, examples and supporting materials. The QA Developers will retest the application components from a fresh build and in a new installation. No functional errors or design flaws should pass through to this phase. Should any subsequent development be necessary, the project will go back to the Quality Assurance Test phase until the problems have been resolved. TopCoder's internal QA team will evaluate the application components and the test cases. At this time the code may also undergo user acceptance testing. 
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
	<LI> Primary: QA Developers</LI> 
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
	<LI> Primary: QA Developers</LI> 
</UL>

<B>Application sign off</B> 
<UL>
	<LI> Primary: Product Manager</LI> 
</UL>


<P>
<B>Phase 5: Production Deployment - Complete January 29, 2003</B>
</P>

<P>
The application components go through final approval from the product manager. Once approved the application is packaged and deployed to the TC Code base. 
</P>

<B>Application sign off</B> 
<UL>
	<LI> Primary: TopCoder Product Manager</LI> 
</UL>

<P>
NOTE: In the event that the project plan is delayed in any way, prompt explanation must be reported to the Product Manager. TopCoder is not responsible for incorrect interpretation of the project scope or deliverables as they are listed in this specification document. 
</P>

<P>
<B>Payment</B>
</P>

<P>
TopCoder will compensate all team members for their work on the project. The payments will be distributed in five installments: (i) upon the successful completion of a certain milestone as set forth in the Development Agreement between developer and TopCoder, (ii) upon the successful completion of a certain other milestone as set forth in the Development Agreement between developer and TopCoder, (iii) upon the successful completion of the Development Phase, (iv) upon the successful completion of the Quality Assurance Test Phase, and (v) upon successful Production Deployment*. 
</P>

<P>
*Successful Production Deployment is defined as follows:  
<UL>
	<LI> All tasks assigned by the product manager have been completed. </LI>
	<LI> The deliverables are functioning properly and integrated within the other project software deliverables. </LI>
	<LI> The product manager has signed off on all delivered application components. </LI>
	<LI> Project/task completion is not defined by any dates listed above. The dates are to be used as guidelines and may change throughout the project. </LI> 
</UL>
</P>

<P>
Final payment is conditional on the fully functional application as defined in the requirements and by the product manager.
</P>


<P>
<B>Screening Applet Developers (2)</B><BR/>
Each Screening Applet Developer will be paid a total of $2,400 in the following installments as described above:<BR/><BR/>
(i) $300<BR/>
(ii) $300<BR/>
(iii) $300<BR/>
(iv) $300<BR/>
(v) $1,200<BR/>
</P>

<P>
<B>Screening Server Developers (2)</B><BR/>
Each Screening Server Developer will be paid a total of $2,400 in the following installments as described above:<BR/><BR/>
(i) $300<BR/>
(ii) $300<BR/>
(iii) $300<BR/>
(iv) $300<BR/>
(v) $1,200<BR/>
</P>

<P>
<B>Administration Server Developer (1)</B><BR/>
The Administration Server Developer will be paid a total of $1,920 in the following installments as described above:<BR/><BR/>
(i) $230<BR/>
(ii) $230<BR/>
(iii) $230<BR/>
(iv) $230<BR/>
(v) $1,000<BR/>
</P>

<P>
<B>Screening Website Developers (4)</B><BR/>
Each Screening Website Developer will be paid a total of $2,160 in the following installments as described above:<BR/><BR/>
(i) $270<BR/>
(ii) $270<BR/>
(iii) $270<BR/>
(iv) $270<BR/>
(v) $1,080<BR/>
</P>

<P>
<B>QA Developer (3)</B><BR/>
Each QA Developer will be paid a total of $1,200 in the following installments as described above:<BR/><BR/>
(i) $150<BR/>
(ii) $150<BR/>
(iii) $150<BR/>
(iv) $150<BR/>
(v) $600<BR/>
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
The project will begin on December 17, 2002. There will be a kick-off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The project is scheduled to be complete by January 29, 2003. 
</P>

<P>
<B>Developers:</B><BR/>
Project Start Date: December 17, 2002<BR/>
Project End Date: January 29, 2003<BR/>
</P>

<P>
<B>QA Developer:</B><BR/>
Project Start Date: December 17, 2002<BR/>
Project End Date:  January 29, 2003<BR/>
</P>

                                    <a href="Javascript:document.frmInquire.Project.value='Candidate Screening Tool';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>
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
        <xsl:call-template name="public_dev_right"/>        
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

