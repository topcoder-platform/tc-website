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
                                    <b>Teams Project<br/></b>
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <b>Preface</b>
                                    <BR/>
                                    <BR/>            
The team project entails putting together all of the pieces to make the TopCoder teams-based Web Services competitions a reality.  The Teams project will be a very large project with several types of positions available to interested members.  
                                    <BR/>
                                    <BR/>
                                    <b>Overview</b>
                                    <BR/>
                                    <BR/>            
There will be a total of 19 people assigned to the project with positions available for development, architects and quality assurance.  Each development assignment will undergo 4 phases.  Phase 1 is getting up to speed on the project.  Reading through requirements, documentation and providing any insight as to what the over all project will entail.  The first phase will also be used for developers to get acclimated to the development servers and source code control environments.  Phase 2 is the design phase.  In the design phase the team as a whole will discuss the over all project goals and objectives and come up with the different designs for each specific component.  Phase 3 is the development phase.  This phase is where all of the development will take place.  The final phase is the quality assurance and bug fixes phase.
                                    <BR/>
                                    <BR/>
TopCoder strongly feels that the developers have a very big role when it comes to coming up with requirements for a development project.  As a member of this team you are expected to contribute to the design and implementation of various components even if you will not be working on the directly.  TopCoder also mandates that developers provide feedback and give ideas as to how the system should run from an operations standpoint.  Keep in mind you will ultimately be the end user of this system.
                                    <BR/>
                                    <BR/>
                                    <b>Staffing</b>
                                    <BR/>
                                    <BR/>            
The component team will consist of nineteen rated TopCoder Members. 
                                    <ul>
                                      <li>Three Architects</li>
                                      <li>Eleven Developers</li>
                                      <li>Five QA Developers</li>
                                    </ul>
                                    <BR/>
                                    <BR/>
                                    <b>Architect</b>
                                    <BR/>
                                    <BR/>            
The architect will be responsible for the design of software and test cases that meet all requirements as defined in the requirements documentation and as described by the product manager. The architect will design the solution such that component reuse is maximized. The architect will be responsible for testing the functionality of the component, reviewing the deliverables (source code, documentation, schema, etc.) and giving final approval to the Product Manager that the component satisfies the requirements and is implemented correctly. 
                                    <BR/>
                                    <BR/>
                                    <b>Developer</b>
                                    <BR/>
                                    <BR/>            
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager. The developer's responsibility will begin on the project start date and extend through to Production Deployment. The majority of the workload will occur between the project Start Date and completion of Beta Testing. Continued support and component modifications may be required through deployment. 
                                    <BR/>
                                    <BR/>
                                    <b>QA Developer</b>
                                    <BR/>
                                    <BR/>            
The QA Developer is responsible for testing the completed component. Tests should involve both normal and extreme scenarios to simulate production usage. The developer's responsibility will begin on the project Start Date and extend through to Production Deployment. The majority of the workload will occur during Beta and QA testing. In addition to implementing component testing, it is also the QA Developer's responsibility to stay abreast of component design and progress. In the event the lead Developer cannot complete the project, TopCoder fully expects the QA developer to have sufficient knowledge of the component so as to continue and complete development.
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <b>Functional Overview</b>
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <b>Draft Application Components</b>
                                    <BR/>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Draft Application';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Draft Application Position &gt;&gt;</b></a>-->
                                    <BR/>
On the day of the draft TopCoder members will be using the components developed by the draft team to choose their team members.  The draft components will be composed of a newly designed applet and server.  The Draft team will be composed of two developers and one architect.  One developer will work on the client side and the other on the server side development.  
                                    <ul>
                                        <li>
                                            <b>Development Tasks</b>
                                            <BR/>
                                            <ul>
                                                <li>
                                                    <b>Server Side</b>
                                                    <ul>
                                                      <li>
Implement NBIO socket server
                                                      </li>
                                                      <li>
Implement a new message protocol
                                                      </li>
                                                      <li>
Implement draft rules
                                                      </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <b>Client Side</b>
                                                    <ul>
                                                      <li>
Create a new applet that supports the team draft process.
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                     </ul>
                                     <ul>
                                        <li>
                                            <b>Payment</b>
                                            <ul>
                                                <li>
                                                    <b>Architect will get paid a total of $2,450.00</b>
                                                    <ul>
                                                      <li>
$245.00 at the start of the project 
                                                      </li>
                                                      <li>
$500.00 on May 24th
                                                      </li>
                                                      <li>
$725.00 on June 21st
                                                      </li>
                                                      <li>
$980.00 at the completion of the project*
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <b>Server Side Developer will get paid a total of $3,900.00</b>
                                                    <ul>
                                                      <li>
