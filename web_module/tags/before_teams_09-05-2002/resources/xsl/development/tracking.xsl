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
                                        <b>Request Tracking System Project</b>
                                    <BR/>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='request';document.frmInquire.To.value='service@topcoder.com';document.frmInquire.submit();"><b>Click here to inquire &gt;&gt;</b></a>-->
                                    <BR/>
                                    <BR/>
                                    <b>Description</b>
                                    <BR/>
                                    <BR/>            
TopCoder currently does not have the ability to track all requests coming into the competition server software.  Although each request gets processed it does not get stored in any location where TopCoder staff can do any relevant reporting.  The tracking of specific requests will be very powerful for TopCoder's sponsorship program.  TopCoder wants the ability to report on usage patterns within the arena.  Upon successful completion of this project will have the ability to report all relevant activity that transpired during Single Round Matches as well as normal day-to-day activity.  There will a total of 2 developers assigned to the Request Tracking Project
<BR/>
                                    <BR/>
                                    <b>Payment</b>
                                    <BR/>
                                    <BR/>
TopCoder will compensate all team members for their work on the Request Tracking Systems Project. 

Each development member will get paid a total $1,800.00 
<ul>
                                        <li>$180.00 at the start of the project </li>
                                        <li>$900.00 at the completion of the second milestone </li>
                                        <li>$720.00 at the completion of the project* </li>
                                    </ul>

*Completion of the project is defined as follows: 
<ul>
                                        <li>All tasks assigned by the project manager have been completed.</li>
                                        <li>The deliverables are functioning properly and integrated within the other project software deliverables.</li>
                                        <li>The project manager has signed off on all delivered components.</li>
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
The project will begin on the 19th of February. There will be a Kick-Off conference call to address the following: introduction of all team members, design considerations for the new systems, specific time lines, deliverables, development, and any outstanding issues.  The Request Tracking project is scheduled to be completed by March 11th. The March 11th deadline entails integration of the developed components with one another, along with system testing.
<ul>
                                        <li>Project Start Date:    February 19th, 2002</li>
                                        <li>Project End Date:      March 11th, 2002</li>
                                    </ul>
                                    <b>System Specifications</b>
                                    <BR/>
                                    <BR/>            
The request tracking system will have multiple facets to it.  The first will be the Request parsing on the competition server side.  The parsing of the requests will entail retrieving requests from the main server software and storing them in an RDBMS.  The second piece will be comprised of reading the data from the Transactional RDBMS and storing them into a Data Warehouse.  One developer will be responsible for the Request Tracking and Parsing, while the other developer will be responsible for the Request Data Transformation.
<ul>
                                        <li>
                                            <b>Request Tracking</b>
                                            <BR/>
Only 10 out of the 27 requests coming into system will be logged into the tracking system.  Currently a request gets generated by the client and sent to the listener server. That request will get handled by a request handler and sent to a request processor.  Here the request processor will deconstruct the request object, determine the request type and pass the request object to the Processor.  The Processor is where the interfaces to the core business logic reside.  The Processor will be the area that we expand to enable the tracking and logging of the specified requests.  Once the processor performs the necessary business related task relevant to the request it will also send the request to new request tracking specific custom queue.  A new tracking process will be implemented that reads the queue and constructs a new tracking object that will get passed to a new EJB that will store the relevant portions in a Relational Database.
    <ul>
                                                <li>
                                                    <b>Processor</b>
                                                    <BR/>
        When the processor has completed the relevant processing it will place the given request onto a custom queue.
      </li>
                                                <li>
                                                    <b>Queue</b>
                                                    <BR/>
        A new custom tracking queue will be implemented to contain all of the requests passed from the Processor.
      </li>
                                                <li>
                                                    <b>Request Tracking Thread</b>
                                                    <BR/>
        A new separate thread will be running that will take all given messages (requests) from the newly designed queue and construct a new object of type Tracking that will be passed to an EJB for storage into the relational Database.
      </li>
                                                <li>
                                                    <b>Tracking Object</b>
                                                    <BR/>
        The object that will contain all of the request relevant information.
      </li>
                                                <li>
                                                    <b>Request Tracking EJB</b>
                                                    <BR/>
        A new EJB that will take the Tracking object and store all of the information into the transactional database.
      </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <b>Request Transformation</b>
                                            <BR/>
    All of the request information stored in the transactional tracking system will need to get reported to a Data Warehouse.  While the data is getting moved from the transactional database to the data warehouse it will have to undergo some data transformation to allow for reporting
    <ul>
                                                <li>
                                                    <b>Warehouse Load Utility</b>
                                                    <BR/>
        The Loader Utility will be a java processes that will retrieve all relevant data from the transactional RDBMS and store the data in a Data Warehouse.
      </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <!--<a href="Javascript:document.frmInquire.Project.value='request';document.frmInquire.To.value='service@topcoder.com';document.frmInquire.submit();"><b>Click here to inquire &gt;&gt;</b></a>-->

					
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

