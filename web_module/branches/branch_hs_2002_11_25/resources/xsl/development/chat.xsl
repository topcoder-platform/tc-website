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
                                    <b>Moderated Chat Session Project</b>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Moderated Chat Session';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <b>Overview</b>
                                    <BR/>
                                    <BR/>            
TopCoder wants the ability to provide moderated chat sessions through the arena. Members will be able to login to the arena and much like the current active contest menu they will be able to see a new menu labeled active moderated chat sessions. Under this new menu there will be a list of all future scheduled and currently active moderated chat sessions. 
                                    <BR/>
                                    <BR/>
                                    <b>Time Line</b>
                                    <BR/>
                                    <BR/>            
The project will begin on the 3rd of May.  There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues.
                                    <BR/>
                                    <BR/>
The Moderated Chat Sessions Project is scheduled for completion by May 17th.  The May 17th deadline entails integration of the developed components with one another, along with system testing.  The total time to deliver will be 2 weeks.
<ul>
  <li>
Project Start Date:  May 3rd, 2002
  </li>
  <li>
Project End Date:  May 17th, 2002
  </li>
</ul>
                                    <b>Development</b>
                                    <BR/>
                                    <BR/>
All of the development and system testing will happen on TopCoder designated servers.  Team members may develop locally, however, during pre-scheduled milestones they will need to deliver their code to the specified servers.  At the point of integration and system testing, all code must be on the TopCoder development servers.  The team members will have access to previously written software by the current TopCoder development staff as a source of reference, if needed.  TopCoder will supply any software tools that are required to facilitate the development process.
                                    <BR/>
                                    <BR/>
TopCoder strongly feels that the developers have a very big role when it comes to coming up with requirements for a development project. As a member of this team you are expected to contribute to the design and implementation of various components even if you will not be working on the directly. TopCoder also mandates that developers provide feedback and give ideas as to how the system should run from an operations standpoint. Keep in mind you will ultimately be the end user of this system. 
                                    <BR/>
                                    <BR/>
                                    <b>Staffing</b>
                                    <BR/>
                                    <BR/>
The component team will consist of two rated TopCoder Members. <br/>
<ul>
<li>
Two Developers 
</li>
</ul>
                                    <b>Developer</b>
                                    <BR/>
                                    <BR/>
The developer will be responsible for developing a solution that meets all requirements detailed in this specification and as specified by the product manager. The developer's responsibility will begin on the project start date and extend through to Production Deployment. The majority of the workload will occur between the project Start Date and completion of Beta Testing. Continued support and component modifications may be required through deployment. 
                                    <BR/>
                                    <BR/>
                                    <b>Provisions</b>
                                    <BR/>
                                    <BR/>
The TopCoder project manager will set project dates, milestones, goals, and deliverables prior to the project's start date.  Any member that is chosen to join the Moderated Chat Sessions Project will have to agree to the specified tasks and dates.  If at any point the TopCoder project manager feels that any team member is not accomplishing their task in a timely and acceptable manner they will be removed from the team and a new member will be assigned.  In order to join the Moderated Chat Sessions Project team all members will need to sign a contract agreeing to the specified terms.
                                    <BR/>
                                    <BR/>
                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>
TopCoder will compensate all team members for their work on the Moderated Chat Sessions Project.<br/>
Each development member will get paid a total of $600.00:
<ul>
  <li>
$60.00 at the start of the project
  </li>
  <li>
$540.00 at the completion of the project*
  </li>
</ul>
*Completion of the project is defined as follows:<br/>
- All tasks assigned by the project manager have been completed.<br/>
- The deliverables are functioning properly and integrated within the other project software deliverables.<br/>
- The project manager has signed off on all delivered components.<br/>

                                    <BR/>
                                    <BR/>
                                    <b>Project Details</b>
                                    <ul>
                                        <li>
                                            <b>Goal</b>
                                            <BR/>
Provide the ability to have moderated chat sessions in the arena.
                                        </li>
                                        <li>
                                            <b>Details</b>
                                            <BR/>
Two rated TopCoder Members.
                                            <ul>
                                                <li>
                                                    Front End
                                                    <ul>
                                                      <li>
New menu for the applet that says "Active Chat Sessions".  Under the menu we will have the active chat sessions or none if that is the case.
                                                      </li>
                                                      <li>
The new chat session room will look like the lobby.
                                                      </li>
                                                      <li>
Once in this room if you attempt to chat you will get a message that says, "No chatting ... in order to ask a question you must ..."
                                                      </li>
                                                      <li>
In order to ask questions you click on a button or type /moderator and then submit your question.
                                                      </li>
                                                      <li>
Make necessary changes to the arena to support new chat sessions
                                                      </li>
                                                      <li>
Make necessary changes to the admin monitor tool to support the approval of specific questions and send them to the speaker.
                                                      </li>
                                                      <li>
When the question gets sent to the monitor tool it should be in a table format with a time, handle, and question and maybe rating level.
                                                      </li>
                                                      <li>
Next to each question the will be a button that says "Send Question".
                                                      </li>
                                                    </ul>
                                                </li>
                                                <li>
                                                    Back End
                                                    <ul> 
                                                      <li>
Design a new set of database tables to store chat session info.
                                                      </li>
                                                      <li>
Retrieve the necessary data from the database.
                                                      </li>
                                                      <li>
Enhance existing request and response processors to support new moderated chat.
                                                      </li>
                                                      <li>
Create new requests and responses.
                                                      </li>
                                                      <li>
Once the moderated chat request gets processed it will be sent to the admin tool that we currently run for contests.
                                                      </li>
                                                      <li>
When the admin tool sends out the request for a question to be processed you will see in the new moderated lobby,  &quot;Moderator > When did x ... y ... &quot;
                                                      </li>
                                                    </ul>
                                                </li>
                                            </ul>
                                         </li>
                                    </ul>

                                    <b>Eligibility</b>
                                    <BR/>
                                    <BR/>            
You must be a rated TopCoder member, meeting all of the membership requirements and fit into one of the following categories:<BR/>
                                    <ol>
                                        <li>A US Citizen.</li>
                                        <li>A Lawful Permanent Resident of the US (i.e., a Green Card holder).</li>
                                        <li>Currently lawfully residing in the US with valid employment authorization to act as an independent contractor.</li>
                                    </ol>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='Moderated Chat Session';document.frmInquire.To.value='development@topcoder.com';document.frmInquire.submit();" CLASS="statText"><b>Click here to inquire &gt;&gt;</b></a>-->
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