$400.00 at the start of the project    
                                                      </li>
                                                      <li>
$1000.00 on May 24th
                                                      </li>
                                                      <li>
$1000.00 on June 21st
                                                      </li>
                                                      <li>
$1500.00 at the completion of the project*
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <b>Client Side Developer will get paid a total of $4,200.00</b>
                                                    <ul>
                                                      <li>
$420.00 at the start of the project    
                                                      </li>
                                                      <li>
$1050.00 on May 24th
                                                      </li>
                                                      <li>
$1050.00 on June 21st
                                                      </li>
                                                      <li>
$1680.00 at the completion of the project*
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>

                                        </li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Draft Application';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Draft Application Position &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>

                                    <b>Member Problem Services and Quality Assurance System (MPSQAS)</b>
                                    <BR/>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams MPSQAS';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams MPSQAS Position &gt;&gt;</b></a>-->
                                    <BR/>
MPSQAS is the system that current problem coordinators, writers and testers use in order to provide problems in the SRMs.  MPSQAS needs modifications in order to support team-based competitions as well as provide some must needed enhancements.    There will be two developers and one architect on the MPSQAS team.
                                    <ul>
                                        <li>
                                            <b>Development Tasks</b>
                                            <BR/>
                                            <ul>
                                                <li>
                                                    <b>Server Side</b>
                                                    <ul>
                                                      <li>
Convert current socket manager to NBIO implementation
                                                      </li>
                                                      <li>
Convert current requests and responses to new message protocol.
                                                      </li>
                                                      <li>
Refractor MPSQAS EJB
                                                      </li>
                                                      <li>
New enhancements
                                                      </li>
                                                      <li>
Provide support for Web Services
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
                                                    <b>Client Side</b>
                                                    <ul>
                                                      <li>
New Enhancements
                                                      </li>
                                                      <li>
Provide support for Web Services
                                                      </li>
                                                      <li>
Convert client to new message protocol
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>

                                        </li>
                                     </ul>
                                     <ul>
                                        <li>
                                            <b>Payment</b>
                                            <ul>
                                                <li>
<b>Architect will get paid a total of $2,450.00</b>
                                                    <ul>
                                                      <li>
$245.00 at the start of the project 
                                                      </li>
                                                      <li>
$500.00 on May 24th
                                                      </li>
                                                      <li>
$725.00 on June 21st
                                                      </li>
                                                      <li>
$980.00 at the completion of the project*
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
<b>Server Side Developer will get paid a total of $3,900.00</b>
                                                    <ul>
                                                      <li>
$390.00 at the start of the project 
                                                      </li>
                                                      <li>
$975.00 on May 24th 
                                                      </li>
                                                      <li>
$975.00 on June 21st                                  
                                                      </li>
                                                      <li>
$1560.00 at the completion of the project*             
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <ul>
                                                <li>
<b>Client Side Developer will get paid a total of $4,200.00</b>
                                                    <ul>
                                                      <li>
$420.00 at the start of the project 
                                                      </li>
                                                      <li>
$1050.00 on May 24th 
                                                      </li>
                                                      <li>
$1050.00 on June 21st                                  
                                                      </li>
                                                      <li>
$1680.00 at the completion of the project*             
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams MPSQAS';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams MPSQAS Position &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>

                                    <b>Core Competition Engine</b>
                                    <BR/>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Core Competition Engine';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Core Competition Engine Position &gt;&gt;</b></a>-->
                                    <BR/>
The Core Competition engine is exactly what it sounds like.  It is the core system that handles all of the socket management and business logic behind Single Round Matches.  The existing core server will be enhanced to support teams-based competitions.  Part of the development team will also be responsible for developing a new Rules Engine and have the existing Competition Engine interface with it.   All of the rules will be defined in a relational database; the competition server will be able to dynamically load the rules upon request.  The architect for this component will also be responsible for the Arena, Testers/Compilers, and the Web Services Application servers.  There will be a total of four developers and one architect working on the Core Engine.
                                    <ul>
                                        <li>
                                            <b>Development Tasks</b>
                                            <BR/>
                                            <ul>
                                                <li>
                                                    <b>Core System</b>
                                                    <ul>
                                                      <li>
Develop new requests
                                                      </li>
                                                      <li>
Make changes to existing processor to support teams
                                                      </li>
                                                      <li>
Make changes to core logic to interface with rules engine
                                                      </li>
                                                      <li>
Refractor current Database interface EJB to support new dynamic SQL EJB.
                                                      </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <b>Rules Engine</b>
                                                    <ul>
                                                      <li>
Develop Rules Engine
                                                      </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    <b>Rules Engine GUI</b>
                                                    <ul>
                                                      <li>
Develop graphical user interface to Rules Engine
                                                      </li>
                                                    </ul>
                                                </li>

                                            </ul>
                                        </li>
                                        <li>
                                            <b>Payment</b>
                                            <ul>
                                                <li>
<b>Architect will get paid a total of $7,000.00</b>
                                                    <ul>
                                                      <li>
$700.00 at the start of the project 
                                                      </li>
                                                      <li>
$1750.00 on May 24th
                                                      </li>
                                                      <li>
$1750.00 on June 21st
                                                      </li>
                                                      <li>
$2800.00 at the completion of the project*
                                                      </li>
                                                    </ul>
                                                </li>
                                                <li>
<b>Core System Developer<br/>
There will be a total of two developers working on the core system.<br/>
Each developer will get paid a total of $4,200.00</b>
                                                    <ul>
                                                      <li>
$420.00 at the start of the project 
                                                      </li>
                                                      <li>
$1050.00 on May 24th
                                                      </li>
                                                      <li>
$1050.00 on June 21st
                                                      </li>
                                                      <li>
$1,680.00 at the completion of the project*
                                                      </li>
                                                    </ul>
                                                </li>                                                
                                                <li>
<b>Rules Engine Developer will get paid a total of $4,200.00</b>

                                                    <ul>
                                                      <li>
$420.00 at the start of the project 
                                                      </li>
                                                      <li>
$1050.00 on May 24th
                                                      </li>
                                                      <li>
$1055.00 on June 21st
                                                      </li>
                                                      <li>
$1,680.00 at the completion of the project*
                                                      </li>
                                                    </ul>
                                                </li>
                                                <li>
<b>Rules Engine GUI Developer will get paid a total of $3,900.00</b>
                                                    <ul>
                                                      <li>
$390.00 at the start of the project 
                                                      </li>
                                                      <li>
$975.00 on May 24th
                                                      </li>
                                                      <li>
$975.00 on June 21st
                                                      </li>
                                                      <li>
$1,560.00 at the completion of the project*
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Core Competition Engine';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Core Competition Engine Position &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>

                                    <b>Web Services Application Servers</b>
                                    <BR/>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Web Services';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Web Services Position &gt;&gt;</b></a>-->
                                    <BR/>
One developer will handle the Web Services implementation.  The developer will be responsible to configuring the Web Services application servers and implementing the structure for other Web Services clients.  The developer will also enhance all existing TopCoder tester and compiler services by adding support for Web Services.
                                    <ul>
                                        <li>
                                            <b>Development Tasks</b>
                                            <BR/>
                                            <ul>
                                                <li>
Configure Application servers
                                                </li>
                                                <li>
Development Web Services interfaces
                                                </li>
                                                <li>
Enhance existing compilers and testers.
                                                </li>
                                            </ul>
                                        </li>
                                     </ul>
                                     <ul>
                                        <li>
                                            <b>Payment</b>
                                            <ul>
                                              <li>
                                                <b>Developer will get paid a total of $4,200.00</b>
                                                <ul>
                                                    <li>
$420.00 at the start of the project 
                                                    </li>
                                                    <li>
$1050.00 on May 24th
                                                    </li>
                                                    <li>
$1050.00 on June 21st
                                                    </li>
                                                    <li>
$1,680.00 at the completion of the project*
                                                    </li>
                                                </ul>
                                              </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Web Services';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Web Services Position &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>

                                    <b>Testers and Compilers</b>
                                    <BR/>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Testers and Compilers';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Testers and Compilers Position &gt;&gt;</b></a>-->
                                    <BR/>
TopCoder currently has in place compiler and testers services that processes compile and test requests from the competition server.  There will be two developers on this team responsible for making the necessary changes to support Web Services and teams-based competitions.  Making changes to support teams-based competitions will be very important because submitted code will need to be tested at many different levels.  They will also modify the services to support MSPQAS compiles and tests.  Changes need to be made to the Java, C++ and C# services.
                                    <ul>
                                        <li>
                                            <b>Development Tasks</b>
                                            <BR/>
                                            <ul>
                                                <li>
Support for MPSQAS compiles and tests.
                                                </li>
                                                <li>
Support for Web Services
                                                </li>
                                                <li>
Support for team-based competitions
                                                </li>
                                            </ul>
                                        </li>
                                     </ul>
                                     <ul>
                                        <li>
                                            <b>Payment</b>
<ul>
  <li>
<b>Developer will get paid a total of $4,200.00</b>
                                            <ul>
                                                <li>
$420.00 at the start of the project 
                                                </li>
                                                <li>
$1050.00 on May 24th
                                                </li>
                                                <li>
$1050.00 on June 21st
                                                </li>
                                                <li>
$1,680.00 at the completion of the project*
                                                </li>
                                            </ul>
  </li>
</ul>
                                        </li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Testers and Compilers';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Testers and Compilers Position &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>

                                    <b>Competition Applet (Arena)</b>
                                    <BR/>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Competition Arena';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Competition Arena Position &gt;&gt;</b></a>-->
                                    <BR/>
The competition applet more commonly known as the arena needs to undergo heavy modifications to support teams-based competitions.  The arena needs to support inter-team communication, new problem statement types, and all other requirements that come from the design of teams-based competitions.
                                    <ul>
                                        <li>
                                            <b>Development Tasks</b>
                                            <BR/>
                                            <ul>
                                                <li>
Implement graphical user interface changes
                                                </li>
                                                <li>
New teams rules.
                                                </li>
                                            </ul>
                                        </li>
                                     </ul>
                                     <ul>
                                        <li>
                                            <b>Payment</b>
<ul>
  <li>
<b>Competition Applet Developer will get paid a total of $3,450.00</b>
                                            <ul>
                                                <li>
$345.00 at the start of the project 
                                                </li>
                                                <li>
$850.00 on May 24th
                                                </li>
                                                <li>
$875.00 on June 21st
                                                </li>
                                                <li>
$1,380.00 at the completion of the project*
                                                </li>
                                            </ul>
  </li>
</ul>
                                        </li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Competition Arena';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Teams Competition Arena Position &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>

                                    <b>Quality Assurance</b>
                                    <BR/>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Quality Assurance';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Quality Assurance Position &gt;&gt;</b></a>-->
                                    <BR/>
The quality assurance team will have the job of validating all of the development work.  They will responsible for producing test cases and notifying the development team of all issues surrounding their respective development.  There will be a total of 5 members assigned the role of Quality Assurance.  Each QA person will be assigned a specific system: MPSQAS, Competition Server, Web Services Application Server, Arena Applet, Draft Components.
                                     <ul>
                                        <li>
                                            <b>Payment</b>
<ul>
  <li>
<b>MPSQAS QA Developer will get paid a total of $1,350.00</b>
                                            <ul>
                                                <li>
$135.00 at the start of the project 
                                                </li>
                                                <li>
$300.00 on May 27th
                                                </li>
                                                <li>
$375.00 on July 2nd
                                                </li>
                                                <li>
$540.00 at the completion of the project*
                                                </li>
                                            </ul>
  </li>
  <li>
<b>Core System QA Developer will get paid a total of $1,350.00</b>
                                            <ul>
                                                <li>
$135.00 at the start of the project 
                                                </li>
                                                <li>
$300.00 on May 27th
                                                </li>
                                                <li>
$375.00 on July 2nd
                                                </li>
                                                <li>
$540.00 at the completion of the project*
                                                </li>
                                            </ul>
  </li>
  <li>
<b>Web Services QA Developer will get paid a total of $1,350.00</b>
                                            <ul>
                                                <li>
$135.00 at the start of the project 
                                                </li>
                                                <li>
$300.00 on May 27th
                                                </li>
                                                <li>
$375.00 on July 2nd
                                                </li>
                                                <li>
$540.00 at the completion of the project*
                                                </li>
                                            </ul>
  </li>
  <li>
<b>Competition Applet QA Developer will get paid a total of $1,350.00</b>
                                            <ul>
                                                <li>
$135.00 at the start of the project 
                                                </li>
                                                <li>
$300.00 on May 27th
                                                </li>
                                                <li>
$375.00 on July 2nd
                                                </li>
                                                <li>
$540.00 at the completion of the project**
                                                </li>
                                            </ul>
  </li>
  <li>
<b>Draft Component QA Developer will get paid a total of $1,350.00</b>
                                            <ul>
                                                <li>
$135.00 at the start of the project 
                                                </li>
                                                <li>
$300.00 on May 27th
                                                </li>
                                                <li>
$375.00 on July 2nd
                                                </li>
                                                <li>
$540.00 at the completion of the project*
                                                </li>
                                            </ul>
  </li>
</ul>
                                        </li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Teams Quality Assurance';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire about a Quality Assurance Position &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <BR/>
                                    <BR/>






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
The project will begin on the 7th of May. There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues. The project is scheduled to be complete by July 12th. 
                                    <ul>
                                        <li>Project Start Date:    May 7, 2002</li>
                                        <li>Project End Date:      July 12, 2002</li>
                                    </ul>


*Completion of the project is defined as follows:
                                    <ul>
                                        <li>All tasks assigned by the project manager have been completed. </li>
                                        <li>The deliverables are functioning properly and integrated within the other project software deliverables. </li>
                                        <li>The project manager has signed off on all delivered components. </li>
                                    </ul>





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

